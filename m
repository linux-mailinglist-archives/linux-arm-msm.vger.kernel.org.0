Return-Path: <linux-arm-msm+bounces-102809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DOLAf+L2mnd3ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:59:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 717443E12B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 004A6300A7E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A58B3BAD8C;
	Sat, 11 Apr 2026 17:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/hecqtI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjyvJKKO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B643B3B9D8B
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775930357; cv=none; b=o36LV2VrnVUzxmYW567rfBIVa6CltcssBfkFbhy6kKJrUw+IhF7tg8KYEBkbji2J2HoD2QxLLCu4zz2eL/jQdS42vT8wzylAh4nI8CkDEjDZgS7Q2O5XHHslP2dUfGBsDbS4nZQ+yG9glG8F8xeSCFwmp29D4eI8ssTbjtV0AlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775930357; c=relaxed/simple;
	bh=UHXewMtJbB2uUEPu5rDQn8pOPN70B3vwFa2aC2+ictA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNHD36T7etyfW0UrKhu/N4zjPtRJtfP1WYgUZ88vNb9q1bMJIEvb9OR3AwJhYe8nSBPjqb7wyRO5Mxjt+F9BId8qZmEoR2OF859rpsPZ4ZGz1AxD76pb4axpIRlANP4fvpuyQfHCOXkvtOB2PkXCo8vcihr+zVxLbTg0CPWjC1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/hecqtI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjyvJKKO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4lPTJ1836089
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qW70khYy2WNXiUNmnUcPyczZ
	0lMdb45il3ujjOXq68E=; b=L/hecqtIlYuP4E2gx46gyDCupz72cm0vlxvt51jk
	8Wq1pTP0PteCcAERXsN9Dr+6qImJ+moJW3cRSQjn75YeoO8wBLbFMNShled29VOJ
	pYTy4fIpLYcnHbzdPUcPg8jjnhGiFsZq2Qsxgt8UruM3hR5tZvd5YJ3FEyEk7T0s
	POKzSf2uoAv5NYjAUvSwObzvxJ2smTYtZFSROo8U5g99YpD4Xf1AN/iLUlIh3Q6U
	6cOxLGouH/uA6VF+Lr3bMWi4i02FIrIFQA85cU7HDP2LIoF86TQHVIGfI51R1fIq
	rYRtY0TAeU7VW+vQJYxxjQP3oL8lScFN+6oqNGT5ZJqp+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6h4qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:59:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d76f460b2so72310601cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775930353; x=1776535153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qW70khYy2WNXiUNmnUcPyczZ0lMdb45il3ujjOXq68E=;
        b=XjyvJKKOCrrXuc++fmfTsp72On/e4LTs0mcRH6wJa9jxYhp6xDNhMw6CRjSmVo58Dg
         G1R3FM1d4J0JUmlVh7gA7VN8+FSaupDb9hi2QeEn/7hAiE4wnT/0nf6HF29mLVcaYpNA
         fZ5XcPnVb6Ue69IO8bi5FCR8kK87uWoMt2WH89hFbOuauYELuYVKKjUBBbwmod5yaw/M
         5KzFBaSnrWWd4OQz58TtN9KHbZgUOqRGeqX+LE63EXXbrSAx69gNgYi3WX1gypNB2LPa
         0b/EEiO63kgoCdL//bqHkYzRDdqJ6+asme3LEmeq76sRr8U8EUKQW7p+MygLH0tq9zEY
         R78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775930353; x=1776535153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qW70khYy2WNXiUNmnUcPyczZ0lMdb45il3ujjOXq68E=;
        b=VlPw8mGessprzYeUfD/hpZacwdgRpafsQJsgDNmOpcMDUgY9E01u7VVi/SXM5LqCZ3
         RwzlT6pKRYJd97oezJWffWbIiCW7vNCmg406am7shaMPQKHJxYvz2pDPfOK0gUnsHyxy
         sXmaJGed4ipq08un/aX+gfZdwDeoRSWrlmhIpBfA2inJWpCOFK0AHiVhRjwt7k7u8bBL
         E/itpO03dBHP8jTDxUIfGM22atORPYrQTSjbtaJI4B5NJoivdqBdE88duQ1lsHVdczA4
         8M48vrjxMiY8REkoAWcUUH6+5Y672tpf5tfkiRmaHkpMlR92aiWC21fcguJO4uuzcSSJ
         TzWg==
X-Forwarded-Encrypted: i=1; AJvYcCV3TkT3Yp7f+iMTEcPPaBUCJ/BmpaZnkJ6kdflYE+VpoRp9vrGNaPr/+dUSa+q0Fn3lIAJ7fEGyCfDo9Rsv@vger.kernel.org
X-Gm-Message-State: AOJu0YxTyZ0/g5lWx77B1lDvvQhD0/M0doZqvN0t7lYdWBZ1NWQb/nd9
	qK+lY2QempSFJm1RiALK9PHmtlTS3VKiBmIIiIfci/DwCD55oNfVaJocs0lPZaau5EqMyDlflTp
	4tBipQB3swxykrzvABW1mMv3h5z4xF1wHNEPNekZNms7Yozabi0sVT7EaJNJ0KV8BQbkR
