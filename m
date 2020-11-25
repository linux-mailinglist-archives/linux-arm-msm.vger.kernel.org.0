Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D540B2C3A82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 09:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727744AbgKYIJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 03:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbgKYIJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 03:09:12 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C919CC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 00:09:11 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id v14so1884622lfo.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 00:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NZnyawdNlTq6Y22Hl3rHzq60Mr9FD+1X9pwvV8wgyZk=;
        b=nXuadlnTzJJdASYmGxPYiY2J+LvJpwl1tKtOboV+OydO5w5rO0WjmOszDNrQDfHjiw
         +fTGzVWc4NRGkmPVfU1E0kwC+NhNveLYFkEI6ENbE6QT6VBdlkghEuHjB7HU7kQetRb5
         YU8l0hMNPgF+cwfFz3AXrG4u4mg8+e/emNEkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZnyawdNlTq6Y22Hl3rHzq60Mr9FD+1X9pwvV8wgyZk=;
        b=M94pfSyr+t7xqQUei0Dcgni2K6gLFvQj+j2w3XhXC2a6I+Y7g6mz4H+Hn0fKHrJ5Sh
         bu2wYU9Vgwoa2FDgqNrBRNLvkQjRDkCkt3cwF61W5StI6NH7ZphPLmIJVTlH8iL5QO+v
         1kF8MC2/gqD4npE0a6g/ZGStx0p4DEI5wRaa7et2jVqu7/VMkNN4nxKrDx/zG4DwMykU
         fQ0GxO7I3PmiC+ofkQplt56d2TogYf15K5wpSZoAGoVUT/NeyFkAgpnAMneWpi90ajXs
         NfZYFg1bAOIbiuZhQf+cxG3Pvu8JMzczDEF9GslL0VkojGHizvSLv/elDCX+MfAMkFuP
         K1GQ==
X-Gm-Message-State: AOAM533VzCP/qiVXPgKyyOiGLeOZEp5st2USjO8ASSvqgs/pFwIaBo7n
        QYygrMYkPzcdWHKjRswWL6rHi5sjtr1m1gLB
X-Google-Smtp-Source: ABdhPJw+50nSwX1ZlmfxKt/2Y0BJUmAs5pimeb97M8lXTK540tOD5EJ3y5Cvv6EaDig+WqQVC0Fcyg==
X-Received: by 2002:a19:42d2:: with SMTP id p201mr875937lfa.273.1606291749641;
        Wed, 25 Nov 2020 00:09:09 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id x20sm163751lfq.86.2020.11.25.00.09.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 00:09:08 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id l11so1902053lfg.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 00:09:08 -0800 (PST)
X-Received: by 2002:a19:7f55:: with SMTP id a82mr840705lfd.603.1606291747909;
 Wed, 25 Nov 2020 00:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org> <20201120001037.10032-4-stanimir.varbanov@linaro.org>
