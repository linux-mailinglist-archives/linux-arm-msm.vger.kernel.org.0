Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E4C232278
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 18:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgG2QVz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 12:21:55 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:10985 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726341AbgG2QVy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 12:21:54 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Jul 2020 09:21:54 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg05-sd.qualcomm.com with ESMTP; 29 Jul 2020 09:21:54 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 1D3DE1947; Wed, 29 Jul 2020 09:21:54 -0700 (PDT)
Date:   Wed, 29 Jul 2020 09:21:54 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org,
        Veera Vegivada <vvegivad@codeaurora.org>
Subject: Re: [RESEND PATCH v1 2/2] thermal: qcom-spmi-temp-alarm: Don't
 suppress negative temp
Message-ID: <20200729162153.GB7773@codeaurora.org>
References: <f22bb151d836f924b09cf80ffd6e58eb286be5d6.1595612650.git.gurus@codeaurora.org>
 <6bb66f529eaab58b3a75eea3386233cbca27f818.1595612650.git.gurus@codeaurora.org>
 <159598495264.1360974.13987140780290180679@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159598495264.1360974.13987140780290180679@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 28, 2020 at 06:09:12PM -0700, Stephen Boyd wrote:
> Quoting Guru Das Srinagesh (2020-07-24 10:46:11)
> > From: Veera Vegivada <vvegivad@codeaurora.org>
> > 
> > Currently driver is suppressing the negative temperature
> > readings from the vadc. Consumers of the thermal zones need
> > to read the negative temperature too. Don't suppress the
> > readings.
> > 
> > Signed-off-by: Veera Vegivada <vvegivad@codeaurora.org>
> > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > ---
> 
> Probably needs a fixes tag. And why not make it first in the series?

Will add one and move this to first in the series.

> 
> >  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
