Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78CBE1850EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 22:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgCMVUm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 17:20:42 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44099 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgCMVUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 17:20:41 -0400
Received: by mail-wr1-f67.google.com with SMTP id l18so13824152wru.11;
        Fri, 13 Mar 2020 14:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=gHe0Jr3HHrqFSICLL6R/jKSDOkoJC7KnN5A4sHFyiB8=;
        b=Li6ryXbsDCxLw1jPemU5VFLcp1LNm0D0/N8RhaEzW5zkXtPC/DkbfXkY2x8dOdXGKb
         tvQZg3alfE1LKV2ZzENp4XUHk7Ej8wvtQx8u4bDgCoazTiXHUChzpxHboNp5BiqRy1u4
         0ol6piCk0zcJoqdTgaZC1eHp3Q2Sk0LVpeaE8pBI0CD/YroC5F0I6QOzBQNePHuUmr3K
         /HrDSupsomnIzpS5YNzFO4MaXrgbA+LYuxvq71/excaFBXolJvp70ToZwNKBC7cO1C12
         V9c1xMZzxdYGQGiyjeeHRfXQaYgmPQ/f+bNnmnXyEqb7rtB84FdzUmVsUPzCqlosbJk1
         RpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=gHe0Jr3HHrqFSICLL6R/jKSDOkoJC7KnN5A4sHFyiB8=;
        b=hAZy7oefAoBKtdriOBhhynzc9foSqLfKrQIPI+4WVAVZkLpfduR7ZZzQ4YU1wcir93
         36ObEyTfMD4UAaRwyzoWOe+XS6x6NpWB0zjiGvwTY4udTYWs/H8Sv9iL5mwOr9tqiIbG
         28pr4m2iVesoPp2trPIyAdPrDvooMlY2a8qtJsHJi8B6wagO3nmASysmC3a4ioJD6MUu
         mDt35UKTcIY+vDQTXB4tYh06VYa8vMXyfCCfA+AUWOmGKUo5BNMqIDXa+C9+JGyjN9ai
         bZIzFQa76bJ1JlqMTRpDHeLgxXly0y8JMF3gHAYrPjSDs+ze+XLrIF4a/1hPTG5rmR3V
         /jgg==
X-Gm-Message-State: ANhLgQ2Hm4cmEQ6Xaa8WtZFnTPb70xegtTWEAw96MWj9qR/LKVxcbmNx
        Y+FdJ12IEGJXM4P+xuxl+jI=
X-Google-Smtp-Source: ADFU+vuQ9gKOmA8OfdL5F/xdisstDpTQKTtu4YS8f9MRoHfC6gjqinz0F5xszMLlyow+1EZ2NDjG+g==
X-Received: by 2002:a5d:440a:: with SMTP id z10mr4590724wrq.177.1584134439897;
        Fri, 13 Mar 2020 14:20:39 -0700 (PDT)
Received: from AnsuelXPS ([2001:470:b467:1:44af:5966:96b9:9aa4])
        by smtp.gmail.com with ESMTPSA id p10sm17533703wru.4.2020.03.13.14.20.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 14:20:39 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Stephen Boyd'" <sboyd@kernel.org>, <agross@kernel.org>
Cc:     "'Abhishek Sahu'" <absahu@codeaurora.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200313185406.10029-1-ansuelsmth@gmail.com> <158413140244.164562.11497203149584037524@swboyd.mtv.corp.google.com>
In-Reply-To: <158413140244.164562.11497203149584037524@swboyd.mtv.corp.google.com>
Subject: R: [PATCH] ipq806x: gcc: Added the enable regs and mask for PRNG
Date:   Fri, 13 Mar 2020 22:20:36 +0100
Message-ID: <00e201d5f97d$3e76a9d0$bb63fd70$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHIdlTVZX/WdQxRzReDjkwhjOOSdAGrUdrmqFSxueA=
Content-Language: it
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Messaggio originale-----
> Da: Stephen Boyd <sboyd@kernel.org>
> Inviato: venerd=C3=AC 13 marzo 2020 21:30
> A: Ansuel Smith <ansuelsmth@gmail.com>; agross@kernel.org
> Cc: Ansuel Smith <ansuelsmth@gmail.com>; Abhishek Sahu
> <absahu@codeaurora.org>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; Michael Turquette
> <mturquette@baylibre.com>; linux-arm-msm@vger.kernel.org; linux-
> clk@vger.kernel.org; linux-kernel@vger.kernel.org
> Oggetto: Re: [PATCH] ipq806x: gcc: Added the enable regs and mask for
> PRNG
>=20
> Quoting Ansuel Smith (2020-03-13 11:54:06)
> > kernel got hanged while reading from /dev/hwrng at the
> > time of PRNG clock enable
> >
> > Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>=20
> Is Abhishek the author? Otherwise the tag chain here looks wrong.
>=20

Yes Abhishek is the author.

> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
>=20
> Is there some Fixes: tag we can get here too?
>=20

Think  I should put the commit that added the gcc. Right?

> > ---
> >  drivers/clk/qcom/gcc-ipq806x.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >

