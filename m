Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3107146CE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 16:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgAWPcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 10:32:12 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43970 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbgAWPcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 10:32:12 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so3901618ljm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 07:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MGL3YN/a1QsM44T67BF5Mn1OkqchZqZP31dkXZT/mP4=;
        b=lIKFPf6Tl7jsOH19oq+NvqozpJv0bmxaxFy03dsv384STiTxLZaIwZ9MCDD7TcSjms
         dc8JovvWYpFCYORRrN51ypwtNPSfLrB0Px+23/ngRuFdumCWWMBAP5Q0xwjoSyBanLNM
         6Wzd6N0l98oyvojo0gcEkxFyMvq+IKKFKUUHN2fjJsxj5npR8+gukIGMRoCsfOINd4BT
         KHeeJ6qe7CvuaCU30ALw8FTOXGU6r+pslAjDp8JWFjEXCEqbvkjwwK/yJiHqs0x8KaUA
         N/FXUvlQBOPOC4hKjXNY730maf+dFo/6/9u9bs1A7JEc8HJ0krZ6IlnrZ3g7Rjj+QV9Q
         Rd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MGL3YN/a1QsM44T67BF5Mn1OkqchZqZP31dkXZT/mP4=;
        b=i+ofGFxtceXFlINBMOrZjMBmxEunaFga2wySFU+TNfSeKurXjQcV9nHVT1FsXOJbXa
         9OotyWKXUe5JgnGvk92eDI1CqSiM/GUFB5RZwa0c6wfT0gKZeX19bMQJ5zMi9oaZ6z1q
         nVD7ZTaj3wuh3Rp7/kosdHKw5F6vWbiDIXyI/j2UtDkF/0Ncb2FiCgPnBSDBrWU/ACli
         5T/WEfJu6tgnD3zXLjTydOeTEc+uuejw/u1jQIsm5j53ZaFFudQuB7wEc8GIcO/p/VhF
         aOpbOBlldmnaw2x15IP9DviIbSc+kd4PRzlk1iMFDsFXOzbmJNf+0u3AUk64qyF2eT9M
         MneQ==
X-Gm-Message-State: APjAAAWc9y5R2DX8BCncZWF+1UnyonfcDxHZtDfytquDzj1G+lL6Hw59
        TnG9L0Dk7+tt21J6ezA+R+UlQ4t8uwtlaKnJquJiHw==
X-Google-Smtp-Source: APXvYqyy4QdMOJF7UAAF01QSHT1XerQGGdG1nEX/vAiaB1NLenghVituIA83K61RYohyedHfHXdT7JHf57/asDdf5zM=
X-Received: by 2002:a2e:3609:: with SMTP id d9mr22299304lja.188.1579793530470;
 Thu, 23 Jan 2020 07:32:10 -0800 (PST)
MIME-Version: 1.0
References: <20200121180950.36959-1-swboyd@chromium.org>
In-Reply-To: <20200121180950.36959-1-swboyd@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 16:31:59 +0100
Message-ID: <CACRpkdbPv_u_vMK_LjPc+p-hGoufx2KotcL=+Qp8_G=tXfaDOg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Don't lock around irq_set_irq_wake()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 21, 2020 at 7:09 PM Stephen Boyd <swboyd@chromium.org> wrote:

> We don't need to hold the local pinctrl lock here to set irq wake on the
> summary irq line. Doing so only leads to lockdep warnings instead of
> protecting us from anything. Remove the locking.
(...)
> Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Fixed the Fixes: tag, added Bj=C3=B6rn's ACK and applied!

Yours,
Linus Walleij
