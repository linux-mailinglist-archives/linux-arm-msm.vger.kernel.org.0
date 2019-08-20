Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A4E95EEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 14:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730016AbfHTMg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 08:36:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:38722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730001AbfHTMg2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 08:36:28 -0400
Received: from localhost (unknown [106.201.62.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19F1122DBF;
        Tue, 20 Aug 2019 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566304587;
        bh=WmQfStitfJeHPNjk1mY+Ve8mqpOhYpGmA9+uZLT3ezI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xxE9vdUwgzHSAbV6jU0WpUvWnSpVBKgsFRJwLvJAe0Adep6OG99t7iTFrFOq5b1o4
         iAFb+UdV3eegG2WLcfyMV4Az4Mjt8DWYstVUVqxESTkBgCWWhJhLcTciPaXt7QziC2
         h133nD00jfDgyjI8j+C+TpnFp32CN1e+0BJW5CpM=
Date:   Tue, 20 Aug 2019 18:05:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: pm8150b: Add Base DTS file
Message-ID: <20190820123515.GB12733@vkoul-mobl.Dlink>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-4-vkoul@kernel.org>
 <20190820122701.GC31261@centauri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820122701.GC31261@centauri>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-08-19, 14:27, Niklas Cassel wrote:
> On Tue, Aug 20, 2019 at 12:12:11PM +0530, Vinod Koul wrote:
> > PMIC pm8150b is a slave pmic and this adds base DTS file for pm8150b
> > with pon, adc, and gpio nodes
> 
> All of your other commit messages refers to it as power-on
> instead of pon, be consistent.

I missed this one, will updated :)

-- 
~Vinod
