Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429F230ECF4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 08:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbhBDHHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 02:07:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:46814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233790AbhBDHHG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 02:07:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3815564DC3;
        Thu,  4 Feb 2021 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612422386;
        bh=dRzN1eritz4KejDq5y9CtyTsPixq4UxULm6ILZY6750=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DRkMuM6nAbD1KdJtNr2tyLGFz10R7J2AfWuX+1kDtqbZnI7UOb3UWGTCgDfn6bT9T
         6Tk6IVkjKa0grgzEhyoeTxYTGnoPbIc1k00rZR5lYlijsNn9xNus3s0etPvGXg2ctc
         BtvtnWpIU/C5usV7NezaTYYgPR6n4OMCcuDfRdWUed1ez3Kb/DboYIG3MNoyd565bD
         HNKoQBWs9KEDJdzAFCQKhO9zkCYU6FIbhQBYPMTRJhe3w3lQIPy/7V7OsNQKSmxn3p
         tplbimqqFeO5mPVXS4Cxfy8ezcooCpSdh2sHRJD+lcHc3COwSRo9heFBkamZJdVIGX
         j+FMcWearue1g==
Date:   Thu, 4 Feb 2021 12:36:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add SC8180X UFS to the
 QMP binding
Message-ID: <20210204070622.GB3079@vkoul-mobl.Dlink>
References: <20210120224531.1610709-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120224531.1610709-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-01-21, 14:45, Bjorn Andersson wrote:
> Add compatible for the SC8180x UFS PHY to the QMP binding.

Applied, thanks

-- 
~Vinod
