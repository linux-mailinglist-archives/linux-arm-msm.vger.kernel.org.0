Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2C2F38A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 20:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfKGTc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 14:32:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:38478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbfKGTc3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 14:32:29 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 38A8F2087E;
        Thu,  7 Nov 2019 19:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573155148;
        bh=vrrX5evjmYHvcp8G5Q1fyigTnvkp9QliWOvidPgactg=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=MK74RPHIIQE0WBiZ1KKTSpFqqbSEC8u4aHlkKP5fZpg2/5eBDCnSvFuyiCGVvlKVM
         EOT6GTJFnKQpNutgGmybCZOrHLlVGhtB/b6CQm/9u66HbG8Edrm07t2Rbm8SxPrsvu
         BV/GFqwbgwK+PEE3XQZoXfnkeljhbYaheBaZlYRU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191011132928.9388-2-govinds@codeaurora.org>
References: <20191011132928.9388-1-govinds@codeaurora.org> <20191011132928.9388-2-govinds@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Govind Singh <govinds@codeaurora.org>, robh@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 11:32:27 -0800
Message-Id: <20191107193228.38A8F2087E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Govind Singh (2019-10-11 06:29:27)
> Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---

Applied to clk-next

