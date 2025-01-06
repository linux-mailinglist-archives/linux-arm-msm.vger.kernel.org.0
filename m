Return-Path: <linux-arm-msm+bounces-44047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB81CA031B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 22:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 077627A1CD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 20:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E05F1DFDB3;
	Mon,  6 Jan 2025 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYYK5M5a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15351DFD81;
	Mon,  6 Jan 2025 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736197193; cv=none; b=qGY66d2MlEAFUEF7Cohvxv2II8msfKu8UF/EfsxeDCMI8Cx/wBtMFrF+cEn+0Mc4y/JMjG/L6dzUhr/R+wuyxEr1m6nx0CdGY8vH9W7D9CUJLz5Zew1KoSvP/011Xl8Ao4hXF+eiG43MD0B15s6EQtgc5U7yfO54dePbAK8/HVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736197193; c=relaxed/simple;
	bh=rcl+1SJA9ofyCXwS1P0TUFxWyoLXf0nJvOCIMKWwf5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJrVrHRt6HFfOuCWoM8zCwmljvyznWyGDiYTrNOpGVDSYEltWtz4FL/1hdHS79N94Oa/ferXA0f8wukSlWDak+TzjskDTJr5FKvQ8TXHox6+UEHYzoYEgRQVijjRuNyoYEmt3rsJ/jtlg/BvJH7DvG8GKV47PPjWGBNzrlHQshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYYK5M5a; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-844d5444b3dso566786639f.1;
        Mon, 06 Jan 2025 12:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736197191; x=1736801991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHlppqM6gvLh+wGWzZMvi4bmlnS1UEsF/Gy7XASBKeY=;
        b=OYYK5M5axKg4OArefbOLW2cigeNR5Ink5apR7u5RC28540jC1hsbkYsdLEW+20wf0T
         +3gqmK7AU8XpZjW3gv33bb6lIp+UJXp4pbYgSMray1NOCbSNX1ISeKNKtVkolMUvxFwx
         MHty5qGroMc07GS6NxDJ7IJRpqJPTrugVuJOOvFhhGrnhg2/X0QtQqSSNGdFbF1jzQqD
         SrrlzMdEbEyCsNnMuEp+yDdu/FXHP2mYqc1TnLG4+nQc9HdjqE46WYuX0suwq6xZgfuh
         N9gHQeY51GcKFSix7SgO9IoMWpUR8vkzHLX/xzNJPhJR1pHc8lGAEedXeCa3/eFvJ3+D
         R9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736197191; x=1736801991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHlppqM6gvLh+wGWzZMvi4bmlnS1UEsF/Gy7XASBKeY=;
        b=CyLJ2GSloqyBTQemLn+4cC99EtQLaLYGMmp101f/BPjd1Vns4xzUk9FyO4imuIQX1O
         P3jBazzplxUmUYIFhC76EIXax9XBv0ogOA9x9YrhmyVGwTKHAhdeqq+TB6Ue6r7kp9ss
         Cnt5RCD6D63p4W2MsIgF/j3or/lyewumT3MaH9OvStUNbo7vii574kx4swC7yMReuF/D
         +6e3pWYN6nZVmgE6G6ue4Hgj9N8j9SMxAX10dru+yJ6uqE0uvsHSZUSTxo265BY1fZN1
         vKlxg49Z3gD6e3GVOins9EoDjiFj27BVjLPspfLjCv2V+PCYW23Na6bBdttwRvL13+JU
         /caQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJSyVrk6YfKj3HlMc1mjzKietZUdFiZW5/xtjWasCjRRVfMJ+/x857q74QZDwWduHX4he88Vee/KFAj1jr@vger.kernel.org, AJvYcCXLuyDVMkzJuem1SAGghsnGGU9UAXT7W+I/x5C98kc6pKVrZH05J6PK9lttADQSUlRtR8Mo9CufvK3pc0Jh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4R3cN83JIiuHfAgUKP64HQqKJdMenD8WiRqFmTmnPNMZd+UAe
	S7MTu5Y9hdvUkibVE4z5bvtTwQVoI8vB9jBboBf1yOQpYjNC+Z15oahHQZTS2jN7r88JTUDSs0U
	+LZr4AHmXQXRG7xMVEWkn8Fdsz4Y=
X-Gm-Gg: ASbGncufN4qwX09dsboIFh7AptDRSPPD3vPAmp5Dfs7NRf4vqfuzdrabE9+JfxcVZgT
	7ZGwC7Wrd4aLOPw7HSmMxkTBsiyROtmo/icTjyDvskxuIpkuSBAkZRvjR22FW4SD1nkd8
X-Google-Smtp-Source: AGHT+IFsoTqFksRVcj1Uq3xa18RTL4eR+t+8QWVvILYJNxKFRhJkMed879iGVSYCfUIJr246vFnKVIb3m+mEWzm/jDc=
X-Received: by 2002:a05:6e02:3385:b0:3cd:d14c:be69 with SMTP id
 e9e14a558f8ab-3ce31d7b353mr6421065ab.11.1736197190870; Mon, 06 Jan 2025
 12:59:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102183232.115279-1-robdclark@gmail.com> <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
 <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
In-Reply-To: <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 6 Jan 2025 12:59:38 -0800
Message-ID: <CAF6AEGvDGtP_AAwDYnv5C3Bdg5dJk2muNUpT+yGYe8bn97OSwA@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 12:11=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 1/3/2025 1:00 AM, Akhil P Oommen wrote:
> > On 1/3/2025 12:02 AM, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> On mmu-500, stall-on-fault seems to stall all context banks, causing t=
he
> >> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >>
> >> This fixes an issue with an older mesa bug taking outo the system
> >> because of GMU going off into the weeds.
> >>
> >> What we _think_ is happening is that, if the GPU generates 1000's of
> >> faults at ~once (which is something that GPUs can be good at), it can
> >> result in a sufficient number of stalled translations preventing other
> >> transactions from entering the same TBU.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >
>
> Btw, if stall is not enabled, I think there is no point in capturing
> coredump from adreno pagefault handler. By the time we start coredump,
> gpu might have switched context.
>
> -Akhil.
>
> > -Akhil
> >

