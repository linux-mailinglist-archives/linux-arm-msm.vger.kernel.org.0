Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE62631A915
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 01:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbhBMAxu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 19:53:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:57658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232439AbhBMAxh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 19:53:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC68A6186A;
        Sat, 13 Feb 2021 00:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613177572;
        bh=+DAUffEi160VQ+KixLevkehx+Inlyp7q/na71rcl4Oc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pijP0rfD3Ekbus0Uc5J11RV3RNJa3QqEyCPWC26iXM5PjPw35LgQlXBHdOEL39xH2
         YWva7Ii4rq40+T9jXDCjYbdsSsizWNKadqRZuTBGoOEaJx2VasfftmpICxa9AX3AJb
         uWVjM6RvoVnu10XxnK+v1a9G+4Yq54MTeA2BLHikwybYF74zq6Cpggd8OaHHPf9ZYH
         asEmdl++F3BSkpiby+HUKS6/Hyx9el4e1GkxhlqowT1So30X8CmbTjbq0H/QFSiX2L
         jW901bpZYD3/pDlqe7Yd4bt5+VB+Ks5CSap1SbqUkOEh9jwtJ4kg/NBj6xlGKSBUWZ
         LqhJ0Wzzb6sKQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612981579-17391-3-git-send-email-tdas@codeaurora.org>
References: <1612981579-17391-1-git-send-email-tdas@codeaurora.org> <1612981579-17391-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: Add Global Clock controller (GCC) driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 12 Feb 2021 16:52:50 -0800
Message-ID: <161317757069.1254594.967250585107370332@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-02-10 10:26:19)
> Add support for the global clock controller found on SC7280
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
