Return-Path: <linux-arm-msm+bounces-74134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B5BB885A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 10:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E2831BC5A41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 08:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F093054DE;
	Fri, 19 Sep 2025 08:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YJBB1iDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D01304BAB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758269542; cv=none; b=TMct57vVqhOHA1o2AVXSZY4JMqfdtzzT05fRG2KN3SVkuVQweNsAKY5gtFpyzY4xg/LkRGBUM8XadwUVmx3ns63xOF3GJtxMcWuTGJQNbmadjHYK4ZM6lfigvr78gwCBhMFTtyYOzMmz4Vzn2xYMZg40OqPqk8AkDqSoGST2u8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758269542; c=relaxed/simple;
	bh=NpaY/s4HIMDt0+2Bxnt8uJctQlICgEp1j3rKlIvDyLQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BN2qFI5jXTUmaMUbrOnS0cU4g0jHNAj+/jIdlkiQ3c2e1JMJsUQbTyps5aMi5UwwzPNcptq4l+P0H82fax3OaVy1TFdjQiBpy2/dGxz5PcOwUL/9XJuA7GJJUsFZLEKFah94Y2oMJuqf2WaRg42lkkS+6hRGiZAcid4d8K4citQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YJBB1iDZ; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b246eee7153so115686866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758269539; x=1758874339; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpaY/s4HIMDt0+2Bxnt8uJctQlICgEp1j3rKlIvDyLQ=;
        b=YJBB1iDZ2SM/3fNTx+cKBUR2i3rVdSHcZQhcVOc1zml7yyFnwsG0wVbwtYUdJwiyR8
         meRFgoRJiFhqJn5lbG1V8ayujsMpvqErsq29EiWUXCFSqAJ9TRqEZ/cHTtL/Uq1IsET9
         pFB89G2kRXutIzdLi35DWtXcnZGuBSO4P4fC3sHteLK7ubTeFS339Yu40ZY89Nckj7KG
         lrkqBiSxw6EyFPcU9IrRPyaClQLfPTi710tAxkBySmh2HWH7C14f/YREbthmwZZVUJT5
         3jSBcypiUAXvqeXaISKYpAjFrTUFLXauCYnCp4IQ2oZn6RAT1ctCuJ2cPXoC9IuJKBJk
         MucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758269539; x=1758874339;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NpaY/s4HIMDt0+2Bxnt8uJctQlICgEp1j3rKlIvDyLQ=;
        b=dMZ4J/pQGd6eiaihHQbQoOgLdvnYWdkgbyCpZRNUDFWOp6JIHF4dYjB7DK5eJFuGgX
         kGSQNmO/NAwJYHw92u6O9WRZ9pY6icTvjHDjHGiDfcqkfDYH/eOCweiUrpO6nvMgVE5A
         oe1+8kTWCpvvbia7VjmVrJvMBaJqKGkrFVO9c4wO+wt3+4NB+fv40H3D1Tu38qFeOctB
         ZwFPE6lVz8rGAgr1KFs3jGkVkkk+2J22X23rfUl3V/ITIdMolc37Xn8suYQQBQNye7PQ
         FMFYF7fSi6xU5E2Ay8N2Rg+ZdmzDxwwDZ+uNVGccSNnXtxEXchh1yqBgE2L+ilw2vd1C
         s0QQ==
X-Gm-Message-State: AOJu0YxalAPFRehvIJ8cnIOAvS/7Go3krMcvm+CpNrqXFgZoGSfpZop8
	TZEeWY06TiZqYWo1uy4qsbsq2WQ0jYUOrdYRje7HjeA6FkVOcpvTvN0/YLL61ELlVac=
X-Gm-Gg: ASbGncsjRkfBdH8IS4Ur/cVNtaReAAz8tCyfjibZkDqKQ+CzpMkq+K4wa1lYsnblDYv
	hT69TqleQ3B2pn/bQe4UjH29xGjmx0J53Tq3PVkbfYt4TMo3CmJ6oadLPCfrGK4zfuiK6pSbJ5a
	GPlDeZEkSAGimWLvz9tuyGxdyhzToqIytryGa6jHNoaAx2SLT9kY7+Ao1Fh92hcvUQ5a2edTOZQ
	/vqsdg7SFTN5MCu6yMvi5uTHQIkHoJGNd6WQIFzZ3Q1pvFM1tWgzj1nDyn1gfuQvsRe0wXdfYNe
	aogvhWrrlcyCHHUDTDuYQzrduIc3OR4/fvrgQd2acJh8V6QmAJ8XgbB3oIu0AVV8y9up9dx7M/6
	d1e7eBCco0LDcb5ULwD41MSFVYCJalACm6LiUktYroT5GAKc8H9ifMzs4hp7cBJV86VoE
X-Google-Smtp-Source: AGHT+IGH2L5Cs1Yr4IicnBQLWLPnN2LIXEqc14EimrkOsvHCK05Z8Mf+Sxf46z58s1gpwiushS71dw==
X-Received: by 2002:a17:907:849:b0:b0e:8cd4:e2e8 with SMTP id a640c23a62f3a-b24eedc3122mr252009466b.17.1758269539368;
        Fri, 19 Sep 2025 01:12:19 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fcfe88d79sm378700866b.65.2025.09.19.01.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 01:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Sep 2025 10:12:18 +0200
Message-Id: <DCWMJ6YDI2GA.EKTOE6UN9HNQ@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: Fix typo of
 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Joel Selvaraj" <foss@joelselvaraj.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Tamura Dai" <kirinode0@gmail.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Joel Selvaraj" <joelselvaraj.oss@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <4ae418ec-5b84-40b5-b47f-ee2e988d7e99@joelselvaraj.com>
In-Reply-To: <4ae418ec-5b84-40b5-b47f-ee2e988d7e99@joelselvaraj.com>

On Fri Sep 19, 2025 at 8:23 AM CEST, Joel Selvaraj wrote:
> Hi Luca Weiss and Tamura Dai,
>
> On 9/12/25 02:24, Luca Weiss wrote:
>> Hi Tamura,
>>=20
>> On Fri Sep 12, 2025 at 9:01 AM CEST, Tamura Dai wrote:
>>> The bug is a typo in the compatible string for the touchscreen node.
>>> According to Documentation/devicetree/bindings/input/touchscreen/edt-ft=
5x06.yaml,
>>> the correct compatible is "focaltech,ft8719", but the device tree used
>>> "focaltech,fts8719".
>>=20
>> +Joel
>>=20
>> I don't think this patch is really correct, in the sdm845-mainline fork
>> there's a different commit which has some more changes to make the
>> touchscreen work:
>>=20
>> https://gitlab.com/sdm845-mainline/linux/-/commit/2ca76ac2e046158814b043=
fd4e37949014930d70
>
> Yes, this patch is not correct. My commit from the gitlab repo is the=20
> correct one. But I personally don't have the shiftmq6 device to smoke=20
> test before sending the patch. That's why I was hesitant to send it=20
> upstream. I have now requested someone to confirm if the touchscreen=20
> works with my gitlab commit. If if its all good, I will send the correct=
=20
> patch later.

Hi,

As written on Matrix I've confirmed the patch you linked works on v6.16.

Regards
Luca

>
> Regards,
> Joel


