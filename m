Return-Path: <linux-arm-msm+bounces-59457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CC5AC441B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 21:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C1B27A4DD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 19:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B33823F296;
	Mon, 26 May 2025 19:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7gBJXeT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AB616EB7C;
	Mon, 26 May 2025 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748288374; cv=none; b=m3DmurucihVxHCGSK801FSslLfautTkUj6ap2cELc/yxmfGx8V8wdIgbU9BnefryWsUyCcB7w+Om4tJmX+sNkwz9lhzNxdEypnH8fkqY1X+Xa0AIT/YU5T0GBLZuXeOjRbWNCY6QuQpn8zj004bgBjKwE2y4EG9DBZt2ZscQLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748288374; c=relaxed/simple;
	bh=bgiVxSmg0Bnf13uvCHmiOcZz/HmoVkEpUDYZdEvMf1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZ9W7oquaorPmbVuqwOQZvCe3U9kavfpbJZnybocVKunugtFwZbt8TDdDcVztLU+5ufJANm3zPqWT1B5G3gwZX1MQ+SLf/Yl/luIix8I0qdMaayMnuZs5enRdO5wwD514nwGXQCwttNBtGjLgdJDxD9aT4XY15hvz9gPOp84/5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7gBJXeT; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-604e2a2f200so1351273a12.1;
        Mon, 26 May 2025 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748288370; x=1748893170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2RuIq6eIiKbLa60hFHZFWgiqXN+9AE0rRW5XCWlrfY=;
        b=h7gBJXeT+Ss5BPdG5ivLR6aUCGirTyx3jrGCX1lBqJnaIoG6ETKk74qiI+AKyGxbpC
         tqjKF2bXC43Td7ubLVB07Hh2/mE9B3kfgOjDp5aQ+tjLuJufdfQ/ECwdmdHG+aBaPIpo
         GU8OP7AV+HeWIb+usi9+5BAfZ3jg30HmPU6dI9nmVsWWorAnqEXf+9k+igPfdon0WKL+
         4yRPxc8D5yKoDLwdZIl1EL/WhOyCwsJO/pxX4lL006ZkvMRQ3/QW5tNCPSzt2QF6uYdI
         wWTH8Ps4SjmPRRQnQIfCL9j5akfWeOb9H74auyoG1GhcQJxwPpB4j2j2Ozm6L0HQGuPW
         mdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748288370; x=1748893170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2RuIq6eIiKbLa60hFHZFWgiqXN+9AE0rRW5XCWlrfY=;
        b=GOywMbMl9GuoYcJ7b7OF73h4UOvRNCVn0AKL3M2Oflc0SQdGWxPaRTfxm/C/4vet2u
         hpqqznFbLwpQ9mV0Yj0ihZlSrEJXWZ4FAf+NNPseXxSjup1wc09wPyn256h+BtXM/Oyl
         MHLVZAdS6NzeuB6qtmaX/JB657XEZBlIt5CiqVCelcgY/C05DWJalJapY+OVelDuYmqM
         +rbpAVuuVIXAjdEnwdI6tLq7AnzqbEhxNgp9qeKByb+qjyOE2if0tGgjKLhSi22ktxVF
         gN/6iIjvjL80FIf8La2W2KxwTWkj0QfwvTnmTcWHka1K777brYqn1+4XPgEGzfcY7tQk
         /cog==
X-Forwarded-Encrypted: i=1; AJvYcCUU1BaeR3GjpIJ1U0MNZPqa8OajfABipmJmhuPom1nY6vtpUHFIcLU/aek8wsPsd2TppYcNzyF/m3XDoOCg@vger.kernel.org, AJvYcCWfQQxAk5O1+Gtt0tt6W///Js7zHK1mMziP2MRCHxCrRl9sP97ZIBKvCPc2JyDaSmZ6+4Ex6uw9@vger.kernel.org, AJvYcCXdhvfnJeLn0uilzRoDMpSiiSyjKe+TX6yDzPJAUBUwoG9FP3O20ShED+VLc38WG5xe4A4gjfKRM0rDLpd0SA==@vger.kernel.org, AJvYcCXowNuLzGbG6TdJIdctaNuyBO+Nn8NNDTIdx3NNbEy5YKAr7cTS64EgJ/d/NwBUovBqjdUKz8E7h3RQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxUBTA9K4p8yzd6s3m9A8TPIWIr38pylqbABNzI08fGJRPZAvC0
	87HMsAP3z6OJK4ez1FHhQvd7cIIgpRHkBDx7lQgbdVmviMlkaxvX5uTL1GtbWr3rZsEiLplJABV
	kDhBVIOl1504OvFAme37q+W2vcuDvoJgl+pzyTo0=
X-Gm-Gg: ASbGnctat8YqNmLW989npDHCMB6M13AA9bol/PrtoHzPwhen8F2YeICg7nG055ozMFD
	YVWP94jm7f9kFov6ozxV2W2UKBiffDbL57hME5gO98nmmJVgY9faqrXDBKtNp6xGrfpl7bxqeLv
	+PgZc44ohhdSIRdcPyLC5QJ6kMUTGqLFwi
X-Google-Smtp-Source: AGHT+IGdikKRyuFPsOFram9HpgjSfq3DcdQeONyoWx4qyBn+IFS6AMYNpH3juZ4iDFvhTsNGHARHXKc8dcoaZkMFWCo=
X-Received: by 2002:a17:907:7f8a:b0:ad5:6939:8333 with SMTP id
 a640c23a62f3a-ad85b2c5137mr871305166b.37.1748288369396; Mon, 26 May 2025
 12:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
 <20241220073540.37631-2-wojciech.slenska@gmail.com> <5bba973b-73fd-4e54-a7c9-6166ab7ed1f0@kernel.org>
 <939f55e9-3626-4643-ab3b-53557d1dc5a9@oss.qualcomm.com>
