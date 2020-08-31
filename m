Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B63B2574E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 10:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgHaIAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 04:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbgHaIAp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 04:00:45 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E641BC061573;
        Mon, 31 Aug 2020 01:00:44 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id o18so7226657eje.7;
        Mon, 31 Aug 2020 01:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RLyGY7skttPgNOsTkC5qujmdsaHTNBsI9n0BA8OjV9c=;
        b=HG/qEiyC9awhcfnIgmgt/osngCjseQB57TpCrwAGZejnh63dA8FdDNWc6FjG7hZiQd
         pu/iQpRptYlTZuSWbuZHQr1G47yxwjXrBlvWve2A/c4nHYaWMUnIQ2Bju4WnbFsn69bl
         ASNtOvqRCE71Y/djLTEqpmrDm9ZHT6vECvGdBKWhfnWFPTNFBkpKFscAtbW47Ecgt0Lk
         YnU6FomqRWLxTxRqBLK9rqwLHQini05Q20EbNGOzYAWg2IULEYTkMj5LH74pbtzml1sA
         8OUWhSA39tpycMgWQegyiCX9PxJGm4Om9QCKUnEqz5o980mepwoyD14sSiIzK1a6DcVZ
         5fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RLyGY7skttPgNOsTkC5qujmdsaHTNBsI9n0BA8OjV9c=;
        b=dESKyW/CujOgRxnm9NgLGHVlv8H71Ano1hMI3K6tFyb/xCy1jLKGNF7jbFbJ93Asdr
         qV7GDU0hISWnETs63Z8vVzs6mN9+Y8p81t32oM0cSC6Vt5J4bxwoYMIPwLV3mGXGd8p0
         M0SxOQTdp0ZEbLF7IwDBOh536TCeXlnjE1r2p2mJ3igTSwjA+DCbo8A0R8i6aQdd0PHv
         6JNu7CgVsqT9ozmoFRAdJZTGkGnjr+HXVOIVL78+ISSJ4R4SldSY1GtszGFIEqP04THD
         eEbmCY3TVXZgfXNJ4UldUjnTZTwkzBmoZ8ooMvUrWDQI7nwaD3agG9fkbBtS9s/EyLq0
         SExg==
X-Gm-Message-State: AOAM5332AoXEvF4TVfVNa9avcDhqpPxSuUcEvmQQB1ERaJzYTbnv9RvM
        6UHmXfe58xfAsb0p2UYDG/0O3qyJ/BtFh/is6aGBbvmmDtc=
X-Google-Smtp-Source: ABdhPJxBfcSDn6XcN2nGEofMVxqRw1qOv9l16bC+TFGmq4avPtJ4PxuJPRshQlSxWv+9zqsmzKmIoTWzzX1k/DKUVC8=
X-Received: by 2002:a17:906:5812:: with SMTP id m18mr38190ejq.66.1598860843635;
 Mon, 31 Aug 2020 01:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <1598851448-5493-1-git-send-email-amit.pundir@linaro.org>
 <CAMi1Hd3n2rfr+k09L8WO1S1Tn1s3xJencmr1q3a6e-FOgXr5Qg@mail.gmail.com> <CAMS8qEXcANkb-HoTk8zrXQEzkQO4cnFw4hj5tMp82UEVKd+eHQ@mail.gmail.com>
In-Reply-To: <CAMS8qEXcANkb-HoTk8zrXQEzkQO4cnFw4hj5tMp82UEVKd+eHQ@mail.gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 31 Aug 2020 10:00:07 +0200
Message-ID: <CAMS8qEW=EbKpBPSp10PgnuGY-rcqtrdhRs0ObYym5vrbqTtb-w@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

>This happens here

Forgot this part

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/core.c?h=v5.9-rc3#n398
