Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2097F1DD303
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 18:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbgEUQU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 12:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgEUQUY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 12:20:24 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50303C061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:20:24 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id l15so8621718lje.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KhSteGsD4RiqQuK5YmLBZC6UpLmDwoaKdLBagEsgYl4=;
        b=UUK/8ULWjMB2mBygCKclhU6LqqpSWv9z30+t+BDLxfb3VTXARp03TokADV8sjD+Rm3
         OFL0u+IlZG9t7sz8xdVVkBlMtP35b0P9vK22Ys0vOVkK66J0NVlx301AHSdzgwFINPFm
         A8cTPxfFHhEdOwPW+3RdCzCQfr98gE40Qk7QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KhSteGsD4RiqQuK5YmLBZC6UpLmDwoaKdLBagEsgYl4=;
        b=JOeHtphUtUR/yHhxZiNZ1nEeHf1Yk9fvAeIqJfm77S0yJgl6fbspQjeE0ye9tJQIH0
         ZpYInm2AVhNGwYmqG5XrUTLi4L7L0K0SVIu/iSlP2XcXUIeMbDJOLqyG3v/87B2JUKVa
         bggew1cnTe/5dYUNmKLt5sbFrvXlxmrWS8xGO7DOa6FCryaonjR7hls0lXbhNDLifcAs
         i2lBiU2DRsTfzH9jVkCjtKs7tr/3f4ldeiUv1M57WKewWfan0sLj/59kfdn6hoNR0kXv
         bgW852SZSdHA4nj/MRUGSlLcwcyQHmztZMRr4y1RgBl/4t9OxMszNt0YizLQyTo5zYTR
         VcSA==
X-Gm-Message-State: AOAM532nlx/a0di0YT2h8aMZAbWuM4BclD0zn26bBk4HItZuTSDSsWSv
        wMe08pbXrizoBWAq0KmzQjHi4JgNXPI=
X-Google-Smtp-Source: ABdhPJz8zJIgLdOemitc6DrBYhmusoNnroZFno/CYL3vRu5jZxkNH1jYu8UYxzRDn/pfVkiaFRaqXw==
X-Received: by 2002:a2e:8897:: with SMTP id k23mr5367769lji.184.1590078022291;
        Thu, 21 May 2020 09:20:22 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id g24sm2134018lfh.90.2020.05.21.09.20.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 09:20:21 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id v16so9000766ljc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 09:20:21 -0700 (PDT)
X-Received: by 2002:a2e:8018:: with SMTP id j24mr5189945ljg.99.1590078020706;
 Thu, 21 May 2020 09:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <1589946996-31264-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1589946996-31264-1-git-send-email-pillair@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 21 May 2020 09:19:43 -0700
X-Gmail-Original-Message-ID: <CAE=gft5pcHwK8yjObNSSH=U_B6Pz++bDaeUxZhPyJfG2E7LRAg@mail.gmail.com>
Message-ID: <CAE=gft5pcHwK8yjObNSSH=U_B6Pz++bDaeUxZhPyJfG2E7LRAg@mail.gmail.com>
Subject: Re: [PATCH v11] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 8:57 PM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on sc7180 soc.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
