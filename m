Return-Path: <linux-arm-msm+bounces-83508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D6C8B78F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 19:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1844F4E1896
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 18:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B5330F548;
	Wed, 26 Nov 2025 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOoUDvg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2751F26ED48
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764182646; cv=none; b=RkP2LsApzbDKjdvqrBTQI0Z/WrJSFtTHH60Mgzzsl223zWOVIEuwbl023HPcb0WdHGqAPklfwrOcfq20g5fYK8fQdqqKCSKDXPuxudS3/Z4bPUcmnmP2WtaikxL8NPbKYVoDB9cttDRdrcXOlfYuRo7fG/o39fupqnXxYxtW7p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764182646; c=relaxed/simple;
	bh=gODucceURXLAZAeRwxxIiFVKMzlCXxDmuBNn0+OsE2A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sXeVQULTodCj6PwKkezPDmuLKzEDoQVzMYl2V0G8QEgVH9QZtfh2iIlW8u1zBrpL5AHUFmiOoSvbvsCHIHZWTzGS5L3RohDbkoon/yEc1UXy/xxzBQytxNIPnNsRS1ZjNkr2elmP/otKOXeWvNSWw/PzRYCIaQfQ4nOF4ASFOzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOoUDvg9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3b29153fso67266f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 10:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764182642; x=1764787442; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xv6F5N4oE/AmW5+gi206/SuXoxVH3RxFlJrHQKwWM8=;
        b=sOoUDvg9DWQXsPrCh925yBopoEx1L1BqOFEja/UiuHhPxpfWR99nSgdz+9LX9xVSaS
         VaFnLBskRYmrKdzB5XO+Cd8uPTZW7pWf3NQlKdYwK+NiPiBl+J4y0s6RJGop7KcQtNlL
         S9z3nsJbHe2BAGrjG6tOSncgKS29f1HuYKuWU7KDzAq76ng6AEB2pjjJ0rnXj81m7l8E
         wUlfqB0dqbzXEOjspyqGYbqBnwcdj5+lcNvTQ9vP0EehPqmRPTPWiymiEGXDFnBlHX9T
         GCp1zejLdtj7nW3oakcarK7vOjppqHqvVkkFuWOfzCTbypgeu+itXr2ckLOVr8IDyqmG
         i/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764182642; x=1764787442;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xv6F5N4oE/AmW5+gi206/SuXoxVH3RxFlJrHQKwWM8=;
        b=eeEC7rPRf+XbDiYZcnNATAWwW4t/n8MJpdTR+vHY3E4d1kqxPen0pc95CO6DrBzdph
         VCQLeq3RM2CVrlPfWRfBOgebSeMqP0+nasOkHvgA298fBEhc1LshZvHL8o05GmetDAo+
         e7Rg3eMT+QyIz8h52Dn0RJaSWIwTwYgg7kyKGXN1f2zQ+v3XZLSfWY/+cEMkVPBS9Vbd
         5gO+N0asfBOg6tjmmofemnDY0kC8QUjHtmRBAM9fNzIjvtwjjkYZ1hznaK3xt6MsMo43
         n1elfkvHHTA5VjSv3QI1UwsaGtoMTEvxhXZxvzmZN1L+ueWKZwUc99aHdLZZDVmk1DtP
         kuhg==
X-Gm-Message-State: AOJu0YydqnsKzGsy39C4hUhaB9HhDq/l7tuFGW2M6rkBagpQ5mCK1/Yt
	BaIlyguRyx09CC0UPVjp6jDe7mK8XRFPXs7+Hz/eWaZTE5V5NtpAvl5NbMb7RQm+NAo=
X-Gm-Gg: ASbGncvONTVnlGyM73npnijBk+8PRIhdrdrJT0fflC1uh9a7abCtft/g6HjT3TIz8M8
	Z5/YCX0yvXTrLnht4rnRM6ylYkwC4YOU6gGSC2J0SIAwe7m4i6PwNL0HYr+f0XzMo+VOQeAzu46
	HZI8gxuTH0esLcpc2X1jSMDaxwkU5RqwSzt028ucLMR/TdUUFiAq9nOXpn2ElcfHgO3dMD9B71B
	0cziM2dOGMj5b3pFu8yJwfejtV+OB5S/qazj/DL1A1P9bTW8e7nOcEUVvAGQZ1N+UGcQN0pKeTI
	EScie9yqadpibNGf573pmNTesBIzVThDJsyl9FsBSs+RYAfPjScO+eNrNq0SdfdKdJXfp+J15JU
	lRrZXNttH0U2QfR90hATY9ZRvsryR9TZj5EP61+GdvWocetym16ckfkX9rR164QopJsV6E+WiGx
	GBs7LnFaDZRDtiTFA=
