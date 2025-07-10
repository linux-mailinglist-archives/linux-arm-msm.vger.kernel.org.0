Return-Path: <linux-arm-msm+bounces-64356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA196B001A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 14:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA50E1C884ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160B8253F03;
	Thu, 10 Jul 2025 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="h4y9XAzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0652550D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150336; cv=none; b=Zf4ykl2ibxww9vyQbtfRjGXNPZoQvwfAVBmjuIXAMS3e8T8ai1H8thZS8QXR2MAqWlDQ2dagtQLds+vneR2md40K+cUJZByY2sgXt5YCo2OBdw8jCfqX+UdlQlKAJg4GtVEbpceRGJJcotNrZEKsVc8/EVY+x18STJsMmH8smwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150336; c=relaxed/simple;
	bh=tXi+3udgGBPcB1usSt++Ta3sqSt9dsDiajyFn9u+th8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=XyKYpOypsQL4aB2HWk+SeGau43LVB/q8ku7pDUfOZ8VhYjNclnRF5BOp68J7fl3KTJ9z7Ett5aAhFCqfbW/Acbv4A2gf7asi4TYpWGL16Flh4qPDUaoJ8ZgxyGXnMGzTbQsmBG2+99D8xuwCdKcEQu7cytNLTyP1Nqqfz3/8Huw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=h4y9XAzU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so183225066b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752150331; x=1752755131; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xwbim7kMT0dZOrtg1YvEDqv9pTaWeBwXvEocCP4T4Us=;
        b=h4y9XAzUlMrVAxtYT67ddWP9ZrYnX8dph0zK5U2Yx9j6OsvLjVr2eRqZyWB+zZhqNf
         LL27iWm7JNub+X5pS97wxAeuphaFpX3+3tPRfSJIsLx5DGb79jIMmuI1utZPF+dnAu3K
         BHSWABLsIe6idQWsdyzMKXJO5x6yuwsOILuE03MZb7SsExndYfmw6y31hE2ceSh44o8C
         htBuOGOdYC4CAwAXpG+4zC3FucpD+hegDYDFxrMsjYaWpFdhnpwLNd6zDeOgoOzL5ZKV
         ZOHIIkEhdUg8rjfkj769g/ddK4huRso/+0N+KUfDhNLlkFR9Q7QLoGSFjt4xhcgRDFhP
         06tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150331; x=1752755131;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xwbim7kMT0dZOrtg1YvEDqv9pTaWeBwXvEocCP4T4Us=;
        b=IPM6fHVO3smmv+2XrQN2ppThiwUKkwUH5jO8H0UTClihEbUyThg9sspOnv137lls/T
         SJyoKWkdotk+uRxJsBKXUfhpebzpXHgqpaZ9l/r5id53F6f62/Atfjb9y85FvYKASquU
         6sdW5XtAGEsdhWKet+JSiTR8emf/5znzYCLdH+49fAoKOCYfSVENAAcAo1v/IA6mPsOG
         DLOaemxaPteKGb461SwJJhFdzgSXKkUXnVIRS0ENP0K6xkD6yty96gDzNixW8C4NNjCn
         OghrIyHBynHlWboJzhlUPyjV2sSvD/vLFIvMmNgznke79ULE5cIeaSbAFT99rTCIZ9xz
         n5ow==
X-Forwarded-Encrypted: i=1; AJvYcCXTK+K+RDrCbNtXdB20XWcwrA6bhrqfiukzALOlreV68D2Mm7N4/3xNdx9kSwzns9SVKzF+im8E8fK3llVk@vger.kernel.org
X-Gm-Message-State: AOJu0YyRxkG/3L7fuXlEdR4ASbIB/t9v57gwt8VNwR1GbhzVwjYAnNlX
	nnmFv4yUSEGxtqGa4erb6BaxUJazGq4u/GWNd2SN81ZUlrZ18Bh23CCh566Ui4LrNBk=
X-Gm-Gg: ASbGncuOuoUBetsewzKONAxNHzdaQByh/ZhyPxEqsMNauuH5JdT9L+OHN7hwXWWO4yJ
	M+jrGBF7kaEq0kMvH540UCjAhdkJ1vQAzvaH8oG3yh37ReGJHpujlZyBwV9UNkJ+29ovov3CCa9
	qkSbQvkmJBky5JXJuWmcxUdReHHD+vJUFKHV80nyPoqEdQhC+2/WqnmCazo6fDc+z01jFUjyTV4
	m7euNBHAmLTOH/5kRuN801p08qiRy+Vyl+EqKNaslT5CVBSXb0jHdOqriEqGVvTiveKUCMpoieo
	TYtZIm7MlIWawgIcNFQWpmlEiUauPT2l8g5U+u1M5sK7P/J0oGQT44xeGdgi8DvdErteSvKT8BS
	SmfKgTpuUG8YzzJeAlY/tPH4Zcr5ZlYA=
X-Google-Smtp-Source: AGHT+IHgPoXaBYMtzbuGf92TYy9uG1SRxa3TcJ8k4yFuiO+mhGC+1G7Z5mU03G7kTXV1yim8ZigM1Q==
X-Received: by 2002:a17:907:ea6:b0:ae4:85d:76fc with SMTP id a640c23a62f3a-ae6e70372a6mr247071066b.30.1752150330835;
        Thu, 10 Jul 2025 05:25:30 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826461esm122729266b.100.2025.07.10.05.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Jul 2025 14:25:29 +0200
Message-Id: <DB8DGDEN23D2.1GFB8XI0P3YLR@fairphone.com>
Subject: Re: [PATCH v2 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra
 register write for Milos
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Abel Vesa"
 <abel.vesa@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
 <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
 <7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com>
In-Reply-To: <7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com>

On Thu Jul 10, 2025 at 2:10 PM CEST, Konrad Dybcio wrote:
> On 7/9/25 11:18 AM, Luca Weiss wrote:
>> As per the downstream devicetree for Milos, add a register write for
>> QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".
>>=20
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> The downstream driver supports an arbitrary extra init sequence via
>> qcom,param-override-seq.
>>=20
>> volcano-usb.dtsi has the following which is implemented in this patch:
>>=20
>>     /* eUSB2 HPG version 1.0.2 update */
>>     qcom,param-override-seq =3D
>>             <0x00 0x58>;
>> ---
>>  drivers/phy/phy-snps-eusb2.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>=20
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index e232b8b4d29100b8fee9e913e2124788af09f2aa..87fc086424ba4d9fb3ce870a=
a7f7971a51d4a567 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p=
)
>>  	/* set default parameters */
>>  	qcom_eusb2_default_parameters(phy);
>> =20
>> +	if (of_device_is_compatible(p->dev.of_node, "qcom,milos-snps-eusb2-phy=
")) {
>> +		/* eUSB2 HPG version 1.0.2 update */
>> +		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
>> +		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);
>
> Said HPG asks to clear bits [7:1] on all targets

Okay, so make this unconditional and only update those bits instead of
writing the full register?

Keep the write at this location, or move the code somewhere else in the
function?

Regards
Luca

>
> Konrad


