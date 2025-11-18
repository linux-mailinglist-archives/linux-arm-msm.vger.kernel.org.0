Return-Path: <linux-arm-msm+bounces-82239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CC8C68ADA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B1E8335424D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599A732D0F1;
	Tue, 18 Nov 2025 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTJjlrfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7754C32D0ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460054; cv=none; b=slaTqBIlYomgBk9+qhnOgoo4OqM4SbucbmtXLTe7Z+IFNDAmfNTNL0gddSYkvWcUGYuoqHx6bnqSVrwurbr+FwBlhG3KxFa5jLWSObn050a73bo9/lkhuOcRO7FPkHVHR2G3TMobPcBNd1hktvuqqd0mUu9EcjHs6V+/qTJDRSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460054; c=relaxed/simple;
	bh=9S4xr4CYXwrWKuY4wbzgmhzYcQfMrKSokVjk5flBXMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqVSLjTDdtIAg7mD2gwLdtbrcsbawzZj5Jqlk2kdC1rdQenxKXDv/0hxpDfa+S9ptjxyb4n/hsj1ZJIdfnBVeGXYCxUjGkaLT/rlAN0mrH2GNhXCjPtf8wyrbiW4LJFZTMrDqXmeHSCKDq44kOfMmZzXG1eo+8tYOdB9Ju6+E9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTJjlrfc; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b736d883ac4so691524966b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763460051; x=1764064851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iywdmBD+VhwBMrcRtKZbSQ53n9WTzX5M1vRO8aphD6U=;
        b=lTJjlrfctzQz1o1r7VIMoD7miZDcu1GBSTSJgpPuhWdpm0K6xEBLIzI0XXVNRJ2FW6
         Pz8Q2e9nKnTJhvblf4HVQB637uTy8ZK3L756UOUQShr1q7ndsPUz1ZahQ1z1JVCZB87C
         oxTiHQR73C3+2hvkzYPR8r2aVcYxpfnTVQGanFUzXQRjNHcPE19awzu4JH9MBgQNJwr8
         sAjCnylovc0aIKe18JkjlK85blTNgPxESED9pwONTw+W7NhviLcdFidLgcZafTOCyl/9
         XfobLhWi8PwQX1PTbt33ULhsUBP/fKiXPL9/OdtXMuiIz9cyn/TxljN9L9d1w/DD3cZp
         nXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460051; x=1764064851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iywdmBD+VhwBMrcRtKZbSQ53n9WTzX5M1vRO8aphD6U=;
        b=K1PH1cGKmP4nxq9ZldPxU00lSMSg7l3zXweClOk4DC+d8eEHmOESpHJOByMC4QmFKZ
         JfKC4AJJnn7RHhv7f/fSXYTpInCO/kpG/RY/y+QzU8m5BZjSPholzhAjWmLYmJd8CR9i
         ZJGGgx0NNdFRb5CVKqQfk67fMXyMYTWRfUgjJA0sAlPn6sI8p3qroSPIv0aqTs2MaoxI
         NqiJbJ1+9yUBswjSVUkVcXy1LlL9SQuyTGWMiLBSf/XbrtotcggR9zQtEr8HfyKB+/lT
         NNf6657zU8xDzCrnSbFKtbDxc4yX3u4ve/qhthMUh02EPtGonniiNfcwlXAdocjJxBcV
         xvMw==
X-Forwarded-Encrypted: i=1; AJvYcCULU9uRKrdDINKz4vUd++b3cfGKLRcChZZOGtt9ZHKhF/t2q/DKkmimYxvEGM1iNWKoIPc/A1grcmXYn40u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3LwQUb3KLXGjIkQrnAvoZ0koxMmSNSjs01tzNXL4dUU5ltgoF
	rcmcrsl0RjNBgzEM6+X3upLSWPbH3red2XqOwDdVyl0MdPS2EpPZoRcme/uOt94QnQV8BNy+nH2
	I78DSM+r4nXA2p2y4GXJmZLVhytanZQqk1k/4dAc04A==
