Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A982A757E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 03:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbgKECbK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 21:31:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:52408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387672AbgKECbK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 21:31:10 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1EEC20739;
        Thu,  5 Nov 2020 02:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604543469;
        bh=iOJh1FMVsFSCrGlqaGyryWmi8wT+648ecaMGSIMs8w8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=V0RnLMdujMwGXfxNPZ7Jo+jzsat1PsAq8V3ww1SgMi/7X2786mnB4s3qDKkkFtPKm
         RqZ2Ftnwok9iazm0F65vEBJEIXTmZMP21zmSPYIPQDEhfpjxyhiLiPLILFTpPuFpd4
         MehsnExur+c79H9SzfPxrQUKxc8QpAHbDAGRTkbQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602873815-1677-5-git-send-email-tdas@codeaurora.org>
References: <1602873815-1677-1-git-send-email-tdas@codeaurora.org> <1602873815-1677-5-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 4/4] clk: qcom: camcc: Add camera clock controller driver for SC7180
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
Date:   Wed, 04 Nov 2020 18:31:08 -0800
Message-ID: <160454346831.3965362.1176963402805166784@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-10-16 11:43:35)
> Add support for the camera clock controller found on SC7180 based devices.
> This would allow camera drivers to probe and control their clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next with some minor fixups.
