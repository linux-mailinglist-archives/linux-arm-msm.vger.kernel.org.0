Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B56131463F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 09:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgAWI4a convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 03:56:30 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36653 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgAWI4a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 03:56:30 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iuYHs-0002M0-HA; Thu, 23 Jan 2020 09:56:28 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iuYHr-0002Ta-HM; Thu, 23 Jan 2020 09:56:27 +0100
Message-ID: <c4ca5fb09bf1ce319381cc14000d303a2840ac09.camel@pengutronix.de>
Subject: Re: [PATCH v3 05/19] phy: qualcomm: usb: Add SuperSpeed PHY driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sriharsha Allenki's <sallenki@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Date:   Thu, 23 Jan 2020 09:56:27 +0100
In-Reply-To: <20200122185610.131930-6-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
         <20200122185610.131930-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Wed, 2020-01-22 at 18:55 +0000, Bryan O'Donoghue wrote:
> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> Controls Qualcomm's SS phy 1.0.0 implemented in the QCS404 and some
> other Qualcomm platforms.
> 
> Based on Sriharsha Allenki's <sallenki@codeaurora.org> original code.
> 
> [bod: Removed dependency on extcon.
>       Switched to gpio-usb-conn to handle VBUS On/Off
>       Switched to usb-role-switch to bind gpio-usb-conn to DWC3]
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Cc: Sriharsha Allenki's <sallenki@codeaurora.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
