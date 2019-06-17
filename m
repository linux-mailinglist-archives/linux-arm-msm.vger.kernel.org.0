Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE5854836E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 15:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbfFQNFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 09:05:24 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38963 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbfFQNFW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 09:05:22 -0400
Received: by mail-lf1-f67.google.com with SMTP id p24so6446172lfo.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0KqRJbvL3FPC7QkmhX15E3HE93ZyuGMTNLsfWYcNRE8=;
        b=WV+GlV5HNxaIHAV1oIVUE1rQ+G+s+nFY4sT8EVdoc1IkoiuJ+k++RBgFdahL/oDNki
         v/Bt/SbX1OApIu97wdFjEItw0Tz/KRf93273CWRPGtgp6PuPMNgd6Mh4FvapM7F9zQNB
         LL1MsPwmC9L7eWyYzyls2U3DY8hLpok9vCqqgYEr9Qo6rC7CcUIsYrghu/PzMaS/diZ/
         BKeTjxSUknSIyx+KCe5FUV06pdghE2W8sWBf5We5qunHSrYOls5DR6xTIeiZNEkjElnL
         tr1nSKm+FyOoHzbS8PB6j7JnbDrfGoaRA5HrpeTYHxFRwlGZIdkAy0GJTBkxyhSedPcj
         9zQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0KqRJbvL3FPC7QkmhX15E3HE93ZyuGMTNLsfWYcNRE8=;
        b=td9YFb0OhJv8LqpDmW3m8OVxzruBId2VNUCzL38yb7Z4wGyhb1las6H1m30a3xx5n2
         Wo/6SBy4pD72EmJuVf2+B5MK1bg415Og88WdXhf+z7k95Kob7AWTTLfC7MqYtJGSezyZ
         Trg3iGxsX3gNrN3ol/ppnE9S157p7xzEQPtNdQ1/73LgcGGa4jK0wfInUMgmJM3aCdm2
         Ga4UUJSmid1/piwVoIagAW+PjjuHcvyc6VKnkmEQ+tVeV3KZCIafCvCKuqzydzzhO26f
         JN7PFoxc2/YeLTa/PccwSq2A0tj0Vfq9LJ1f36kZWZ4XYwRe5c058Azmkw/tB9HfbtOC
         txEg==
X-Gm-Message-State: APjAAAV1PK2GchvdXfz3XPv/Hs0oVI1xjJSh82DNNF8sa9Qar8TH2sSP
        rKDBlLDOn2lW/I4X2RJCDf3Ml244RXDS9w==
X-Google-Smtp-Source: APXvYqxfwLwWY+tHIZf9ylLgsFN1BoBomQ/+nIZbYcnHTBSgZaXRncUdZAFu49eMc+VuGJ1OT1KJXw==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr35231104lfm.126.1560776720812;
        Mon, 17 Jun 2019 06:05:20 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id m28sm2113691ljb.68.2019.06.17.06.05.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 06:05:19 -0700 (PDT)
Date:   Mon, 17 Jun 2019 05:13:30 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, arm@kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Change QCOM repo location
Message-ID: <20190617121330.k5xzl44rwqlnvdis@localhost>
References: <1559936691-15759-1-git-send-email-agross@kernel.org>
 <20190607195216.GY22737@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607195216.GY22737@tuxbook-pro>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 07, 2019 at 12:52:16PM -0700, Bjorn Andersson wrote:
> On Fri 07 Jun 12:44 PDT 2019, Andy Gross wrote:
> 
> > This patch updates the Qualcomm SoC repo to a new location.
> > 
> > Signed-off-by: Andy Gross <agross@kernel.org>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Applied to fixes, thanks!


-Olof
