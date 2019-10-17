Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC172DB437
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 19:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441116AbfJQRrY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 13:47:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:46122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441112AbfJQRrY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 13:47:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8024521D7A;
        Thu, 17 Oct 2019 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571334443;
        bh=8r2YwG+DenZby2ZUvPTts7WqqdZOYQmD4o4TPljS79I=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=oLaaEaM5fGQf2+URdUFblo2vhSbAVaESNQ1f/mmfid8b8DIkMqM/x3x/tmgTxUy+9
         ezOMijxmHrTo+wmkZlYPN85fWgLo3kTe7k30PTiESJVklTLXLJE0hVpmmoA9yYjSY9
         zobaaM8ygU1Fvh+DDsHl4JqcAWs+FXd/i0cdErLk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5f1ca3bfc45e268f7f9f6e091ba13b8103fb4304.1571314830.git.amit.kucheria@linaro.org>
References: <cover.1571314830.git.amit.kucheria@linaro.org> <5f1ca3bfc45e268f7f9f6e091ba13b8103fb4304.1571314830.git.amit.kucheria@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, daniel.lezcano@linaro.org,
        edubezval@gmail.com, ilina@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sudeep.holla@arm.com, tdas@codeaurora.org, viresh.kumar@linaro.org
Cc:     linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 5/6] clk: qcom: Initialise clock drivers earlier
User-Agent: alot/0.8.1
Date:   Thu, 17 Oct 2019 10:47:22 -0700
Message-Id: <20191017174723.8024521D7A@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-10-17 05:27:37)
> Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
> can have earlier access to cpufreq during booting.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

Makes me sad again.

