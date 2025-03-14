Return-Path: <linux-arm-msm+bounces-51401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D7A60F8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 12:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FA113A7660
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 11:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782A61F4717;
	Fri, 14 Mar 2025 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RgZ684Ni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A651DFD8B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950359; cv=none; b=u8pD/Tw62VBNUo5wmxO83Kkvw5J2HBVqK4HSDaVOqVYPMvRL0g8i0RFY5rpZA/nLAAiKb5Wu0lAfCAIuXpaQfvoKK0K4M7sMRyvghB8iM1kPptscSLD9DSWkWrmyO++v/HXuOb86GltYnntEifq3bv1V1LoN1MZMU4J+w7b5kvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950359; c=relaxed/simple;
	bh=XxBikUZY8aio3BzZ0PwzUhcA6cIoxXU6nbqOx8gyLzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVAm53UNt5hLzaZXULy+yk73Tnf7QLHMiK0BSehCGhJGC7/6NyFIZHpMBWZ8m6OooKfqIC2Wh9YTGq1CEF8cMMmHwPa61kUkC5jPX2fYNlG1FpYNyc0PHLfTXk4iLVqA34TCsmBGtIsRIQYKbk1uX2zhvXjFe+6Z4j0+Q/kBzFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RgZ684Ni; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549b116321aso2236993e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741950356; x=1742555156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxBikUZY8aio3BzZ0PwzUhcA6cIoxXU6nbqOx8gyLzc=;
        b=RgZ684NiMVxyjEe2ggUmSWm2pHyOHmOvvAZFazNWOrukjHbCWik9Y+T2u1tEIHfN/s
         TtVhc09UAZgtCKrJLijakB4GP22ymg6rW8qf0i3ENDs+83HczkfNXJVyNMzE4WEOEirA
         jSbtVQ1thXolsIbG7YXmhuRjSn1yfV9j8LVjIfudMU+Y1NWbLAVac3+iwrjoB8S1O4Kp
         CLtczlp6cyZ4zsvacrp1niD9jZlL4A95svrv9io+QKyqFx/X9HmU0zsUyUTzYZhRlLui
         Oc6IxH8J9SxIz+RSgCegQKaNVKtzXhjMl3oLCsp5VFyryy1QGCRf/hwA8oFjJIxYaVxQ
         m2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950356; x=1742555156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxBikUZY8aio3BzZ0PwzUhcA6cIoxXU6nbqOx8gyLzc=;
        b=FE6LNZTkSm7u1lfP3Z3T8x3ihWvbVnJpA1wrcFq4CF3xnnSMrpLU0LkwOI0SF1AZXI
         Ozu5+LPGRLiHUN56rHLe1jArwJMDSNcQsSCF6V1OWEkffHSMafHd9rbLv6LrN+JltceW
         uhFLLiwJPnwT3GOZR6x9rgUFKhZmluHHcxyUBMNNDFYvpD4EiIevKZZcQLGr5OWvGc74
         VikGDsm5QHjXVxD76q1k0WIrylEK/10FnOuFy2bTpyn3CD9Pxg5FgzJjdwvyF138Q8M4
         +HlLmQDJxZFhFGwfDYZDB1lqbtnllPk/ABZ2qlEL5i26/TwUPCkSjjhX2v/ECEL5Gy9R
         E0Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUbO0RKKPrlggCg66VONyyPfq9KQ/mUK+yeDxfa0rC7gkkBNMSaL8eT+cypXzpUkKCKIY0Y1ifqMjAhOPGw@vger.kernel.org
X-Gm-Message-State: AOJu0YzZpJiFV2z6McrUUJUq3GlqybCYKQoK/B7CQmpMWrw5TQUGxcdz
	0YyWUII6tjOgI6DAuDyAWRgQFVhF0PcX/wKvX2okb5bPVgxkm5Ds3K0sXKO9LoYhNk1hf2HZ/ay
	qZRqt4xkP3UBOrGSzM/dKLlY9NXs2p3Q4wGjzmg==
X-Gm-Gg: ASbGncvWPorF7N3Bdq8DwrrN39akF2w4Vmpbd23KCvcElA9MkoSYhiAb5L6AnqppfsO
	8bypo+F4GvhVCBln5vD5wh8WG6uae/VEvUi4Y961bgdHzdk9RaczdzFM9iH0X6W3EmayAKCxZGJ
	jCw1OwMTWmIjH3sXcUxb23nAM=
X-Google-Smtp-Source: AGHT+IEtWG3hGAPpwZpW2Kb03ek5XF1oybcCjHGNlFQDEQWQLDYho05PNF9pKqd+gnKE83MT+G5mKyZ2nU0ypW9l18U=
X-Received: by 2002:a05:6512:696:b0:549:8b24:9896 with SMTP id
 2adb3069b0e04-549c360f4a4mr746105e87.0.1741950355704; Fri, 14 Mar 2025
 04:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-tlmm-test-disabled-irq-delivered-v1-1-f0be903732ac@oss.qualcomm.com>
In-Reply-To: <20250313-tlmm-test-disabled-irq-delivered-v1-1-f0be903732ac@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 12:05:44 +0100
X-Gm-Features: AQ5f1JquHlFLF2H3luwsKOipVRgfi7l4qhjJICzwca1VCtyRkDi9-duvsKNCvNc
Message-ID: <CACRpkdaXQ9=9+ec3VNSE1YXADbRttKx2wJQB+o+WHmzaNj5ZVw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: tlmm-test: Validate irq_enable delivers
 edge irqs
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 10:21=E2=80=AFPM Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> wrote:

> In commit 'cf9d052aa600 ("pinctrl: qcom: Don't clear pending interrupts
> when enabling")' Doug establishes an expectation that edge interrupts
> occurring while an interrupt is disabled should be delivered once the
> interrupt is enabled again.
>
> Implement a test to validate that this is the case.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

