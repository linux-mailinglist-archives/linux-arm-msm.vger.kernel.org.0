Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC513FC3B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 10:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239868AbhHaH2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 03:28:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:45772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239803AbhHaH2g (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 03:28:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E62A60F91;
        Tue, 31 Aug 2021 07:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630394861;
        bh=2jFXB3Bpi9DMpJzAS9gHCIF59taf2TIpECcJMAv2WQc=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=vJ4ssin43oUf8vOcfQVLKGgPpDqbr6h9VlQGPyRf4r+EmZeQoSVi5CX9/nqv++x2e
         bp5ATBt87ZGJljznO1gXx+QvhxvgHPsSLT7Kvo3kyD8VS8kDHTZghEHcxk+9TJ3+Os
         hHTH+GyUpE8hJqwH6LItYvRZes2lqi2wD1QKPowUtQ2PQOqJ2Lsh31Wc27qs/vt+sP
         5NduD9HxVydVIjnnt9hCxxtpyRSy8GioavaY8LlHZmp7YicfQrhvfVsMuBdxUrBcPn
         R6VVdD5MExrjTYgZEvm1mVmlWP2nKBpa+5Fif8GeW/KKZUltm1CBaH0tU5slfYM0s+
         xK0tnRg5T9MfQ==
References: <f5ea5bc3664a98a684ad4b699a1ac610e847176f.1630389452.git.baruch@tkos.co.il>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Robert Marko <robert.marko@sartura.hr>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3: add reference clock period
Date:   Tue, 31 Aug 2021 10:27:20 +0300
In-reply-to: <f5ea5bc3664a98a684ad4b699a1ac610e847176f.1630389452.git.baruch@tkos.co.il>
Message-ID: <87mtoycbvb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Baruch Siach <baruch@tkos.co.il> writes:

> Document the snps,ref-clock-period-ns property that describes reference
> clock period when it deviates from the default set value.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
