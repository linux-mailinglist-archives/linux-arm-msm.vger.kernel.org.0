Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A28720327B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 10:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgFVItS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 04:49:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:34644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgFVItR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 04:49:17 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 291C120578;
        Mon, 22 Jun 2020 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592815757;
        bh=VFScGlJjoXFv0HC3JnUVaDlZvEEkcUKKKCtS4DNwd4w=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=IPNCczmPcvdNL5Sn8EbsyVyFXP265rGdmkR3YOlsvtlP1cp8r9n3a0aWIGD3lctfS
         WxADQIeZvCjyQ7UPCtAhcWwMJPhzLolvHeiBjuwAIAR7UkXwWmzHUNUY7ryLweeLSW
         SrgOXbNDTPjjAOhIaUJj8qu556TcL5TMUnoZnSaI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1592800092-20533-4-git-send-email-sivaprak@codeaurora.org>
References: <1592800092-20533-1-git-send-email-sivaprak@codeaurora.org> <1592800092-20533-4-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V8 3/4] clk: qcom: Add DT bindings for ipq6018 apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org,
        sivaprak@codeaurora.org
Date:   Mon, 22 Jun 2020 01:49:16 -0700
Message-ID: <159281575651.62212.11022439440485766512@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-06-21 21:28:11)
> Add dt-binding for ipq6018 apss clock controller
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---

Applied to clk-next
