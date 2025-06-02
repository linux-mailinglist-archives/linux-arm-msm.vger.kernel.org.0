Return-Path: <linux-arm-msm+bounces-60040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F39BAACAA9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 10:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2B8C179CB3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 08:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DD41448E0;
	Mon,  2 Jun 2025 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeKWQ72/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D83132C8B;
	Mon,  2 Jun 2025 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748853137; cv=none; b=EucQyAEq0X9uRRDAzvPBgdeRuDy7w/lc46ci398FS3G+0NLoRx39tn+d8hEK2muPUKmA08CH6Grye4/Og+9ofUDu9+9Y54mI1UQrby/KQIob/duLyOs5bZTA3OQs1jbX1Al0HjTHPjt3PGZeBAFrZtUbQegdMqg7aJMU+a92Lqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748853137; c=relaxed/simple;
	bh=JXTm2dW9soi7AjmSLBIOUJFewUQfyTHyJEK63fcQbWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKSrYcwyFMDAQkS8CJLSvXE7wzLkzRt8Tu8zHDvtPRpiDhkZRhXGXPnCIH8BSi3RbncMCMcHcgpoUrwewc7w/Epxjw6R/BkQqnpwv8veTWPvxaFD1GQDf+ai0J1vUtuwOvZycrDw2tuKUvv/NCoyJBXWWGWxbFsjLGvmqi2+MXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeKWQ72/; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c173211feso1099132a34.1;
        Mon, 02 Jun 2025 01:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748853135; x=1749457935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXTm2dW9soi7AjmSLBIOUJFewUQfyTHyJEK63fcQbWk=;
        b=WeKWQ72/tphcN5k4U6iaaCz3BTG7bbeNTFtyj4RyZPA0KW8JbfWFhgpcvmCXCumfpN
         iWm3etJ9NjzEgS21D8ublwekWNWV4Hi6zQxiwvO3c3CFkj5SMxY5ClYHbsoL6iVVpY9Z
         tk5vLTORb7zrDGgsapXM7tcQkTZgmQ9fYqZb9hfdC3kl/cBkL3YxTw6NC2Jfmpwi73GV
         HzptI74SPXp3MIun26mpPVPpnXkXT1p2BVn4SUmXkaSucEW3ywz2GU20ioSzBp+SSdRs
         BB/2DKHlHbjEb9KONTDdfTxalLD1CbsB6cnoInONMXTJybBrb8h6YQuVXstt1o5xA+Dk
         XHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748853135; x=1749457935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXTm2dW9soi7AjmSLBIOUJFewUQfyTHyJEK63fcQbWk=;
        b=Igkxaq9oOQDgw3ToL7/0c6G8cyR/uLASgv5Ez7zuiomI0yowoxfxSllkKeEwK773vI
         Qc/InZPaJa7z61qXDh1WAXRjGuH8Z3XbrukzzDvUs1naiRj2VL8wdQuC0mjno+2DdIn0
         h5Bqzd/5qW/BwmQX+Xb10ZPs45v1+0VyLQndtLxRu7DW+lpeuhDZ7qzAKg79qSnhYax+
         mIfprhzJvpqPRSB08mH7Jj+CHm+BTHTjEV4z/OQC/u59V99GYXixObT7bpQ/lkxz2xO5
         foKkniDN4dVeQTxcF3Ccxnkg01Tkise3rg/xPODC/rB/eFke/6JlBynJvrcBFiSBFzyD
         WvSg==
X-Forwarded-Encrypted: i=1; AJvYcCVcfhisL0scniRUG9M0kILmcZT0t8Kvg9rCqEnk2/LSnAlkeJL38N6JxtA711IS2L6Xr3RtleVPKH5+@vger.kernel.org, AJvYcCW9Mc5ycJBlaZKQ/oo3Ge5dFe1tdPLJWPjl9zU12R1OS+XDltQrSrRK+/12UvPx6qU3g3H6AszIxkvnekq2sQ==@vger.kernel.org, AJvYcCWsIDChrIwB0brsCiTymrdRp6WChPUjUUUpjD/YZI4gb0ssp6jKslA5cCSHQ8c/ivkHUez0WnAAhJs0Hr5/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3JRQK91Bpi8ugqSMlRpwGO8cbS8Y0Kb3KenXn/klQ1nN+ySfA
	Zg3A6VjgcOkDgQIS68SKXT7zT+MND/lfv9ZAp31ufYTYJO8uyUZZCO73im4qd3unvNiC1DHqhiH
	NLn67NrdJ9Z9IVEgYbh2yOIlrMQgj4zE=
X-Gm-Gg: ASbGncuyEG6ul/1GFvk/xmYB986iDLzb/M64BECD0mEnJMWVgfRFBmB7C0YL2ZsYNK+
	QXUo0EdF+aLbupPQ3NSbAj1wGJv4OayExkXqONfJtZQyDOAzWEdM93ANYWeSeaKMQBMQYaA1xG8
	8ePp5vB5r81sriy1x+JC3VdrmOdinuehnk5Q==
X-Google-Smtp-Source: AGHT+IG08SyOEOKizDZlR4fXPxa3T8Q1zNlW4b89aLdSyuDxE0Sy/BUGurGnY/qWDExjKkJ/oo8qbi97Eby7F9wa76I=
X-Received: by 2002:a05:6830:490d:b0:72b:b8d8:3995 with SMTP id
 46e09a7af769-736eceede66mr7271164a34.19.1748853135247; Mon, 02 Jun 2025
 01:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <174770727723.36693.13352978360096773573.b4-ty@kernel.org>
 <20250602081638.51724-1-elliot.huang.signed@gmail.com> <466ee887-cbea-434d-8599-3a8966b08c2a@kernel.org>
In-Reply-To: <466ee887-cbea-434d-8599-3a8966b08c2a@kernel.org>
From: Elliot Huang <elliot.huang.signed@gmail.com>
Date: Mon, 2 Jun 2025 16:30:11 +0800
X-Gm-Features: AX0GCFs3Qj8Z9XgGk0K-d-gUwRKLMWd81H3TlPEkBK-Jupkwuif2VHyOeYKgU8k
Message-ID: <CALe+u94c6EVjXWc5MjmT4U8xWF3EX-e=yY59k=RG=eXVYrfPmA@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: support sound on Asus Vivobook S15
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	johan@kernel.org, konrad.dybcio@oss.qualcomm.com, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lumag@kernel.org, maud_spierings@hotmail.com, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I will

On Mon, Jun 2, 2025 at 4:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 02/06/2025 10:16, binarycraft007 wrote:
> > From: Elliot Huang <elliot.huang.signed@gmail.com>
> >
> > This adds sound support for vivobook s15, tested:
> > - 2 speakers.
> > - 2 dmics
> > - headset with mic(distorted).
> >
> > Signed-off-by: Elliot Huang <elliot.huang.signed@gmail.com>
>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.
>
> Please version your patches correctly, e.g. use b4 or git format-patch
> -vX, and add changelog in cover letter or under '---' of individual
> patches describing changes from previous version.
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
> Do not send new versions while the discussion is still going.
>
>
> Best regards,
> Krzysztof

