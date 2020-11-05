Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6712A757B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 03:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387793AbgKECa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 21:30:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:52236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387699AbgKECa7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 21:30:59 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D35B2075E;
        Thu,  5 Nov 2020 02:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604543458;
        bh=ORv25bnFvbGzFSMDhLM10DcOpYDlzjv/ONbpN7EoQ+k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ek22l3poXGxUhTFxKx4+euBsFiVTXEpIizRSVESxSGquCB9jG1wFn/Jqoxlg54HGf
         AJ6lvSAMnlutV1pRpUE9XdX40LkgncjLbQ8/SruezNR//TjcvFcB6vNEzY63j78Hwp
         vuLX5SnJFguZ7yClNhzWmU7ySecKX4Nzep6nJ14M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602873815-1677-4-git-send-email-tdas@codeaurora.org>
References: <1602873815-1677-1-git-send-email-tdas@codeaurora.org> <1602873815-1677-4-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: clock: Add YAML schemas for the QCOM Camera clock bindings.
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
Date:   Wed, 04 Nov 2020 18:30:57 -0800
Message-ID: <160454345702.3965362.1630676856760200558@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-10-16 11:43:34)
> The Camera Subsystem clock provider have a bunch of generic properties
> that are needed in a device tree. Add a YAML schemas for those.
>=20
> Add clock ids for camera clocks which are required to bring the camera
> subsystem out of reset.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
