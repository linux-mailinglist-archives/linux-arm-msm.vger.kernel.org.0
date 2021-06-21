Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2184F3AF74C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 23:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhFUVUn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 17:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbhFUVUn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 17:20:43 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DA7C061574;
        Mon, 21 Jun 2021 14:18:28 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z22so27145539ljh.8;
        Mon, 21 Jun 2021 14:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2NbTH9ar0bKdnQph/eF5yZcOxbu9PxKBYjUHqqTdkzI=;
        b=mRYEnZhwG3KK3axCgQymLy1qPD557a10PFVmxbOj3qaC44dvyYgOUkoEQXpn6HGx3s
         o0uN68IVXQqJpsOqkOgpsXl4rFx/NMKB1WpiUAt9Jx8hNLUkNdsc3NRChsO4mkMJ3LmK
         vTYq7hR+8ziiKJKzZYFsvJWiz2bk2hqGJqkSXrLnH7qEFd/kE+6Hv3+qWtWgCGZUYayG
         vHOs3Xu6Beu03I2cQ1Q+G/dqAfXTy7IlktriQYtN0tNe//PpXHIDIftBeSV6yROFfeVg
         r0H8PPwdHr7NUXLmIuGbBeY+FfXi3qqOraRrRgg6gwA5T9oH/R3IYP+CVgoCEpWcaGdP
         klIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2NbTH9ar0bKdnQph/eF5yZcOxbu9PxKBYjUHqqTdkzI=;
        b=f4Q4l6YruyqU+V3t6Z5tZoDA9+uK3RTrtN5j6wDAahEKapL0OmD4x9iTnSBoRPe47y
         /Z5KF79nqll3q3j+nzRYEcLB4FBtnk7NBf6ygVZxKM9a6fWeeFaaTOr6mj5zqv9HOGSU
         418RJeZkYOYBG7Ffhs4ie6rN/77ZWq2RXIi0BkJngqEyZFbNkEyrWXw/rwfUoiAMNBU/
         wvoOvt7JXfJMtA7W+L/I1qjyJzseNg5onTbvoiNG37eCZs3NAILlfajhYZgKzMis8Rr2
         1jwtZo6pD97cOMuElpH/B5ekh1E0SFzvOC5wJIJbQM6p9AUYWbY5PAo7pS7153qbeMkv
         8S/w==
X-Gm-Message-State: AOAM530zXhhnWwSaDtDm+etCkuNYLnStEI5nlz7mraT1xOWESGKxQ4BO
        z3niZ5QSkzqxU43a4Pck0hs4Z4zbNi8+i7Jtqac=
X-Google-Smtp-Source: ABdhPJwBygvueFRcR7agUyM89pdogLGvE7AXut20/GrPE26xEenitcbAWknziGnBnmSWl3Dqx9LECqjTbct4myjpGd4=
X-Received: by 2002:a2e:9104:: with SMTP id m4mr184164ljg.234.1624310306828;
 Mon, 21 Jun 2021 14:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210621181016.365009-1-angelogioacchino.delregno@somainline.org> <20210621181016.365009-2-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210621181016.365009-2-angelogioacchino.delregno@somainline.org>
From:   Alexey Minnekhanov <alexey.min@gmail.com>
Date:   Tue, 22 Jun 2021 00:19:42 +0300
Message-ID: <CANi4RBTDYdig4bjtLitpt-00TKf2J_cyne0EeynhX=fF8c7iWg@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] cpuidle: qcom_spm: Detach state machine from main
 SPM handling
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        daniel.lezcano@linaro.org, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com,
        jami.kettunen@somainline.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

21 jun 2021 21:10, AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org>:
>
> In commit a871be6b8eee ("cpuidle: Convert Qualcomm SPM driver to a generic
> CPUidle driver") the SPM driver has been converted to a
> generic CPUidle driver: that was mainly made to simplify the
> driver and that was a great accomplishment;
> Though, it was ignored that the SPM driver is not used only
> on the ARM architecture.

How many revisions does it take to reword the last sentence to
something more neutral
like"... arm64 use case was not implemented so far." ?
