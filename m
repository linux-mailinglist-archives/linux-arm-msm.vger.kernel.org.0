Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC483E2146
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 03:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242044AbhHFBxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 21:53:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:35850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhHFBxd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 21:53:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 917BC61184;
        Fri,  6 Aug 2021 01:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214798;
        bh=OoWCE85Mo6fAjJs2whbxIvjE66CKcaq0h3kKmA8XkUg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Y/o54rmuBuWDkpAqoc45N1Q2hKBQMOYCrjLtw2vAJ8zpAl9bS2P8GIdcu3fB0rDJi
         NLBNnFSSH9rEkNhBxj6CqZPT8g/Ls1wJy6g2zdJXNp083Z1tUOddrMrIb5SwLXBNXQ
         O94vzhdYCIgLLq29sZqNmNtJcxcpAQ+A/qRJE7MkoQHxsGTr8iph0oJNzosU1id8MZ
         wfi9HpZauiaAjkv/I8mGjJGGXXj69Ss6k83Ibt9EcGZ9vy1DDDiimdncgPwJOuBR/J
         KWipxDWFver+jtmFnjz+ZivGyXKVMNG5MX5IsTNTNfSHyLtbjBJmnXCNwKqj69kKZQ
         uByoOZEYh9/fA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210704024032.11559-3-shawn.guo@linaro.org>
References: <20210704024032.11559-1-shawn.guo@linaro.org> <20210704024032.11559-3-shawn.guo@linaro.org>
Subject: Re: [PATCH v2 2/4] clk: qcom: a53pll/mux: Use unique clock name
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Thu, 05 Aug 2021 18:53:17 -0700
Message-ID: <162821479747.19113.7243652814769771350@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-07-03 19:40:30)
> Different from MSM8916 which has only one a53pll/mux clock, MSM8939 gets
> three for Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache
> Coherent Interconnect).  That said, a53pll/mux clock needs to be named
> uniquely.  Append @unit-address of device node to the clock name, so
> that a53pll/mux will be named like below on MSM8939.
>=20
>   a53pll@b016000
>   a53pll@b116000
>   a53pll@b1d0000
>=20
>   a53mux@b1d1000
>   a53mux@b011000
>   a53mux@b111000
>=20
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next
