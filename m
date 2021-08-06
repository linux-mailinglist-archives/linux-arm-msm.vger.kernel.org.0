Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12883E2124
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 03:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241832AbhHFBpR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 21:45:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:34394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhHFBpQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 21:45:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A7E760FE7;
        Fri,  6 Aug 2021 01:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214301;
        bh=bD5Pn+sy7PjeuM+zNMTQFF1GNwaHffPObRlhRBaAHKU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jPI+H8ITiKBBUTsCB4dy+Xto1BskVwB9+Q8wEIkcIw1stwde4WJe+MYMGzR6DBYTF
         8RA86g6rpL/RGFS22laP+6zaVk6aieZHg2I44mCD+58o8JwWEO1k5iVIE9KU2fgxKf
         03rTWq7I6FwwTjsanGGLvlGe2eZgZmHRQ7uam/UfkGPvrMj//4Hq6CB+qyhGtsFuvv
         wH/i87g4qQVnIgF5unPhT7PfL1+76xhbnFPF07+RZqMps20Opf6f8N5c11wnRcR+ui
         QJSbxUvjMRSPZBSroAuMrWcCzEfkCbnG2H49343TxyFx+Ts3qc8iAEr5yKGPhKpWG8
         2NEiIs0vGFkWA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <QZ0fkozlubDdc7CvqjZPhAviFmjJ28ht7Y4PT3rYM@cp4-web-038.plabs.ch>
References: <QZ0fkozlubDdc7CvqjZPhAviFmjJ28ht7Y4PT3rYM@cp4-web-038.plabs.ch>
Subject: Re: [PATCH 2/2] clk: qcom: rpmcc: Add support for MSM8953 RPM clocks.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <junak.pub@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
To:     Sireesh Kodali <sireeshkodali@protonmail.com>,
        bjorn.andersson@linaro.org
Date:   Thu, 05 Aug 2021 18:45:00 -0700
Message-ID: <162821430033.19113.15369702796490296129@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sireesh Kodali (2021-08-05 10:19:44)
> From: Vladimir Lypak <junak.pub@gmail.com>
>=20
> Add definitions for RPM clocks used on MSM8953 platform.
>=20
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
> ---

Applied to clk-next
