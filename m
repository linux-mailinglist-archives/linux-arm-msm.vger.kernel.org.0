Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A0495761
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 08:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbfHTGiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 02:38:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:37470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728657AbfHTGiR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 02:38:17 -0400
Received: from localhost (unknown [106.201.62.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 902902082F;
        Tue, 20 Aug 2019 06:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566283096;
        bh=7q9OvmKTVE16A1f9USBI2Z4y48V2XyZPDX1+MlMRk6M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1uuGN0QXpbZuftFNkqSmlyRpy1QN4fDbb/tY8GuWZGItqV96iKiizxZss8B5HA+Vj
         h0rUePlL9Qhse0BI/rnhB6+QV0nfhZSL3w9ZVT6xqj21rnC4hAqTrkSmO4YzSlIhdz
         Lk3boualjQQi06Yk08e5cMYJgBc2fY+bSOKT5sQA=
Date:   Tue, 20 Aug 2019 12:07:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/22] arm64: dts: qcom: sm8150: Add APSS shared mailbox
Message-ID: <20190820063705.GP12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-23-vkoul@kernel.org>
 <20190814171743.C38C4206C1@mail.kernel.org>
 <20190819174107.GM12733@vkoul-mobl.Dlink>
 <179635ff3f55d5d121008d6193ea4120@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179635ff3f55d5d121008d6193ea4120@codeaurora.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-08-19, 11:50, Sibi Sankar wrote:
> Hey Vinod,
> 
> There seems to be a mismatch
> between the commit description
> and the dt node (This is the
> aoss qmp node not the APPS
> shared node).

Thanks for pointing, I have squashed this and other into single patch
and updated the description

> 
> 
> On 2019-08-19 23:11, Vinod Koul wrote:
> > On 14-08-19, 10:17, Stephen Boyd wrote:
> > > Quoting Vinod Koul (2019-08-14 05:50:12)
> > > > @@ -338,6 +339,16 @@
> > > >                         #interrupt-cells = <2>;
> > > >                 };
> > > >
> > > > +               aoss_qmp: qmp@c300000 {
> > > 
> > > Node name of 'clock-controller', or 'power-controller'?
> > 
> > The orignal entry for sdm845 has no such statement, but yes it doesn
> > makes sense. I am thinking power-controller.. Bjorn?
> 
> aoss_qmp registers both pd and
> clock providers.

Thats correct, I chatted with Bjorn and he recommended we use power-controller

-- 
~Vinod
