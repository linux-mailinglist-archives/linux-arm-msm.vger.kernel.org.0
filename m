Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A428D3E2149
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 03:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242140AbhHFBxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 21:53:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230437AbhHFBxl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 21:53:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D16860200;
        Fri,  6 Aug 2021 01:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214806;
        bh=uAKRWcOqkQpjQq+1WXosjG6F4b38yLmMrOUiO8CvEpA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Kif75qXJg1TtBl7ENDtVr2V9n/fm0NaXykzxpIo7MpG9Slm+udCFXNtw9zjIhtn3k
         im8UDN0alewpOCNKgOkOc3dNyiiADxAKmSY5KjpoaTVIbkECj1FblhG5QO+ugabHEE
         /JYU9IDBAKTk6WHXo6BjDhvQVcMFz7Px6GVgUVTYCaRfz+crmjy924/ZIt7ImMgXXD
         RGdYFa/GXIP6gdqWNRcNTd+VTC8pPj3PPin1RrPY8DNhPR2y8PTK2z5HPEVv+iNnFY
         +0F6Be7k4DmJhONSusn4YVE10FInbc/+RT3p9U98KnyPOZ4oqydEBn6fFHSbD6MOVl
         Ua3O/aZLiUlTg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210704024032.11559-4-shawn.guo@linaro.org>
References: <20210704024032.11559-1-shawn.guo@linaro.org> <20210704024032.11559-4-shawn.guo@linaro.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: Update qcom,a53pll bindings for MSM8939 support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Thu, 05 Aug 2021 18:53:25 -0700
Message-ID: <162821480522.19113.3178828433160876199@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-07-03 19:40:31)
> Update qcom,a53pll bindings for MSM8939 support:
>=20
>  - Add optional operating-points-v2 property
>  - Add MSM8939 specific compatible
>=20
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-next
