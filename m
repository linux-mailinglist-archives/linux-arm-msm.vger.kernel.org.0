Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765C94A565A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbiBAFUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbiBAFUf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:35 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B40C061759
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:32 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id m9so31142720oia.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YXCF17Q4B18FRMKASBAO0jdm9uEHBXBZnFCmMAjPImw=;
        b=ZMRCrzGNqoTGw3rS4Q4pjqzNuSGbgME24kh4va7T5AehZIOtV1+FJBmAIjNaihl9Me
         QYdirlsDeYYU8aLRf9fCHL3PyGG9vv6sfXsIL2/EpEF3SM8l2mVkl7cxw35eNojCRkgf
         SO5K3/qs9yQ0DTnAfVK1VyBv1NTj4FY/+zd4mxrXlNYygGjR+g7EN5UsmO7VAw/Yo0sk
         6NTsGbMW3/yYVm5fGAaEtbanhFUvRLLuf+WoKLIKmS38UDdcfmjWwTgxrEgvcX5v4wLt
         3WXxizn3BSsaMSKufRgUIVA+JXy0C4FAlHWX3nxqbTjDIoOLfp4p5yvLOQgK3hQGDgYo
         Y6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YXCF17Q4B18FRMKASBAO0jdm9uEHBXBZnFCmMAjPImw=;
        b=zuVKwca/82NrjBS8nmNjItvzOBK6ROnmpUk18AlZJwCrM88L8v44uIdFFAoo6oo7D5
         LNaLGIezYBQwiYrBdNfl0dOiME601A1jQTo5bgcMS3tSfFFU0taVCkvZxjmKRrh59ftT
         6wLw/As/TFiu4Z5FYNcZFg1IltCQzy/QaCoRCqOsf5EnM5j2GXwGjobT2ScmeFI43ros
         9qPaNrvaFBzq36YV9u6C+9/LmTz80TXAX9srNEMUkxTh4ImwR3hGQaUE83WUsqXhRUZe
         O5v54mNeZaYfNS4HFYmUkcnN29Z6s62SNJWzLiS1qHsi5o/OvcFDatfLFjmMbZr/clw4
         nzoA==
X-Gm-Message-State: AOAM533Oji318m566nf0kSzZ0xrmtqK6zLKMx/2pDo004i0sRvj2uxzv
        tIu4A5Hfmcl2fW3LNQXui6rKkw==
X-Google-Smtp-Source: ABdhPJz2ayn9g8vmF6Z31x69pJcy3R213lZBVrvfXZ7GGZ54ZcZYaQUj4rVrsihcUgzuuLpLvEcxdg==
X-Received: by 2002:a05:6808:1141:: with SMTP id u1mr219909oiu.161.1643692831391;
        Mon, 31 Jan 2022 21:20:31 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:30 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] ARM: dts: qcom: apq8060: correct mvs switch name
Date:   Mon, 31 Jan 2022 23:19:39 -0600
Message-Id: <164369277344.3095904.14857852358744642406.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220108170545.54127-1-david@ixit.cz>
References: <20220108170545.54127-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 8 Jan 2022 18:05:45 +0100, David Heidelberg wrote:
> mvs0 doesn't exist in documentation nor driver.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: apq8060: correct mvs switch name
      commit: 251632433637acd76bbcba954b07fc1c0522a7f0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
