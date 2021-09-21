Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BBD413B50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 22:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhIUU2F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 16:28:05 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51]:42561 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhIUU2E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 16:28:04 -0400
Received: by mail-oo1-f51.google.com with SMTP id u15-20020a4a970f000000b0029aed4b0e4eso83006ooi.9;
        Tue, 21 Sep 2021 13:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uDz+KDbYwF7UYPZbP8nvXmW8eKPY7KenOS75cQR7lTg=;
        b=6lX1u1F2PAU2D9a7Mtcs4Wj6Zm1lr/Gzc84QiJvNaWbUnz2tiecXzjgAdAJZsk3kO/
         gGTNbVtpJv27VsMUhmqdupIuH41B3sXMevm3mfRS0dL14cqZt0LEVE7IKYMTj04syPAT
         L8U4H+8jh1GDnB/VjAxjlwOud5qT0ByeKzqHUqqiasBH7o1ibc7bCERbiu+6dDU0gXGZ
         Qq5LzxWzsbBUjQAH/r+ZpK7XFW2KNE6EiAwP/xWuqNMo8n4CzjihEkOyTEXimHaKeYL5
         VE98pdP4V7hy+NgU087ovvIiCWtB23GR5P2Re5KyzvM1v5na0TGVnjPwbTdqiHzVBVo9
         uyXg==
X-Gm-Message-State: AOAM531+sgHvFf3Wm/+vL92d0ZZR+x10HSKU0bxcULx9qj8kLutS8B6s
        De5vi/fV8SRa0szxOhF1XQ==
X-Google-Smtp-Source: ABdhPJyP8Xd3K6rlhM38EQqkpgd9PYDR+BKgU2IeHuFhhqZ6uPRDWq+2PKccDBSFDvNhwXB/VtHcKw==
X-Received: by 2002:a4a:4b42:: with SMTP id q63mr26581943ooa.78.1632255995746;
        Tue, 21 Sep 2021 13:26:35 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id p21sm10942oip.28.2021.09.21.13.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:26:35 -0700 (PDT)
Received: (nullmailer pid 3272449 invoked by uid 1000);
        Tue, 21 Sep 2021 20:26:33 -0000
Date:   Tue, 21 Sep 2021 15:26:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jassi Brar <jassisinghbrar@gmail.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] dt-bindings: mailbox: Update maintainer email for qcom
 apcs-kpss
Message-ID: <YUo/+dcKijieGnKc@robh.at.kernel.org>
References: <20210914080433.13499-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914080433.13499-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Sep 2021 16:04:33 +0800, Shawn Guo wrote:
> Sivaprakash's codeaurora.org email address bounces.  Before he comes
> back with his new email, fill Jassi's address in there.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
