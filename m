Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2603FA86A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 05:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbhH2DyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 23:54:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:59098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234758AbhH2DyS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 23:54:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02DE9604DC;
        Sun, 29 Aug 2021 03:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209207;
        bh=tvc282wOeQGK1o6Rjj13m2eSSpxHgWl9tzCPxYo8EI0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mWiStknviT8DBF1h7DkdphOln6ePMJyF3QgMFDIctpp36i5S/28hHhRxleTihdHPn
         aWHeuQchmETki9AKmQfr/7cfw5W04RlW2WdcseRBRR84anBs4n9sKpQKoR+8OryUFs
         7Q2YaqjN002kUYMR3n4rrrynJUCUrev2yxVBhPQ1kveFXLuPtg62Zrz1DWED0DlLa7
         Tnjr5Vche++SQ0QpA3uFevbHo74F6tI33z4vvGyvXYTDUalVXwyxLKY3oZtq50Vo0q
         EsGpJfdRzl//j7tq8avG6eZ2TpvyYZAJlZ8AF3l+/gHhKqoe9mymeGeuMchyTCNkiW
         LDRvLshn2iNQg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210618111435.595689-3-konrad.dybcio@somainline.org>
References: <20210618111435.595689-1-konrad.dybcio@somainline.org> <20210618111435.595689-3-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: mmcc-msm8994: Add MSM8992 support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Sat, 28 Aug 2021 20:53:25 -0700
Message-ID: <163020920584.2676726.3320649933557364591@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-06-18 04:14:34)
> MSM8992 features less clocks & GDSCS and has different
> freq tables for some of them.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
