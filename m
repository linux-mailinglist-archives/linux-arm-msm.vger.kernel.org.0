Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672D4242A7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 15:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgHLNiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 09:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgHLNiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 09:38:13 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FF7C061787
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2020 06:38:13 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id g8so1814765wmk.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2020 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U6a+d3dtYp0KjTU5EEF1X/oH34jCVu+NBd+4qq9Ixtw=;
        b=yDBDdIyN79nLSMZt2ii6ECd0ccqcb4C9/zsl/VF4QcmYRhUqFZTNGn8S1O05yLbG8m
         ubDQCxhglZD3VIDoqHNTs9nrCaRyzEAwfy56sy+jta0zY4ozoKLFQi8y/RL6LbyXtsg7
         vPPzvQUdqo40z1n1oftLgNHQDjSWftJjjBDsQhvTEzJKLV/UljBn1O8TgzytjsFt9w8U
         TJcSCoUGsmpvlQAouUYl2WNa4NJG9STXIifpmKWhao4D+DxMBSRLDd4A1cuJ2pp1KVzb
         6SjO2F73k6YQ1HGycCizuxtmTBUcGfkSqURV3MFuAbgx20pDncLVyrW2c/POdaOxoRFd
         /XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U6a+d3dtYp0KjTU5EEF1X/oH34jCVu+NBd+4qq9Ixtw=;
        b=tvMwzvnY9ghWETQ7ecMNGimy7kHjH+Re39E6RuR42if7CU//jHOG+uRkO4bTUWK/bh
         6hy8uF8E7fu8xMld8h5ENP+EdgtsyQgY4P8YWs8OQAEXwrOVWvOblxcY5STNRazxV3Ts
         0iyFaCTt5XU2f0K1/nsWpt5WLld3Bvp0zGZorLXZ9sLkVtn3XuSK3yOqskJTilGoufJE
         EOusO2ZA5TceVX/z1DUvAblLAMsoW8y1Un9/QJ0vIAKGE55LayfUqNEibZHWHLL6GR0F
         LhPLSlCk30nCKWtH2lD5ePjNDULZpYV11e2fwfpBNlhbp/FWPTr4jJj/srMfJDyau5IA
         FD+Q==
X-Gm-Message-State: AOAM533K9SRsaZyVkqsNpa9mZw8RxOolc2iYM/quLnyqnfsoDuBqYEVO
        Bs3U2SCrSBDVDunbw5NVYjNSd2dMU1Q3Cm/XJSv2VQ==
X-Google-Smtp-Source: ABdhPJwqMh6ofIFWi0PgnalLBz97O6pS4TLZaTLUZpUxWvbz7fQU77ZzO8rJnHikMk86N01F3K2+jUdwRSWt3HpDtNI=
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr8592936wma.21.1597239491828;
 Wed, 12 Aug 2020 06:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAMi1Hd3Dv_T7kgThLTk2QLtfS7LBvhJ5R=6C3seUYK0GvNV6eA@mail.gmail.com>
 <20200806223134.42748-1-konradybcio@gmail.com>
In-Reply-To: <20200806223134.42748-1-konradybcio@gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Wed, 12 Aug 2020 19:07:35 +0530
Message-ID: <CAMi1Hd2P47PWjnRaACE9oyxRpZZwFwTamwCCxufN6qW+8SKFrA@mail.gmail.com>
Subject: Re:
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dt <devicetree@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 7 Aug 2020 at 04:02, Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> Subject: Re: [PATCH v4] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
>
> >// This removed_region is needed to boot the device
> >               // TODO: Find out the user of this reserved memory
> >               removed_region: memory@88f00000 {
>
> This region seems to belong to the Trust Zone. When Linux tries to access it, TZ bites and shuts the device down.

That is totally possible. Plus it falls right in between TZ and QSEE
reserved-memory regions. However, I do not find any credible source
of information which can confirm this. So I'm hesitant to update the
TODO item in the above comment.

>
> Konrad
