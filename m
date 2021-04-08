Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63CBB3578C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhDHAPR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:15:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:41962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAPQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:15:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A23ED61028;
        Thu,  8 Apr 2021 00:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840906;
        bh=VYbiS85BlvE19rjjwLGMYlOgZjDsdi0KzMyUg7k+dD0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hRxkFQDHjTtOa2nD9KoiORhOAtcteLsx0eT/LDrGKBdvRTOhnI4YFF0fiWWAACzi2
         akX+wnULj0TfbAr4jU674aqHeCj5tFgIsFcKEJSb7U1KLo1BCezTHR/rWQAOlXc6E1
         TssOW5AfYakUAd20HUnlk9YvOBtnD8eSaDXoju0YP2xFHqVkdnBk/s3OWXzIY4MNmL
         tmR6IdE6vFRwxCaQscSlEHoRfyxwatIWiJ886NXvks+EKav09DE+1CnPP5JTRq4p2C
         nPVtsEGj3sFtlCjLtZhW2sCwe7wCrrdDBC7HNYcA6/b7Blsus9P6rr9Ue8T0vX3ifA
         k9vv22UU1Pxpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-6-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-6-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 05/33] clk: qcom: gpucc-sdm845: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:15:05 -0700
Message-ID: <161784090548.3790633.2434111622179293575@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:15)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
