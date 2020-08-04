Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CABEF23B8C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 12:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgHDKbC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 06:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgHDKbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 06:31:01 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8BAC06174A;
        Tue,  4 Aug 2020 03:31:01 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id df16so13109903edb.9;
        Tue, 04 Aug 2020 03:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g2cAJibiyxEQakU0b9WlYvDbYVxHzC3dgmfOqIe+6qo=;
        b=EZfhhftaG8GT8nua7BtRoTHrPubgAq5syFZJQ1AdPbIM3zNuIsgvkBVYvQfheF45eH
         l4PhWy1lergaun6Ab9iC34AwM5bJbkFKfDuc6NjwMf+I9Hf7prw4eGR5hf32Bg7V5968
         P9gYqmDcbh2hYySCSAEGzlXunrzOPMfcsO/G3BH+V13euzFH+lhWMRD+vMPUNQMyUIeK
         VZ541s5RvGKnGLkZuvvUzuYk3+htl6EdCZBQqsIViNYKyj47nX+tIwIX06fCKowSsuyo
         tLnQG5wf6vyrrabWmtK2/K42416wN/psv/PzBT+L+w3eaaCWmcdJZ11DHEVGjBEt7Elz
         +C3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g2cAJibiyxEQakU0b9WlYvDbYVxHzC3dgmfOqIe+6qo=;
        b=XRxPxyW7q60GtOdGv95+z9EvAIdKLQfftNuOvzZfr2OyX51xwpOnBCcxVyVbN5MKXo
         SGe+NRMsWLiMvQjHiRMUI3cWRkiHHVINEsr1fBR1K98naN5Lp23K7EA0K8ahRGBSG+jp
         bmet/wbCu55Ey45x1d2wd6B9HANrt3KYHpttGlphm9t7hXLISf6IfyojbQyix0qnOONs
         lmnPXntTnCHSk8//7bMSeSHvyNbnRrLGhKpsxLeD4SlXJd3gZ+pZ68aUv4lwKLYidIos
         kM0+UdFiQM8koG4fFfs2dbUGRgz3HOkYFs6FIRkofp2LYnTnoqbPy9T47DXCjdp0hqeU
         lStA==
X-Gm-Message-State: AOAM531bCmlxxoh89qMI4SoPwVlmdDgiQM2LXoBxEigRJGqcHavMZRPv
        tnnQXzLVWEV3GkzSr67qQvHEs9Jk+wTlcGnqMn4=
X-Google-Smtp-Source: ABdhPJwvhADRZrGOjLMoKF6mBnf1EepZ/BE5P0gUUEkje8oN6Zn6Qlwm/M+vCZhAMoDSYvpGauQ73yvuwF5i2wF9Bm4=
X-Received: by 2002:a05:6402:28f:: with SMTP id l15mr19986969edv.233.1596537060231;
 Tue, 04 Aug 2020 03:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200729120057.35079-1-konradybcio@gmail.com>
In-Reply-To: <20200729120057.35079-1-konradybcio@gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 4 Aug 2020 12:30:24 +0200
Message-ID: <CAMS8qEWQZPAZy71jx2Wx9B=RDximmC_A9On1Tk-3ekL-LTgsYg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] msm8992/4 updates
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bumping in case it was overlooked, hope to get this in the 5.9 merge window :)

Konrad
