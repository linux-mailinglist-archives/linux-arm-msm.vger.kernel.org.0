Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBBA427F69E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 02:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731934AbgJAAXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 20:23:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730258AbgJAAXp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 20:23:45 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 200D5207C3;
        Thu,  1 Oct 2020 00:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601511825;
        bh=8pv2TcbT/1xAdAFt2BsMtyl+dWvvIdqjb2qvPpd8Uz8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=l8WGtLYkgUewiqMWmK9qBr0mMxXZBX2ey1oG+EpA/fFCSwDmgFrdIVyJov2P8ZkqR
         O4ngPvCBZNswXx1OQHTLPQZlkYt0O0FipZlkaZI8fsvVYxDLNbN6CEhuczaWZrpvWT
         0BM2ro7c17nDAtoRRNMk9TIZROxscxdhxDs/aUjQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
References: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
Subject: Re: [RFC 0/4] clk: qcom: handle power domains links for GDSC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Wed, 30 Sep 2020 17:23:43 -0700
Message-ID: <160151182386.310579.7297378317318019098@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2020-09-11 06:09:46)
> On SM8250 MDSS_GDSC requires MMCX domain to be powered to access GDSC
> registers. Handle this requirement in the gdsc code by binding the power
> domain via dts file. The example in the schema file demonstrates this
> binding (which is not required for SDM845).
>=20

Please Cc the linux-clk list on clk patches. It might be obvious now
that I don't always look at this email pile to fish out clk things.
