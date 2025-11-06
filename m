Return-Path: <linux-arm-msm+bounces-80619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4422C3B9FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 15:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E40E1AA5244
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 14:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E1B339B46;
	Thu,  6 Nov 2025 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OnMqOlUp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB2830C343
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762438459; cv=none; b=OHIxG2SfORnJqGC9p5BTpsQsxIu2S1BWKMuhfAieQmcXqETmLMdSYoYZFRhUWpO59cvibeDHkQXIeB4WK2dA3ytHDK3/Mg76OjrgGjrE2ifEvpoYUOhR6nGvcfEjuyFikfyK7BhE4ltue9zuxuxUk/vRzq/6gcDIfc8dtRJo3Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762438459; c=relaxed/simple;
	bh=lCOepWET11/2RBMZIVz12tIfpVzBbtaCqJMFPlkyEcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iC5X6vq+/GsCrqKfIGoBiJG7Y5LWVSFVm28RdBO5PcfZ8G6nUkYLuojusxlZ6trmisHAtWER0LMsmcf33ctK2DYwCXawaKKVxV5q7PYpEpHkQvXR6jeFoLJR4XAiUN1FhtHSbuphOQMkDtqzSV8nvNCw4I1Z/4YuRBInRIPUbbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OnMqOlUp; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-88e51cf965dso129570685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762438455; x=1763043255; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KYFaoUaPqBFs4zpnq3Lm30Kel2vQ+Isi1f4CetV78uY=;
        b=OnMqOlUpSlS2kkoohRdyrIYKjnUGc3ItnqCh7QEhZpVOiCErn7/WgXeIVHFbJeh5Ch
         2gIYYQJOAMWayHqr7y43BGxgq1a8gR8MjqvJswBwDtpe0dUeML//25fnJ1HMj4IUnRhB
         F/CHFw2cgUhj6rbkDx72TqygnArYlItEYS35MFoeSpKEWLcEt3UbUzSwU35Aawyw/1Cf
         9ylv0FY4t+44OExFWbSrMEOvoWul+P2gz80/ryzL1fh+NGLJzfWm4de1C0HC/0pATuGK
         6jTFI07ukE/1BODe/2E8JeNAguCaTA2+KKAulRyNKAKf6R8epMA+eXYQjeRYV0WdgyXU
         +muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438455; x=1763043255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYFaoUaPqBFs4zpnq3Lm30Kel2vQ+Isi1f4CetV78uY=;
        b=PwA2O51Srpqvs4LuCpT1VdzRfyv1OHtVnHpObkx/CnaGIpSxSuLTmQRv9t90/OVIfr
         mV+BEM4fJnQEQfwAUV63N2Ho+qNnTC0ZAsrxr4B4hJmfqqtWVw9hGuo2DfntIA+6yuHE
         IGR7hayk6BkWOr0CRMNo4sne6IBN427s5wj0nqpf3InS+fGYMVFEpmyeFkbkmP0HtnAA
         Ew3p3/MxK1Ny0UnguKrRcbAlWOuJfRLT1znKDLcEx3oRcrNmdUKduS5lU1I/2DjO+7o1
         chDrdmdkZ6Z9ua87ZzO2DkNZ7juoAxhVDJaoz4goJbjaPISdYSdQ5NLsG1W9BCpkg4gG
         7UQw==
X-Forwarded-Encrypted: i=1; AJvYcCX/UOYEn8uYR5acxYkErla8L19eA49jDAW4fLZbQ9P4v7MEAaEO/H1rLvMPSjjrx8/Edao+3laK8xn1ZO/v@vger.kernel.org
X-Gm-Message-State: AOJu0YzwwWP+kLEBhLi1HWO9NiPbeiLsZ01EVs3496S/0KyDfezW4F5/
	JXEISDVx8AedChceBxe9DoJmdpDwrwliUw50h5AHtAdgrKzkD9kDVEHVeDae6TCQ22o9TVxQSEc
	eFzy96du/5qtL8MJlt5PIVNtworW7dOadwq0cjYzWsA==
X-Gm-Gg: ASbGncv5y9ckilVL+38iJ5IJyHeElD2qc4LvkJI9nZH9xwvg1aBnRlUqBvj9588Vx1V
	+BOvbWIBZrU7ZKVkRQRJOO9bu527E5ZUmGYiwmPf459zqMP06xccHWCQlF2YbcIDDj3YlgYv/7w
	pya9XXk48k/Sxq26Lt3S5d7hBYYVTZ37lVPlT1FLQia/Zg8KtvaP+TOO72Qew8cQcv8gysWHIFM
	l3Ctpes9wl5OvVkoDuvTTpP91zOiEHyrkCLyjWC4hMqs6wJWSkzjdHf3gysQfpjoQel5Noylfsg
	ZmNVmcWxQCtVCz3gIi+UicQSWmM6
X-Google-Smtp-Source: AGHT+IEL/OjdpCudnpto7EM9lmyvDKegeMK7BC71b7SfH+up9yag/BCWFhn9z12orK4BrZX5VPjYqt/GlifmAA0brpU=
X-Received: by 2002:a05:620a:454d:b0:8b2:294:1cf1 with SMTP id
 af79cd13be357-8b220b1c9b7mr943868385a.29.1762438455191; Thu, 06 Nov 2025
 06:14:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com> <176235893222.387743.2128022832743502879.b4-ty@arm.com>
In-Reply-To: <176235893222.387743.2128022832743502879.b4-ty@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 6 Nov 2025 14:14:03 +0000
X-Gm-Features: AWmQ_blBAvwJrBuwMN552m9J7iG9zQVh_LDuoQgBSibOW9xk--Ct5-VQl5IDv-s
Message-ID: <CAJ9a7Vji3fFnc-XPhdTxh00QW+AjqLqJo=zt+SMwovttQRwR8Q@mail.gmail.com>
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Linu Cherian <lcherian@marvell.com>, 
	Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Is this fixing the correct problem? If we prevent the buffer size from
being changed while the sink is active - which is probably what we
should do anyway as no real good can come from allowing this - then
the problem disappears.

Changing the buffer size while the sink is active should return -EBUSY;

Mike

On Wed, 5 Nov 2025 at 16:13, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
>
> On Tue, 21 Oct 2025 16:45:25 +0800, Xiaoqi Zhuang wrote:
> > When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> > and enabled again, currently sysfs_buf will point to the newly
> > allocated memory(buf_new) and free the old memory(buf_old). But the
> > etr_buf that is being used by the ETR remains pointed to buf_old, not
> > updated to buf_new. In this case, it will result in a memory
> > use-after-free issue.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] coresight: ETR: Fix ETR buffer use-after-free issue
>       https://git.kernel.org/coresight/c/35501ac3c7d4
>
> Best regards,
> --
> Suzuki K Poulose <suzuki.poulose@arm.com>



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

