Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 287A0102EC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 23:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfKSWDI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 17:03:08 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35823 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfKSWDF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 17:03:05 -0500
Received: by mail-pg1-f196.google.com with SMTP id k32so6469245pgl.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 14:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=lj1qNNBolch+NbpAnk8H+IIrlbkx7LoT9MWhZMN3s2E=;
        b=RPsIyv3Q8mEjLbYmfUyyfrwTe39oWjo+ZTlWM2Cntu2oZ0xzIRkHyDSoWPYtWQ+/g6
         yhuVle0aoYfp04G6zoshvwh6i2akqGc7rhH94nWo008ySUbKW867wi7zTEm7B+vpgQoS
         ZWqtuPVDBqseIfOXKXys6NoIDAZ0oyJkTJius=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=lj1qNNBolch+NbpAnk8H+IIrlbkx7LoT9MWhZMN3s2E=;
        b=qQzAVtrevPKGkwDJUCtROVt6yve3Q0s7easQwBC2zhyT8DCW4uQ+kLTGWo7imgX4Tu
         zT9YOt3G1mI84vOdWAF/GZ+ufanuX4O/cJY10eEqWrE94ipavbLakcGmUiknBhtWW005
         FVqtQBQmLjI97410ubHtBrwPCDNeAhcRZgkDGkKLH19ZQ/YJQVEs7baoyyu8wsJ13vZT
         q788XHUTZBSMpsx/WHwerXMgfYnCVrUxMnA/xWbAz6Gq+MrvKgkeBYYGfLOyjMfTLfFj
         0xondDrwi+FGK44lC+KLqbC8EkAef7MVXwPkJYTQ6lYEj1JlWCJj3eFNgBc7wwz/QCSd
         T04g==
X-Gm-Message-State: APjAAAVCxgTEXoeoKgcv9n92773mTwoa/8rM84ea1VkLO5+q9dmZQ/wM
        LIaNzCPpm9CkSgpICo8wKxyARA==
X-Google-Smtp-Source: APXvYqzBLNs/OurKErbYIXm9x7thDIdy/HdhYX9tPE024BzYA2/wuo2LgR3m0rVnpYCGlXuLAfEWXg==
X-Received: by 2002:a63:3144:: with SMTP id x65mr993220pgx.283.1574200983404;
        Tue, 19 Nov 2019 14:03:03 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s13sm3397536pgp.73.2019.11.19.14.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 14:03:02 -0800 (PST)
