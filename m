Return-Path: <linux-arm-msm+bounces-60743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BCBAD31EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C34C118826CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B8A28A3E1;
	Tue, 10 Jun 2025 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PAahuwat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7822172F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547644; cv=none; b=bpzzCJhCWlqPpNLYztrgyZGrK8e0nJKku50VzrQSCSAZDz1OFImnkzPsISyzCWw8sPZuPRFKHBHlpXxW+r9kq3/pvMh4Vs29OC1gBiIrkHHccVClBgBk7mkLupA9lRMo9feQrNuq3nipYPsR+BE2oKX7PQrKf6ILbkhOT/AEbAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547644; c=relaxed/simple;
	bh=P4qNKYMYQd7qLMstPICfugAtikYCJruU0i37lwRR5YY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Z11FOI3FsiptySYHbfIURDBlszzERWvymKtVwcmYVC5NPPo6E/av2MPCsAabiZrrvqXMa91+p7JQTVaQlenkDFLlyEL883LMj/yMeVsVIdNU1t2kk/RKk8rB/kuon0qVVncIIdC6w+I4vvUxNk2dDCdTqAARdgiHEzTVslHqdEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PAahuwat; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-ad574992fcaso783335866b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 02:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1749547641; x=1750152441; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeEbp6Gm80Y2xA4U7p4NRH2uge9EsjQvg8tgeLtWScE=;
        b=PAahuwatiXN1E+75I9XGdQvUHRQ5pYtaYdcsR8KqCFsv470QkvRsmIiF/B9/nPre8q
         fG02JrO4YWdOhcXQWpezDcrdpULGIxZBIK2K66tZxkwOjTmXhpUM/kNGcOkrheKWoOo7
         vVmZGuQqoCvhntiiCOKQiXiksRuK8kQjUK8Wj6F4lvXUL/t++GwakCA7/dW8viQqt6u2
         ZFnOJzEKmcYzDrE6+v+ztbXzHHlBJAy9Jq3m6kHfoIg1YLRJGJmGmKVU5xMNvQeWnN3d
         lGAzQLqyPlP/7AQlpMg9oN4Nwo3RxwVbtP8mIlvrO965zZeQ9f49wu1FVLJ61K6mie5d
         JKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547641; x=1750152441;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AeEbp6Gm80Y2xA4U7p4NRH2uge9EsjQvg8tgeLtWScE=;
        b=rZLUaeQuwzWTb+hF1TJV8K8Z7YQpZOAG7ph2twlbOpjMCkRhuqPh0pBeOghnqLYT1i
         hUZvd++74f5pCC5Z/He0QMEaVEcoKfnsAg1nAsxgnAHoYNp0VIXTOM7yYM13tbEuvvZW
         VWu24eIoybgzI/peqiwRf+OwVzyYhZWxy+atlhYl0AF/HwR2635L/NIk7R5OpBUc9pcm
         ag6F3l+hpSc+M6K40jROcx1J5T80UkY2HVbI1eu9tcuXQ7GPe4S0OjmQOsJZO70u9QCx
         yW0gv99StpRBDymq5T7xgK3dDw80vlMtml1EFNNthlZ/T5tqwgQw4ZQUDW4prF2rJcUf
         eE+A==
X-Forwarded-Encrypted: i=1; AJvYcCWiDPbYmBV4Bvd7d7s2yQkIKLONvVrEldo65lz7toHIhraF7a/G/m+udh5xsN8Ka8v1h1/uzLs3uCnBNVDJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5RZ870s8cj7v5SizyD7ddv8SsBN+nk8cL1oOUYaKQFjL4tN9k
	gDIm5djjCdv9LfGW0gnXhfjS9siqg9ZrvH7AIeWTUMxUczSpBhQgMldQ7JXhT3xfUfk=
X-Gm-Gg: ASbGncucnugB3wJpN3/wC+n82vkYsKLaE0t26LhcbVKZBA4SmGNWQGB3ZUlcDYj+vnW
	g8fKaVzB2MfTJzfnaBViMlLI5HWWDR/tYpi7UkbFC0IW2I6r+wQrniD0ot9xfA1JhJOaX7ZZ1yS
	2UK0wwrt4DZtkhIwLnOhQNzdagYECGGfzBvEmBswqjfPz8I3Z/GRglrJAsdWUgDg2Vrn83wD+6E
	OVvQmMPgJunhEWkN0oYuu2XNSpwDocmAVOe062BPQMAzHzNVXSV+Bj7vpxTDc3be1HUCRIZOlmi
	eDppNUw6CJ8U0eRvK9BGu1f46PIS7PT2VKW6cYyShRTE0K8wkIZ7PWfXg17nbcT7ExJ9TcGj2xe
	9sSmSEYJ1LeMBXQfedFs5A+6+VekB87g=
