Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4801894BE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 19:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbfHSRm0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 13:42:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728067AbfHSRm0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 13:42:26 -0400
Received: from localhost (unknown [122.182.221.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 943E322CEC;
        Mon, 19 Aug 2019 17:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566236545;
        bh=PgNggzRFbOui/+mAbKZ2WXvnDH61i+Qqyav4WBiyFsc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XoUxKczOtsPEJoKk9Y/AP/4jSSBeNJx7GQ4h2YbiTAxzW20mgJuSUX67m7QNLT9ns
         0LeupSp490tBPjtib22ooFGovbEwnMQ+9tFGH4bXg154yCwjC5PAtG59wj6xpwseKE
         SOXLcfe6ViA5f1rjpCMAViKB+fPMhL2CcbrtvZTU=
Date:   Mon, 19 Aug 2019 23:11:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/22] arm64: dts: qcom: sm8150: Add APSS shared mailbox
Message-ID: <20190819174107.GM12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-23-vkoul@kernel.org>
 <20190814171743.C38C4206C1@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814171743.C38C4206C1@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-08-19, 10:17, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:50:12)
> > @@ -338,6 +339,16 @@
> >                         #interrupt-cells = <2>;
> >                 };
> >  
> > +               aoss_qmp: qmp@c300000 {
> 
> Node name of 'clock-controller', or 'power-controller'?

The orignal entry for sdm845 has no such statement, but yes it doesn
makes sense. I am thinking power-controller.. Bjorn?

-- 
~Vinod
