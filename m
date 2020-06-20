Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D167201F2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 02:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730865AbgFTAYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 20:24:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:44318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730293AbgFTAYr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 20:24:47 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F98B229C6;
        Sat, 20 Jun 2020 00:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592612687;
        bh=t6FiEKUyQwwPmP21ewU3QT+MeqZ3cGmyKJrOHQivwoY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=x2czNN8QuiCSlc8V7PNgapezEQIp97fTj0oiZDHp3wLql0XEWB/NXwcZhEhQZxryP
         od/jyddHjtotZquv6Ld1mKAIadygRgia/cwSsW1Mogo5iPjWm3YiuUoYxC+1dmxfJI
         yeFEyGYpAL+bsVMNa1Xx+NW67jXIinXLJCipKBWo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1591266927-24976-4-git-send-email-loic.poulain@linaro.org>
References: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org> <1591266927-24976-4-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Ilia Lin <ilialin@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org
Date:   Fri, 19 Jun 2020 17:24:46 -0700
Message-ID: <159261268661.62212.1093885194954752163@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-06-04 03:35:26)
> +
> +examples:
> +  # Example for msm8996
> +  - |
> +    kryocc: clock-controller@6400000 {
> +        compatible =3D "qcom,msm8996-apcc";
> +        reg =3D <0x6400000 0x90000>;
> +        #clock-cells =3D <1>;
> +  };

The spacing looks off here. Is it supposed to be spaces?

> +...
