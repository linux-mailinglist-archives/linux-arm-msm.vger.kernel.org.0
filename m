Return-Path: <linux-arm-msm+bounces-46174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7951A1CFCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 04:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C29B1887BC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 03:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE431FBEB0;
	Mon, 27 Jan 2025 03:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZAqet0LH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD9F34545
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737948761; cv=none; b=F7DkmsKNSTlAfkYYPgiwaoLpvS8cT8dAm4yR2WMb3yUDAGlg4ylAUS5Vl9ITVoD11RhdiMc9oORgpNfHDPgAA37sfi+cr6pxvPmDc55BLPjcOj7TPe6L2ZdMb1ff4thELPpYJ5jSvZ5YjaUiv1GveuPKIywTIQuWGXXuCM5Ggwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737948761; c=relaxed/simple;
	bh=YiJT9WQLqKtxa/sdK0/rOM1AOUebCQeiyhpJpoFR/Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4z/pbnf6Vek+Jqa3Yhw4EW4d3NGHRcSTDkoAF6MhgxdAPNf7XlzKuBLI9OaTt9aPoEet31V2jJhUCwi2bLcl7XlWpjVzhcaNvKogddarJCCQQ351ogMWWcRyqV5kp7qtQbfx4WUck/6sknYqxrUdovGR/cgJ/jQPzCSZ9rUMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZAqet0LH; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21c2f1b610dso91064405ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jan 2025 19:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737948759; x=1738553559; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=ZAqet0LHUa30eTqQWmMJWS5o7pqk7XjmbInvdfASe7jTIVmT9RUUZdlfn7AuizIocN
         aw3r9b98/WxEepu6sn8rtapuPvIPTElvnLCh88Q3VE1GuFXFlweA/vm46e7ye17k+nlP
         dDsf2GV1zccoJ952/ojgRt6JW34ce3yD0ewoBKgUv9lQS1VTE7McUY+RfkT4BcS3e2TR
         qX8MEykYK3h67TVidyyBeks8Tt65sJ+9B7ilPoUNG6g9UTPdc5QRG3X1BnyiXlEi6I6Z
         VpmNWvZFs8o4+ndeDosKRiTpf1OkiOr3kj4IYOo2ffxWTzovxRiqWiQW2zxjlHfwUJzF
         c0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737948759; x=1738553559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=u/kUrhH4o7mWfWX30mke9Tq0Kf4hhZJMXN/yPq5P60EVEDyATWJRhbOtB7r+Tu5tnd
         Ti1WUvAsFgs3J361ya7SiJtU+0VzmUlwp0MjfEQT+ZzOW9QnTN2bu/D22dJf3L6PYVg3
         tY2Er5BCD2pUVnjaUfFs1l+XmIBkz9O+H2Tnp0Csdb5Kld0+6IHO93gOMKNUNzcpLn/q
         00+Vo7RX2VSrJrP01MGqMatEOcsFlEINkNBe5u8YVjJlS0KLtq5JPkD/cNyJI+1xvSvw
         kjvc/HzYTrptRYor1UkUTpF/xeaytzfnSmzqaF9QafUc/zRQZiDiLzPD7WicFWJ4DX7l
         BXOg==
X-Forwarded-Encrypted: i=1; AJvYcCWceAYSjfVYWmGSN6qrfxeOsgEudB9p4tbIyLmWHAOyx3K9V0kX2X+Gf1corSbIbwFD0+X6vPwmT4cQMB27@vger.kernel.org
X-Gm-Message-State: AOJu0YzDs76lkMJcQiLDkCsxO7UJ8JOqF20WRDpodVR+d2u3LLoT3OV7
	45ym6m+1uEwiGI0bDj0AUuGNgcSthcw384w+k7aeCT3HgYi7v7IXI2kvQL8X3kA=
X-Gm-Gg: ASbGnctmI4lLQIvWZgUBmMn5oUI2RobvHk69qNOzok92Sp+1mEQ7xOhiFG0OGY8T1D0
	OZyKGFCoIZuiJVyOBh5nthfGlRcZ6ERIblOTwbgUOquls/kVyi0EBW6DKQzR4rDoT/51EZ7C0BI
	MKc6mBhVpanaT4+nQIbNFcikQAgRasgRfJ+K9rvoVkGykSa0C71FAIUcpObMa957ZI5BD95diWI
	3XrcLJ/i1EN7ekFSeHnDFWPpoNOBWjCE+hpbhFQAJFzcuiIY6nDlc+S6Zbg2kbeezOERP46NoER
	DPPYr7s=
X-Google-Smtp-Source: AGHT+IHvgBNK3NhwKI9n5fMBriq7FLdQFhDFQyHQaZNGZxzhpW+eaG60WMmG2z8DBaIbsP1G1cn9Zg==
X-Received: by 2002:a05:6a20:728d:b0:1db:eead:c588 with SMTP id adf61e73a8af0-1eb215ec4b9mr65731325637.29.1737948759394;
        Sun, 26 Jan 2025 19:32:39 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbd01esm5342591a12.71.2025.01.26.19.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 19:32:38 -0800 (PST)
Date: Mon, 27 Jan 2025 09:02:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>, Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>, WANG Xuerui <kernel@xen0n.name>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>, arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 00/15] cpufreq: simplify boost handling
Message-ID: <20250127033228.abeqhrxoprqw5b4e@vireshk-i7>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
 <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>

On 24-01-25, 12:05, Rafael J. Wysocki wrote:
> On Fri, Jan 24, 2025 at 9:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hello,
> >
> > The boost feature can be controlled at two levels currently, driver
> > level (applies to all policies) and per-policy.
> >
> > Currently most of the drivers enables driver level boost support from the
> > per-policy ->init() callback, which isn't really efficient as that gets called
> > for each policy and then there is online/offline path too where this gets done
> > unnecessarily.
> >
> > Also it is possible to have a scenario where not all cpufreq policies support
> > boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
> > feature for that policy isn't correct.
> >
> > Simplify and cleanup handling of boost to solve these issues.
> 
> I guess this depends on the previous series?

Yes my series and the boost related patches in your tree.

-- 
viresh

