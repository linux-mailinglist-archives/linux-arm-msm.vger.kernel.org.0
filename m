Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95D0794ACD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 18:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbfHSQtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 12:49:12 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45235 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbfHSQtM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 12:49:12 -0400
Received: by mail-pl1-f194.google.com with SMTP id y8so1222974plr.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2019 09:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JfNQ1P5D1q5FjOjoMZsxiAYKvHd+lD5nnopxEzzzvMc=;
        b=st33qIY1DLlZc5OvsEzD7D1yWQ6hmvX+dVih9ZV5bdrQXdJmL/lUIoWwzRIUHzf9v7
         gm9s3iQNDchMgOfFPmebeTLO/NRHeFwsXaaLO1Chj0qjhcxJrvcowr/Wx4jIrvVuWVcW
         ZYU/qrzgTGSERPHcs79EDmrXD2fBK1k8Snsudj3aaO/leTo2L09hqCYIqQ4+saj+8By2
         V5OGMPTdJhn+apEajZvjx+Oh2uU2OIOaQFZUjXSCiyMA0q9w/sxBhRlW9OIivxNGWWiW
         W5Ly/o55dTV6UBs86QCDaZxG7ZFQOapqS2HNC4DEz1pzI20uFnMj464hnN7iq3+kt6Vc
         KIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JfNQ1P5D1q5FjOjoMZsxiAYKvHd+lD5nnopxEzzzvMc=;
        b=OMj7hb7VFo5y6O2Mbp5yQcqSKUVcAXLP5QTMDx69rsctqZYRMN5dE3tsxcRTN3erJr
         X9axn2ZdAk5RbLUNfELZ0rw5z2U+4MV5m/cwyS5tsQp9uJYA3DbUSuXCc9zwjqziNeyb
         llaWwBYec4QOsLbKS3JNe9sn6eG8qIsbgYxgcfrPuVKAYRrKhQwwzMEk7HGepMChC5NR
         uVl/1ziwiBsS0yq2+wN7GxdTAfzfUi27XB87eizF08Srh+Nsm/Ol2fWbB7XOVsjEjp/p
         EKn9/QHxaE34uT5M40cXVK1edsRrb0yEqanykz0IUUC0qFpIYI42MbM+ykQgVtk695mk
         05ag==
X-Gm-Message-State: APjAAAVej1Tpoml7oKaxsIe/GaJJolKrVhx37b0eCe+rHS3tLjKcaSsy
        qHcoriAh0ofqUGpJHo1tcw2YMXYD5zs=
X-Google-Smtp-Source: APXvYqwsgMZ2k5xp/8T99zAMciVVeb0hTMubBeJKxyPqVgwJxwc1NAU5VwwX26QtDrUgiabgaf1rsA==
X-Received: by 2002:a17:902:8f81:: with SMTP id z1mr23101913plo.290.1566233351811;
        Mon, 19 Aug 2019 09:49:11 -0700 (PDT)
Received: from tuxbook-pro (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id i9sm15901499pgg.38.2019.08.19.09.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 09:49:11 -0700 (PDT)
Date:   Mon, 19 Aug 2019 09:50:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] drivers: qcom: Add BCM vote macro to header
Message-ID: <20190819165055.GZ26807@tuxbook-pro>
References: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565037226-1684-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 05 Aug 13:33 PDT 2019, Jordan Crouse wrote:

> The macro to generate a Bus Controller Manager (BCM) TCS command is used
> by the interconnect driver but might also be interesting to other
> drivers that need to construct TCS commands for sub processors so move
> it out of the sdm845 specific file and into the header.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

(Discussed with Georgi, he will pick the patch)

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
