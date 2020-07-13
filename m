Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D745C21E374
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 01:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgGMXGL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 19:06:11 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33150 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgGMXGK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 19:06:10 -0400
Received: by mail-io1-f67.google.com with SMTP id d18so15374962ion.0;
        Mon, 13 Jul 2020 16:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XA4BB6FazEGBX1PaMryq6/o+Tzg4dFJ0aIRvH8y7LQw=;
        b=SFaBh/U59eYp/GflsGEy6WRf1pzaeDLN+FKuK90GMVU1JeV1oQ6pr+f0UdEKZNA9Xi
         kJT1vfOFMKQ1RTXnLvMpChhEVFafxQg5M2fiUcRe52OaHVKAgXYfDzgFvaHjH9VvCpht
         LvyRcPRLuZCaVcMZ8w1wNnPc0IxorWr/0AVfww8hmjYhGWfdkRw1++hIOR2oh7ukINnt
         fi0hK2kz9a0HpAzsj/Y4xav3Cyj8t7/k9/6prGry1t/MdD0ZCNEHTAXZJ/zBkr1ULHxS
         RxCpkpb/7rCLQI9kQoIRmjxzkUmaAEa8x7VTL4NJtsQqh9zRJZAf/Vyl2S4AGPkRtT/8
         Oh/w==
X-Gm-Message-State: AOAM532smzZK5ZkJq/inOwzzy2MKz2twL52xZOg+xuoyaHuO33JADhQB
        +DNpP4Bqoj0RF4Pmli5alDMMt9gw8Q==
X-Google-Smtp-Source: ABdhPJy0Eu8uS8XRgfOhXG3Xs4i0VS/SjjD9lFH6csH0UXcJR4J//DEYTVmu1BbLa7MVTota+1JNRQ==
X-Received: by 2002:a5e:9b08:: with SMTP id j8mr531727iok.116.1594681569149;
        Mon, 13 Jul 2020 16:06:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id x12sm9111916ile.14.2020.07.13.16.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 16:06:08 -0700 (PDT)
Received: (nullmailer pid 889798 invoked by uid 1000);
        Mon, 13 Jul 2020 23:06:07 -0000
Date:   Mon, 13 Jul 2020 17:06:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/14] dt-bindings: clock: combine qcom,sdm845-gpucc
 and qcom,sc7180-gpucc
Message-ID: <20200713230607.GA889744@bogus>
References: <20200709135251.643-1-jonathan@marek.ca>
 <20200709135251.643-7-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709135251.643-7-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 09 Jul 2020 09:52:37 -0400, Jonathan Marek wrote:
> These two bindings are almost identical, so combine them into one. This
> will make it easier to add the sm8150 and sm8250 gpucc bindings.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  ...qcom,sdm845-gpucc.yaml => qcom,gpucc.yaml} | 14 ++--
>  .../bindings/clock/qcom,sc7180-gpucc.yaml     | 74 -------------------
>  2 files changed, 9 insertions(+), 79 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{qcom,sdm845-gpucc.yaml => qcom,gpucc.yaml} (82%)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
