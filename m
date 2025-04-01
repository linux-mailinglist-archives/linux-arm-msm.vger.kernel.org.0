Return-Path: <linux-arm-msm+bounces-52949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD568A777CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 11:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7F433A621D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 09:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D32A1EF081;
	Tue,  1 Apr 2025 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q+/vI1Sw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BACA1E885A
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499961; cv=none; b=GQKuEL5K5hg1yN4lb9Uw9TCQgtF27joyQQrsvkzjB7Ed9rlC7aQ94t90rX+p+Neo1dPQVBRjXktMVP3zHzC6zVI4L5MnJ9y6zKuWEbN8aLJ2gSyaAy5ZLLNSfbSNqjk9ldqAnQIEqUrsD0LpfKoKbPrmezz1kNo8dIDeVs81GSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499961; c=relaxed/simple;
	bh=N1MnFFisJ8cMoy9BLzrQr7gNzud5JLemazDWM0tzY0g=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=rlqcwKC5wbnIvCwIx6FGVsS+EwMvEHk9TlBfWALZ7HTY7a7mNxodaHEQhWNnMYcesxEWMta1Y7KXhCFL1pitGd5eBiDEMNntRF/sJ/iDQibgGeob9S11VJDkPYUsd3P6eLRIEwJcWgShAMx0Mrwq8+KNrMYlttJ2Ovf7teXewiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q+/vI1Sw; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so8620469a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 02:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743499957; x=1744104757; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZBzvWcIsDBo3G9LnKcTDplA9cLCR7b0coAB89MP6E0=;
        b=Q+/vI1SwRfZWQwoY93Fy51LnPDjMgpLxg7Fx5/i/+OcCPOLJTd2S5rRZCcHmWAudRv
         q0UckMmJLRxFRPC7WUHc2fnEWhQCg3HO/sWTSFkXHnpyO/aabcc/w2tAfdirEaSMBAWQ
         STYR0fzRQpRyPgsI9SoZnWGFlatiNT7VyM1/DWCh9G4GnIOpJ3m6zWPHPES15A51UjEF
         +D/bxbOosb60o6frKyXoJOVS8mmJZZlKJcvKZOuIuS5pNffzCYzD35xPr26c/esIEKzK
         vJrBkHtJ4yCrpPZ7r1MP852RJOOoEpbScRfHMTGCVPvQQE4serwScgJ21sog3UWp0i6S
         V7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743499957; x=1744104757;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OZBzvWcIsDBo3G9LnKcTDplA9cLCR7b0coAB89MP6E0=;
        b=wSm0PLylvAHdGmFlpxGoTrAvW0b6nxLJOS+PW/9Nx3U0YwnLf3gJexkYp6ay0PweHv
         10TZ2vT6LlqJeymUKIq82NGx6OEblNsLBbY0yHezFHFfIqUuxlW1KyVMWvBehrFw2gKV
         +2AlnM3SwPGc5c0yEPorCQzHAdWR0HC8S0rEqRQd6CjQ4y/lVfQX36FDza3b0XYKPcof
         y6yGSanc+pPvsLCi4fC9pRcyC/volb7Id9wW9Ms5lIO26sGzdLRhSpvSPQDJw+MnmeuB
         KAuBZwvTFxjdISwGDd8uUAbYtII+R+KmlLjEDXL0sNeqanyHzupzrTE1E1mDqVz/KrPF
         m2mg==
X-Forwarded-Encrypted: i=1; AJvYcCXphAIuKGEBw7WkT1W5ak2qb86i6NzCwsNQn7A0pYm7ZXlRG4FJeQ8d38K8A8M29qjW7xa7iC9TSzmCfx3H@vger.kernel.org
X-Gm-Message-State: AOJu0YwJWu8E42T1GNWTLOc4xHBwrrTPY3X4BU3BgMEsD9pSDnR+glLY
	Ksf7DdWD5GikfDL+KsA4sV4Etdqd2spWPzdDY5o4iMZguH5Z2og68z4YIyRSAeM=
