Return-Path: <linux-arm-msm+bounces-66981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45C9B14C4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCB86545D03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 10:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F8A28A73F;
	Tue, 29 Jul 2025 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kCOidPYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E2289E1F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753785398; cv=none; b=VblcqkBm9ozjVtVekfgBtUgXzp9NC2KOM4fDdFUx5/K/r13zaTyD0rY1KaBW3YV1PxbROX/FIpE32P6bRniGVp0/ikg5qU9ux6IBqWeuW2QSy8e86mEEx6oOPKbj9mtCk0b/mNjTw0qHSNs1Iseil0y7wHGVSmYZouGKCVece94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753785398; c=relaxed/simple;
	bh=4y4mEOfsSR1cgK2xUxp/Zjo6fOf5T8DLB4XNkXz+I0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXD800HKTqdrBWDH+FZDWvVQwQkDWX6j3jGF7EgUYYn3z3tuoJ+IP23pBGbnDa2IC5M526+Oj1hB/9gFDm6pBSiTjF3nlIUDZdqSAp7WMMeIftosBcm4r9nkxlqBI0nINw5kuhzMHFa5Mv4Ht4NhgD+WXm9RXV8MLAld0umGxQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kCOidPYk; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74264d1832eso6335285b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753785396; x=1754390196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53Iaf1Ni4knGIeWui6/jwv1U1nW/QaU+PGxRqHF0ELg=;
        b=kCOidPYkREyG/aYiwnuEhwK6O+eJOepwONy0eT7Rrv5+4o0tpKRbQfot+GSUmXrRiQ
         RU87/dSxIEO7WjZmRmKVjEhl1+7QyUDsQIx9Yw/gAtaNkNWZjpggqfS2uClEV3lxN2bb
         P+Ug5iieE93ZhcacLsPcGdOer1T6V3uSiPs0kYKgPdEBMuZ65jDoXrfkoqYGYNTOP6FW
         3qYDLvk+QDzdoJSNILffgm6Ge4Z5oYW7nljvqEVY9VFxKq0NAPeZlypVYrFsJr/fVg7D
         gITzy1HR/dmDOtUB9i3pRMc2HEFMwgD/n1EoTDbsH6bEcadRtrQZSK8vOrf47mXRJ4Zj
         YFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753785396; x=1754390196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53Iaf1Ni4knGIeWui6/jwv1U1nW/QaU+PGxRqHF0ELg=;
        b=GgVqUTwX14Rm0J3DUNa8qh8rQFKfpB6tsS3VzR0GgAGmOrHM23pcTX9sXGtaZUSgL9
         ekFdiKquZcAgH/SZJtzolNAxtO+YzgDmlhJrv2Ul5k01GWzsvq2HyKXzuvvCLalk0Bxs
         7VVavt6z9V/HhmvqO380mrxX4shPcaV9bKQxluSFn0bgAErlcpgjKvDPLEa2czRKZ3jF
         sJeRVqvpB8K6ttZXjyXugxJxpWXg9VBuiKx7YQSHvPCcVGKtvPk3oQP1TO2ceks8wRF6
         h3x5Si9xjU1U0KFjLj9pqoNDlNLhctSwl3wAL3CcBmrMsa9f9o4PeIty0Um9KejZRRHM
         KYFw==
X-Forwarded-Encrypted: i=1; AJvYcCVG3nDTuDrDKTwH7AwhHzPfiAkvu/m3hXeqk01O3ZEHMCxt+sQSGJYiE9aarC477lngRR4PonpNfSzMuR7+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn/KBoYpwI9QxpSncjwGD4h8OE/jDIOd8hi2vc13D0NxYByBLM
	qP8uOtU7pypYg4msCr9X4eR+XG//KysUZEOcJC+PwF/5AXDcw+cxavEoIDPCTd+XdAtEoqCZiYq
	z/G69ZkwYkP2mbEyULxhND2xtXqZIOerxwEt0HlmXjw==
