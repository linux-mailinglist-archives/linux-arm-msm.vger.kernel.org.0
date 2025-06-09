Return-Path: <linux-arm-msm+bounces-60641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A25AD1E73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 15:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 814D41616D5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 13:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA4B13CF9C;
	Mon,  9 Jun 2025 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lB9G+JBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B612EC148
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474328; cv=none; b=Edoxhdz9zT+TbPWRQPfYFofr2tADB5HglduMpWsjgoMFhkIcg6FQ0OZ3zFeZt3zBbeSZEExtrnS1xmhRN3jJvNKwyNin/fQOSdNXHPtmD8c35njFqy5vEs38+3RDpU2F2ckFms6zxuIQO0xq0Mhyhe97R8C7/PD9refD/GwHKUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474328; c=relaxed/simple;
	bh=CyTywWegk+0yor0slgZnZWbPyKHGyckBx4eKm0eWBMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KN0GXRnxEMCs89YISiii9lQ1p/BALzNETR8vl0G9C+KSPwM+AuoHp9QFo58IY2as/Ua+6cLoRmJY8y4nHFTau9IakFE9jVyJp0CTW+KIupTzXJLiSX+O0RI3LJoL2ODtshes1SqcxEEbJ3tA2OuwtUX6ecaNii3uaN9C7ofrT64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lB9G+JBK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598P07o003426
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 13:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7xkCVUQwqf7RIq+KwaSJ+GbN
	K/6py51WB61ukwc4n9A=; b=lB9G+JBKRDqQx8/SLtb4+Vz7y3LWXBALFUokCXRv
	xS/ojDQormalUxO0F4XVKuNJmUoq9rvSs+FWv9pyvi9HGOqWsxGRwV88uBLUrU7/
	sxQMHQAXnpd3mxwX/dhFDvbXsqIBqhBGyUwFIvZa/NG0sbfwlKoRqAuecZrsN1gI
	fwndSjbJ6dB8Z8ki2f8eCrq5w43xkD169DvvNa7UNELhvIKTJB5X8AXQtxmlvY1e
	rY62E8pYP9TPwZhNjrcb8eQCMO4dy87P5NbpBCK+IoOXlgWPSp4xyagneNSt/wmL
	Rn3H8BeM2S7uPpPByEbd3424okOCtiWwwrIVw/28PjrPqw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y0ty5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 13:05:25 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-87ee2573c92so566371241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 06:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474324; x=1750079124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xkCVUQwqf7RIq+KwaSJ+GbNK/6py51WB61ukwc4n9A=;
        b=od9ex+m8hip9DmsGKaY/UEG+nLN/CVG4xBsAq2sqoVras9FvzuvXsrhF+BTVYBUfob
         I0qWuoidd68YdGBwwpINePArJRmzRolPsPHSZ/wBfJPxIDWPp0X6+n2ns8Z0FrKDhNCV
         KvcU9pNOhMVQ0+01/isHc7w9Tt8RKawpzUWj5Z/lL9lCsHhYTxiZME7AH9ILJshm8X2U
         5mDzjXw89DMQeDFtv+tlQSG7yUfJMXDWhr+sHdz3mTJT+T1XGR17y9UhIE+GlJyqouN9
         b4FgLp9WNiAW4OrR1rZgFG8p/CL6WF5c4dy+9XDt60xTBESb0gAKiDaprMPB/D0TUP9O
         wsog==
X-Forwarded-Encrypted: i=1; AJvYcCUGgZN3PARG0H0gkleGYsBy59plCI09yax+5xnMaiL3ab2lHv9Mwox4u60quCoDy8O3GPkKsxByZ8eCTiHr@vger.kernel.org
X-Gm-Message-State: AOJu0YzK5D+LVAw02L7332taVJe3BZUCyahkDm/EROaEMzeJezc1Xq/P
	oZ/orB+lUg5bXwMZV6C90jyLfxOQhZmf04gtWQTAPyQRbeCT7rHtGu8GedlHsWa3l+Zuq65eyO+
	/nmAbY3ujoA/IPmuBNKIakhAQhJGixaW+uJt+CVFYLcjBdbyBvdh9V9sdK8a0PlemaBT93bTPrT
	Um
X-Gm-Gg: ASbGncshmJytnsTK652qZr/QDV7beaPfcwRb1cuYP2v7+tEE3OuRdTP0MOMK2IYhcaq
	7HzfFIqp/MjBQ8ncenDuHXSTp03f8x6L9jkKnNk9ZboWoRQbXII7z9vuw8o243u86Rkb3Jmtups
	s35w6eIlBczzT0wsGgUddoCHF/ZKJRJtT+LRzKpxGPTNLS9rapO/KX+soCKjMaRX+p126L7ED9L
	l1g1234XL6TJ6NzZFJb0TKIAVoy0dki1Z3CQzIJFKhVvsEQkllSVUemTAjvymoLuZ2O05WniJev
	bIy2v2FBjgaRVKP2kFD1aoNxAFQZ7sY6eA2wdKfFs+De5RLuE5R3/Q18kOz1xi6vHCcSU3G9oXu
	5uR9Mah6XDw==
