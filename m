Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7742242CD76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhJMWMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:12:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:42074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231201AbhJMWMD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:12:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2237F610CF;
        Wed, 13 Oct 2021 22:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634162999;
        bh=EhsLT1+usHj9YPbxvzEVOzTi4lKGJF0fbbwU1vQx/n4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UujPYwyCqcWTNf99RYO+R3Bso05x5SOyOS5TGuiaJll0zTl5WWZ9NxoM6HAECp8GH
         lzvLUrRFqlQVekmwCY+tFOYqqWtkMlNlwP8Z8MJTIpTl2JwZ+h1oD/esYS5xG0/CwI
         OVvzxA6YWvr7BoQlSCAeAGBdyr0JQ3wLrohAm+XkZ6nK7lji50QaimTDNxDRxa9tnQ
         vYZiSO822vWHEXISkdEEUk8Xvv/hXmi7U81sAO+pim1vQJpFIhai3mDYYIkAIBrQpx
         RMCY/r/mGS2FqGYyABIS3zpk5Bxs0OJbPx+A39JYIyYsSV3cA953q3jHLI4xCsLeRR
         S9i51A5aZ0AmQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210923162645.23257-5-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org> <20210923162645.23257-5-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 5/9] clk: qcom: gcc-msm8994: Add missing clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Wed, 13 Oct 2021 15:09:58 -0700
Message-ID: <163416299802.936110.17780360039011999883@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-09-23 09:26:38)
> This should be the last "add missing clocks" commit, as to
> my knowledge there are no more clocks registered within gcc.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
