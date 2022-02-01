Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775534A564A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbiBAFUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbiBAFU0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:26 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA39BC06175A
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:23 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id m10so6178012oie.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7lkCF7nvOj49a/lCdhlQGJ+QKYPPJm2OvCtEHLIYfqI=;
        b=eJ1E72lC+dNjqmGiUAEAAhFBoky2fiR2tlC1PSb5UhdBrhOcoNI2JkYpp+Y+RKGL0J
         KXKuDXOWXBO0aSd18TjsGr1yKjslbp0viN+EvPa9GO+og1qsPNdz5utZ8DZXtwSO52si
         pJ8gXX4JGPfWv0elJyq4rJByTb7acMT7J6axMdl1tBCIBw5Ms03Y0iUqaEeBQnb+l82b
         XWK5ZAhkl+tk4dRXELFylLQrmLeYwoy+oVrg6Xx//wMmlK6GE+O59oMSvlaIk3FJcsY3
         XUhogHfjvuNcyx+LEdTsk+CTApWggKfVftujjoV18zkax8boO+jpzMmu33wZvjLxfURL
         siJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7lkCF7nvOj49a/lCdhlQGJ+QKYPPJm2OvCtEHLIYfqI=;
        b=W0o5SnADU5dRwuylE6xvfDH3EuG7kOPZHFNORyGlskXKBpAkB/YIUAHxAkkv708DOT
         Y2hOLll/rXHg4OQ3TkC8i3HwMQWWQ0wW1mQIEaepHvVVvwgNOJ+r+u/nCanojrkf3gEW
         XR2oQNFJnaHG3z+3TQl0GVgqKHAezRnkCN+s7PflSjzxpyCWul6b9szoCydr5TXgW7fY
         ORYbOY//sAWo+RQAM/aTIWhPFQfWY2nMsTIzKe+aDKimmPZwfg2xXw7ZKhJGgYh8H7Xg
         0+tzb2GCiPajKSF6YesTGDEMBVslugTUKPnZfLRDGTr8qi8KCTkqnUbKrxh/PNNfwQNa
         NyXw==
X-Gm-Message-State: AOAM532ViO7FrcTEtLuP2fDOv65Oiu8RqFvXrb7Qku42HBWf2QCh7vLe
        SBHdjrk9KdoB+oY97CXYZlH4dg==
X-Google-Smtp-Source: ABdhPJwRVZUNQOyyy3z+oj1plYoodyJ/NRJBL+wd9aLF4QTcD3iWmPCpxAdH2pLXZ3nsqyWt5l21xA==
X-Received: by 2002:aca:bd46:: with SMTP id n67mr211952oif.168.1643692823092;
        Mon, 31 Jan 2022 21:20:23 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:22 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: sdm845: rename memory@ nodes to more descriptive names
Date:   Mon, 31 Jan 2022 23:19:33 -0600
Message-Id: <164369277343.3095904.9103141354848241558.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211214234648.23369-1-david@ixit.cz>
References: <20211214234648.23369-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Dec 2021 00:46:47 +0100, David Heidelberg wrote:
> Pure effort to avoid `make dtbs_check` warnings about memory@ nodes, which
> should have property device_type set to memory.
> 
> Fixes warnings as:
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: memory@f5b00000: 'device_type' is a required property
>         From schema: dtschema/schemas/memory.yaml
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: sdm845: rename memory@ nodes to more descriptive names
      commit: 63a4021fef47d6075c23c35795591cb849aa3df2

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
