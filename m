Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE8517E9B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 21:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgCIUGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 16:06:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgCIUGv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 16:06:51 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D8212146E;
        Mon,  9 Mar 2020 20:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583784410;
        bh=TtY/TzxXe9VUGL0dFhUNty6r3pCTyvmlQu43LqHbV8s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XuU8vZS1eoBs94QCog8DFwk/tbF1cVKrkizyMEH9avorwasTxvvhe3aZvQO3dumMz
         VfIPtzwP+/ZykXAe0qk2rPgbyqUBCmbOqqZjVGsejUwTxSV8c7CTawm5oVKZGDapkv
         OBdZuOEs1EES32M+vrHKfjEW9IG/Po2AB7iA4uFA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582540703-6328-1-git-send-email-tdas@codeaurora.org>
References: <1582540703-6328-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v5 0/5] Add modem Clock controller (MSS CC) driver for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Mon, 09 Mar 2020 13:06:49 -0700
Message-ID: <158378440965.66766.7276064450606966028@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-02-24 02:38:18)
> [v5]
>  * Update the clock ID for GCC_MSS_NAV_AXIS_CLK to GCC_MSS_NAV_AXI_CLK

Has this been sent again?
