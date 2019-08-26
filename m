Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA859D813
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 23:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbfHZVV4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 17:21:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:37352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725983AbfHZVV4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 17:21:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBFB121872;
        Mon, 26 Aug 2019 21:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566854515;
        bh=XTaZfdbIeZNcLvQ156JobevCYoXaSVCoyFHLqn3N04Y=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=uLlj7bJ2EEeCA2zsd7EHX48BNHSkUZaintIiCFHXWbChN0Fud941ukhJHERlcRaPc
         z79PSLxdlnADqJ3IOgCfmciJ6rESFheoMPjcYvqqI15aSx+cwG6J+1FtAegunbpuNH
         Q/B9FzOlzyJcmhdEHIXwBCxg1AIp5fgPbaTU8+QU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826174233.21213-1-vkoul@kernel.org>
References: <20190826174233.21213-1-vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: sdm845: Add parent clock for rpmhcc
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 26 Aug 2019 14:21:54 -0700
Message-Id: <20190826212155.CBFB121872@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-26 10:42:33)
> RPM clock controller has parent as xo, so specify that in DT node for
> rpmhcc
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

