Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A556235A5BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 20:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbhDIS2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 14:28:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:42922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234428AbhDIS2d (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 14:28:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9824361105;
        Fri,  9 Apr 2021 18:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617992900;
        bh=ZjTb7n32uw4wMA+eHxn6r1KYvlmplQcu3k1hzR0l62M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=r33BdEHxpsmig2EJQYmrLMJyHJMS55VZLZ7v6Ku5rwTKZzg++Fykk0JlCLaBWvQHI
         tsVGL4eZ3fw2kTf+30zV2ASbLRsN14ndcYYp4Zr2bQSlAzUn16t9MhaRI/1sPQYpnA
         c8+nMIFNhX6F+lUeseGfAsMHl7wK9QoKYY24BCPDyxSHfvbIDhOGkZueHx4YYF/pZ/
         CkZMgH9YHRtkBGZh7jP/47oFgLfXDIXxauCaLGy1c1PB0/SZz6Fk8SEr29rBlkjAm4
         DB+02u9eONiKKbau5JbF0O+HZBydnSBzVjXjCUKlU1gmit54aFtOIIc2oO94KKJWZu
         mDWWvZH4RB1rw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210409082352.233810-3-clare.chenhui@huawei.com>
References: <20210409082352.233810-1-clare.chenhui@huawei.com> <20210409082352.233810-3-clare.chenhui@huawei.com>
Subject: Re: [PATCH v2 -next 2/3] clk: qcom: a53-pll: Add missing MODULE_DEVICE_TABLE
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Chen Hui <clare.chenhui@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, georgi.djakov@linaro.org,
        mani@kernel.org, mturquette@baylibre.com, sivaprak@codeaurora.org
Date:   Fri, 09 Apr 2021 11:28:19 -0700
Message-ID: <161799289939.3790633.6073793226576336797@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Chen Hui (2021-04-09 01:23:51)
> CONFIG_QCOM_A53PLL is tristate option and therefore this driver can be
> compiled as a module. This patch adds missing MODULE_DEVICE_TABLE
> definition which generates correct modalias for automatic loading of
> this driver when it is built as an external module.
>=20
> Fixes: 0c6ab1b8f894 ("clk: qcom: Add A53 PLL support")
> Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
