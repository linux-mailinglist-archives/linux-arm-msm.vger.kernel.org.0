Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B89C18DBF2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2020 00:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbgCTX2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 19:28:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:42966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgCTX2e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 19:28:34 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DED6E2072D;
        Fri, 20 Mar 2020 23:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584746914;
        bh=qalHwUrzUk2yXtnUFLYtnkR1+IAWc8P6P4+ofL2Q6XI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=l7rpz0361lsB2Cz0oLexziBxM5iAbWJQ3ekObZZTYLN+05MM7bCJ1MpEzu7nUjf3q
         Fs/Gxw0QjWQgUJ1adLLo2oXxi/U+c+RbRvCKlIJRmBCcbUF4ZsCxxh/MsJWNrEb2sl
         AmeEZQKP4qmMs7dcC6B2WW+gdQOTJh6KMwfYMkPU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584596131-22741-4-git-send-email-tdas@codeaurora.org>
References: <1584596131-22741-1-git-send-email-tdas@codeaurora.org> <1584596131-22741-4-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v7 3/3] clk: qcom: Add modem clock controller driver for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 20 Mar 2020 16:28:33 -0700
Message-ID: <158474691318.125146.14196063534744722775@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-03-18 22:35:31)
> Add support for the modem clock controller found on SC7180
> based devices. This would allow modem drivers to probe and
> control their clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
