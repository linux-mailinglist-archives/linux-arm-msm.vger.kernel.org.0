Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397B130D753
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 11:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbhBCKUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 05:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbhBCKUA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 05:20:00 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EE2C061573;
        Wed,  3 Feb 2021 02:19:19 -0800 (PST)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D17DB1F452BC;
        Wed,  3 Feb 2021 10:19:17 +0000 (GMT)
Date:   Wed, 3 Feb 2021 11:19:14 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210203111914.1c2f68f6@collabora.com>
In-Reply-To: <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
        <20210201151824.5a9dca4a@xps13>
        <20210202041614.GA840@work>
        <20210202091459.0c41a769@xps13>
        <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
        <20210203110522.12f2b326@xps13>
        <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 03 Feb 2021 15:42:02 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> >> 
> >> I got more information from the vendor, Telit. The access to the 3rd  
> >partition is protected by Trustzone and any access in non privileged
> >mode (where Linux kernel runs) causes kernel panic and the device
> >reboots. 

Out of curiosity, is it a per-CS-line thing or is this section
protected on all CS?

> >
> >Ok, so this is not a chip feature but more a host constraint.
> >
> >In this case it would be a good idea to add a host DT property which
> >describes the zone to avoid accessing it. Something like:
> >
> >	secure-area/secure-section = <start length>;
> >
> >From the core perspective, we should parse this property early enough
> >and return -EIO when trying to access this area.

FWIW, I'm not sure making it part of the core is a good idea, at least
not until we have a different platform with a same needs. The
controller driver can parse it and return -EACCESS (or -EIO) when this
section is accessed.
