Return-Path: <linux-arm-msm+bounces-107318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBuTHamCBGrVKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:54:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC614534725
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71EE033CF014
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167B9315793;
	Wed, 13 May 2026 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ST+bNA2j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9GADZUS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A549F2D1914
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678909; cv=none; b=MIBr4P0RZtelhVhdEWd4OT/IUxqcHl2NaTtoABES1eA9mPt+RkApVKms+bseP3lenJ2YlhArj2s2gLmIDHj+VmB8RlxTOWi+O57HceC7det9TV9QQIjCEipkOg/yBy+M4j4C96y6XBmAsKAfK90a68iGPCj/zWRdbJaXx2X0LvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678909; c=relaxed/simple;
	bh=HX08ZJEBL7yST5VWPLssG9CxF7kIs+vNniAo2Yn4r5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1t2A9GN1ewOIEH4r64AhflX/jjHBowS8bs2PcpNFR5Nn7olvhTNq6IZD5fG8ggcaqEKO4X7Js8/WQ01ZAE/OvlHVczgbTaCQCDYsPt2Ox2biRdOkUJdU1NsQksZEa7HOp+ef0Gd4FI+VqbjLoD3K0j5ekzCyMC+vyqtYvv1l9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ST+bNA2j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9GADZUS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBYZVb3324660
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AFxNdVHWMzpghmBXs03WQEOs
	xxoCzZKFXvjRC5q0MAw=; b=ST+bNA2jVi/xhlG0SedFvO+P9Dtw7ut1XfAvGvdD
	r96ild2g809cZchhKiwfolSiEp0TfztWcnD5HRdCLPnhiBGh0wWibjpnt7kfrf2L
	NC+5VoesacJJR02Ll6Syr3BNXYNgvgo19URCyE+l/DR8IfQNrW/S5Xrr42HQGkXw
	ot0dFLWwrG0NGnxaO9xExuBQb6DYQ0y+NPQiqsTUeHxJek/0Y0bjTH+gCTft6uEC
	6BbfSjnBuUHQvuG0NRyMDegwc0SJkCdN3hlzqGXYyf8ZaVIIc8Al1a6pHx8QV2uw
	9iFO2k2a2nqYtxs5efGG7Inx6f0RjdeKhTm8ZhVVziyasA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9mat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:28:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6329c1a6710so2274865137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778678905; x=1779283705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AFxNdVHWMzpghmBXs03WQEOsxxoCzZKFXvjRC5q0MAw=;
        b=a9GADZUSGsEKIyAbC5vqx6SZJzZA4929pJhn4suX2iqMDiagG1dKJQ3GSq8cTcVdmZ
         W2kDiQC5P4pWR8dVXOmroaYAIAN59/WjHdUK8Js6rCtt2jzr4og3yN9Qna98FlZiFvZR
         o7nDyLBaUlraumw3aPgmk9vpYvgi51lFF+uVyjVSeR7oIj2fhJS+IdCV8z7YJCbQMXpm
         oacOYQEy/0UDPjXnOU6gHCq9kTdChmrhsA6WTD2j5cVh9qHhay/WlrlHdiSktjTgMlV7
         KVEDsRPKxDfKwxtbZqVUAPuTJigwliOgvVEAC2+pHJnw1C6SRmup6Nr9D3+AyBOjokvX
         u+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678905; x=1779283705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFxNdVHWMzpghmBXs03WQEOsxxoCzZKFXvjRC5q0MAw=;
        b=K72wtSRbhkEduyPlAeFNclrk+mOSAW2dDvJksjjnskCaf2yD8MWCFkzyz2MXYHZ4Lh
         Mxm+XsRx9k7eiKLOqYl+rO3aZrX+p247SFunWuWUZL0dRiUSNgNTIURKLOD+KfjGrxt2
         x1nJtkmlTpotW/H7oed9vvZLA3XLqgQe5LJbbpOLLgeUlodUWizalXKjSGZVCWa1bZj3
         11JTpQuN+297CtT41xb3TY3c+iZll54TeigPFD4iD/M+2sLYRJcU10WqbTi7wpIVP6PV
         iaq4r1Ac0lRD+zkw7Zvclhh0e1bPjTDBQpjaVQU7Kqhzp5YXR+c+i8hGhQToCj2welDZ
         +CCg==
X-Forwarded-Encrypted: i=1; AFNElJ+3iZgQ9tH39IVUNrbo27dRLh5Y4yfAtJwtX/K3KULi2rFzoAAUK6pc8QjA9IIumNYVLKSoXIdb/elqilGX@vger.kernel.org
X-Gm-Message-State: AOJu0YznGICfxzKRqohSmmy1i3XAx1QnSa/J5mEir52HdSaCaGQJCxe8
	72azPOp1gxgcdPeOPOyu0HHPqoCIC5EhsCTuv5NtoO2oDlXiMXno46dvqK0Y0tSnxU9Q68Jg42N
	Fhi7vtxVyQqPyTVIXiJoeuZKWaxBa6KbI8qe8GlilSqW8K7PuB7nhw3HqiR3FYbtR+YWY
