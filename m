Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24793269748
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 23:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgINVBs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 17:01:48 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42978 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgINVBq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 17:01:46 -0400
Received: by mail-io1-f67.google.com with SMTP id u6so1656495iow.9;
        Mon, 14 Sep 2020 14:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0yzmhFB8FW6nMWG0lfCfgWZCNL3FFz2PCbZSv4pGk4g=;
        b=aQ2gbW4zNxkib1xpQ+jfcAqEOeoq4fBMN1G4xZJYUc/nygk5Cs7bbm3QCvZ6h/LC+6
         aONDPvQnTGpinxwwn/T7ukWIoZwYL1QqYLh6QXgWldzSnE/Z3a2Aefd7Agpqi0DrpCne
         JEb+KIJRv/LkSJ/BdURAywrJstp2bAfRrUzBX/5A7GwvgOZzsIpe6MbKRPaTXx04sHqc
         9JGRCigt4n95399yGAZDrRWo3Fn2Oe8ZODBS9abTAtv+HxogYe5Gy5T3+ncUUKlSHmYU
         /XSHKkEPuhzqwVky0aNZSV9Muc4K9cbE3k1rT9k0Qp7XCfoWkcvY7xiPxbcMHofVcepf
         0fFA==
X-Gm-Message-State: AOAM532RMJVIkK/mVgluLINuyLZMZPoVUq+yDd1wwuwXoJQgOph6vfz0
        tuaPocrCHrzDjoAv49WlVR+764cEnzFZ
X-Google-Smtp-Source: ABdhPJx/SVVi33qWgcG0lkKvj1W4MyI6CDYwRWghIFPxrYwpOVjpFqKvO1N2LzwP6YSeHxkFhcoxyg==
X-Received: by 2002:a6b:6413:: with SMTP id t19mr12760136iog.193.1600117304892;
        Mon, 14 Sep 2020 14:01:44 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l2sm7451969ilk.19.2020.09.14.14.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 14:01:44 -0700 (PDT)
Received: (nullmailer pid 240941 invoked by uid 1000);
        Mon, 14 Sep 2020 21:01:41 -0000
Date:   Mon, 14 Sep 2020 15:01:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: combine qcom,sdm845-videocc
 and qcom,sc7180-videocc
Message-ID: <20200914210141.GA240886@bogus>
References: <20200904030958.13325-1-jonathan@marek.ca>
 <20200904030958.13325-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904030958.13325-2-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 03 Sep 2020 23:09:50 -0400, Jonathan Marek wrote:
> These two bindings are almost identical, so combine them into one. This
> will make it easier to add the sm8150 and sm8250 videocc bindings.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/clock/qcom,sc7180-videocc.yaml   | 65 -------------------
>  ...,sdm845-videocc.yaml => qcom,videocc.yaml} | 14 ++--
>  2 files changed, 9 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
>  rename Documentation/devicetree/bindings/clock/{qcom,sdm845-videocc.yaml => qcom,videocc.yaml} (76%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
