Return-Path: <linux-arm-msm+bounces-102812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKWJCiSP2mll3wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:12:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF0D3E13CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B743302D107
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7F12FD1AA;
	Sat, 11 Apr 2026 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlxj8q2o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ax11Q2ic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC732F9D98
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775931169; cv=none; b=YpDbVJGVYDLwPoFHyf5Aos1j6zbz6Wif3rfXZ275LJw1JTKjh50IVJo75aXCSJL7Yzz/Im5tVubZRHV9rxqu197cirtuuBj/Hytp3UhXY5CtcC23+LbVroDqI1a9pmvSsmCu2WsVzYbtAj7yWJbm7CrDBWduEtj89IHpab6oS5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775931169; c=relaxed/simple;
	bh=lqGkee0iwYWj5+rUMeLKIUj4KBrc1OsqG7f1uX0+QwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwhanp4ABdzf86iufIA+E+PJuO1olXXKb0toQwEAnU+XjPW0HI+V64aJhwbe1fMQeSkx0rycZiOZeICGrb8i44BHlsPs/oql/GViwlVvcC8nH/TyHTYZfD0ACKbEMni+kJF7ZEcty1UINK2fFz/SM1qAB8dDXGwZ+nI1BGWqlBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlxj8q2o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ax11Q2ic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4U0OG3679672
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d7aVOYHYRJajgd06oCHvRT4L
	JqIV7wS2v0f0jmElxR0=; b=hlxj8q2ocrspTGXO+M56HXcazzvniFOznVEBxlGp
	+8YtLpeD/R3+ab36rJ9A/zvHuo+eMy0z6D3DCza0m/osNMmgMB0h8Pvo9C5TtAcZ
	TZWy2X5zNIrWRx3mcZKlPoG1uD8fBMgdr2Xb2Qeh/ksRGsd0FbpRAwfeBcXxv2m3
	yIOndessMtyOPqY7t6sAk4jtwacKSFUyyFLzXSpwhzB7Llg2fWaZ0UDQ+Argdox0
	NrIXMS10eZVPEG7tKUPnsHv5LgioV9LpctXqlzs6VR/BiS4VCqNsm00YOT/IjdZc
	TY96ecacIvp+NxpMJOyIBHKiQM+cOU1RI0Z30iEO9IKeFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0h4xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:12:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d831e8083so30008251cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 11:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775931166; x=1776535966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7aVOYHYRJajgd06oCHvRT4LJqIV7wS2v0f0jmElxR0=;
        b=ax11Q2icES8poDMav2b80WtG4t4zHRsUh6+G68rhij0akZjCnNTdPLkq6+c/kMdbj1
         LoboxFveOFr1DZyIDBCOGPlT7CDlKzri4hLzlEWOTMP/6UnY/uprfeWsaNyas1YK7QS/
         ybkzAuo45XbT4nHZFgUDxIYn34+Y+FnmG0lVfZ2u9Kw29hprISuJ+nJOyWVyU6FAgx00
         EphYc9s/KDKqRVuh4Lc3zspk8SP2PSTFH6r0BLF7sw9zjE709rLLywyGX18n/r2B9MJm
         kopzgVFbKK1WoTctTSwFhP725lnWHMIqle1W2i0oT5yglDRBVpw0mkTYW/YnQ0Vk/txi
         k9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775931166; x=1776535966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7aVOYHYRJajgd06oCHvRT4LJqIV7wS2v0f0jmElxR0=;
        b=aB+L2YdUaXEXuOt5tP9/ML5KoGRg4uI+i0cTLQHms2QlSMDg0r9oL+hb1gol5/DajR
         EaUwwlHLz2lgjWAUyCYdpjwoifEaMP4RJcu7yQ58LvtwHNWIfXCuCfvU5fKrK4VU0aVa
         9mUFIosRGsSARDDWJB4nxLKwc5QXHXOtM2R5pWiuGbIcsDIDFaZWHUUeKPhJGyX3+Cfv
         4w57rOVk6eq+86pWqJpzrWuSa8TUTQsk9vRfXX6qDdTDXV6/pDr4H4jTIOxHc5H94i6y
         rXj3A0BdJpfDYykkuaBi5ymp+loheB6dadXiQRYYJWz/tCgYrYl9apqcHkB0WW351jQq
         cvKA==
