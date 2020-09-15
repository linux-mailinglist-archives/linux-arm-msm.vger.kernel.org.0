Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEF2269F7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgIOHRK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:17:10 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.100]:15750 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgIOHRJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600154226;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8X8i+FQh94kooKCkw5F3yxacM9ZTjmk8KlhqsbxP1S4=;
        b=UMnAUuuNPD//LbLIIOogemsOw60iDhdmq/tXwXDTltNElmwJEgCNgv+Cg54yNf49pi
        JTCOT3n8/bDbScSY0JweJjYZtVQ3xzoMpZo2kuGKFnrgVwJg3dglaUtbWL7qP7PLpYrs
        gzKDog1nM6rKIxGkoUnA1rtgO78dnU4dP5CfaT8BslRtCvlNtJogHxi6lwWJrFtUCsGu
        2kpPp6XGtYdkpCdWMxh1IG4HJ/CyicpTMVCgOb8hcvPciRl5pRUPcKWzPAF3UsYu3LEU
        6r8iUOVYx0AxstDb4CYpHJ1jpCaPiKV2IwA1GASFlMYZ6UwktqLhWX2DRKFEkvQG/otC
        HgkQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IcfFBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7H4rfP
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:17:04 +0200 (CEST)
Date:   Tue, 15 Sep 2020 09:16:59 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 00/10] Convert MSM8916 boards to use labels, reduce
 duplication
Message-ID: <20200915071659.GA73201@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
 <20200914094341.GA1246@gerhold.net>
 <20200915045605.GC670377@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915045605.GC670377@yoga>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 14, 2020 at 11:56:05PM -0500, Bjorn Andersson wrote:
> On Mon 14 Sep 04:43 CDT 2020, Stephan Gerhold wrote:
> > 
> > It's been two months since I sent this series - are there any changes
> > I should make? Maybe you just overlooked it :)
> > 
> 
> It seems to have been overlooked as we approached the v5.9 merge window.
> I don't have any complaints and have merge the series now.
> 

Great, I used the chance and sent out the next series :)

Thank you!
Stephan
