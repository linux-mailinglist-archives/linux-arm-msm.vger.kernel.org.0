Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26D8FA067D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 17:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfH1PlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 11:41:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:35806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbfH1PlY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 11:41:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56798208CB;
        Wed, 28 Aug 2019 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567006883;
        bh=TIiTAGG/qnJ/yRrZ5XnoY3ZPCGKTm7iqJL7Xyp+86BY=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=1t7js5wKA7Z6d6X7J0VvRt7W23lN4Cws4Ri6f1nmPWmEdf9F/QuqjmPth/MP3yOSa
         FwLnma9hyT1qmgQ6xVRz6/quEMDKVtnVc79rY8cVcSmTzsngVwJ6lmWqxYsgkYYz21
         fIuiRCsxUtvdlEUdsJ4ZeE3L51OWuCf6unK0Y2ZA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190823100622.3892-3-srinivas.kandagatla@linaro.org>
References: <20190823100622.3892-1-srinivas.kandagatla@linaro.org> <20190823100622.3892-3-srinivas.kandagatla@linaro.org>
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>,
        Abhinav Asati <asatiabhi@codeaurora.org>,
        Vamsi Singamsetty <vamssi@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/5] misc: fastrpc: Don't reference rpmsg_device after remove
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        gregkh@linuxfoundation.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 28 Aug 2019 08:41:22 -0700
Message-Id: <20190828154123.56798208CB@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2019-08-23 03:06:19)
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>=20
> As fastrpc_rpmsg_remove() returns the rpdev of the channel context is no
> longer a valid object, so ensure to update the channel context to no
> longer reference the old object and guard in the invoke code path
> against dereferencing it.
>=20
> TEST=3Dstop and start remote proc1 using sysfs

Remove this line? Looks like a chromiumism.