X-Forwarded-Encrypted: i=1; AJvYcCVz+2w5AmsmOSSTW3524AN5DMKIZK9yO4n/qRkatRi7e41Z9mEisdRkk4D0DFpcBWdKgPkLMkmv8kaoSmb7@vger.kernel.org
X-Gm-Message-State: AOJu0YxVwsHHBn6ADdxuo5ZyLz8uZYL3FU4PyvEaU98YU6jbL2bSmnUP
	yKqKCwyDV+cZ52XO7IPPSa6zS/MN6zY3RVSd/3AzExjjt/1gYj+Dz+kD47hltzdgp2wEC+8JEII
	i8mPBTHH5h+j7Cr3021dWKjxzrOpQLCGmNVjsXKRxYXI93Up98iIxe04wgj2MlEYK6pCv
X-Gm-Gg: AeBDieuiaPuMoV2khY4S0QD0ES5zpJzLErB0iCBgRAANVtuRugvgou3noiFZkIq/U1D
	RxmKVNkG9jha9sihi5nxHb2TMMYmCGzQXM1K2ANZ0UJ2mcKMKFzIAqSF2N9HiX+OThxiG/N6Yi0
	sySXEz/HZ+cscFYBdLishvcr4oTTMAgl2dPLT+kf6m0Ca562QYlWEUR0lRR3SWPzAL2XoIuyIZQ
	MrV0elcqQ058qpYGYSchZf6XyGUiFkiEFYvG7WyJBysaykML1jk5/Z+I5Kbj1lUKxmjIR0cZhyV
	wu5DdT4QoYJ8+3rT4Yd0oAxgcm76KE6/y7dpt4HCOKbAnJTlf+gYz4oRy3OhXVcZcAS9WcNVziU
	X9k9eYEJVIJY9mvecXEIMMSQjWh7qlEz4EviGQLPvNiscGd8scj4jtJrs8n4IQzAFySWpHw0d+c
	kiuKLVmSoceRB+RbJ8aq3Bo7gwSlhsj5HO3qA=
X-Received: by 2002:ac8:590a:0:b0:50d:9073:f8e with SMTP id d75a77b69052e-50dd5b3f2f9mr125410261cf.26.1775931165544;
        Sat, 11 Apr 2026 11:12:45 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:50d:9073:f8e with SMTP id d75a77b69052e-50dd5b3f2f9mr125409851cf.26.1775931165020;
        Sat, 11 Apr 2026 11:12:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefbb10sm1549362e87.67.2026.04.11.11.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:12:43 -0700 (PDT)
Date: Sat, 11 Apr 2026 21:12:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 16/39] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Message-ID: <exhugtt2cf2zjvbing6p5q4ubyiealzj5ijcdrmmp2s45liz5q@7ccvl4euerkq>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-16-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-16-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69da8f1e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=szrjfyC7KoKo6QiwLCEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE2MSBTYWx0ZWRfX4DYEEL7Vt412
 YyGeHtIaOGWbo0ngyVZzxqotJczFo2zWcnZLFK5klTEmnuJmk3i3DvxVgM7UNzG1+0m0KxsM7FS
 +LR/jrJ+YUrzJSXJVMCLe9gqTO1TLzbhmpeCPKvlVDVmtksoKobWmtjX6qXnFT3lxOnP8U8kOHL
 P4st4cyPgHNgrMHk/jtV5+E3qT+8sGRq4vn+8BHU+toawIh72ge3dM66XXTkucjDtxBp3HGbu/I
 aIBoTqGpWZWLrKpx4BdorwdhbeSWrcHG9qYITHq4oQ0YTE3v4t2mPpFWHbPiC1AvalSrDiHjumK
 4UIrc8cwH9666ErhhWb0s43Rux9+f9159f5IWekIp82Do7QnPtLxEsfIYTgsy2ZSE4cll7+B+0D
 d0sM2he1ADeTDgmhmzRih9O9nTjy62xZHIUxJ14WZS6LCBizOivq3evta/mZ7Sn7Y9277uRgBDX
 esX53acijpTMH/go3aQ==
