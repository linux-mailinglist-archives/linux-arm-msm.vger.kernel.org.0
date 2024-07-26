Return-Path: <linux-arm-msm+bounces-27073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC093D14A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 12:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11EDEB21695
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 10:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D21178CDE;
	Fri, 26 Jul 2024 10:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwcjN0XA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65BD178390
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721990597; cv=none; b=dbx9vLZYt6Hb1sbN8w4Fg02ZZlAgw2zcN28/ZA1JviseW7u7IHa44AgRjM1/iu5IIohU1BaqC9jM1fGXvoSIlPFZ/btvNaUfcBYJ9qKfvg0UFeln4y8e65rDk+toQ/Erp+FR4WTNaRi9c5v4uUL1Bn+9EnkFXxIy/nHbxelEbpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721990597; c=relaxed/simple;
	bh=wwEzNplU0oHll6/gPewMkfsf6nn6q8H2T7rQKwtAsZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5eT/0IFSCMYN40ykEBp9exkxjhVJt3t4aA9JagUSsL2ktEsNy/CXaI+00Rrsa5hqM/SkvKF54AmAtud4YtjGE3ZVBAy5v4jYlUuD8D8zQF14sszy804+9PUPEs0V6lnk1rFza/NP7uogcLprbLed8wJAQG6+Hgz4wogfhFi9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwcjN0XA; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6678a45eaa3so20181697b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 03:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721990595; x=1722595395; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=49BGO1U9WziBRDQByPHYJOxh4ajjI+3FFKMm60YS0xI=;
        b=LwcjN0XA1p5yRejbNhPQiTq5pTWjNHx63N4y1msTlObcFkAiwkL+Z1WjbM/trGRRnO
         gU/2genTV6Dxcc9oj96XPg2o0XJ0SqX3EA7tQqKG463K1rgwJ0kfoxlle1Pf5k3VLPRt
         OwbLiaayz4YuphI4t+rkr7e7TAv36tap7/93u+W+Pyo9bd+9SEmPBuResQc8nB0I/AE4
         xsR/jUi48MET4xU7w1CxE/tqSyvWLZ+HtNX3w2aBAtAiJIydFZf0oriqKkrvlZnbphO2
         WCF1DRHip6bIs93mhcZFa29CfnLvvNBTMmk+I29uSUIfSqno08+hJA6NT9FYhm9iJmeX
         nOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721990595; x=1722595395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49BGO1U9WziBRDQByPHYJOxh4ajjI+3FFKMm60YS0xI=;
        b=Zn8T6RQxRC5M3EdY6op5FraSF2vpASgF8s6Rw70YXuNX1sMDUZ9pFOXB1RZ7kRqGcC
         3SkZ7Ez81clwg06N4Yx1vFLO8XmRwXtQVoTTIUQON5lX4P/QHgXW7MXzN7LCzjD24iGR
         M8ZQBjj+YostbKKTQWwkNw04/Cm+/rmX9Yytz3bMMYvBUfDJi0ZQe02oytb/oQHaRdLb
         HHZx+EqFFOxlbRIjPemF6uQQ3A7V87tCh6SINndTXSRdyYQz3cBBgUwKStYU8v50AXP7
         JVqGY5+wkbSZsJK0ae523vqOYCJagtoaPOeh7yngtB8522fe9YhV4GgWWazLcddgAb1F
         qotg==
X-Forwarded-Encrypted: i=1; AJvYcCWnGUKN5WDUso8wrJgf5+8IAwdrv25yXkpsMdH9+ZDd7piScQOJChzXEl/FvuVYTC2NLku6DvSLxZ9welnV70c6fTcMNn3ZDipuo5eqTQ==
X-Gm-Message-State: AOJu0Yw4Yq6t3vmbP+xcpsxVQym/WfW3A5JO24YrbHimqPlKYChMGPC4
	9dGnzojB71C/P07RnVjNv4BNHdx3LOilr4QQCG7UN0Dtu/ouJR/r8vKYxKcDtEeIZ+7Z0yPE7Gt
	p1Q47AZ7XJRds8c93MbFbp3IWymzwohXE//yyfw==
X-Google-Smtp-Source: AGHT+IHSsNdDYXUZdIh7JKsW+xJ09O2ZlBRUc8hjyx2mHxLwfaVLKeOJTziZeX4YC7SXUClTdaLc770FXIiJpsZEeMc=
X-Received: by 2002:a05:690c:498d:b0:65f:8209:3ede with SMTP id
 00721157ae682-67515f8b36amr66680407b3.44.1721990594923; Fri, 26 Jul 2024
 03:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725-more-qseecom-v1-1-a55a3553d1fe@linaro.org> <ZqI5LdjXMRmUesvP@hovoldconsulting.com>
In-Reply-To: <ZqI5LdjXMRmUesvP@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jul 2024 13:43:04 +0300
Message-ID: <CAA8EJpqaJQZaL3h2Eho4_HQ9Z8dLLYpwyOiyc0iFn_CzeWaG7Q@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: enable qseecom on Lenovo Yoga C630
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jul 2024 at 14:38, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Jul 25, 2024 at 02:27:39PM +0300, Dmitry Baryshkov wrote:
> > qseecom driver end uefi vars access works on the Lenovo Yoga C630.
>
> Really? Wasn't it the yoga where you could not write variables (you can
> try but they don't persist after a reboot)? Perhaps I'm confusing it
> with another machine.

No, you were right, I checked only the read operations and that write
succeeds, but I didn't check that writing persists across the reboot.
Either I will fix that, or I will post it as a read-only
implementation.



-- 
With best wishes
Dmitry

