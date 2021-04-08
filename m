Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518343578F7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbhDHAR6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:17:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:42898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230099AbhDHAR6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D35E861028;
        Thu,  8 Apr 2021 00:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841067;
        bh=IxDOHTznazS0sHmaxjBKvqgDcaH3O8uB/LMzvsivkb0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hUnJ95LES2v5NYg2zTqB3d2aQRsREpBBej//+kzG0Y5cL4bJUszPmF/jXkWL+8MdY
         MVjMTB+J2k6qjVDQGCxTJLA+tu0qo6qEyz3mU4y8HhcMIN0uidj8mAhZQn48/0cuVC
         +Bzesmd25bI98QYQkp7S0EBY+DhazZFJra4YtTN424DBsOBMb2Dxm5R/BFL2eewrf8
         EE0JOG5Mz0zzDpBaKgD7JdjK1y8rWMVVxnGRdtEbb6+5cngHTiDSQ2h8uiyg2i0rRT
         5bmrXoEHKg00uDkKl+ENNUEOPK4K/X424csMQhli+cSk9osxq62N7H9isCWG5/kYzZ
         yQN1gmE4RBemQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-31-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-31-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 30/33] clk: qcom: gcc-sc8180x: use ARRAY_SIZE instead of specifying num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:17:46 -0700
Message-ID: <161784106675.3790633.2192275244361069326@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:40)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
