Return-Path: <linux-arm-msm+bounces-109283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEMdBqBEEGrpVQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:57:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11C5B3585
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A609E303E0C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AECA3E9C1A;
	Fri, 22 May 2026 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzzeeHSC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f5AMtGto"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D883E9C38
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450433; cv=none; b=DCvu8ndnb55F2pNGDvp+SM9RtNY43GZJNxjCOXw1BIY5MFOk+gW224+d+SIvYekHwV+6FCEFfRO4mEVrkQ2pcXZLmYx0P8RFyyqsuowkspJg0cyibQioXaEN+FrFIPe3qXCevgvLXQHolN1XS1xqjyhbGD+86jwoNu0B4KZTedw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450433; c=relaxed/simple;
	bh=D1P+fFKB25lhSK1Xq9tBSMb24ACgdSEHpQI2Sd6qIgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dDhXl2rhHKBhzalCzFrGYiMX2vdtOzx84DB6ux2QAOre3SG2cgPHZy9LJ9kfusf1oyfMJmGkY1DUeApsu8X2cYNDfZAEMPjfr3wXNWDp/n86R41mmXHIvmRdaSjSUCSnDAVg/ByTjKvbKko9c05Px5tNQXgIpycr7BK40Vw3ZAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzzeeHSC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f5AMtGto; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4XZ63948272
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Vtic2scv0lNArrUhQhjpK+aneD52xMJ//xMO3IOSEU=; b=IzzeeHSC4ZyDPsaj
	v9yxiHOQXtKDaeU8EEnfLF1qlMN6hs2RK/7Fq8z0WhxYLDqKbGXd2UOmlmdwQat0
	Cl08ME+g17i5H7r4oemJsDm4MCtBQ0/IIFL9556mbLb9HuZD6B8LGUIX6CuNGel8
	Fpp/PBp0YeRKPBNeeMxKMaP1VpAfMUwRkoI18OcHFCTP8fM0Rq9O0cGOtvRMCzCh
	9B5NtATkkxxzhQgr3QD2dFSgcB75ttmSRyMKM9mo10G7GpcBQ21l9ratiBcEzYY8
	EDirxcr7zzYC5NSlOUsU3yca0zWcYzD+tn+7sljQ0v/qqh5LjwzbLDKr0jJzEhxs
	f00pjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngagm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:47:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faec938fcso17747541cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779450428; x=1780055228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Vtic2scv0lNArrUhQhjpK+aneD52xMJ//xMO3IOSEU=;
        b=f5AMtGto2tjmdkbStGMgAjWBsmUgdcmmSLHhvkoW4CmU5InEkZ1M4ei8uHIdzOCAxY
         6zgTmr3pzBteHvxX/Dd12UgKcP81AzJHoqLHzFDjWfF23TkdXVT0a6V1ryxf2pqmCJnU
         9T0Qo+yLhlV5ylBbMUSALoZ7GkGuuqtgTlY23yv+6R43p/9BLPjizuQH1JgN054ndZ+h
         1wmXCy4EBWsESgXG1/FkDZ0mER8om1G2hKSSXtqxeBD3u+P4ESCGP4kqj/Rlnxz0UcT0
         A11B1BU2PqkYQNq4klb81p4nMv1UY1zKqkmrkQ1KuEo+qhzw+9MRR3oLDrZBzu6W4NvC
         1G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779450428; x=1780055228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Vtic2scv0lNArrUhQhjpK+aneD52xMJ//xMO3IOSEU=;
        b=VQ8BBIMxotJR/IMnfbcIzLyMAQYNXVCWvZ+5Xs+drbID4cPoTvJ3HmvxNwGRtyUhkT
         5R2UZk9dNl7e5OjcQiqOcGhFv03Y8L2IlqH+6M86u8a9akHJxzkYb/T86swOgzNFnjqq
         bXm2ubCLoRSfRC32rnmpxytcq4wil9ParkuY1MiT/N6ddkD9i+TOKDG75QnfaRzyPwkA
         oF4D+1T80uA6L1PR90ptzvfiHfFN3fZQKMHCWWdjfznl1L8GljHthZzQa/F0yf57SQ4z
         txrpSvuEQB1V51UmzO9okfxySjHoPOCd5i9mP7scwBgzpETGPXHsmDrUsrSBoahLGEoe
         baIA==
X-Gm-Message-State: AOJu0Yw1LGOWsfBjrC73Qle8C5qYNqsj4kPtUpiN6N/1K6nWfbCYHLLG
	Ht/v08Y0w3jIcGSsOO0MyBj8PZbL/Z+AjejnBkAPKoG9g4w3st4asKe4JL5pdyWf5i5Hh05BRH0
	XmwCQrPFMWVVBeReoBcRp+17GnUOLLLPPOouc+PQKxPK2W4G49OSF6hYzA+jKKU1978kB
X-Gm-Gg: Acq92OFzMdbqq7bWgmvWXTh2+D2PbiF8HSKCy5giaPOKN9w4VdYsLetya2/HFv5gKHF
	f5m2dg+/El8SuiKyx17t1RZDUKJcK+Pn2nrkw75NY4j3vZkeHED3dpajI3dxMhnDaAU9LPkPrV2
	OwmoYb5lO25ASm3k49ePDxI2IS5oYFOhaeszBv/JZT4CbRlTsMO7zfurJ12WXHFhgHKq2JTFy+x
	YtV1zXxXZNLwJJJR5kAAWQXgckDUhweOyNs+Z2thzTydgvosivPYW1xWarEnN5VT6V8XMhkuTWf
	RdKnToOgLghuia6T2T61O9rP25xoWHMgU+dUUkJVi7Dx19BA0oPlYskyad5BrsHDHOJzA0XF6uD
	m3g0fDNyvO4cj61akKNQJoR8MKXzMS3PyHbpZjxaVmnpnWg==
