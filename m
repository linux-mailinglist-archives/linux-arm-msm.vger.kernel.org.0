Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603F742189B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236540AbhJDUqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:46:17 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:44608 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235191AbhJDUqQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:46:16 -0400
Received: from g550jk.localnet (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 480F5C8B1F;
        Mon,  4 Oct 2021 20:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633380266; bh=3VMYiR1dn3BZBP4RKhGOBGCPTh0nBVRUE16zp4E9HOo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=nSKtqRIbCKJxssqNyOCHdOWLUCOsBz5WhcbO1uz5AhkqsPipSBIqkaY76bfc0Hcml
         QijFbYRT21nVLZPJX9fbRAx9T91VEejCpuxMAn7M/i4lATDtPYAnDsjVTG5cGpdrxs
         tlajFVM9hkmMVtiWojQgeOmu1EvmeDBC6ShO5/JI=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] regulator: qcom-rpmh: Add PM6350 regulators
Date:   Mon, 04 Oct 2021 22:44:25 +0200
Message-ID: <4777503.XO8xY86g4A@g550jk>
In-Reply-To: <YVr1iymQo1hwQtW1@sirena.org.uk>
References: <20211003083141.613509-1-luca@z3ntu.xyz> <20211003083141.613509-4-luca@z3ntu.xyz> <YVr1iymQo1hwQtW1@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

On Montag, 4. Oktober 2021 14:37:31 CEST Mark Brown wrote:
> On Sun, Oct 03, 2021 at 10:31:26AM +0200, Luca Weiss wrote:
> > Add the configuration for pm6350 regulators. The supplies are not known
> > so use dummy ones for now.
> 
> If you don't know don't fix it into ABI, just don't specify anything
> until someone figures out something accurate to put in there.
> 

The RPMH_VREG macro expects _supply_name so what should I put there instead?

> > Additionally leave out configuration of smps3 - smps5 and ldo17 as these
> > are not configured in the downstream kernel.
> 
> Just describe everything that's there - nothing will get touched if the
> board doesn't explicitly enable doing so, otherwise everything is read
> only.

Problem is I do not know which types those regulators are, e.g. pldo or nldo. 
The ones I described are experimentally verified because the wrong configuration 
makes the driver probe fail.
So I can't really put anything there, unless there's another way to do this.

Regards
Luca


