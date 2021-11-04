Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E62445022
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 09:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbhKDIZv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 04:25:51 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:27918 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhKDIZu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 04:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636014189;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=kKp46asF2wvqQnE/1NxxhnpyQPVN1u07p4ONMzC84Bc=;
    b=Rp+InxvHvMTKiK4+YdGcjLXQkcCIHBhpUcD6DrQBK58OVo02QSvXSJBnTjGNJ9kuIE
    /UJR+JvREEev4/YINk3OGCHjgagf0ftu44PkoE2VzVnMwBjii0XIpB54oZj+JF6VrWOt
    CIFzWRynWWjSoq65egETSendpdSE745wRbt1Z4I3UqVHQo3ct7ZSiz2h/x+BCutVvT3Q
    PppeoSH9m3wNBWc6z1HJJFBzhhbza52oPaIg/d1PWiZgyRjs6LjDmzhIrGSUmOXNRAgA
    LAl9MnRDD0wh1MD/EyKp1bIotlbssBVMdbZ+Wr1LVdsRDIP7pT67mLvXbxWR7O1QN2Gw
    27dA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrKY7lg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.34.1 AUTH)
    with ESMTPSA id Q0a97bxA48N85au
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 4 Nov 2021 09:23:08 +0100 (CET)
Date:   Thu, 4 Nov 2021 09:23:03 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom_spmi: do no register unused regulators
Message-ID: <YYOYZ1cEFFJhX2ae@gerhold.net>
References: <20211104004351.2206578-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104004351.2206578-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 04, 2021 at 03:43:51AM +0300, Dmitry Baryshkov wrote:
> Typically SPMI interface to PMIC regulators on Qualcomm platforms is
> used to supplement RPM interface in cases where direct control is
> required (e.g. for the APCC or GFX regulators). Registering all possible
> regulators is thus not required and may be potentially harmfull if
> somebody tries to setup those directly. Thus register only regulators
> that are really used in the device tree and ignore all unused
> regulators.
> 

Shouldn't the missing regulator constraints already take care of that?
If you don't setup any voltage etc in the device tree it should
effectively make the regulator read-only.

This is useful sometimes, I have used this for debugging before because
it lets you check the actual voltage applied by RPM (at least on MSM8916).
The voltage that Linux believes to have set through the RPM driver is
not necessarily the same that is really set at the end.

Thanks,
Stephan
