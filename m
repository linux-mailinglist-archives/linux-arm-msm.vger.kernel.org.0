Return-Path: <linux-arm-msm+bounces-15846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FED892CBB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 20:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 738981F2233C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 19:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E38E40871;
	Sat, 30 Mar 2024 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qmNRCtzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8517E200D9
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 19:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711826202; cv=none; b=AVOyp1pRLVhyiZLWQlqDfkZ0LOdKiYEGpBrOqOlWXrzIyKc5tPy8EP/be1eJBCLbwbIY1+IkzdD2qTR5+72XVO0fUUHBEJ6tv3weiH6wXsgDrLixXOozICdgZriL1H4+vkZsxAmBeyG1NBotngXNI8um/ab2gppVgBqmycifuAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711826202; c=relaxed/simple;
	bh=PQzYSWdGRZ4cP6dDQDh9zJNjx7idEEFn4m16bjTIUgQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcSnppYGQGOWJRBSfLGg5SKX8P99zpK1CGmiowqq6lIUBCzb4EVyT3XNMlqXxcjX+4/F8tXla9oyUrGhqzSQDOsA5VKRDgTTTxPnJ0GsCg84i1Mlfoxikea8Q+9s+/xRykx0K/csZUihZO9ulHQ9FONwJ7NpwSvFg/xbtzKMrNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qmNRCtzQ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d6a1ad08b8so29053261fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 12:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711826198; x=1712430998; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzNO0eylLRmxl5CKnUgMEhP824tSUajOLCWbmq5S9Gk=;
        b=qmNRCtzQ4TlZgMH9rV8P4aNkkaD618EiJK30N8EMak4Lvpk5SQ/mzg+5+uVRjm6zAO
         gSseMDaSYsz8oZv+gWq0LBFDCfRjVfW2hyLWfWPKZSrzvCDjLEVrLSq8QO+L+UM96qlf
         RK6nUUInRsM4iky1vMZgnV9z32awsM6/Ihwhnq/pK3zwh2pW7ls8xD54qlKAfnT7jr8F
         xZUGAYo3q5/+kgJHhtnbpOyEFkdeBhjeXqdMeAOQNpoaFl9rT/OUrZzG4VWeyPg0qhfz
         3wnK/LY1/4WK10zlgM2/VvbHFC4I7gjNJ1icrogVIyM497JOfcFLzKXmsmNAFnSaZWSi
         cEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711826198; x=1712430998;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzNO0eylLRmxl5CKnUgMEhP824tSUajOLCWbmq5S9Gk=;
        b=jroZAGLsytQmlV//axjbkTfOxWJf3DzAC2e5pkd6CWxK9fU0R0NzxlKoFBWCpHCZjO
         ud2JZtnUlh6DysA1jp+FvG0MdTyZ5YwLpRATyyJuDsKTNH/rX3ZL2HLnRLbozXMntMG1
         +RfXVjZnpY3yiz1OkkirYGaXe62OMjwD6DVi2WYoY515A30GHBVD/8I0OMHXLyk4aqMo
         ZGNpGSYqi2yh556/P5Lvf2d2I36Usgu1FN3iAmTzJjk/muUc/rP6PdqJtD/UxRvn6Pca
         nYgtzyQx06/Ekr3yq5uGoyD1afqr1gkZEf6UiD1qhb3sfiEJDC87o8b7XwbSOwh5EMnC
         NdsA==
X-Forwarded-Encrypted: i=1; AJvYcCVJZhcYHDOLUNLFZORMOdFasuIWwQfKSZBL0JMDjGv+tg2pqzt5pGGfs27QZYhJhdTPc0+QRlelYpnfy2FUfsMiQUIYaI6zKRVMoe0qPw==
X-Gm-Message-State: AOJu0Yy+aYP6tUyz5KDGXjxoeGKWCjJ6KhFegT9yUu8YaLkQA6ZMxjAm
	y/xyGa4mHZa/3tjRYLnsainIG5vLcc+RqflIHjRH8yQLZ6PtvfXXm3hyKbgdI9xrXr6GdIhklR8
	BZtUBAI2Flj3I2k00Z8HMy0g4CY+NsEsPXQqqNw==
