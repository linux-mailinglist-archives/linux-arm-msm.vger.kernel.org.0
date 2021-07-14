Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6963C8A69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 20:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhGNSIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 14:08:20 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:34596 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhGNSIT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 14:08:19 -0400
Received: by mail-io1-f51.google.com with SMTP id g22so3255036iom.1;
        Wed, 14 Jul 2021 11:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZJw08Wf7dpNuzHchTtZrnHgcf2Je4v5y8fPtXSrfz48=;
        b=JtcfswjEgUBvqBaD0PWfoEev96Smf7R0jICM9vYfE4WFemsPSiRc7bcrorlWDwBaBA
         wzhioSIlfWzSIxAzzMGqf1jIoDkjIjkAYtbztMz8U0PzSf3zefQaCQ2z2xaz0MWcQhLR
         uSOm6Aec8ZC928JcQPX802KJ+vPgIiTtSlDsrCprcVgO0YZt3BVauHzx3dcUcbthdPYl
         UfED+z5HYAM0GqehMCsRFPOC/AwGY2r+erImDunUZtrvGuhS7EUJO8wNfoHQOzCmgdUT
         jsPUKiB5v3dvg1ik4p4hnyLmtJbfaEpiduSiHUm11RlikSrgPCR68if/FVwxjygnVOqB
         AYgA==
X-Gm-Message-State: AOAM532Narf38ar/gSXDg3QgzO7MthhbvRqfLeys/TIY0WK2IE9/uv3R
        iZXISye6hg0kSd5TVoWspg==
X-Google-Smtp-Source: ABdhPJyz3ZNoakBw7Sk2/8YBRzXt75Pux4uH8+qdBdwTfTIU/iIk7/hJP972DIrgP7SZ2GLqKMGM+w==
X-Received: by 2002:a05:6602:179e:: with SMTP id y30mr7804830iox.0.1626285925868;
        Wed, 14 Jul 2021 11:05:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h6sm1713159ilo.0.2021.07.14.11.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 11:05:24 -0700 (PDT)
Received: (nullmailer pid 2854593 invoked by uid 1000);
        Wed, 14 Jul 2021 18:05:21 -0000
Date:   Wed, 14 Jul 2021 12:05:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 4/5] dt-bindings: power: rpmpd: Add SM4250,SM6115 to
 rpmpd binding
Message-ID: <20210714180521.GA2854536@robh.at.kernel.org>
References: <20210622202156.546718-1-iskren.chernev@gmail.com>
 <20210622202156.546718-5-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622202156.546718-5-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 22 Jun 2021 23:21:55 +0300, Iskren Chernev wrote:
> Add compatible and constants for the power domains exposed by the RPM
> in the Qualcomm SM4250 and SM6115 platforms.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  2 ++
>  include/dt-bindings/power/qcom-rpmpd.h        | 20 +++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
