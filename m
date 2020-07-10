Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C0A21C0D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgGJXkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:40:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726369AbgGJXkG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:40:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E3C920657;
        Fri, 10 Jul 2020 23:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594424406;
        bh=DAcCdB1EgYPLqV9ciRpz31iFOWwYtcG3yvWjyBynQAs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mdqdIeyGsaecb+NfLxP/mF/ITnHBi+DpsR364mHWcd6/BqiuIOz5++NPvXjLiCFqR
         vBXfX1Uj3gNkljYBijL4C+IGnEPt57XOXbQfadxg36RIzp8Iqeud2EPWv+mM9Negv+
         rSjNJAijysO2V0mItKCh7XBxfI5fRovi4+rcVy7I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1593766722-28838-1-git-send-email-gokulsri@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org> <1593766722-28838-1-git-send-email-gokulsri@codeaurora.org>
Subject: Re: [v7 0/4] Add non PAS wcss Q6 support for QCS404
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org
Date:   Fri, 10 Jul 2020 16:40:05 -0700
Message-ID: <159442440535.1987609.2710208765230021853@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Gokul Sriram Palanisamy (2020-07-03 01:58:38)
> Changes since v6:
>  Removed duplicate structure entry added during rebase in v5

Please stop sending this as a reply to the previous series. Please see
point 15 in Documentation/process/submitting-patches.rst

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#expl=
icit-in-reply-to-headers
