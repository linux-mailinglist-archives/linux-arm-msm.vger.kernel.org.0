Return-Path: <linux-arm-msm+bounces-84255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1147CA0A48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 18:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AE2E331A795
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 17:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2221A34F24B;
	Wed,  3 Dec 2025 16:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UStW5R2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32C034BA4E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764780238; cv=none; b=FFkI92+x9k//1scF48zXlgd7QZcvElbPSUdD8XIHyyy+KmFoSgAyekjhBSzjOr7MSlT0SjWbkXWsgxIKfaPZP5h/6NKUKMSvkZ9iVSZof00vwx2rXFDv/Vk4osdVv+Imtm5dPniEMUfDpA8GSamfKoXvyAiLUhXqEPr0nq03sQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764780238; c=relaxed/simple;
	bh=IAArZcm2wSkF6VtcJYsSwPQFosqWc4J2GeZQUSxMWAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVttMnbOqi+gpJUgj/gVn48SAbqsWNWnMBBXlRd+TTFx2WSraAJtl4VQuD0Y202HIR7tuzuHl7xUUZYPu8fnIl0bpVuyKiqPdKNb+FoK7qarxAlp8AA670LAnXc6y2r2D00EX06NXNJqozWyGUKn7BmYhXaT8zaKkBjP2H7q9vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UStW5R2x; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so5083918a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 08:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764780234; x=1765385034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tre/rf8HRcrussbSV2D3pHxXOcQLeC/eEv+L6zskgMA=;
        b=UStW5R2xZjcxJB/mvUjZu8DmPgdA1g+d8BzVrFXKBNfLOBXHWy1MmxwU9MrQrO2mn3
         igx4IQsSXsjEc4CGpsPRM4tJ9lEss1x5c3TblSfkHUIm4g+xsx9ODAII4v6YOUhH9P/e
         iAxvRcFFSXLWbe96fVdkemhq60MvDhzf7xoGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764780234; x=1765385034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tre/rf8HRcrussbSV2D3pHxXOcQLeC/eEv+L6zskgMA=;
        b=GLMGHlhHUFbhE+ZbJ0r0kpOL/r3c64nkrnULedcHsfNk/YB5OnwsAhMzdSwmI8DFiP
         vzH7Hz0g7AfHYTDVl7UUH7AziycLslKPGbfK9kFehxRAiFfh7VEtZuQxo/hxb1k26Pyf
         +Uh9N33xbMm2hkJ9Xut3iDF9gae7Dzq0xakc4R+ktanlw0jR0Om9QjxNVEP1kDVQo130
         XQcQcHaA+zkxiVbf3SuMw/6RKuUPzX2BVmiu3WUdMQXD4rl9UfbOosGYriqGZu2u/Zqz
         Q2S3zBsd/9/vYwJJsgnPvsu7xdU22GF16YLFfJGe2BxEcMqx3Pd5CuPsdDFQsYgXDOnC
         cWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCv6e67TGPagHWVghktFCYxhF3W0Nz1paw+qvHVE+/EbKqtYS/BRBdxv84XAI14l9wrqiRJ9t1Gmg9fkJf@vger.kernel.org
X-Gm-Message-State: AOJu0YzYxKLuNvwK93grL43RJq4x8VRzryERW6RZ5LlzrfASxsVitVuo
	DrUpRVxX1lZglQZKpk/YoHEEWSC/8mpLe092jXuXnhmtEQ3J1tU779OeSh3pk/2B1v1S64eMI5X
	c3bEAtK8=
X-Gm-Gg: ASbGncuiNNV/pJ/+Q+O5hDA7jHpnLgwrFrMuO7bWL2TvkWfrJ3HWcqxvVVdVvuI/Pj8
	C/O0c4uJmAE8nD9pAL5rKlprKu0iUz/fkclxeIORStSHAy3bbfwL0aGVUvBGIea+Sm1F3KLJ01M
	fealydGJikGdgYHKiUmt0uLsNpWvSkGGPOCDeXhp45NzVaRbODtPUE4bexRUOB/+b8Kw7KCzb+n
	UH3mYUsrHkNTFhVRKTjW4c09MrHMRFEQ9hktx73ZizTftQYp4p1ueDAgLCgquPDSxx0cF1NwWj6
	rq+By9UcVyUCQB+LpZuriR9OSgC+Cf22fwoAE0u+MJzrPTh+W5oKcVTR9z0a0FGZTS5RdM/1xy3
	oZ45eBUVKQpJ+W0F5QiuUFHXuI5/rRt/UqRaQs/9da+5acYh6E4rxw36djSryqs+u2w79j8LKbj
	f56ZYcl7M0o1jPetybwvdokXfJ06pC5V/1DJXbnxET6fJbZGcmMxwFgspaDd4QPDttlMjmOYM=
X-Google-Smtp-Source: AGHT+IHcLTljSqEFxBBNySjMjhJKlnz5d+myd7NEBtyBbc0VEnMVYbhPnt/74ynlpVvgRhWGXWWBog==
X-Received: by 2002:a17:907:6ea6:b0:b72:6ace:e5b6 with SMTP id a640c23a62f3a-b79dbe4877emr329933566b.10.1764780234259;
        Wed, 03 Dec 2025 08:43:54 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6ea36sm18531420a12.2.2025.12.03.08.43.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 08:43:54 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b79e7112398so68053366b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 08:43:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0t/nOwUMj61tU0hYw/RFLm4eGZsDMmsElwnYxpV2yQpT5jjX1V9kAT1/C2xijg4/PcoK430ZQmJIxmae3@vger.kernel.org
X-Received: by 2002:a17:907:9706:b0:b76:3478:7d52 with SMTP id
 a640c23a62f3a-b79dc51a4fcmr293870366b.38.1764780233541; Wed, 03 Dec 2025
 08:43:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203152437.3751325-1-robh@kernel.org>
In-Reply-To: <20251203152437.3751325-1-robh@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Dec 2025 08:43:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjLCSGkNMpcKd11EhrQJieXn7J-7px-d_sJ=o+2UT5g=g@mail.gmail.com>
X-Gm-Features: AWmQ_bnLY8KW8oEzYYPFpNFQCtPmlo2omVWH0TluZ2sLvA-oifz7NT-KjCUAHKU
Message-ID: <CAHk-=wjLCSGkNMpcKd11EhrQJieXn7J-7px-d_sJ=o+2UT5g=g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Remove invalid tab character
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Gaurav Kohli <quic_gkohli@quicinc.com>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Dec 2025 at 07:24, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Commit 1ee90870ce79 ("dt-bindings: thermal: tsens: Add QCS8300
> compatible") uses a tab character which is illegal in YAML (at the
> beginning of a line).

Applied.

But I want to object to the garbage that is 'yaml' and 'invisible
whitespace has semantics'.

Maybe we can have a "kernel yaml" that just turns tabs into spaces
with 'expand -t 8' and make the rule be that kernel yaml files don't
have to participate in the mindless garbage that is "yaml by the
specs".

Yes, I know it matters for 'make'. That was a mistake too. But at
least we could *fix* the braindamage that is yaml, and we already have
a defined tab width for the kernel anyway.

          Linus

