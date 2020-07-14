Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98EC621E58E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 04:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgGNCUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 22:20:16 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:40291 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGNCUP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 22:20:15 -0400
Received: by mail-il1-f193.google.com with SMTP id e18so12961752ilr.7;
        Mon, 13 Jul 2020 19:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r7PiSLbR0yDU/UxvKmyvxt7HuEegflfFTjLVeqeVxAY=;
        b=V2emm/nZW2hEiShLCeKiz0HuDgdHDvLjUkhsglWgNoN4RBDGp3tVakpdclKguhcuBz
         Qfe0s+4SR36oxF8LafdNl5P0Wmx9pCLLbOLYM9Gft+bCDEYCMxEscA+ysuhkedZts3R4
         ldL69P9Goelz6fsoPbWMM87nV80jSKBJ0Y14mnYaCGryRRFWAPvqEySNIax1g6o4xOvV
         0gzrr8kqMaYLQjBXIfX66aisp0veFGhywikEKcfQ7ViYy1oui97PsXMjJP5DIMKnjOg9
         1GNTXcT7NmiZU2ScCJhODxQpgNE5J20LMK7kiGCaJyo+4SvuAjt2aNCHcLB6J8IKpgZn
         tRCQ==
X-Gm-Message-State: AOAM532aZk2eEjM6hp/ejBF0S8QgZ4IIvIHFWF54TuFyrQOHow71XPjg
        Wr9k1x9BicBoii65AdGUmw==
X-Google-Smtp-Source: ABdhPJw0Lv4684sxepX0eSzs1TiV14fkOvxN0JoEUu2uXnLgoU1oCCukVCG6J6+DKCy8gIu8ICUirg==
X-Received: by 2002:a92:c689:: with SMTP id o9mr2763722ilg.302.1594693214175;
        Mon, 13 Jul 2020 19:20:14 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n1sm9276124ilo.68.2020.07.13.19.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 19:20:13 -0700 (PDT)
Received: (nullmailer pid 1147782 invoked by uid 1000);
        Tue, 14 Jul 2020 02:20:12 -0000
Date:   Mon, 13 Jul 2020 20:20:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     sivaprak@codeaurora.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH V2 6/6] dt-bindings: regulator: convert QCOM SMD-RPM
 regulator document to YAML schema
Message-ID: <20200714022012.GA1147729@bogus>
References: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
 <1592889472-6843-7-git-send-email-kathirav@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592889472-6843-7-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 Jun 2020 10:47:52 +0530, Kathiravan T wrote:
> Convert qcom,smd-rpm-regulator.txt document to YAML schema
> 
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
> ---
>  .../bindings/regulator/qcom,smd-rpm-regulator.txt  | 321 ---------------------
>  .../bindings/regulator/qcom,smd-rpm-regulator.yaml | 106 +++++++
>  2 files changed, 106 insertions(+), 321 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
