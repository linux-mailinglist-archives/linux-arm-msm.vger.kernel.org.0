Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 805E92639AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 04:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730380AbgIJCAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 22:00:11 -0400
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:46986
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730073AbgIJBuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 21:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599701398;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=bUHJtAVwy1m2g9Edc5VcIqVaaUJ6RKEBA+YnhRba2CU=;
        b=C0VTPRon/XEWhUmwS8uG4rEEHnY6KNjExkolfJoHjhXRn53O7oksRp7XdEjOkuyT
        zdPQMsDkmvnbDCwVlmIxmq7dvoJr7APXmmBzEn+FkAxZU/mAlSfi4+7fJ9/CZxaa+jY
        PC9sjp/vrsamk0EsL7qz/eTOb6ARJ0JvbPzR9uVI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599701398;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=bUHJtAVwy1m2g9Edc5VcIqVaaUJ6RKEBA+YnhRba2CU=;
        b=h8ya8Gox3JnCq2DUQlaMHq9XYhxIr7znRyLVEs5mUK4PHZPTklyVIQljSpeLrJUI
        lqr8F+MT6rZ+mTW9akmr+QoRZuaaAXr53cQUEgQfyDWjVtGDCLAB5t/b6aHBZzLHrVs
        2nbzhQ+NVwhT2fYuNfkF5E49JWJhVcWUxl2KSot8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 10 Sep 2020 01:29:58 +0000
From:   nguyenb@codeaurora.org
To:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Supports Reading UFS's Vcc Voltage Levels from DT
In-Reply-To: <cover.1598939393.git.nguyenb@codeaurora.org>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
Message-ID: <0101017475a232b3-44f95537-e287-4e5c-b956-c0f8c56c1a3c-000000@us-west-2.amazonses.com>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.10-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-31 23:00, Bao D. Nguyen wrote:
> UFS's specification supports a range of Vcc operating voltages.
> Allows selecting the UFS Vcc operating voltage levels by reading
> the UFS's vcc-voltage-level in the device tree.
> 
> Bao D. Nguyen (2):
>   scsi: dt-bindings: ufs: Add vcc-voltage-level for UFS
>   scsi: ufs: Support reading UFS's Vcc voltage from device tree
> 
>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 ++
>  drivers/scsi/ufs/ufshcd-pltfrm.c                        | 15 
> ++++++++++++---
>  2 files changed, 14 insertions(+), 3 deletions(-)

Hello, please help review the change and comment if any.

Thanks!
Bao
