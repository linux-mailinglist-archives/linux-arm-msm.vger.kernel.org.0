Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC971D733E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 10:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgERIqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 04:46:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:48352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbgERIqs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 04:46:48 -0400
Received: from localhost (unknown [171.76.87.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0AEC20787;
        Mon, 18 May 2020 08:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589791608;
        bh=l41k8WOcSAevgUEovK3C8Xo8J7ox25uuSDhcFkvYpME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kCMS6DwyvYiVn3BYBDobSkQ6vUV+f3uqfoIWHATqXG/4v+T3yG793kDq1wE0gym+y
         UgEUzF69Aey/VAHOD4rtW/Jc03pUSdMHzB3ihyFYGqCw433kLDYusnJYfPvYMuNAc6
         htZfQaeanyYlle3yRa61rmTkYGEnGagllo055HHs=
Date:   Mon, 18 May 2020 14:16:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: apq8016-sbc-d3: Add Qualcomm
 APQ8016 SBC + D3Camera mezzanine
Message-ID: <20200518084637.GE374218@vkoul-mobl.Dlink>
References: <20200518082129.2103683-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518082129.2103683-1-robert.foss@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-05-20, 10:21, Robert Foss wrote:
> Add device treee support for the Qualcomm APQ8016 SBC, otherwise known as
> the Dragonboard 410c with the D3Camera mezzanine expansion board.
> 
> The D3Camera mezzanine ships in a kit with a OmniVision 5640 sensor module,
> which is what this DT targets.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
