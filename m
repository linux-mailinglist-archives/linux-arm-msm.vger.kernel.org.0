Return-Path: <linux-arm-msm+bounces-63991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB9AFC5AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C09733A5898
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2E520B215;
	Tue,  8 Jul 2025 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hfeHRS9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA21298241
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963499; cv=none; b=nxapoaHLpCRooOamnSjP9ZgmOEW43WnbvS9uGbX3PwdtXTryj/rp//EQn85YpNSezOIDFTIiy1d45dH3RZRXNcD5IXCc02Ll2O7LJOasQg93HUhH3N+5OTGkkp1K/AYUSPvrDQ9pKTxr/6mbUntFX1CCy2i/mDQA/pTLlOT1VKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963499; c=relaxed/simple;
	bh=K3aWinX3PVP5Yiw5FQcueQIu4e5wbM0J5reriCTyZ+o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XklOvBLJPVGJbw8DtDOC2PDWLMRYt5MOgfDuTYIZ++L61f5s93A1f3Rl9D0IiHYMW5obgpNnmhCUU4AfAnrP5FeMpJ2TPCl0AstAZgmCe/9YeG6cjBw7QG+u0s1P3wi2izLKES8dhensfME3kNXbv0SQWnBicqpxYE/pOhTn8Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hfeHRS9d; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso6038474a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 01:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751963496; x=1752568296; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbTxGbzVn5eaG424GOYCdjKTORbkvUlYm6kHb9cg2Nc=;
        b=hfeHRS9dK9JfXpGVTfJ/jpmzUIVAlVCFao0McWDCEeiincK6aPJK3W3LW4ysxYmDZc
         DL6iGUeJh48HCFckeLUIb5GqFrM02A/EPJF8fsC8yKouxTSFvTdaQi5YZ6N94MHbRmnK
         ksjLMuyXURlxQvomm0dyyRvLDityalJU2IgRugf47m/vaF4hfhDdAmIOu1wYqBO+wT4z
         NIeNlXdmeBY7p95Dk9f4DEEIpEZ2jRq5vNYhwBZsNLadYI1nLjEUbDYoquWI5XPi796H
         R3MbMClpgzoiiy7BQZ33vuW0lbQN5YTIOCrWrZBaP7/vCjvxr/w+dF3Cy/n8R+Ny7bPu
         MONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963496; x=1752568296;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SbTxGbzVn5eaG424GOYCdjKTORbkvUlYm6kHb9cg2Nc=;
        b=jurSN/YORIcpuVfK7H3gWYNuYE7yBill6KaQc2TUaG6eOVvu0CGuY2p3wRcUPVAPVb
         9VDsTpBnyC67Wz7J9lBnOwBeDVDN32Nu5+mFLLkzgVipIapuz4GWPYvsWdGEKqAFviTO
         9wZsQWWJQSh9iin1sDNto8yfQM4s04dJvp+0n32swexaFE6BF7/XJgfg/7z5IzkRekOP
         REa1714f7S1WMP5QD2Bgg9VBjuX+KxJ7lyO7P2Ndr3/jCXEsdBv4q6jS3K8rriRKuT0Y
         L4+PshhROQxiOr7ewa1ZjhrZZlnrx6KnOL3qFbbH1DXAA/la6w8HdGVez9SJSIadrDko
         kUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeRNXNlgtS+dSB6xmsIcvcQ1oFQ1Mji665NPW9fJR6if7AJtunuCEUOm22zA7hREXdSf+aCU6O8WT+QwKU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt4Ezw7yq+9n7T1j2QjMrxUWH3SO+BTDFqYzeLWOvaQiGlptVe
	++wNJtQPeUuNE3kz4R1v/r17ZNCh6od7tHE+ibRoMaM/Se1Y9Ek5sVSijHjYuoOJRNE=
