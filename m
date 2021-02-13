Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E328E31A911
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 01:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhBMAxl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 19:53:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:57632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232429AbhBMAx0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 19:53:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D887B64E0A;
        Sat, 13 Feb 2021 00:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613177566;
        bh=pNre3CqyD8f4nxdtVdDpeulr11zE2GUiwFapefEUjN8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Yay1g+rmOmXebNdsgWDLaVRLxSKjEVpUvQeVz5VhvGz2AZw/YY3Oqt0eM1j32Mcf9
         6CkFhk2aBp50ubBmMyOsmaARkpw2Bap9DCbgl6m5f36cDjZuVMwPt3OYxD6y6/s/0a
         y3KblYjgvtQ+ywEW+hh/dGbb7Wv5g9JfcCgfQDLduRIJpeMe5FwHDwB+xwQZ5hA+bJ
         zlCP6JFM9Y8V2HvFssZjL0EzEE4PJ98yKMTuYLyQp6yynUrMX2gtVtJpljW7NKcKJ4
         aQDB2BzlQUEMcrESLVvfAg1KKb+KBp0ZtWATFl1mzuKay46DGJ5dMHbmn/IxBlI5za
         Pp7ti0nGbtPEw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612981579-17391-2-git-send-email-tdas@codeaurora.org>
References: <1612981579-17391-1-git-send-email-tdas@codeaurora.org> <1612981579-17391-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add SC7280 GCC clock binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 12 Feb 2021 16:52:44 -0800
Message-ID: <161317756448.1254594.10080238170066566402@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-02-10 10:26:18)
> Add device tree bindings for global clock subsystem clock
> controller for Qualcomm Technology Inc's SC7280 SoCs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
