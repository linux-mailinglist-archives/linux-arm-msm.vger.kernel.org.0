Return-Path: <linux-arm-msm+bounces-97107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFYDIuUnsmnlIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:41:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E60C26C560
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95CDD300683D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E5E35C1A9;
	Thu, 12 Mar 2026 02:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmO6TJjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIcMn+7T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF5C338939
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283298; cv=none; b=TJu+VGXIQX/d7loveR5DBj2MFNYo+CZJVURzQ5iWZ5Is26Hej9MB0+AOJkAl0tFiQ0rm/HkAB+0/6LYLRwyrpHSHictyAUl+2vUBrPGHdNhLGbI/W+jg4DHGXU0ZoPG/OJf7vWFT9fOZYKhjmemE3z9qfkgpqKLTNCA14GyGuR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283298; c=relaxed/simple;
	bh=hmNQdB58RY5pSiZAACG57mpVMuCNU+9ux9CiyV9WcI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk1h0oq6ytoLfZEEWCaDHdpr8x552ljL1cfYdnlsSNy/DlLrnoN1D4pQBIO6vMcn/hmWIVoI/tW5lWwe3UkuxlSYIb3rfiSVtcqYgyAePgYK2yVia9iLodVjiar88zSwjfixa8tEEuRnpR1XFXOhXWULCNkKqI073TiISRwdISA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmO6TJjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIcMn+7T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMp2f1922472
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ixz1LvNIcUsp4rF2YM0LZnyf
	7BXJFFuDjtH+2CvulYU=; b=JmO6TJjhFwClDUZTazdD6wJtQnycEpXvMrPHIskT
	LIig95IdyATBwbWBibBtCI/D15RoBsf6+qtkGyY5UYmGZORJGiiHK8qH0DfhuLLe
	5s98yd6TEwOH4vVZFUbG5kcEY0IF52OTP0qDGjd1aFD/b0WoOrKUFXXAm1fPhbuf
	os6CoIt5TpRq3z/k5s8003qOwPcmCeBMNUCWQhUGIRUFnoVx4R5Q0Tg89eGyP7HU
	ogQBFb6eTQEyMTMY4GvwZPI6lPupBw2sBVxskOXeed0p2qo4a5qwL4T0DQQP56zO
	jQSbL0q5iBn6ElQeKsxk0PfKSDplFtLIXaaBQHXILONR7A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wrm20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:41:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a1f95aea0so46747796d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283295; x=1773888095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ixz1LvNIcUsp4rF2YM0LZnyf7BXJFFuDjtH+2CvulYU=;
        b=GIcMn+7TK33wgeRNCJ4rf8+ycEgAMSyhDJV5C8OV1vFJMaQuI7XybJ9m6ZDg4VP5gZ
         tXSvX7+LV5xAvLrv2ZbrRxBiHQJUvUuWiQ00TOJwCd5lNy/Ulr+XU7AahM2USTVmA3Qj
         WRr7ik4XaZchrNgg3Yp2sjTwvztpjf2ojy7sPrwIo7G5fetab8mkGGteT8ZZS78olVZ5
         SnqSR5kIVipC9Y5MWRA1EQAag6pU1MRnbuU2JPG3ahSHVVvyjmzkj4EkjBKzaXGymOeJ
         j2aZKbOc37j6ZluB2IAGl0WsrJKXTUsN69CbV/msrnqED9pTmqY4JvFRu4ULtVFqdoRE
         pTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283295; x=1773888095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixz1LvNIcUsp4rF2YM0LZnyf7BXJFFuDjtH+2CvulYU=;
        b=IA/CoSUYvDVKtcS81s9GgRD5FG/umdQZBKu2DNXw6t5QuK/YUZ7UB3A/jDnJ4TpiWK
         QE3Zmw56URT7Ybs1yL4KMvqoMrNMZ1pFE6LKmYrW9am+AJYh4Ac/SwK7F0FPL5hNG9m2
         332LZ/46hABOGIkGb4Jp0TNULOXZxDPHJiIt9Ki6asPAyn7VGSXChVqR1l52qwiwwDiT
         UupmUzuHO15lN+9LDIneSH1qENvlJk9kKoO/9imnGu8AklI4UeQT6AHFZlgupf9x1kb4
         xo9EtibXeVa6J7bqXq0g/CkkuQ0iOlP+3NMjQefEVU052eq0P6wzNHClk3EBjH3qbyHB
         AHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbvQd9wqXt0x9hNw6NOjdsX0Q3jUhjIqqeiE4D1BlmXn2jVqpqM8e+/A4BBA+e3loYfzWBltExrvJAMr3R@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx5cz8xJroeM5Qe22L+eVbAaQDHV6Ut8xplOmRj738/06PWxS/
	dmBVhGpXHEAkoUH0IefEUY4b4vaNvmMxI9vQumcCfNsD/jRPdA7ZmgNek+wiTkkSSMhAKSJ8/VI
	x3ijoVhZoifb1M+XUkC503dUQwvZAupitvxLrP+EmXSt0O8LV9a1AuY+3G59UuedtZXsX
