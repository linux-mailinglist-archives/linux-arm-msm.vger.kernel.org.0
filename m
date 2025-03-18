Return-Path: <linux-arm-msm+bounces-51761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD6A677A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCF9D16F7E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326F120E715;
	Tue, 18 Mar 2025 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="IfjN6P8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB3F42AA1;
	Tue, 18 Mar 2025 15:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311478; cv=none; b=MXPzjYo5qrSzESV8jhSBMh6hjJ2ldAluVmDPkn/jPvEFZPZXQ2U3N9KLLR6MtfM9eLtf5h4XkFWPyS6lYbyIJw8ikxV/iGtsVk3tblNgR0Ay5D7BZvfdGbAsc0fB3Pw9WKBgNUowysulFxTHVK+2iYJlzoEIWBrljC1x+cp2CE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311478; c=relaxed/simple;
	bh=IGxZDkJVEFGN27ZCCJQQO/TocqfLAnobnmaWTSSKWcU=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=J1wbdI4JrcdvkuN3eerXz/8IHIKsJ8mdJ4fgBGeg+ymZZsnJEkdWmPj7rpjiEvy8qD6flmalZyaBiz0IPqflWQ94fs7SnxqZ0ppDMomLJji/L3L+BKSvflbNX5kSDE9Y65PnF87BEPgo8T32s29XBK9C9vQlg8H80pRSL8m1yXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=IfjN6P8n; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 1CF2B2FC0191;
	Tue, 18 Mar 2025 16:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1742311468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KPWGE/rZHIEKEK/h/2ogN6Fs8enuzcyDS0RqOiIT7Hw=;
	b=IfjN6P8nRlwvGssUtvFg7kBXfNnN1CcaSFsGYnKYm3FAmesq6Iko0+rOqtS6C2CKOwW4+w
	zrqIPZDk+/ANffn/VUKIY5427VphN5zCOPKW8XPXDSUtOaHnMCMJGoJwlVtb7lj5S2uMd5
	aAKVxae2iAsLLi+2tCd51AND2DLMcJY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=g.gottleuber@tuxedocomputers.com
Content-Type: multipart/mixed; boundary="------------Etn3kshWBFJU2f2GsmLfP7v9"
Message-ID: <129bf442-2505-41c8-9254-ad7cacefab89@tuxedocomputers.com>
Date: Tue, 18 Mar 2025 16:24:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georg Gottleuber <ggo@tuxedocomputers.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 wse@tuxedocomputers.com, cs@tuxedocomputers.com
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com>
 <5hvghahezqms6x4pi3acgaujyhiql6mzl2xhzph5phhki2yiyq@oi3xjatj7r64>
Content-Language: en-US
From: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
In-Reply-To: <5hvghahezqms6x4pi3acgaujyhiql6mzl2xhzph5phhki2yiyq@oi3xjatj7r64>

