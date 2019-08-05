Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24EFF81643
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 12:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfHEKCZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 06:02:25 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37018 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfHEKCY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 06:02:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id z28so24565217ljn.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2019 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XAGJ6nmlMr4Yi+RQLlkPv1ukZ547ykzkK8qLxaxmmlo=;
        b=oTfq/502TRFvIkTpAbQuqJlDIoZNdPVDMn/Gg7hQhczZIvS9RSd2R5xicilVkuq0Z2
         eqLb7wE2zUiWftvFdOZ52mKrVrP5DD/8fzlorSFGOIhFpfbjUW90BwYRBGFL0T+xUce/
         OCqhjg8ciQtLs9NZoGDYq06OA9tzFNXnqeL5qLWzF0PIJ7w7FXcaeGkP1NgBhD7X0eyv
         EQYxgKJRu+CZ/TviaRWZ/JHf6ilW0wm9048X9RgONJGZFIJdMK3uYhtR0Ch08kpIJVhP
         Lul1VAGyJeOXCCW6oQImezlq0ps71dMb5X5RQasKrbUIFZ7pNfScN9gvWAC9aiq9SKNh
         92Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XAGJ6nmlMr4Yi+RQLlkPv1ukZ547ykzkK8qLxaxmmlo=;
        b=cu87L1nJ5YRQmm/FMfKU7ZqUxzWXo5ACINzabkz58D+nBNo3MWXPRXp2PeBiqQZZMd
         YUpg12F33/xPkDQrV2ltL/nw7dy6l/t/bzZ36TOoUB0cXFymafIiN/qgCFckRRmIR7XF
         HuYV58svo9csbyxOMbr2n4sicmR3aQCgBoZjKWyqKsrJBGn/KTOYIuh/YQP+b15AZYBn
         Dk9ybubgqqyzLiJcLMCs4BJHodeqEAhGuz88/DnrV+KymdL0AuVg2zHYQTo1YGPbiw6N
         JoPIny/beRp4YBl/MPucg3oWmWgSLqudDSEtcOo/IlzgfNWdEeafmndOfTUMy/FNW13L
         W9CQ==
X-Gm-Message-State: APjAAAVPS2hlX1A3wTQVMNFvcTL4FpsFZD316/3CKp4jbAaKijGtuVQW
        L5Bp15CANhKwFEEtKOZaj27C/bL4yKTqP6hBtnUC9w==
X-Google-Smtp-Source: APXvYqys04wM6WLDQwhUTjZ3eUyxWSnjCyTHJetuEixRDGtl+UQpwqanXwJMwG7EQng+sMDuEJBWZgcWhWCjTh5mBs8=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr29489621ljc.28.1564999342891;
 Mon, 05 Aug 2019 03:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190723192738.68486-1-andriy.shevchenko@linux.intel.com> <20190723192738.68486-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190723192738.68486-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:02:10 +0200
Message-ID: <CACRpkdZDeOXJzT6xXp_in0TYjYnE=wFJ8t0AO2bQ+4WMbRS=mw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: qdf2xxx: Switch to use device_property_count_uXX()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 23, 2019 at 9:27 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use use device_property_count_uXX() directly, that makes code neater.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied. (Same comment.)

Yours,
Linus Walleij
