Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF8C5B52BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 18:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfIQQQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 12:16:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:51208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbfIQQQV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 12:16:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FB9520665;
        Tue, 17 Sep 2019 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568736980;
        bh=CZ/KM/gXmljIiH0z+X3RrvgbxAfWQDwGFAhaAoajiiU=;
        h=In-Reply-To:References:To:From:Subject:Date:From;
        b=DPdwuC9Kn1JjoD0UWmRDfWnpXFl/6YDXpvWsyFrG/UCS3S6gJPaDj8+UjcaNedkr5
         dZWKMmnW3WNfUg59IssfHTx87QiHMuTpqxDkq2v+8+IGWeWd6KPSg2Six2zg3Immil
         glkwMtr2S8Tj8wLvnnhwtQ2nfOsZk8+MrG1R1Kzc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1568375771-22933-8-git-send-email-gokulsri@codeaurora.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org> <1568375771-22933-8-git-send-email-gokulsri@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        gokulsri@codeaurora.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com,
        nprakash@codeaurora.org, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 07/12] clk: qcom: Add WCSSAON reset
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 09:16:19 -0700
Message-Id: <20190917161620.9FB9520665@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Gokul Sriram Palanisamy (2019-09-13 04:56:06)
> Add WCSSAON reset required for Q6v5 on IPQ8074 SoC.
>=20
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