X-Google-Smtp-Source: AGHT+IGYhkeCNEphM9rgDRQN7Cv6JelN3QFP9e89R69ipGch9sbXM4htepuLkkotAqfGavqXEXQJ+tx9mYuPKfWH56I=
X-Received: by 2002:a05:651c:20c:b0:2d4:5d3e:9650 with SMTP id
 y12-20020a05651c020c00b002d45d3e9650mr3886410ljn.43.1711826198066; Sat, 30
 Mar 2024 12:16:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 30 Mar 2024 12:16:37 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <9db0fc7b-f24a-4d76-b8bd-ec577ecba0c6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325100359.17001-1-brgl@bgdev.pl> <56e1c63a-4c09-4d92-9ef2-aad5390879cc@gmail.com>
 <CAMRc=Mf_pvrh2VMfTVE-ZTypyO010p=to-cd8Q745DzSDXLGFw@mail.gmail.com>
 <CAMRc=MfsVWcoMC-dB-fdxy332h-ucUPTfEUMAnCt5L-q3zJxWg@mail.gmail.com>
 <82f94b54-82d1-49b9-badf-63d948b347fc@gmail.com> <97e1f121-9e84-4e63-9c9c-57e2de0b29d7@gmail.com>
 <CAMRc=McLJFGcy-A6PZNmjgDXnvx8z0J4k-Dbak-txvWnycHG2A@mail.gmail.com>
 <2b1dc031-d645-494c-9103-a2bb422ea60b@gmail.com> <CAMRc=MdoSPuedbGhy4toDEkw0vSzESDz2bXGpyt_=R4hqXW+Uw@mail.gmail.com>
 <9b1e5ea0-bb32-4c42-b2e9-204bde31b905@gmail.com> <CACMJSesvM6_PhhR_2sP4JX6bR4ytVVg=MwWBEVrCHf5FNp2JXw@mail.gmail.com>
 <9db0fc7b-f24a-4d76-b8bd-ec577ecba0c6@gmail.com>
Date: Sat, 30 Mar 2024 12:16:37 -0700
Message-ID: <CAMRc=Me9x1OXKXXxyhzZ6mxffmaoq=4QhMXCL6L71_xso2epWA@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] firmware: qcom: qseecom: convert to using the TZ allocator
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2024 20:57:52 +0100, Maximilian Luz
<luzmaximilian@gmail.com> said:
> On 3/29/24 8:46 PM, Bartosz Golaszewski wrote:
>> On Fri, 29 Mar 2024 at 20:39, Maximilian Luz <luzmaximilian@gmail.com> wrote:
>>>
>>> On 3/29/24 8:26 PM, Bartosz Golaszewski wrote:
>>>> On Fri, 29 Mar 2024 at 20:22, Maximilian Luz <luzmaximilian@gmail.com> wrote:
>>>>>
>>>>> On 3/29/24 8:07 PM, Bartosz Golaszewski wrote:
>>>>>>
>>>>>> Both with and without SHM bridge?
>>>>>
>>>>> With CONFIG_QCOM_TZMEM_MODE_GENERIC=y (and the upcoming fix) everything
>>>>> works. With CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y things unfortunately
>>>>> still get stuck at boot (regardless of the fix). I think that's
>>>>> happening even before anything efivar related should come up.
>>>>>
>>>>
>>>> This is on X13s? I will get one in 3 weeks. Can you get the bootlog
>>>> somehow? Does the laptop have any serial console?
>>>
>>> Surface Pro X (sc8180x), but it should be similar enough to the X13s in
>>> that regard. At least from what people with access to the X13s told me,
>>> the qseecom stuff seems to behave the same.
>>>
>>> Unfortunately I don't have a direct serial console. Best I have is
>>> USB-serial, but it's not even getting there. I'll have to try and see if
>>> I can get some more info on the screen.
>>>
>>
>> I have access to a sc8180x-primus board, does it make sense to test
>> with this one? If so, could you give me instructions on how to do it?
>
> I guess it's worth a shot.
>
>  From what I can tell, there shouldn't be any patches in my tree that
> would conflict with it. So I guess it should just be building it with
> CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y and booting.
>
> I am currently testing it on top of a patched v6.8 tree though (but that
> should just contain patches to get the Pro X running). You can find the
> full tree at
>
>      https://github.com/linux-surface/kernel/tree/spx/v6.8
>
> The last commit is the fix I mentioned, so you might want to revert
> that, since the shmem issue triggers regardless of that and it prevents
> your series from applying cleanly.
>
> Best regards,
> Max
>

sc8180x-primus' support upstream is quite flaky. The board boots 50% of time.
However it's true that with SHM bridge it gets to:

mount: mounting efivarfs on /sys/firmware/efi/efivars failed:
Operation not supported

and stops 100% of the time. Without SHM bridge I cannot boot it either because
I suppose I need the patch you sent yesterday. I haven't had the time to
rebase it yet, it's quite intrusive to my series.

I can confirm that with that patch the board still boots but still 50% of the
time.

Bart

