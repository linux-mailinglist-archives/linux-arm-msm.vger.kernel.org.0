Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15B98185093
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 21:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgCMU5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 16:57:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:55076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgCMU5c (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 16:57:32 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2D3F2074A;
        Fri, 13 Mar 2020 20:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584133051;
        bh=B4l8ndTJzmvb3eEAPRS7jp/F3ynzjAo+Jf9vLnUAo9c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KO4D24a3uDptIHeuIwRUqwXWmDeMDdQM5pfycl4dinBY44n+xxSgSX/dCwIW66QJU
         upMPDamHWwFOmMXnkIQQhP97lQrdLq4B+gI3wEQJqSueNUv7s41E7aal04cRMSk2ta
         i39ZlcU7+gycWGFMUS+o1H25g1OHO0gw3qyVYC/0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310143756.244-1-ansuelsmth@gmail.com>
References: <sboyd@kernel.org> <20200310143756.244-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v2] clk: qcom: clk-rpm: add missing rpm clk for ipq806x
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        John Crispin <john@phrozen.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Ansuel Smith <ansuelsmth@gmail.com>
Date:   Fri, 13 Mar 2020 13:57:30 -0700
Message-ID: <158413305090.164562.262956401824904582@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Ansuel Smith (2020-03-10 07:37:56)
> Add missing definition of rpm clk for ipq806x soc
>=20
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> Acked-by: John Crispin <john@phrozen.org>
> ---

Applied to clk-next and added Rob's review tag from v1. Please help and
do it next time.
