Return-Path: <linux-arm-msm+bounces-47027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 278CFA2A779
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 12:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 049431884BBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 11:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABC82288F0;
	Thu,  6 Feb 2025 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzsM3LvD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9FF209F3F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841458; cv=none; b=KwhRewf3aZ/dJDOmT7RT57u493XX8mUfm8qeDujtP6xjC3XW5XxQfWLgG1Uz3S4TkoFx+onFKg9VSphOxWKN5BBVDpzH9FHTjH9A5TtT55TIfxn24u/UiZPvEXZ7FtA+nZEC0XZd9CZiwaUGLKme+c/Fqb8jjv8HOmHknIDdYgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841458; c=relaxed/simple;
	bh=+kJFybMU29i1ocNVrjOt1XzKDp4dKUhYjmoAXiIMHSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hbm13VpVl4Vo4fEwzIcH759iYAbCJrOcbaAOrCZOOjObM/Y1hkdLQ/FhV85sdKVN6ZvnCho7bgcZPbMlkWQOKmUHONInLtLRH/TyWgXiRRsaFvPabDVpiHk32BYeHmnn/qIv/3H2zHeVXZvXIN3BBxpVDIJv3XiArksa/LydMHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzsM3LvD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516A3dth017736
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Feb 2025 11:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdjlky8vQqWoR/DClvLfxcIIKQztp9TSGwGX4STpaG0=; b=HzsM3LvDlfRhLbwv
	YT0GiyN1s7fwuW6yK+lAI2PeWbfEcyHUk1GwMuAOnHO8a5du8BUfsZIXB6dPZCXN
	elZG4t2OnnoUEDCbp9acHMr9veBls2GraxUupra2+M7TTQafdK1y6fbywetrXSbK
	uOZXHAHjO1tSFstFB7hfo8Q69UR1otyzTyFOntRxxg5Sc1mIeYXiTrPMFtK4mnTg
	BB4bNjEB63OcpcIeW7WkhCQZQErw0FjG/M/GbVV3+wFCjifaFVOr8AdqhVLOS++h
	AmCVirRH7ueJp9NW70hoGLoshXa5gohWyRYoj/Y3KxEYpckbin5cYyM3TOjjFOI2
	26N6tw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mu0dr6qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 11:30:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-46b3359e6deso2579161cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 03:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738841454; x=1739446254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdjlky8vQqWoR/DClvLfxcIIKQztp9TSGwGX4STpaG0=;
        b=sPbLWJ2o3TrNrOBuxycoW9kcFKjLFoG/YoeeyOkLNJOIXuKYkb4uT+7pQzfYIVzAB7
         AICo4pBucmVxqmgEx7jsPS7Vz/SfyPsML2U4b/a9aGdvKuKpcWrf6ErwxLRExk58pP+d
         8rp/TEYUMAiVkGiptyMN/EiY/31hiC0oK8vd8P4wnbgRj9K499nOvahoA0F70n7nUjoE
         VuHFe5vp3GiUyj84FIWmHinYhtQEdcCEJ+FkYQ7aXRE0IOgbGGNsCwSTBKwsAe11VS+4
         GteFMgrQA6DVZiHNK4aV+33qg5NxLdMYIAKCDQthZiQPrf2VWg3RlFo5MfIzcCL9mwL7
         Ovww==
X-Forwarded-Encrypted: i=1; AJvYcCXO+rSMeM3V36QTvUT28p8rjlytXXE0Uaskc0+IFfYsCVeYG3ghoSmUnbRMWCwjA68hnRmRLbD/NaZgiYDS@vger.kernel.org
X-Gm-Message-State: AOJu0YxwOxx9OvUErYn1fJKRHGpwL+VkmNSDMdgQvDkjrhWaxgZNF488
	eVybDSRI/vBtXh7ZzZjP8RezypZihOtZVVrKfv0HuTDPTLuFkeAZ4yWrspWm89tuFa/YgPBwfrU
	Rg6S7p2ikuZ1ApELgTJQYdPIA61hO3LE4Bg+UoLjGbgQ8zr1MLqh760QeXMGVUAgz
X-Gm-Gg: ASbGncu7t7jOtHfAARgC9J4nm11EfZlx7EsuNsdWOcpic0Ksinzfy4qtADEOYQ7hQho
	1PSbAEkOasPgEacYeJOuKWPTdXY9Uin4hCnkAwO5QnL3wY5oZFSZ+NDpipgDWDH74yyzzksNcyd
	05L9jIH6lLUXBO7Mqyj5X5whzgJaKYN3GMdZ7wmiiALKOmNhy6vy/P76LFYQsQ/jdkClxOnpy2G
	Xi9zCCn02kQQIxmrEC/eFz6nmWVxyJ3YBpAOBeJN6TcvrjK/bvSv35ZSRaj4zSEZBbV+89NuIbW
	aYxayxb0AXoFRSQXmXyNAWI9tX3C3iTMZ+vhq2r2YrHKIaVFwRc275HPOjQ=
X-Received: by 2002:a05:622a:14ce:b0:464:889f:a41e with SMTP id d75a77b69052e-470281879a6mr35208431cf.1.1738841454357;
        Thu, 06 Feb 2025 03:30:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkpfa+4IQFCPrfzSK+M4AEnSEY06jPWO2IJilWAzgSn6R+5ZMyekAr2oFw0CAA6OD5gd6Fdg==
X-Received: by 2002:a05:622a:14ce:b0:464:889f:a41e with SMTP id d75a77b69052e-470281879a6mr35208281cf.1.1738841453750;
        Thu, 06 Feb 2025 03:30:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77365ff55sm84490166b.181.2025.02.06.03.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 03:30:53 -0800 (PST)
Message-ID: <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 12:30:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Stephen Boyd <swboyd@chromium.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
        Pin-yen Lin <treapking@chromium.org>
References: <20250205233016.1600517-1-swboyd@chromium.org>
 <20250205233016.1600517-2-swboyd@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250205233016.1600517-2-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uSCLuot14HK-CycC5UVUjAXL8JTfzyJg
X-Proofpoint-ORIG-GUID: uSCLuot14HK-CycC5UVUjAXL8JTfzyJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060095

On 6.02.2025 12:30 AM, Stephen Boyd wrote:
> Describe the set of pins used to connect the detachable keyboard on
> detachable ChromeOS devices. The set of pins is called the "pogo pins".
> It's basically USB 2.0 with an extra pin for base detection. We expect
> to find a keyboard on the other side of this connector with a specific
> vid/pid, so describe that as a child device at the port of the usb
> device connected upstream.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../chrome/google,pogo-pin-connector.yaml     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> new file mode 100644
> index 000000000000..622e171b6b08
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/chrome/google,pogo-pin-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Pogo Pin Connector

This looks like a very generic piece of hw.. many boards (esp. convertibles)
do the same thing, with 4 or 5 pins on the bottom of the device.

But of course hw manufacturers being hw manufacturers, many different kinds
of signals go through such connectors - if it's not USB then it's perhaps
I2C or some variation thereof

IMO, we could perhaps add this to usb-connector.yaml as "usb-custom-connector"
or so

Konrad

