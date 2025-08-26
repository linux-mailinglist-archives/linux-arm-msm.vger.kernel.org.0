Return-Path: <linux-arm-msm+bounces-70888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B793B35EC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 14:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6E42174FF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 12:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE8A31985F;
	Tue, 26 Aug 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3+pRQgF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F8129D293
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756209980; cv=none; b=fDeSZavAwL0sXYz4f4QX53svhgmnEM5wRoQpuibWE46/X5cKIyrJThsk31ChCyY0631Ggkp/x8kt43e2zqd5oeRmIaNzKHDOu8N7hmrrDMNEZeG40A86eJdqmEch4kA0SkphfFtkoq+gBT5rY2jRtAmAWix0lDlNi835A+LcYXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756209980; c=relaxed/simple;
	bh=bSRRUAqhvp44h3dVi1WARRkNFMByO0ADl300jk30jNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1leIqfMv0eEN+EOktCrEGurv1wywOhmeq135a5rETjG1rrVDQf5PnP0MeVWhcfZXrMHjCD8t3wVamL0IuTKtZvCbHHYlvm/ZoDFOH582kdjlsURbsPo1xm5mXoyBNUEmHaLm3t9M/KF8M0poGNqItId40APONpu/Jb4WtD/XFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3+pRQgF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb78ead12so762099966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 05:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756209975; x=1756814775; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lxFjkTB2P79PoUaLxLAUp+gv0c2aOYdZxNYZuNh3BDw=;
        b=F3+pRQgFkpzCCYJ7wQ3Odb12m1NnauCMjLfwz3R88V/o068VVmnJwLdcbZ3TKgeER0
         j4QTlKzDI/eTaobO9531MJDSjHATCSqZoKUNfMxJgx8LfagE5YZ/jn1YgplEKVLBrGay
         rot0DUgC//tgLU2brQm4i4q/pJdWaY4QfY+HFsVHwYdFeWLA43wdAqrf7tJnIXlaY1Xh
         Y5udcfd7K7KIJqtQ1tq3paHmiQMqgynhay41Gv29Le5E6dbXGdsgZVMa9k1hzQ5CZJRr
         mVaD4QVyNi2mJWXfu7WxrOutA+HTEPGLsueBVlkCbNWpnS1K3Lk4AyZ7ngDRCod0LP08
         x+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756209975; x=1756814775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxFjkTB2P79PoUaLxLAUp+gv0c2aOYdZxNYZuNh3BDw=;
        b=KpZARPqazfygQD5Q4Xf2Kjlwel29I4d/s/NTIrllj4P/4bQdKQaIyoxr2PgsG18as0
         oyzLqhNgLmWHO/auGOGqpbFsuCs4A2SKWGU1PjCvRDlUXto8a1jRd0kKhn06e0vQJ0E0
         DsUc2a5smKNYDmoSoMYAtW3fcOnBXYcHTnNzMyVtnag49v6MwBf2vGyF1/OGxOosOaUX
         W9z5IFwslqzLVbwO3qn1Bs7OVCA94+MDG6pZH5WbYm4HVLbMq/P12A4t/DoZaYX4iglw
         yLX2AJ75180xMzYudaVQhm6eFj/NbxTY5g59IIEdZImZe5pcSNeJkNYgNhHq3WoiGx5Y
         b+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCX3UKbab9C8JFb+UV/Zu1ZRUXM7qEwm0kTpytEipgElsYVW936bGd/7AL6kb1VAkN87MR2EiXutuDNqswVw@vger.kernel.org
X-Gm-Message-State: AOJu0YxE7mNpqvcw07//uEwsBKlOf/AgVseeGCNwze25uu0uPVG9AiVh
	1RIFa2wR9ES2k8rFFWFFapGjFnZ/aEUOT9bFXvpEP54R3pSbr+dZ7W6zGPDtwLMUK2llnqF7bqq
	HXT7Hx6vcSsOxqce4JdI4UJNHbBcsIrXgMfntLhtiSQ==
X-Gm-Gg: ASbGncuKGWZ0zJY5+E6Wey6+LFIwrw2+KZUy/ELbv7839Fk6fwHQadmUQR235kZS11M
	JfStxJlXkYCG2g5Crs0TaUNNwYnUpxldX5gO1konM37lE76gAJH0qWW/ywlejncwrf3VN9WUbs4
	QCjwgWR8kbv71MWo6NkqkxKbx1xN/tepy4u4eGsLeNUwo/SkvtSMBEFXDWN4b2hGLBgVGkuvcmi
	QJUe6/t0QuXiXF43GmCyNofPXm9FsoAkg4zbQg=
X-Google-Smtp-Source: AGHT+IHCPPogA5I5xYJjZ3AF2Jj1OEbjkizkVIqqQo3oG7dsb9k66ChvqgzLqUtgok2+xdd2moMuf4gTw379MNCuFxA=
X-Received: by 2002:a17:907:3f0f:b0:ae0:b3be:f214 with SMTP id
 a640c23a62f3a-afe28ec592dmr1369727666b.9.1756209975430; Tue, 26 Aug 2025
 05:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818124458.334548733@linuxfoundation.org> <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
 <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
 <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com> <2025081931-chump-uncurled-656b@gregkh>
In-Reply-To: <2025081931-chump-uncurled-656b@gregkh>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 26 Aug 2025 14:06:04 +0200
X-Gm-Features: Ac12FXzW7NUCjgYWSamJwSOH-347hP9Z3Gi-swjOizdLDz6f5VXnlkQBVvbGglE
Message-ID: <CACMJSesMDcUM+bvmT76m2s05a+-T7NxGQwe72yS03zkEJ-KzCw@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/515] 6.15.11-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, 
	shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, 
	pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, 
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, achill@achill.org, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, srinivas.kandagatla@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Aug 2025 at 13:52, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 19, 2025 at 01:30:46PM +0200, Bartosz Golaszewski wrote:
> > On Tue, 19 Aug 2025 at 12:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > On Tue, 19 Aug 2025 at 00:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > >
> > > > Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
> > > > Unable to handle kernel NULL pointer dereference
> > > > qcom_scm_shm_bridge_enable
> > >
> > > I have reverted the following patch and the regression got fixed.
> > >
> > > firmware: qcom: scm: initialize tzmem before marking SCM as available
> > >     [ Upstream commit 87be3e7a2d0030cda6314d2ec96b37991f636ccd ]
> > >
> >
> > Hi! I'm on vacation, I will look into this next week. I expect there
> > to be a fix on top of this commit.
>
> Ok, I'll go and drop this one from the queues now, thanks.
>
> greg k-h

Hi!

The issue was caused by only picking up commit 7ab36b51c6bee
("firmware: qcom: scm: request the waitqueue irq *after* initializing
SCM") into stable, while the following four must be applied instead:

23972da96e1ee ("firmware: qcom: scm: remove unused arguments from SHM
bridge routines")
dc3f4e75c54c1 ("firmware: qcom: scm: take struct device as argument in
SHM bridge enable")
87be3e7a2d003 ("firmware: qcom: scm: initialize tzmem before marking
SCM as available")
7ab36b51c6bee ("firmware: qcom: scm: request the waitqueue irq *after*
initializing SCM")

Bartosz

