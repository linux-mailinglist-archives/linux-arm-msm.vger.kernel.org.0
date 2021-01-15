Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8232F7A5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 13:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388029AbhAOMsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 07:48:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:52366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732588AbhAOMsW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 07:48:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C099208BA;
        Fri, 15 Jan 2021 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610714861;
        bh=eTI7ILWKYaLFNuONtwhCzjcLb2VJvQujfi2l3S4BFVc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PVHT669oWu/cn7kUmawuwpOg2yDBO6GOp55yt8PnHkDn8A33PkunAxX07qGsn3Mpx
         KJnz2h2ecFIjDNxgB4vc+QGNeu1h+PqY0QwgWGzduxkjMygrjq+Pr0tpwWPc+9qwCa
         7EbDnvfE60myfDJ9vLv4KpM2mpMmuLAsffpjkJA0bKQ/1Q3z20CN0MORzL3kVJvOGg
         pOxI9S+PeCtCoxJxxQL1RF9eRgEJH9EwxI5XE6WgnZ4bvY7URfqX1I4yRJhreELtZ2
         HuFUFyU0bSQqNIEa3IAwAKMB+TVL6SMnAcrI1TYxZNoIOpYH/fXeaVLM6lFngr1vd/
         +5BGdsfhxDWaw==
Date:   Fri, 15 Jan 2021 18:17:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Jack Pham <jackp@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] phy: qcom-qmp: Add SM8350 USB QMP PHYs
Message-ID: <20210115124736.GF2771@vkoul-mobl>
References: <20210115104047.3460-1-jackp@codeaurora.org>
 <20210115104047.3460-2-jackp@codeaurora.org>
 <2c5481fe-f5be-5d6a-f62f-c93d04b9210e@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c5481fe-f5be-5d6a-f62f-c93d04b9210e@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-01-21, 12:54, Konrad Dybcio wrote:
> Hi,
> 
> 
> I might be wrong but it looks as if you forgot to add a compatible for the "sm8350_usb3_uniphy_cfg" configuration.

It seems to be documented in patch 2, ideally we should have the
bindings patches first and this as patch 3...

> 
> 
> Konrad

-- 
~Vinod