X-Proofpoint-ORIG-GUID: QoplLzNa5J_PZq_b3jsg3Xkla43SMiw4
X-Proofpoint-GUID: QoplLzNa5J_PZq_b3jsg3Xkla43SMiw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110161
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102812-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFF0D3E13CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:51PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Use the dp_panel's stream_id to adjust the offsets for stream 1 which will
> be used for MST in the dp_catalog.

Please start by describing the problem.

> Stream 1 share the same link clk with
> stream 0 with different reg offset. Also add additional register defines
> for stream 1.
> 
> Streams 2 and 3 are not covered here, as they use separate link clocks and
> require separate handling.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  | 24 ++++++++++---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 72 +++++++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_reg.h   | 11 ++++++
>  3 files changed, 81 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 1e80d6fc7bda..a52bcd9ea2a3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -393,6 +393,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  					    struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 config = 0, tbd;
> +	u32 reg_offset = 0;
>  
>  	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
>  
> @@ -409,7 +410,8 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  
>  	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>  
> -	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
> +		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;

Where is the actual write?

>  }
>  
>  static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
> @@ -460,12 +462,16 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  					   struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 colorimetry_cfg, test_bits_depth, misc_val;
> +	u32 reg_offset = 0;
>  
>  	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
>  							  msm_dp_panel->msm_dp_mode.bpp);
>  	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
>  
> -	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
> +		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
> +
> +	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset);

This quickly becomes unreadable. I'd rather have something like:

reg_addr = (stream == DP_STREAM_1) ? REG_DP1_MISC1_MISC0 : REG_DP_MISC1_MISC0;
misc_val = msm_dp_read_link(ctrl, reg_addr);