X-Gm-Gg: ASbGnctWUoo+oq7offC4poaksdPp3LEcaWzM9kix5r5tpIjQU2l8Vbg9KlaoRLWJsi3
	NN/p3z7P1Q4ojuC9etvAniK95NQRwc/MWGyHdLXRcBVOFv3eQmozO+2sCoNuxlwjQyvow7Pse15
	aGXydaksXhfj+tzOwWnBAXk3sMP6V6HsIjhbXxgDb3Tme7IF7SshASst/bD83htyqLv9iaFQRWX
	VdehUoJS+EtpIGTBHVpFRAmH2QjVMt02qEVzsxV
X-Google-Smtp-Source: AGHT+IE3Pz2vs+uu38MEtKL2QIq5gFNFrNISiGlxayzKyIGgIj04bzDXLXaMr3nrMIlwUCja0mH5P47vElYgU1hRJEk=
X-Received: by 2002:aa7:8882:0:b0:756:a033:596e with SMTP id
 d2e1a72fcca58-76337aed06bmr23178529b3a.22.1753785395250; Tue, 29 Jul 2025
 03:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709104114.22240-1-songchai@qti.qualcomm.com>
 <CAJ9a7Vgrm+Hog58C=Zknc1AiJ8MX6u6CRKjm333Qqt02A42Hug@mail.gmail.com> <5756f9fb-b9f7-4ca9-98d9-078ba2146f27@quicinc.com>
In-Reply-To: <5756f9fb-b9f7-4ca9-98d9-078ba2146f27@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 29 Jul 2025 11:36:23 +0100
X-Gm-Features: Ac12FXyYFGLaqXLkVt3O6f8biHqVCMoYnqFyDMEg-pZUzKcCYz-kzBWLMO0IKlw
Message-ID: <CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Provides support for Trigger Generation Unit
To: Songwei Chai <quic_songchai@quicinc.com>
Cc: songchai <songchai@qti.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 23 Jul 2025 at 07:33, Songwei Chai <quic_songchai@quicinc.com> wrot=
e:
>
>
> On 7/21/2025 9:39 PM, Mike Leach wrote:
>
> Hi,
>
> On Wed, 9 Jul 2025 at 11:41, songchai <songchai@qti.qualcomm.com> wrote:
>
> From: Songwei Chai <quic_songchai@quicinc.com>
>
> Provide support for the TGU (Trigger Generation Unit), which can be
> utilized to sense a plurality of signals and create a trigger into
> the CTI or generate interrupts to processors once the input signal
> meets the conditions. We can treat the TGU=E2=80=99s workflow as a flowsh=
eet,
> it has some =E2=80=9Csteps=E2=80=9D regions for customization. In each st=
ep region,
> we can set the signals that we want with priority in priority_group, set
> the conditions in each step via condition_decode, and set the resultant
> action by condition_select. Meanwhile, some TGUs (not all) also provide
> timer/counter functionality. Based on the characteristics described
> above, we consider the TGU as a helper in the CoreSight subsystem.
> Its master device is the TPDM, which can transmit signals from other
> subsystems, and we reuse the existing ports mechanism to link the TPDM to
> the connected TGU.
>
> Here is a detailed example to explain how to use the TGU:
>
> In this example, the TGU is configured to use 2 conditions, 2 steps, and
> the timer. The goal is to look for one of two patterns which are generate=
d
> from TPDM, giving priority to one, and then generate a trigger once the
> timer reaches a certain value. In other words, two conditions are used
> for the first step to look for the two patterns, where the one with the
> highest priority is used in the first condition. Then, in the second step=
,
> the timer is enabled and set to be compared to the given value at each
> clock cycle. These steps are better shown below.
>
>             |-----------------|
>             |                 |
>             |       TPDM      |
>             |                 |
>             |-----------------|
>                      |
>                      |
>   --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
>   |                  |                                                 |
>   |                  |                          |--------------------| |
>   |    |---- --->    |                          |  Go to next steps  | |
>   |    |             |                |--- ---> |  Enable timer      | |
>   |    |             v                |         |                    | |
>   |    |    |-----------------|       |         |--------------------| |
>   |    |    |                 |  Yes  |                    |           |
>   |    |    |   inputs=3D=3D0xB   | ----->|                    | <-------=
- |
>   |    |    |                 |       |                    |      No | |
>   | No |    |-----------------|       |                    v         | |
>   |    |             |                |          |-----------------| | |
>   |    |             |                |          |                 | | |
>   |    |             |                |          |      timer>=3D3   |-- =
|
>   |    |             v                |          |                 |   |
>   |    |    |-----------------|       |          |-----------------|   |
>   |    |    |                 |  Yes  |                    |           |
>   |    |--- |   inputs=3D=3D0xA   | ----->|                    | Yes     =
  |
