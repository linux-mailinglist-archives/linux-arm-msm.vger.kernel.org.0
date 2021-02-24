Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B543244C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 20:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhBXTvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 14:51:20 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:41814 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231638AbhBXTvU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 14:51:20 -0500
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Feb 2021 11:50:30 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 24 Feb 2021 11:50:29 -0800
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 175571B19; Wed, 24 Feb 2021 11:50:29 -0800 (PST)
Date:   Wed, 24 Feb 2021 11:50:28 -0800
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Chanwoo Choi <cwchoi00@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Kavya Nunna <knunna@codeaurora.org>
Subject: Re: [RESEND PATCH v6 3/3] extcon: qcom-spmi: Add support for VBUS
 detection
Message-ID: <20210224195028.GA26658@codeaurora.org>
References: <cover.1611621365.git.gurus@codeaurora.org>
 <683693bdfaa14a72550f466da8b26a6126317c4d.1611621365.git.gurus@codeaurora.org>
 <7f45f184-1a8f-df08-5b45-0e88426c549d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f45f184-1a8f-df08-5b45-0e88426c549d@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Feb 20, 2021 at 03:34:52PM +0900, Chanwoo Choi wrote:
> Hi,
> 
> Please use get_maintainer.pl script when you send the patches.
> I didn't receive the patches.  I'll review.
> 
> Thanks,
> Chanwoo Choi

Thanks for reviewing and accepting the patches, Chanwoo. Sorry, I missed
out on using the get_maintainer.pl script - instead, I sent it to those
listed under "ARM/QUALCOMM SUPPORT" in the MAINTAINERS file as
drivers/extcon/extcon-qcom* is listed in that section.

Thank you.

Guru Das.