X-Received: by 2002:a05:6102:5f07:b0:4e7:3e76:cd21 with SMTP id ada2fe7eead31-4e772967fb4mr12013498137.9.1749474323729;
        Mon, 09 Jun 2025 06:05:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEanFjvz+Pab/BnSn6wIWlNME2jCR2jQzVdPVbp6lEZBUiSoLG6wPdevQH+wVkpMZKGh9CrVw==
X-Received: by 2002:a05:6e02:1a2d:b0:3dc:7c44:cff9 with SMTP id e9e14a558f8ab-3ddce494e22mr142829055ab.8.1749474310150;
        Mon, 09 Jun 2025 06:05:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a429sm1139330e87.147.2025.06.09.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:05:07 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:05:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 04/38] drm/msm/dp: re-arrange dp_display_disable()
 into functional parts
Message-ID: <ikvsacoatahnmjff4c762cpq6lvmr6cavlbjw6z7oyrvuno5hp@mykq3ts2hhbw>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-4-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-4-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NSBTYWx0ZWRfX8gYaLnDAhCBI
 ckbhlms50mWPO6jQm+MYMYBrR/1vHRDGX/sp+8sOu6snKrD5D2GTsJjMX5iBExcnwo6dZ8LT+Op
 ZmW2uTE6wvAUdc6Nv9xgzcvyx1oDMo5D8Pl5kBdWE/dRyJ/qc6KfVOjU2PaGOw8KIxsDxIYeTOQ
 M4ob864a82FVaejr15zgqzd49B3XW4e99aO8e4cSZNqYHmDtc+4uB089HFkhXog2c9YEV4jWp4O
 a9XVheVQR3D/gwOtHPAV74gGthe1925+kNnsV4jgqhVQI6PcviguMj6TLK+tD635ZaDyhEadJTo
 vIb01Y2Fbti2yUAGMMUUJ4JQSGo7RqnHQxhQL7V6T0KIjqmACQCvFRzfTwzjsyg0Vxw3g109zWQ
 S+0mnI/UY3ipQRcAKeHpLST8IT3Re+6MLhb/pJlwaV1IGalPow3fy9FXYMbR4gB3frAjNzVT
X-Proofpoint-GUID: VBVaw27aHhdl3_vR1zbuWUZH3F9bcr0q
X-Proofpoint-ORIG-GUID: VBVaw27aHhdl3_vR1zbuWUZH3F9bcr0q
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846dc15 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=yxpq3E9kyWjuSYLohSwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090095

On Mon, Jun 09, 2025 at 08:21:23PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_disable() handles special case of when monitor is
> disconnected from the dongle while the dongle stays connected
> thereby needing a separate function dp_ctrl_off_link_stream()
> for this. However with a slight rework this can still be handled
> by keeping common paths same for regular and special case.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++---------
>  3 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 1e13ca81b0155a37a4ed7a2e83c918293d703a37..1ce3cca121d0c56b493e282c76eb9202371564cf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2081,30 +2081,31 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  	return ret;
>  }
>  
> -void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
> -	struct phy *phy;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> -	phy = ctrl->phy;
> -
>  	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> +}
>  
> -	/* set dongle to D3 (power off) mode */
> -	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
> +void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl)

I'm not a fan of (almost) one-line wrappers.

> +{
> +	struct msm_dp_ctrl_private *ctrl;
>  
> -	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> -	if (ctrl->stream_clks_on) {
> -		clk_disable_unprepare(ctrl->pixel_clk);
> -		ctrl->stream_clks_on = false;
> -	}
> +	/* set dongle to D3 (power off) mode */
> +	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
> +}
>  
> -	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> +void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +	struct phy *phy;
>  
> -	phy_power_off(phy);
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +	phy = ctrl->phy;
>  
>  	/* aux channel down, reinit phy */
>  	phy_exit(phy);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 42745c912adbad7221c78f5cecefa730bfda1e75..edbe5766db74c4e4179141d895f9cb85e514f29b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -20,7 +20,6 @@ struct phy;
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
> -void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
> @@ -42,4 +41,8 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
>  
> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
> +
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5ac5dcf35b789f2bda052a2c17aae20aa48d8e18..a5ca498cb970d0c6a4095b0b7fc6269c2dc3ad31 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -925,17 +925,15 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	if (!msm_dp_display->power_on)
>  		return 0;
>  
> +	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl);
> +
> +	/* dongle is still connected but sinks are disconnected */
>  	if (dp->link->sink_count == 0) {
> -		/*
> -		 * irq_hpd with sink_count = 0
> -		 * hdmi unplugged out of dongle
> -		 */
> -		msm_dp_ctrl_off_link_stream(dp->ctrl);
> +		msm_dp_ctrl_psm_config(dp->ctrl);
> +		msm_dp_ctrl_off(dp->ctrl);
> +		/* re-init the PHY so that we can listen to Dongle disconnect */
> +		msm_dp_ctrl_reinit_phy(dp->ctrl);
>  	} else {
> -		/*
> -		 * unplugged interrupt
> -		 * dongle unplugged out of DUT
> -		 */
>  		msm_dp_ctrl_off(dp->ctrl);
>  		msm_dp_display_host_phy_exit(dp);
>  	}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