>  
>  	/* clear bpp bits */
>  	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
> @@ -475,7 +481,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
> -	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
> +	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
>  }
>  
>  static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
> @@ -2446,6 +2452,7 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>  }
>  
>  static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
> +			       struct msm_dp_panel *msm_dp_panel,
>  			       u32 rate, u32 stream_rate_khz,
>  			       bool is_ycbcr_420)
>  {
> @@ -2455,6 +2462,12 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  	u32 const link_rate_hbr2 = 540000;
>  	u32 const link_rate_hbr3 = 810000;
>  	unsigned long den, num;
> +	u32 mvid_reg_off = 0, nvid_reg_off = 0;
> +
> +	if (msm_dp_panel->stream_id == DP_STREAM_1) {
> +		mvid_reg_off = REG_DP1_SOFTWARE_MVID - REG_DP_SOFTWARE_MVID;
> +		nvid_reg_off = REG_DP1_SOFTWARE_NVID - REG_DP_SOFTWARE_NVID;
> +	}
>  
>  	switch (rate) {
>  	case link_rate_hbr3:
> @@ -2509,8 +2522,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  		nvid *= 3;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
> +	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
> +	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
>  }
>  
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
> @@ -2585,6 +2598,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
>  
>  	msm_dp_ctrl_config_msa(ctrl,
> +		msm_dp_panel,
>  		ctrl->link->link_params.rate,
>  		pixel_rate_orig,
>  		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index c17b87353d1a..6c88cc7e3037 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -447,27 +447,35 @@ static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct
>  	u32 header[2];
>  	u32 val;
>  	int i;
> +	u32 offset = 0;
> +
> +	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
> +		offset = MMSS_DP1_GENERIC0_0 - MMSS_DP_GENERIC0_0;
>  
>  	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
>  
> -	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0, header[0]);
> -	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1, header[1]);
> +	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0 + offset, header[0]);
> +	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1 + offset, header[1]);
>  
>  	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
>  		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
>  		       (vsc_sdp->db[i + 3] << 24));
> -		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i, val);
> +		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i + offset, val);
>  	}
>  }
>  
>  static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
>  {
>  	u32 hw_revision = panel->msm_dp_panel.hw_revision;
> +	u32 offset = 0;
> +
> +	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
> +		offset = MMSS_DP1_SDP_CFG3 - MMSS_DP_SDP_CFG3;
>  
>  	if (hw_revision >= DP_HW_VERSION_1_0 &&
>  	    hw_revision < DP_HW_VERSION_1_2) {
> -		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, UPDATE_SDP);
> -		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, 0x0);
> +		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, UPDATE_SDP);
> +		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, 0x0);
>  	}
>  }
>  
> @@ -476,16 +484,25 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
>  	struct msm_dp_panel_private *panel =
>  		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  	u32 cfg, cfg2, misc;
> +	u32 misc_reg_offset = 0;
> +	u32 sdp_cfg_offset = 0;
> +	u32 sdp_cfg2_offset = 0;
> +
> +	if (msm_dp_panel->stream_id == DP_STREAM_1) {
> +		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
> +		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
> +		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
> +	}
>  
> -	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
> -	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
> -	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
> +	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
> +	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
> +	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
>  
>  	cfg |= GEN0_SDP_EN;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
>  
>  	cfg2 |= GENERIC0_SDPSIZE_VALID;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
>  
>  	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
>  
> @@ -495,7 +512,7 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
>  	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
>  
>  	pr_debug("misc settings = 0x%x\n", misc);
> -	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
> +	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
>  
>  	msm_dp_panel_update_sdp(panel);
>  }
> @@ -505,16 +522,25 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
>  	struct msm_dp_panel_private *panel =
>  		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  	u32 cfg, cfg2, misc;
> +	u32 misc_reg_offset = 0;
> +	u32 sdp_cfg_offset = 0;
> +	u32 sdp_cfg2_offset = 0;
> +
> +	if (msm_dp_panel->stream_id == DP_STREAM_1) {
> +		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
> +		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
> +		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
> +	}
>  
> -	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
> -	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
> -	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
> +	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
> +	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
> +	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
>  
>  	cfg &= ~GEN0_SDP_EN;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
>  
>  	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
> +	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
>  
>  	/* switch back to MSA */
>  	misc &= ~DP_MISC1_VSC_SDP;
> @@ -522,7 +548,7 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
>  	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
>  
>  	pr_debug("misc settings = 0x%x\n", misc);
> -	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
> +	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
>  
>  	msm_dp_panel_update_sdp(panel);
>  }
> @@ -580,6 +606,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>  	u32 msm_dp_active;
>  	u32 total;
>  	u32 reg;
> +	u32 offset = 0;
>  
>  	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>  	drm_mode = &panel->msm_dp_panel.msm_dp_mode.drm_mode;
> @@ -594,6 +621,9 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>  		drm_mode->vsync_start - drm_mode->vdisplay,
>  		drm_mode->vsync_end - drm_mode->vsync_start);
>  
> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
> +		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
> +
>  	total_hor = drm_mode->htotal;
>  
>  	total_ver = drm_mode->vtotal;
> @@ -624,10 +654,10 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>  
>  	msm_dp_active = data;
>  
> -	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER, total);
> -	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
> -	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
> -	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
> +	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER + offset, total);
> +	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC  + offset, sync_start);
> +	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
> +	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER  + offset, msm_dp_active);
>  
>  	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
>  	if (wide_bus_en)
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 3689642b7fc0..295c1161e6b7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -332,6 +332,17 @@
>  #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
>  #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
>  
> +/* DP MST registers */

Which register spaces are they from? 

> +#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
> +#define REG_DP1_SOFTWARE_MVID			(0x00000414)
> +#define REG_DP1_SOFTWARE_NVID			(0x00000418)
> +#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
> +#define REG_DP1_MISC1_MISC0			(0x0000042C)
> +#define MMSS_DP1_GENERIC0_0			(0x00000490)
> +#define MMSS_DP1_SDP_CFG			(0x000004E0)
> +#define MMSS_DP1_SDP_CFG2			(0x000004E4)
> +#define MMSS_DP1_SDP_CFG3			(0x000004E8)
> +
>  #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
>  
>  #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

