Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F0B125B17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 06:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfLSF5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 00:57:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:51820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726704AbfLSF5g (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 00:57:36 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6A1F2146E;
        Thu, 19 Dec 2019 05:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576735054;
        bh=TsPn3SWn+5KxnK+OcNkwxCJt3+wfxkJ5RCc0r1xjmrg=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=lFr8SJwLAcpR26HIzAwCSBjz9TVTjr7Mc5jRNa3m+guz84SurLVi5sMEGm1h1w08t
         ShKWwefD35c+13Ee8LNfRuoLMOFSKUvG4HERMtynt7I85q+GQCHkWWeXdC8q9d33eE
         I6LwKX1xvbOPRIvqiH7e7SyIIacBqWY+IMa1s+Fo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1576596018-10140-1-git-send-email-jhugo@codeaurora.org>
References: <1576595954-9991-1-git-send-email-jhugo@codeaurora.org> <1576596018-10140-1-git-send-email-jhugo@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v11 3/4] dt-bindings: clock: Add support for the MSM8998 mmcc
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 21:57:33 -0800
Message-Id: <20191219055734.B6A1F2146E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-12-17 07:20:18)
> Document the multimedia clock controller found on MSM8998.
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

