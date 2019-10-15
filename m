Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31AE8D74AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 13:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfJOLO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 07:14:57 -0400
Received: from 8bytes.org ([81.169.241.247]:47432 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfJOLO5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 07:14:57 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id F068B2D9; Tue, 15 Oct 2019 13:14:55 +0200 (CEST)
Date:   Tue, 15 Oct 2019 13:14:54 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com
Subject: Re: [PATCH v4 1/7] firmware: qcom: scm: Add function to set IOMMU
 pagetable addressing
Message-ID: <20191015111454.GG14518@8bytes.org>
References: <20191001220205.6423-1-kholk11@gmail.com>
 <20191001220205.6423-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001220205.6423-2-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 02, 2019 at 12:01:59AM +0200, kholk11@gmail.com wrote:
> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> 
> Add a function to change the IOMMU pagetable addressing to
> AArch32 LPAE or AArch64. If doing that, then this must be
> done for each IOMMU context (not necessarily at the same time).

This patch lacks a Signed-off-by.

