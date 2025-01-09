Return-Path: <linux-arm-msm+bounces-44583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DB3A0774B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59F8E3A74A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF27214A6D;
	Thu,  9 Jan 2025 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="hq/3wi4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB391853;
	Thu,  9 Jan 2025 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429234; cv=none; b=UQf8mc4tXqcUOPcjSQAJosKiZQ/4raUqo1ODZtMck7Q2IO5ESOPJpW0A7JSc0hmlNETBJcNURRW+JbV1yrtVtNpyLfCfZNS7oW0ZczAn8yrDP03/yXvQmXHxyHAkq4ForcSC6bd0sc/Pc7r9GwbdhZvznPB0XQSi2Dp7TLjRiCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429234; c=relaxed/simple;
	bh=eDfPL13BEwOyMfyMggn7vf2AeMKPlzaJmKWJrVT4SjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhZJJF502O5yJTHe6+BNRly3aYI28qiDkSip0ucEtx3IiduBkNZnC8Ofb1eQpU7DM4OFdi3dR53obf4T4d+mUqqistJAVQ8Speownm1eEFrcp3dMzYuefQ/MQy1Mt73mgeVZWgHdjddk2p2A9iYLZu3PRmh6rteH2ukQz2tMaQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=hq/3wi4S; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1736429223; x=1737034023;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=eDfPL13BEwOyMfyMggn7vf2AeMKPlzaJmKWJrVT4SjE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hq/3wi4SE5EFyD57UBEB2XwiZx715MqugHYVoRT4H/5p5nglLJRQfV3hLg+g0pWT
	 8j61Iqs9KIR658yG5W/a4JeLxucsMdfawhSSnG0fPMHwjQljaJODBHyLhE4KK4yBJ
	 KZ3UtrQIsCUE+UYwW/NVP/a1UULQ8JgPXFWl/VQzPGRCD/S2gxtJKo85IVZWv6pd6
	 Eq33ICqXGeWm6p/LxhXVIB5KHN2+EJtZ8TSBeROfWLwqaiw2y0RzgOp5dwXyGSjVG
	 myJ1ToIzvGoRT9E5HhmjgQgJezUoFIxS8GFDoVTQqiwlLWqZIsiTsAFg/vXFBk0T3
	 NhmtuTlkI3YHmC3FmQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.152] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M5Q2f-1tUV7K2v4v-00DuJ0; Thu, 09 Jan 2025 14:27:03 +0100
Message-ID: <411d3601-be05-44f7-8e6d-614a0a387fc7@oldschoolsolutions.biz>
Date: Thu, 9 Jan 2025 14:27:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/2] soc: qcom: rmtfs: allow building the module
 with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20241202094903.18388-1-brgl@bgdev.pl>
 <3b99b4c0-5880-4ee8-bbec-d07673d9ce11@oldschoolsolutions.biz>
 <CAMRc=MdtbgSuwjv_h7+VVr5U2frc24NYmpifPQJ0O0iQt_sWKg@mail.gmail.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <CAMRc=MdtbgSuwjv_h7+VVr5U2frc24NYmpifPQJ0O0iQt_sWKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:79clL7J2W6O4VFs8egQkNf+rC7+1sbM/7+MFwDp10eJJhOdqv17
 gRD2MPSoAxQH0DH3hdUHAn1IqaSVsSUGTY9wriY//S3sKM5QUcqbirCkd5dQexcz7+FstOK
 Fp/ThMaY2HixT5UkY4SQa1gUjElo6szK3e90sP/fhFLoIxIImB+a3zPPVdLAev4jlZpfm4i
 9bODjKCBqmBFTL9bRWHcw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C9tN2NbWmXw=;7e4RoMtYyMLx8Wc4yqR7GfTJp5h
 qiE5kczS7tUDKWq7/jZ0TSGidWn3EO9PZ/R6O4ZK6FHll9z4qE1OPWGjXU/6kTaBecHGaxyFy
 LIpjFBl0HQ/MC3Eegb1MxPLePR+JNPql+O8S38NOZofc+0hMyGB8J7F5n03K2WZI5+F2YoZH1
 kx9QvluPkNjp6YQmFFDQhLx/K1dcICDB9coXAq79H1LfNJba5j5GlsfpbC2RDRWiI2X9N4a8g
 Klf20NBWZ5tJXGels2Yitu/p2RXaJx0bPD4qS/NHz4UBQGtTi9sBJqBjIc47WPM7mpjSR014+
 xv5kkFGohjvGf7Lsv4XIdztRqcCeC9QC4eGcytP3jGMYv0RClyTJ1N3oJ0na0wMeQl7a5Six1
 nUtlIkeus3G/2FjMr7sOY/S0Jd1yjmIWojjdXD5wkNrbNdiwrx1duDidFRaLUlQ6AydJIERoc
 r0iFF2i32z4jkZ0KLX0SkLeLnI0FkCyNQc+YwHd4ZS2db3iGD6zpHsvTjqLLEmdXgnaFTOAMZ
 WRLCIh0f4JDyImi2aIdq4lCzdaawEbEH9eS8+xc+rg3eijA+yQwMwOUiEV6wnkw7eXhwSZpvZ
 YejAQ89tcXoSGjO5ARoFoQfSucWNtaN+qFKQ2UXC8ZWncIuGJ+FxPFjIaidYFQlW494K+XP8N
 /RrPIC3DtctI8j27+RWTuB1DWkH2aKbbUB2T9WvpwL61s45wb6erlPfGY5xiAXteYJhQcUNDw
 7MaIfEqJgtHgxykrw2f9+FfWLWw9Z4A0/wG2uquMTIlfdt91c6XNuFONQeUrfhLt0AhavMb4B
 ozMMWKOg0ZeWdy6/Q11wArRzkztN/lQ39Xp5/w0MzNaZf/69Jjnw5cPGvTXADrACZKtKfPS9t
 RWMOZS2NzFfCC4pkucfj1clCjcmxY5eQc6ttY1SJEfu/FGObEKrkukuYox92Tms4PmmwUyfvW
 9rwY/4q7mOxayRFVuPw0nIKfU3tA1IJqGOYeawGoNegUlqlLnMOtN1fdPp+erMFPwNTy8x56t
 FkYX7YNyulkzg2AYGYmVFhCRNbeYBl1ToUuuxHkxOQnt8dTkOotyYeNW4gJxTM8U7N/2DePnC
 R4yxUJioU=