This is a multi-part message in MIME format.
--------------Etn3kshWBFJU2f2GsmLfP7v9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 07.03.25 um 07:45 schrieb Dmitry Baryshkov:
[...]
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
>>> new file mode 100644
>>> index 000000000000..86bdec4a2dd8
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
>>
>>> +&gpu {
>>> +       status = "okay";
>>> +
>>> +       zap-shader {
>>> +               firmware-name = "qcom/a740_zap.mbn";
>>
>> Are the laptop's OEM key/security fuses not blown?
> 
> Can this laptop use "qcom/x1e80100/gen70500_zap.mbn" which is already a
> part of linux-firmware?

It seems so.

Because there were no logs about loading zap.mbn, I activated dyndbg
(dyndbg="file drivers/base/firmware_loader/main.c +fmp"). See attachment
for dmesg output. But GUI freezes after sddm login.

Best regards,
Georg
--------------Etn3kshWBFJU2f2GsmLfP7v9
Content-Type: text/x-log; charset=UTF-8; name="dmesg_loading_zap.log"
Content-Disposition: attachment; filename="dmesg_loading_zap.log"
Content-Transfer-Encoding: base64

WyAgIDM4LjU4NTY5MV0gZmlybXdhcmVfY2xhc3M6ZndfbG9nX2Zpcm13YXJlX2luZm86IG1z
bV9kcHUgYWUwMTAwMC5kaXNwbGF5LWNvbnRyb2xsZXI6IExvYWRlZCBGVzogcWNvbS9nZW43
MDUwMF9zcWUuZncsIHNoYTI1NjogMDVhZTg5ZTZkZWE2MjI2OGNlYzNmNGFiYjVkN2Q2ZGIy
Yzk1MjcwZmYxMDVmZDA1NmY3NzI2MmUzOWQyZTUyNwpbICAgMzguNTg1NjkzXSBtc21fZHB1
IGFlMDEwMDAuZGlzcGxheS1jb250cm9sbGVyOiBbZHJtOmFkcmVub19yZXF1ZXN0X2Z3IFtt
c21dXSBsb2FkZWQgcWNvbS9nZW43MDUwMF9zcWUuZncgZnJvbSBuZXcgbG9jYXRpb24KWyAg
IDM4LjU4NTcwOF0gZmlybXdhcmVfY2xhc3M6X19hbGxvY2F0ZV9md19wcml2OiBmaXJtd2Fy
ZV9jbGFzczogX19hbGxvY2F0ZV9md19wcml2OiBmdy1xY29tL2dlbjcwNTAwX2dtdS5iaW4g
ZndfcHJpdj0wMDAwMDAwMDI1MTY3Y2FiClsgICAzOC41ODU4MTZdIGZpcm13YXJlX2NsYXNz
OmZ3X2dldF9maWxlc3lzdGVtX2Zpcm13YXJlOiBtc21fZHB1IGFlMDEwMDAuZGlzcGxheS1j
b250cm9sbGVyOiBMb2FkaW5nIGZpcm13YXJlIGZyb20gL2xpYi9maXJtd2FyZS9xY29tL2dl
bjcwNTAwX2dtdS5iaW4KWyAgIDM4LjU4NTgxOF0gZmlybXdhcmVfY2xhc3M6ZndfZ2V0X2Zp
bGVzeXN0ZW1fZmlybXdhcmU6IG1zbV9kcHUgYWUwMTAwMC5kaXNwbGF5LWNvbnRyb2xsZXI6
IGRpcmVjdC1sb2FkaW5nIHFjb20vZ2VuNzA1MDBfZ211LmJpbgpbICAgMzguNTg1ODE5XSBm
aXJtd2FyZV9jbGFzczpmd19zZXRfcGFnZV9kYXRhOiBmaXJtd2FyZV9jbGFzczogZndfc2V0
X3BhZ2VfZGF0YTogZnctcWNvbS9nZW43MDUwMF9nbXUuYmluIGZ3X3ByaXY9MDAwMDAwMDAy
NTE2N2NhYiBkYXRhPTAwMDAwMDAwZTkxNzg1YTkgc2l6ZT04MTMxMgpbICAgMzguNTg1ODU2
XSBmaXJtd2FyZV9jbGFzczpmd19sb2dfZmlybXdhcmVfaW5mbzogbXNtX2RwdSBhZTAxMDAw
LmRpc3BsYXktY29udHJvbGxlcjogTG9hZGVkIEZXOiBxY29tL2dlbjcwNTAwX2dtdS5iaW4s
IHNoYTI1NjogNWRmYmEyNDdkNTQ4Y2FiY2I4OTJmZmE3MTZlOGRjODJhMzQ1ZmQ1NGI1ZGJh
ZTQ2YmE1MjMyMzBlN2FlMzdkZApbICAgMzguNTg1ODU4XSBtc21fZHB1IGFlMDEwMDAuZGlz
cGxheS1jb250cm9sbGVyOiBbZHJtOmFkcmVub19yZXF1ZXN0X2Z3IFttc21dXSBsb2FkZWQg
cWNvbS9nZW43MDUwMF9nbXUuYmluIGZyb20gbmV3IGxvY2F0aW9uClsgICAzOC41ODg2NzFd
IFtkcm1dIExvYWRlZCBHTVUgZmlybXdhcmUgdjQuMy4xNwpbICAgMzguNjUzMTU0XSBmaXJt
d2FyZV9jbGFzczpfX2FsbG9jYXRlX2Z3X3ByaXY6IGZpcm13YXJlX2NsYXNzOiBfX2FsbG9j
YXRlX2Z3X3ByaXY6IGZ3LXFjb20veDFlODAxMDAvZ2VuNzA1MDBfemFwLm1ibiBmd19wcml2
PTAwMDAwMDAwMjNkNGJkYmEKWyAgIDM4LjY1MzMyOV0gZmlybXdhcmVfY2xhc3M6ZndfZ2V0
X2ZpbGVzeXN0ZW1fZmlybXdhcmU6IG1zbV9kcHUgYWUwMTAwMC5kaXNwbGF5LWNvbnRyb2xs
ZXI6IExvYWRpbmcgZmlybXdhcmUgZnJvbSAvbGliL2Zpcm13YXJlL3Fjb20veDFlODAxMDAv
Z2VuNzA1MDBfemFwLm1ibgpbICAgMzguNjUzMzMxXSBmaXJtd2FyZV9jbGFzczpmd19nZXRf
ZmlsZXN5c3RlbV9maXJtd2FyZTogbXNtX2RwdSBhZTAxMDAwLmRpc3BsYXktY29udHJvbGxl
cjogZGlyZWN0LWxvYWRpbmcgcWNvbS94MWU4MDEwMC9nZW43MDUwMF96YXAubWJuClsgICAz
OC42NTMzMzNdIGZpcm13YXJlX2NsYXNzOmZ3X3NldF9wYWdlX2RhdGE6IGZpcm13YXJlX2Ns
YXNzOiBmd19zZXRfcGFnZV9kYXRhOiBmdy1xY29tL3gxZTgwMTAwL2dlbjcwNTAwX3phcC5t
Ym4gZndfcHJpdj0wMDAwMDAwMDIzZDRiZGJhIGRhdGE9MDAwMDAwMDAyNzY4YjVmOSBzaXpl
PTEyMDg4ClsgICAzOC42NTMzNDRdIGZpcm13YXJlX2NsYXNzOmZ3X2xvZ19maXJtd2FyZV9p
bmZvOiBtc21fZHB1IGFlMDEwMDAuZGlzcGxheS1jb250cm9sbGVyOiBMb2FkZWQgRlc6IHFj
b20veDFlODAxMDAvZ2VuNzA1MDBfemFwLm1ibiwgc2hhMjU2OiBhYmFlZjUyMjI4NTZjZTk3
NjAxNDUxMmQ0MGY4N2Q2M2IzODBhNjA0ZGJiMDk1YzQ2OWYwMmZlYjkyNGUwYjI2ClsgICAz
OC42NTc3ODldIGZpcm13YXJlX2NsYXNzOl9fZnJlZV9md19wcml2OiBmaXJtd2FyZV9jbGFz
czogX19mcmVlX2Z3X3ByaXY6IGZ3LXFjb20veDFlODAxMDAvZ2VuNzA1MDBfemFwLm1ibiBm
d19wcml2PTAwMDAwMDAwMjNkNGJkYmEgZGF0YT0wMDAwMDAwMDI3NjhiNWY5IHNpemU9MTIw
ODgK

--------------Etn3kshWBFJU2f2GsmLfP7v9--

