Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA9C34D972
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 23:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhC2VIo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 17:08:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:54476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230161AbhC2VIg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 17:08:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 154EC61987;
        Mon, 29 Mar 2021 21:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617052116;
        bh=H7oFD+Wy16D6yioU0LA4DZWPK5qlhfgz520Z+alPqNo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=g48/jWSZO9tmh/95faqO1JanUlisIh6Wv6TCDK0VvK2pVaQf4jqDxxz/FLPplnWBF
         lfSr/KWd/jH/zd+zbtNHMsgb67/XPmnZdhYQXZdhtRbEPAbRxO17ksP5IVvrjGNAVE
         H0wQSVrK45dybbtt+DtDnP/nd0gYbgN+95oDiuQT43fYZWUGswUNZLfoQxIRDg7JFH
         f5fbv8V4EKHEtfgY2a5AWUqFz9KpF5SpTQMSKJl6eQL0XIeXv1O01Q6QLSCCJKp/hi
         S/vrKEBNk7cRyQtcQAQP3DpFgjiWVpPE2/dtFhsVbPCWcm4MnwExHhNezWHj94ylnw
         u3m3n98nr6+LA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616809265-11912-1-git-send-email-tdas@codeaurora.org>
References: <1616809265-11912-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: camcc: Update the clock ops for the SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Mon, 29 Mar 2021 14:08:34 -0700
Message-ID: <161705211465.3012082.15103893459170781797@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-03-26 18:41:05)
> Some of the RCGs could be always ON from the XO source and could be used
> as the clock on signal for the GDSC to be operational. In the cases where
> the GDSCs are parked at different source with the source clock disabled,
> it could lead to the GDSC to be stuck at ON/OFF during gdsc disable/enabl=
e.
> Thus park the RCGs at XO during clock disable and update the rcg_ops to
> use the shared_ops.
>=20
> Fixes: 15d09e830bbc ("clk: qcom: camcc: Add camera clock controller drive=
r for SC7180")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-fixes