In-Reply-To: <20201120001037.10032-4-stanimir.varbanov@linaro.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 25 Nov 2020 17:08:57 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWsaHQtQYh8tQnGjwPCrCXeCnf08jL+yxM9ZkCBFNW5mg@mail.gmail.com>
Message-ID: <CAPBb6MWsaHQtQYh8tQnGjwPCrCXeCnf08jL+yxM9ZkCBFNW5mg@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: hfi_venus: Request interrupt for sync cmds
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 20, 2020 at 9:12 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> From: Vikash Garodia <vgarodia@codeaurora.org>
>
> For synchronous commands, update the message queue variable.
> This would inform video firmware to raise interrupt on host
> CPU whenever there is a response for such commands.
>
> Signed-off-by: Vikash Garodia <vgarodia@codeaurora.org>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus.c | 74 ++++++++++---------
>  1 file changed, 41 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 4be4a75ddcb6..b8fdb464ba9c 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -372,7 +372,7 @@ static void venus_soft_int(struct venus_hfi_device *hdev)
>  }
>
>  static int venus_iface_cmdq_write_nolock(struct venus_hfi_device *hdev,
> -                                        void *pkt)
> +                                        void *pkt, bool sync)
>  {
>         struct device *dev = hdev->core->dev;
>         struct hfi_pkt_hdr *cmd_packet;
> @@ -397,15 +397,23 @@ static int venus_iface_cmdq_write_nolock(struct venus_hfi_device *hdev,
>         if (rx_req)
>                 venus_soft_int(hdev);
>
> +       /* Inform video firmware to raise interrupt for synchronous commands */
> +       queue = &hdev->queues[IFACEQ_MSG_IDX];
> +       if (sync) {
> +               queue->qhdr->rx_req = 1;
> +               /* ensure rx_req is updated in memory */
> +               wmb();
> +       }

Wouldn't it be safer to do this before calling venus_soft_int()? I
don't know what the firmware is supposed to do with rx_req but
intuitively it looks like it should be set before we signal it.

> +
>         return 0;
>  }
>
> -static int venus_iface_cmdq_write(struct venus_hfi_device *hdev, void *pkt)
> +static int venus_iface_cmdq_write(struct venus_hfi_device *hdev, void *pkt, bool sync)
>  {
>         int ret;
>
>         mutex_lock(&hdev->lock);
> -       ret = venus_iface_cmdq_write_nolock(hdev, pkt);
> +       ret = venus_iface_cmdq_write_nolock(hdev, pkt, sync);
>         mutex_unlock(&hdev->lock);
>
>         return ret;
> @@ -428,7 +436,7 @@ static int venus_hfi_core_set_resource(struct venus_core *core, u32 id,
>         if (ret)
>                 return ret;
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -778,7 +786,7 @@ static int venus_sys_set_debug(struct venus_hfi_device *hdev, u32 debug)
>
>         pkt_sys_debug_config(pkt, HFI_DEBUG_MODE_QUEUE, debug);
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -795,7 +803,7 @@ static int venus_sys_set_coverage(struct venus_hfi_device *hdev, u32 mode)
>
>         pkt_sys_coverage_config(pkt, mode);
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -816,7 +824,7 @@ static int venus_sys_set_idle_message(struct venus_hfi_device *hdev,
>
>         pkt_sys_idle_indicator(pkt, enable);
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -834,7 +842,7 @@ static int venus_sys_set_power_control(struct venus_hfi_device *hdev,
>
>         pkt_sys_power_control(pkt, enable);
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -885,14 +893,14 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
>         return ret;
>  }
>
> -static int venus_session_cmd(struct venus_inst *inst, u32 pkt_type)
> +static int venus_session_cmd(struct venus_inst *inst, u32 pkt_type, bool sync)
>  {
>         struct venus_hfi_device *hdev = to_hfi_priv(inst->core);
>         struct hfi_session_pkt pkt;
>
>         pkt_session_cmd(&pkt, pkt_type, inst);
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, sync);
>  }
>
>  static void venus_flush_debug_queue(struct venus_hfi_device *hdev)
> @@ -922,7 +930,7 @@ static int venus_prepare_power_collapse(struct venus_hfi_device *hdev,
>
>         pkt_sys_pc_prep(&pkt);
>
> -       ret = venus_iface_cmdq_write(hdev, &pkt);
> +       ret = venus_iface_cmdq_write(hdev, &pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -1064,13 +1072,13 @@ static int venus_core_init(struct venus_core *core)
>
>         venus_set_state(hdev, VENUS_STATE_INIT);
>
> -       ret = venus_iface_cmdq_write(hdev, &pkt);
> +       ret = venus_iface_cmdq_write(hdev, &pkt, false);
>         if (ret)
>                 return ret;
>
>         pkt_sys_image_version(&version_pkt);
>
> -       ret = venus_iface_cmdq_write(hdev, &version_pkt);
> +       ret = venus_iface_cmdq_write(hdev, &version_pkt, false);
>         if (ret)
>                 dev_warn(dev, "failed to send image version pkt to fw\n");
>
> @@ -1099,7 +1107,7 @@ static int venus_core_ping(struct venus_core *core, u32 cookie)
>
>         pkt_sys_ping(&pkt, cookie);
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, false);
>  }
>
>  static int venus_core_trigger_ssr(struct venus_core *core, u32 trigger_type)
> @@ -1112,7 +1120,7 @@ static int venus_core_trigger_ssr(struct venus_core *core, u32 trigger_type)
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, false);
>  }
>
>  static int venus_session_init(struct venus_inst *inst, u32 session_type,
> @@ -1130,7 +1138,7 @@ static int venus_session_init(struct venus_inst *inst, u32 session_type,
>         if (ret)
>                 goto err;
>
> -       ret = venus_iface_cmdq_write(hdev, &pkt);
> +       ret = venus_iface_cmdq_write(hdev, &pkt, true);
>         if (ret)
>                 goto err;
>
> @@ -1151,7 +1159,7 @@ static int venus_session_end(struct venus_inst *inst)
>                         dev_warn(dev, "fw coverage msg ON failed\n");
>         }
>
> -       return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_END);
> +       return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_END, true);
>  }
>
>  static int venus_session_abort(struct venus_inst *inst)
> @@ -1160,7 +1168,7 @@ static int venus_session_abort(struct venus_inst *inst)
>
>         venus_flush_debug_queue(hdev);
>
> -       return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_ABORT);
> +       return venus_session_cmd(inst, HFI_CMD_SYS_SESSION_ABORT, true);
>  }
>
>  static int venus_session_flush(struct venus_inst *inst, u32 flush_mode)
> @@ -1173,22 +1181,22 @@ static int venus_session_flush(struct venus_inst *inst, u32 flush_mode)
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, true);
>  }
>
>  static int venus_session_start(struct venus_inst *inst)
>  {
> -       return venus_session_cmd(inst, HFI_CMD_SESSION_START);
> +       return venus_session_cmd(inst, HFI_CMD_SESSION_START, true);
>  }
>
>  static int venus_session_stop(struct venus_inst *inst)
>  {
> -       return venus_session_cmd(inst, HFI_CMD_SESSION_STOP);
> +       return venus_session_cmd(inst, HFI_CMD_SESSION_STOP, true);
>  }
>
>  static int venus_session_continue(struct venus_inst *inst)
>  {
> -       return venus_session_cmd(inst, HFI_CMD_SESSION_CONTINUE);
> +       return venus_session_cmd(inst, HFI_CMD_SESSION_CONTINUE, false);
>  }
>
>  static int venus_session_etb(struct venus_inst *inst,
> @@ -1205,7 +1213,7 @@ static int venus_session_etb(struct venus_inst *inst,
>                 if (ret)
>                         return ret;
>
> -               ret = venus_iface_cmdq_write(hdev, &pkt);
> +               ret = venus_iface_cmdq_write(hdev, &pkt, false);
>         } else if (session_type == VIDC_SESSION_TYPE_ENC) {
>                 struct hfi_session_empty_buffer_uncompressed_plane0_pkt pkt;
>
> @@ -1213,7 +1221,7 @@ static int venus_session_etb(struct venus_inst *inst,
>                 if (ret)
>                         return ret;
>
> -               ret = venus_iface_cmdq_write(hdev, &pkt);
> +               ret = venus_iface_cmdq_write(hdev, &pkt, false);
>         } else {
>                 ret = -EINVAL;
>         }
> @@ -1232,7 +1240,7 @@ static int venus_session_ftb(struct venus_inst *inst,
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, false);
>  }
>
>  static int venus_session_set_buffers(struct venus_inst *inst,
> @@ -1252,7 +1260,7 @@ static int venus_session_set_buffers(struct venus_inst *inst,
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, pkt);
> +       return venus_iface_cmdq_write(hdev, pkt, false);
>  }
>
>  static int venus_session_unset_buffers(struct venus_inst *inst,
> @@ -1272,17 +1280,17 @@ static int venus_session_unset_buffers(struct venus_inst *inst,
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, pkt);
> +       return venus_iface_cmdq_write(hdev, pkt, true);
>  }
>
>  static int venus_session_load_res(struct venus_inst *inst)
>  {
> -       return venus_session_cmd(inst, HFI_CMD_SESSION_LOAD_RESOURCES);
> +       return venus_session_cmd(inst, HFI_CMD_SESSION_LOAD_RESOURCES, true);
>  }
>
>  static int venus_session_release_res(struct venus_inst *inst)
>  {
> -       return venus_session_cmd(inst, HFI_CMD_SESSION_RELEASE_RESOURCES);
> +       return venus_session_cmd(inst, HFI_CMD_SESSION_RELEASE_RESOURCES, true);
>  }
>
>  static int venus_session_parse_seq_hdr(struct venus_inst *inst, u32 seq_hdr,
> @@ -1299,7 +1307,7 @@ static int venus_session_parse_seq_hdr(struct venus_inst *inst, u32 seq_hdr,
>         if (ret)
>                 return ret;
>
> -       ret = venus_iface_cmdq_write(hdev, pkt);
> +       ret = venus_iface_cmdq_write(hdev, pkt, false);
>         if (ret)
>                 return ret;
>
> @@ -1320,7 +1328,7 @@ static int venus_session_get_seq_hdr(struct venus_inst *inst, u32 seq_hdr,
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, pkt);
> +       return venus_iface_cmdq_write(hdev, pkt, false);
>  }
>
>  static int venus_session_set_property(struct venus_inst *inst, u32 ptype,
> @@ -1339,7 +1347,7 @@ static int venus_session_set_property(struct venus_inst *inst, u32 ptype,
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, pkt);
> +       return venus_iface_cmdq_write(hdev, pkt, false);
>  }
>
>  static int venus_session_get_property(struct venus_inst *inst, u32 ptype)
> @@ -1352,7 +1360,7 @@ static int venus_session_get_property(struct venus_inst *inst, u32 ptype)
>         if (ret)
>                 return ret;
>
> -       return venus_iface_cmdq_write(hdev, &pkt);
> +       return venus_iface_cmdq_write(hdev, &pkt, true);
>  }
>
>  static int venus_resume(struct venus_core *core)
> --
> 2.17.1
>