X-Gm-Gg: ATEYQzw1g8/Ra1hqDCmcPgk9ccfRE9+0EcBXW2wyTal+rfN/v6pSEJVaA2tPunz8eL0
	+8TiXcVxWctN17al1U1zNsUdA/YgqDAr79H05FlYTwLd22KJBixJ5QavGK4OTdLufwHXqIShXBx
	R/SH+rUkGcQEvqaaTjEgMK8EeQvxVvoppGAjIvE6K3i7lR+h4qXnUdLrqcCsqX4In64DMPX97FM
	w7QeOlHoMi7ZI5ohT2JuZvKkPARcgmcu5YhvbstHCJkkjEqniVC2osRfBPKK3I2MQRgsHvE/axw
	OAKPaMebRXvM9aG5TWLDF/XeSnDxMhpNSKVsRSv6HrUC2cF4y9GCncs4MSD3/dBe1xR9Ogd9LDD
	bn1W5hFflaWBUn+ftAH/nJ9HZsON5Vyq/f7rkFz0+JkVMDBdCRT+jg7wP5ExqxkSlZarJ523qcJ
	p+hIr7z0kU3mcqrUDOh5+ms1lIK5qlRibIx0o=
X-Received: by 2002:a05:620a:4144:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cda19e5672mr577385285a.5.1773283295155;
        Wed, 11 Mar 2026 19:41:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4144:b0:8ca:4288:b179 with SMTP id af79cd13be357-8cda19e5672mr577383485a.5.1773283294701;
        Wed, 11 Mar 2026 19:41:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2ecsm690211e87.25.2026.03.11.19.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:41:32 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:41:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] drm/msm/hdmi: Simplify with dev_of_node()
Message-ID: <hg2icue2e4oyr2pu2osjlbbcv5g2q6golwoabe3oy2bxhvhb6r@ku7aqp5jdovb>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
 <20260311-drm-msm-hdmi-cleanup-v1-1-c5535245f6de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-1-c5535245f6de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b227e0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=gkgWL3kA68Jh7ZSZfl4A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: BR_R34zwTSMg6-eyp64oBgPC0xq7GSg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxOSBTYWx0ZWRfX8MX5MO1U+Aqr
 kVQNphHEJa/IiHPykpnN+497bXV0qnk7OYAN2MtrIk71lSlysEmhaLrNKxlRb94efehukonN9sy
 laZt81xahljwlP+AfURQH1suVWbJXxZuEygsKF6Hh291YW+yVKQwwNhV+hhYOO7ejvSbD4DKYVk
 PEoAF3kqukkoimdvgjbYY7kZeoXOKsxS80CP370Jg29INw9nl7zAeqiuzNJJbBl/Oc0QbABBqbB
 SreleCOC4QrrE1Vw66iKIDk7b3zngnlG449ilQxa+ti+wCDRlUkdgisixHgO3XGOktakeqrUNjm
 3taZoPo1KshhJyrvyX9uUA/zycREvSyQfI8gMA3G8lPRQ+3zu5wvoC3B0SLqGe6BdKXAv/jxtk5
 Xr9eO1XLkTRC24eqXcvvelPujlZB0RSQgYkhOZuLCYWAJfUPkvSZtz4rdFs1L0pEXG4e07PTxdf
 At/hM+lZycPeIUB7L0Q==
X-Proofpoint-ORIG-GUID: BR_R34zwTSMg6-eyp64oBgPC0xq7GSg0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120019
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97107-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E60C26C560
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:17:25PM +0100, Krzysztof Kozlowski wrote:
> Simplify chain of pointer dereferences with dev_of_node() which also
> checks if 'dev' argument is non-NULL.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 5afac09c0d33..b1db1b597901 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -91,7 +91,7 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
>  	struct platform_device *phy_pdev;
>  	struct device_node *phy_node;
>  
> -	phy_node = of_parse_phandle(pdev->dev.of_node, "phys", 0);
> +	phy_node = of_parse_phandle(dev_of_node(&pdev->dev), "phys", 0);
>  	if (!phy_node) {
>  		DRM_DEV_ERROR(&pdev->dev, "cannot find phy device\n");
>  		return -ENXIO;
> @@ -287,7 +287,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>  	spin_lock_init(&hdmi->reg_lock);
>  	mutex_init(&hdmi->state_mutex);
>  
> -	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
> +	ret = drm_of_find_panel_or_bridge(dev_of_node(dev), 1, 0, NULL, &hdmi->next_bridge);

dev_of_node(&pdev->dev)?

>  	if (ret && ret != -ENODEV)
>  		return ret;
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