Message-ID: <5dd46696.1c69fb81.c8ebb.7fbb@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-13-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-13-git-send-email-eberman@codeaurora.org>
Subject: Re: [PATCH v2 12/18] firmware: qcom_scm-32: Use qcom_scm_desc in non-atomic calls
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 14:03:01 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:48)
> Use qcom_scm_desc in non-atomic calls to remove legacy convention
> details from every SCM wrapper function.
>=20
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  drivers/firmware/qcom_scm-32.c | 283 +++++++++++++++++++++++++----------=
------
>  1 file changed, 172 insertions(+), 111 deletions(-)
>=20
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-3=
2.c
> index c3aeccf..4c287f6 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -39,6 +39,46 @@ static struct qcom_scm_entry qcom_scm_wb[] =3D {
> =20
>  static DEFINE_MUTEX(qcom_scm_lock);
> =20
> +#define MAX_QCOM_SCM_ARGS 10
> +#define MAX_QCOM_SCM_RETS 3
> +
> +enum qcom_scm_arg_types {
> +       QCOM_SCM_VAL,
> +       QCOM_SCM_RO,
> +       QCOM_SCM_RW,
> +       QCOM_SCM_BUFVAL,
> +};
> +
> +#define QCOM_SCM_ARGS_IMPL(num, a, b, c, d, e, f, g, h, i, j, ...) (\
> +                          (((a) & 0x3) << 4) | \
> +                          (((b) & 0x3) << 6) | \
> +                          (((c) & 0x3) << 8) | \
> +                          (((d) & 0x3) << 10) | \
> +                          (((e) & 0x3) << 12) | \
> +                          (((f) & 0x3) << 14) | \
> +                          (((g) & 0x3) << 16) | \
> +                          (((h) & 0x3) << 18) | \
> +                          (((i) & 0x3) << 20) | \
> +                          (((j) & 0x3) << 22) | \
> +                          ((num) & 0xf))
> +
> +#define QCOM_SCM_ARGS(...) QCOM_SCM_ARGS_IMPL(__VA_ARGS__, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0)
> +
> +/**
> + * struct qcom_scm_desc
> + * @arginfo:   Metadata describing the arguments in args[]
> + * @args:      The array of arguments for the secure syscall
> + * @res:       The values returned by the secure syscall

Please document all fields. 'res' looks like 'result' actually.

> + */
> +struct qcom_scm_desc {
> +       u32 svc;
> +       u32 cmd;
> +       u32 arginfo;
> +       u64 args[MAX_QCOM_SCM_ARGS];
> +       u64 result[MAX_QCOM_SCM_RETS];

I would split this out to be a pointer argument to the function so that
some callers can pass NULL and we can not waste time converting junk. It
would be good to also indicate how many result values we're expecting
back so that we don't try to access junk that hasn't changed.

> +       u32 owner;
> +};
> +
>  #define LEGACY_FUNCNUM(s, c)   (((s) << 10) | ((c) & 0x3ff))
> =20
>  /**
> @@ -135,16 +175,8 @@ static u32 __qcom_scm_call_do(u32 cmd_addr)
>  }
> =20
>  /**
> - * qcom_scm_call() - Send an SCM command
> - * @dev: struct device
> - * @svc_id: service identifier
> - * @cmd_id: command identifier
> - * @cmd_buf: command buffer
> - * @cmd_len: length of the command buffer
> - * @resp_buf: response buffer
> - * @resp_len: length of the response buffer
> - *
> - * Sends a command to the SCM and waits for the command to finish proces=
sing.
> + * qcom_scm_call() - Sends a command to the SCM and waits for the comman=
d to
> + * finish processing.

Please document arguments to this function.

>   *
>   * A note on cache maintenance:
>   * Note that any buffers that are expected to be accessed by the secure =
world
> @@ -153,15 +185,19 @@ static u32 __qcom_scm_call_do(u32 cmd_addr)
>   * and response buffers is taken care of by qcom_scm_call; however, call=
ers are
>   * responsible for any other cached buffers passed over to the secure wo=
rld.
>   */
> -static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
> -                        const void *cmd_buf, size_t cmd_len, void *resp_=
buf,
> -                        size_t resp_len)
> +static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
>  {
> +       int arglen =3D desc->arginfo & 0xf;

unsigned int? Or even u8?

>         int ret;
> +       size_t i;

Should be unsigned int and not size_t. size_t is for sizes.

>         struct qcom_scm_legacy_command *cmd;
>         struct qcom_scm_legacy_response *rsp;
> +       const size_t cmd_len =3D arglen * sizeof(__le32);
> +       const size_t resp_len =3D MAX_QCOM_SCM_RETS * sizeof(__le32);
>         size_t alloc_len =3D sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp=
_len;
>         dma_addr_t cmd_phys;
> +       __le32 *arg_buf;
> +       __le32 *res_buf;

const res_buf?

> =20
>         cmd =3D kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
>         if (!cmd)
> @@ -170,10 +206,11 @@ static int qcom_scm_call(struct device *dev, u32 sv=
c_id, u32 cmd_id,
>         cmd->len =3D cpu_to_le32(alloc_len);
>         cmd->buf_offset =3D cpu_to_le32(sizeof(*cmd));
>         cmd->resp_hdr_offset =3D cpu_to_le32(sizeof(*cmd) + cmd_len);
> +       cmd->id =3D cpu_to_le32(LEGACY_FUNCNUM(desc->svc, desc->cmd));
> =20
> -       cmd->id =3D cpu_to_le32(LEGACY_FUNCNUM(svc_id, cmd_id));
> -       if (cmd_buf)
> -               memcpy(legacy_get_command_buffer(cmd), cmd_buf, cmd_len);
> +       arg_buf =3D legacy_get_command_buffer(cmd);
> +       for (i =3D 0; i < arglen; i++)
> +               arg_buf[i] =3D cpu_to_le32(desc->args[i]);
> =20
>         rsp =3D legacy_command_to_response(cmd);
> =20
> @@ -196,13 +233,13 @@ static int qcom_scm_call(struct device *dev, u32 sv=
c_id, u32 cmd_id,
>                                         sizeof(*rsp), DMA_FROM_DEVICE);
>         } while (!rsp->is_complete);
> =20
> -       if (resp_buf) {
> -               dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cm=
d_len +
> -                                       le32_to_cpu(rsp->buf_offset),
> -                                       resp_len, DMA_FROM_DEVICE);
> -               memcpy(resp_buf, legacy_get_response_buffer(rsp),
> -                      resp_len);
> -       }
> +       dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len +
> +                               le32_to_cpu(rsp->buf_offset),
> +                               resp_len, DMA_FROM_DEVICE);
> +
> +       res_buf =3D legacy_get_response_buffer(rsp);
> +       for (i =3D 0; i < MAX_QCOM_SCM_RETS; i++)
> +               desc->result[i] =3D le32_to_cpu(res_buf[i]);
>  out:
>         dma_unmap_single(dev, cmd_phys, alloc_len, DMA_TO_DEVICE);
>         kfree(cmd);
> @@ -305,10 +342,10 @@ int __qcom_scm_set_warm_boot_addr(struct device *de=
v, void *entry,
>         int ret;
>         int flags =3D 0;
>         int cpu;
> -       struct {
> -               __le32 flags;
> -               __le32 addr;
> -       } cmd;
> +       struct qcom_scm_desc desc =3D {
> +               .svc =3D QCOM_SCM_SVC_BOOT,
> +               .cmd =3D QCOM_SCM_BOOT_SET_ADDR,
> +       };
> =20
>         /*
>          * Reassign only if we are switching from hotplug entry point
> @@ -324,10 +361,11 @@ int __qcom_scm_set_warm_boot_addr(struct device *de=
v, void *entry,
>         if (!flags)
>                 return 0;
> =20
> -       cmd.addr =3D cpu_to_le32(virt_to_phys(entry));
> -       cmd.flags =3D cpu_to_le32(flags);
> -       ret =3D qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_A=
DDR,
> -                           &cmd, sizeof(cmd), NULL, 0);
> +       desc.args[0] =3D flags;
> +       desc.args[1] =3D virt_to_phys(entry);
> +       desc.arginfo =3D QCOM_SCM_ARGS(2);

Would be good to only have on way of filling in the descriptor.

> +
> +       ret =3D qcom_scm_call(dev, &desc);
>         if (!ret) {
>                 for_each_cpu(cpu, cpus)
>                         qcom_scm_wb[cpu].entry =3D entry;
> @@ -353,26 +391,47 @@ void __qcom_scm_cpu_power_down(u32 flags)
>  int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd=
_id)
>  {
>         int ret;
> -       __le32 svc_cmd =3D cpu_to_le32(LEGACY_FUNCNUM(svc_id, cmd_id));
> -       __le32 ret_val =3D 0;
> +       struct qcom_scm_desc desc =3D {
> +               .svc =3D QCOM_SCM_SVC_INFO,
> +               .cmd =3D QCOM_SCM_INFO_IS_CALL_AVAIL,
> +               .args[0] =3D LEGACY_FUNCNUM(svc_id, cmd_id),
> +               .arginfo =3D QCOM_SCM_ARGS(1),
> +       };
> =20
> -       ret =3D qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CA=
LL_AVAIL,
> -                           &svc_cmd, sizeof(svc_cmd), &ret_val,
> -                           sizeof(ret_val));
> -       if (ret)
> -               return ret;
> +       ret =3D qcom_scm_call(dev, &desc);
> =20
> -       return le32_to_cpu(ret_val);
> +       return ret ? : desc.result[0];
>  }
> =20
>  int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *re=
q,
>                         u32 req_cnt, u32 *resp)
>  {
> +       int ret;
> +       struct qcom_scm_desc desc =3D {
> +               .svc =3D QCOM_SCM_SVC_HDCP,
> +               .cmd =3D QCOM_SCM_HDCP_INVOKE,
> +               .owner =3D ARM_SMCCC_OWNER_SIP,
> +       };
> +
>         if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
>                 return -ERANGE;
> =20
> -       return qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE,
> -               req, req_cnt * sizeof(*req), resp, sizeof(*resp));
> +       desc.args[0] =3D req[0].addr;
> +       desc.args[1] =3D req[0].val;
> +       desc.args[2] =3D req[1].addr;
> +       desc.args[3] =3D req[1].val;
> +       desc.args[4] =3D req[2].addr;
> +       desc.args[5] =3D req[2].val;
> +       desc.args[6] =3D req[3].addr;
> +       desc.args[7] =3D req[3].val;
> +       desc.args[8] =3D req[4].addr;
> +       desc.args[9] =3D req[4].val;

Is req_cnt always 5? Shouldn't this be some sort of while loop over
req_cnt to pack two values into desc.args[] from req?

> +       desc.arginfo =3D QCOM_SCM_ARGS(10);
> +
> +       ret =3D qcom_scm_call(dev, &desc);
> +       *resp =3D desc.result[0];
> +
> +       return ret;
>  }
> =20
>  void __qcom_scm_init(void)
> @@ -381,104 +440,107 @@ void __qcom_scm_init(void)
> =20
>  bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
>  {
> -       __le32 out;
> -       __le32 in;
>         int ret;
> +       struct qcom_scm_desc desc =3D {
> +               .svc =3D QCOM_SCM_SVC_PIL,
> +               .cmd =3D QCOM_SCM_PIL_PAS_IS_SUPPORTED,
> +               .owner =3D ARM_SMCCC_OWNER_SIP,

owner was passed before? Where is this coming from?

> +       };
> =20
> -       in =3D cpu_to_le32(peripheral);
> -       ret =3D qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
> -                           QCOM_SCM_PIL_PAS_IS_SUPPORTED,
> -                           &in, sizeof(in),
> -                           &out, sizeof(out));
> +       desc.args[0] =3D peripheral;
> +       desc.arginfo =3D QCOM_SCM_ARGS(1);
> =20
> -       return ret ? false : !!out;
> +       ret =3D qcom_scm_call(dev, &desc);
> +
> +       return ret ? false : !!desc.result[0];
>  }
> =20
