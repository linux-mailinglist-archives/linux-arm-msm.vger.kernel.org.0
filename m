Return-Path: <linux-arm-msm+bounces-44539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F478A07244
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26A55188901B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347C3215187;
	Thu,  9 Jan 2025 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="VQRwsFvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF6E21579C;
	Thu,  9 Jan 2025 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416566; cv=none; b=MhQ+uGfeZe5MlFY2mLf/IEbV1ar+CAoagFSgpXnZqM+wWwTPI5xSoVPhScaKZKdyBAdZtlrFKp7sk2+sj715MDPQnVRTTQNXJyVBln3fRpnOBw8jCt02pZhqzEIxTR+aBydACDu87gnUTLA0zsV3bwLvvVptrU2O1Y5bXtXVL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416566; c=relaxed/simple;
	bh=aAr/zAGnphC4avuhdFCfNq1Ka7p2gUdijTpQbwiJB6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzN5uOeie7URjiKki3bvv84AZ0i96sRYabzr3PdC0og0J5FhfVCZ0mLBzexibn8HwZ+rEC9mRBsNRujQBcf/2GvOgGeUMaNbDPS6lt+FCzJ78nBiXHNKYlYp7lFUDaogchLmwbk/0Ce08joetnZ+MFNJp1HC21Y+GecQgmXEvig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=VQRwsFvd; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1736416555; x=1737021355;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=aAr/zAGnphC4avuhdFCfNq1Ka7p2gUdijTpQbwiJB6c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VQRwsFvdK8WfPNBcrye2shpKo7uj5SxVTQutN/L1YK4KFnst5mv2jF7X+3+PaPYN
	 K50JFJ+/Cv8RJ6nnYk6OJp/VpQUX4Oc9LAe/WcI2p7Cy5oyPFfEW4C9daTFVI09by
	 Kp0oCJnf91t3FpYD656wNw8gmCzbFIg93IUA+kUKyOAsqQgLLTSSw5N285WeGhWjU
	 eQw55FFFd4Ue+P4/tLqcy/OprgRedngHWe8L0pwXnVy3dyGfn9HAvQowgeitMW3g2
	 MccS6xxgPQc90ZOqeXRbXZTstPcgzvlx0uTZF4Wb+Oxweg6jNc6YRo9KOAXCDKW1B
	 S8wthf6yZG6BpnxBCQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.152] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MAtoX-1tKZmc0fMn-007Pik; Thu, 09 Jan 2025 10:55:55 +0100
Message-ID: <3b99b4c0-5880-4ee8-bbec-d07673d9ce11@oldschoolsolutions.biz>
Date: Thu, 9 Jan 2025 10:55:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/2] soc: qcom: rmtfs: allow building the module
 with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20241202094903.18388-1-brgl@bgdev.pl>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20241202094903.18388-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j2T2tbOUV0DreENPSlZShFWbDmXnZSTaaD2G88ArDr4bD2s1JkW
 cXiY9za8dP+DtYtpMAYSqjrTN3ifgmFfMFgjFaIyx5iP8aH3KxsWs3rXtoe/ZVsRoAKcvAc
 pJkPEXz8wT0yHgRoFYCu//5VLnh3vcHu2tAVcRBgDSyJ+jC5i3Be1mtpv6dsPfNE4aL05rc
 KtUggKBvhLgkAWc0r/h7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GuzcOmU0W3c=;x72SJo5HZ5Gi39HxHVphLWHSkCC
 UW8imKyVch6jLnEqjgGBG1cIBdC+4usVfB7c4EDY7+k0KyuFeblcODhxfzfTaZu9kfYxemGDA
 8SFkJpJdJx2meaDnjPyj8IOn3U2vHVNnJLkZXVGjXSGWicEhZn220/nc+GtRKZ5D/+CGXLY7S
 ctcWivRf0GdAhq0+aNstqUarhNO0OPXZ1KX97jrBydBaTtauipGFJg10X2WFuDXULdOEyoAW+
 tWt7QlITLp1bAdYFRBSX2iTe8eLA+1u3ojpJKiPaXZDig9QuQJFco0y+fgu/UdBHzL+yJ+1Au
 qsMg7cjILuFlSiS5INYaymWwgvbwVu7vNYMHhEL8GrKdxuZaILGGq5qZOi/Shngf466PqqlbX
 McO/YM9yDEUTdE+zWpmC6j0YC3KQPDMAuh6Y0UQSHL7QgXETYzExp+LWYLn46JjbWKEdFsHl8
 izhS8e1FZaOtSDgMn252KoXy2PEhR6WbRbICQGeaF5I71DoflNWCwSXFPASuQ24hBvyvEIJXJ
 qvEn1pPMoMF2ECSRakpS2BirPMf+zZG1kAPCE7jpTbOgG9FFibCmFoMIZNv3OGf96MbaqghD5
 BKndqUTnyl8NgjNObhGEIJVfs9VDvFUgT1kEU0+PmbTAzwRP6n4vgwBNVQK6R1VFoHqThS7uz
 Mvmkfy0cLgIpIsq6RAE/ZQsx7DnRKCK00QikUiaOKc4WCFDV7CfTMM8O4NW1YTuHn4ZQJx2Do
 pezueEcm/f9g/v06bJQBr8l997jJQtdnwvIILUvWSHtWd+ZVAaPADPm8uwqJXcyNTP1sms7IZ
 8iWZCfltugiiIV8V87rAS1G/9pSV75JHVKmheBI2dtMMb6DxxfbqufhyzGtMFWxmV3s9PUJTm
 RCFPl17qrN3a/OS9hfjSsGBPFKeK3Z4IkY1dShECqFbSCuGGuBu4zdj4QFc5UNkyjvasCuvQ6
 oMkxWZbLBbJ0NWhX4xDyb5VF0n7402rM04wuXtuA2+E/x0GkXs1IFX7Gw16GYG00ZfxqsLbDU
 r3lw5HlP5oy/Eg+9W7N95i+EspFZxH5RdLG5tLL

On 02.12.24 10:49, Bartosz Golaszewski wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Make it possible to build the module when COMPILE_TEST is enabled for
> better build coverage.

Hi Bartosz,

no idea why this happens, but I just bisected my way to this patchset
for this very odd error on the HP Omnibook X14:

jglathe@x14-jg:~$ sudo dmesg|grep snps
[=C2=A0=C2=A0=C2=A0 1.009307] qcom-snps-eusb2-hsphy 88e1000.phy: Registere=
d Qcom-eUSB2 phy
[=C2=A0=C2=A0 24.035977] platform fd3000.phy: deferred probe pending:
qcom-snps-eusb2-hsphy: failed to get repeater
[=C2=A0=C2=A0 24.035987] platform fd9000.phy: deferred probe pending:
qcom-snps-eusb2-hsphy: failed to get repeater

This kills USB2 functionality on the type-c connectors.

with best regards

Jens


