Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF19F8DA28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730658AbfHNRPm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:15:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:40198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730961AbfHNRPl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:15:41 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88A79208C2;
        Wed, 14 Aug 2019 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802940;
        bh=1xSMuykuomvNB3TtezQsMbHc6fU8Wwbv0cdYSMqcmg8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2kWmBZlaWvd1pkpXMut/dOBeV2tQnStSIR68yjNn81EcCIuru0WhwJOAyTr2wEcn1
         SjD2oAIi0BgXkeKbPV0YkA9F/Wq7S+zb5zxVNCY5oa2tpO4Qc9IuW8xxInfFG+6OlZ
         fBZAxgLz+P/TqHwPINqixEp7fjAJmfA7N5u6AFtM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-21-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-21-vkoul@kernel.org>
Subject: Re: [PATCH 20/22] arm64: dts: qcom: sm8150: Add pmu node to SM8150 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:15:39 -0700
Message-Id: <20190814171540.88A79208C2@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:50:10)
> From: Sibi Sankar <sibis@codeaurora.org>
>=20
> Add the CPU PMU on SM8150 to get perf support for hardware events.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Squash it?

