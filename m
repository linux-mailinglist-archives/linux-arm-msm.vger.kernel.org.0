Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A124230ECF7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 08:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233967AbhBDHH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 02:07:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:46872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231791AbhBDHHS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 02:07:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD14964DB2;
        Thu,  4 Feb 2021 07:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612422397;
        bh=5QRDZaxvUgmz/x8TzBWV4NHtMbDqLZgpxPyiZm7qrSk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ck4N8q0c+Of6x8T1Y8hujBVe5Rx6hl5QQMEQ36fgCEAEjO6AGANgqjzRr/A4xQsU5
         gIPAfygokvrSYXHlZwWeyP+KkRak6ILKqFei1XYdveHcbWBvFdV2jEZmLPUGsAzQES
         YScjlEuxzvtTWCnrxk7Ptd59mok3w15nDS2HTikS5lAMGAUQmOCX7GlUgBTiG28Irg
         WsRohlnoJyZCaDuYA4/3OHNKnVNTAAPPOP1wj/9lVfs/a9djXAx5OT1o7+iD56r5Ip
         cbMqIw7KeZDgs9IsNEA8A7pVu6bzqDqu03Aa5jUjFXJHgXHMS4hdVMojWzhllDJTk5
         M4nxl8KBMPGOQ==
Date:   Thu, 4 Feb 2021 12:36:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add SC8180X USB phy
Message-ID: <20210204070633.GC3079@vkoul-mobl.Dlink>
References: <20210121014339.1612525-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121014339.1612525-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-01-21, 17:43, Bjorn Andersson wrote:
> Add compatibles for the Qualcomm QMP PHY binding for the SuperSpeed USB
> phys found in the SC8180x platform.

Applied, thanks

-- 
~Vinod
