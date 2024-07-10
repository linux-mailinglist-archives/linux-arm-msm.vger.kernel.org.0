Return-Path: <linux-arm-msm+bounces-25890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA69A92DA57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 22:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B182B238BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 20:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB10195F3A;
	Wed, 10 Jul 2024 20:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g53VPLWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F988249A;
	Wed, 10 Jul 2024 20:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720644245; cv=none; b=KMxHQv4PrCvkYPjxYRz48L2iouQaSj464/hJQimPhZ6m6g/NgT92E7LK4gu8dLEpkt6GrGFGsTvJm4Z3pET7vbo8EL53dE/NZVslH+JAur193TGZLNOhgAIhmIxWY37fRD0CDflhfEERLBbLK5rpCfvwFJ6Em6jnO5lpDBv3qdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720644245; c=relaxed/simple;
	bh=9n/YiBNZAFtCKNJs9J4qVg6zoK1HVK5GRMT7/tkugk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SuJxS9gT8boYzK28AClTr5TnLXZf2vfOOY2U2gNPa3vZ28Jv2PdQzgMSVI0gvF1nOsICYL385NOH7G4ZoWM6E92rn4hVGWV6+i6bSoLGv635ab5i4t3IpCH/rl0Y4b9ssNAUAbXi8MsQnJYKmrXOwHDrbmDRoCCM9tQEyA3ULW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g53VPLWh; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eea7e2b073so2116331fa.0;
        Wed, 10 Jul 2024 13:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720644242; x=1721249042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q96L90hi9kIYDhvQ8lEOxb1HxG/veUDmgixtXCczj8U=;
        b=g53VPLWhOTNRgBBMMAM51mC5oxLVQ7ifhj7LOoM1iCwg0izn+n2gem5sPliEgsyp99
         SCUCsNgW/1MQiR5ekZYk1zv8iLg2P8w/mdFsIYl0VHIkYaWCXNOzZXBgT1s9VH99te2y
         Pme0NjrXr4+m8e3WhEuB40LAc3GzrHDf10zf4R54BGx7Dfto6C6SXVlPf7vaYPERFpVu
         6+qImjbU4w0RFZzBdRmf1YXJADMUy5ZqZq6iZmfgThZFPfmCzpvi4vYMexpkUhdOIJrt
         5yhOcDkWDmAQi47Dmznc35jU+vVwp5RmCGinwz+6mfei3h4juN0FGU24Ys0I8BCM4Ga6
         FShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720644242; x=1721249042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q96L90hi9kIYDhvQ8lEOxb1HxG/veUDmgixtXCczj8U=;
        b=Rw3OXJUb6L1xqyLGHJw6n9eDcTrIxbrpAZOMZLZZI1ld3ZMyHChKm0Sid4j2rmr6ZC
         rU8FNiWUiAgNT3z/t8q9uDNp9JmYkQIK4jGPaMrpETXfHUZiRpb8dlpgX0vcFXhOJ57D
         lS84NrrkKfMrjJ6jifFE9xwpDW8nyG9aA5KxG36XIA+qNROBp39nFnA/Ih+JXSxZishu
         49KX4GkB4P1SKxfhOWNuaCo2YCd5WwAwAb3/dq2NjFX41EMFeg6sNUhCUbrUViOs9G0S
         h5ofcXfMVgfPGPf4kHqgQAPC2uH8KL0WdtG1cpVkoU1bYWU6d0e1gfm2aXDwklnYBexR
         h2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWPlP9pkfqJiHMksur1vsl9J1abc6yLGxLtqj+erSsFvhy+mkzvxUbDtCHG2oFOHVRg0ZBwBekzuOcvYQGUc/UGDATIFvCAErAQKvxWx9ISVJsvVM+VBdVtReJmQF5wOUNWvMkiGbrDKbPjkRhKZEUshK6awKuV8PQA8yyWjxGEefIxsZnAuI16FAM3cBcgj5Kfz+dxAdzD+HrU3fOZAOYlc8GDHUa/ALXLFUJmtDrYbnAPx22WZP0VnjrO59GicAM=
X-Gm-Message-State: AOJu0YyFJZC57kWyX2Y0Q3ccLQQK7nA5a0KDYxtq7ksQw1yaKdp8M3LB
	M6NkGD6dlAMGU+FTXNGAGCljsMNrljlJPiesVIuIqSn3+CpIulr/QvWrFTh9z2V61uoJV+bNSuO
	myVT0FuG7PT5DqPtzy6ndtniHyk0=
X-Google-Smtp-Source: AGHT+IHURG/sGagfJtYokQfANJj/ymOwtgMawMxrvRuFmItb9BIoJ9IqnHF4+ClawkTFmnwhytU+9+Ynj3Rm/KiYGCs=
X-Received: by 2002:a2e:854e:0:b0:2ee:4f22:33f9 with SMTP id
 38308e7fff4ca-2eeb30fd3e0mr41054391fa.24.1720644241382; Wed, 10 Jul 2024
 13:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org> <172064103479.11923.11962118903624442308.git-patchwork-notify@kernel.org>
In-Reply-To: <172064103479.11923.11962118903624442308.git-patchwork-notify@kernel.org>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 10 Jul 2024 16:43:48 -0400
Message-ID: <CABBYNZKvSF9h1K29oex3kXm+2h+62gwJ8+YJPM0Orap6_xVDTQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Bluetooth: hci_qca: use the power sequencer for wcn7850
To: patchwork-bot+bluetooth@kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, marcel@holtmann.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_bgodavar@quicinc.com, 
	quic_rjliao@quicinc.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, bartosz.golaszewski@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Wed, Jul 10, 2024 at 3:50=E2=80=AFPM <patchwork-bot+bluetooth@kernel.org=
> wrote:
>
> Hello:
>
> This series was applied to bluetooth/bluetooth-next.git (master)
> by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
>
> On Tue, 09 Jul 2024 14:18:31 +0200 you wrote:
> > The following series extend the usage of the power sequencing subsystem
> > in the hci_qca driver.
> >
> > The end goal is to convert the entire driver to be exclusively pwrseq-b=
ased
> > and simplify it in the process. However due to a large number of users =
we
> > need to be careful and consider every case separately.
> >
> > [...]
>
> Here is the summary with links:
>   - [v3,1/6] dt-bindings: bluetooth: qualcomm: describe the inputs from P=
MU for wcn7850
>     https://git.kernel.org/bluetooth/bluetooth-next/c/e1c54afa8526
>   - [v3,2/6] Bluetooth: hci_qca: schedule a devm action for disabling the=
 clock
>     https://git.kernel.org/bluetooth/bluetooth-next/c/a887c8dede8e
>   - [v3,3/6] Bluetooth: hci_qca: unduplicate calls to hci_uart_register_d=
evice()
>     https://git.kernel.org/bluetooth/bluetooth-next/c/cdd10964f76f
>   - [v3,4/6] Bluetooth: hci_qca: make pwrseq calls the default if availab=
le
>     https://git.kernel.org/bluetooth/bluetooth-next/c/958a33c3f9fc
>   - [v3,5/6] Bluetooth: hci_qca: use the power sequencer for wcn7850 and =
wcn6855
>     https://git.kernel.org/bluetooth/bluetooth-next/c/4fa54d8731ec
>   - [v3,6/6] arm64: dts: qcom: sm8650-qrd: use the PMU to power up blueto=
oth
>     (no matching commit)

Last one doesn't apply so you will probably need to rebase or
something if it really needs to go thru bluetooth-next.

> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>
>


--=20
Luiz Augusto von Dentz

