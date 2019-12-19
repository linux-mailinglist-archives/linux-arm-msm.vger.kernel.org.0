Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28572125B20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 06:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfLSF5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 00:57:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:51688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfLSF5c (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 00:57:32 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E87C42146E;
        Thu, 19 Dec 2019 05:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576735051;
        bh=im5Slt+kvx16OXvVHYowb2/bwnWWlv8T+37tfqixaFA=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=r9Pqg4s1VfIVRourVDzhNYIoiwqaA8hj3cOi2thR05FQ/QBvtXi5wvrSg/FCCMctL
         ZBMsDduwpHVCeai9b8s6wh5N8U02bIjn3zca+LoasSt/nLNWCkbfWmwC0UsX5CFKgO
         QJ1BpvIE4sAZfGF6GlsC8IetakkEqTHafFO9dZLE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1576596003-10093-1-git-send-email-jhugo@codeaurora.org>
References: <1576595954-9991-1-git-send-email-jhugo@codeaurora.org> <1576596003-10093-1-git-send-email-jhugo@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v11 2/4] dt-bindings: clock: Convert qcom,mmcc to DT schema
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 21:57:30 -0800
Message-Id: <20191219055730.E87C42146E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-12-17 07:20:03)
> Convert the qcom,mmcc-X clock controller binding to DT schema.  Add the
> protected-clocks property to the schema to show that is it explicitly
> allowed, instead of relying on the generic, pre-schema binding.
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

