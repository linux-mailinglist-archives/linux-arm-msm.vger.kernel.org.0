Return-Path: <linux-arm-msm+bounces-38982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3F9D780D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 21:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0074C16307A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 20:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76E7136658;
	Sun, 24 Nov 2024 20:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="oq3J4W5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96036C;
	Sun, 24 Nov 2024 20:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732479151; cv=none; b=dHT1IAw2X+uKUG9hHIy3cZHKHkH1pjuXAT5GTxO5rlv67bZFKPIMaXt1BUjhPmBuQ8Yq2b9+FqD/u5CEe4aI7QVJsK1jkkHeZU6QIS0f10uQyUOIUGVVzlqeiwpAxIyPoFyurBWw/zoTWidc9/6+O5O2vmrdPgRWsanI3Xr/zPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732479151; c=relaxed/simple;
	bh=ynqyixvm2rjUp9IOH82m4L0Ic1fb+euGKq6l6ona/zY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CyEMUYv6SYP+H4hUb5cp+TY9WDiA9BILFfUJtFuyT6rwLSFV04IrmExIynd9/PeVfK4LgevJfyilWvpVWExrNAr6ct0twL1eHiOoPfxHrjDIX7C5XvXOG06/q64b3YQV2WBkA8qjH9jbGjlyg2DxcjzCGdo8gcmDwY/Bgp35g5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=oq3J4W5D; arc=none smtp.client-ip=217.72.192.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1732479139; x=1733083939;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=ynqyixvm2rjUp9IOH82m4L0Ic1fb+euGKq6l6ona/zY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oq3J4W5D1gmqjCBarmwEU9Rk9o3lSke6G6Fe1i40xbdKxRDLS8PsZCMX3woyV+hC
	 An9vk9uUbJ7GPbvarGczRh4uJq0eZFc1emsvI00LAsy9tvecQrjYZMI5wpPcgPxsT
	 BAh2V1gORj29+vJYJCtMzE9yuttwAZWLe4fKIMe5+vaUg3aDYItNaO2VlSWz4LhOF
	 SgttJA661Mj+WvGnQV3R10RaIYCTzIOVvLBugjoxrhMDS68LunW9Nl96qJ2GaQuw9
	 VAKsOMsm8A3L82w89AyMxjZbjGJZr1up4dHyuCtJnagMTqvCTggiw738m1XaeHvv1
	 4zDn2wgGB4s/wDQHZg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MXYAj-1tDVBQ0uJ5-00OiAI; Sun, 24 Nov 2024 20:58:15 +0100
Message-ID: <0455ab38-fd58-4b93-9656-5745c2f62f89@oldschoolsolutions.biz>
Date: Sun, 24 Nov 2024 20:58:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook
 X Laptop 14
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kalle Valo <kvalo@kernel.org>, David Airlie <airlied@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
 <20241124-hp-omnibook-x14-v1-4-e4262f0254fa@oldschoolsolutions.biz>
 <0b4db909-6029-40e6-8e1d-a7ecdc731b25@quicinc.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <0b4db909-6029-40e6-8e1d-a7ecdc731b25@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LaIDgpAhSCbFpwAaThtHz90n64aey9SlwaHk0+mqX/KFMT6ppV5
 FqkGHIcjwYtnASxdeuABOrVF6ZeyCdU9BDIlGhnv83yiZeNluPeWv0KRyM0Ncdf5L9/64JE
 tdhOtJmComQGYwL38Lm0SuxkTxHmNga2gT7dsgjVNk+jrA/IOdapLnOEO+sn5oJ9vxxWsVn
 UUwLDExljqSQotxMEYRHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mkB2p6G99c0=;wxgmyBo2+zCMAptP7a+gEhTrgnt
 zcbz/mLa/k0sRzL4qWqqh7xl3xcBO6sDStN2mHEUNgQ46+L8QwrrDCc+okdMyEz+vwR43rzie
 /9XNRQuWdj3z2rbUL4PaZpHyQU88mJ+cEhzdh0SVBj9oCTzF6O4Yj7phd4CErOk3Um9KO+Gyb
 UajfoJ4twLU+UJdis9/bpABf6dTm4HCn2qmTQralMTwh2NQ4XIACCnvnNE7GtWDPYIJ3BfB1n
 0cvbDgsz8kS7kPDaDgaXATJfz2yijgYCd7xCCNy9XoPa2ufoz3ZEYnfoPJiVS1g3CVzwtx1jy
 kBQeqVLfUcoU6B3kXo22GXBctp72o2T3h0U8sdf0zTF4P9dTUarBEjSK4ziaqlYdYPwPrf301
 jineSDoMsg8lgrR0n2aOXA2k7FvkechHLP5iu2qkPheXJcfoKVnxYtBlab6ps0WkAue0yB0Bh
 0vaYJxMS/W5waMWZR3oEkqomcoFKdniYvSS0y/zNzdpdmsq9pwnvVtQ1LS3nV6CW3x5M8XukQ
 4po/kQhQO1KY0s36VIly2VM1nfao9DszJJ6ANWYId84CIQ5U3a5jbgNV5gcE+unaia9QQDKFM
 5srdX9S/OOT19Is1Y1/pWoO07Lzyw5EulhwK93bwGrQGv3Vn6ciUDUvZcaFhwkBSyPUDyplNa
 LaOeG3ZbeFFqykynDUeBsrHyxc3ThOiH7H7GnAcKUeVTkyxNhL67vLOF+kk3v6MyaQirFQ2bs
 /lGhYarfrw1JeSRXxku84Otij32VsHd/gtwkT3Dn8YNG43Jl8IXrT95Nj9JzA1tTTVFgfA+u+
 VSen8/KOkFiXxeNTa12DyBM+ocuHO2YuAk6/1zgCEH/dRH8VKL2bObD0sxx8MV9ZsD


On 24.11.24 16:54, Krishna Kurapati wrote:
>
>
> On 11/24/2024 6:50 PM, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
> [...]
>
>> +
>> +&usb_mp {
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>> +
>> +&usb_mp_dwc3 {
>> +=C2=A0=C2=A0=C2=A0 phys =3D <&usb_mp_hsphy0>;
>> +=C2=A0=C2=A0=C2=A0 phy-names =3D "usb2-0";
>> +};
>> +
>> +&usb_mp_hsphy0 {
>> +=C2=A0=C2=A0=C2=A0 vdd-supply =3D <&vreg_l2e_0p8>;
>> +=C2=A0=C2=A0=C2=A0 vdda12-supply =3D <&vreg_l3e_1p2>;
>> +
>> +=C2=A0=C2=A0=C2=A0 phys =3D <&eusb3_repeater>;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>> +
>> +&usb_mp_qmpphy0 {
>> +=C2=A0=C2=A0=C2=A0 vdda-phy-supply =3D <&vreg_l3e_1p2>;
>> +=C2=A0=C2=A0=C2=A0 vdda-pll-supply =3D <&vreg_l3c_0p8>;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +};
>>
>
> The above QMP MP PHy is unused in the above DWC3 node. If the port is
> only HS capable, please don't enable the QMP node.
>
Oh its the other way round I guess. Thank you for the hint. It should be:

+&usb_mp_dwc3 {
+=C2=A0=C2=A0=C2=A0 phys =3D <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
+=C2=A0=C2=A0=C2=A0 phy-names =3D "usb2-0", "usb3-0";
+};

The port is USB2 and USB3 capable, and this was the intent. Noted for v2.

with best regards

Jens Glathe


