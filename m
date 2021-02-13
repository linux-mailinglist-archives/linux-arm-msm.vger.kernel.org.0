Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B9331A8EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 01:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhBMArC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 19:47:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:56920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229693AbhBMArB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 19:47:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF3F664DF0;
        Sat, 13 Feb 2021 00:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613177181;
        bh=xfJoTNnYLr8VjuwQHo+s5dK9qvDcgo32iKZ23awshN0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Qc5qjwQ+7XZ5k+sjHUQk/zEwpLi49iirao+8TxGrcfus4KvxUY1riHYJGNmmCpFVf
         0Mc4MxwkSaDebtqhCh1mBG1hXZ3BkZJbos7NVJSnie61sQg/vNLl/jgSdqqI8U/flh
         FZdKMoRXR2tFpZI4W9g0LeZRelmvTH17aP24+K644QMHOh2bU5O+RhlG3dnuFPoz/O
         h5DWfvl8MVwDQteKnGMcuj6toplQ+Q1Awky+0ayjUhRQ/aVFEyLSMJs9cTRSzbA/GR
         ok5NEfzCeKVSj2GbvDwd4lzpEM6WzadEkTrs65FWXGSPw8hp/8+ChIkAcm3eZuk+5r
         O9Nsa5gRbE0ug==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612977230-11566-2-git-send-email-tdas@codeaurora.org>
References: <1612977230-11566-1-git-send-email-tdas@codeaurora.org> <1612977230-11566-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: Add RPMHCC bindings for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 12 Feb 2021 16:46:19 -0800
Message-ID: <161317717957.1254594.4653336289156860657@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-02-10 09:13:49)
> Add bindings and update documentation for clock rpmh driver on SC7280.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
