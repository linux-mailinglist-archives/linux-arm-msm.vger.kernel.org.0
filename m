Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD76642CE38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhJMWfT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:35:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:51262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230348AbhJMWfS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:35:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEFD9610CC;
        Wed, 13 Oct 2021 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634164394;
        bh=n3rPWK0nTNXRwEymnsx6bbKrvVz9wDqzvD+JXV6h8n8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iJ8tI75d0c91NvJhIgQDOBfzPF6n6QUCiT6EXKWl3TKUd3sK711orCs5567HLZym0
         UndevB/ueTF71Qs6zByHQsjeHaFRfsdTziRsJ55yrRN72b7tw3f8cgjVqKVR/LJNsG
         73CtsJlKcVIAvEFPyPXGoRCZpxlKqqoN7B2wEk/9S+377F6cTGcmAIuvNIgGBw4vmb
         CZheyZX2IjIjBSxj0OHmk/B5xeaKiccrnn3bojUqMxBXA0CgZvicmShJBBnAyujLGB
         tyDePiieGdRi9Go1sS16fQtTrEMKG5vpQGIl7ilXWtlNImQVx64iQveXmibLeEN8Ef
         lcZrjI3ee76ow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1633567425-11953-1-git-send-email-tdas@codeaurora.org>
References: <1633567425-11953-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: Add YAML schemas for CAMCC clocks on SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 13 Oct 2021 15:33:13 -0700
Message-ID: <163416439337.936110.14569646955799205849@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-10-06 17:43:44)
> The camera clock controller clock provider have a bunch of generic
> properties that are needed in a device tree. Add the CAMCC clock IDs for
> camera client to request for the clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
