Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4F23FA85E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 05:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbhH2DxL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 23:53:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:58670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233468AbhH2DxI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 23:53:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD92460F35;
        Sun, 29 Aug 2021 03:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209136;
        bh=nZsaCBVVwg6IRbLFnh8+GOUqCQBeEmeGNhvC1ops9TY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GiHadmV4WMMp9xbsSikBIvGA5EglRbZsr7GwEkB42ejbflfpwTwtUqyMx2J37OJf9
         zlo4gEzCpErcz0HRcFVJhlWz3GxCLUj3/y0iCDgQV4rBOJkLXs+rnll9Yw4vx+abFM
         JBZwWCrbzLRTqkb6zZu4o+FepAmbTWIMpz1ZNcnJE42+ms2KUBWX3Iulu6xq/XTms6
         BxR8KLdJo50SMj6tQ7StcKSle8fg7k8QTi6YpJFxx0gZ2MlaUExBlW/79o9XiIye2l
         2NGh5ex4U7GiV2/uTmGOhyy+W0H8ewbJ2kkDAe/bQ1hv6rQqtKwWMt47D5H73fm3m0
         E5R+KhxXtTp8w==
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
Date:   Sat, 28 Aug 2021 20:52:15 -0700
Message-ID: <163020913548.2218116.5748456818561837822@swboyd.mtv.corp.google.com>
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
