Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACA218C47A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 02:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbgCTBEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 21:04:38 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:35752 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgCTBEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 21:04:38 -0400
Received: by mail-il1-f196.google.com with SMTP id o16so1522008ilm.2;
        Thu, 19 Mar 2020 18:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UGCAb9wVeglaPfbrAhPUQDDVEQ1klnV38624n1QkmF0=;
        b=aMLW+xSh5GQWE77JUbvhLyi4VGwx03gpx1tk2OnjrFoXyuTh48RZa544oIZAdTd8Yb
         vNDYEN9lseERtpJpYpZDxrNy7MfBwJel4QCtYeupXxxnb8zQ1kh3FP4nMpL0Y9zbiiCR
         FY2kSIkzBjc64lUjvofEOdrVBPes0W7p89tvfyAKRkD2s3fyxORxBmdWi6khPRoNP3M7
         uPQnRuFCy9n646t3iIEm5TGzY9BIwZNzlf+V8RkSQgcjyFXhmVeYWld2fPieAOtuHkQo
         4bbPAsfvKaRYAh/cTIM0Oh6LnJFdBf+WyuDCpzQPKDo8fH9NpwAkeFbV88HDZIpAr48o
         wD8w==
X-Gm-Message-State: ANhLgQ18i4FNm6Lfm60qNar3iN8TEUrkVqBSkQfWX5caYc38dqqeL4hw
        TQ2LF0kp7YDyYf3Q11NK/Q==
X-Google-Smtp-Source: ADFU+vvlv+TFuLos9es6ZMHJJts1Of92KuSp8Lj8FMdYp0zS7O9szteFdC1O/KDhibPp0NlG1HYhAQ==
X-Received: by 2002:a92:a192:: with SMTP id b18mr5903577ill.199.1584666277084;
        Thu, 19 Mar 2020 18:04:37 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id j18sm1497075ila.56.2020.03.19.18.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 18:04:36 -0700 (PDT)
Received: (nullmailer pid 23247 invoked by uid 1000);
        Fri, 20 Mar 2020 01:04:34 -0000
Date:   Thu, 19 Mar 2020 19:04:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
Message-ID: <20200320010434.GA23155@bogus>
References: <1584596131-22741-1-git-send-email-tdas@codeaurora.org>
 <1584596131-22741-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584596131-22741-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 19 Mar 2020 11:05:29 +0530, Taniya Das wrote:
> The Modem Subsystem clock provider have a bunch of generic properties
> that are needed in a device tree. Add a YAML schemas for those.
> 
> Add clock ids for GCC MSS and MSS clocks which are required to bring
> the modem out of reset.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,sc7180-mss.yaml | 62 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sc7180.h        |  7 ++-
>  include/dt-bindings/clock/qcom,mss-sc7180.h        | 12 +++++
>  3 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
