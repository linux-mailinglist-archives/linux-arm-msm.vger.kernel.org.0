Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B68586534
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 17:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732749AbfHHPKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 11:10:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:43574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730678AbfHHPKQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 11:10:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4C0121874;
        Thu,  8 Aug 2019 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565277015;
        bh=Jtta4F+14xlTfnq2+C5jVZoSmWUs6wxAFFE8vkiVKBo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OzpxeKsbzsVyNIFmjZAZjjPDELiYGq+U3iLMydKpYLigdNbThT+R/cadSjV6S4dWK
         GjppM9QzTys1tW/UfEwV0+9kjlHhTZGO2jnF6dPG1gL7mm7/JycxlxAerhLWGXE1v6
         lyGjVcWiAjImBWQIun8UrbBS64EHvrc221jznjSY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190726092332.25202-2-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org> <20190726092332.25202-2-govinds@codeaurora.org>
Subject: Re: [PATCH v5 1/7] clk: qcom: Add WCSS gcc clock control for QCS404
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 08:10:14 -0700
Message-Id: <20190808151015.A4C0121874@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Govind Singh (2019-07-26 02:23:26)
> Add support for the WCSS QDSP gcc clock control used on qcs404
> based devices. This would allow wcss remoteproc driver to control
> the required gcc clocks to bring the subsystem out of reset.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---

Applied to clk-next

