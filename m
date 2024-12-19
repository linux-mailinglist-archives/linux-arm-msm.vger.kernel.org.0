Return-Path: <linux-arm-msm+bounces-42798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2799F7D82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 16:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 879EF18956EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378C6762EF;
	Thu, 19 Dec 2024 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLrMFzEy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F641C64;
	Thu, 19 Dec 2024 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734620463; cv=none; b=J1dEsTrWD/GxG9CIYahrTGlXuWKtkJY2paNpa0PuC1uA8o9tka8ALEVfNboyi08+54MV712k4aqT+02kRlr+vySS4YjbAMJmcQ2Sz+/+HIVRyNrQwKTvQxEQKIZrzP8wuDeZO9CjIlYQCYTcDQ8whv4tAIsYYxedXSbQ5Deemvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734620463; c=relaxed/simple;
	bh=sUdALHFj74gKLRdps43bCPFw5VQP45qJykCrkheTLss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Slrk1vFReWIeLelzJtul2WwSQzkJdOeeh50ZzNfuAmKf6laJAF9CooieL7ZqYjHumMAnP+M5H+ELeiP7YhTFQYzCrBpouzgRzoKffz+os1ypDZJnrSthTsU1m1UJx1CKp9++tzSqZk1NsJzBT3++/OO+Sf26gLQYM6C6fCGHgiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLrMFzEy; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a9caa3726fso3027505ab.1;
        Thu, 19 Dec 2024 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734620461; x=1735225261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGSpD3+3yxS9yz0CYWixS3C/FoBfovGzSM7W4jlHvCA=;
        b=WLrMFzEy1jEMMRKrm1WlGF5X2Dk9znyknuAoWJE5vm5QHH9JjBkeTQSNQxfDyPkxY8
         iA5HXf5vwziqrbK337fbYT1rfGFLDV+UKbGure7UxolXhZnsidnS2eez0rXYg5OhgyY7
         9E7/p7CKwFdp2jrFvN26mujAHxyv5JJwc8xZoo7jZI+SfYQPFKfpS7lSlPqMDaW2ZWTV
         uYM3Y+HNVDI4OfnKbXYpLraVkqwxvzAqYUjiCzZS/LTkDaRIIhoyes89q7/Qocmtmx1X
         hgBKpOAwcooZ9sCDxhf1BJcskfr5Uuxd+IuVUYVMK7PtyMsBBgGVBwSoS4b1aiIdM/yF
         MvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734620461; x=1735225261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGSpD3+3yxS9yz0CYWixS3C/FoBfovGzSM7W4jlHvCA=;
        b=huP1lmCFENprC2MsJrdQ8KK5f7K2GK+6uRHuAuIrfsRIiuIPR8Mujwwu0qq/GCYsM6
         MgqttLC7RvOvt7YZI1OYwdnBvMmZg1NCGv6lorLz9IsmdYcri65nVCLesMChbd83r7RH
         /vwjlfknqNUdU/xA1L1zWawcvLWyMYmOmo5BnQ9/Oz17hvvTv9Bp2QxryxPFL8VZfRB+
         9y8wjE7zGQsOQtRGY/3niLk6PEMYIgJr7T/QgxJFSc+lwElc3rA+R7nFz/NxrrhT0kLg
         Klc5Sk5JwJPtAwu0QR1gvA24qzNYI3rCsV1g1YeN12t9LlsfXT0c9ikO8eqNbGUCFcX3
         M6sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUITpAM4iQSIf4HKAeE4rGMdJ8VbrjYxd9CMIm5SwnSxgRcnzkUeF00l00CjCCrVE9h0OZDHTojzvgG3MZn@vger.kernel.org, AJvYcCW+Rp97MVQz51SyJKOuY5L/ykrv4H3JQ8N0gPyqSL25oDkZlJWNjKQmOiL3s1ZZZk2Qn1JyYBOyv9iYXzOo@vger.kernel.org
X-Gm-Message-State: AOJu0YzlTE2aNfzLPtgzzJtEGESfWSXdhdw2YtiowdlD3TF4A4GH6ix+
	EQN+RANmkjRnBXk6MoFQCY4I6XKqP8lmov0bXrc+koXZN0qfnExTQLC1+51Xmwx/BV1KQzvtXe7
	gG7/UM6vcsYpVAjj1RIFj8U9soDisdW59
X-Gm-Gg: ASbGncupn7SIkCSMYm+UiquwN7QIu+6rYoRDcNe0WAZI3K49ZbXKw5X+p8Ag3RFlw9s
	Q18+lFO5zg0xGQdz6Od3apDLRi69eTDq9TRkwhg==
X-Google-Smtp-Source: AGHT+IHp8ABABtvQh+2yyPlFSULZ37QjpTpYXLauYn/rtYNis49Ni4sKHQpdMdeMDdPO+HGJ2/oxRYIljcvIQuXYhZ4=
X-Received: by 2002:a05:6e02:1649:b0:3a7:c81e:825f with SMTP id
 e9e14a558f8ab-3c02e1e9aa7mr36636045ab.9.1734620460446; Thu, 19 Dec 2024
 07:01:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216171017.4881-1-robdclark@gmail.com> <20241219113019.GA23640@willie-the-truck>
 <41d93dac-4ef1-4cc7-a7b2-24c8289f905f@arm.com>
In-Reply-To: <41d93dac-4ef1-4cc7-a7b2-24c8289f905f@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 19 Dec 2024 07:00:48 -0800
Message-ID: <CAF6AEGshSjOr1DE63WiXwAyH39-Tz9B3MEkKUo6sg1jpQPYZcA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 4:08=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2024-12-19 11:30 am, Will Deacon wrote:
> > On Mon, Dec 16, 2024 at 09:10:17AM -0800, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> On mmu-500, stall-on-fault seems to stall all context banks, causing t=
he
> >> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >
> > MMU-500 has public documentation so please can you dig up what the
> > actual behaviour is rather than guess?
>
> Yeah, I'm pretty sure that's not true as stated, especially with
> SCTLR.HUPCF set as qcom_adreno_smmu_write_sctlr() does. However it is
> plausible that at the system interconnect level, a sufficient number of
> stalled transactions might backpressure other transactions from entering
> the same TBU, even if they are destined for a different context. That's
> more about the configuration and integration of individual SoCs than the
> SMMU IP used.

I am aware of the docs and I've spent most of the last couple days
going thru them, as well as the errata, since it would be unfortunate
for debugging to disable this ;-)

The scenario where things lock up involves at least a few thousand
faults in rapid succession.  Disabling CFIE in the irq handler and
re-enabling when I resume translation does stop the flood of irq's but
not the lockup.  It might well be something about how the smmu is
integrated with the interconnect.

BR,
-R

> Robin.
>
> >> This fixes an issue with an older mesa bug taking outo the system
> >> because of GMU going off into the year.
> >
> > Sorry, but I don't understand this sentence.
> >
> > Will
>

