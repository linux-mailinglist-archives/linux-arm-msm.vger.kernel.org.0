Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBF5117F633
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 12:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgCJLXf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 07:23:35 -0400
Received: from 8bytes.org ([81.169.241.247]:50822 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgCJLXf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 07:23:35 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id A6D8F364; Tue, 10 Mar 2020 12:23:33 +0100 (CET)
Date:   Tue, 10 Mar 2020 12:23:32 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        agross@kernel.org
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
Message-ID: <20200310112332.GG3794@8bytes.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309182255.20142-1-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

So the DMA accesses are initiated by the firmware and need to be direct
mapped? Which memory region do they access?

Regards,

	Joerg

