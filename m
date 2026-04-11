Return-Path: <linux-arm-msm+bounces-102803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5R6vJ3SG2mkk3ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:35:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 038CC3E1115
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45155301F9A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EDD3B774F;
	Sat, 11 Apr 2026 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFPTL1ei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDY3Rw94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D034285CA4
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775928893; cv=none; b=RAlkIEdATaX5/yqJfLyhbEB5Ml/FFT6tD+OFxiiU+unm3FfcXtU9Ay+sdjrdgdk65Cp9/8qsycH13ZbvXPSFf2AEaPvdkgXn3ShBxaSeSGywwOhlELm1OmMCy/Xi6MD3W/DMKrF4AYwWU14XEir9GmbLIB1OYgwxRq+m2ErXPK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775928893; c=relaxed/simple;
	bh=FOevIYpJ2j1q8rVGkBNKRuwObw/orDjvmPqm0uSgzso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRjvGNdaChBfBAgE91v39pGXwz1+CQde1uH0aN2D+wCo0r73Htw7AkVqPs9DeVCKPn3seMdLDvXf4JoHCr81NEYrY8SOsu6wSMrrffwqTSHzXhGJb4bryhk40VOkESPIBoyqhjtDma1hvlYT+TGacnZkV7fjsJcwwEMasRtCqZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFPTL1ei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDY3Rw94; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4eQCO3875596
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Njx8/fv7Km3RsqCz552LOpr
	aHFxUNpjkpMwbhw0bmo=; b=aFPTL1einZDvazwJd5nJLpTWoyNW11KNet5H2lBN
	2sUMo8FAkoGWwia0XPOveF8YnzfqIn0MX1U/XeQk0tVr/ur2O5O8nQATzJ+QWG5F
	4Gh9LG1TWi1m1+ATg45ihK2w6EnYcevlVmgRqnjpOVuC9Y4t2JsOXYUOFFyVFbyF
	SP+FeehycvxAzkNt3kXcAv4Q3AMdJBKVwagM+fByP+Psw8Q0GOKp4d7ooyPju7Jg
	WxCI/v8gT8KebS6/Wl333Dt66Wb2Ov5hc78tvbZJj3/0ZGC2njqP4T8v6eevzgz6
	fn3Ibsaj0YPqQe81ddfFULobqdGcbrktaH0ExVLLMKm29g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhs2x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:34:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso81603931cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775928891; x=1776533691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Njx8/fv7Km3RsqCz552LOpraHFxUNpjkpMwbhw0bmo=;
        b=SDY3Rw94W2Y1iQ2aYzkUu8Vj36KWO54kSHHBiRekMAXIxu4wNO55pKovDooJFu6wvA
         IQc/8O67x9f6tw5vrqFZSIVZ6532p2BUFkcPWFJJdxe9zqo+F5DoBXsr7GmhchzGx6x+
         Jc43kaMO0ZEsqwcKKFT8g31D0ToAerhETF0Clyxg9A9bKHx84J+dYPge2vUmXwX4nM7t
         PxAh1wAgd0xKLdPr4K21kYKVZnTjjUGBbMiwVcUdsBL1i7D8YGQRyjYq7RS52LHtK3bQ
         OI685kiQLPyY6WpZPicA2iJ91zQF/dAir1qHFFwy2Peo1W9hIJ/FgCZRBH2GPBYwZmjp
         EfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775928891; x=1776533691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Njx8/fv7Km3RsqCz552LOpraHFxUNpjkpMwbhw0bmo=;
        b=HdilwYHgdN1LWz+3F1Zp7zEktHGgYBrTn1mhtLdJD68SlUMcRei4DPOUu0QCCA8p7V
         TWFnKFqtCar9LqYNDZSvxUh5t1fVtXZJXKkxG4O5HMeZUjX+G5ElfMkyQnqo2yGn3tqQ
         x7DroeqerqeNSIIShkW+44tgI1StziPaSfn0o2MsACttG3v+LvTOR5aWE6SA7VdYWaDG
         JtPWrp4r+lapLidRMw3VKJ2lCEwJg04I5VOep12N8QRJJnFuPaDMwaKc/1GghM2XU3Av
         ujQMEXLTPt+NVi0dPxrcKvtg54CJo3mk6Y7SbDZPAmNH0U0JwmAHnUGIGJq0gp07CdRU
         g63Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4Wdg0FblMmP/GwhEDxJksfWbbsOy9YQ8ltjSJP772Q0JTFRbt37yc72OP/qQuNq8cMAQKAXzarzf7fhga@vger.kernel.org
X-Gm-Message-State: AOJu0YzKUje3zZnu6/w4N0s1Jtfo5Gvf+BDheWgIOIwB2EI4ygOde500
	SX9zLGqkRrHBanB+kaEdaHMtUkJLYx+JHPPRYDR0AbqQFBctZRCvnerE7QF9cha4N91+f8Y0QVL
	ae3px+Nz1z1/0ytY+k9YCYmlA/0tq/v6NLHWX+O62pmnlzy61z7kdIHugL5SKfpyQq1ZG
