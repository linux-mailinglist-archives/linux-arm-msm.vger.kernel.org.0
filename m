Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E072E19CACF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 22:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgDBUNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 16:13:54 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:33541 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgDBUNx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 16:13:53 -0400
Received: by mail-ua1-f68.google.com with SMTP id v24so1851810uak.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6t7teMCniYXDrukx0/8/B4CgKDn7KxOb6QKlbBBjMY=;
        b=bkN3qGxK7rRzbiV+PJkqxHAOFPEo5zduKQYrG61/u054K4GYe5G5c4QbrvFU7o4Kz2
         66dnjnuHvQyuf8frLWyqyHY7P7vpiM4gS/Z2daDfwbqNbzjfiufOHb/+naGmpJ/cA/XH
         6rmxCIM2ekdipkaPURHP+dWrWnlbSgK49jfrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6t7teMCniYXDrukx0/8/B4CgKDn7KxOb6QKlbBBjMY=;
        b=RQPiwBpYbR2PYmERN/YIyfWKi7g5TtSc9Iti+OBZJJNSKSxffj3vKnyHZnFvbgmkZn
         Bs5b2BkX/REJ+8S1h1XBzYt2LMxWLkaWlxsf6OpEULNbVHQiFYUQ+6czbOr9MEn9KhqE
         vvr+FWDlgrtXjxWNCaTwfgKjcwh5NtcXz5AisEgyknfyV7XFUF6aaVnokOAEAsKVBcZV
         d2RkS4N1D4rk+QNPxwPpZeo7aIQQj+PM9XpaMYTH956Qs+wTzjDE/RE2GHXIUXZ7WrCz
         WPrtvgsE9AHhMZC8I3o+cmyDnKivYekwVd+El+49l4f2xNuFnG7n0Pxeat8QeMcwNoHA
         SG3Q==
X-Gm-Message-State: AGi0Puaiq2SbLNBK2uIRNMPcW/qZPVyx4M2fbtyvJ2FsUo3LQ5nIOsOs
        eQIiPykIKNLBuNvYEOdtPwGBtXdzpxs=
X-Google-Smtp-Source: APiQypLxAl6RKFFFqKld/FmlkNFn8bWeJLX7Fp2giut/C9dLpb+rU/GZajyLNUUxoGgoBdS8KgSVPA==
X-Received: by 2002:ab0:1158:: with SMTP id g24mr3969475uac.71.1585858432238;
        Thu, 02 Apr 2020 13:13:52 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a84sm1645293vke.16.2020.04.02.13.13.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 13:13:51 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id r47so1818324uad.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:13:50 -0700 (PDT)
X-Received: by 2002:ab0:1d10:: with SMTP id j16mr4123848uak.91.1585858429615;
 Thu, 02 Apr 2020 13:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <1585660782-23416-1-git-send-email-mkshah@codeaurora.org> <1585660782-23416-6-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1585660782-23416-6-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 13:13:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMwRFcNqgAKnTyYc85xgsrWSzs7Q_4nC2kOzpE=YJaUQ@mail.gmail.com>
Message-ID: <CAD=FV=XMwRFcNqgAKnTyYc85xgsrWSzs7Q_4nC2kOzpE=YJaUQ@mail.gmail.com>
Subject: Re: [PATCH v15 5/7] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 31, 2020 at 6:20 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> +/**
> + * rpmh_rsc_ctrlr_is_busy: Check if any of the AMCs are busy.

nit: this is still not quite kerneldoc format.  Specifically, the
above should be:

* rpmh_rsc_ctrlr_is_busy() - Check if any of the AMCs are busy

You may think I'm being nit picky, but try running:

scripts/kernel-doc -rst drivers/soc/qcom/rpmh-rsc.c

Now search the output for "Check if any of the AMCs are busy".  It
won't be there as you have formatted it.  If you fix it to the proper
format then it shows up.  I'm not saying that you should fix up all
functions at once but if you're adding new functions why not make them
compliant?


Other than the kerneldoc nitpick which could happen later in a cleanup
series for the whole driver at once, this patch looks fine to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
