Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF0D485D1A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 01:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343725AbiAFA0R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 19:26:17 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:47788 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343700AbiAFA0A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 19:26:00 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id DAA26CE2107;
        Thu,  6 Jan 2022 00:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C34CC36AE9;
        Thu,  6 Jan 2022 00:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641428756;
        bh=wA9iOtpjnhQVhGnW0oaGpuCdHikM6l2sCclZWGyYrmc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZWcuHAeyEQnUOvKG4bJBPH69iNDJVDJMtkUdXuLYRZnOyrACs4HqFRi7fgTx60pt2
         zeDa6jFtLZRgu7UMGVYt2lz5WkcffhXe3z3RA219shGFo0aP7NdT6/cVD6mpxejW5v
         MBzgKX2PmeywES/eYkyKTuigJGTdEqFqf/Vt3VudMIOCd0vjSwBQqdMzWZCSSpr0ms
         yuUsph+70/kbRi3BGQOTgRKkXq5Yy9TAMkdSOiUTPx69eNlY6kkmCgWH/nPjdtwK5v
         oe2Xn6rcMZfkHC3aRAmsiDrGaZIU3U3BavMSnEdYGsWH21FxS8vuc8Xc+8kzuyOxdH
         sB8qOxmKTIMtQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220105155705.698463-1-bjorn.andersson@linaro.org>
References: <20220105155705.698463-1-bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v5.17
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Wed, 05 Jan 2022 16:25:54 -0800
User-Agent: alot/0.9.1
Message-Id: <20220106002556.1C34CC36AE9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2022-01-05 07:57:05)
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0d=
bf:
>=20
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-5.17
>=20
> for you to fetch changes up to 96ea2a4291343613a7c2da03c03f23dc259171ff:
>=20
>   clk: qcom: turingcc-qcs404: explicitly include clk-provider.h (2021-12-=
20 23:14:50 -0600)
>=20
> ----------------------------------------------------------------
> Qualcomm clock updates for v5.17
>=20
> This introduces bindings and drivers for the global clock controllers
> found in SDX65, SM8450 and MSM8976, as well as RPMh clock support for
> SDX65 and SM8450.
>=20
> It cleans up the SMD RPM clock driver and it adds includes for
> clk-provider.h throughout the clock providers that was lacking this.
>=20
> ----------------------------------------------------------------

Please Cc linux-clk@ next time. I almost missed this.


> AngeloGioacchino Del Regno (1):
>       clk: qcom: Add MSM8976/56 Global Clock Controller (GCC) driver
>=20
> Bjorn Andersson (3):
>       MAINTAINERS: Add entry for Qualcomm clock drivers
>       Merge tag 'e15509b2b7c9b600ab38c5269d4fac609c077b5b.1638861860.git.=
quic_vamslank@quicinc.com' into clk-for-5.17
>       Merge tag '20211207114003.100693-2-vkoul@kernel.org' into clk-for-5=
.17

Next time can you merge branches with yourself instead of tags?

Otherwise, I pulled it into clk-next. Thanks.
