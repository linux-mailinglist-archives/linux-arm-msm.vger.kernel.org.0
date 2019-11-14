Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4EEFCB9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfKNRPr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:15:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:48194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726984AbfKNRPr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:15:47 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77870206F4;
        Thu, 14 Nov 2019 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573751746;
        bh=wqXw2GU/fWqyagYIshMsfzEUSC9I5oHEjWnEEo4D/6I=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=DDu+wkPJH5/e9q5cXcoO5DV4uFX6hDP8XyQRYx6WyPXASmYL0i5uR5v6SxXjYrFRL
         5nvbU4bOmJgcFa3FDyFo7HD6pbfeeS8rw6Td8R4h6+IEILsNzfouASCg4VN8x4oUEo
         muQi2TXUUAWkAAFbGZONRt8LasK6fh7gsdchQXx4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
References: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
To:     Harigovindan P <harigovi@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 0/2] Add suppport for rm69299 Visionox panel driver and add DSI config to support DSI version
User-Agent: alot/0.8.1
Date:   Thu, 14 Nov 2019 09:15:45 -0800
Message-Id: <20191114171546.77870206F4@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Harigovindan P (2019-11-14 02:16:26)
> Current patchset adds support for rm69299 visionox panel driver used in M=
SM reference platforms=20
> and also adds DSI config that supports the respective DSI version.
>=20
> The visionox panel driver supports a resolution of 1080x2248 with 4 lanes=
 and supports only single DSI mode.
>=20
> Current patchset is tested on actual panel.

Do you have the DT binding patch?

