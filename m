Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A04396986
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 00:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhEaWGi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 18:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbhEaWGh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 18:06:37 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111B0C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 15:04:56 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so12347987oto.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 15:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ue5n0UpI5EqeaS+j7+t9xnc2N6UugI+y/wlKjXvZ9B0=;
        b=tQae9Nr2rxLB0lFr7vREg1l/5tofxK6SHjrIwZUN/4EAM3zC3cbO2xQJg6KtQ24jz+
         fWfNXqs4Z5P5sqyBew2Owpq1QL/8P5fyONiJQ6ehvJCx2DyqEoFkvhpywx98FDB+jp7E
         gbBNnYT9EtrB6SJY7y6Sh0omYq/WNUxFEfEDtvxHaJHf6uW0MGQlvwnS3fCqbY7gZk/i
         dEz5f0BhlXez/vzQpG8TcYn12w83Ri8zq1LQK+8eI2qtBBC2CYQeast4ai3R2rEfciA4
         s2TPKzK+hpdi2YhOXRGMFwnAgMZNz27elJAQ3HjHokhBB3jg/uJklrjNbIH0uoKU6VrN
         +2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ue5n0UpI5EqeaS+j7+t9xnc2N6UugI+y/wlKjXvZ9B0=;
        b=m633T+XfRNNJi12bSvq5JHCj1KvThQbsVq2u8K+Eq0NSvZ2TMJ2dnsOMGcZL6jmr1r
         siBlvGzOB5rbZEKmsqQh7VpuA/1nNTgCU9DoB0MnPGVFQ6eo7ZkSXz+mGMsxLopeSXOO
         /KeATGdHpi0+WuzmxX+QrKQaxmoDXIVLEYXxs0lLaOgg7moavahWsL9+Yvk6re1tDERF
         ExNCKCer92XK1iIWGUGJ0xRrMLxFwMoci4a1Ii3U2wqkbw1ifXAa80tDQGAUfsixgI8A
         dFTQRcqTDJtF50ebxUcdiWLxuU4H4PSB2/p5miHBa2ANORp6eIIQSH2NuthbT6CN+lAE
         M7fg==
X-Gm-Message-State: AOAM531xh3pgE+j0MAtU5AC0WuGrdGoPS9EmzEbwYWDShBhsGTBLEd+8
        vD2oqCC13Yq88Rjfc2IzrHfWSQ==
X-Google-Smtp-Source: ABdhPJxcwoUVpexwvq3Wsn8EnHbKmjTIh8RHtDZQJb8ubOn5aemktzs2jcu5a9r02dk1rNsVjFPZrw==
X-Received: by 2002:a05:6830:2703:: with SMTP id j3mr7260923otu.140.1622498695281;
        Mon, 31 May 2021 15:04:55 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f80sm1999395otf.32.2021.05.31.15.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 15:04:54 -0700 (PDT)
Date:   Mon, 31 May 2021 17:04:53 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sibi Sankar <sibis@codeaurora.org>, robh+dt@kernel.org,
        sboyd@kernel.org, agross@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] reset: qcom: Add PDC Global reset signals for WPSS
Message-ID: <YLVdhU3Zz/TWtwCX@builder.lan>
References: <1619508824-14413-1-git-send-email-sibis@codeaurora.org>
 <1619508824-14413-5-git-send-email-sibis@codeaurora.org>
 <0c5f747fe0a3f757a4160e4fd28cc2b56a57a39d.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c5f747fe0a3f757a4160e4fd28cc2b56a57a39d.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 27 Apr 02:58 CDT 2021, Philipp Zabel wrote:

> Hi Sibi,
> 
> On Tue, 2021-04-27 at 13:03 +0530, Sibi Sankar wrote:
[..]
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> for the whole series to go through the qcom tree, or let me know if you
> want me to pick up patches 2-4 next round.
> 

Philipp, please do take patch 2-4 through your tree, that way we avoid
any potential conflicts in the driver - and things will come together
nicely for validation in linux-next anyways.

Regards,
Bjorn
