Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA911B5246
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 04:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgDWCGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 22:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgDWCGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 22:06:07 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF10C03C1AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 19:06:07 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id x18so4939843wrq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 19:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A/9Q0gDEQk7SNMN/b68r58ICpmz+7X03N2hr6NiaoH8=;
        b=os394JnEZiB7hZzjCkNFjqIx1gf9N5AYKFKocDI3OSFTkfodOiJXYFYsfKLKpmaf4S
         JY6Lput0qZK8yke6lcP8CulzTaxZ6njBHxf6bbfXmwGDVjtmkLy4kABeMzrcIwTlyJH6
         Vf5RRHfJb1/uBnLE/jbKajIikW3ncK70q+zpBO8nzVPZTu3aVc33D1CGr6A+rGcV4YG1
         z1T/Xo6jKmkhmmXhBmz6UDm2dQYOZtLwI6YgQCZQrZiZzbb+92Q/H1Zg1Z+nb1ntJFaE
         A7KwHZCRz8UWwc63yPK9Qh9kiA1fMIfPNCltQiCmzFWPq9PdYf1iCJe6otPkPNbnCkK5
         OCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A/9Q0gDEQk7SNMN/b68r58ICpmz+7X03N2hr6NiaoH8=;
        b=CDJrIy+Kytqn4kHK5fgOZaheu2VDAK7e7eB1M4AhTqvCI0K46TNTh2ZAWbQTkG9rcf
         XQql+zwJi9X9InZ3Ogk+ZYwtjMfI/NVnA2yHwP/C8jrHwS+UD9cLj3++8KOSQAcXezZe
         9sAfCVQyzb5MueQpM6YMH6FaQ7blXVyaHIaKPnL8ZcwTTziYTRWlE3LvykQ2qg7DhJ8w
         NR57y5NrEsfdcsO/fQt9AXe9LHqCm5ruKu23F12Baxzte/QOcIHKgCsgKe5KIiuYfp6s
         R80MJYznjA2Vw+skwO4W+ChWUJq/qTk79BobsyITZ3sKhca5tcaLF0+gk50+sJmzPc5K
         Bp5Q==
X-Gm-Message-State: AGi0PuaDEHmmh/P6xLjep73+y2alQe8PEBDxxBvawM+sL6tlyi+yAiaP
        GkjtOyXRBxbxJ8/9SF9EzSYENw==
X-Google-Smtp-Source: APiQypLAiRsG0qCINhLGe1EpQJ0HHWcgW2S1wxioVrDAsZWOl/hXi+QT6wmWP4U2nP4U4P4Nmx6KeQ==
X-Received: by 2002:a5d:690a:: with SMTP id t10mr2096175wru.225.1587607566043;
        Wed, 22 Apr 2020 19:06:06 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c10sm1340584wru.48.2020.04.22.19.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 19:06:05 -0700 (PDT)
Subject: Re: [PATCH 3/3] clk: qcom: gcc-msm8939: Make silicon specific updates
 for msm8939
To:     Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de
References: <20200419121808.440780-1-bryan.odonoghue@linaro.org>
 <20200419121808.440780-4-bryan.odonoghue@linaro.org>
 <158752417863.132238.13958544237045504884@swboyd.mtv.corp.google.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <11c762c5-0dea-2696-a063-335387e25d1f@nexus-software.ie>
Date:   Thu, 23 Apr 2020 03:06:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158752417863.132238.13958544237045504884@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for the review.

I think I've captured and implemented, all of what you said.

---
bod