>   |         |                 |                            |           |
>   |         |-----------------|                            v           |
>   |                                              |-----------------|   |
>   |                                              |                 |   |
>   |                                              |      Trigger    |   |
>   |                                              |                 |   |
>   |                                              |-----------------|   |
>   |  TGU                                                   |           |
>   |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
>                                                            |
>                                                            v
>                                                   |-----------------|
>                                                   |The controllers  |
>                                                   |which will use   |
>                                                   |triggers further |
>                                                   |-----------------|
>
> steps:
>        1. Reset TGU /*it will disable tgu and reset dataset*/
>        - echo 1 > /sys/bus/coresight/devices/<tgu-name>/reset_tgu
>
>        2. Set the pattern match for priority0 to 0xA =3D 0b1010 and for
>           priority 1 to 0xB =3D 0b1011.
>        - echo 0x11113232 > /sys/bus/coresight/devices/<tgu-name>/step0_pr=
iority0/reg0
>        - echo 0x11113233 > /sys/bus/coresight/devices/<tgu-name>/step0_pr=
iority1/reg0
>
>        Note:
>             Bit distribution diagram for each priority register
>     |-------------------------------------------------------------------|
>     |   Bits          |       Field Nam   |    Description              |
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |     29:28       |   SEL_BIT7_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |     25:24       |   SEL_BIT6_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |     21:20       |   SEL_BIT5_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |     17:16       |   SEL_BIT4_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |     13:12       |   SEL_BIT3_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |      9:8        |   SEL_BIT2_TYPE2  | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |      5:4        |  SEL_BIT1_TYPE2   | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>     |                 |                   | 00 =3D bypass for OR output  =
 |
>     |      1:0        |  SEL_BIT0_TYPE2   | 01 =3D bypass for AND output =
 |
>     |                 |                   | 10 =3D sense input '0' is tru=
e|
>     |                 |                   | 11 =3D sense input '1' is tru=
e|
>     |-------------------------------------------------------------------|
>         These bits are used to identify the signals we want to sense, wit=
h
>         a maximum signal number of 140. For example, to sense the signal
>         0xA (binary 1010), we set the value of bits 0 to 13 to 3232, whic=
h
>         represents 1010. The remaining bits are set to 1, as we want to u=
se
>         AND gate to summarize all the signals we want to sense here. For
>         rising or falling edge detection of any input to the priority, se=
t
>         the remaining bits to 0 to use an OR gate.
>
>        3. look for the pattern for priority_i i=3D0,1.
>        - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step0_condition=
_decode/reg0
>        - echo 0x30 > /sys/bus/coresight/devices/<tgu-name>/step0_conditio=
n_decode/reg1
>
>     |--------------------------------------------------------------------=
-----------|
>     |   Bits          |    Field Nam        |            Description     =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |For each decoded condition, =
this       |
>     |      24         |       NOT           |inverts the output. If the c=
ondition   |
>     |                 |                     |decodes to true, and the NOT=
 field     |
>     |                 |                     |is '1', then the output is N=
OT true.   |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from the=
 associated|
>     |      21         |  BC0_COMP_ACTIVE    |comparator will be actively =
included in|
>     |                 |                     |the decoding of this particu=
lar        |
>     |                 |                     |condition.                  =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from the=
 associated|
>     |                 |                     |comparator will need to be 1=
 to affect |
>     |      20         |   BC0_COMP_HIGH     |the decoding of this conditi=
on.        |
>     |                 |                     |Conversely, a '0' here requi=
res a '0'  |
>     |                 |                     |from the comparator         =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from the=
 associated|
>     |      17         |                     |comparator will be actively =
included in|
>     |                 |  TC0_COMP_ACTIVE    |the decoding of this particu=
lar        |
>     |                 |                     |condition.                  =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from the=
 associated|
>     |                 |                     |comparator will need to be 1=
 to affect |
