Return-Path: <linux-arm-msm+bounces-52793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E87A74EC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 18:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ABD63B844D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 17:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFA11A08B1;
	Fri, 28 Mar 2025 17:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/S8T/Sb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A1D79D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 17:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743181344; cv=none; b=stDAKakBIXtx/Zx31WXKUNgJ/VvHvIDU7/h1J77AIx4mocyPtXG34skfFEBFeJnIBbhFLjoAcRw91BG3o8PidLDbwf+n1ddABaMjhSZZorOu2Nc79S+blav8QOd5Ch030YHfQ9lU70xTGIZ3vI3hlS77NnOvXwOBoWJ2eBkNkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743181344; c=relaxed/simple;
	bh=kvxvjWfgbBU+S4p0ERJAmOKQrkFFn1vNwKG2HluMuc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COUZgW7O7b5rtQLMf6bF8rjh9adV6foHp3B2j8glvELzm5uk50sfLRnQF+nVkmu4Z5IYMyvE35SJlQfPkje1nFZGJa6VDss3jiRuilmK/KhIfguIKR6sEV4FXICzhCTpfZREVkF1MMA288fTs8/RG1JmSPrULCAzQo2qNGoZCPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/S8T/Sb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743181341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hvNbFLnzJrDma9+r6dzKNIHJ4GD7qovFDxkdkK1j7ug=;
	b=M/S8T/Sb6AT0fh5KmDj+8M/JIyt8Rvrgq8DBUFLOssiPTydRm6eoutGbEZedOpyOQQdppL
	O44S3pyny6hBa9QU3cNivRN8JeVhAV6t8aONHB2hGvJgaHzBX3LRy9cZTtmjRLB6JGCi0h
	lJo3mUJRUu5ATefumRwY0bL6FdTP2rM=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-gj3PKF7jP7exd0PjIcilZQ-1; Fri, 28 Mar 2025 13:02:20 -0400
X-MC-Unique: gj3PKF7jP7exd0PjIcilZQ-1
X-Mimecast-MFC-AGG-ID: gj3PKF7jP7exd0PjIcilZQ_1743181339
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-523c33cfea8so2605218e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 10:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743181339; x=1743786139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvNbFLnzJrDma9+r6dzKNIHJ4GD7qovFDxkdkK1j7ug=;
        b=cLPqvb9eSV/l0bBf32XAe4CFElMUSC6aYElan/6JXrA+rSigaDoRIjWfyz1aE6qdZt
         5fpPGN6QQ+GG3lG2A8GpNXu69nITcEyRFPmk7O62RuaGvrRPsvvFy+IdNkIYdOYufdWF
         vn2GPE57xg4nerRB1WwVCUlUTH5OsyU63R0UuY9GRXQEPpcrYohaPltf8JRT3yCoVXcr
         b1P4bwpH+8CC68+OPB4Kl1N2oebqPjv5rbtDqnGHfkNDirAVtSf8KaT6I1/uXAEaPeNm
         qsz/nsTs6ByuNpPZMun4Th6ghZcVmJQvqVfDqOlw5x78UW6FLF+tE+WYvbHzREhc7NFZ
         DM1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcMwIWZBkGv+mCKVdPg5GKeoHI98u49QKf8p0280x1uOkg/SbmYo1+UfMska05gMH8FpiioMZIWKSRpCIv@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmCfuZvuqf+rLxQB1dsWu2rV89/85WmUQMeZcNnLXbnry0q/K
	yNITk0ZNuI22zLC7RFoOa1EjmRITgprnmYpNRH7aJ9CYdo20Xzwo4x+iSp02Ql4dQUMu454G9io
	K3vfM4uOY8Dm17OHOwoaKRd3FoYfd7o5rNT8gO4sVney4FzsdVaco+EhX7/CMP2Wdm94V6MA7EU
	lg3Pva3/FjJAOz6TIeRhuL3u41iIIKmi27FC5ZhQ==
X-Gm-Gg: ASbGnctMB0+m46WXhbGlUmvwbKE0c4DuHITFz4clh5cNfvN1O6B1FSN1Qniyf8VzIvS
	nSN5nzjxBAVuHZDDG2r3bg2kCR5SHsEgXBE50pVK7J5xZVANGsFLJGFRQv7ZoeAouKxWVIV+vyw
	==
X-Received: by 2002:a05:6122:3d0e:b0:520:4996:7cf2 with SMTP id 71dfb90a1353d-5261d4e4be8mr193236e0c.10.1743181339355;
        Fri, 28 Mar 2025 10:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd6hLtMvhq4HNYFNHxAAkTD6XavMmym8TKCPEKvHwtYxwkeFgbJc/fK471eEupFUFa7sF/zVZqhJ21ofGw1UU=
X-Received: by 2002:a05:6122:3d0e:b0:520:4996:7cf2 with SMTP id
 71dfb90a1353d-5261d4e4be8mr193156e0c.10.1743181338657; Fri, 28 Mar 2025
 10:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327081427.19693-1-johan+linaro@kernel.org> <CAJesf3M-LSS3PqGKBSzM+4SEYgRmqrVmv-kvJLYUZqqU_Vjjuw@mail.gmail.com>
