Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 778588593F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 06:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfHHEaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 00:30:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:42360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbfHHEaL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 00:30:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FEDD21743;
        Thu,  8 Aug 2019 04:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565238610;
        bh=uSAOwY7t+VKF9iLq+Lh4X44seGUzqHQM08FmelLcOYM=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=hnikIz8Sijjukq3s/G9PiMYgu56+SyBiJzNFm3f0Z8JnLqThuY3DMIbZdz0aMJIp0
         JbEENRec7JbaoTlFcMRrw35n7AEaxj4YxIBfn+6z57XF+pS5oyxTudqRrF/OqwoOB2
         S/pHPnRp+KBOUe1cVmdJUjdoEH1tl5iGY33SgsV0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2] clk: qcom: msm8916: Don't build by default
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 21:30:09 -0700
Message-Id: <20190808043010.5FEDD21743@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marc Gonzalez (2019-06-13 08:09:34)
> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
> built by default. Let's bring them back in line with the rest.
>=20
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---

Applied to clk-next

