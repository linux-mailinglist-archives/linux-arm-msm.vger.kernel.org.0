Return-Path: <linux-arm-msm+bounces-64439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F82B0094A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A2FA568478
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7472F0056;
	Thu, 10 Jul 2025 16:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOtXlvyY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352602F0038
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752166434; cv=none; b=cf7OAk8xbM4Zv1vV1QCOWlOIDX2vgRcx9nPVMZTgc23N0tEV/WfwBseZwS1Mk/JYG8ksRGmbjIr1C873wd6Fb8tJmQg8zPGdY/EuUGVjxauly1CHeJwB1CWtV64WDaeTp8BeIAp6HOS4vlYyUYWIc/29SkKbaFBgtwKnskY6HTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752166434; c=relaxed/simple;
	bh=9nnYLmiKBH1VusudWulFh6i4+wEOM596AKd8BgLFv7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLHTPAdGWBawQIz4hQhgw1CVjpl156rxdCdqXJv9Pmj7mQEeVNFbJkDmtdXEFH9VcUeHdXcvJh+L/vuANbX6YebEnnTmxujVXm6qk8STwFMKX5JYK30LJNL/uf1mtHVxrrpaDu5dfYg5RTPFXyV8nlXIPQHSrCI110zhST9WvNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOtXlvyY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9FxGd009948
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vfb8B/yryQh/PYLYMQLTf7EgWVJB4S9JcLJ8lU/8XF4=; b=JOtXlvyYzwn25xXB
	DnH4/ZPBSqb2hwUscr7qSxMyx0IUmJIWpou//KtU8TgKGTm3L81SsGqJ3BO6zv1w
	LzA1p2dhaSr18KnWEXBK9Fx5wXu+dm3sgt6hZrAEkXrmD9EndinnVdcuCokajMb6
	S1vWu6PH0OoQULV5FhVKKrHD4xZj5e/jShEo5rsiXpByBfwBTTVCNBMdYfESDFT6
	kF+tsApEQ8j872KG3rCFBpHjLJCBspHWZuQw9M9R1+77YrEn0YbftLksCVnkK52x
	pVzOWCIR3FIsRo2cEPz8+ovQIUG3siHH0+tZ8de7R/EFk5m14OYSG6Z9BDGbjRvz
	z8b5mA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dwq07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:53:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74ea5d9982cso925231b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752166431; x=1752771231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vfb8B/yryQh/PYLYMQLTf7EgWVJB4S9JcLJ8lU/8XF4=;
        b=wQmLZr3QYQuojJZcu51mlEoGHMsIMTCK8e3GyikGeK6AO8FvJeFl5CQfBS6n+YhscU
         YNxAzyYvFJN0QJF2dL+Z/GzRp7301qpKIGIvwWxyST3ijvP/tjtnHcBkP/Kr64SE7AdQ
         MPqMDy+cp0Xmx3dkorpv8JenmJPtAY1HWIXAy6U9LCWWDPlA3pL/6CEQHD5Ry1qNsYg6
         TK2v9YFDY/SsbEl5USjnGpbvBhLObmaQiqxcCNPPgCIYN9vYX3Lmbo7iqu8y2SVyk7ag
         Bb3wUXyN5VTCmo3Iq3qFX0fyoGlhXbVhtGdHterbWgqgfUYMLBLIMLQmrG8L/YnoU9j/
         r3hA==
X-Forwarded-Encrypted: i=1; AJvYcCV2vnLWh70YRc05NbTKHSKdqyUmt539yvj4G506i2Z8Gcpp+1kaIKQKKMZLtG8QUo9ApyEK+Se35sChdEMO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnkf66ckCZl/r92vfMH1k0nxVsTsEP0UuJaqBnQR/Z7ihLYtxE
	EU/9CWCokepT3CJLq05coPKpxahwDebwnlSm7b3zSbGRQvHrCiOCctNyFVilvGC3u9+MiMzEKWX
	SqouMZ/SqAaPB4RzYBHZ29O2RPOZJynyCB48JdjZge4HtuNmodBd1kGRnWAepbqfBZFMx
