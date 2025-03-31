Return-Path: <linux-arm-msm+bounces-52887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7ABA76C42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 18:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 467F816B2CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 16:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88582147FE;
	Mon, 31 Mar 2025 16:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lv8KYt7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC62147FC;
	Mon, 31 Mar 2025 16:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439881; cv=none; b=fEugFb/Zj0qglEfSSyP9JxqOkq/yxKAVEq7b5YC291OekqIr50hzy3lAifX1riMJ2cnWzhvxAXX+ve2RBHxogWqCcf8z6TGKSz2mrXg5cnsIr6KB9XF+XsRuQzmyzlpp1oQhanr3Zf75+5t7Xg5E0T1iUi0k9JTPU84v3lX83NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439881; c=relaxed/simple;
	bh=Maq2pGNPcQTL9i4L2U60OMwgOEC1wzel9CslYZpKRBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUIizU23kOKuPrVo5PL5ccj1Lmns2EPZdj2HI8F/JEXsRwMo8CxPrLEOSBHtopeZpPvaxnFhvs4vqnekheMEkJ8Rxq2Z1VocDOGiqH+jGfbCsoig7WCAPB4tn1/CwS8MfgQyyPYTe5UKs6Xek1HUUUBE5+LzapFQjgS0Qtq4kYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lv8KYt7Q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so32739035e9.1;
        Mon, 31 Mar 2025 09:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743439876; x=1744044676; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MunBujQnIRxhYaTX5/fqcElXhgmT8GPSyJRl5CxG2CI=;
        b=lv8KYt7QT7NceqwP0xGK1Z/DfKVPx38+S9aVAzv0U2IxDI25qgf4FYZE0N150iQGhX
         DLsnJpzON8/Lstry+q+fRXdCBRR3WhFn86uBNCMuN14DGMQakiyVyvky4aS2SInOy7Po
         Sp3c8gIVqYkbhWKFENBXji6XKFenQEgViQnZLubjJkh8nR4wm5f8nPHnKg01IkluL8M4
         XwoEfGFHyTvpCZGenQX03VRTjtmihuBnS3GYmn6PzxW94EpM38ZwszOvtHbZGOjEW4Mp
         4S9NrUEEJT4of3VnWsdLW7O7I5o/DbchRLifqVeJl25B0MuraqcA46oS/TSTwrHn/1bQ
         vjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439876; x=1744044676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MunBujQnIRxhYaTX5/fqcElXhgmT8GPSyJRl5CxG2CI=;
        b=QwcFGJeRnd3q7JhTpLFq0o/ED0Cz5I4WsRIUFGCMwhGrxhrpqyxSZL4A6+0RyXOL6X
         Fsrdkd6ugX033l4XyjFu0cPdaE4aslhMLqaJ7LL6hbOOpmRYG9V/tbDePec4qdhszkRo
         LuacrAQulIP2blRXbXTJ1GZ3iGeKDUiiRe1sQCqprXvw/DfpnMvors5kcZ6ESzdLevMY
         JZ39tjtaYnj2B8I/x5S9fVbReviTlMqh1d9T9dI9xg3veQM6vVZ4KJfNAIl9TmeC5EvV
         sDnmaImdydKKCTfVmusQjnlwyUZYWBNM+S8Hdj8j24dD9HkgtyH4JW0nyoTv51mi0wHg
         Y5Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVWV38O7+NUTT5x2Rs8FFMeX+EI8cQfrQl2cDBC5Aa08bmIVKTXu3l26SdLgVqEBQKOwY14E5U/VavYlOmj@vger.kernel.org, AJvYcCWlPBkjLYFoiBgpjBnfGFVq9DtXXKNOw/eU7si6gQJtuXXdCwytbIIDN1noNfJhPl6zIQnZXzKLnCTR6Hr5uA==@vger.kernel.org, AJvYcCXpQjBQ0lPwIAufbtagHuRlBwUVbQVrJfGwA8A2tZjOiYXs5sToJmgfM4eRdRriLmTo5ibktbzgobu/@vger.kernel.org
X-Gm-Message-State: AOJu0YzIpKNM+FAZfVHUukm4qKUsyD3ibyqrwVhG3Haw0ZD7k2eyUKjD
	5ZhQzMX9rAKeAqAiFfQiT/38sDPw1Ly8AO+wiJ6a7EjeJHEbGijARGiFqiLYHn6aEY4jCzpBf5O
	DgiOXmkyhpAoVoHxsNnszbOXY7A==