>     |      16         |  TC0_COMP_HIGH      |the decoding of this particu=
lar        |
>     |                 |                     |condition.Conversely, a 0 he=
re         |
>     |                 |                     |requires a '0' from the comp=
arator     |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from Pri=
ority_n    |
>     |                 |                     |OR logic will be actively   =
           |
>     |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of =
           |
>     |                 |    (n=3D0,1,2,3)      |this particular condition.=
             |
>     |                 |                     |                            =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from Pri=
ority_n    |
>     |                 |                     |will need to be '1' to affec=
t the      |
>     |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular =
           |
>     |                 |    (n=3D0,1,2,3)      |condition. Conversely, a '=
0' here      |
>     |                 |                     |requires a '0' from Priority=
_n OR logic|
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from Pri=
ority_n    |
>     |                 |                     |AND logic will be actively  =
           |
>     |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of =
this       |
>     |                 |  (n=3D0,1,2,3)        |particular condition.     =
             |
>     |                 |                     |                            =
           |
>     |--------------------------------------------------------------------=
-----------|
>     |                 |                     |When '1' the output from Pri=
ority_n    |
>     |                 |                     |AND logic will need to be '1=
' to       |
>     |      4n         | Priority_n_AND_HIGH |affect the decoding of this =
           |
>     |                 |   (n=3D0,1,2,3)       |particular condition. Conv=
ersely,      |
>     |                 |                     |a '0' here requires a '0' fr=
om         |
>     |                 |                     |Priority_n AND logic.       =
           |
>     |--------------------------------------------------------------------=
-----------|
>         Since we use `priority_0` and `priority_1` with an AND output in =
step 2, we set `0x3`
>         and `0x30` here to activate them.
>
>        4. Set NEXT_STEP =3D 1 and TC0_ENABLE =3D 1 so that when the condi=
tions
>           are met then the next step will be step 1 and the timer will be=
 enabled.
>        - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condi=
tion_select/reg0
>        - echo 0x20008 > /sys/bus/coresight/devices/<tgu-name>/step0_condi=
tion_select/reg1
>
>         |----------------------------------------------------------------=
-------------|
>         |   Bits          |       Field Nam   |            Description   =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This field defines the nex=
t step the   |
>         |    18:17        |     NEXT_STEP     |TGU will 'goto' for the as=
sociated     |
>         |                 |                   |Condition and Step.       =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |For each possible output t=
rigger       |
>         |    13           |     TRIGGER       |available, set a '1' if yo=
u want       |
>         |                 |                   |the trigger to go active f=
or the       |
>         |                 |                   |associated condition and S=
tep.         |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will cause BC0 to inc=
rement if the|
>         |    9            |     BC0_INC       |associated Condition is de=
coded for    |
>         |                 |                   |this step.                =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will cause BC0 to dec=
rement if the|
>         |    8            |     BC0_DEC       |associated Condition is de=
coded for    |
>         |                 |                   |this step.                =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will clear BC0 count =
value to 0 if|
>         |    7            |     BC0_CLEAR     |the associated Condition i=
s decoded    |
>         |                 |                   |for this step.            =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will cause TC0 to inc=
rement until |
>         |    3            |     TC0_ENABLE    |paused or cleared if the a=
ssociated    |
>         |                 |                   |Condition is decoded for t=
his step.    |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will cause TC0 to pau=
se until     |
>         |    2            |     TC0_PAUSE     |enabled if the associated =
Condition    |
>         |                 |                   |is decoded for this step. =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will clear TC0 count =
value to 0   |
>         |    1            |     TC0_CLEAR     |if the associated Conditio=
n is         |
>         |                 |                   |decoded for this step.    =
             |
>         |----------------------------------------------------------------=
-------------|
>         |                 |                   |This will set the done sig=
nal to the   |
>         |    0            |     DONE          |TGU FSM if the associated =
Condition    |
>         |                 |                   |is decoded for this step. =
             |
>         |----------------------------------------------------------------=
-------------|
>         Based on the distribution diagram, we set `0x20008` for `priority=
0` and `priority1` to
>         achieve "jump to step 1 and enable TC0" once the signal is sensed=
.
>
>        5. activate the timer comparison for this step.
>        -  echo 0x30000  > /sys/bus/coresight/devices/<tgu-name>/step1_con=
dition_decode/reg0
>
>         |----------------------------------------------------------------=
---------------|
>         |                 |                     |When '1' the output from=
 the associated|