In-Reply-To: <939f55e9-3626-4643-ab3b-53557d1dc5a9@oss.qualcomm.com>
From: =?UTF-8?Q?Wojciech_Sle=C5=84ska?= <wojciech.slenska@gmail.com>
Date: Mon, 26 May 2025 21:39:17 +0200
X-Gm-Features: AX0GCFvwMn0EbpT7Bdd7v-xGA6FLAiQ0NbcoNldXJQ06_ZahLWmosrR-sRY8VfM
Message-ID: <CAMYPSMr2JCQCX69PGUk1=7=-YfBcyFDpqQ6tMQzFP040srBA7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,ipa: document qcm2290 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 23 maj 2025 o 01:30 Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> napisa=C5=82(a):
>
> On 12/21/24 9:44 PM, Krzysztof Kozlowski wrote:
> > On 20/12/2024 08:35, Wojciech Slenska wrote:
> >> Document that ipa on qcm2290 uses version 4.2, the same
> >> as sc7180.
> >>
> >> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> >> ---
> >>  Documentation/devicetree/bindings/net/qcom,ipa.yaml | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Doc=
umentation/devicetree/bindings/net/qcom,ipa.yaml
> >> index 53cae71d9957..ea44d02d1e5c 100644
> >> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> >> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> >> @@ -58,6 +58,10 @@ properties:
> >>            - enum:
> >>                - qcom,sm8650-ipa
> >>            - const: qcom,sm8550-ipa
> >> +      - items:
> >> +          - enum:
> >> +              - qcom,qcm2290-ipa
> >> +          - const: qcom,sc7180-ipa
> >>
> > We usually keep such lists between each other ordered by fallback, so
> > this should go before sm8550-fallback-list.
> >
> > With that change:
> >
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> (half a year later)
>
> I've now sent a series that resolves the issue described in the
> other branch of this thread. Feel free to pick up this binding
> Krzysztof/Rob/Kuba.
>
>
>
> Patch 2 will need an update and some prerequisite changes.
> Wojciech, you'll need:
>
> https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-0-b5d536=
291c7f@oss.qualcomm.com
> https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_mem_dts-v1-0-f7a=
a94fac1ab@oss.qualcomm.com
> https://github.com/quic-kdybcio/linux/commits/topic/ipa_qcm2290
>
> and a snippet like
>
> -----------o<-----------------------------------
>                         qcom,smem-state-names =3D "ipa-clock-enabled-vali=
d",
>                                                 "ipa-clock-enabled";
>
> +                       sram =3D <&ipa_modem_tables>;
> +
>                         status =3D "disabled";
> -----------o<-----------------------------------
>
> added to your DT change
>
> please let me know if it works with the above
>
> if you're not interested anymore or don't have the board on hand,
> I can take up your patch, preserving your authorship ofc
>
> Konrad

Hello Konrad,

I have applied your patches on top of the 6.15 kernel.
I used the following:
Konrad Dybcio: arm64: dts: qcom: qcm2290: Explicitly describe the IPA IMEM =
slice
Konrad Dybcio: dt-bindings: sram: qcom,imem: Document QCM2290 IMEM
Konrad Dybcio: net: ipa: Grab IMEM slice base/size from DTS
Konrad Dybcio: dt-bindings: net: qcom,ipa: Add sram property for
describing IMEM slice
Konrad Dybcio: dt-bindings: sram: qcom,imem: Allow modem-tables
Konrad Dybcio: net: ipa: Make the SMEM item ID constant

Two corrections were needed:
1. A small change in the DTS:
-                       reg =3D <0x0c100000 0x2a000>;
-                       ranges =3D <0x0 0x0c100000 0x2a000>;
+                       reg =3D <0 0x0c100000 0 0x2a000>;
+                       ranges =3D <0 0 0x0c100000 0x2a000>;

This was necessary because, in the original version, the following line:
ret =3D of_address_to_resource(ipa_slice_np, 0, res);
returns -22

2. I also made a small modification here, because local variables were
not used in the function call. However, this issue has already been
reported.
-       ret =3D ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size=
);
+       dev_err(dev, "ipa_imem_init %0x %0x\n", imem_base, imem_size);
+       ret =3D ipa_imem_init(ipa, imem_base, imem_size);

Results
With these corrections, everything works perfectly.
dmesg:
[    0.832180] platform 5840000.ipa: Adding to iommu group 3
[    5.798469] ipa 5840000.ipa: ipa_imem_init c123000 2000
[    5.829216] ipa 5840000.ipa: IPA driver initialized
[    5.929674] ipa 5840000.ipa: IPA driver setup completed successfully
[    8.039075] ipa 5840000.ipa: received modem starting event
[    8.374774] ipa 5840000.ipa: received modem running event

Ipa is visible in ifaces:
5: qmapmux0.0@rmnet_ipa0: <UP,LOWER_UP> mtu 1496 qdisc pfifo_fast
state UNKNOWN group default qlen 1000
    link/[519]
    inet 10.86.101.79/27 brd 10.86.101.95 scope global qmapmux0.0
       valid_lft forever preferred_lft forever
    inet6 fe80::a8dc:ccff:feb3:e683/64 scope link proto kernel_ll
       valid_lft forever preferred_lft forever

Speedtest is also working fine:
$ speedtest
...
Testing download
speed......................................................................=
..........
Download: 8.62 Mbit/s
Testing upload speed.......................................................=
...............................................
Upload: 0.42 Mbit/s

Once your changes have been integrated, I will resubmit my patches.

BR
Wojtek

