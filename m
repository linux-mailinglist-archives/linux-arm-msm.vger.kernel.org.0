Return-Path: <linux-arm-msm+bounces-85610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3485CC9DBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 01:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D980C303EABF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 00:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46579168BD;
	Thu, 18 Dec 2025 00:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnhpDrrh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrMzGrst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A205D17D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766016436; cv=none; b=ReeihRScylo/Pw64CLR+02kYiccMbDXhfJe0KJmpTQxEEnSsQ8JQuAh+Z9oFOv+toGshhvnfm8kAweC7VnfanJpzxAxADtlS9ogmvzFiNucTXgFPS3rW9XJ36NqgxfQb9zL1kulFwtdpkGvk3M9VYA2Lr7ZXeo5aJfnM3h4eBq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766016436; c=relaxed/simple;
	bh=MkZFiW8PVfEXC9iEw+RiF1rkp6MiXEJyjsZ/QWm8WpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ds0aC4uOJmy6OPRY+jXnsbAFWQIfdJhTKDc5f14YCKhZ+Fr1y6HN7dEtq2sKyzRTxnjb/FF5HT9xzBO/yzFMUg87KLGbjF+OYVNpK/HBX3OVeXp8Nom+pUwgWpJp+XPp/Y6IfqIGM1wLDabD0S+lk+dM4KLymlJmPi2FpWRzbz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnhpDrrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrMzGrst; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHJB9RC2927448
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+6X2ksbSDC2ya8H3LtEZEvp5I4IfOZ3iAR1V5pLfhRE=; b=XnhpDrrhKEMqop6K
	ZJxFdaUizCFjoYmS6Rm2/mPPWnuGlZYv2J9PnMpWNmwAf2HgWh8m642pU56Mfacd
	AHH0PdEGeZLU+7lun5fMhLro4ANvHO4McJst2HoGPpiAwos0qsEqqXv76EZiUDuu
	Zj0eFh4AQjjqYWOP8X6ISk+7UUNajlZZGZ3GWK7238Pi5ultBuKCgsy9ea8UpmX+
	oHlAwwB4ZQQNIGLKR61LztS2qWcWi2TBcQWxwXPokWxSL8Yi4UrULot63nwox0zY
	vBR/05yeaJnLdq2hXVu6qTL16Na3RUy8BCnU7LfreSbZsn0HFPpPGZUtIWUPfbcX
	aneM+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40n792wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:07:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so1566661cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766016433; x=1766621233; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+6X2ksbSDC2ya8H3LtEZEvp5I4IfOZ3iAR1V5pLfhRE=;
        b=VrMzGrstwYuwqKB4LgYwOaVP5BbGAct7hlDGhtWzqLJ801lRTL0rr28/EDgQtuXGHY
         HTTfErxvL9WpUQgHT7SJqhOm8weNq2Wttwx9M7FFqUV04sHQhxHh4vmRJO7w76D1CCwR
         Hw5rOFCvg619BlYoLpIDtPG1e37qvKoi2FoPcg1hyT7MAD6d+eSkKfr4GkXc6pxiSyNF
         2Zh2lIaQXhNmo55ZPukLlmaZcXuvgc7Y37UDOCmwqpDVelUpLQW2nTGUkWPL16UZ9Lh9
         haMhCg+B04P2bSbof8OtDL3oTno+bYlHOU+ODvMEis9q7AvU8E4P3BFlptUu4zV323jN
         psTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766016433; x=1766621233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6X2ksbSDC2ya8H3LtEZEvp5I4IfOZ3iAR1V5pLfhRE=;
        b=v547KH8CUX5QE8JVUQV6mvu8TeMMTl35b9IyMH2Hr4zTxxJq53VSLsEFU9LEk1Gqk+
         gmMLdZEmakn+NqXnjjPfSMoGt0t5S6nHAGuWaDmSedCp86Qdq8Lp4+FNjD8i6GHK9TOF
         MA/W1i48ZE7BeGP6p56pLWdgsdN9YAmOOpALH6pur41i0bL0WZqWV2wUDEM3zr/poSXX
         f/NQcpfVZn3v2IUpViZVl5ngSxJtfJ1UHIwabWFL91/Mt2JWN/dtwN37Y+bHfodaMDMl
         bnfoJu025dv3OiKL+/dU/PcfbvDUWklJMNzWktbnW/rLMBhVbIfct0jG7Z5fGtVmmrQ7
         /PmA==
X-Forwarded-Encrypted: i=1; AJvYcCVBOkh6HhuF2aWrm5CUgbx4kNeZR7dQLoINIY8uTL/im48dSbv3acvJUbGqLt9ASZagT3zSRnjjX5uqbDoK@vger.kernel.org
X-Gm-Message-State: AOJu0YyJOEXIC3OKeJrRLEhG1KbdZBHrmOVSUmy5EGiFcCHrVj5vf9bw
	oVu8ko6FjZXDaSaUlBpLKqYSeKIH0RTvu8ycxKqTGjIjhCuwFO7sQgTWssCRwdaGszvAlkCERVD
	ajsIeHda+ts87X2BcejNDVdIOfddwY23skHigkbeqqtThAoJjmMRR2y7J4ThvIEZDfe/1
