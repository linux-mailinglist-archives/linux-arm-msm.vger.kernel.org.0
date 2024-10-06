Return-Path: <linux-arm-msm+bounces-33225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF659991E05
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 13:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FC29B20DD8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 11:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F36C174ED0;
	Sun,  6 Oct 2024 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="S50nD9Rp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B546F4C91;
	Sun,  6 Oct 2024 11:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728213178; cv=none; b=O7mEGLZd9GwIaKry5wajme93yDVzTrgXHb24mGCfXk8TtveIWgE1Cdp7z6SYu+OfX8lpBp+W6uJ3DAMzUNM6annW87+bdyTZyZ3unHTt+5RrRX50mbmcszI7myY1X7AaRkMuF/NwKDt0DWQ+QsAX3gWcMBII3kBgajR9zGxDuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728213178; c=relaxed/simple;
	bh=2M+3ugLDADABIISUhE1rjXIToJMZ9lQU9ApRZODMpQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OH1J5DS4q2QaCDzgT89nfSN+wG+90jB2nami4+qNkwg0+lJHrzUtwGZ42Js+ZPv0j0J+CdecCbr/L7g9udssHbck/CaqsdW1ceqyncmdqEzf0/mwhgvtYlc4qPBopj0BoCYumfgpRrJcMkKSrIoQ5r4A52iUPeRHyAr/tTV0hos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=S50nD9Rp; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728213154; x=1728817954; i=markus.elfring@web.de;
	bh=Tb+T09tvkffYYzsIjM2Eq9r0VO5GwmF24AJDTdB3JCQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=S50nD9Rpr63Z+S/pAis+bydyXCrJxgPX9WKKQ7w5UFIR8V7bzYjXpVGgAiZJldni
	 LBtOJgLd7jGwcNKLazvpI3Ox23XnbPFbmY9ynSFXIILxaJQM+QdJarP/DRLx5IwWM
	 VUavB/EJTFBPK9fRbaEkLvdI6AsaNfzlbPVgAr9avMRQg7EiAu7XATNwR49P0GYBi
	 Sg53L2EaCfcyEN4/Ro2T2OR7p66BHbwS5jNLZYshL/pEADpVaUcjsg16DMIGpc50j
	 dPdWGlut0zZBDQT/cimxR+7mCmdPtTXkbPbgtGDkkjgxoqfG7zcK5kieYfujHfWcC
	 15Pkl57VEEhfYrnMqg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N14tM-1tyhD60k94-01029J; Sun, 06
 Oct 2024 13:12:34 +0200
Message-ID: <8e4fe108-cfde-40c0-83f5-c1ce60b0940f@web.de>
Date: Sun, 6 Oct 2024 13:12:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang <chenyuan0y@gmail.com>,
 Zijie Zhao <zzjas98@gmail.com>
References: <20241003152739.9650-1-zichenxie0106@gmail.com>
 <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
 <2024100620-decency-discuss-df6e@gregkh>
 <6d17006d-ee97-4c7c-a355-245f32fe1fc3@web.de>
 <2024100608-chomp-undiluted-c3e2@gregkh>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2024100608-chomp-undiluted-c3e2@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yRTbD6sd3+21UNILTwyen9xGDcqeDXPJVM2pwF9pSM2QeHcmLjP
 1yVdgSeocfPe/3sQBJC6vnkeAelYEq3Tw4q3vbHmFDEC1XMAUn3QPw6kssQVq8RQhuMMNux
 zpTVqPDM2AS1Z06J0FrFoQAMvEBlICCMrhaNJq3je+qlH/B4U8zG85LUUfaxmaB1bJlMMC2
 26xXZJD3MigttCtcRL9RA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RSBHA8Qa5SQ=;/s/d7cD8oOtzcIkiGSlmatb5uuU
 cKJixBxA/JdU6u04XbR9kF24yaTTgv62j2NuR+lGXYAtDYP3QL1jvY+N3TJZGuFpXKE3U2Gxn
 ESDcbRqyxeO9ZfDEigmrhiz1KhLM3+5BzjuK73nytqYZnyN+4A/1BAmJylgq8GqRDJaCSjlRq
 Uf52NPZSzEFVCLqYvOYPsfIxoQhlV70O6EXtcQSXoABBj0TTR/gHze1XudE5mMaDDqDhrffls
 EcDn9Lp04gBN+kEq+0Ema75iBhXiRRfDf7jFAbIUjxo9+EbA4iYTQjOp2uvDDRsIyUF/dx0ii
 sJsaP99NxOthe715M6I0Hp5OZdPLrXcb+WT71Vv0WXyHOJSFvmbJe+9/5YE7HHobavlc1NU0r
 Q3tFi54IWrKp2fwmMZ+uhsQPJH5oJsT97GrwZ1HutnMcwIdprCyWG+xkA/KRzvYPzO1sSdL0U
 Y//Ihhfi2w531qQNSby9ZAauyCEnNXC3ynAG4Ar6VQwoWC5poasYwu+96PsNu6Wwd90mhZKn5
 ICA8kZ0gT2J+/mpkP2Ei9if1L55VWq+IRaFBeXCBG1Fm8Ssx8qtHQQQYNFuCHvFyQpOXQaN86
 L4pf69gh3F12sEZov8rzQN1vfw1nQpGW4KdYRLgtBPGcgnf5+rwLfKTj8H3CX5eBfFdtVrNhC
 LTYBeqt2ZaXEUaDZiT5FRBmzzI+vSYRIjVBD74Lo0KDqRNJZAXHV/hyeNPyZWTXcL3gdViPX+
 5wB2XiUua3FCv67f7BZTi/uZWLbU760sSJExHWnfIr3MkA/TXLEKKym94g37Up6/vmDyVEdu/
 IPRseMHC2ZngLkfHfgxnEgkw==

>>>>> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
>>>>
>>>>                    call?
>>>>
>>>>
>>>>> possibly return NULL pointer. NULL Pointer Dereference may be
>>>>> triggerred without addtional check.
>>>> =E2=80=A6
>>>>
>>>> * How do you think about to use the term =E2=80=9Cnull pointer derefe=
rence=E2=80=9D
>>>>   for the final commit message (including the summary phrase)?
>>>>
>>>> * Would you like to avoid any typos here?
>>>>
>>>>
>>>> =E2=80=A6
>>>>> ---
>>>>>  sound/soc/qcom/lpass-cpu.c | 2 ++
>>>>
>>>> Did you overlook to add a version description behind the marker line?
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/process/submitting-patches.rst?h=3Dv6.12-rc1#n723
>> =E2=80=A6
>>> This is the semi-friendly patch-bot of Greg Kroah-Hartman.
=E2=80=A6
>> * Do you care for any spell checking?
>
> No.

I find such a feedback surprising.
Does it indicate any recurring communication difficulties?


>> * Do you find any related advice (from other automated responses) helpf=
ul?
>
> No.

I wonder how this answer fits to reminders for the Linux patch review proc=
ess
(which were also automatically sent) according to your inbox filter rules.

Regards,
Markus

