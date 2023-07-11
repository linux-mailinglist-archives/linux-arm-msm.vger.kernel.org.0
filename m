Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A134474E809
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 09:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbjGKHdX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 03:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjGKHdW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 03:33:22 -0400
X-Greylist: delayed 340 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 11 Jul 2023 00:33:21 PDT
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEB31A4;
        Tue, 11 Jul 2023 00:33:21 -0700 (PDT)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
        t=1689060181; bh=3MrvxpCCrw8Dk6+D34BZWEiOrubZ8Sj3J6bsLwQbQEo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iRRYm4VDIoP4/u0D4ntRKOXRZZXAtVbVOzqPnAjK4ljtgewDr4d+lgFfuQn/Gb0AA
         pMvuU48aSI1qisCiadjTAL8AbY2gx8Q8Ag6BPP7Cisrw/mnMjuD3Tc7WPQYG01oGxQ
         3vRLlpFcbOir9SJKspwVriLCi2awztx/7SIplIRmxeNDPK2P8neerZoxNk1s0z1q2/
         2VfdexXo+CL5uhnyoRrgcCJJmpMjKQ2ov62Y3FY8pLLUnIv2fFQB9O9+O3sHIOJiCd
         RF2zHQBK6Y+OY/OBkU5Z3TJ7iVO+2Fp8U/pGuseJtyEft9RMwsqDNSJooRoKVnZlHD
         F0SGdvyfsvr4g==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
        by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with SMTP id 36B7N7nH960621;
        Tue, 11 Jul 2023 10:23:08 +0300
Date:   Tue, 11 Jul 2023 10:23:07 +0300
From:   Dafna Hirschfeld <dhirschfeld@habana.ai>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 5/5 v3] accel/qaic: Fix a leak in map_user_pages()
Message-ID: <jhqia5lmifb6nsnmnxv3lf4x5irhpgkg6rx6oisuyjqwe4djd7@zvi5oyq65jeo>
References: <ZKzx5nA6Z/0yhBJj@moroto>
 <8666cc78-3e15-435e-9c4e-15502ac75bcd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <8666cc78-3e15-435e-9c4e-15502ac75bcd@moroto.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11.07.2023 09:13, Dan Carpenter wrote:
>If get_user_pages_fast() allocates some pages but not as many as we
>wanted, then the current code leaks those pages.  Call put_page() on
>the pages before returning.
>
>Fixes: 129776ac2e38 ("accel/qaic: Add control path")
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Dafna Hirschfeld <dhirschfeld@habana.ai>

>---
>no change
>
> drivers/accel/qaic/qaic_control.c | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
>index d5ce36cb351f..9a6f80f31c65 100644
>--- a/drivers/accel/qaic/qaic_control.c
>+++ b/drivers/accel/qaic/qaic_control.c
>@@ -425,9 +425,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
> 	}
>
> 	ret = get_user_pages_fast(xfer_start_addr, nr_pages, 0, page_list);
>-	if (ret < 0 || ret != nr_pages) {
>-		ret = -EFAULT;
>+	if (ret < 0)
> 		goto free_page_list;
>+	if (ret != nr_pages) {
>+		nr_pages = ret;
>+		ret = -EFAULT;
>+		goto put_pages;
> 	}
>
> 	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
>-- 
>2.39.2
>
