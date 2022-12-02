Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF9F7640C33
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 18:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbiLBReI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 12:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbiLBReH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 12:34:07 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE53D8277
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 09:34:06 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso8986316pjt.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 09:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F+kDg8pnWdhoODSlyXLFl4q13rSFl5u7bcQ2rY8pPSM=;
        b=zihOs8S5OCorLfBIe7Wt2eOMRU2pH7z/KAphL0+cbozyh2yOF17tElnk8yjngPladw
         SMePyNt3gpvbImsB9jwJmbsaJNbrFPnoIO0Oa2JTK3MiFHMn9la1S7fxsKTA6A8D3s8M
         oL/6P0kb98Av/vmEin9K/vLAcj0a84WrYn/ooeplLtjyiR903xiO20jnXqBAGfyDIhFP
         oSubiZ3dMSJEEdO5mU8GMQ2iWsDcI+EsW2IwaY04CsDhssBx8nvNjbVFqPtAaMEOApZ+
         ymercCfWK6M0uyXmvYCcJwMAekcn7NhXmzq4xJ520RDSJCTshDN9ubxfH69ZhiFrVonF
         XkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+kDg8pnWdhoODSlyXLFl4q13rSFl5u7bcQ2rY8pPSM=;
        b=yz1lTV0oEwjtkyCXM4SV7GM5C4PMe/pUAKeXz3GySyrr4IMMTOymhTf8J2090u/wqT
         Nxo2QbCnsuGEjMyuYe71SmWhaIAcn3qaMGQXK3yL/x0yA1WxVZy6LWOc9pRyqSbGilLS
         tI9+nvZPip5+FcCJ31EhSvddnskKIYWPOwc+C57vZkOBVC6v4flpDi2YMOVgtshf7/do
         Y5h3P+gW3vSQ6vnxuueBF5LjkLmqxYgfUp3qk4cD60U3yyMiwSYek+FbNLczbKDHndv+
         QHzmhKN0QM1Pc9T0zNmaFhk9rX8wGMutsA6iAlgzXbP2Chqx7jvnjDhdVtKbS9vveRux
         ufTQ==
X-Gm-Message-State: ANoB5pks3OlWMiz1rOkZ5K9V6lBHy2lnevO5qJWO0v0w2MKp+dmm+MPe
        oywUk0zVa0X26SOKsfeD0cEB7Q==
X-Google-Smtp-Source: AA0mqf6qZcbm7VUYRyQFw0Z6xbzMhDHL56+CN8g5owHqH4MnNNy2tRnvQxZ62Jm9c5yWb1iW8Juk6g==
X-Received: by 2002:a17:902:8503:b0:178:4f50:673e with SMTP id bj3-20020a170902850300b001784f50673emr54304417plb.126.1670002446227;
        Fri, 02 Dec 2022 09:34:06 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a85e:8886:e9cb:3b71])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902650400b00176dc67df44sm5850373plk.132.2022.12.02.09.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:34:05 -0800 (PST)
Date:   Fri, 2 Dec 2022 10:34:03 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Maria Yu <quic_aiquny@quicinc.com>
Cc:     arnaud.pouliquen@foss.st.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, quic_clew@quicinc.com
Subject: Re: [PATCH v5 2/2] remoteproc: core: change to ordered workqueue for
 crash handler
Message-ID: <20221202173403.GD165812@p14s>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
 <20221202094532.2925-3-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202094532.2925-3-quic_aiquny@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 02, 2022 at 05:45:32PM +0800, Maria Yu wrote:
> Only the first detected crash needed to be handled, so change
> to ordered workqueue to avoid unnecessary multi active work at
> the same time. This will reduce the pm_relax unnecessary concurrency.
> 
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c2d0af048c69..4b973eea10bb 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2728,8 +2728,8 @@ static void __exit rproc_exit_panic(void)
>  
>  static int __init remoteproc_init(void)
>  {
> -	rproc_recovery_wq = alloc_workqueue("rproc_recovery_wq",
> -						WQ_UNBOUND | WQ_FREEZABLE, 0);
> +	rproc_recovery_wq = alloc_ordered_workqueue("rproc_recovery_wq",
> +						WQ_FREEZABLE, 0);

There is an indentation issue with the second line and this patch doesn't
compile:

  CC      drivers/remoteproc/imx_dsp_rproc.o
  AR      drivers/hwspinlock/built-in.a
In file included from /home/mpoirier/work/remoteproc/kernel-review/include/linux/rhashtable-types.h:15,
                 from /home/mpoirier/work/remoteproc/kernel-review/include/linux/ipc.h:7,
                 from /home/mpoirier/work/remoteproc/kernel-review/include/uapi/linux/sem.h:5,
                 from /home/mpoirier/work/remoteproc/kernel-review/include/linux/sem.h:5,
                 from /home/mpoirier/work/remoteproc/kernel-review/include/linux/sched.h:15,
                 from /home/mpoirier/work/remoteproc/kernel-review/include/linux/delay.h:23,
                 from /home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c:19:
/home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c: In function ‘remoteproc_init’:
/home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c:2738:46: warning: too many arguments for format [-Wformat-extra-args]
 2738 |  rproc_recovery_wq = alloc_ordered_workqueue("rproc_recovery_wq",
      |                                              ^~~~~~~~~~~~~~~~~~~
/home/mpoirier/work/remoteproc/kernel-review/include/linux/workqueue.h:419:18: note: in definition of macro ‘alloc_ordered_workqueue’
  419 |  alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED |  \
      |                  ^~~

Last but not least, please use the get_maintainer.pl script to make sure the
right people are CC'ed on your patchsets.

Thanks,
Mathieu

>  	if (!rproc_recovery_wq) {
>  		pr_err("remoteproc: creation of rproc_recovery_wq failed\n");
>  		return -ENOMEM;
> -- 
> 2.17.1
> 
