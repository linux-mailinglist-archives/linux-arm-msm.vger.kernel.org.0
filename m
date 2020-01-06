Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7368E131651
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 17:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgAFQyc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 11:54:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:47230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgAFQyc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 11:54:32 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D662A20848;
        Mon,  6 Jan 2020 16:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578329672;
        bh=+GwqJBFRepVxID83AYSkAtYIDyth0Bn/PxTP6ZUQgBo=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=ZfKuxcuvE/qXDdBfOH9RA7Wbszru/wVojHayEf+M5hyrZ4lIYMgmYU/gPqQelJKMM
         LCixsKxUauJ+tvLgQJph0TXYMKNnOedQEuCeQ+7H7BLAWBBSScZmFPYv0EAu0GlEHT
         glUBEk2+UtWS/J7y3PGO3W4BZ3ugtrh3s7iYWU5I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1578305923-29125-2-git-send-email-tdas@codeaurora.org>
References: <1578305923-29125-1-git-send-email-tdas@codeaurora.org> <1578305923-29125-2-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: rpmh: skip undefined clocks when registering
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 06 Jan 2020 08:54:31 -0800
Message-Id: <20200106165431.D662A20848@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-01-06 02:18:42)
> When iterating over a platform's available clocks in clk_rpmh_probe(),
> check for undefined (null) entries in the clocks array.  Not all
> clock indexes necessarily have clocks defined.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next + added the fix for type declaration.

