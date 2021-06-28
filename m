Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEE13B563F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 02:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbhF1AS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 20:18:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:46734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231750AbhF1AS5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 20:18:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E470B61A2B;
        Mon, 28 Jun 2021 00:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624839393;
        bh=FiDke5Fyewp54WfWgYCzPP8U1tqDo/9JLDPzlEDhTLg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AJ5f3euEZh4bzS05Z365AyhZbxCzQr4bi76KG9SJUM3RPIf2I3e3uyL/SBcJP8+jc
         +sZ2Q0dgpD8qoimPxF3hV4j7ZeCEpwvwwdahdj5A+GVOnSNLmhGSIq74r5M7l4HZod
         jn8sO5/eazlet9Gz9q1ndFwnlKbC7YAbkSnRoDKqpAbqDLIc+3xJU8bK3tV5SdB/3K
         ehPhvLdRRpgapc8FkA7R79PUc8/ZDlcmJ9LiY8Mo3tMC54uvZCXyE8zE7yzBgwJtkD
         gCFGZPKCtte+tGBYxCwy+iUD2gmmRD18JVU+QlIARrpGLDt5mgs+flW0snv5PUrUqI
         r26TqNV8POtaA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210609022051.2171-3-jonathan@marek.ca>
References: <20210609022051.2171-1-jonathan@marek.ca> <20210609022051.2171-3-jonathan@marek.ca>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: add QCOM SM8250 camera clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Sun, 27 Jun 2021 17:16:31 -0700
Message-ID: <162483939176.3259633.14392995234481057001@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2021-06-08 19:20:47)
> Add device tree bindings for camera clock controller for
> Qualcomm Technology Inc's SM8250 SoC.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Applied to clk-next
