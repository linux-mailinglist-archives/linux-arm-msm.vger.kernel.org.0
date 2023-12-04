Return-Path: <linux-arm-msm+bounces-3200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3B7802F6B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BF5A1F210A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 09:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDD01DDE1;
	Mon,  4 Dec 2023 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNrznMQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D0DB2
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 01:57:26 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5d7a47d06eeso15600077b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 01:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701683845; x=1702288645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyeYb+ql0SyNyhyMLosDv4p5iiN7RVdysjk96TvPY/U=;
        b=VNrznMQZQXMwLXSN68X9g5/OdxpIohRK+oNslgHvKEP/xEBwGB7Y8aA4ftrOWHhzLv
         CBj+C1vCGSO+LuYnvysjMY5SPehZXTq+RKMg3ieGrZPxonIy26dbh5OTdrfas3x/l3y0
         tXk0fBMMJcQihEQNoyFpf4141mLrbx2CJu0LfyEpHl0oKnaOI8qJ9rFPzpu/CJRSvDdI
         ZBS8678B9S8ezq4LzEE/ro3yEaiGssVVF4KHMSISDCq+Sjw9jmxJmmBU8CkQSl3dr9XF
         R6orJ4atECtlChdpljU8XVcgpBKm7SZKBTUXPpnA3OdVcMa+e90bqvGhyUgwQOGgUvfi
         2oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683845; x=1702288645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyeYb+ql0SyNyhyMLosDv4p5iiN7RVdysjk96TvPY/U=;
        b=JE/CmkY/Tgyl5ACX2c1E3/ev2A+CKJz1gLK+5ImE2v/aor0kMHbtD6Z1SbY1NKT/T2
         3CrDCLiKxg3kR3Ef0fcB3/V7m4WGb2tbDCorOP19HYI+bN5XgASYs4OGWVTEO/TGqUER
         f6ceJK8YscbFajcG3dU4oO3O1rsBpF6TrXpEqPMT2+u+ygmiVRsW7DIS398k4AFBPANT
         1W/MSqzZJ6HkX9jh7sIQlrlNwL6YYqM73Rzw5TsvooAe3LHwFBzN3bVZT39YXesH4wDB
         Aa2o+h713OAKJIxhiXrwpUY1vVWo6fgC/WfLQ+SPugXCtXwUNsmypKzTI1QJW/7fQwLX
         51Mg==
X-Gm-Message-State: AOJu0Yz8wSfWeWbE4oMpP6AFJ/P0ytNK/QhlefkA9bZC6mx2g7MARXAC
	R90QBT9XG2ri+EAqd9vWFJr+EH9JW3bggx8TrvHMWw==
X-Google-Smtp-Source: AGHT+IFPNuK+9cOIpKHmoinczKV8MminI3NreBuRG+6sy+RGo1WH4QD56pTWpN4kexe3XakI3kZkEOgDB4+bi46jBIc=
X-Received: by 2002:a81:b626:0:b0:5d7:1940:f3db with SMTP id
 u38-20020a81b626000000b005d71940f3dbmr3037866ywh.67.1701683845464; Mon, 04
 Dec 2023 01:57:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130024046.25938-1-quic_tengfan@quicinc.com>
 <20231130024046.25938-5-quic_tengfan@quicinc.com> <dx62durg3wmqviqdpecdqprd5wwkg4i7n5tgcab55axzssdeel@ftt35c6td2sh>
In-Reply-To: <dx62durg3wmqviqdpecdqprd5wwkg4i7n5tgcab55axzssdeel@ftt35c6td2sh>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 10:57:14 +0100
Message-ID: <CACRpkdZRNvUY0rEY__v9wPy4bjuDSgFhEkXFHxixdfyKSw56Bg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: sm4450: correct incorrect address offset
To: Bjorn Andersson <andersson@kernel.org>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:33=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
> On Thu, Nov 30, 2023 at 10:40:46AM +0800, Tengfei Fan wrote:
> > The address offset of 0x100000 is already provided in SM4450 DTSI, so
> > subtract 0x100000 from the offset which used by ufs and sdc.
> >
>
> As Konrad points out, please fix the broken patch, don't add a separate
> fix in the same series.
>
> > Suggested-by: Can Guo <quic_cang@quicinc.com>
>
> We unfortunately don't have a way to give credit to those providing
> review feedback, so omit this when fixing patch #2.

Just write in the commit message that Can Guo helped out in reviewing
the driver (just some free text).

Yours,
Linus Walleij

