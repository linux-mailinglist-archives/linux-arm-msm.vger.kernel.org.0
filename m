Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF93F38A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 20:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfKGTce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 14:32:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:38650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbfKGTce (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 14:32:34 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C6832087E;
        Thu,  7 Nov 2019 19:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573155153;
        bh=KnrB9jH8xxJGA6BBPG5vZtZ0+t6wCZSYeYgqwfk/5GM=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=c9HyN+7wlfxkFoBgze3aeUoNZDiu+stpGEn4lUKg0QiR486ffXgujnLtnu0UpC5wu
         vkytEI+Bgzm0HsdZqxeeVjajV/S0DIIf6d5IalNtrT8W2Pg6KzJLXzyV8o+5LgAoC+
         qD5sxryRwrjHuhcT4jK96npW4Sg/GggVEXGwfs6s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191011132928.9388-3-govinds@codeaurora.org>
References: <20191011132928.9388-1-govinds@codeaurora.org> <20191011132928.9388-3-govinds@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Govind Singh <govinds@codeaurora.org>, robh@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v4 2/2] clk: qcom: Add Q6SSTOP clock controller for QCS404
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 11:32:32 -0800
Message-Id: <20191107193233.5C6832087E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Govind Singh (2019-10-11 06:29:28)
> Add support for the Q6SSTOP clock control used on qcs404
> based devices. This would allow wcss remoteproc driver to
> control the required WCSS Q6SSTOP clock/reset controls to
> bring the subsystem out of reset and shutdown the WCSS Q6DSP.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---

Applied to clk-next

