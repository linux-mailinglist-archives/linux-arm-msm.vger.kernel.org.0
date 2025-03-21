Return-Path: <linux-arm-msm+bounces-52223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C748A6BF91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 17:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43B2A1B6085F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 16:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E28E14601C;
	Fri, 21 Mar 2025 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5j2g7hnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5B91D86F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 16:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573742; cv=none; b=rZUXqpIcnjMHyviCpwcH3GfoswhDdQxBUOBUZpDoTnqdA2LLe5hbPr/WPAd9DecCUb4RUWdtVYRzhUksxPf7m33+KeaSPGKAdPKlZOVupmwcbN7BChCZaQlqmvPk7M0Op/4Eiu0WCMaCFW2dV4n2hvGCgmvw7Gzwj3HYJErLmrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573742; c=relaxed/simple;
	bh=Yg6z5/0VXsbi8VLXgUTAQHCScWouUuRNuKl4guK66bY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=FuVhoLYQaT0HzQoRY2U6k7psBXfZnEt3zuh+iu8uLOKXBM9dYy9fHIGsulbxubZcmyGvCgbnxg7VE6GNo+TeT0U4CWeeM0wbej37K6oqosToj5TYyNGuqRapc5B5N1JCktlXANuq4KEbzg082tD7mcuX9zthT2ag/nBOolS6xl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5j2g7hnr; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so2870648a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 09:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742573736; x=1743178536; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbbmZVCZaVtzsaI8Jyk6RYosHIprj6Z8OLUlilWArmU=;
        b=5j2g7hnr1rysfKwb3nGoPn07azZwl5SMi1Akgx7I+L2LB1GBm/gAhXswFYTRs02aKW
         fhYQ8ykju+pOIKuLUGlikCZqvo9Q7TOc6/iGmj095yNw6/8qbR24aXluf0LQTppd9HXH
         XaAC/5feWCHEe69h2h3nq3eDizRCyQsd2CpucWgEC3f9IUN4pG8JJdtY6DT6HxhCLPtC
         aGl1O0CoPcrvHvVeXekG0Sic3SfjYKJzviXcXIcbiUoOmVCAFcZ0qI1TmoWwDjN03bF4
         /rgeVkmLPo3HPEU/WNLiI80yrl/TOT9Fq01KAKZdbOhSLV0OEaXRykIHU2uX5CtugEqo
         mp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573736; x=1743178536;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rbbmZVCZaVtzsaI8Jyk6RYosHIprj6Z8OLUlilWArmU=;
        b=eNOscVNRelOKqQpxAZVYyKBXg6AH4fmW+P1PExiByN4fsPKPYDKMToSlbT21w9l5gc
         JqqiLzJFtG1WUxswLEY2OvhHQCO3VAT02fyUcsP4+2iqtLmXmZTb5Kh0AJkuRzq0MG5C
         YXm0sn+MA/bo9CutTwFAcojMn9piGs+ZoftfOulE1O9hFUkJITVcXCpjxolhvz55tBWn
         H7zSb/tP+ZKuWUHMs1/whjtzY6EfoW7Y9EqYiFPLvSmPkBexoWlI6LMjkiBczar2tXdV
         uhiATZAcRHAtAdx2vgwW935kIPhR9kUGOb0xO2ToCKYxvWcGYPsMSZnJ+RmyAYmDqE1e
         191w==
X-Forwarded-Encrypted: i=1; AJvYcCVmMb0Kp/O1q+QZyk66SoulMUtMZesqgpk386jQg4TWGlatv21hrprcqxu/JQ8uNQvS1xneyTZ9cPKSJKNc@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMf7kyzMbM2gZCBzvMD8Au0Wrgss96TB6SXAKUgH6MxZFYaKW
	gnwsie3I9V6UiqRycAnZwm/nYexk4NRd3IRRr7AX6lWM5s+E9/lkQbdQ3e/nYvM=
X-Gm-Gg: ASbGncv7rdqJuJdDBjMvj31qJdvO2rF6pwOK0LCFvfXphkoAKRfrlFv5n0hHXh7lJ+4
	QEr30OF7JmUV0Y+u4wzGa6npBj2Ky/YvQAiOtiyDnGCtqLrgSzqh9dO2tDMviY99UFOIgXnmi6G
	TY/MOX1du/guuAjotSEVTwMjuk6QS1Nw9oxWj5lua8D7uA7BlUubwbSDHfhUZ4k7LEHOUozA6T/
	J3vXSTFE9Fj9XEz92X20seRBaFzJWPdKvYdfJzkFlWZ2C37LStT5Yh3ZjxbLiicF1885STMX3qx
	rI50QZ2c+aGJa/pnAN/Mjk6bj7jLEy/UJlMW1yJGlg5PO0Cq17+RkB2maH8eb708FhqQZuXq5fe
	zuLr6TogcWm9dRQ==
X-Google-Smtp-Source: AGHT+IGhVIiK6Neh4GkmDHq08vg4cl5Hpi3z1/z97P4bxQ0QIH0uE9xYAf14+3A3z8pwf8oACU20fw==
X-Received: by 2002:a17:907:9688:b0:ac3:3e43:f454 with SMTP id a640c23a62f3a-ac3f24b3d55mr325815166b.39.1742573735620;
        Fri, 21 Mar 2025 09:15:35 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb64952sm174608566b.105.2025.03.21.09.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 17:15:34 +0100
Message-Id: <D8M2U2EUF169.MWRPXFYRBXMM@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Taniya Das" <quic_tdas@quicinc.com>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add video clock
 controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-sm6350-videocc-v1-0-c5ce1f1483ee@fairphone.com>
 <20250321-sm6350-videocc-v1-3-c5ce1f1483ee@fairphone.com>
 <wjq7sxdc5enfu6zhp4d53mpyevzbuwm6qc73kwiu2v3v5p4zkk@mevxbzosjai5>
In-Reply-To: <wjq7sxdc5enfu6zhp4d53mpyevzbuwm6qc73kwiu2v3v5p4zkk@mevxbzosjai5>

Hi Dmitry,

On Fri Mar 21, 2025 at 4:56 PM CET, Dmitry Baryshkov wrote:
> On Fri, Mar 21, 2025 at 03:45:01PM +0100, Luca Weiss wrote:
>> Add a node for the videocc found on the SM6350 SoC.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/=
qcom/sm6350.dtsi
>> index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..ab7118b4f8f8cea56a3957e9=
df67ee1cd74820a6 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>  			};
>>  		};
>> =20
>> +		videocc: clock-controller@aaf0000 {
>> +			compatible =3D "qcom,sm6350-videocc";
>> +			reg =3D <0 0x0aaf0000 0 0x10000>;
>
> 0x0, please.

There's currently 80 cases of 0 and 20 of 0x0 in this file, is 0x0
the preferred way nowadays?

If so, shall I also change 0 to 0x0 for reg in a separate patch?

Regards
Luca

>
>> +			clocks =3D <&gcc GCC_VIDEO_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&sleep_clk>;
>> +			clock-names =3D "iface",
>> +				      "bi_tcxo",
>> +				      "sleep_clk";
>> +			#clock-cells =3D <1>;
>> +			#reset-cells =3D <1>;
>> +			#power-domain-cells =3D <1>;
>> +		};
>> +
>>  		cci0: cci@ac4a000 {
>>  			compatible =3D "qcom,sm6350-cci", "qcom,msm8996-cci";
>>  			reg =3D <0 0x0ac4a000 0 0x1000>;
>>=20
>> --=20
>> 2.49.0
>>=20


