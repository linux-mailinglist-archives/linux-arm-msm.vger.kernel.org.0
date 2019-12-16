Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8DBF11FF93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 09:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfLPIUK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 03:20:10 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42856 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbfLPIUK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 03:20:10 -0500
Received: by mail-ua1-f67.google.com with SMTP id d8so1764527uak.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 00:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ejdI6l2MpiYe782h59jIGE5FMUmgtUe4qzVwYNXmww=;
        b=zNhA6sQIvrirlHCC9+lV8lwZmYIThF6Cb5/e10jRvCda1SodrIGyW+1y1FRxISYeqt
         ymjut6ALn0lrVMeyzd0+Wq5TK73LF/UmbntZSTE9+HDYoHZzjMkMfFVWskPN3ePSbaSm
         Rhp5nBqj+mVFO+JZSBBZsmiMg46Xoa7lxa0A4zIzuj9RLdtazLXsimA1mhiYn+Byk2ic
         ZfEAwaDeDohDz18BHRUzfZHvQkhnPUaTP/eCjcihcbpl2twLfFUvg3T9/WvkDqfekzIo
         lY5jMNMerytVgatLCjJcUkR14W9DYj/i3K7Xmj6dJsVsLnQ3SkDBa+d2qyALhl9Fw0TW
         FChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ejdI6l2MpiYe782h59jIGE5FMUmgtUe4qzVwYNXmww=;
        b=O/rboQT9KL7wTS7hT0zDXY3DNNUUWw++PRUus35LWMBm/0hlIvcCFYYhcwqVDtJIda
         7ztnSttrrtAOzKwMg4HkEMXS524v9454mnMKV58jt6lJXyfrUwdAccaM5X64SAGiS3WA
         IWdCEgn04AadVBjTtr38ieusUbA11HTehyY40urOJNx6LGjjHd2p3pnSbtNIKrz5rEbt
         9Q+yuh/DazY7JbtE4VzgNa80dwaNTj5i9lJMBU+g+HEeGl21vhUU4HMYhHh8m9ETckqL
         KIjXelqL9P9NDj0CNNcN7TRuLhDlwdvGkB/oLGi7FAAP8wxtOt7DsnHXjYIrINyPyzwr
         Gzzg==
X-Gm-Message-State: APjAAAV3Avn/lS20agXZ+3Q+yylTkoH4+3fV0wWLP7uVPrKMpAlmcF7A
        MgtLWeIy+Gkuq0clL1QFtvwpO1JN/u1zPCQlt024iw==
X-Google-Smtp-Source: APXvYqyMIA/7VP13JucpywWenFRwuvJQzwyVI4uVwVCF1oD8d8lLCXdxOD2nx2LY/dqipJEgihXFLTAgCEdx8FIQays=
X-Received: by 2002:ab0:32ce:: with SMTP id f14mr5108941uao.54.1576484409083;
 Mon, 16 Dec 2019 00:20:09 -0800 (PST)
MIME-Version: 1.0
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org> <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:19:58 +0100
Message-ID: <CACRpkdZtbViGmGr=L3C4ibx3RVvB0tsv6JamvOPzo2mRmfk1FQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: sc7180: Add GPIO wakeup interrupt map
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 30, 2019 at 8:07 AM Maulik Shah <mkshah@codeaurora.org> wrote:

> GPIOs that can be configured as wakeup sources, have their
> interrupt lines routed to PDC interrupt controller.
>
> Provide the interrupt map of the GPIO to its wakeup capable
> interrupt parent.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Patch applied for v5.6 with the ACKs!

Yours,
Linus Walleij