X-Gm-Gg: ASbGncv0XMJOt0xpasc/SwdpoLhM7qrECN8sSRZnVsY/H596HgY+4zYNXYnoL1jy/S0
	Ksr6wWQvKcBPTNJUL/DNa/d6jPnscAiUelnzpLntZzCffNKwQrxvkJl4izSh5GtHr6VPGK5AxZU
	QvyJGFBiyBwdBa4JJ8UBgQN0aJF3M=
X-Google-Smtp-Source: AGHT+IFcrnYpK2ItJPg2dckClf5edSa4GwLBqr08Q7cH7QCgI51gAHqY61tiKSt8aZJ55Gx4hHXlA4MeoNKjd9b3YUo=
X-Received: by 2002:a05:600c:c8d:b0:43d:ed:acd5 with SMTP id
 5b1f17b1804b1-43db61d0e8amr138014625e9.10.1743439875876; Mon, 31 Mar 2025
 09:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
 <20250331073423.3184322-2-alex.vinarskis@gmail.com> <Z-pN1qloL2m4BWaq@hovoldconsulting.com>
 <CAMcHhXq9W64MHhOV5i3U4t+ZfKNC_GaBq5X3ZN7VOLt0cjPQPg@mail.gmail.com> <Z-p1uADNVAM9NcAW@hovoldconsulting.com>
In-Reply-To: <Z-p1uADNVAM9NcAW@hovoldconsulting.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 31 Mar 2025 18:51:03 +0200
X-Gm-Features: AQ5f1JpJ5Mo4mJo4anfnZhdRws7WGyHmZLFHxcDsiHdzr1srWLr67ol82WD7zFg
Message-ID: <CAMcHhXqO2Ej3UAej9QodX1NNCHAk956++=oakPxx-MkpOucJ2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
To: Johan Hovold <johan@kernel.org>
Cc: "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dmitry.baryshkov@oss.qualcomm.com, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 13:00, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Mar 31, 2025 at 11:38:25AM +0200, Aleksandrs Vinarskis wrote:
> > On Mon, 31 Mar 2025 at 10:09, Johan Hovold <johan@kernel.org> wrote:
> > >
> > > [ +CC: Stephan ]
> > >
> > > On Mon, Mar 31, 2025 at 08:33:47AM +0100, Aleksandrs Vinarskis wrote:
> > > > Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> > > > combo chip using the new power sequencing bindings. All voltages are
> > > > derived from chained fixed regulators controlled using a single GPIO.
> > > >
> > > > Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
> > > > WiFi/BT pwrseq").
> > >
> > > Are you sure this is correct and that you don't need to worry about the
> > > "how do we model the supplies to an M.2 card" issue?
> > >
> > > See
> > >
> > >         https://lore.kernel.org/lkml/Z-KuG0aOwEnxuhp9@linaro.org/
> >
> > Dell XPS 9345 does not have an M.2 card, WLAN package is soldered
> > directly onboard, hence I am quite sure this is similar to QCP.
> > To be certain, perhaps @Tudor, Laurentiu or @Bryan O'Donoghue (if  you
> > have it?) could confirm from schematics?
>
> I checked now, it seems you are correct.\

Ah perfect, thanks.

>
> Highly annoying that we need all this guess-work boiler plate (about
> chip internal details) for what is effectively just two supplies.
>
> Hopefully we can drop that again going forward, but that's a separate
> discussion.
>
> > > > With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for
> > > > X1-based Dell XPS 13 9345")
> > >
> > > Not sure what happened here.
> >
> > Bluetooth and WLAN definitions were missing, as at the time I only
> > knew the UART port being used for bluetooth, and was missing
> > everything else to describe it.
>
> Ah, ok. The above sentence looked like some left-over copy paste. I
> guess you don't need to mention it at all since this does not seem to
> warrant a proper Fixes tag.

It was a suggestion from Dmitry in v1. Though indeed it does not
warrant a proper Fixed tag, as it is something  that was left out from
the initial series, I think it's fine to keep it like this, if it's
okay with you?

Regards,
Alex

>
> Johan

