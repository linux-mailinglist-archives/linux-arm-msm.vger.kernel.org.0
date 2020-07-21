Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0AC227BE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 11:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgGUJhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 05:37:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:53704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726188AbgGUJhK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 05:37:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04E032070A;
        Tue, 21 Jul 2020 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595324230;
        bh=K8Sj50xO/JwTh4VLhBj/W7/IQ4b0OHSwpJCDBWyZClA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XzytEykN3qSDmKdHOYrgZYJx6b8K2JHAUfC7k0U92DYJaPpsazu4BtCWiWVaR38SG
         T3ztzBw+HXAg9bdC6y/9s+YcnUt7TSpHTo+fSwEQEduff8xuBmEm9bAAELC2hCGmEn
         68lK89oWptjMlvgHJYg/OLEF4wRnSFkJOo41n+lM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595322791-18571-1-git-send-email-loic.poulain@linaro.org>
References: <1595322791-18571-1-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: Fix qcom,msm8996-apcc yaml syntax
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 21 Jul 2020 02:37:09 -0700
Message-ID: <159532422926.3847286.17225381725328792627@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-07-21 02:13:11)
> Fix errors reported by dt_binding_check.
> - Fix literal block scalar for dts example
> - Fix schema identifier URI
>=20
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---

Any chance you can resend and Cc linux-clk and Robh?

>  Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
