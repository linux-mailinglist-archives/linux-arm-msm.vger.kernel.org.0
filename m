Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4171B30EE03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 09:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbhBDIGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 03:06:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:55952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233387AbhBDIGb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 03:06:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5146B64F4E;
        Thu,  4 Feb 2021 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612425951;
        bh=yeAE6tgm+U3ro6wyIgj9w7latW5kqYL9eDTxAwNkZLQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LXfJo5XfoeIgxIFCS3Ecgvz9cyM1fV1OL4BU4+/TfwQlnQ+54Df2cFSqRbqHaLiLZ
         kGLUnPJlNLhjRfxhbPeAse8e8wok4hKSalYV7Bv/Y63Whn0qoSXg1iq3chxd3ScZSw
         XrGf52XWaEwebup4v92aGZ7YXpyeI38Xs5ioVWRqtyGscmj0QWGfEgiElHIw44kHea
         I9UBMxSQ4xDuUqRhnaeKANWXVmqorApFhqhvi+wbOL2AMU5wmJ6/W74jVb7qNxRrA/
         mJeVpmmPZFAmnigM7kt6Q5aaBrugcsPQuL5jTozdrXMgbisY7HZFJJpDWL6Ar7gICh
         P3gJu9lGtoe3Q==
Date:   Thu, 4 Feb 2021 13:35:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] phy: qualcomm: usb28nm: Add MDM9607 init sequence
Message-ID: <20210204080547.GM3079@vkoul-mobl.Dlink>
References: <20210131013124.54484-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210131013124.54484-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31-01-21, 02:31, Konrad Dybcio wrote:
> This is required to bring up the PHY on MDM9607-based boards.

Applied, thanks

-- 
~Vinod