X-Gm-Gg: ASbGnctaXLKKX2ooP430XsBHSq5esbGk2EDF9/gG2EA6NFcZA+hTt53puZTezpKrA55
	imnAZjFW4h6RZUmsMXOuu6xSdzNZZ9ZX0vyFuNYh2Xnfl0zmRMWrWCax9EmiJV638UxW3zAjbPk
	XESRCbfsbrg9CmTUlH6I1vJ5CoIzRoezzIl2EafGbg1QAw0z8gXZlNrZ95LXA/Jdh/Q6fYPPeXo
	o7w96d3qd5aN9WgyZsIvznzAjzcQiQHUAHxFioxRVg94U4Hui1TtRvqNO1v0mTM5VeT6Xx/FPM7
	7nJfxAhsnmQRrXt3g6Qr5vuAFLWADIaKqrkU3FmnuVwklA==
X-Google-Smtp-Source: AGHT+IFiDVwfIgbHWBVxHJV1fUXGWM172/jD8Iw3qWJRy89QsLVtEytv5j6FHvB1CN3xyra++dE96w==
X-Received: by 2002:a17:907:7214:b0:ac6:d9cb:58c0 with SMTP id a640c23a62f3a-ac738b82b65mr902203166b.50.1743499957495;
        Tue, 01 Apr 2025 02:32:37 -0700 (PDT)
Received: from localhost ([41.66.98.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac78bdd54a7sm47785366b.22.2025.04.01.02.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 02:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 11:32:34 +0200
Message-Id: <D8V75HO8O4CO.33RMUJLKQ7UG5@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <lumag@kernel.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Fairphone 5 DisplayPort over USB-C support
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
 <y7dfv4mmtzkv2umvverkn6qvjt3tg7cz4jj4zsb4t6vu4heh4d@64zpkjihjc23>
In-Reply-To: <y7dfv4mmtzkv2umvverkn6qvjt3tg7cz4jj4zsb4t6vu4heh4d@64zpkjihjc23>

Hi Dmitry,

On Wed Mar 12, 2025 at 8:06 PM CET, Dmitry Baryshkov wrote:
> On Wed, Mar 12, 2025 at 01:05:07PM +0100, Luca Weiss wrote:
>> This series adds all the necessary bits to enable DisplayPort-out over
>> USB-C on Fairphone 5.
>>=20
>> There's currently a dt validation error with this, not quite sure how to
>> resolve this:
>>=20
>>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port=
:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpec=
ted)
>>           from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480=
.yaml#
>
> This comes from usb-switch.yaml, it requires that 'port' adheres to the
> /schemas/graph.yaml#/properties/port (which forbids extra properties).
> The usb-switch.yaml needs to be fixed to use port-base for that node.

Thanks, do you think the attached patch would be suitable? It does fix
the warning for me, but not sure if it's too lax or doing the wrong
thing.

diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Docume=
ntation/devicetree/bindings/usb/usb-switch.yaml
index da76118e73a5..9598c1748d35 100644
--- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -26,11 +26,15 @@ properties:
     type: boolean
=20
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     description:
       A port node to link the device to a TypeC controller for the purpose=
 of
       handling altmode muxing and orientation switching.
=20
+    patternProperties:
+      "^endpoint(@[0-9a-f]+)?$":
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:


Regards
Luca

>
>>=20
>> See also this mail plus replies:
>> * https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairph=
one.com/
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Changes in v2:
>> - Move adding "*-switch;" properties already in earlier patches
>> - Move wiring up SS USB & DP to SoC instead of being done in device
>> - Pick up tags
>> - Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0-=
e6661d38652c@fairphone.com
>>=20
>> ---
>> Luca Weiss (3):
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over =
USB-C
>>=20
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 ++++++++++++++=
+++++--
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
>>  2 files changed, 104 insertions(+), 8 deletions(-)
>> ---
>> base-commit: dcb11dc4740372cd4cce0b763a4a8ec4e9f347a6
>> change-id: 20231208-fp5-pmic-glink-dp-216b76084bee
>>=20
>> Best regards,
>> --=20
>> Luca Weiss <luca.weiss@fairphone.com>
>>=20


