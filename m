Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7CBA15B457
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 00:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgBLXDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 18:03:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:46944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728447AbgBLXDo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 18:03:44 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7AC042168B;
        Wed, 12 Feb 2020 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581548623;
        bh=jtcsh6nuPtS9l4I/p5Sx9pZFClK7PZ2JjApDIhkYods=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O0wDswvxpSY8488QVLUWaxZUTRzUfV+S2ZmCvDy92Pddx59gFQf9WoebxAjJ5vWNR
         FD9ZSoO+xlj/OEUv5RO91tZKjjxCI5aNbZnIpxtLiidGNHaYJgqe64dTSJUFOVS9P+
         Hgv9UTcMJpoABAynPDv/j2pZWIyWO62VLufIYBg4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581423236-21341-2-git-send-email-tdas@codeaurora.org>
References: <1581423236-21341-1-git-send-email-tdas@codeaurora.org> <1581423236-21341-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/2] clk: qcom: dispcc: Remove support of disp_cc_mdss_rscc_ahb_clk
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
Date:   Wed, 12 Feb 2020 15:03:42 -0800
Message-ID: <158154862279.184098.7085051280158509912@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-02-11 04:13:56)
> The disp_cc_mdss_rscc_ahb_clk is default enabled from hardware and thus
> does not require to be marked CRITICAL. This which would allow the RCG to
> be turned OFF when the display turns OFF and not blocking XO.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-fixes
