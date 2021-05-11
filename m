Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7336D379BB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 02:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhEKAlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 20:41:18 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:38818 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229876AbhEKAlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 20:41:17 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 10 May 2021 17:40:11 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg04-sd.qualcomm.com with ESMTP; 10 May 2021 17:40:11 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 3EDEE1F2FD; Mon, 10 May 2021 17:40:11 -0700 (PDT)
Date:   Mon, 10 May 2021 17:40:11 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: mfd: pm8008: Add bindings
Message-ID: <20210511004011.GA11282@codeaurora.org>
References: <cover.1620690653.git.gurus@codeaurora.org>
 <1b252357a72afea20e620e0268bcb6ff1e55e8d2.1620690653.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b252357a72afea20e620e0268bcb6ff1e55e8d2.1620690653.git.gurus@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 10, 2021 at 05:27:07PM -0700, Guru Das Srinagesh wrote:
> Add bindings for the Qualcomm Technologies, Inc. PM8008 MFD driver.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>

Forgot to add:

Reviewed-by: Rob Herring <robh@kernel.org>

I'll wait for comments on this patchset, and then collect this and push
it out in the next patchset.
