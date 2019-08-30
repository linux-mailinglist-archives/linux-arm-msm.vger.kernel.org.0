Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F151A2EF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 07:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfH3Fc4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 01:32:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:38064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727635AbfH3Fcz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 01:32:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30BCE2087F;
        Fri, 30 Aug 2019 05:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567142730;
        bh=DqiSWN3Cg+YWi7gm8pJ3TVJi3LuVX4/mHtRCT9Q7U/Y=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=Q2/08f1sRSuazV5XzINUGcA/uLN3s1haX/SDZ3QdT/8XpkNFLp4EdM3aLW1GFFjTL
         JNvexbJ42ppLjSSqjQKsyEqMuBxqbs9K55N5mB2RfaMCqfrzOy5IDabM90y7N+pAde
         gpVF7T5KVNktfdcbow+iYnq+xUe2DZNOScmgaRjk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829200340.15498-2-jorge.ramirez-ortiz@linaro.org>
References: <20190829200340.15498-1-jorge.ramirez-ortiz@linaro.org> <20190829200340.15498-2-jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs404: add the watchdog node
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com,
        robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 29 Aug 2019 22:25:29 -0700
Message-Id: <20190830052530.30BCE2087F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-08-29 13:03:40)
> Allows QCS404 based designs to enable watchdog support
>=20
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

