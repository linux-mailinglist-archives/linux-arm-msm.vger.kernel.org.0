Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2A1B15B461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 00:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729190AbgBLXEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 18:04:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:47570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729225AbgBLXEY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 18:04:24 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A11A421569;
        Wed, 12 Feb 2020 23:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581548663;
        bh=Xas629nKaNkMP3pl8V+gk4ItifTZ2wQzypmjOE3x6L8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hkNI2pKREx/CYysSPb5bjgKG2Ak2OM8hBHJL20LOnxrAc9OvbLeS/vjcydln87LDg
         j6gfO38Zle+QRF6k0UJOcqw4NHvSGBkdZummwoYfn97YqhW68ee+sXluxuFm6FrV8v
         YUjl5RokYDo9ENZkKUbk7KkleZFvMRSkIUdFH7kc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581307266-26989-2-git-send-email-tdas@codeaurora.org>
References: <1581307266-26989-1-git-send-email-tdas@codeaurora.org> <1581307266-26989-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: gpucc: Add support for GX GDSC for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, robh@kernel.org
Date:   Wed, 12 Feb 2020 15:04:22 -0800
Message-ID: <158154866276.184098.1822839509277823452@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-02-09 20:01:06)
> Most of the time the CPU should not be touching the GX domain on the
> GPU except for a very special use case when the CPU needs to force the
> GX headswitch off. Add the GX domain for that use case.  As part of
> this add a dummy enable function for the GX gdsc to simulate success
> so that the pm_runtime reference counting is correct.  This matches
> what was done in sdm845 in commit 85a3d920d30a ("clk: qcom: Add a
> dummy enable function for GX gdsc").
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Applied to clk-next