X-Google-Smtp-Source: AGHT+IEp/IyLELcI0uOZQfhum7V44+vF6YOIJkzlS9XBmb/UdkI5bYp9WJHzf72QiNHrX+cRfeCHAA==
X-Received: by 2002:a5d:64e6:0:b0:42b:36f4:cd20 with SMTP id ffacd0b85a97d-42cc1d2e292mr23068136f8f.27.1764182642424;
        Wed, 26 Nov 2025 10:44:02 -0800 (PST)
Received: from localhost ([2a02:c7c:7259:a00:a911:f33a:3163:4511])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cc231dc6esm32613035f8f.7.2025.11.26.10.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 10:44:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 18:44:00 +0000
Message-Id: <DEIUJWR51WIX.43GDTH9RA8UH@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "open list:QCOM AUDIO (ASoC)
 DRIVERS" <linux-sound@vger.kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] ASoC: codecs: wsa884x: remove
 mute_unmute_on_trigger
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Jonathan Marek" <jonathan@marek.ca>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251124064850.15419-1-jonathan@marek.ca>
 <20251124064850.15419-2-jonathan@marek.ca>
 <2758401b-e9b5-4f10-bb01-0a1fe4e09430@oss.qualcomm.com>
 <5f15fc5b-375a-1e75-b32d-0d543fa1014d@marek.ca>
In-Reply-To: <5f15fc5b-375a-1e75-b32d-0d543fa1014d@marek.ca>

On Mon Nov 24, 2025 at 2:55 PM GMT, Jonathan Marek wrote:
> On 11/24/25 9:08 AM, Srinivas Kandagatla wrote:
>> On 11/24/25 6:45 AM, Jonathan Marek wrote:
>>> trigger is atomic (non-schedulable), and soundwire register writes are =
not
>>> safe to run in an atomic context. (bus is locked with a mutex, and qcom
>>> driver's callback can also sleep if the FIFO is full).
>>>
>> Thanks Jonathan for the patch,
>>=20
>> We have nonatomic=3D1 flag set for all the Qualcomm sound cards, Did you
>> hit any schedule while atomic bug?
>
> Right, I missed that. I'm using a different driver which does not set=20
> nonatomic. But this driver to not need nonatomic -=20
> mute_unmute_on_trigger is a hack, if there is a timing requirement -=20
> then it needs to be explicit, the different timing with this flag is not=
=20
> reliable).
>
>> In-fact this change has helped suppress most of the click and pop noises
>> on laptops, specially with wsa codecs as they accumulate static if the
>> ports are kept open without sending any data.
>>=20
>
> 28b0b18d5346 is important to fix the click and pop noises. But the=20
> useful part is the rest of the commit, not the mute_unmute_on_trigger=20
> flag. As long as the mute_stream() happens while the soundwire stream is=
=20
> enabled (between sdw_enable_stream and sdw_disable_stream), there should=
=20
> be no pop click.
>
> AFAIK the pop/click is because of PDM: zeros (soundwire stream off)=20
> represent the minimum (negative maximum) amplitude, and the soundwire=20
> stream needs to be enabled to output a zero amplitude (alternating=20
> ones/zeros). Turning on the amp while the soundwire stream is not=20
> enabled will cause jumps between the minimum and zero amplitude.

>>> -	.mute_unmute_on_trigger =3D true,

FWIW for wsa881x in analog mode on RB1/RB2 boards I noticed that pop/clicks
sound behaviour is much better when mute_unmute_on_trigger is false.

Although, for wsa881x in soundwire mode the mute_unmute_on_trigger =3D true
gives decent result of supressing pop/clicks noise on the devices I have.

Maybe it varies from platform to platform and from board to board.

BR,
Alexey

