Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6844718DBEB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2020 00:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbgCTX21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 19:28:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:42866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgCTX20 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 19:28:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1942D2072D;
        Fri, 20 Mar 2020 23:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584746906;
        bh=leNdWt+8hSqxA2scIHcggKR0XuprUj3g3WAXXROW8G4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ulo7Pyk7oF6deyLVEjq7XSAMp+v03FG7itanh4lWuIRWmNZvOTa9J1fmnqlUlL/PP
         i0Hvp8tqiK46+pjlLm0pxl4F/vQGmRAFJLDDrwPfiuklKHhFzxfMleDIzlsvvmjrBP
         qzY28NVgGITSkt7QZK0REE7XdNdYrw1EJCtBok7Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584596131-22741-3-git-send-email-tdas@codeaurora.org>
References: <1584596131-22741-1-git-send-email-tdas@codeaurora.org> <1584596131-22741-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v7 2/3] clk: qcom: gcc: Add support for modem clocks in GCC
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
Date:   Fri, 20 Mar 2020 16:28:25 -0700
Message-ID: <158474690532.125146.8293263627579790213@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-03-18 22:35:30)
> Add the required modem clocks in global clock controller which are
> required to bring the modem out of reset.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
