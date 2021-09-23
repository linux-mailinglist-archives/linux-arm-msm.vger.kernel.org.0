Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7A0416776
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 23:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243291AbhIWV25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 17:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243273AbhIWV2z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 17:28:55 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C18C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:27:23 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id z11-20020a4ad1ab000000b0029f085f5f64so2609100oor.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Sep 2021 14:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EUO9/yL8lYqvnNfVuNoJkSi+TEZqLFgHFGyYVZDmMP8=;
        b=Nos61hEkqppzT+FjmU9ibuwTce1kgFehjjl2tqTbdkumPXwyQ2nIPAhrZDmyCenqsP
         PvkxrIGuP6oQbhr1OKY+fJDfG2vlGN4oWWwdMweMMKYh1Lnj7Cnma7UVQQrjA3JZGzVL
         nOqyfVMHmowyaEKnT6s96EKXidbcCygAiBkiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EUO9/yL8lYqvnNfVuNoJkSi+TEZqLFgHFGyYVZDmMP8=;
        b=i1zfM8soX6u0ye7ZUp5oteGGdDlGflSCs3cGAjkwGqd0+I47XyZ9jZ3SnR1Auq3w2K
         hfwv1gog/ofzB/nO9W6nl343mDpAcWjbbtTj0qQgWd9mf9eruxh+rCPDcvjDGEIAT6iD
         3GBDJFPYI1hMB4xMkDqil87XeOGYk+XjfYrJqSdVV7pi1ylL8LNnlsDK9nUtZhrJvspJ
         qEX8TN5exQh3K8v6IV/dNHIyeywJs4o3T70BQcIYkWH06S9mcNB3aoTsZlq6iKsjM+WM
         VlyJgvReQ62PUvMuD9+fbu3z5Pprbdh/yz2AH2KyiZk/RB04xOY2iHsZhHexik0+47+q
         DA/w==
X-Gm-Message-State: AOAM533nOYzZfBERv0X+Y8P8hpCLY6qsbnsca4yHuf4Aaw7bvv5g2lMe
        qSnKSjf/cdbiDvJDMNb3J9tYaQBN3E36DUTb3kMw/g==
X-Google-Smtp-Source: ABdhPJzLg/c4iq6I9UelgivT+3scwJlKaWKfZU82sV6BahirlwQBeXwQ/FFuN2uWjDcBSEtDrrM79CQp0kpNvY/wl0Q=
X-Received: by 2002:a4a:e214:: with SMTP id b20mr2757000oot.1.1632432443127;
 Thu, 23 Sep 2021 14:27:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Sep 2021 14:27:22 -0700
MIME-Version: 1.0
In-Reply-To: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org>
References: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 23 Sep 2021 14:27:22 -0700
Message-ID: <CAE-0n52LRpd2R5Heyk_2KeEPN7pCyQrHk0putL=rGiWfHiP=cg@mail.gmail.com>
Subject: Re: [PATCH V10 0/8] Add QSPI and QUPv3 DT nodes for SC7280 SoC
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, mka@chromium.org, dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajesh Patil (2021-09-23 05:16:10)
> Changes in V10:
>  - As per Stephen's comments, Removed <&qup_spiN_cs_gpio> in all spi ports.
>  - Added "&qupv3_id_1" in sc7280-idp.dtsi file  because EC and TPM
>    are using "qupv3_id_1" node.

Thanks. Looks good now. It would be great if qcom maintainers can pick
this up soon so we can have usable i2c/spi devices on sc7280.
