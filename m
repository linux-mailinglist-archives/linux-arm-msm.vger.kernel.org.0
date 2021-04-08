Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC79B3578F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhDHASF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:18:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:42938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230099AbhDHASE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:18:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FBE461028;
        Thu,  8 Apr 2021 00:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841074;
        bh=S0PggtDA0jHh2Fl3XeehDBS5IxJTGudb9fzRkb+Sz1g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=prdwY2TzCUa6V0Igve774ec529Cwo7W4SKs/CaHVoVyErqrlgeug42DzrSgW2ju+D
         fuxNjiajtoD+AFd7yeKJF9SgZvXvY7C4lW9VqDZ+/h5mon+Lb6WZrJp5TUIXI3fpdg
         gU1kQIhW9XprFhcouvJzymysEMdtqi23F0jCZQGOeeEGsVg/0nIxW/a7M8iId3YbOm
         PI7VTKItyrefR+NuY1w3ZZFkbdUZZ4WhspIicLUa1nKLU/Yrdlfyf41d9kTV19Rpwe
         l7CQvUFn2Tx/qnwOCOiJRJxvulN4+shD491gjYJgfNlkz59ugL9h0lpvW0W1+KqXZ8
         y9ZhAAs16MOtQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-32-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-32-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 31/33] clk: qcom: gcc-sm8150: use ARRAY_SIZE instead of specifying num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:17:53 -0700
Message-ID: <161784107301.3790633.17527922033618842359@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:41)
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
