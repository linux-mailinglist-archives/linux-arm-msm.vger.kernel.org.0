Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B1C2FBE41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 18:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731704AbhASRsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 12:48:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:47228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727348AbhASPD5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 10:03:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 540DB207C4;
        Tue, 19 Jan 2021 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611068591;
        bh=ZuwZlFJK4U278mp5FI3ljl3nC4frqaKxZ5vc93cygFY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CfwsWW5RxOKlJ8oQRctrEaV1LkjL4ppM1tUZ0uCtjjinvE7pZWNJsIlu9yOl+LdOd
         HjWbL9279CrAOHrYSqfcHpM0pbkUm/3KLuCW2So4/qSdhcY1aAOuboQhnq2HcroJR4
         WrZFGtIm8DckkH7MbIQNHGQuWq7OKRBnEsDVLXbiOrY2DMMxb71bgIvbRWGDkGPTYt
         4E6WY4pnxBzBdK+1JjGp9AZkuXjFGhJoRnHQKnoUd4dnwJQF18kmpUbVLK2kAhwA7b
         pNlUEmHVnKMRwVyrASz1dwpg36HLnxUAsYF705hrC4aqP52ywfwLqzBKqeWm7HfVn8
         JLqu/Ybo9I8cw==
Date:   Tue, 19 Jan 2021 20:33:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] phy: qcom-qmp: Add SM8350 USB QMP PHYs
Message-ID: <20210119150305.GY2771@vkoul-mobl>
References: <20210115174723.7424-1-jackp@codeaurora.org>
 <20210115174723.7424-3-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115174723.7424-3-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-01-21, 09:47, Jack Pham wrote:
> Add support for the USB DP & UNI PHYs found on SM8350. These use
> version 5.0.0 of the QMP PHY IP and thus require new "V5"
> definitions of the register offset macros for the QSERDES RX
> and TX blocks. The QSERDES common and QPHY PCS blocks' register
> offsets are largely unchanged from V4 so some of the existing
> macros can be reused.

Applied, thanks

-- 
~Vinod
