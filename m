Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAAA770846
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 20:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731353AbfGVSSh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 14:18:37 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35363 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731345AbfGVSSg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 14:18:36 -0400
Received: by mail-pf1-f195.google.com with SMTP id u14so17783029pfn.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:cc:from:user-agent:date;
        bh=bdmEyD1tHGaxY1ZlrNXktYNbDBoxT67t89iQedYViU4=;
        b=jD2XRByB77jpz8oESlV2M8e2YqHA5OWvaY91DBJGZvAV4PUjKf0YAHrFyemyl1HZci
         ZeR+SwU0zsOjunrxl82QuMicKE2IeCYMTuXzYubRB+ZpDsmnnH4cfbM9KX3lLytNKX5l
         HWxcBaH3SKmXPuHrKGHwHLia2CN/JsZteix6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
         :user-agent:date;
        bh=bdmEyD1tHGaxY1ZlrNXktYNbDBoxT67t89iQedYViU4=;
        b=QZs3iWNYKI9MwNHW1yDaapNTb5ngGzAy7VkWntUAcZoR6S2EyJLCTCXauXXDPrHEwO
         kukMg4Q5/EIomwqpufud+vlhaTS96IhriLyAM3GtnuWeqfl0ssNqyBQNuzGU8fTzvJbD
         8FNMM1PzBCzt3laXk2WuIDB6mFtBpkgRFt5931hWE42XCGsaFtpGi3RzZW0kLEX6KtUL
         OCPKd1E4iOZt5MJGjmIzoOfSBYM7pLNFxa3ZUVpfLLvTnGHeWR7lEAHh4Zqgk1/j9C1b
         WoBFQXUOhnTt24z3wtFqRW5+ZnbPtV/D+DnmyD5PgjZSM3Qz75sOPRD74INx4mHilnXq
         ZeLg==
X-Gm-Message-State: APjAAAUKUVQO3/a1aBwD7ATK2+X3WYVh0eqlIMJDMxjcCUD1ItN9Y86u
        HLBGmcu4CV+a8Hu9V2kGej/ORg==
X-Google-Smtp-Source: APXvYqw1WCTEtPf/4QpZct5Z+fOYeJwNzW8DbpFLtGpuiaWS9d42/M5FHd2yC7A0VCS35fsC46+fHQ==
X-Received: by 2002:aa7:9a8a:: with SMTP id w10mr1513108pfi.66.1563819516250;
        Mon, 22 Jul 2019 11:18:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j1sm66969694pgl.12.2019.07.22.11.18.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 11:18:35 -0700 (PDT)
Message-ID: <5d35fdfb.1c69fb81.5fafa.aaa9@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190722162003.GG25567@codeaurora.org>
References: <20190701152907.16407-1-ilina@codeaurora.org> <5d3209e7.1c69fb81.5ef1.5195@mx.google.com> <20190722162003.GG25567@codeaurora.org>
Subject: Re: [PATCH 1/2] drivers: qcom: rpmh-rsc: simplify TCS locking
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     andy.gross@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        rnayak@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        mkshah@codeaurora.org, "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Mon, 22 Jul 2019 11:18:34 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Lina Iyer (2019-07-22 09:20:03)
> On Fri, Jul 19 2019 at 12:20 -0600, Stephen Boyd wrote:
> >Quoting Lina Iyer (2019-07-01 08:29:06)
> >> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
> >>
> >> tcs->lock was introduced to serialize access with in TCS group. But
> >> even without tcs->lock, drv->lock is serving the same purpose. So
> >> use a single drv->lock.
> >
> >Isn't the downside now that we're going to be serializing access to the
> >different TCSes when two are being written in parallel or waited on? I
> >thought that was the whole point of splitting the lock into a TCS lock
> >and a general "driver" lock that protects the global driver state vs.
> >the specific TCS state.
> >
> Yes but we were holding the drv->lock as well as tcs->lock for the most
> critical of the path anyways (writing to TCS). The added complexity
> doesn't seem to help reduce the latency that it expected to reduce.

Ok. That sort of information should be in the commit text to explain why
it's not helping with reducing the latency or throughput of the API.

