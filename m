Return-Path: <linux-arm-msm+bounces-55687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B92A9CF8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F39A9A7E74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6961FF61A;
	Fri, 25 Apr 2025 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSFUQ4ki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72301FECBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602028; cv=none; b=RPspCJsgG5tXr8O0jGG9w84G9Mlydt3lQ/O1Zqq5x1GbkxKwHdn0N4Lm/kTZb9rRBX4P/EVKXVQK0ERpq59wSwc54RplOYoZ6ugyXfDPFtJC3YH98eOYXiqpFi/CqgtWAp5VNe3u50BWBsojPvVLQDNL9Qwau/Q0oFlzD12hHEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602028; c=relaxed/simple;
	bh=YE9G8mI28GW/5ukb5vBgVbGkCs/8fgzDRlzPwIB3S2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQWqZ+hwnYuH0LQ/IaCiIpdlU8IIwOnLlTnf4r2wQm/xbP8Gcb1AfYfhSBkiMv/uJ53hRKfEgu2UaN5AYX3MF0q9xXiZZOas1HmaRydp9iBmL9Vi0XpTKCpjHn1wwB6wuziI6mslOWSMTewZzalVTfZYG34llmsyxWbxm/wiVAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSFUQ4ki; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJpfG031928
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6atleiqSWOqhZ6HNJhi955CI
	NiLi08p3xHpsze8E6/o=; b=lSFUQ4kiv5h9xhe+e2zaqVS+TZXDcDsPQT9rkiay
	RUs0FJO7vPvjDt7Y/0NtkjwV/FJApSnlcGB+D5YcHMTV9ueUF4yldArVi4MnyHhs
	N3Ig5QOrMcR6VGl7jz/SkLxBNjMsBsfdZ46rRKaBvRj2rMIcTFSGTJ+9gpKiriNe
	a/MGg5JI629x0RdjzHWeTTynjPBMnmv/C1kyKYrwWk+rS9PKcxUi3V4Lrb8NqCeX
	W5rJ3lROmLD+PR7fjm8sIM7RYPIrnEq6WV/9TlDeghDR111AQ+VRhuM7nJXs8CAT
	MgRrEoRwJdYAS/+bmPtT40b113vxZF1x1JMxbHNaEcHBhg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy9t84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:27:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54a6b0c70so248737085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602024; x=1746206824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6atleiqSWOqhZ6HNJhi955CINiLi08p3xHpsze8E6/o=;
        b=ZGJmewk9Li6h3wTus6deoiDaBmksnymGJpvldw4U+LyXnECN+KUWgIKFlr4rJL/zhK
         l0DdjsS7GrqvP9MB9FlCQDLDSLj/QNsLOjm3SS5by+yuwSSxwE/CdAdNwXspBiRoEVRQ
         W7lI5GIirF4htlxefskDjjzfdhsTqoj8tDfSCLld/SEmIrnDHa0tQ9HlYZpvIqwABWjn
         wys+nB5gUtfpPmcoCKrNS5qtZABocPAdLedJYCj1ht7rsYdPfJFVwT70Rs4lNnax0MiA
         KZ3eju6HQ2xPDrXXYusJMbBXklaO3gfbcRU3SLxvaIqr+UjqM181Vy+2H9VgTqEauV/3
         NH2A==
X-Forwarded-Encrypted: i=1; AJvYcCXwzew98ExZVQbIiB/AKQd7f4ufDQoXyWezn8f2YZFv9nNiWW/SMGSfQvtKNarID5yx/ntx+8F4DUAi8OCn@vger.kernel.org
X-Gm-Message-State: AOJu0YxYLQHEAvqkb8U+OlB3KbJkbeUdp4Bmfa6HoDmM9/wmcCMNkxhB
	7HRuAkZDPOj4Eu9wSvr6wHX74qfdzayGBSpHON65ss1wKomFOHZwf7RaYVJHdzKxQurrSKi5sMO
	gEC5dd7BUzgcv3yZ+vUiu6B8W5sk6kVshxfYCbd6Psk/NF4SdCoMqGvuHCmwCv5Un
