Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9737A86594
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 17:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390031AbfHHPUT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 11:20:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:47822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390021AbfHHPUS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 11:20:18 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D044B218BA;
        Thu,  8 Aug 2019 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565277617;
        bh=EQnjkpppgKILHmLr+fRsUzCN0MnNhBmjmtEPnIrTHHQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YC41VXeynHPI34GsfNdlru4v+ea7SdLqBy1nCLuFo56CP1clEc11gvqLyL7igelUf
         q5MyRvPvAEWVDtFvijMohjEASW39dL37ypF4EWVHqo/tP9VV8pzhxzG7Vfi2GTlook
         02QCrSisJDq3g8AmygsiVLoWYz5SSHF2IWs7dsbk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190726092332.25202-4-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org> <20190726092332.25202-4-govinds@codeaurora.org>
Subject: Re: [PATCH v5 3/7] clk: qcom: define probe by index API as common API
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 08:20:17 -0700
Message-Id: <20190808152017.D044B218BA@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Govind Singh (2019-07-26 02:23:28)
> Extend the probe by index API in common code to be used
> by other qcom clock controller.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---

Applied to clk-next

