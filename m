Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF6760BC83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 23:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbiJXVvM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 17:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbiJXVum (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 17:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E8215820
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 13:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666641749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yAu84s8rk3cqzQWkUOACGj/hySV4th5LzQjIQBUH6pI=;
        b=KKKOSTSVeJfZxCtF1xe0Yl6FB+hzIGe2iUEZXEsIoJmTtvbOe12HjcI5esGDtHqeKapVZ5
        lEafO4HbeJBR2QGsADyhzryF1it68ps35pwCziKL5cU0f4xeyF0F7Q2aKFX7lsXyD9VFQo
        3wzjPUacfq0JSdt20XbmLRUy8R4kebc=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-61BlFFYtMWmL03xS4O1xnw-1; Mon, 24 Oct 2022 16:02:28 -0400
X-MC-Unique: 61BlFFYtMWmL03xS4O1xnw-1
Received: by mail-ot1-f69.google.com with SMTP id d4-20020a05683018e400b00661a05b6cf3so5924689otf.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 13:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAu84s8rk3cqzQWkUOACGj/hySV4th5LzQjIQBUH6pI=;
        b=l0yGLZlEDyt9wBiXsQ5Ki6b353Ym1UPJAzPbCfzbpFt5qLABOmdXPbz3gnhzJvL7zQ
         LZY4tZekPPW5bhcN0kHTQYTOlqjNDQNlEu+lKb6/1pJ6lR9xuctW7YtRq9d8PaWrB6ya
         kgNcRNpP+OZvifGdDGoXJ3nYFLuy+DVvGzO49LKIcImrkRKuERokT35+v7jKhZCCxSg7
         nu4/HT9aVAV+gSxDrZ76UDOvPD+QxnnEJZZ/SjDMZ5F8VQdqt30YUhzF6oqahc6w/KXQ
         Tr7T6Pu1MBc3zsDF8+y4GcWNNK4lS4WOATBWvloxUe++zgEhrFykzWnO5TSUFrFIJ3oR
         8hkQ==
X-Gm-Message-State: ACrzQf0rAZtp+DlYh9djwTTGY7mQF2ZLI53mwBcecLC1rz45DkSz5oI1
        HOIKqyLSWSf3vM43uutFUsvBr5q7f0sGKSSZQYao0jwq8VzMyCI6twbgwOY0mMz4rM5VoXOSdK+
        uT8Fpt4Gehz7AotSlFCmQQhEmqQ==
X-Received: by 2002:a05:6870:f202:b0:13b:c2c5:ed3d with SMTP id t2-20020a056870f20200b0013bc2c5ed3dmr3016219oao.252.1666641746026;
        Mon, 24 Oct 2022 13:02:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM54g8rhYLOuCJEYPTIti3cvvmXOtuSfRfS5sohQPzeU0IGnm6DuA2ng30T7rsaeW4R33wdz9Q==
X-Received: by 2002:a05:6870:f202:b0:13b:c2c5:ed3d with SMTP id t2-20020a056870f20200b0013bc2c5ed3dmr3016197oao.252.1666641745716;
        Mon, 24 Oct 2022 13:02:25 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id w16-20020a056830061000b006619f38a686sm154449oti.56.2022.10.24.13.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:02:25 -0700 (PDT)
Date:   Mon, 24 Oct 2022 15:02:22 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        echanude@redhat.com
Subject: Re: [PATCH 2/4] soc: qcom: pmic_glink: Introduce base PMIC GLINK
 driver
Message-ID: <20221024200222.vg7vhu7dfd3wlnkc@halaney-x13s>
References: <20220818031512.319310-1-bjorn.andersson@linaro.org>
 <20220818031512.319310-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818031512.319310-3-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 17, 2022 at 08:15:10PM -0700, Bjorn Andersson wrote:
> The PMIC GLINK service runs on one of the co-processors of some modern
> Qualcomm platforms and implements USB-C and battery managements. It uses
> a message based protocol over GLINK for communication with the OS, hence
> the name.
> 
> The driver implemented provides the rpmsg device for communication and
> uses auxilirary bus to spawn off individual devices in respsective
> subsystem. The auxilirary devices are spawned off from a
> platform_device, so that the drm_bridge is available early, to allow the
> DisplayPort driver to probe even before the remoteproc has spun up.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
<snip>
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> new file mode 100644
> index 000000000000..d42127521eca
> --- /dev/null
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -0,0 +1,336 @@
<snip>
> +
> +static void _devm_pmic_glink_release_client(struct device *dev, void *res)
> +{
> +	struct pmic_glink_client *client = *(struct pmic_glink_client **)res;

As Eric Chanudet pointed out to me, this should be:

	struct pmic_glink_client *client = (struct pmic_glink_client *)res;

Otherwise you get a splat like below (which somehow resulted in my
panel output not to work on my x13s... not sure of the connection
there, and is easily reproducible with a probe deferal or qcom_battmgr
unload):

        Unable to handle kernel NULL pointer dereference at virtual address 0000000000000958
        Mem abort info:
          ESR = 0x0000000096000004
          EC = 0x25: DABT (current EL), IL = 32 bits
          ESR = 0x0000000096000004
          EC = 0x25: DABT (current EL), IL = 32 bits
          SET = 0, FnV = 0
          EA = 0, S1PTW = 0
          FSC = 0x04: level 0 translation fault
        Data abort info:
          ISV = 0, ISS = 0x00000004
          CM = 0, WnR = 0
        user pgtable: 4k pages, 48-bit VAs, pgdp=0000000106b92000
        [0000000000000958] pgd=0000000000000000, p4d=0000000000000000
        Internal error: Oops: 96000004 [#1] PREEMPT SMP
        Modules linked in: llcc_qcom qcom_battmgr aes_ce_blk pmic_glink_altmode aes_ce_cipher ghash_ce gf128mul sha2_ce sha256_arm64 sha1_ce gpio_sbu_mux pmic_glink gpio_keys autofs4
        CPU: 2 PID: 182 Comm: kworker/u16:5 Not tainted 6.0.0-rc6 #29
        Hardware name: LENOVO 21BX0016US/21BX0016US, BIOS N3HET47W (1.19 ) 07/04/2022
        Workqueue: events_unbound deferred_probe_work_func
        pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
        pc : mutex_lock+0x1c/0x60
        lr : _devm_pmic_glink_release_client+0x2c/0x74 [pmic_glink]
        sp : ffff80000c553970
        x29: ffff80000c553970 x28: 0000000000000000 x27: 0000000000000000
        x26: ffffc297e181e0e8 x25: ffffc297e181d000 x24: ffffc2984efd9a80
        x23: ffffc2984ea7a008 x22: ffff1738863cc3a0 x21: ffff80000c553a28
        x20: 0000000000000958 x19: ffff1738863cc9f8 x18: ffffffffffffffff
        x17: 0000000000000000 x16: ffffc2984e1bb110 x15: 61622d6d6f63713d
        x14: ffffc2984f3b23e0 x13: 554e514553007972 x12: 0000000000000000
        x11: 00313731333d4d55 x10: 0000000000000000 x9 : ffffc297e181d1cc
        x8 : ffff80000c553910 x7 : 0000000000000000 x6 : 0000000080200016
        x5 : 0000000000000038 x4 : 0000000000000000 x3 : 0000000000000958
        x2 : ffff17388522c100 x1 : 0000000000000000 x0 : 0000000000000958
        Call trace:
         mutex_lock+0x1c/0x60
         release_nodes+0x68/0x100
         devres_release_all+0x94/0xf0
         device_unbind_cleanup+0x20/0x70
         device_release_driver_internal+0x214/0x260
         device_release_driver+0x20/0x30
         bus_remove_device+0xdc/0x170
         device_del+0x178/0x3ac
         pmic_glink_probe+0x1e8/0x240 [pmic_glink]
         platform_probe+0x70/0xcc
         really_probe+0xc8/0x3e0
         __driver_probe_device+0x84/0x190
         driver_probe_device+0x44/0x100
         __device_attach_driver+0xc4/0x160
         bus_for_each_drv+0x84/0xe0
         __device_attach+0xa4/0x1c4
         device_initial_probe+0x1c/0x30
         bus_probe_device+0xa4/0xb0
         deferred_probe_work_func+0xc0/0x114
         process_one_work+0x1ec/0x470
         worker_thread+0x74/0x410
         kthread+0xfc/0x110
         ret_from_fork+0x10/0x20
        Code: d5384102 d503201f d2800001 aa0103e4 (c8e47c02)
        ---[ end trace 0000000000000000 ]---

All credit to Eric[0] on that, I'm just tying up loose ends.

[0] https://gitlab.com/ahalaney/linux/-/commit/1819fbccd03de430d9fd4c58ded35f5be83e9aa8

Thanks,
Andrew