X-Gm-Gg: AY/fxX6C8zRDWGFyWRPpuzh3sWnPMX+YmzlCEMDf8XkElFL9v73IhsW2a6r6SGhQPzY
	sWYJjeT8JmXQwKft9Z9ATdr3k0hKrgexkKEyXT4r19ZmK13xi4uT6m0iViFPsQuNKlBTBKitsry
	KQnz2fwxNPiKrwY6EldxPdl/dWTX9qOcdpsmj91uuhm18CBnybI4ixISbU3tBgDTu4SSWICo2b1
	AvBrI4pelNK5oXEudr+97w9l0oqdJiM76rfZtwuLrRE63mor3otpjxTNeC460+REq8Id1u99cKh
	tO+SZyi51FJO2rz03Ghmipm3y8mnRWZ+gZe1EjNjmu5AhCpJJdpnybxLcI5PJ4F5AEBuYIuCkBu
	zkEastoqxNKSCyaTA3cNjFGEWNeObzDAWostbGpSnXqUDH+ugvccAe2Y+2WWVmeukmJygr6zz9L
	SO8Eb6Xj0LY8DvYU1RbWV4BIY=
X-Received: by 2002:a05:622a:2d2:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f35f43ab71mr22024661cf.21.1766016432262;
        Wed, 17 Dec 2025 16:07:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7r9ikBXTn9EQK+HDVKOPnuyMaSvuztty6xD+BwyGt1UHdgEs/NzHIQGQgsKy4i7SuFf+65A==
X-Received: by 2002:a05:622a:2d2:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f35f43ab71mr22023971cf.21.1766016431146;
        Wed, 17 Dec 2025 16:07:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132cb5f7sm321357e87.4.2025.12.17.16.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 16:07:09 -0800 (PST)
Date: Thu, 18 Dec 2025 02:07:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jerome.debretagne@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
Subject: Re: [PATCH v3 4/6] platform/surface: aggregator_registry: Add
 Surface Pro 11
Message-ID: <s45ki2ckgw7fu25h5wd6mb3mc4kzs6qq5eitv56asqf2suxh6l@s5tbqce7gz3f>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-4-875afc7bd3b7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218-surface-sp11-for-next-v3-4-875afc7bd3b7@gmail.com>
X-Proofpoint-GUID: nY-ppdl3AUxXORralHYpljWt-eavCwTr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDE5NCBTYWx0ZWRfX6DAjyT8+7ZRA
 tGnauJ+lA6tbkntrEJ8+ROpSOpQix0+ClTXd/JNwkQ++rc6L1TcU1Lm3nCBlYD7kUPVPd6AjVYi
 HZZqtW9V3wmoB4syp7JC41OGfeLZVNHn/scKaaE9D/xouizrGOfGBZWyk6d5V37Lx4DhGRlZr3a
 sdkiOusaf3eB8+zvACfBlXo/3Ry3/4vACHPOTAmAIJu6Uj6E50Y/KQ07fE4N//fHaQqx8yXwPhh
 6H6IdWa+bo0rC+tTc+DLEUxp7sIlAscOAbSYBJCdImxbxguaYtdig1X3GiDgcQh2Fwr43JTu+ml
 py6RjgGEMOL5Q1L4uWjr2vNiwttx7IX3WhD5lJkiXbR5Alt+nQRf/cktR026gII6o9HFZdnLZWS
 XyErz11hShbjJ2n1R+//DrHA7CTccA==
X-Authority-Analysis: v=2.4 cv=TZebdBQh c=1 sm=1 tr=0 ts=694345b1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=27tkrN_41n3i1SKUIiEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: nY-ppdl3AUxXORralHYpljWt-eavCwTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170194

On Thu, Dec 18, 2025 at 12:56:40AM +0100, Jérôme de Bretagne via B4 Relay wrote:
> From: Dale Whinham <daleyo@gmail.com>
> 
> This enables support for the X1-based Surface Pro 11.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index 78ac3a8fbb736384f7e50f1888a71297a892a7c3..c18d991afc8b0a0bbb26966351b75b8ea01097a4 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -406,6 +406,22 @@ static const struct software_node *ssam_node_group_sp9_5g[] = {
>  	NULL,
>  };
>  
> +/* Devices for Surface Pro 11 (ARM/QCOM) */
> +static const struct software_node *ssam_node_group_sp11[] = {
> +	&ssam_node_root,
> +	&ssam_node_hub_kip,
> +	&ssam_node_bat_ac,
> +	&ssam_node_bat_main,
> +	&ssam_node_tmp_sensors,
> +	&ssam_node_hid_kip_keyboard,
> +	&ssam_node_hid_kip_penstash,
> +	&ssam_node_hid_kip_touchpad,
> +	&ssam_node_hid_kip_fwupd,
> +	&ssam_node_hid_sam_sensors,
> +	&ssam_node_kip_tablet_switch,
> +	NULL,
> +};
> +
>  /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
>  
>  static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
> @@ -485,6 +501,8 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
>  	/* Surface Laptop 7 */
>  	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
>  	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
> +	/* Surface Pro 11 */
> +	{ .compatible = "microsoft,denali", (void *)ssam_node_group_sp11 },

Please keep it sorted. arcata < denali < romulus

>  	{ },
>  };
>  
> 
> -- 
> 2.47.3
> 
> 

-- 
With best wishes
Dmitry

