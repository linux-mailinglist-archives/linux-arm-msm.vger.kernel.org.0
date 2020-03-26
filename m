Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C68E219468A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 19:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbgCZSbX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 14:31:23 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:40149 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgCZSbX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 14:31:23 -0400
Received: by mail-ua1-f65.google.com with SMTP id t20so2512315uao.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pFD2geY/p5iC2VmMRUkKBQnxSUg98rzcJbPJ8Ag8rBY=;
        b=LtzmbQSWi7E8xrMVFZUuf3+ZY3zKzZyjFkbR5rMsSufZB1jjjmP7JnP/DRAB6g/GCa
         3au0hWHYh202QGgie7YzjX4sl1PiqzVViyQljvphZEmGuRU85N38r3uy6rlkcIsPHIZw
         BPSL+KenIgtH7flGoOkYGdbW0ieQ9fpPcYktY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pFD2geY/p5iC2VmMRUkKBQnxSUg98rzcJbPJ8Ag8rBY=;
        b=sYHYiorzr6968WNrKwSFQTGY4fI3xkvXCNFgsUYa1MNwueu50N0CXOcrkgeuaI9m+/
         wRRUkM/UBK0czYVsCW1lEgo0QvqpHzGw7Y2UPm3HlQiPumHbgPuJtYkKNVjo/K/F8G1U
         rBOccCaEF15xXbBG1aPeEc0SnD6Bw2vYrgX3b1MFPiXUzyk8x0kj8TnbKTFi73PMk02n
         ZS/2+PryHh0It1VeOgRdPszb0vIPVBs42iXcUc+lIJBylu03VXYJNlKTAPEPMrY6kuhw
         J2GFFCTc2lhivHCZSJdhaYBlxCvH4WtxQ5hgoLS4vmS/uN6Ngbha51/589bj6q6j2bdq
         R8DQ==
X-Gm-Message-State: ANhLgQ07qXX5nBk74Qfs/YtlXuFJUmNahqgcrtQKbJ+y2UYQtHUMRS1U
        jqblarr0twMZaNtdMAtBD9VjMFIlb0w=
X-Google-Smtp-Source: ADFU+vtl2E8kzy/soYC8IODHd8C4fTMcvIOe96spG/XH62cMxwv4c/WgN3XAUwK0m0M8W8K8FKjn5g==
X-Received: by 2002:ab0:596d:: with SMTP id o42mr7795332uad.69.1585247482018;
        Thu, 26 Mar 2020 11:31:22 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id f27sm1526650vsj.26.2020.03.26.11.31.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 11:31:21 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id x206so4559501vsx.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 11:31:21 -0700 (PDT)
X-Received: by 2002:a67:694f:: with SMTP id e76mr7497123vsc.73.1585247480800;
 Thu, 26 Mar 2020 11:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <1585244270-637-1-git-send-email-mkshah@codeaurora.org> <1585244270-637-4-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1585244270-637-4-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 26 Mar 2020 11:31:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xwhz=N5dd5u2pYxKXyv5_PKhSZ5xZdvo+YXdk8THz_Wg@mail.gmail.com>
Message-ID: <CAD=FV=Xwhz=N5dd5u2pYxKXyv5_PKhSZ5xZdvo+YXdk8THz_Wg@mail.gmail.com>
Subject: Re: [PATCH v14 3/6] soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes
 before flushing new data
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

On Thu, Mar 26, 2020 at 10:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
>  /**
> - * rpmh_invalidate: Invalidate all sleep and active sets
> - * sets.
> + * rpmh_invalidate: Invalidate sleep and active sets in batch_cache

s/and active/and wake/

...with that, feel free to add my Reviewed-by tag.

-Doug
