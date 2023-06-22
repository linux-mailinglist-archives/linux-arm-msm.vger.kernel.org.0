Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2960739E80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 12:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjFVKX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 06:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbjFVKXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 06:23:08 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8213B212A
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 03:22:28 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f64fb05a8aso9570921e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687429347; x=1690021347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kPKiuyN9lTn2LkZFVM0hiwkDKLitkiUuOZ5BrxWQ9JM=;
        b=VbQI4QlQql6NTE3CK6vOzMgaeeV7NW1krLgdhMVTPHSFmkonfA/KWeFi64sy9yRSa9
         WUaGbnhaJ1RSUyZbQ2fZaaQBxPsEHVBSn9bjIXwHdA/f9BjSo/kML4xI3dbZcthIQtqr
         7pqCPWZygL5QDOgRU1IIkSEkKC7Qbn+0UgZ2QTfk67U46C75l54cqTGL+u5jg8ZUVB0A
         AJ/azt9aI29oJrmWdHehsC6VmNOcEDkG9fvISBCYWgDuM+J9dqh+J6NNi9LBeycA4tWo
         BNVBPvExzXZ4K4CVLWh8QtSI2EJbdqL0UHN2RD+e4FepanCbNps4zG+rYlUK5GRBtBh2
         w/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687429347; x=1690021347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPKiuyN9lTn2LkZFVM0hiwkDKLitkiUuOZ5BrxWQ9JM=;
        b=GSb8pJRG3EUKGITR7kbGmmkfF4QoW3Xtg9PqpOxi7jWMo9kjrTOKazAAeA0/DEKs+N
         A61Qw3Ab+enr8684hvgP672vq5UskJDB522+6JoGCbw7zJkllHP1eMA7EYS6NuPgFE00
         d8Isp+2Vn5BVNdom+Jy++Nu7x7RXj2YQYS2A6V8U7T2uEG0OqC0BMbhge0w6TdmRBl2x
         LUS5TFC2SKAKjwN+3pgarDOfmzVf9r4e5/keSspW25qSV+DfxjSAI/WCRS80GIDifkuK
         tsa3sRDtG73LcHvK7puoSbGnh5eM9+ICeHvku7nQiQ3P4gF7oAD8gN+6G5h1hvM1uHYy
         1W6A==
X-Gm-Message-State: AC+VfDwF7vSAUsklyqZtPjzy7G2d+sRwUuySeTbQqOAQFkvef1dC8LUY
        NHAU1XRXjQcvs75mGFuKb1Ml3w==
X-Google-Smtp-Source: ACHHUZ76DdJUUP3DxprlEuqhHV0dMUceghkOayHt/bFjamB18quiILV7W/OOPRCuhZnD96eCgMJnzw==
X-Received: by 2002:a19:8c18:0:b0:4f4:fdb4:c76d with SMTP id o24-20020a198c18000000b004f4fdb4c76dmr12121954lfd.47.1687429346736;
        Thu, 22 Jun 2023 03:22:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s10-20020a5d69ca000000b003047ea78b42sm6652592wrw.43.2023.06.22.03.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 03:22:24 -0700 (PDT)
Date:   Thu, 22 Jun 2023 13:22:21 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, smatch@vger.kernel.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
Subject: Re: [PATCH 0/5] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <780f7135-cd3c-4c3f-802e-4aa0e7ec3413@kadam.mountain>
References: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
 <26a1858f-d428-a2ac-9ddd-115ba2d8becc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26a1858f-d428-a2ac-9ddd-115ba2d8becc@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 21, 2023 at 08:53:41PM -0600, Jeffrey Hugo wrote:
> On 6/21/2023 1:21 AM, Dan Carpenter wrote:
> > (I think this is the first cover letter I have ever written).
> > 
> > These patches are based on review and not from testing.
> 
> Thank you for your review.  I look forward to reading your patches and
> learning from them.
> 
> Did you use any kind of tooling?  If there is something we can add to our
> flow to bring up the quality, I would like to consider it.

I started reviewing this code because of an unpublished Smatch warning:

drivers/accel/qaic/qaic_control.c:379 encode_passthrough() warn: check that subtract can't underflow 'in_trans->hdr.len - 8' '0-3999968'

The warning message means that Smatch thinks in_trans->hdr.len can be
controlled by the user and is in the 0-3999968.  But from review it's
in increments of 8.  "0,8,16...3999968".

The other subtract underflow warnings are false positives except maybe
cx231xx_bulk_copy()?  The put_cmsg() and the bpf warnings are definitely
false positives.

drivers/accel/qaic/qaic_control.c:379 encode_passthrough() warn: check that subtract can't underflow 'in_trans->hdr.len - 8' '0-3999968'
drivers/media/usb/cx231xx/cx231xx-417.c:1355 cx231xx_bulk_copy() warn: check that subtract can't underflow 'buffer_size - 3' '0-4000000'
drivers/net/ethernet/microchip/sparx5/sparx5_packet.c:153 sparx5_xtr_grp() warn: check that subtract can't underflow 'byte_cnt - 4' '0'
drivers/net/ethernet/packetengines/hamachi.c:1504 hamachi_rx() warn: check that subtract can't underflow '(frame_status & 2047) - 4' '0-2047'
drivers/net/ethernet/packetengines/hamachi.c:1506 hamachi_rx() warn: check that subtract can't underflow '(frame_status & 2047) - 4' '0-2047'
drivers/net/ethernet/packetengines/hamachi.c:1520 hamachi_rx() warn: check that subtract can't underflow '(frame_status & 2047) - 4' '0-2047'
fs/ubifs/debug.c:334 ubifs_dump_node() warn: check that subtract can't underflow 'safe_len - 24' 's32min-(-1),25-2147483646'
fs/ubifs/debug.c:512 ubifs_dump_node() warn: check that subtract can't underflow 'safe_len - 48' 's32min-s32max'
kernel/bpf/bpf_iter.c:479 bpf_iter_link_fill_link_info() warn: check that subtract can't underflow 'ulen - 1' '0-1010101'
kernel/bpf/btf.c:7274 btf_get_info_by_fd() warn: check that subtract can't underflow 'uname_len - 1' '0-55'
kernel/bpf/syscall.c:3268 bpf_raw_tp_link_fill_link_info() warn: check that subtract can't underflow 'ulen - 1' '0-1010101'
net/compat.c:273 put_cmsg_compat() warn: check that subtract can't underflow 'cmlen - 12' 's32min-s32max'
net/core/scm.c:249 put_cmsg() warn: check that subtract can't underflow 'cmlen - 16' 's32min-s32max'

regards,
dan carpenter