>         |      17         |                     |comparator will be activ=
ely included in|
>         |                 |  TC0_COMP_ACTIVE    |the decoding of this par=
ticular        |
>         |                 |                     |condition.              =
               |
>         |----------------------------------------------------------------=
---------------|
>         |                 |                     |When '1' the output from=
 the associated|
>         |                 |                     |comparator will need to =
be 1 to affect |
>         |      16         |  TC0_COMP_HIGH      |the decoding of this par=
ticular        |
>         |                 |                     |condition.Conversely, a =
0 here         |
>         |                 |                     |requires a '0' from the =
comparator     |
>         |----------------------------------------------------------------=
---------------|
>         Accroding to the decode distribution diagram , we give 0x30000 he=
re to set 16th&17th bit
>         to enable timer comparison.
>
>        6. Set the NEXT_STEP =3D 0 and TC0_PAUSE =3D 1 and TC0_CLEAR =3D 1=
 once the timer
>           has reached the given value.
>        - echo 0x6 > /sys/bus/coresight/devices/<tgu-name>/step1_condition=
_select/reg0
>
>        7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
>           i.e. when the timer reaches 3.
>        - echo 0x2000 > /sys/bus/coresight/devices/<tgu-name>/step1_condit=
ion_select/default
>
>         Note:
>             1. 'default' register allows for establishing the resultant a=
ction for
>             the default condition
>
>             2. Trigger:For each possible output trigger available from
>             the Design document, there are three triggers: interrupts, CT=
I,
>             and Cross-TGU mapping.All three triggers can occur, but
>             the choice of which trigger to use depends on the user's
>             needs.
>
>        8. Compare the timer to 3 in step 1.
>        - echo 0x3 > /sys/bus/coresight/devices/<tgu-name>/step1_timer/reg=
0
>
>        9. enale tgu
>        - echo 1 > /sys/bus/coresight/devices/<tgu-name>/enable_tgu
> ---
> Link to V5: https://lore.kernel.org/all/20250529081949.26493-1-quic_songc=
hai@quicinc.com/
>
> Changes in V6:
> - Replace spinlock with guard(spinlock) in tgu_enable.
> - Remove redundant blank line.
> - Update publish date and contact member's name in "sysfs-bus-coresight-d=
evices-tgu".
> ---
> Link to V4: https://patchwork.kernel.org/project/linux-arm-msm/cover/2025=
0423101054.954066-1-quic_songchai@quicinc.com/
>
> Changes in V5:
> - Update publish date and kernel_version in "sysfs-bus-coresight-devices-=
tgu"
> ---
> Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1-quic_son=
gchai@quicinc.com/
>
> Changes in V4:
> - Add changlog in coverletter.
> - Correct 'year' in Copyright in patch1.
> - Correct port mechansim description in patch1.
> - Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' fro=
m dt-binding
> and set them through reading DEVID register as per Mike's suggestion.
> - Modify tgu_disable func to make it have single return point in patch2 a=
s per
> Mike's suggestion.
> - Use sysfs_emit in enable_tgu_show func in ptach2.
> - Remove redundant judgement in enable_tgu_store in patch2.
> - Correct typo in description in patch3.
> - Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in pacth=
3 as
> per Mike's suggestion.
> - Remove tgu_dataset_ro definition in patch3
> - Use #define constants with explanations of what they are rather than
> arbitrary magic numbers in patch3 and patch4.
> - Check -EINVAL before using 'calculate_array_location()' in array in pat=
ch4.
> - Add 'default' in 'tgu_dataset_show''s switch part in patch4.
> - Document the value needed to initiate the reset in pacth7.
> - Check "value" in 'reset_tgu_store' and bail out with an error code if 0=
 in patch7.
