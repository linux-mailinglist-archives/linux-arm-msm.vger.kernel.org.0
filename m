Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D03915B453
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 00:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729244AbgBLXDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 18:03:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:46802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728447AbgBLXDj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 18:03:39 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E3DE21569;
        Wed, 12 Feb 2020 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581548619;
        bh=fU30PkEF5AzebTofCICkBipjj6UxPaHZSLK931dkXp4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E83cguvoAQC5HFH0GrNnwtJUxEEOFnZ7gorksbX3QSdB/S1P8myeRnzTqSyM7quor
         ygBTInUWmYxUSatmw6no5B5HC/oZ84l/WoepqBi7Wb92GnlhxKuQLEYqXYzBLsFyS3
         TtqFSzDf9CCSoabSoU6ptcoTv3lNDP4HgjnL6H00=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581423236-21341-1-git-send-email-tdas@codeaurora.org>
References: <1581423236-21341-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/2] clk: qcom: videocc: Update the clock flag for video_cc_vcodec0_core_clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Doug Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, robh@kernel.org
Date:   Wed, 12 Feb 2020 15:03:38 -0800
Message-ID: <158154861845.184098.5172409402237427332@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-02-11 04:13:55)
> The clock disable signal for video_cc_vcodec0_core_clk is tied to
> vcodec0_gdsc which is supported in the HW control mode. Thus turning off
> the clock would be taken care automatically when the GDSC turns OFF by
> hardware and clock driver does not require to poll on the CLK_OFF bit.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-fixes
