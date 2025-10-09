Return-Path: <linux-arm-msm+bounces-76569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C7BC8229
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 10:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC8BF4F5FB0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 08:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E80E274B44;
	Thu,  9 Oct 2025 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrw+H4t2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C472116E0
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999961; cv=none; b=uIezZympNENYFN5bt/I4WwN5Ry7U3TB6eYPWlO9kOSKgeLCrRY1leZwoYI1B+E9RvrXGSEuesO3xkpZe3epSnIHoTm1AoyXAI5gHgnuAvOFcTeMxe05FBZgmLGTermuHP2AKILJdbxlztAv+UH57tEmtYKDHonPP89KcqBof53M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999961; c=relaxed/simple;
	bh=SvL6QwL2kbfoDMu7swIfDh31Z4SBAEEr16lTQLxGnf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWdoGmgYB+u7W46GWqZibQIsOgNzloASwmlwiFLUk8WBveiXpIOVw8l/QYMfX64bp8VnUKg3PpLEqDz42iStLHLgFCB3G70/SZly5MkuUnnWjaNa/U21RZPzqstSaYbc2CZwB7qtJIs2Dx0wZhsh1A9vLM9/79fa9+vpywztw2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xrw+H4t2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EO4r029755
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 08:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mz3R/+d2HRB2j4ZAAYNbKPbcU1+9mJalbUWZyK8B4cM=; b=Xrw+H4t2gQxnEgFS
	dxv+K9WlSIoBBBrj/ny7tiQn2lGq3Y+40pV21TdG40PO0bvvblR5bscNgV8ZBOn0
	NR5ZYiWL8QWFoguVwfz/fuQfFrppThsY3Q6L0ubkm6qsz5BlViVelyt6shk7GNjg
	avD6M4JFFF5Q7ZU3EEXJ3AI/QwJ9mtGweAHnTnft2xYkzftNm04PoQN2Jnbs0dtB
	PiXMI2iiKa+pVEaaVykHgKIiFJpoNi3Gq+3SzjvHtA0bqUvBQ6RsfKL74sJvSRbc
	AYFN1sIRcanio+cS6t5fRfrGcpOXBkpeoFpQ5OX2bXJdDG/WoLXi/SwnFEPSGQLv
	HNQbAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4na4ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 08:52:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso2679491cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 01:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999957; x=1760604757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mz3R/+d2HRB2j4ZAAYNbKPbcU1+9mJalbUWZyK8B4cM=;
        b=AV4p9ampClyEyb8nyrPN9M6EZnG6QiKF2SoXdm/woEWazu8BDE/MHrR51Yb7tk3CFZ
         DG/7ztYHmOj4cYK15HESQeHjIReuFa+ZHtgoy2dLMtfziO+vN6H/0gGk43dPmK0vbiPQ
         auM+8OrQxVRU2E11y/MEOrWxOp5gmtP58xH1OED+Mc0/VvX11J1iSQcelKFVRtWXO+ev
         gb6KEjgtd3yOhRSvMFb1JVJINzvT4nBkFg9ex2Me6fZjPRbKxuYLNSy5kN7gyPaYmBmi
         NdHw0a24GAp/WCzL8PXj+4/nDGIlBgLH4jvhiBC3g8w2OK8U9tdrNsU9Rplo0i6rpMh4
         cAPw==
X-Forwarded-Encrypted: i=1; AJvYcCXRGp2uvQTp+jeCUrA6MOFCM0p2ElNn/Fn1FPFOZdRtDm1YGwP7sK7lnafN72WBor3lRI82xHpM95Hq3aBc@vger.kernel.org
X-Gm-Message-State: AOJu0YyEWAQpLPJTjX3Q8eLqxzi4MKkKhdVAcFxSG3xcMhTzwe5pyOUh
	GXGSyo0C0sRUFCchAtlwGXEuzaMfTEdJtn9LcBbFhYM89/HB618HTdk8r2vHj7/18xEn35Tcflf
	OT8G+hAfPSt/v1OX2rpYSrUSWHARgjnhD0NrKmXIqPk2YVKKMH/dqtTUPD5LQpFvBfRlV
X-Gm-Gg: ASbGncsoNQVJAJXqaDtEyA/NOvdMfQ+3Z2B3chSZqWmFCTiuyXHdoVXtb5yi0WEAEaf
	YXWEsr2iMViJkzP/eJs6p+Ww8m4k5lgqISMGSNn+s5res9bu97z3nl+2ga5xG14m9i0486Ugzbi
	vfoobOtwf+hkZ2oOInTlzMVqQ35NftbEivlTMyKTavS0iMoPzX7Q+JcReOGxiLQQXY8Lg2v0Ng+
	8hA40UdtPyQduyZANSdbFwH1+gnywmCPtdywM/VX5b2P8o9CUrZ3eeThLqj4ZIeNmoGOjMksN7E
	Qh1caBlI4ImolpSFbX56zie3Y29Zl/GSSGYZJMy6BJg3xbcrjf0ie3X/qJtMApUSKd/Ra680ccg
	2GYRa/TKU43xYicEf2ZWKa+dCvWQ=
X-Received: by 2002:ac8:5fc3:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e6ead1deb0mr60152711cf.7.1759999957480;
        Thu, 09 Oct 2025 01:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt0uEiEbh1bGs1o55s5jlT8wv6t3qr229hu5kTSl6GIzd3si4d6C3k4g7aU0DhbZYlQXIyoQ==
X-Received: by 2002:ac8:5fc3:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e6ead1deb0mr60152511cf.7.1759999956930;
        Thu, 09 Oct 2025 01:52:36 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9bfcsm1836499866b.17.2025.10.09.01.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:52:36 -0700 (PDT)
Message-ID: <3e115b9c-41b2-47c8-ac92-22969766ec3e@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 10:52:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-s6e3fc2x01-v2-5-21eca1d5c289@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e777d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8
 a=cYgmbtr1Y_meZTC9yNIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=MZguhEFr_PtxzKXayD1K:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: jtIfmb-dwbRhzhHGTB8oqkHU9uLAQA9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4ur8FawTnQ77
 L0g0xYGZaQ2YBtFhi2Bh3jKatjAH+md/y2za39hpH7lUFyQFHRIdoP8tUm45YzhwLBZTC6Uj4hZ
 rzgzFDzyiUM4byYgB+VPKoGFVqxnPdDBiT9CgVFUXWqEZQdiZ2ZMVws1A757G/o59Ktrg0+osuk
 ZYnLDgNNPrvYpOTI6cUwBntzGgJybT2XrnQpnOBcq/hQvb85HX/7djOVk6PvZthfCKfrU2YPwCf
 eym2cSjBkxcjwdtQvRwGSYTpvoGbTXF8GSPoNvVnjHY21JzEzSxDJ3TbgihDhByMIcXfNBp1INL
 3aKUGHlEOZDZOdVmTx6e+VEdB+1C0NwfFLWVlTcloaZtfugbN5Z29CAdiGPEQJAqXfJikC6wsFf
 4CY43ajpMdkf79hZFEFG0d9KMudfaA==
X-Proofpoint-GUID: jtIfmb-dwbRhzhHGTB8oqkHU9uLAQA9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 4:05 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Based on work of:
>   Casey Connolly <casey@connolly.tech>
>   Joel Selvaraj <foss@joelselvaraj.com>
>   Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	/*  This panel needs the high and low bytes swapped
> +	 *  for the brightness value
> +	 */
> +	brightness = __swab16(brightness);
> +
> +	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);

mipi_dsi_dcs_set_display_brightness_large()

Konrad