On 09.01.25 12:13, Bartosz Golaszewski wrote:
> Well, that's weird. Are you 100% sure this commit is the culprit? I
> have no idea how this could happen, it's just a Kconfig tweak.

That's what I thought, too. I merged qcom/for-next into my branch for
testing and adventure, compared / merged my dt's that were in both, and
then this showed up on the HP X14. On the Snapdragon Dev Kit all 5 eUSB2
repeaters work regardless with the same build. The chip in question is
the SMB2360, a PMIC which also contains the eUSB2 repeater.

jglathe@sdbox2:~/src/linux_ms_dev_kit$ git bisect log
git bisect start
# status: waiting for both good and bad commits
# bad: [a9059ebc60d5b845a95b25650eb24c1df5ed2132] arm64: dts: qcom:
x1e80100: Fix usb_2 controller interrupts
git bisect bad a9059ebc60d5b845a95b25650eb24c1df5ed2132
# status: waiting for good commit(s), bad commit known
# good: [2bab385991536a07d6f4c0970fa665f9626db059] Ubuntu: rebase to
v6.13-rc6
git bisect good 2bab385991536a07d6f4c0970fa665f9626db059
# good: [2cc57105ca61b9fb3744adbf83bbc8b2c0c0d055] johan_defconfig: add
custom config
git bisect good 2cc57105ca61b9fb3744adbf83bbc8b2c0c0d055
# good: [260e63d4eece13d5f908646b8b9e5af44a40d012] arm64: dts: qcom:
msm8996-xiaomi-gemini: Fix LP5562 LED1 reg property
git bisect good 260e63d4eece13d5f908646b8b9e5af44a40d012
# good: [033bf6bd4e245be05553ed1ec774dd78c77922ec] arm64: dts: qcom:
sar2130p: correct sleep clock frequency
git bisect good 033bf6bd4e245be05553ed1ec774dd78c77922ec
# good: [76f8b9a9e0d9fdafa6103ea789865dd6897f3bd6] dt-bindings: clock:
qcom-rpmhcc: Add RPMHCC bindings for QCS615
git bisect good 76f8b9a9e0d9fdafa6103ea789865dd6897f3bd6
# good: [22507018ce51df4f63a5ad468608426bcd799e2b] clk: qcom:
gcc-mdm9607: Fix cmd_rcgr offset for blsp1_uart6 rcg
git bisect good 22507018ce51df4f63a5ad468608426bcd799e2b
# good: [8db2b9a883cbb85a189ad74c3fb3264cc54134b8] soc: qcom:
pmic_glink_altmode: simplify locking with guard()
git bisect good 8db2b9a883cbb85a189ad74c3fb3264cc54134b8
# bad: [17f8cef45b6a390dd2216d28290c21a92c3e3ae1] Ubuntu: Update changelog
git bisect bad 17f8cef45b6a390dd2216d28290c21a92c3e3ae1
# bad: [1c51ac09700c1722329672f6254dca78fbc32101] soc: qcom: rmtfs:
constify rmtfs_class
git bisect bad 1c51ac09700c1722329672f6254dca78fbc32101
# bad: [d6c656205ae9eb32dce89df95faabe898029e668] soc: qcom: rmtfs:
allow building the module with COMPILE_TEST=3Dy
git bisect bad d6c656205ae9eb32dce89df95faabe898029e668
# first bad commit: [d6c656205ae9eb32dce89df95faabe898029e668] soc:
qcom: rmtfs: allow building the module with COMPILE_TEST=3Dy

I have put the tag up on github [1]. It _is_ odd.

Jens

[1]
https://github.com/jglathe/linux_ms_dev_kit/tree/jg/ubuntu-qcom-x1e-6.13-r=
c6-eUSB2-bad


