Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B32A12249F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 07:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfLQGYG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 01:24:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:44390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbfLQGYG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 01:24:06 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AD222072D;
        Tue, 17 Dec 2019 06:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576563845;
        bh=GcoRhSfliVRcOEGaWJoQebdPMIgQCT1Cy5VuGU0pP6w=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=txivlMJvUZiVRv/69N/iSuuZOqVu5BQQyHOEtGEkIAbkZtWRmZsDQaxJnPKwky83U
         NWy57Ms9MJqLMbnO6OUwecXOWy0FgVW2gO02KsgcPTR5uXWRWC/sefKtFmd26W9rBe
         3lX4n79gDcOootYFG1sTBlSX4y7wHURT4C2CiNA0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1575447687-9296-1-git-send-email-tdas@codeaurora.org>
References: <1575447687-9296-1-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 0/3] Add modem Clock controller (MSS CC) driver for SC7180
User-Agent: alot/0.8.1
Date:   Mon, 16 Dec 2019 22:24:04 -0800
Message-Id: <20191217062405.3AD222072D@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-12-04 00:21:24)
> Add driver support for Modem clock controller for SC7180 and also
> update device tree bindings for the various clocks supported in the
> clock controller.
>=20
>=20

Can you resend this? I got duplicate emails and I think it's resolved
now on your end.

