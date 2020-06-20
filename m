Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F001201F37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 02:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730880AbgFTAa3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 20:30:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:45142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730293AbgFTAa2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 20:30:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64D3620720;
        Sat, 20 Jun 2020 00:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592613028;
        bh=7EPgvva+Usv5H9aZt5XizQLBZ5cDZ9Jt7V0YNCRj2UE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uAp/kZgq0KPozY5ojUrpl1lV3hecnj1B0RG5QWEqd9y8I9QnBPPnR0683YxQGzuc5
         MxJsM4eXqTgp2XcpTfOSI+TAks4W4sdX6Kz0MVpYfMdHobafaITE4XM1zh1+PNunQc
         ZermEzAXtzq30AclBN0O9XUJiQ5JHI7ZY5oNUTDc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
References: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 0/4] clk: qcom: Support for Low Power Audio Clocks on SC7180
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
Date:   Fri, 19 Jun 2020 17:30:27 -0700
Message-ID: <159261302777.62212.6490805842260028406@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-06-10 10:18:03)
> [v3]
>  * Update the clock-name to iface instead of gcc_lpass_sway.
>  * Update the documentation with the reg descriptions and use maxItems.
>=20

Most patches look good minus Rob's DT binding comment. Can you resend?
