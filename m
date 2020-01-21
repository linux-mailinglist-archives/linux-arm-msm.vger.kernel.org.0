Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6233144505
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 20:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgAUTXO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 14:23:14 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39556 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728668AbgAUTXM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 14:23:12 -0500
Received: by mail-lj1-f195.google.com with SMTP id o11so3732985ljc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 11:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8rCcwlzRHHVYg3hiCBv7NmxGLfftNkVC0+svQxkapXc=;
        b=HoAKMG0wQ2wIiKTC05L+Bn7mtOknDgXQI4PO9uIp4w2SGyA4WKzyeicjM+2gCmY1jr
         vp7Mvfiy1LQGZhgbceOZp21oRkuxUd4XkR1DsidRJ+8vvN8/hSyc9kwfO3vsE4cQ1Lnu
         C9t8CGrIJFnHRmoI4O30boqJZqDvvlnB7z7GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8rCcwlzRHHVYg3hiCBv7NmxGLfftNkVC0+svQxkapXc=;
        b=OkHGyKGvxsOvSOtOQyz5O2QdKy3fLIhqRd82bpA+UA2GbG8XhTPem4R9zjj/1w5fOw
         LWnaUNme4K4vNsgwmROGi6KBQKhupUfMcfewjfJIQQm8oRJWwdquSklOJo30BVD5HQ4p
         229MjU6N230j4AbBwP4lm35AK1bN6doGF4eP6OFWCsTY9vkS8wuwekeBlExC4HdhHtBh
         n6618zn3FPZh27y9uMKncC+zP2j4KnQ0P8NmcgSmWeQOEZ2YPKh0OtwU5ComkD8BWyYu
         ZSuuG6FG+/p73JcGfPPfgIDCNp7k49487IOhyepg/bsmzv08rVg4/FAIR5/fFw0LPtDS
         ZM3A==
X-Gm-Message-State: APjAAAUV1ahRjF181yqVH4fjzfClpV0j3qnFPFu+KZOHNqZ1pJvzHHzM
        svX1qYQQv43s9a2OLdPTZD9hWUnCNbI=
X-Google-Smtp-Source: APXvYqwEhssZ+GPs5oVs0zfZxc6alcTD+FabfvMn+K5SMdX7b8bGqgvb7o6mBoBAtCwnocWc6Tl8rg==
X-Received: by 2002:a2e:9c04:: with SMTP id s4mr17883164lji.147.1579634589920;
        Tue, 21 Jan 2020 11:23:09 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id m13sm19194694lfo.40.2020.01.21.11.23.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 11:23:09 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id y6so4067901lji.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 11:23:08 -0800 (PST)
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr3453604ljj.253.1579634587850;
 Tue, 21 Jan 2020 11:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20200117135130.3605-1-sibis@codeaurora.org> <20200117135130.3605-4-sibis@codeaurora.org>
In-Reply-To: <20200117135130.3605-4-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 21 Jan 2020 11:22:31 -0800
X-Gmail-Original-Message-ID: <CAE=gft6WN52R1BckbgK9XCTB8TTY5Z6mh3QooceHTTtzVUmFLw@mail.gmail.com>
Message-ID: <CAE=gft6WN52R1BckbgK9XCTB8TTY5Z6mh3QooceHTTtzVUmFLw@mail.gmail.com>
Subject: Re: [PATCH 3/4] remoteproc: qcom: q6v5-mss: Rename boot status timeout
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ohad Ben Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 17, 2020 at 5:51 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Rename the FSM timeout on SC7180 to BOOT_STATUS_TIMEOUT_US.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
