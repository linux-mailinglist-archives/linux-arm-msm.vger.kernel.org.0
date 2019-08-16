Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE0290701
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2019 19:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbfHPRfO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Aug 2019 13:35:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:54318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727005AbfHPRfO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Aug 2019 13:35:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D0C32086C;
        Fri, 16 Aug 2019 17:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565976913;
        bh=KwRVVOrbytzGnxOURauAndFe+pfthF388DNgyyvGERk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xpQpUa2BQ0TqloUC1TlYy1EeGHiyVhpeP/kdEpmzeD87XGk3bB/a3CsWlqZ4ZJLX4
         clm9pfY59Kr3mcwsfTD0QxZwyX1v3TB6MSrl2Mg0ZxQUKBOVnNaskq2FD0MEOZUTQ/
         bAuMuZQ9A8Q3PE0oDC82fmx52XsZDpXJKeXJFAyA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190816135944.54232-1-yuehaibing@huawei.com>
References: <20190816135944.54232-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] clk: qcom: clk-rpm: remove unused code
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
To:     YueHaibing <yuehaibing@huawei.com>, agross@kernel.org,
        mturquette@baylibre.com
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 10:35:12 -0700
Message-Id: <20190816173513.7D0C32086C@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting YueHaibing (2019-08-16 06:59:44)
> drivers/clk/qcom/clk-rpm.c:453:29: warning:
>  clk_rpm_branch_ops defined but not used [-Wunused-const-variable=3D]
>=20
> It is never used, also the macros 'DEFINE_CLK_RPM_CXO_BRANCH'
> and 'DEFINE_CLK_RPM_CXO_BRANCH' are unused, so remove them.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Sorry, apparently we're leaving this code around for qcom folks to use
one day.

