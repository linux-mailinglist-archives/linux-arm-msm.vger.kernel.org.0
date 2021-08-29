Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC3A3FA867
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 05:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbhH2DyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 23:54:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:58972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233086AbhH2DyE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 23:54:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3D56604DC;
        Sun, 29 Aug 2021 03:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209193;
        bh=nZsaCBVVwg6IRbLFnh8+GOUqCQBeEmeGNhvC1ops9TY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iEiELf1f+jmzSXpNgFgM6SOLFYVLr+gVYgUKJGhxB5+NrGP1fpP8bZhgkyCYsaDhH
         BjW6O8QcAToq7/rYg2sWNzkigAeh6uwjMzOC5ymW/c25zVuU34B/qQLaZUnjhX7baF
         RXUr5LxXmEzHnAKh4b2VVqe1ZsyMj2vms7x98L9aPfB5bLRh74Vbe+KWKoEZICLJL4
         ze5WG+M5chT+lW3MO6Y5gXo0w8m+o0xRlAAaFb7FazZoa9CK1WKgbPuRbdsQzpDBRQ
         veUtccxIUohqD89gt1lBjMLGJ1E2yIjym+LN069eEggJiZVVUnJfh8HY4Ts1kguHOe
         c5DeOeQajJKqA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210618111435.595689-1-konrad.dybcio@somainline.org>
References: <20210618111435.595689-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: Add support for MSM8992/4 MMCC
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
Date:   Sat, 28 Aug 2021 20:53:11 -0700
Message-ID: <163020919183.2676726.15699000494221197307@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-06-18 04:14:32)
> Document the multimedia clock controller found on MSM8992/4.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