In-Reply-To: <CAJesf3M-LSS3PqGKBSzM+4SEYgRmqrVmv-kvJLYUZqqU_Vjjuw@mail.gmail.com>
From: Dennis Gilmore <dgilmore@redhat.com>
Date: Fri, 28 Mar 2025 12:02:07 -0500
X-Gm-Features: AQ5f1Jpj60Hl13BHdrN6RSD_2D2y5OHb6ER9AEjwGhHIzzI5_xDfbU8zIfdpjJQ
Message-ID: <CAJesf3NhrkoE2Sip2XzKNrjVNz0HFqZZYfLLfPxk8yV=RY323g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending it as plain text so it ends up on the lists. My phone does
not allow me to send plain text emails. The modem shows up as device
ID 1eac:1007

Tested-by: Dennis Gilmore <dgilmore@redhat.com>


On Fri, Mar 28, 2025 at 7:05=E2=80=AFAM Dennis Gilmore <dgilmore@redhat.com=
> wrote:
>
> Tested-by: Dennis Gilmore <dgilmore@redhat.com>
>
> It worked fine here, the modem already exists in mhi and the fcc- unlock =
code is already upstream in ModemManager
>
> Dennis
>
> On Thu, 27 Mar 2025, 03:24 Johan Hovold, <johan+linaro@kernel.org> wrote:
>>
>> Enable PCIe5 and the SDX62 modem present on some T14s.
>>
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>> ---
>>
>> I don't have a modem in my T14s, but this is based on the work I did to
>> enable the modem on the CRD reference design and the T14s schematics.
>>
>> I'm hopping Dennis will be able to help out with testing.
>>
>> Note that we may possibly need a new entry for SDX62 in the MHI driver
>> device id table (mhi_pci_id_table) as well. The output of 'lspci -n'
>> will tell.
>>
>> Johan
>>
>>
>>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 65 +++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi=
 b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> index 962fb050c55c..8b3f715bfc0b 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> @@ -310,6 +310,22 @@ vph_pwr: regulator-vph-pwr {
>>                 regulator-boot-on;
>>         };
>>
>> +       vreg_wwan: regulator-wwan {
>> +               compatible =3D "regulator-fixed";
>> +
>> +               regulator-name =3D "VCC3B_WAN_RCM";
>> +               regulator-min-microvolt =3D <3300000>;
>> +               regulator-max-microvolt =3D <3300000>;
>> +
>> +               gpio =3D <&tlmm 221 GPIO_ACTIVE_HIGH>;
>> +               enable-active-high;
>> +
>> +               pinctrl-0 =3D <&wwan_sw_en>;
>> +               pinctrl-names =3D "default";
>> +
>> +               regulator-boot-on;
>> +       };
>> +
>>         sound {
>>                 compatible =3D "qcom,x1e80100-sndcard";
>>                 model =3D "X1E80100-LENOVO-Thinkpad-T14s";
>> @@ -1028,6 +1044,25 @@ &pcie4_phy {
>>         status =3D "okay";
>>  };
>>
>> +&pcie5 {
>> +       perst-gpios =3D <&tlmm 149 GPIO_ACTIVE_LOW>;
>> +       wake-gpios =3D <&tlmm 151 GPIO_ACTIVE_LOW>;
>> +
>> +       vddpe-3v3-supply =3D <&vreg_wwan>;
>> +
>> +       pinctrl-0 =3D <&pcie5_default>;
>> +       pinctrl-names =3D "default";
>> +
>> +       status =3D "okay";
>> +};
>> +
>> +&pcie5_phy {
>> +       vdda-phy-supply =3D <&vreg_l3i_0p8>;
>> +       vdda-pll-supply =3D <&vreg_l3e_1p2>;
>> +
>> +       status =3D "okay";
>> +};
>> +
>>  &pcie6a {
>>         perst-gpios =3D <&tlmm 152 GPIO_ACTIVE_LOW>;
>>         wake-gpios =3D <&tlmm 154 GPIO_ACTIVE_LOW>;
>> @@ -1309,6 +1344,29 @@ wake-n-pins {
>>                 };
>>         };
>>
>> +       pcie5_default: pcie5-default-state {
>> +               clkreq-n-pins {
>> +                       pins =3D "gpio150";
>> +                       function =3D "pcie5_clk";
>> +                       drive-strength =3D <2>;
>> +                       bias-pull-up;
>> +               };
>> +
>> +               perst-n-pins {
>> +                       pins =3D "gpio149";
>> +                       function =3D "gpio";
>> +                       drive-strength =3D <2>;
>> +                       bias-disable;
>> +               };
>> +
>> +               wake-n-pins {
>> +                       pins =3D "gpio151";
>> +                       function =3D "gpio";
>> +                       drive-strength =3D <2>;
>> +                       bias-pull-up;
>> +               };
>> +       };
>> +
>>         pcie6a_default: pcie6a-default-state {
>>                 clkreq-n-pins {
>>                         pins =3D "gpio153";
>> @@ -1367,6 +1425,13 @@ wcd_default: wcd-reset-n-active-state {
>>                 bias-disable;
>>                 output-low;
>>         };
>> +
>> +       wwan_sw_en: wwan-sw-en-state {
>> +               pins =3D "gpio221";
>> +               function =3D "gpio";
>> +               drive-strength =3D <4>;
>> +               bias-disable;
>> +       };
>>  };
>>
>>  &usb_1_ss0_hsphy {
>> --
>> 2.48.1
>>


--=20
Dennis Gilmore
Senior Manager Systems Enablement OpenShift Development


