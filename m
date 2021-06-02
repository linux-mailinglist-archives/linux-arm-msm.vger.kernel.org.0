Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0651B3982BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 09:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhFBHOi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 03:14:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:49854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230099AbhFBHOh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 03:14:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 342CA61363;
        Wed,  2 Jun 2021 07:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622617975;
        bh=kRV1Drag7CbSClLLcWRTsmI1ANuI53K82Smrumm0QvU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=twUk8MepfSgaCtWiFwWEpa2o7ClkhTTF+wz0UGw+XVrN6BOEjKDDhQE771JXdAe4B
         u1mBhexiGh+Q7MaCsKLNiwmEIHHZ3TrGerShT0t0WkjFLPAKVOKryMSGRXrW2L7dRw
         i9YPT7JPYU89P73b+3zRChit7YmytPXuiFtM0XQKMuraBiL66uoON9QQ7gKRM2Z2MX
         JeS/0R5T7d3ZjV69mnxNrUr/nrz62lFH7VvzPtAKTWBWxWvDaO6ABHXOlBWGja3Qfn
         8z8S1oTciIJJSwBfZ9hAUSuHiblIcYXH/lpnm4xJZXV8P5tc1U8QKTpqO8pVR0Ud16
         ATIx0lBfssofg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210523211556.731976-2-martin.botka@somainline.org>
References: <20210523211556.731976-1-martin.botka@somainline.org> <20210523211556.731976-2-martin.botka@somainline.org>
Subject: Re: [PATCH V2 2/5] rpmcc: Add sm6125 compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Martin Botka <martin.botka@somainline.org>
Date:   Wed, 02 Jun 2021 00:12:53 -0700
Message-ID: <162261797390.4130789.3128084410343392163@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Martin Botka (2021-05-23 14:15:53)
> Add a compatible for SM6125 and assing correct data
>=20
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---

Please send this patch series with a cover letter and the proper To:
field. My MUA is having trouble viewing this thread. Thanks.