X-Google-Smtp-Source: AGHT+IEdYnXS+bPwfn+SKA9Tzp8XBT0Y+gshkASBWPpQkaRkgexqlj88PwmcmosZG1sajuE1IZOlTg==
X-Received: by 2002:a17:907:fdca:b0:ad5:61fb:265 with SMTP id a640c23a62f3a-ade1aa06c69mr1477466266b.47.1749547640612;
        Tue, 10 Jun 2025 02:27:20 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db557d1sm696297866b.50.2025.06.10.02.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 11:27:19 +0200
Message-Id: <DAIQVM2164NF.35T50MSWTTQWG@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Taniya Das"
 <quic_tdas@quicinc.com>, "Jagadeesh Kona" <quic_jkona@quicinc.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
 <1c09fee5-9626-4540-83fb-6d90db2ce595@oss.qualcomm.com>
 <9eb6dfd7-2716-4150-9392-98e26892d82d@quicinc.com>
 <e3dda8bf-e19e-4dde-83a4-7876ca81e5e6@oss.qualcomm.com>
 <69fba227-ed47-4004-9451-777ca19b687f@quicinc.com>
 <cfa4003c-e8b0-40f6-821d-07f8d44752af@oss.qualcomm.com>
 <0db798bf-04b3-40b5-af90-7dda5b606727@quicinc.com>
 <702ba6b2-b84d-41e0-aedf-747535d6ab32@oss.qualcomm.com>
In-Reply-To: <702ba6b2-b84d-41e0-aedf-747535d6ab32@oss.qualcomm.com>

Hi Konrad and all,

On Tue Apr 15, 2025 at 11:13 AM CEST, Konrad Dybcio wrote:
> On 4/15/25 6:05 AM, Taniya Das wrote:
>>=20
>>=20
>> On 4/12/2025 12:56 AM, Konrad Dybcio wrote:
>>> On 4/11/25 1:37 PM, Jagadeesh Kona wrote:
>>>>
>>>>
>>>> On 4/11/2025 2:42 PM, Konrad Dybcio wrote:
>>>>> On 4/11/25 9:15 AM, Jagadeesh Kona wrote:
>>>>>>
>>>>>>
>>>>>> On 4/1/2025 10:03 PM, Konrad Dybcio wrote:
>>>>>>> On 3/24/25 9:41 AM, Luca Weiss wrote:
>>>>>>>> Add a node for the videocc found on the SM6350 SoC.
>>>>>>>>
>>>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>>>> ---
>>>>>>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>>>>>>>  1 file changed, 14 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boo=
t/dts/qcom/sm6350.dtsi
>>>>>>>> index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a0=
50a8654d54dae2d06c220c 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>>>>>>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>>>>>>>  			};
>>>>>>>>  		};
>>>>>>>> =20
>>>>>>>> +		videocc: clock-controller@aaf0000 {
>>>>>>>> +			compatible =3D "qcom,sm6350-videocc";
>>>>>>>> +			reg =3D <0x0 0x0aaf0000 0x0 0x10000>;
>>>>>>>> +			clocks =3D <&gcc GCC_VIDEO_AHB_CLK>,
>>>>>>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>>>>>>> +				 <&sleep_clk>;
>>>>>>>> +			clock-names =3D "iface",
>>>>>>>> +				      "bi_tcxo",
>>>>>>>> +				      "sleep_clk";
>>>>>>>> +			#clock-cells =3D <1>;
>>>>>>>> +			#reset-cells =3D <1>;
>>>>>>>> +			#power-domain-cells =3D <1>;
>>>>>>>> +		};
>>>>>>>
>>>>>>> You'll probably want to hook up some additional power domains here,=
 see
>>>>>>>
>>>>>>> https://lore.kernel.org/linux-arm-msm/20250327-videocc-pll-multi-pd=
-voting-v3-0-895fafd62627@quicinc.com/
>>>>>>>
>>>>>>
>>>>>> On SM6350, videocc doesn't need multiple power domains at HW level, =
it is only on CX rail which would be ON
>>>>>> when system is active, hence power-domains are not mandatory here.
>>>>>
>>>>> 6350 doesn't have either MMCX nor a split MX - shouldn't both normal
>>>>> CX and MX be in there?
>>>>>
>>>>
>>>> All clocks & GDSC's of SM6350 videocc are only on CX rail, so it requi=
res only CX power domain. But when HLOS
>>>> is active, CX rail will be ON and operate at a level above retention, =
which is sufficient for videocc to operate.
>>>> Hence clock driver don't need to explicitly vote on CX rail.
>>>>
>>>> The same is not true for other rails like MMCX and Split MX(MXC), henc=
e clock drivers had to explicitly vote on
>>>> those rails.
>>>
>>> I'm worried about MX being undervolted for higher OPPs
>>>
>>=20
>> From a videocc PoV there is no requirement of Mx on SM6350. The CX
>> levels would be taken care by Video SW driver from their defined OPP. Mx
>> at system level would be catered via the BW votes.
>
> So I'm specifically thinking about the videocc (and other) PLLs, which
> have defined vdd levels downstream - currently we're relying on random
> luck rather than ensuring each one of them has its requirements fulfilled

Any further comments than this? Not sure how to proceed.

Regards
Luca

