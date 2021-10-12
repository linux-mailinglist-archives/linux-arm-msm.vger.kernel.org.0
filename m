Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA1342AAFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 19:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbhJLRow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 13:44:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:56872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232771AbhJLRos (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 13:44:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E819060F3A;
        Tue, 12 Oct 2021 17:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634060567;
        bh=BA+06VWln97cmd/cHAx6KaJ8yiJBYdBzo79RKu0OPyQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mEeZFJGrNTMopaU9b1Yi2/WbnWwrdq4s4stQ8Qi/kAMJkTkieQCOkA4n1Yf3l6jjy
         tl+I00RKU4wX7MtCRakcCpK+afZPVHOUYgj5ui8iYxFvbkKbFt1BFvxuiMX/kIVHPS
         37Va+SNexppwM5VyU5SYyxr3a21231I9+RfCJXdhzKdvNe6Uwv4Vf2uAeHN+/zv/Es
         M32qw883xhqqOpuuCi9ikTAbUtfqOFqEtsu8r5An6mqfV+/Vh+SRb4cRsG+9svuEoI
         bWouJjAS9tmKrVgj4kL4Qgwi02cFCi5qldFUwLuDOsBvdzBHPaKcWDGOyFJOZUqH7B
         Rs6xepqy2QkQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1631860384-26608-8-git-send-email-quic_fenglinw@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-8-git-send-email-quic_fenglinw@quicinc.com>
Subject: Re: [RESEND PATCH v1 7/9] spmi: pmic-arb: support updating interrupt type flags
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org,
        quic_fenglinw@quicinc.com, Yimin Peng <yiminp@codeaurora.org>
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 10:42:45 -0700
Message-ID: <163406056577.936959.16157334001404276084@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-09-16 23:33:02)
> From: Yimin Peng <yiminp@codeaurora.org>
>=20
> Have the qpnpint_irq_set_type function clear unwanted high/low
> trigger bits when updating the interrupt flags.

Why?

>=20
> Signed-off-by: Yimin Peng <yiminp@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---

Does this need a Fixes tag?