X-Gm-Gg: ASbGncsCWEjruVbE9ue7ouEHiqZrjnhSTFOs3LQHyFbbRQf7xNBBOteSdOKbOA7Gok8
	FAaV5pR6QhFwrjE48HmgYCo5+RnKZ9J8cHd0ncTNMBfVoWIOFjvpgS4vMgZ6f9mEMDE3VX4Vyqn
	pGuBnnICB/1g2JBf0TEGMPSrDMxq1qM4JhQpxcngqsUmq2kDkV+fDgvWKjt15+zEPjKgR69AeO4
	K8RdqDNdOeQ8aTt+gZolq8Ausvnrbg98g9hSWbKD8I/gAQJBgUHkD+kfT27sUKUlCr7V86v2zAx
	OfqKwXzxeqfNyefoj6n19PgwMJ0Uqjmjhu8vlqYV1DRjw0xXgftar2GpxGXHbGFax1kyOugGKQ3
	FyUwtXsi3LLhnOzuLtpP6z/apkazsD9g=
X-Google-Smtp-Source: AGHT+IEm2XH/j6x08TGpkx5iGujBffEeCcav0ZoSdLi8Q5WO8Z9zekT2MKuOG8WCqq09Q57awzXAMw==
X-Received: by 2002:a17:907:6d22:b0:ade:6e3:7c4 with SMTP id a640c23a62f3a-ae6b058b82bmr218443366b.23.1751963495784;
        Tue, 08 Jul 2025 01:31:35 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e785sm840185766b.155.2025.07.08.01.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 01:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 10:31:35 +0200
Message-Id: <DB6J86NHFTNT.31MFYDTZ6B4O0@fairphone.com>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Kishon Vijay Abraham I"
 <kishon@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Abel Vesa"
 <abel.vesa@linaro.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: phy: qcom,snps-eusb2-repeater:
 Document qcom,tune-res-fsdif
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-1-19d85541eb4c@fairphone.com>
 <20250708-unicorn-of-ancient-excellence-e8945c@krzk-bin>
 <20250708-stoic-slim-bison-ac55ee@krzk-bin>
In-Reply-To: <20250708-stoic-slim-bison-ac55ee@krzk-bin>

On Tue Jul 8, 2025 at 10:21 AM CEST, Krzysztof Kozlowski wrote:
> On Tue, Jul 08, 2025 at 10:13:24AM +0200, Krzysztof Kozlowski wrote:
>> On Wed, Jun 25, 2025 at 11:14:56AM +0200, Luca Weiss wrote:
>> > Document the FS Differential TX Output Resistance Tuning value found o=
n
>> > the eUSB2 repeater on Qualcomm PMICs.
>> >=20
>> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> > ---
>> >  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml |=
 6 ++++++
>> >  1 file changed, 6 insertions(+)
>> >=20
>> > diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-rep=
eater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater=
.yaml
>> > index 27f064a71c9fb8cb60e8333fb285f0510a4af94f..6bfd11657e299273599806=
3b3ca390e04a03930d 100644
>> > --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.y=
aml
>> > +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.y=
aml
>> > @@ -52,6 +52,12 @@ properties:
>> >      minimum: 0
>> >      maximum: 7
>> > =20
>> > +  qcom,tune-res-fsdif:
>> > +    $ref: /schemas/types.yaml#/definitions/uint8
>> > +    description: FS Differential TX Output Resistance Tuning
>>=20
>> Resistance is in Ohms, tuning could be in dB, so I wonder what are the
>> actual units here. Neither commit msg nor this description helps me to
>> understand that.
>
> I checked and the values are in Ohms.

Yes it's Ohms but not 0x00 =3D 0 ohms, and it's also an offset in ohms
from the nominal value according to the Hardware Register Description I
have, e.g. 0x7 =3D -12.1ohm from the default

I can try and create bindings using these Ohm offset values, I didn't
worry about it too much since the other tuning values in these bindings
are also just register values, presumably from before Konrad had access
to the docs.

Regards
Luca

>
> Best regards,
> Krzysztof