X-Gm-Gg: AeBDiesE71m5HdVrdfXLFgp4BDyAlfCaVoN3ARXTSUWrBFw8efBdqZYn3R+14CHS+k8
	HSzU/+BXpkUGgaFUkY2SKXawcvzI3KrA6K/QwwcDIaoJiW2EhZY59Uy8GR2opM0t+97xlgbFqpV
	0+wV2HGCkqXqVprb2ZJbRxC+q/tY43qwgFKSbNFFqOfQ7LH36Y56XUOBcDWhB5XJUQM3s88o5+R
	H8QYpTLhLs8r8JGsrLgw1jp+JEJYib4w874CL1jlzYDi0cL306+jEho6xOCS5H8DJ6+h1dXFWeZ
	BV9dKLu66+s0lyyzQ7ZlnLhkY/iqiURA+DniSgSkn2SaJ3ujIgrH/gik5TyDTamo8geXY2NZ2sY
	Ya+yX4rhJIJnfpxun2JYNp4tTyE2AUqAHhu+Aw2647lFtlyu4/UrmhV1omuf5kO2k+nLp/ZBBjW
	yvi2dyh/pu5QVJy/8qFR8hVxwSIxMHgFvKmzw=
X-Received: by 2002:a05:622a:488b:b0:509:14e2:89fb with SMTP id d75a77b69052e-50dd5b15ddemr114458161cf.7.1775930353535;
        Sat, 11 Apr 2026 10:59:13 -0700 (PDT)
X-Received: by 2002:a05:622a:488b:b0:509:14e2:89fb with SMTP id d75a77b69052e-50dd5b15ddemr114457891cf.7.1775930353128;
        Sat, 11 Apr 2026 10:59:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49298f1csm13098381fa.12.2026.04.11.10.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:59:11 -0700 (PDT)
Date: Sat, 11 Apr 2026 20:59:09 +0300
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
Subject: Re: [PATCH v4 14/39] drm/msm/dp: introduce max_streams for DP
 controller MST support
Message-ID: <s32w4u44y4jhuk4c4qxsytat2pdiskzuvbozklhofpjh54r7pc@2i6vvbaen2ur>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-14-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-14-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE1OSBTYWx0ZWRfX03VWmssIFo9G
 I87wdi7CBdGTfUacRZmk10JjNgL8DbgPPQ4IXeUo/CRb7Iumok16kUejRwbTgnWUSjeCPgcba3B
 3egIKqdu+Q8Kn7ckSNCtrECAhwiDcMSxExNtW0MaWpEeKi0gQODvNMqbvjp2At4w7oMA6BlhCpo
 k8grX6zwSRB6GFQDZrScPRWckN9e7kCBfK7KNFN1NcptanjnDFX+9q6+8wdMJzdTq0gD1+Q0nMO
 TygtHso9mPIUyJAWMDB1hmQgMENl6qNch8ogayR/ZINOYqjkl26tIOmZHSv1j4zUbr6+o2p4o+B
 TdhJMjRnWApzHmx61Gkl4/iPTRjp81UTkeUeT5O3pW22j4IiYxkHebwZs7wz7CeYK/BGqAxHKQT
 tLTShyTEDcRDG72iGy6x6IKiQE0JtyzwthDT1xsVfgbPlmYoVr5zjn1emHzbWTsc4VLCrgcmX2r
 ZgEub89Bs4nAHs89jvg==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69da8bf2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=BYW76SVRhHWKZf3cv-UA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yGQ6yUlppbWvOxFlgsAFX2DMPav1EH18
X-Proofpoint-ORIG-GUID: yGQ6yUlppbWvOxFlgsAFX2DMPav1EH18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110159
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102809-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 717443E12B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:49PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Introduce the `mst_streams` field in each DP controller descriptor to
> specify the number of supported MST streams. Most platforms support 2 or
> 4 MST streams, while platforms without MST support default to a single
> stream (`DEFAULT_STREAM_COUNT = 1`).

There is no such const anymore.

> 
> Also accounts for platforms with asymmetric stream support, e.g., DP0
> supporting 4 streams and DP1 supporting 2.

There is no need to mention it.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 20 +++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 ++
>  drivers/gpu/drm/msm/dp/dp_display.c | 20 +++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  4 files changed, 39 insertions(+), 4 deletions(-)
> 
> @@ -2740,7 +2741,8 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  	if (rc)
>  		return rc;
>  
> -	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
> +	ctrl->num_pixel_clks = 0;
> +	for (i = DP_STREAM_0; i < max_stream; i++) {

Why? I think the code was fine with getting up to DP_STREAM_MAX clocks.
In fact, I'd rather use that instead of the hardcoded value for
determining how many streams can be there. Think of the old DTs which
didn't have extra stream clocks. We still need to support those.

>  		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
>  
>  		if (i == 0 && IS_ERR(ctrl->pixel_clk[i]))
> @@ -2750,14 +2752,26 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  			DRM_DEBUG_DP("stream %d pixel clock not exist", i);
>  			break;
>  		}
> +
> +		ctrl->num_pixel_clks++;
>  	}
>  
>  	return 0;
>  }
>  
> @@ -1234,6 +1248,10 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>  	dp->msm_dp_display.is_edp =
>  		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>  	dp->hpd_isr_status = 0;
> +	dp->max_stream = 1;
> +
> +	if (desc->mst_streams > 1)
> +		dp->max_stream = desc->mst_streams;

Here you can assign it from the DT resources.

>  
>  	mutex_init(&dp->plugged_lock);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index a5c6ed5b18e4..b0cfdf215970 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -26,6 +26,7 @@ struct msm_dp {
>  	bool psr_supported;
>  };
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>  bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

