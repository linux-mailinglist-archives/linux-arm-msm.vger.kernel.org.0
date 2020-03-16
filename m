Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE02A186F1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731904AbgCPPuc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:50:32 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41330 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731890AbgCPPuc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=4Fcs/ravGQBzEwV+PwLN/3FuduA8sqVcdSOOMqzyw+E=; b=cZVHtxGt+DHwY530inZn5uaoAd
        NKYBLQCYm+jTGzzEtxEZZcghNZyQz3KZrzDd7pz5fIwHj8M1443PQzUVnDLn/hazE65KuoyeFpX4q
        SlRMMnPERZ+98066ISJv8PqhvKadqBvfmDLO8yR9v9I62OoyIKC9HSVz650f2PtsxYapCWFVbdZ5R
        f4Zrx1W+r/vsU+FwAD8cKpo9ZL8NyEpgdqr6xqK9E2SS96UpdcX+0mbPNpmGzTlROypcTsbmMtJ+v
        SIN/U5JGq9qiN3Kzq85xwDB29JrmkRYMtCWIIZ3wmAhwo4vIys/n0ZiMZfOMz5rdYneOW+8wr8bIu
        p6c7BDsw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jDs0a-0004dZ-Nu; Mon, 16 Mar 2020 15:50:28 +0000
Date:   Mon, 16 Mar 2020 08:50:28 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org,
        ohad@wizery.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        agross@kernel.org
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
Message-ID: <20200316155028.GB18704@infradead.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309182255.20142-1-sibis@codeaurora.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 09, 2020 at 11:52:52PM +0530, Sibi Sankar wrote:
> The Q6 modem sub-system has direct access to DDR through memnoc and
> an indirect access routed through a SMMU which MSS CE (crypto engine
> sub-component of MSS) uses during out of reset sequence. Request direct
> mapping for the modem-firmware subdevice since smmu is not expected
> to provide access control/translation for these SIDs (sandboxing of the
> modem is achieved through XPUs engaged using SMC calls).

Please fix your device tree so that the device isn't bound to an
IOMMU.
