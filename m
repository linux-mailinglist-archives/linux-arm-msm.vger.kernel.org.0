Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00CA718DBF3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2020 00:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgCTX3A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 19:29:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:43148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgCTX3A (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 19:29:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AA312072D;
        Fri, 20 Mar 2020 23:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584746939;
        bh=Q2bwQlkqyaT2E2iVmmg8gOGkGtSH+0YxOH5rcRluyd0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lq7RXkTtjqQvenRKdJ/1dxkKetala7pdoA/f8IQ5Eh2dpHLGT9Y0xs+k4wQl/802x
         srUmpnf6qUuogjm5u18s1SdCtpSLeFrYE8RzXmPOHElZceG1u0F7/x6Iuz0Tm2Dpkj
         /Vc130nIgECgSkwywg5jJUxddspzer6VMxdlPyj8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200318131657.345-1-ansuelsmth@gmail.com>
References: <20200318131657.345-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v2] ipq806x: gcc: Added the enable regs and mask for PRNG
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kumar Gala <galak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>
Date:   Fri, 20 Mar 2020 16:28:58 -0700
Message-ID: <158474693886.125146.6980768465731450071@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Ansuel Smith (2020-03-18 06:16:56)
> From: Abhishek Sahu <absahu@codeaurora.org>
>=20
> Kernel got hanged while reading from /dev/hwrng at the
> time of PRNG clock enable
>=20
> Fixes: 24d8fba44af3 "clk: qcom: Add support for IPQ8064's global
> clock controller (GCC)"
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---

Applied to clk-next