> - Remove dev_dbg in 'reset_tgu_store' in patch7.
> ---
> Link to V2: https://lore.kernel.org/all/20241010073917.16023-1-quic_songc=
hai@quicinc.com/
>
> Changes in V3:
> - Correct typo and format in dt-binding in patch1
> - Rebase to the latest kernel version
> ---
> Link to V1: https://lore.kernel.org/all/20240830092311.14400-1-quic_songc=
hai@quicinc.com/
>
> Changes in V2:
>  - Use real name instead of login name,
>  - Correct typo and format in dt-binding and code.
>  - Bring order in tgu_prob(declarations with and without assignments) as =
per
> Krzysztof's suggestion.
>  - Add module device table in patch2.
>  - Set const for tgu_common_grp and tgu_ids in patch2.
>  - Initialize 'data' in tgu_ids to fix the warning in pacth2.
> ---
>
> Songwei Chai (7):
>   dt-bindings: arm: Add support for Coresight TGU trace
>   coresight: Add coresight TGU driver
>   coresight-tgu: Add signal priority support
>   coresight-tgu: Add TGU decode support
>   coresight-tgu: add support to configure next action
>   coresight-tgu: add timer/counter functionality for TGU
>   coresight-tgu: add reset node to initialize
>
>  .../testing/sysfs-bus-coresight-devices-tgu   |  51 ++
>  .../bindings/arm/qcom,coresight-tgu.yaml      |  92 +++
>  drivers/hwtracing/coresight/Kconfig           |  11 +
>  drivers/hwtracing/coresight/Makefile          |   1 +
>  drivers/hwtracing/coresight/coresight-tgu.c   | 776 ++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tgu.h   | 255 ++++++
>  6 files changed, 1186 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices=
-tgu
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-=
tgu.yaml
>  create mode 100644 drivers/hwtracing/coresight/coresight-tgu.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-tgu.h
>
>
> As per the discussion here in v3 of this patchset
>
> https://lists.infradead.org/pipermail/linux-arm-kernel/2025-March/1012896=
.html
>
> this component is primarily a part of the qualcom proprietary QPMDA
> subsystem, and is capable of operating independently from the
> CoreSight hardware trace generation system.
>
> The only link to Coresight is via the trigger input to CTI
> component(s).  CTI triggers can either be part of the ARM architected
> or recommended connections between Coresight infrastructure from the
> coresight specs and TRM documents, or platform specific triggers from
> components external to coresight. For example on the Juno board a
> trigger from the PL011 serial port is input to one of the system CTIs
> on the board.
>
> Having Coresight management registers does not necessarily mean that
> the component should be maintained under the hwtracing/coresight. Some
> ARM Corelink interconnect components have the capability to generate
> ATB trace into the coresight subsystem, and have some of the coresight
> management registers. However, I would not expect the drivers for
> these components to appear in hwtracing/coresight.
>
> As such this component could probably be better managed and maintained
> as part of the /drivers/soc/qcom or similar area.
>
> The only changes to the Coresight infrastructure you should need to
> get this component connected, is to alter the CTI declaration in board
> device tree to add the incoming trigger as per the CTI bindings.
>
> Regards
>
> Mike
>
> Hi Mike,
>
> Thank you very much for your detailed feedback and for pointing out the a=
rchitectural considerations
> regarding the component's relationship with Coresight and the QPMDA subsy=
stems. We fully understand
> and appreciate your perspective on keeping the driver organization clean =
and aligned with subsystem boundaries.
>
> However, we would like to offer a slightly different view regarding the p=
lacement of this driver:
> The TGU driver here exposes sysfs interfaces for user interaction and con=
figuration. This kind of interface is generally not acceptable
> under /driver/soc/qcom, which is typically reserved for passive platform =
drivers without user-facing interfaces.
>
> Given this, we'd like to ask your opinion on an alternative:
> Would it be acceptable to create a new sub directory under  /hwtracing/qc=
om to host this driver?
> Alternatively, we could consider placing it under /driver/misc if that's =
more appropriate.
>
> Our preference would be place it under /driver/hwtracing/qcom, as this wo=
uld provide a natural
> home form Qualcomm-specific trace-related components that are adjacent to=
, but not strictly
> part of, the Coresight architecture. This could also help organize future=
 drivers that share similar
> characteristics.
>

I am unsure on the procedure for creating new sub-directories for code
in the kernel, but one key thing you do need is a maintainer for the
code.
The reason I suggested /driver/soc/qcom, was that this had qualcomm
specific code with active maintainers.

I recommend  you consult with those responsible for maintaining
qualcomm code within the kernel for the best course of action.

Regards

Mike

> Looking forward to your thoughts.
>
> BRs,
> Songwei
>
>
>
>
>
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK
>


--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

