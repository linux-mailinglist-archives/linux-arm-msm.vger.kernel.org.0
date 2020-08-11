Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7579124221E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 23:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgHKVt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 17:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgHKVt2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 17:49:28 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB03C061788
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:49:27 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id p1so165866pls.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=yRAye5F5l9hzR1g1P5dMPEhRVrsrXgvMRbsuClxK5F0=;
        b=aYAxKLO+2Nd++44vwrkooer5fORLLDqSDvBErgWq068zdHXMHzeisim1L/+G9ic6O5
         dNzUAomGUNjaDzTQy5YM3DWEsiWl1xsCLkIW3tZMbZhttwSRn1mAIPXFPe1gGxQo2tEO
         RDTUNDgaF1QpU9Qqd9uSYzY1wz1F8JzoAOtdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=yRAye5F5l9hzR1g1P5dMPEhRVrsrXgvMRbsuClxK5F0=;
        b=Y0Y6lXtciQF7gUBn09B7av6JxkDBx1Xpc/IUsnuRGcgu8YnY30noY1JU+7oZSiJTyo
         vNmm8EQfs928g/xHuo4on8gQKogmPDQxgXuPMxJaSv1gBGNFY8pg6vIgdmuYmC39aXhK
         BieJ84vKKJuOZJSa7sddrEKzUCjAvN8yUR3iL5b4cRC3Nrgo/pARu8adnO+iRyCm1lo8
         3k7uwblZy66/77i0kHgkp3kg29m9IjVsgrsDlCHDBFcqCbpRPa2eQIkHXGhd9bB/ccK/
         jfqS9yUEDRMZ3WsQZyQO4SLQY0xeY+H8gAX9oe0mDR6KDcT/91W/3wyr+freMlQGOB1a
         pIAg==
X-Gm-Message-State: AOAM531aWg5h7oFMe8LdnWEEjLjAPqjcx7vhmGPwx1VrTRVox+OyWMLN
        mFtXh97coWZdxlUKZ9e5z3VCPg==
X-Google-Smtp-Source: ABdhPJxTaonzDdTXCXuqxdmP93HMUeWwx6e1dOqgdNNGwjyPenieCTBR8G9AO04BsWwnHSnOkJcplg==
X-Received: by 2002:a17:902:900a:: with SMTP id a10mr2552967plp.203.1597182567153;
        Tue, 11 Aug 2020 14:49:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id l19sm59212pff.8.2020.08.11.14.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 14:49:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200730095350.13925-3-stanimir.varbanov@linaro.org>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org> <20200730095350.13925-3-stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v5 2/3] venus: Add a debugfs file for SSR trigger
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jim.cromie@gmail.com, Joe Perches <joe@perches.com>,
        Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Date:   Tue, 11 Aug 2020 14:49:25 -0700
Message-ID: <159718256557.1360974.458611240360821676@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stanimir Varbanov (2020-07-30 02:53:49)
> The SSR (SubSystem Restart) is used to simulate an error on FW
> side of Venus. We support following type of triggers - fatal error,
> div by zero and watchdog IRQ.

Can this use the fault injection framework instead of custom debugfs?
See Documentation/fault-injection/.
