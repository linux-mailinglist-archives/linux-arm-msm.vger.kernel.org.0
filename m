Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5380C42AB12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 19:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbhJLRs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 13:48:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:58092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232496AbhJLRs1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 13:48:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C2D9610C9;
        Tue, 12 Oct 2021 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634060785;
        bh=szrDtDN8SFRsgr63/lHH9SsZQ4CR2+csIzO5damXYFc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O2T3SvqwxjKIOvld9YfyGk+DlnVabWhwI1ix+SFLh5+3Ok+kiFEUrMfsccsiRCuxf
         7flIL1OI9JDeJw4uscsa4fC/1G9h3AJEFhusyYoRWfhISUEHQWwuRGFQEmQluL+6+z
         Dvs+E6roXW2AMfRymBVfFeG03k8X+ONZ7KCHwzeo30jL34QEArow1xfE+Z16Ya04aV
         wU2fuy+7y4XjPNODFBhdnmNxVqo73e2BZ+HXAXYIB+sRncYdROgoB/d/3NzFwvTOYU
         hAvyDRAYV69TjxmpJMP+aSDd8nhXIj+LvoDmMq8j1dOW9yYXUURQ+8lqKHFO+1C2kP
         GmqewzcyfcoGA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1631860384-26608-2-git-send-email-quic_fenglinw@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com> <1631860384-26608-2-git-send-email-quic_fenglinw@quicinc.com>
Subject: Re: [RESEND PATCH v1 1/9] spmi: pmic-arb: add a print in cleanup_irq
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     collinsd@codeaurora.org, subbaram@codeaurora.org,
        quic_fenglinw@quicinc.com,
        Abhijeet Dharmapurikar <adharmap@codeaurora.org>
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 10:46:24 -0700
Message-ID: <163406078422.936959.12726677103787301939@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Fenglin Wu (2021-09-16 23:32:56)
> From: Abhijeet Dharmapurikar <adharmap@codeaurora.org>
>=20
> The cleanup_irq() was meant to clear and mask interrupts that were
> left enabled in the hardware but there was no interrupt handler
> registered for it. Add an error print when it gets invoked.

Why? Don't we get the genirq spurious irq message in this scenario?

>=20
> Signed-off-by: Abhijeet Dharmapurikar <adharmap@codeaurora.org>
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