X-Gm-Gg: Acq92OERFVWDeHlkAJq7WroEp0UA4sZKa4cPBMZk/zU+CbbQWsvnGlof4REMhbTZpzA
	LfPCotxsuYiLQsoO/rNojnG1DyC0IWL71JvtcRxPDY7kjDpQGm5ESKnc3jgo4kXNCRF04ZL2rzh
	/HPSCgVO10ncWHSIMSXzsxEb3saZqW4KCuIXxc+Q0F4LVFtQGiQiWCYMGo7tJki5dM1KBiaucla
	Yk/IuylEYb4VPCIBBSKbwafxqQr+Oy2lVJMJgAWosIQNdc1f4TGOkJzxvbGAolMpxUHCwWqKQ7J
	R+ocKxjvsjQXognLirNe0dicjbsxcXSRP82OrZ23AARz/7QOfglUatJNO5FcWSImtbiqGEm/0kh
	QNHj89Sk0OtYTtwsSzxa25MVbwOjmrneL2TPQtfuz8xIx+npDqO0Q/31D0xWm4w+ZCdqaZfIS9i
	fEStXnEhj7q1Ji6/CtU+8BY5m0MEbWSC3K6AY=
X-Received: by 2002:a05:6102:5a95:b0:634:16ce:aa3b with SMTP id ada2fe7eead31-637742471fcmr1355822137.15.1778678905452;
        Wed, 13 May 2026 06:28:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5a95:b0:634:16ce:aa3b with SMTP id ada2fe7eead31-637742471fcmr1355799137.15.1778678904955;
        Wed, 13 May 2026 06:28:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95661e0sm4037162e87.67.2026.05.13.06.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:28:23 -0700 (PDT)
Date: Wed, 13 May 2026 16:28:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Skip push_idle in atomic_disable if display
 is not powered on
Message-ID: <mnpara7zwt6ahqkb44mxjtengjodutek35dzax72xuf5i4puzd@tvxhgefvpdqk>
References: <20260511-edp_suspend-v1-1-128555968d7c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-edp_suspend-v1-1-128555968d7c@oss.qualcomm.com>
X-Proofpoint-GUID: jMSntYcJW2PBMJitkG4i_PXjVQkncxFK
X-Proofpoint-ORIG-GUID: jMSntYcJW2PBMJitkG4i_PXjVQkncxFK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzOCBTYWx0ZWRfX53SPvcjxuyBV
 mtWze/UreXrSwc2fKwAtX+Et82UTpnE6eHNjqQDxnb5/OVrJqY9CKMKktjLIKpwcxyzOQ5zwGl/
 W495fwNVqQPo2hzKILAykVHsBhiMXyJms1wXs3xQrWzWWVtNMrQlzrbV+4Wt1atUbSRwIUPcFXN
 ikcO/V5KRfh3zebWPV/A9AYF74UtcaLIJK91vL7HzMAHT2Y4oy4G4CQG6ZEi2o2ObtJ2CTbgDcE
 Yf80x0JB3EOkeCC1hcICU+4YM1K/w+tmJA9A0FxsUjcutb7yCHi2gVDCHsTb/rW5Zp4T3fUldsh
 w6cMPn71Qwv8GaTOlgx8myqCHtXaFJuLmJQ3USll7xl2hTYNmJWh9YOO4Up5sAlZPVU69JHLt9m
 zM0Cos4rj/FCAInfSYub0QrVEKqxOnXoDIz+vmeU7vlPxaz/YMlzNsChLlDb6+ePRc17C0lWhQS
 FstuAQEVsCOn7rr6UxQ==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a047c7a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=E4-49owyH1uc_qQ72ZoA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130138
X-Rspamd-Queue-Id: EC614534725
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107318-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,chromium.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 04:36:03PM +0800, Yongxing Mou wrote:
> On eDP interfaces with no panel connected, panel-simple-dp-aux fails to
> read DPCD over AUX during probe, leaving hpd_state at ST_DISCONNECTED.
> msm_dp_bridge_atomic_enable() exits early as a result, so

Why is atomic_enable() called for disconnected bridge?

> msm_dp_display_enable() is never called and power_on remains false with
> link clocks never enabled.
> 
> During system suspend, drm_atomic_helper_suspend() still invokes
> atomic_disable() for all registered bridges. The resulting write to
> REG_DP_STATE_CTRL against an unpowered controller triggers a NoC slave
> error, causing a fatal crash.
> 
> Guard push_idle with a power_on check to skip the register access when the
> display was never enabled.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

Fixes?

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1b3cbf4016ef..51b60eb9c2df 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1660,6 +1660,13 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
> +	/*
> +	 * push_idle accesses link registers which require link clocks to be on.
> +	 * Skip if the display was never powered on (e.g. eDP with no panel).
> +	 */
> +	if (!dp->power_on)
> +		return;
> +
>  	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>  }
>  
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260511-edp_suspend-0e45d0110633
> 
> Best regards,
> -- 
> Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