X-Gm-Gg: AeBDievFW8kr6jas3k8C9uug6jFXW3lbUOjsIDEIDpGrdaBsmSm24SB1CRkDpuTypCF
	0YekrWzeeGctbXuhD7BddQwD4NpwlDNR03pGJ49lLZxcliru27xL44cTl0xtWrcJTfFM1XmKcQY
	oLlNxWuG3gGHW0wRVcTAo51lIa3TxHY9XYi8rTC4l0EWLOMcO5XCldCWnD6hH/q8c4SKM3Q3uQv
	TL4Cc/BcQ1NwkIZzeQUeDOhSMgnWSKCfHQ0p3EFW7dLKMjanDvZh30Rc7BxO23QL4qwUBFZ5ADN
	uEil0fwxvUtwTtVyrekpW9+HQ2o5RnMV/orxvUmV0JXnVHsd7A+5npPigYPHwFP1iOtA9wkxfwB
	qlcUvCPQ+uZpRaGL+yMMHYZJT9QB9om+o5vVLt+QXicQ14Sn1GVMKsCErxUqISWoBFACWE/uG9v
	+U/L8Wb897T4vFG+nSfl/lVvt/CbZ4Z3JkeyU=
X-Received: by 2002:ac8:7fcf:0:b0:50d:a8f5:d519 with SMTP id d75a77b69052e-50dd5b608d0mr117468021cf.14.1775928890708;
        Sat, 11 Apr 2026 10:34:50 -0700 (PDT)
X-Received: by 2002:ac8:7fcf:0:b0:50d:a8f5:d519 with SMTP id d75a77b69052e-50dd5b608d0mr117467771cf.14.1775928890304;
        Sat, 11 Apr 2026 10:34:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee11f6sm1524462e87.44.2026.04.11.10.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:34:49 -0700 (PDT)
Date: Sat, 11 Apr 2026 20:34:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/39] drm/msm/dp: splite msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
Message-ID: <omw63f7fbqiuw2t266dq5drk7rz2kohydpvbbhcrbfiehb7lzh@aucqhfaliams>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-5-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-5-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE1NCBTYWx0ZWRfX2EUL65LzdqQz
 SyTMuXOAyHvIuQjhsAya9uHv2UzZzaXHE0+VNmfAODkgZj+q1L9O0dV32zexsUSOMpDArB0bhVm
 sspoLFfxSPgBsa7/SqoimwxDAlzPtQCgh8tdhcyiiLM+8gCUYxtoAQETX8LJ6dyYg7COZYumDW6
 W/0FofEhDvTdBfhoEsEbbHoZZWLGiLQxssFORNcz3coHSnog49/3bKc8gR8XGka6BUvQ0aUBKV9
 eLCjUF2tKJAdCNkwHi3HAZ3RHXRo5Zh919Pij1w76guvgsWxYxCsXvPwyy26CPgxqQ2i+QURM50
 LOwUMDfS0kvJ45Zyd3QRLO5S9PeFwqE04P2jV7bHHCNmfF1TpTpvSHFrR8/I6nLSpQUpLqxrExN
 kMS/MyitrEz4LQjBh3wmoOO3GExgTkq9gtTdaz8j52JEe4zSF1+NUAOTLzjMiCwg+Q4D21P5NDR
 CPzOaxtWu30k+tMFL0A==
X-Proofpoint-ORIG-GUID: Yj3fjdOLKRSkIVlwJTlTZxQ-xMvm15wi
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69da863b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lIPaWChcOsILjI9_6t8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Yj3fjdOLKRSkIVlwJTlTZxQ-xMvm15wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110154
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102803-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 038CC3E1115
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:40PM +0800, Yongxing Mou wrote:
> The DP_CONFIGURATION_CTRL register contains both link-level and
> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
> all of them together. Separates the configuration into link parts and
> streams part for support MST.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 43 ++++++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 476346e3ac19..85315467b5d0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -388,26 +388,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>  	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>  }
>  
> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
> +static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
> +					    struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 config = 0, tbd;
> +
> +	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> +
> +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
> +		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> +
> +	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> +					      msm_dp_panel->msm_dp_mode.bpp);
> +
> +	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
> +
> +	if (msm_dp_panel->psr_cap.version)
> +		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
> +
> +	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);

You have an RMW cycle here. Please document what prevents it from racing
with the concurrent msm_dp_ctrl_config_ctrl_link().

> +}
> +
> +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
> +{
> +	u32 config = 0;
>  	const u8 *dpcd = ctrl->panel->dpcd;
>  
>  	/* Default-> LSCLK DIV: 1/4 LCLK  */
>  	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>  
> -	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> -		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> -
>  	/* Scrambler reset enable */
>  	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
>  		config |= DP_CONFIGURATION_CTRL_ASSR;
>  
> -	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> -			ctrl->panel->msm_dp_mode.bpp);
> -
> -	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
> -
>  	/* Num of Lanes */
>  	config |= ((ctrl->link->link_params.num_lanes - 1)
>  			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
> @@ -421,10 +436,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
>  	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
>  
> -	if (ctrl->panel->psr_cap.version)
> -		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> -
> -	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
> +	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
>  
>  	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>  }
> @@ -450,7 +462,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>  	msm_dp_ctrl_lane_mapping(ctrl);
>  	msm_dp_setup_peripheral_flush(ctrl);
>  
> -	msm_dp_ctrl_config_ctrl(ctrl);
> +	msm_dp_ctrl_config_ctrl_link(ctrl);
> +	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
>  
>  	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
>  	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
> @@ -1628,7 +1641,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>  	u8 assr;
>  	struct msm_dp_link_info link_info = {0};
>  
> -	msm_dp_ctrl_config_ctrl(ctrl);
> +	msm_dp_ctrl_config_ctrl_link(ctrl);
>  
>  	link_info.num_lanes = ctrl->link->link_params.num_lanes;
>  	link_info.rate = ctrl->link->link_params.rate;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

