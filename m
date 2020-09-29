Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6744027C0FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 11:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgI2JWf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 05:22:35 -0400
Received: from ns.iliad.fr ([212.27.33.1]:53170 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727780AbgI2JWf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 05:22:35 -0400
X-Greylist: delayed 554 seconds by postgrey-1.27 at vger.kernel.org; Tue, 29 Sep 2020 05:22:34 EDT
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id C65262043B;
        Tue, 29 Sep 2020 11:13:19 +0200 (CEST)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id B628C20035;
        Tue, 29 Sep 2020 11:13:19 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] spmi: fix some coding style issues at the spmi
 core
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <cover.1601360391.git.mchehab+huawei@kernel.org>
 <fec878502147336cbf2cf86e476e9dd797cd7e6f.1601360391.git.mchehab+huawei@kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <f60e9ada-490d-10f9-6221-9a7d9eb054ba@free.fr>
Date:   Tue, 29 Sep 2020 11:13:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fec878502147336cbf2cf86e476e9dd797cd7e6f.1601360391.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Sep 29 11:13:19 2020 +0200 (CEST)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2020 08:22, Mauro Carvalho Chehab wrote:

> @@ -487,7 +489,7 @@ static void of_spmi_register_devices(struct spmi_controller *ctrl)
>  			continue;
>  
>  		sdev->dev.of_node = node;
> -		sdev->usid = (u8) reg[0];
> +		sdev->usid = (u8)reg[0];

typeof(sdev->usid) is u8.

What is the point of this cast?

Does GCC warn that u32 is being truncated to u8?

Regards.