X-Received: by 2002:a05:622a:8313:b0:509:d76:fe73 with SMTP id d75a77b69052e-516d436867emr24779121cf.3.1779450428498;
        Fri, 22 May 2026 04:47:08 -0700 (PDT)
X-Received: by 2002:a05:622a:8313:b0:509:d76:fe73 with SMTP id d75a77b69052e-516d436867emr24778751cf.3.1779450428043;
        Fri, 22 May 2026 04:47:08 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc30528a7sm47004366b.21.2026.05.22.04.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:47:07 -0700 (PDT)
Message-ID: <7a74f989-1235-41b4-90b7-aad1c68e9b37@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:47:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/10] drm/msm/dp: turn link_ready into plugged
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-9-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-9-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a10423d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pcg_VVX8d75-tFNqbqgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: VqCS9UXs5Qa13No7Nt0yuQ0zZdLYh9tW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNyBTYWx0ZWRfX6gCRVXakcgE5
 gTedupImSSp1taHJVdQswAV+SucmMsNgLRYiT4MXXtNC4nGlxhQc1WmhHv7iTujiFXPp8RuJBqt
 Hpgg1pUZKeYqOlRQ7sdlSVN4LZZn/fShQJNyqly/V1JPflzOL6KpciumH8fWtOY19/Zzl2uwx8h
 ahgMK/5oO68WvKoYIWcM7EjCnsNsGkF54ZH9zaWBaBSO7YjNbZfng9gTy3NxxAfY7/HGnTuBkSE
 BqsPQD5STKCRyy72U5T0IAN0zLn0TOtEUlxsyQTodXf7+oMR1a3gdXOpKkO6uMoSvvu0Z3E6r5C
 ErIcGLIpkj5sHBKGxuIw1AidXTJJBqWcBc1F0da/a6Pu5Bm9FfexvX2h5GhJ5NyzaS6MNN58Lut
 yvsPzr0Dd4nQE0ka9MBaJT86+TC5YRrUUfH3PFLTSksEfw+flZR5JnMr6VZxBj/7hzWPrqDFtn/
 0Qz6MRRAtmkfiC2fJPg==
X-Proofpoint-ORIG-GUID: VqCS9UXs5Qa13No7Nt0yuQ0zZdLYh9tW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220117
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109283-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A11C5B3585
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> Tracking when the DP link is ready isn't that useful from the driver
> point of view. It doesn't provide a direct information if the device
> should be suspended, etc. Replace it with the 'plugged' boolean, which
> is set when the driver knows that there is DPRX plugged.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> -static void msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
> +static bool msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
>  {
>  	drm_dbg_dp(dp->drm_dev, "type=%d core_init=%d phy_init=%d\n",
>  		dp->msm_dp_display.connector_type, dp->core_initialized,
> @@ -312,7 +313,10 @@ static void msm_dp_display_host_phy_init(struct msm_dp_display_private *dp)
>  	if (!dp->phy_initialized) {
>  		msm_dp_ctrl_phy_init(dp->ctrl);
>  		dp->phy_initialized = true;
> +		return true;
>  	}
> +
> +	return false;
>  }

Please either rename this function or add kerneldoc - it's not obvious
what "msm_dp_display_host_phy_init() == true" is supposed to mean


>  
>  static void msm_dp_display_host_phy_exit(struct msm_dp_display_private *dp)
> @@ -366,14 +370,6 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>  	u32 sink_request = dp->link->sink_request;
>  
>  	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
> -	if (!dp->msm_dp_display.link_ready) {
> -		if (sink_request & DP_LINK_STATUS_UPDATED) {
> -			drm_dbg_dp(dp->drm_dev, "Disconnected sink_request: %d\n",
> -							sink_request);
> -			DRM_ERROR("Disconnected, no DP_LINK_STATUS_UPDATED\n");
> -			return -EINVAL;
> -		}
> -	}
>  
>  	msm_dp_ctrl_handle_sink_request(dp->ctrl);
>  
> @@ -392,11 +388,11 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>  			dp->msm_dp_display.connector_type,
>  			dp->link->sink_count);
>  
> -	if (dp->msm_dp_display.link_ready)
> -		return 0;
> +	mutex_lock(&dp->plugged_lock);

guard(mutex)(&dp->plugged_lock)

[...]

>  static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
> @@ -446,8 +440,12 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
>  			dp->msm_dp_display.connector_type,
>  			dp->link->sink_count);
>  
> -	if (!dp->msm_dp_display.link_ready)
> +	mutex_lock(&dp->plugged_lock);

likewise

[...]

>  end:
> -	pm_runtime_put_sync(&dp->pdev->dev);
> +	/*
> +	 * If we detected the DPRX, leave the controller on so that it doesn't
> +	 * loose the state.

loose -> lose

> +	 */
> +	if (!priv->plugged) {
> +		if (phy_deinit) {
> +			msm_dp_aux_enable_xfers(priv->aux, false);
> +			msm_dp_display_host_phy_exit(priv);

Should msm_dp_aux_enable_xfers() logically be called anywhere outside
phy_init/exit()?

> +		}
> +
> +		pm_runtime_put_sync(&dp->pdev->dev);
> +	}
> +
> +	mutex_unlock(&priv->plugged_lock);
> +
>  	return status;
>  }
>  
> @@ -1123,6 +1145,8 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>  		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>  	dp->hpd_isr_status = 0;
>  
> +	mutex_init(&dp->plugged_lock);

devm/drmm?

Konrad

