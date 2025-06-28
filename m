Return-Path: <linux-arm-msm+bounces-62913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C801FAEC83D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 17:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B8D33BA22F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 15:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7FA21770D;
	Sat, 28 Jun 2025 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="OmM5fgPs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F5071747;
	Sat, 28 Jun 2025 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751124163; cv=none; b=uM/JT9SCjgxvVElQGgTXHX8VzZnOAj1kd5FE4DzED2Crj8HRlKG6+lVO4t8iIxk3ZaHH1Ih1W7NfQ3wJSCIsYtMCKk8Kfk/U2UOlu3SEzdYRAtacVxNYMHSaD+S997upp/muM1fUDp4iZnI1CbXL8bvZBI/pGDnWiZYHZLcYGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751124163; c=relaxed/simple;
	bh=QdtzsjKkQZhbnLkMPPyAHMKXOyX9JwpL+gRq/g/v0rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ras94rRY3Pnm1RAHgI8x/ABCF3ZPqw7So9J0qMFjoRk4xsVyR1A4vqUESJi+cgC32OCvuZJbDk2Jqolw7F7JWsXzdWe0er34oBsSBjBQwRItZUYEvwQA1ZDgSeO2CuVelXWjt0nrhep4RLCGD4Cex2HfxUnzVNUq4VQP3a25ovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=OmM5fgPs; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1751124138; x=1751728938;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=QdtzsjKkQZhbnLkMPPyAHMKXOyX9JwpL+gRq/g/v0rw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OmM5fgPssXXjIeo8YV8jNvXc9jOIL9X4wAz/yt6T/v7Eje1QVZd6/GPmLztto/zC
	 p32kYAJ4AcRROWPkQVk4mUSsQ+d5T7Rgvxcd/7D+wdZ2Q6ShYgYYXFDxwjxW5Js2M
	 3+txzFTJu23J35udoV9l70UEfHfkY42AxIJ/wzVVhUvyffdizZfFTddbHwocwAIhm
	 JyBPeYICnbqDB8PIRf9Ae1wUwvK+PstpJuYw+8xyhj9D2LOqDxwDSV1rDtRLmBoK/
	 EiDekEPuipraoW1JgRBcVFUj6b/EzNFr3QOmzwcOXc9zP3QdnjRfn4j6keXUZk1Ec
	 ms5m3HfbCLvBYaunsQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [100.90.8.184] ([47.64.51.232]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MC2o9-1uQLNE3zkj-002XH8; Sat, 28 Jun 2025 17:22:18 +0200
Message-ID: <1382c27c-66f0-4642-a568-2e86b7c13d7c@oldschoolsolutions.biz>
Date: Sat, 28 Jun 2025 17:22:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
 <20250607-tb16-dt-v6-4-61a31914ee72@oldschoolsolutions.biz>
 <ee088b5a-e792-4704-8f1e-e709f1b0c5fc@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <ee088b5a-e792-4704-8f1e-e709f1b0c5fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FC5g7i8l9SnsCxLdAyVTEHaZTZS3A15ZhRU+SlYCKfJpW161vWe
 BVECNRZrF7ZGyz+X13my5zVrvMUI6EwitK7Fjwy3jPgwnpBv9GHo9NVuPz8ai+4XhP4weLx
 Xu/QdOOpKj024K9z24NcHVbyOyC65njaeWnWgTJZP0hXiMPGfflxsqcBCCBl7t/ommPXw26
 SrqZzg+ZrnVNCRaHdo+/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r2oDkb9hbhU=;8aEzc3IpTIJuwZleJnnKvxG3sUu
 J2zJKoz7N7li5rfJnVlyU4piAeF5fAQDOZSqB1mwCbO5OFiyricnLucxsh5ERfhcabqiJNjlA
 OyXHQlW2Mt+OBUm4rUX2/t2okToVPfgpWwc3RMRWGXPeadzlTvXOJqSXkczrpWh9G5HU4OAld
 iSXBrXjhMHUZfpXkhCnKquue9QfiIIRkSbfmu3leYEC61s8QQkq/ttqs0zRSn16rQEKn87A0l
 C6FqPjLW8VBj4Tt/MviOw4h56NYICE2sjK9b+aEMaOECewhVTjAziUTp5CkpdMhQIPIbtmztv
 EvvMyHLIZPVvgyQxhuqeejux/s9wlKRXmwiXqZwxrEcpqu028MtfKguXm62mE7FdsdtER7tF0
 4mLJeF80sJZ7Ea8FotyReXWjGrqGMsx3rEOUexkue0cGo7stif3ZUqNAsFdbv5Nb7gJV/IYA1
 wP6PFyCjOoSevIG0EF7OmlxSGPoGM9udPPP3r995kSd4OZP9frBKYM2pS9iIQSLXCIlTP6qv1
 dpElsm8ni2sSdeAo0hGTtKX+3EaBGcyRu3B9x3+SIFb9f8aWSaJijwMk5nPOrW+1RSLsK4gOh
 tnIy5bNUEuApbiI1/xPE64qJRdte8dOKqsTWCyp4VN2poAT+MpaGiyaJG5nDbBFL3MHOmLXUY
 GWJ1zLrVN83WNwolncCAkalwJKvXprLkjLw8vKBt37y+sKxtxtEEmGuOzoZRUe9bIwvSap4YG
 zGSMDmLXltjcl3zDehlF48YQRj2llOYRJMWw2rhL9abxru2Mqlo4EPaaBZmechV5v3lprjvNA
 1RjofXI36r5hVHybohkceKUbea4FdNir4BBbhgiaUtcs1hUk0j9mTKyo5wpA3PhZZNwZGxZQH
 8pkOh8TmY4l3U/0vwfSyrInsviHVG3cQjSDqhvocbEF6o4BuRHEWjukEo7N1nzPUGaTgpPHPZ
 mqmQQFC/XXNNNrm4Zo/wN5QgPxpesyUZZKphJPS/oFg/0DjmFEC0gjQdRJDbN4W+CYXRBBpUg
 6ceOJB6SOdrGHE9cpUoJMgdQnvE/RD89WtD/lwPw4HmHq8gPWSW1aIX+E0CiIsa2PlYy5XbSu
 3yhztvGiO7TGN770Q7VKEty9Ocys8QawIqhCqDYCax5zu0/EwTio2HSrWkFsUHMUBatQCPnDx
 pF6nlTh2IZ9v2VdFc7lLcg3PfEY3uTVLKy4vL9CxaD8n9MAYWmERfeDXzHbEpUd8RvUgc0s3Z
 iW2HowishAdWBR3/3FYus1rTlTPLiQat6UUtxZ0NxPB1fv7s8L3cjbvVzHJ3zJEcP0PYXAln/
 ReTKroRNQwkvqbf+Gz0tzbosiHOVHl+MNpt/L30gdSSlfSmkk3LSpgPkLwQQmUQoiEUAt56p7
 cR9MyDS9uxTvykD13gpqbC4ImZIIG8SyW2yu3Ga9gPLgJExZlGoSkpMUU51W2jJtG/BksBryM
 mdJMEHE3m78/BmYxyCVbXgxmr7rRLQDZ2TP5pYSCEXXj9iLCH/40KJvy50aVMSXg9EDwqR4r0
 cnF/F/jVHm7KTjrri88+9ifxUOWSYN3jRaCkYGRTGZ5rWxyDFl+Fj/57e5SDCIprzqUhNz7GB
 GnnsfpAW+QijFCVMiyzWns3wpCDI+oG

Hi Konrad,

On 6/14/25 21:39, Konrad Dybcio wrote:
> Looks like DWC3 only does of_platform_populate() ("probe drivers for
> child nodes") in drd.c, and your dt sets everything to host-only..
>
There seems to be a reason for that. [1] Setting the DWC3 host=20
controllers to OTG on x1e80100 can lead to hotplug failures with=20
SuperSpeed devices. In v7 there will be a hint to this issue.

[1]:=20
https://lore.kernel.org/all/20241210111444.26240-1-johan+linaro@kernel.org=
/

with best regards

Jens


