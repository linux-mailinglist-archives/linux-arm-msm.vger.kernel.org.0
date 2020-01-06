Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0250A131C1C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 00:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgAFXK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 18:10:26 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:33130 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbgAFXKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 18:10:25 -0500
Received: by mail-yb1-f194.google.com with SMTP id n66so22838632ybg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 15:10:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t+t1eROLK9g0HiqH07fHsSxCWd48TLqA6FF38j0G2gc=;
        b=NYI8h/BS+MhD6x3tHn4/6YN7Z3nzPzvfTvu4xy+B24ce661WHgOVocm23TwB5AoaCA
         dD3u+ZInCtSnbxV3lzgtPY5voGWOON7OKmommGaPHM39guacyHiJ04uxwIMQeKpJOcKy
         Ks5RfnAmT98E23KU4TVAxIF55MwnvEbB3V+BUbAPp43jk+wWNuqyV+hnawzDreAZqQL7
         crLvdfqFqzxR/O0SVlfiexX7bom+2SPID0flqszkokNvmgKQY/9QesLYUdSdy8ugr13p
         v/319ruvH0QjklSmvKVa//k56JSvJLgZhzuR4IkOzkN52bjMzmXtG7ly4iNoaprtK53I
         UGtA==
X-Gm-Message-State: APjAAAXF5UkNC6vA+qUMzN+/cpMF8DjVHzTIUkRv+miWpVzwPR5qbWJ3
        wTdb/5nRAUlkymze59WhJWOauJt+oA==
X-Google-Smtp-Source: APXvYqyU/F9oAmv44Z9JxxuhZMbpHBHObxI+XHyXXgm7h+9pgSNb+Qf9Eeqai2ZX4tMjxmHbJmM6Bw==
X-Received: by 2002:a25:cbce:: with SMTP id b197mr71450504ybg.2.1578352224261;
        Mon, 06 Jan 2020 15:10:24 -0800 (PST)
Received: from rob-hp-laptop ([2607:fb90:1cd7:d95f:3549:d84c:9720:edb4])
        by smtp.gmail.com with ESMTPSA id d13sm28151809ywj.91.2020.01.06.15.10.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 15:10:23 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2209ae
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 17:03:01 -0600
Date:   Mon, 6 Jan 2020 17:03:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, sivaa@codeaurora.org, manaf@codeaurora.org,
        Rajeshwari <rkambl@codeaurora.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: thermal: tsens: Add configuration in
 yaml
Message-ID: <20200106230301.GA12602@bogus>
References: <1578317369-16045-1-git-send-email-rkambl@codeaurora.org>
 <1578317369-16045-3-git-send-email-rkambl@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578317369-16045-3-git-send-email-rkambl@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  6 Jan 2020 18:59:29 +0530, Rajeshwari wrote:
> Added configuration in dt-bindings for SC7180.
> 
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
