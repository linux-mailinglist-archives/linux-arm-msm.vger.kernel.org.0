Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1874A95F04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 14:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729881AbfHTMiv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 08:38:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729866AbfHTMiv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 08:38:51 -0400
Received: from localhost (unknown [106.201.62.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7AF222DA9;
        Tue, 20 Aug 2019 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566304730;
        bh=vC4loHo6lOb1kzGKpfghkDejDtiWPPUryr7Eit6ClsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X6Nb7QdOb07AlUzkLcL6E2b/WXBlkClInvcjlrVqJDlhw5aUhELWcx12taOvX09wz
         nhGkxh9C2nF8TbM0UKHWA10gHPD6ldSkDhjKOtHJB3qgsCLGjmUtQzMSRDIOMjT2eD
         AS59WG7h7bj4Ji3toRN5UzTnyzUXEHzZHDoNKBcM=
Date:   Tue, 20 Aug 2019 18:07:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm8150-mtp: Add regulators
Message-ID: <20190820123738.GD12733@vkoul-mobl.Dlink>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-7-vkoul@kernel.org>
 <20190820122604.GA31261@centauri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820122604.GA31261@centauri>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-08-19, 14:26, Niklas Cassel wrote:
> On Tue, Aug 20, 2019 at 12:12:14PM +0530, Vinod Koul wrote:
> > Add the regulators found in the mtp platform. This platform consists of
> > pmic PM8150, PM8150L and PM8009.
> 
> Is there a reason not to squash this this patch 5/8 ?

I typically like big chunks to split logically so that is the reason why
I still kept this off from base dts one

-- 
~Vinod
