Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD441B003F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 05:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgDTDgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Apr 2020 23:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgDTDgL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Apr 2020 23:36:11 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FC9C061A10
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 20:36:11 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t4so3427817plq.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 20:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8H1NUjMwWNaYbzJpijo9kPT16a39a5axF1s4naNgu3E=;
        b=WZXgiclIG1eDxkvnwjc1k3Zzr4gy0TUdaDeugR4EpWuGKYW7hws4VBsItL6z0bnp6a
         I6PPu8wCTlM2BsSoikRX2Cu3/pSvwrcfQW00KgvxY74Khv0cUefGkIrIiwKzFIQjdOrm
         wYvqL/kfMEdDLcrjZ2wwbCa0Dl9I7KF+czR0MG72KNllSpMIIcIo2nNA8wayK0O72mYk
         l1sQLTkeNFC8W7tw+y43pe74eBy4Ocs229venEfem7hgcdpky1EMrWZLEosbrXTGEi9v
         jHrjnXZxG92Pmu1u5MiN+Uc1eLhZzqaNGiX+lVLoS1WjQU/flGs+TEQXx98+WtzAiT0h
         Bqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8H1NUjMwWNaYbzJpijo9kPT16a39a5axF1s4naNgu3E=;
        b=FZYGREsuyJk9V9X4IWb8HsoUR7Q3IGhPwCwQW0OSzgw8fDI4QCHHTwC9YBDPKUbK+N
         0mhZXh1xDrql1kOxX9cFR6TyUT9CMd+gmZdwYdLVSmUzQevX9VsPsHIkymiHuQgdfpUU
         /4FYykavM5YPhSIJZ5neTYpwZWcOF4nT77SCNTyw9Yhtqwa1QxN2EiHm6M8Ni7tzJ6N9
         JMAunFtzqJ2mygC62FXa1L0K7mZYv3ECrQ4oZsUNl7VGwmacuJJDwAKol2/gbXPYvi/P
         RBk38hVTw/nkd7GBJZf49/SWNWI1LAW5/pk5ObRkowWCv9yh7vkzhFvQI2F0lCQfdIhO
         XrVg==
X-Gm-Message-State: AGi0PubVpjAvQHbjWiDHuqxHzzkgk8TctARWfpqQR5dcymoRUvFgY71W
        kMoV2pr5qiFu8IGrenlLs+QzhQ==
X-Google-Smtp-Source: APiQypLPmtlVFRC4fQpc3g0/x5O4imtV2N6XeI7jX2JLMMsPbZFwZ7CxmsczZhYf1ismWHip0KZPZw==
X-Received: by 2002:a17:902:bc8c:: with SMTP id bb12mr14096905plb.13.1587353770635;
        Sun, 19 Apr 2020 20:36:10 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id c15sm24108426pgk.66.2020.04.19.20.36.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Apr 2020 20:36:09 -0700 (PDT)
Date:   Mon, 20 Apr 2020 09:06:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     sboyd@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v2 00/17] DVFS for IO devices on sdm845 and sc7180
Message-ID: <20200420033607.eci57emjzcz7jaq4@vireshk-i7>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-04-20, 19:34, Rajendra Nayak wrote:
> Changes in v2:
> 1. Added error handling for dev_pm_opp_set_clkname()
> and dev_pm_opp_of_add_table()
> 2. Used dev_pm_opp_put_clkname() in the cleanup path
> 3. Dropped the OPP patch pulled in by Viresh [1]

This is part of 5.7-rc2 now. Thanks.

-- 
viresh
