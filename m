Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916001D24F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 03:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgENBvG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 21:51:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:60064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgENBvG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 21:51:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1412D20575;
        Thu, 14 May 2020 01:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589421066;
        bh=0wru+vLR+PKsYZiDISguXgZiNGQJCOCEIwPRIzMbnKM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=anbmIbHy2gGbGbbEEe2vDQKfzYG6FOJo49huXApgJyEJvl2xJVt2A5ExuwTQ1dq9X
         RacAWvfkmjYjajKVaJfznafrW7MTiXoFQyyjwBRJ5gyuNXzrPf91EZ9lt6VVf6jfqC
         iKpbvVVP0+M1D4KRc3Y3DNpuelI+XMtpGtqjCl7o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1588863647-17240-4-git-send-email-akashast@codeaurora.org>
References: <1588863647-17240-1-git-send-email-akashast@codeaurora.org> <1588863647-17240-4-git-send-email-akashast@codeaurora.org>
Subject: Re: [PATCH V6 3/3] dt-bindings: serial: Add binding for UART pin swap
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Date:   Wed, 13 May 2020 18:51:05 -0700
Message-ID: <158942106534.215346.10949293968508320961@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2020-05-07 08:00:47)
> Add documentation to support RX-TX & CTS-RTS GPIO pin swap in HW.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
