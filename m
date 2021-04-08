Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 692533578ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhDHARc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:17:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:42698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHARb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5087D61028;
        Thu,  8 Apr 2021 00:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841041;
        bh=eNfTIDcys+3QLyhDY41iuTo2ke7F90YcMXKJ/ooFsMc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PT/+vTjkMbjGDnTRLfJrQl+Pou2Yij+cREnTAMSRjU3k/QRmMX6GewqfTxS1vmlCR
         PReHGTO+Hjr/9/woJN6JBWrIMdZCBQILVVZyZ1ty12+gbLEAOjewCOdT4IVCJLpuN8
         OJSRZvRq6QR6+S69enEbCOjN5C7JjoOzWoLCT/HAqP8tYzmIS3UqbyEKa/cLEeWiWK
         z5xfguzV4B/rafF7WE9C3RJNw0SkoiDM4Mo9tVRoio2YcmkEs2wI6mQCYeaFDTXg5S
         OqxDDcWBtQPzWCaVcefeqPzqyj297xV9EeOps0zFmz8C13c0umJemDaI2lYTFfoLef
         mo6cEjJ9rhXdw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-27-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-27-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 26/33] clk: qcom: gpucc-sm8250: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:17:20 -0700
Message-ID: <161784104014.3790633.1644010723406054778@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:36)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