X-Gm-Gg: ASbGnct4HIdFRRauTsYLAu7MSrltUDxDyeZNjsj5Cx7Q+xAZUd4Ru/DjX06KfUd9rt8
	InZmYx1ho/Aob4gy2AMZbBwA09XTTARNjmvzMp09kayexBKBSSu/EXSBtoIAM9B8yVsTZ9gjqDC
	Hq23qihu8mytym6yEeh0yuJl5RaagsEKAvmROz3/KT80W4H23ZCTE4L+er8Gn22GvKcdA12uMCI
	z5it/1Cm2aj4gaS9NBBc2revAu8gTe2lGjjX6461nqv9jxlnwb4inCbOFZav0sHnSxKft/f6QI3
	5FeP/RGg3UI3AObRiHBoRxBBZMPo1E20HxHBB9CfiXCpEIDmW5cVR8DA
X-Received: by 2002:a05:6a00:3a05:b0:740:9a4b:fb2a with SMTP id d2e1a72fcca58-74eb5634899mr6389840b3a.20.1752166430596;
        Thu, 10 Jul 2025 09:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRSPr0EphfUz6oNUApD5i2gJBSco9YazNRfkr6HyyRBAwDmdRRKU0prxAQ4k9j6X+8VeHj0w==
X-Received: by 2002:a05:6a00:3a05:b0:740:9a4b:fb2a with SMTP id d2e1a72fcca58-74eb5634899mr6389798b3a.20.1752166430065;
        Thu, 10 Jul 2025 09:53:50 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f98ff8sm2985645b3a.177.2025.07.10.09.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:53:49 -0700 (PDT)
Message-ID: <9bd63c0b-cf14-d00b-c600-9582061e3afc@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 22:23:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 04/10] dt-bindings: arm: Document reboot mode magic
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Andr=c3=a9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-4-b2d3b882be85@oss.qualcomm.com>
 <2d8e17ad-6bd6-47a9-b5ab-0a91689684ee@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <2d8e17ad-6bd6-47a9-b5ab-0a91689684ee@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: riH8txY3O0-KIaJCtYBk9adoqXSPpcWJ
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686ff01f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=IQD7W_zIqse-sWlNMbcA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: riH8txY3O0-KIaJCtYBk9adoqXSPpcWJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0MyBTYWx0ZWRfX23TJhqf2Y2pi
 blddj9u4t8SJavKFdc2kHLySen2FLGa8wMbi0j6P3m+ftx/4ooTBUHRxAizRyZqv4nD6EXibOqu
 yWOw3tKqMhxqx6ZO29AeO+5vmSX/T1pg2UF7IUi8aF1iDcQaVdsBiVZ6JUQfh/5A8n1PCnPTV9A
 YdkwuQrmgVai7pGqD8ZMfZAvUZaPUvBdgA/x9W2YYzVSEXDTLabowE75Ina5gAKp9h0nE9LS7JA
 1NnP8e3oRnxh3Rh4JEME3GlPhKwIJ11jQUrRT8oj9YIMLJfEsLbqWe1pN9EJDuCYDCZs76wNOK2
 CWphMO4NLB76k0/Ryxj6mnD1IgqWyzO2sswdWpQRH1smbVZwCcBeI6VOa/jc/1gUBl/G37dObWx
 cgHk3HBhaIErqX1xPtDCzXjn4LznwquoOggNP0C4frICKz2HaaNcAqku5vToHT4Eag9a4Xsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=888 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100143



On 7/10/2025 9:00 PM, Arnd Bergmann wrote:
> On Thu, Jul 10, 2025, at 11:15, Shivendra Pratap wrote:
> 
>> +  reset-types:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
> 
> The other users of the reboot-mode.yaml binding all call this
> node 'reboot-mode' instead of 'reset-types', can you change that
> here for consistency?
nvmem-reboot-mode and syscon-reboot-mode use reboot-mode in the
device tree node name.
qcom-pon does not uses reboot-mode at its device tree node name, it
uses pon.
Kept it reset-types as this patch was already reviewed earlier and
the name makes it closer to vendor-specific reset-type.
Should we make it reboot-mode? Please suggest.

thanks.
> 
>      Arnd

