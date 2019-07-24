Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 906CB7401E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 22:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387765AbfGXUhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 16:37:40 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42051 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727624AbfGXUhj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 16:37:39 -0400
Received: by mail-io1-f65.google.com with SMTP id e20so62067789iob.9;
        Wed, 24 Jul 2019 13:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d4NY+Zoiq+xj4BLlyojFL41fph5cwqpn3LM6JI8x6A0=;
        b=kIAI2nru5rHtIBKOoUwz36Wk+tEKSwSVe9DMlLSMXwwZaGhOnYr0VWPI4U0HV8iLn9
         aFPzJ1lo4oFrDoxX3V9uN8D2eKQMXhrO1oTxeSgp7Y7ozYUDZd8NEOntZHu7tZaFuaNu
         aquZZuMTpytT86gGyfBqYwoP01/afCRYynpDkklt1odwbQEEvKFAe01ti1WTyjk6rDdM
         T9eombebpG3S1kifWIHRI9hMkH9J02bBIb0QMsF0HYIb5XkXuVsVFvp4rjePn7lYJIle
         K2gpG0xqW+I4I5KFfPp2dAu3IpJnKnsmFzhdgI2MZA7WQEftIn7rXvZLZ3sCaKjGiekt
         s/lQ==
X-Gm-Message-State: APjAAAWKbM0tX2vkswHdVA90VTrtX5XiZFa95Ko56RVnB5Llc6dFYijx
        LvZE2XvO/lkqIC8pCRtK1Q==
X-Google-Smtp-Source: APXvYqyhpV3f2IHu4wbrNhH0RD6PhImD4v+i3f6JW3doG56hhB/77vFnVZDx/SMcwhFIB1N+Acceew==
X-Received: by 2002:a02:ad15:: with SMTP id s21mr89937576jan.47.1564000658461;
        Wed, 24 Jul 2019 13:37:38 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id b8sm38662840ioj.16.2019.07.24.13.37.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 13:37:37 -0700 (PDT)
Date:   Wed, 24 Jul 2019 14:37:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc:     agross@kernel.org, david.brown@linaro.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, ohad@wizery.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH 06/12] dt-bindings: clock: qcom: Add reset for WCSSAON
Message-ID: <20190724203737.GA27783@bogus>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
 <1562859668-14209-7-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562859668-14209-7-git-send-email-gokulsri@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 11, 2019 at 09:11:02PM +0530, Gokul Sriram Palanisamy wrote:
> Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.
> 
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
