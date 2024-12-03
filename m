Return-Path: <linux-arm-msm+bounces-40020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9989E13BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 08:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A653C280F30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 07:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538A61885A0;
	Tue,  3 Dec 2024 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="1WyptBjK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C97142AA3;
	Tue,  3 Dec 2024 07:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733209703; cv=none; b=tlkcIAh9VDoHV0gcHn5ukEGfCdA0opbCrJz/PZ8mb+iLyXDboKWWRgRDg7vusDN7Ku1YW+MlJYQv0ZBqJY4yy/0+wTtktQ6chzSrDOweOF8bPTOSqEARmuVuCTLnsx/L4xYIHCWjHGAnCg6XdusIl3DivxC05+2JjEcay90uchU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733209703; c=relaxed/simple;
	bh=sv/ZLZNiP+ORYCqKhKoa1tROOZS7hHnvR4oSVaz6GKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEzONaIig5+ydWNUlkSVI3OvFafyqwz4qFMN9+Z1IceVwSU7+iL4QoypQKR9h3YlsVWDPNr6vHQT5txhXcSYOSqM/n+GPaipYVNIuAypBggPMoSpvtSOceaAdLfj5zmowZksUgQgLlZHD61fXMUTViYMjpqIErcyqe/k5XSu8Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=1WyptBjK; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1733209676; x=1733814476;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=sv/ZLZNiP+ORYCqKhKoa1tROOZS7hHnvR4oSVaz6GKA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=1WyptBjKNhHiqJNh8cQZueublvUjY6F7C5tt6kytTzW/16O45V1RTDzpY37rc4d3
	 y9DFHa4zlknelPMcuu4Gxz2F1yJKuGxjKN2E4Ennr79Qi/3lwyl4i2WLKg45N2qcq
	 C57/Z2msEzrrL+IjjovVquqjwDVe5gYeGTteUCYcVbnnzVQIwmS7XvdtFUHw6rctZ
	 9rIYfRC814clNGeQc0ztVxgsCsch0FxA3G5f9bWzvZAg2XLBTEsDbc8AKAueXOaRz
	 oPWbXgwop7r/a+MhSNuIZ8Wp/TH8Jxw8e+jgyvxBlwQYw+BP3AvLr3mV9ni39HJBn
	 AvDH6tc2Vvv70x3jPw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MJV9S-1sydCW2ICe-00TY9Z; Tue, 03 Dec 2024 08:07:56 +0100
Message-ID: <7f5d424d-09a1-46ca-92a6-a1e7f8084bf0@oldschoolsolutions.biz>
Date: Tue, 3 Dec 2024 08:07:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Merck Hung <merckhung@gmail.com>,
 xlazom00@gmail.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20241202-jg-blackrock-for-upstream-v9-0-385bb46ca122@oldschoolsolutions.biz>
 <20241202-jg-blackrock-for-upstream-v9-3-385bb46ca122@oldschoolsolutions.biz>
 <0352b36d-92fa-42ba-bc20-40cef0f9ea42@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <0352b36d-92fa-42ba-bc20-40cef0f9ea42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tWOFzcbo+m+ObCOiNlwoCMMFHZX41Levru0sbPKXuhwKAASYWST
 fyBC0QtCcJoFmuAQ7ET6NKAZHh/jPmRh10gEyGNY4CyCWapsiiiUhHvP1tEcd18RuHXgWZc
 sXv/rnYuF6uso3VsXPet71gcNVPSzv7qCVBkdd81DGzI+Mz7vc8bmjSGxdY87SObOFkdfxr
 9BT55lV2G4CJOOyvVQrlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FD4rmPGlEW4=;j2SPBrS/ywcUJ4QmXa8fDkTDkG1
 cORRp8hCXcarqbGLeHcQfugA68zlus5gxsgB0olmhfe0Qxt0LVLf7mm3ZU2ThaHlXAmCxMCeY
 oZggykU6Zc/Jvlh6f434yPDG3WmAZa6EvgB4iiYqgzhd74GpkcXo1riOb22WrmnmWILFE/skO
 5nzyjVGTmKs87FYY2aRdEM4+qyjs2PNBfz7rBC6pL5CkS92D68JUL8iEtdRqK/siQGlVqlVR4
 pylB0K4tA8MSXvBtaBc1jEbrQGFK7mNrpb80cGsZz9QTodpLrWHq7LUZBBHgAXAeunky5IA/v
 CrM7lVmI/2+IfJCwO5pkutexuvyYsaDkb+6PMcnhy80RV3kWHZcEwxTJ5WVKxHQ/n/LMlX08/
 oolAbqPeWvPuoWOzhkEpGoQ9ovM+mGvvRsLXQAppLze3KItlHICabfJMbnNVQOHV2c2wM34KP
 f8FJJ4LJ44x8nERG6ztA9BBbmn/GPectVzwWpRbpCTdjQI+0H9e0ksDuOUCy/5GoCj8cuPJK/
 sdfsmTMuhYipPxpltTM3N7rTTVRWMjtIgHxrGzk/W9IVGnfnpZLCV7Ndp0p6VC6vijGZ0u7K6
 bgHGTV3gBUgIchiPDytg7YCfRQGqxewLyrBPwh1bmLPny13JGVEpvsbnq+pMhmkvLGly9EpT+
 isMuQIe/KdSAgTIiRg+ub6ljEgabcMixb/z1e+vv8G/U196BvhsW1ArU8igrsdbZ6aAbzwW17
 TVXWiBdTBS6P1gqc+Y91xdOfwFi0dJ9bAfyUSSYRh43DcOZS2nmSo6HZSC+Fi09RIeztRJCcV
 /o0w0yVscx5pieXC3zNhWW14RN4cCOvwZ9AZbeiyb13/NSdeVI6zXEfOI0lofFO6I1hxdYIig
 gEYkoRGCqGupP3AZzRYKlK+a4V1Iqn0wj5yl0Az0U1+kSmPBi+bxHUm4C1RtNl+/lFqb5uUMY
 PV0AJnW3+cfFd0NKgTu53K1KVQBHSM2cn7dBlSTvDhb2i9gnZSNqDYPt2unaKbWal3WQ9U17Q
 NcSUfNnx2G7Str4LrNFTq0B7/7Ua3B5Ifhoq2NV

On 03.12.24 06:08, Krishna Kurapati wrote:

[...]
>
> Although functionally unused, there is one more connector node that
> runs between QMPPHY and DWC3 node. For example in [1], please check
> "usb_dp_qmpphy_usb_ss_in" and "usb_1_dwc3_ss"
>
> Would be good to check why it is missing and add it further.
>
> [1]:
> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/q=
cs6490-rb3gen2.dts
>
>
I checked, there's an extra endpoint for usb_?_qmpphy_usb_ss_in and
usb_?_qmpphy_dp_in.=C2=A0 usb_?_qmpphy_usb_ss_in=C2=A0 are defined (and "w=
ired")
between port@1 of usb_?_qmpphy and port@1 of usb_?_dwc3, in
sc8280xp.dtsi. On port@2 of the qmpphy is usb_?_qmpphy_dp_in as
endpoint, which is further defined in sc8280xp-microsoft-blackrock.dts
as connecting to mdss0_dp?_out. Maybe that's wrong, it's the same as in
sc8280xp-lenvo-thinkpad-x13s.dts.

with best regards

Jens



