Return-Path: <linux-arm-msm+bounces-24110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FB2916A81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8EE0281BB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E7E23746;
	Tue, 25 Jun 2024 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhA5kCkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247643BBE1
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 14:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326050; cv=none; b=WveVjnccvcdlTTm9HW5dXQtQJqYAJcuL5pbrW9GIT1Tqd5vqlpH/ulBNplrsWPUP+6nUH0RJyFJEBLH982SyZWAyqJB2+q3QiZCj+XXKpEjixtPQPu4V/7mevwOqN2uq7tclyHW5dfL0c65kSSjVvjTgD3m7/PoaqZQU4pAzX08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326050; c=relaxed/simple;
	bh=C/ADJn3TPf4RQmv9NrvRuKaJx3x+xtTGvXHgn/T4A7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxzJKPxpRPjFxOM3CHRiLDD/pVRtRhxqdxWv5uzbtBUGMbOY/OTvx21O5iaJmrxrR8vHxdfkQJlN+cMFE9Fe7ExV0DDwZ22o0dO5JbZVEM9OX7YkULYSlF3njjGWHSIEOx9MHMcbFCzVieoyojE7NNfNwLsnqdc8qghBXKD6OZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhA5kCkf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719326048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIN/VifJTA2B+OiET7C3xPo4EAKT69eV2y9I0nZx+LY=;
	b=BhA5kCkfSrUI/NbVTSsQskDEFNYrSW2SiIEuLUm/2VWstk1Sy1lAKdGIw1O0xMLk0iNtat
	FLnTdOGi+YwNXkgqpFzD8FCPVbGxEsItl2kflL7OGhTocZxMBBdeuoaxKvktsK/BTKYCO7
	h2dRuP3q75ikEErCgIGC2p4ZxkX0jFs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-BEGFirHrNSS-sWhzmPuinA-1; Tue, 25 Jun 2024 10:34:06 -0400
X-MC-Unique: BEGFirHrNSS-sWhzmPuinA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7253454b3fso122150566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 07:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719326045; x=1719930845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIN/VifJTA2B+OiET7C3xPo4EAKT69eV2y9I0nZx+LY=;
        b=qzAan7rXLBCZIp9BNpwrPFg5pTZieQw8HU/enMHDZnUBZbQsWBAWnZjz1mUHRwKUSG
         zwCTyJdHxNtgOJLyBcoUmu9UG6Ie5xYXTtSetHNFpwywgfAsC+er8RkuSX000chD1+Rf
         ZgIULjwp+gpLcs5SpKkyFhRZgGjTepmhfik8/+oUfu0P4p58WMlR6XQNwyExzf81ahjF
         YnAxF/BimANpIHGvKCqyG0uWJDZ+Ly42XfAA56pc8KUfwtYR1qOsJ3kDMlXEpzeUpxK/
         J89WvcPfYMOhilGv/kvFi/s5FIAfD1P1ZP1CuuuJEtKefIKItnfXYsRsanAlbESdDa6b
         JCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa+wL3wHZ+leSClU6Dr8xnNZDSaFs8H19HStmgtWTDChUqjEZph1Pfyo/X/Q9onBKy38L1drPctPyct+cJ8Lx3OcS1amtqiE+z6Are9A==
X-Gm-Message-State: AOJu0Yzs7ksVic+1yyfD+DijaPJLkuCVFvTNOCyN9PDIDeg7HYQfHWlk
	+MEAmg+sUizvitUmOQgIxKWdqKcinUtKmjAApcF+7GbcC76f83l17/Zk2w2pb29Br4qnZNPTkVK
	deOM1wlS3yonjFxqgMoFQIMy8T/YnHRmPCsaORjMRwynw1asvit5bG2lBcoxTe0BR5Oa8YwfNsM
	OIhF1bmqX9NQopUEm5V2HMl1l//dXC1D3hq5iBlw==
X-Received: by 2002:a17:906:6b10:b0:a72:5226:331d with SMTP id a640c23a62f3a-a7252263f95mr367042466b.70.1719326045605;
        Tue, 25 Jun 2024 07:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNXFbVuUgGr8Wezd7LUNQD2phD9UlLRzBQatK/pD7dVZ3A6LOVw5i0GmaQKcISJjgnq3eBPshrZyew8oltNwY=
X-Received: by 2002:a17:906:6b10:b0:a72:5226:331d with SMTP id
 a640c23a62f3a-a7252263f95mr367041366b.70.1719326045275; Tue, 25 Jun 2024
 07:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr> <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
 <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org> <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
In-Reply-To: <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 25 Jun 2024 10:33:52 -0400
Message-ID: <CABx5tqKhAYsD_Yd0TnouVmrwbA29yJF93CEGkzuyOJgc5UY2PQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Marc Gonzalez <mgonzalez@freebox.fr>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>, 
	freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>, Bjorn Andersson <andersson@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 2:48=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:
> On Fri Jun 21, 2024 at 12:47 AM CEST, Konrad Dybcio wrote:
> > On 6/20/24 20:24, Dmitry Baryshkov wrote:
> > > Does that mean that we will lose GPU support on  MSM8974?
> >
> > Yeah, that was brought up on #freedreno some time ago
>
> Also on MSM8226 which I also care about...
>
> Anyone at all knowledgable on IOMMU would be very welcome to help out
> with IOMMU support on these two platforms (and anything else that
> old?) in any case, since me and some other people have looked at this
> (on and off) for years but haven't gotten to any stable or usable point
> unfortunately.

I posted in 2020 some details about what I encountered when I tried to
enable the IOMMU on msm8974:

https://lore.kernel.org/lkml/20200109002606.35653-1-masneyb@onstation.org/

Brian


