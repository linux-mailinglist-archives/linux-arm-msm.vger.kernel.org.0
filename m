Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C000E4129AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 02:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237112AbhIUABw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 20:01:52 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:41583 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237413AbhITX7w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 19:59:52 -0400
Received: by mail-ot1-f42.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso18994126ota.8;
        Mon, 20 Sep 2021 16:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uy4hgs1+d2ltWODsOCKbozj99ZX1DKqGPaFTERAQCOU=;
        b=XzLskcVD0ollv7vi7T3zmMq3KO7PyH6eI2Zjq+ptNQ5e0p0TWi1dd9y3ARovSO0+4q
         QnCVICpSl1oAs0AsoJ0BsR8ePxGWPhXr4A5nRuMyP6ZoNpJ0ZknTWLpqOM6/i0FO69Za
         MGuZE5IT10n18ujWYBthRTRuY0nO+ncUgOTwaOk8+60VSzaMjAmOlZ9n5XEMv2H4oT8e
         c89JGhIDotKF/QUJwqdAVF6C3ymyblVTi1KfAhTvkTTa3OgG/c7yw9PQX+1US/yPOLtM
         KORLL2eDlb9kcnKeUGJy2FGtIDD7BJ8LtZu7Gkb62BFyv3xYGPwOzYzn5T3aluM458Id
         FR9w==
X-Gm-Message-State: AOAM5313JomNx3tnYBhuRjAbjpJs/DPO1iKVJLw+gC1r6N35Re9vfnWq
        +pNJBHcrRewKOY5ioyWIUQ==
X-Google-Smtp-Source: ABdhPJysRXAZ5BUmWtbCkrwb/+nD89/NUOJaSmZe0saDEAkv3iM/0ltG2c93yvvLsiG5SVlYi4qbCg==
X-Received: by 2002:a9d:3e5c:: with SMTP id h28mr23018302otg.36.1632182304316;
        Mon, 20 Sep 2021 16:58:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j17sm3810410ots.10.2021.09.20.16.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 16:58:23 -0700 (PDT)
Received: (nullmailer pid 1072678 invoked by uid 1000);
        Mon, 20 Sep 2021 23:58:22 -0000
Date:   Mon, 20 Sep 2021 18:58:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] dt-bindings: arm: qcom, add missing devices
Message-ID: <YUkgHv/HeyttXQzW@robh.at.kernel.org>
References: <20210908135409.5896-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908135409.5896-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 08 Sep 2021 15:54:09 +0200, David Heidelberg wrote:
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
