Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42E43C8B96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 21:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhGNT00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 15:26:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:54700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229735AbhGNT00 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 15:26:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97547613C8;
        Wed, 14 Jul 2021 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626290614;
        bh=nP32tI4hRgPaIx+tSiFA8H4oCp67IjWbd/g7ejdRsAA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E4ng7Zl+pH17HEMScr8sUuCfrnGBM38L1UpVnIqxiJYlRSqMHDMzWsoIla2W3+NHR
         xX+ePbsq0EfWWk/GfL1iDSWzlvJsUSep/7nrOdwKQ2LR3DA1a4pfXDd9lxcAMIR/Nk
         wiSQteaLmagkjbPqi1MKgK+iu3/Z2sWmIZR41eaUvz0RGrZVOuWiYE2wUuwolKp4VK
         MOkE+t9L1tRPEZ38bIfHBKkjwDEaqh+myRKxvbSBuG05pU8B8lZzIxankZKCcYloe2
         ebghmQii2OYi+VkX1Es1AzAvcZyy7K/JTWLm/89rM1Zhe+Uzin4icpHZK8tVbvMF52
         lqVxvTIV37QNQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1626159971-22519-1-git-send-email-sbhanu@codeaurora.org>
References: <1626159971-22519-1-git-send-email-sbhanu@codeaurora.org>
Subject: Re: [PATCH V6] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, okukatla@codeaurora.org, djakov@kernel.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, robh+dt@kernel.org, ulf.hansson@linaro.org
Date:   Wed, 14 Jul 2021 12:23:33 -0700
Message-ID: <162629061340.1302931.17355434329362126779@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shaik Sajida Bhanu (2021-07-13 00:06:11)
> Add nodes for eMMC and SD card on sc7280.
>=20
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
