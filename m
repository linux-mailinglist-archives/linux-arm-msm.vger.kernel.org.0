Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C396463FC9D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 01:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbiLBAMc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 19:12:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbiLBAMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 19:12:31 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8590CEF99
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 16:12:29 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id z24so3729878ljn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 16:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P8p0Z0zeTz3i1GFfP7TnrNV/siBjMEcrSAAgdFihh2s=;
        b=PZZabSocQzrzEETht1TzRFqTDjibqlc1QHcRGQjYir1wLVy8qvqa+SyHW1jxiJmvpp
         /0dYKiSzwz8OQXz68NS6iaS6uNXB5YsXAlmDmn2m9htZMg2RuXbsmifJ8f1rRYynjFrh
         zqCUiNubfMIuFUmX6/kdmzE0VDKUjbc2cNY90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8p0Z0zeTz3i1GFfP7TnrNV/siBjMEcrSAAgdFihh2s=;
        b=rlLF3lEfLOh7BxOEUfGQWxAoTWxegNbINUCKdXTne11nrn+GkQIdDr+3VnedcQrqKT
         UwlfBo2037Lh4ctK045pS6MwuVDEpQ+hrugHiapWvZ9dXzhB0XpHC1ishGHLQKdQLkpl
         DmJqzEZFXLxLMkuvLKVvnrcY+rhhbFLbINfVLbM3gyNSC9wksaMiGsHQRXyY93BYLWtS
         ENxG+pcdpvCjo6jOywTB1ge2YfnyBHwIP6aV8IC+eol4PXRzJ7V0OiC7fwFRn9gSvCL1
         2ClhmJ3Oz/YseoUT2wZ0/dxysKXN8b44EnFNWDBjckQ2sTMZXLkIaybjcwiPCNF96yTz
         QhEw==
X-Gm-Message-State: ANoB5pkSzH0yY392yNEiL47qJTHKFbveCw/XXaRT6zryno/rB9dr6sIw
        zUGXUBdJpbrty93g5J0QqHzWr5trzUUyyVQ8amtngQ==
X-Google-Smtp-Source: AA0mqf6SWLUf6ohVB+dVwukRPOdFAe9kAAGGi6mbnqGZi4xpM4mbOGdxvJDzhVaMqW3rCjNmU19YSegd0Ad8WPGtSs0=
X-Received: by 2002:a2e:b007:0:b0:279:8b4f:3aeb with SMTP id
 y7-20020a2eb007000000b002798b4f3aebmr11980670ljk.132.1669939947971; Thu, 01
 Dec 2022 16:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20221115121004.28197-1-quic_vboma@quicinc.com> <20221115121004.28197-2-quic_vboma@quicinc.com>
In-Reply-To: <20221115121004.28197-2-quic_vboma@quicinc.com>
From:   Nathan Hebert <nhebert@chromium.org>
Date:   Thu, 1 Dec 2022 16:12:16 -0800
Message-ID: <CANHAJhEH7qTjaVaMWk3MeuhYMnwt1qTUSKxAZ_XTfxPJObC=nQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] venus : Fix for H265 decoding failure.
To:     quic_vboma@quicinc.com
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 15, 2022 at 4:10 AM <quic_vboma@quicinc.com> wrote:
>
> From: Viswanath Boma <quic_vboma@quicinc.com>
>
> Aligned the mismatch of persist1 and scratch1 buffer calculation,
> as per the firmware requirements .
>
> Signed-off-by: Vikash Garodia <vgarodia@qti.qualcomm.com>
> Signed-off-by: Viswanath Boma <quic_vboma@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index ea25c451222b..a9be31ec6927 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> @@ -93,7 +93,7 @@
>  #define LCU_MIN_SIZE_PELS              16
>  #define SIZE_SEI_USERDATA              4096
>
> -#define H265D_MAX_SLICE                        600
> +#define H265D_MAX_SLICE                        3600
>  #define SIZE_H265D_HW_PIC_T            SIZE_H264D_HW_PIC_T
>  #define SIZE_H265D_BSE_CMD_PER_BUF     (16 * sizeof(u32))
>  #define SIZE_H265D_VPP_CMD_PER_BUF     256
> @@ -1021,7 +1021,7 @@ static u32 h264d_persist1_size(void)
>  static u32 h265d_persist1_size(void)
>  {
>         return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 + H265_NUM_TILE
> -                       * sizeof(u32)), HFI_DMA_ALIGNMENT);
> +                       * sizeof(u32) + NUM_HW_PIC_BUF * SIZE_SEI_USERDATA), HFI_DMA_ALIGNMENT);
>  }
>
>  static u32 vp8d_persist1_size(void)
> --
> 2.17.1
>
Hi Viswanath. I tested this patch on ChromiumOS's downstream
5.15-based fork. Using ITU-T HEVC test vectors [0] I am seeing
firmware errors "qcom-venus-decoder aa00000.video-codec:video-decoder:
VenusMed : event not sufficient resources". Does this change fix HEVC
decoding for you?

[0]: https://www.itu.int/wftp3/av-arch/jctvc-site/bitstream_exchange/draft_conformance/HEVC_v1/

Best regards,
Nathan Hebert