X-Gm-Gg: ASbGncsGUc4YB+zWafwxuy5SqsUKqRJNEHnwny3l6Mtv8+4wtQFxTWnjlzEUPBcxAuP
	zTONhF+pFYYrTKALnkQbvOLOxa7XCcxh5Jewsl3E2TZ37ttwoaNjrnWqQRej4pIhqTZqnwDPjnd
	nKQi9VCkQ9SVohcuOYM+ml2qXOCHJlTz9dRkFDkO60eaLwd55UA7FBLobqisHug26bZxh/Mss5j
	uy4RaInR2nEYi0EC+GZI8it/f8rrqJj69ry0je392gcsNnsM/FtnopVOHsT1+4Yt2h5ePqCtVOH
	I7+lq0K1CYg/+Zp34v8Fb4KvglvAmsIvmz4fHz8ET4mfigA=
X-Google-Smtp-Source: AGHT+IG2y5/jZtH9NZI75FwdD1IDitkiskmgikS57draEL4ehsmgro80http+ADk/Q/LueOJWOb+8DfENaPkBLVEV3c=
X-Received: by 2002:a17:907:74c:b0:b73:7440:bd3a with SMTP id
 a640c23a62f3a-b737440c24dmr1394508266b.40.1763460050545; Tue, 18 Nov 2025
 02:00:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251116-next-15nov_expose_sysfs-v1-0-3b7880e5b40e@oss.qualcomm.com>
 <CACMJSeuiL5XEZjh8mOSj7tUnR8wEYSJ6FfZA87v8TSu8xM8_JA@mail.gmail.com> <8b6ba46d-ab64-dbc5-8f09-e810bdef724e@oss.qualcomm.com>
In-Reply-To: <8b6ba46d-ab64-dbc5-8f09-e810bdef724e@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 18 Nov 2025 11:00:39 +0100
X-Gm-Features: AWmQ_bmhSGP4K1CxiqXDz_TEgywv29PzUmaZwkYmdhYOu1LMc2UdU6C8gQtEz1o
Message-ID: <CACMJSesPSt7LM2duVuBOToxL_5e=SQysW4T+hndMu1Ubs5oJwQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] reboot-mode: Expose sysfs for registered reboot modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Nov 2025 at 19:05, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
>
>
> On 11/17/2025 6:33 PM, Bartosz Golaszewski wrote:
> > On Sun, 16 Nov 2025 at 16:20, Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> wrote:
> >>
> >> The reboot-mode framework provides infrastructure for drivers that wan=
t
> >> to implement a userspace reboot command interface. However, there is
> >> currently no standardized way for userspace to discover the list of
> >> supported commands at runtime. This series introduces a sysfs interfac=
e
> >> in the reboot-mode framework to expose the list of supported reboot-mo=
de
> >> commands to userspace. This will enable userspace tools to query
> >> available reboot modes using the sysfs interface.
> >>
> >> Example:
> >>   cat /sys/class/reboot-mode/<driver-name>/reboot_modes
> >>
> >> The series consists of two patches:
> >>   1. power: reset: reboot-mode: Expose sysfs for registered reboot_mod=
es
> >>   2. Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes
> >>
> >> These patches were previously being reviewed as part of =E2=80=9Cvendo=
r resets
> >> for PSCI SYSTEM_RESET2=E2=80=9D, until v17. Following the suggestions =
from
> >> Bjorn, the reboot-mode sysfs patches have been split into a separate
> >> series here, for focused discussions and better alignment.
> >>
> >> Previous discussion on these patches:
> >> https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reb=
oots-v17-5-46e085bca4cc@oss.qualcomm.com/
> >> https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reb=
oots-v17-4-46e085bca4cc@oss.qualcomm.com/
> >>
> >
> > When doing a split like this, please keep the versioning going. This
> > should be v18.
>
> Focus of that original series was "Implementing vendor resets for PSCI SY=
STEM_RESET2".
> These two patches have been split out of that series. The original series=
 will
> still continue to its next version(v18) after addressing all other review=
s.
> So i thought that these two patches can be split out to v1?
>

No, they both continue at v18 so that the origin of this smaller
series is contained.

Bartosz