X-Gm-Gg: ASbGncv5+s4oyyxFma6neGuizEStF3RNyIOkOQYJZ1J0AtAgM3syUGAc9WsvQe1KsUw
	sKBmtm+fmqPh3GYrwgMhFUHc4b1EEb4b6sauO5MhxS5ZFI+PKSBPgYeH9y7rYN5GwLFknNgY+2Q
	HtvoPvj1EFoe9Ae0pp+uFtn2kFdMyR8nn4eeECbxsGdLvnrlYmvw0D0N1u52r4cr2otq6n5t/XL
	acphlbi0/yNitVwP6jthyr6iW3lczU020bSJw3Pxny6495i90wUQ3wgCw8YvT/Prr3ao6ImJJ0L
	g+HioRceh7vW1PfStSeKgGdz3laA2y01rLTSXV4hXr3ZbmpzOaioDDW7/FyaHHJIuYMZa2Jaq04
	=
X-Received: by 2002:a05:620a:2a05:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c9607971d1mr452397185a.40.1745602023683;
        Fri, 25 Apr 2025 10:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfcY2I+rhTM4dIprfVROD5tVH+EAafw13oZ005cpJIfKjET5O8mPgkhb+t9ebqxFtJj9FPRg==
X-Received: by 2002:a05:620a:2a05:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c9607971d1mr452393685a.40.1745602023298;
        Fri, 25 Apr 2025 10:27:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96d90sm8189881fa.93.2025.04.25.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:27:02 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:27:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, krzk@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: qcom: camss: x1e80100: Fixup x1e csiphy
 supply names
Message-ID: <ukwt7mxabaq2om6is6smvwedo4nweugbauapeuzhbzj6jsbwk4@5eiksknb2bf4>
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
 <20250425-b4-media-committers-25-04-25-camss-supplies-v2-2-8c12450b2934@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-2-8c12450b2934@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX8RA1GsiwEF+a x6cDvdK2PZqW4sqkTH5DPAXFsPrD64cz5Mt3FUBOjNLlyIdyH0hNiAb7aYtPN41sgdlQGp3hwUe j2MHnZjs3cn8JiV+K0ZtzNzdsBoeksPnAkIRm08FtVeOO0Hrcfi05IE6vi1FujcfrdZcdhXeIyQ
 JMknF4c8IrWilvGDSgie9kbd4QV43FAfE//0WkBvssAx8b0FtgVL/kcDplEvF7PiXeb1XHoUkw0 LAfLJ6fquup7sNzM/AemXR2az1OW10So+5u6LeC5Zt/eN06HKebbopeEkZuDXvPkVDmrKlc7gbJ c1HoQlpFBu67zKNqykU3H5IiMSNmPJZv8k+22DWA6r5pzzVo0hZ2u7ZU0vFN43gRD99yVQYtVs0
 nlC2jaPFVV8xfrmJODaCs47Zt9NR3MmBIYqpv+MhGhwlpNLOe8lPpApSOZCR/0PzsNNhXtJH
X-Proofpoint-GUID: VcdoyDoAKTrgZamYiTy3EYRo3vA5_dDz
X-Proofpoint-ORIG-GUID: VcdoyDoAKTrgZamYiTy3EYRo3vA5_dDz
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bc5e8 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=QtrjCutIs_zDAuGvUncA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 04:17:34PM +0100, Bryan O'Donoghue wrote:
> Amend the names of the csiphy supplies to be specific to each CSIPHY thus
> allowing for the case where PHYs have individual or shared rails.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 06f42875702f02f9d8d83d06ddaa972eacb593f8..d63bc7dc951690132e07ee0fb8df7cef9b66927d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2486,8 +2486,8 @@ static const struct resources_icc icc_res_sm8550[] = {
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>  	/* CSIPHY0 */
>  	{
> -		.regulators = { "vdd-csiphy-0p8-supply",
> -				"vdd-csiphy-1p2-supply" },
> +		.regulators = { "vdd-csiphy0-0p8",
> +				"vdd-csiphy0-1p2" },

This is an ABI break. Please mention in the cover message why we are
allowing it.

>  		.clock = { "csiphy0", "csiphy0_timer" },
>  		.clock_rate = { { 300000000, 400000000, 480000000 },
>  				{ 266666667, 400000000 } },

-- 
With best wishes
Dmitry

