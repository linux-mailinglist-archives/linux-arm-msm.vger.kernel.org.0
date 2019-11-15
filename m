Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4E7FE89C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 00:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfKOX10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 18:27:26 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35898 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbfKOX10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 18:27:26 -0500
Received: by mail-pl1-f194.google.com with SMTP id d7so5710867pls.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 15:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=R5Jq7LswKTFskMfbB4jD5M/3Va85xCk/mpxWDcwqRJc=;
        b=ahA/T4iyUOUxg1QYcRNZkpvcm7U6DZpYQMQsy+EHwts3tsERGfFTLOT6AMsPatJW1T
         uA7cD/+xYWVBEeRKntR5ADvVJQDF0ijsuYLp4emF2N0sY9Txheivmpyjj4tXKUDPhBZf
         qtt391cI+xWkkcouAKq7sz3PLzU2AmVY4KNps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=R5Jq7LswKTFskMfbB4jD5M/3Va85xCk/mpxWDcwqRJc=;
        b=hMLqCUyprZy3rqy8seKQDHsWRq4kyqoxqSeQMrGsmuXV2RsRME7ut7AShK+lNvKwep
         immBuFeQM/Iq0vHRv54SgJYJWwX+hJzItsD8oIAcip3RWttpGoR63Heff5x6m+Oiu0eR
         B05Bo8jr9UESx7PcoYPscDeAo09q9oLnrFQN3LXBUi4Mlke4LGZc0b/QALuanjCTJuC8
         LdKVcpMf2LRVks390aU25bDZE/YhYsJd4mZdRv0woyeB+7HyqZl2ukuX/y9RdfGgzPnG
         ZyvVT+A4PWEBJy6FTG+vfxsVB3IJ0NhSkWaG2S1Tp4QyTh6TQzjEVuu/UHMZA0CV8VBu
         6mBg==
X-Gm-Message-State: APjAAAUYkmAXtKkBGBdF1NA2+58FDfnNKQ9X0y95OIRqIAHx3jR/24X4
        TigScRZ0ehsxjZMPqQv9/c+J1g==
X-Google-Smtp-Source: APXvYqy/lEPjCERxDDum1wq26E0BRyguUbPch7OWhWnFuJPr34YU+/6jZuAQjbx2D+GxmIM7jkYa7A==
X-Received: by 2002:a17:90a:b116:: with SMTP id z22mr22712318pjq.38.1573860444456;
        Fri, 15 Nov 2019 15:27:24 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u24sm10367194pgf.6.2019.11.15.15.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 15:27:23 -0800 (PST)
Message-ID: <5dcf345b.1c69fb81.df1ea.f7f6@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573593774-12539-2-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org> <1573593774-12539-2-git-send-email-eberman@codeaurora.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Elliot Berman <eberman@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2 01/18] firmware: qcom_scm: Rename macros and structures
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 15:27:22 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Elliot Berman (2019-11-12 13:22:37)
> Rename legacy-specific structures and macros with legacy prefix; rename
> smccc-specific structures and macros with smccc prefix.

Yes that's what's happening in the patch, but there isn't the most
important part in the commit text here, which is _why_ this change is
meaningful. Presumably the reason is to clearly separate the original
SCM calling convention from the newer SCM calling conventions.

>=20
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  drivers/firmware/qcom_scm-32.c | 70 ++++++++++++++++++++++--------------=
------
>  drivers/firmware/qcom_scm-64.c | 53 ++++++++++++++++----------------
>  2 files changed, 64 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-3=
2.c
> index bee8729..5d52641 100644
> --- a/drivers/firmware/qcom_scm-32.c
> +++ b/drivers/firmware/qcom_scm-32.c
> @@ -39,22 +39,22 @@ static struct qcom_scm_entry qcom_scm_wb[] =3D {
>  static DEFINE_MUTEX(qcom_scm_lock);
> =20
>  /**
> - * struct qcom_scm_command - one SCM command buffer
> + * struct qcom_scm_legacy_command - one SCM command buffer
>   * @len: total available memory for command and response
>   * @buf_offset: start of command buffer
>   * @resp_hdr_offset: start of response buffer
>   * @id: command to be executed
> - * @buf: buffer returned from qcom_scm_get_command_buffer()
> + * @buf: buffer returned from legacy_get_command_buffer()

I'd prefer to keep qcom_ or at least scm_ somewhere in the name. Just
plain legacy_ is too generic.

>   *
>   * An SCM command is laid out in memory as follows:
>   *
> - *     ------------------- <--- struct qcom_scm_command
> + *     ------------------- <--- struct qcom_scm_legacy_command
>   *     | command header  |
> - *     ------------------- <--- qcom_scm_get_command_buffer()
> + *     ------------------- <--- legacy_get_command_buffer()
>   *     | command buffer  |
> - *     ------------------- <--- struct qcom_scm_response and
> - *     | response header |      qcom_scm_command_to_response()
> - *     ------------------- <--- qcom_scm_get_response_buffer()
> + *     ------------------- <--- struct qcom_scm_legacy_response and
> + *     | response header |      legacy_command_to_response()
> + *     ------------------- <--- legacy_get_response_buffer()
>   *     | response buffer |
>   *     -------------------
>   *
> @@ -62,7 +62,7 @@ static DEFINE_MUTEX(qcom_scm_lock);
>   * you should always use the appropriate qcom_scm_get_*_buffer() routines

Shouldn't this comment be updated too to say "legacy"?

>   * to access the buffers in a safe manner.
>   */
> -struct qcom_scm_command {
> +struct qcom_scm_legacy_command {

Like here, it's called qcom_scm_legacy_<foo> so maybe that should be how
it works.


>         __le32 len;
>         __le32 buf_offset;
>         __le32 resp_hdr_offset;
> @@ -71,52 +71,55 @@ struct qcom_scm_command {
>  };
> =20
>  /**
> - * struct qcom_scm_response - one SCM response buffer
> + * struct qcom_scm_legacy_response - one SCM response buffer
>   * @len: total available memory for response
> - * @buf_offset: start of response data relative to start of qcom_scm_res=
ponse
> + * @buf_offset: start of response data relative to start of
> + *              qcom_scm_legacy_response
>   * @is_complete: indicates if the command has finished processing
>   */
> -struct qcom_scm_response {
> +struct qcom_scm_legacy_response {
>         __le32 len;
>         __le32 buf_offset;
>         __le32 is_complete;
>  };
> =20
>  /**
> - * qcom_scm_command_to_response() - Get a pointer to a qcom_scm_response
> + * legacy_command_to_response() - Get a pointer to a qcom_scm_legacy_res=
ponse
>   * @cmd: command
>   *
>   * Returns a pointer to a response for a command.
>   */
> -static inline struct qcom_scm_response *qcom_scm_command_to_response(
> -               const struct qcom_scm_command *cmd)
> +static inline struct qcom_scm_legacy_response *legacy_command_to_respons=
e(
> +               const struct qcom_scm_legacy_command *cmd)
>  {
>         return (void *)cmd + le32_to_cpu(cmd->resp_hdr_offset);
>  }
> =20
>  /**
> - * qcom_scm_get_command_buffer() - Get a pointer to a command buffer
> + * legacy_get_command_buffer() - Get a pointer to a command buffer
>   * @cmd: command
>   *
>   * Returns a pointer to the command buffer of a command.
>   */
> -static inline void *qcom_scm_get_command_buffer(const struct qcom_scm_co=
mmand *cmd)
> +static inline void *legacy_get_command_buffer(
> +               const struct qcom_scm_legacy_command *cmd)
>  {
>         return (void *)cmd->buf;
>  }
> =20
>  /**
> - * qcom_scm_get_response_buffer() - Get a pointer to a response buffer
> + * legacy_get_response_buffer() - Get a pointer to a response buffer
>   * @rsp: response
>   *
>   * Returns a pointer to a response buffer of a response.
>   */
> -static inline void *qcom_scm_get_response_buffer(const struct qcom_scm_r=
esponse *rsp)
> +static inline void *legacy_get_response_buffer(
> +               const struct qcom_scm_legacy_response *rsp)
>  {
>         return (void *)rsp + le32_to_cpu(rsp->buf_offset);
>  }
> =20
> -static u32 smc(u32 cmd_addr)
> +static u32 __qcom_scm_call_do(u32 cmd_addr)
>  {
>         int context_id;
>         register u32 r0 asm("r0") =3D 1;
> @@ -164,8 +167,8 @@ static int qcom_scm_call(struct device *dev, u32 svc_=
id, u32 cmd_id,
>                          size_t resp_len)
>  {
>         int ret;
> -       struct qcom_scm_command *cmd;
> -       struct qcom_scm_response *rsp;
> +       struct qcom_scm_legacy_command *cmd;
> +       struct qcom_scm_legacy_response *rsp;
>         size_t alloc_len =3D sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp=
_len;
>         dma_addr_t cmd_phys;
> =20
> @@ -179,9 +182,9 @@ static int qcom_scm_call(struct device *dev, u32 svc_=
id, u32 cmd_id,
> =20
>         cmd->id =3D cpu_to_le32((svc_id << 10) | cmd_id);
>         if (cmd_buf)
> -               memcpy(qcom_scm_get_command_buffer(cmd), cmd_buf, cmd_len=
);
> +               memcpy(legacy_get_command_buffer(cmd), cmd_buf, cmd_len);
> =20
> -       rsp =3D qcom_scm_command_to_response(cmd);
> +       rsp =3D legacy_command_to_response(cmd);
> =20
>         cmd_phys =3D dma_map_single(dev, cmd, alloc_len, DMA_TO_DEVICE);
>         if (dma_mapping_error(dev, cmd_phys)) {
> @@ -190,7 +193,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_=
id, u32 cmd_id,
>         }
> =20
>         mutex_lock(&qcom_scm_lock);
> -       ret =3D smc(cmd_phys);
> +       ret =3D __qcom_scm_call_do(cmd_phys);

What is this change about? Is it confusing to have a function called
'smc'? Please mention why this should change in the commit text.

>         if (ret < 0)
>                 ret =3D qcom_scm_remap_error(ret);
>         mutex_unlock(&qcom_scm_lock);
> @@ -206,7 +209,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_=
id, u32 cmd_id,
>                 dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cm=
d_len +
>                                         le32_to_cpu(rsp->buf_offset),
>                                         resp_len, DMA_FROM_DEVICE);
> -               memcpy(resp_buf, qcom_scm_get_response_buffer(rsp),
> +               memcpy(resp_buf, legacy_get_response_buffer(rsp),
>                        resp_len);
>         }
>  out:
> @@ -215,11 +218,12 @@ static int qcom_scm_call(struct device *dev, u32 sv=
c_id, u32 cmd_id,
>         return ret;
>  }
> =20
> -#define SCM_CLASS_REGISTER     (0x2 << 8)
> -#define SCM_MASK_IRQS          BIT(5)
> -#define SCM_ATOMIC(svc, cmd, n) (((((svc) << 10)|((cmd) & 0x3ff)) << 12)=
 | \
> -                               SCM_CLASS_REGISTER | \
> -                               SCM_MASK_IRQS | \
> +#define LEGACY_CLASS_REGISTER          (0x2 << 8)
> +#define LEGACY_MASK_IRQS               BIT(5)
> +#define LEGACY_ATOMIC_ID(svc, cmd, n) \
> +                               (((((svc) << 10)|((cmd) & 0x3ff)) << 12) =
| \
> +                               LEGACY_CLASS_REGISTER | \
> +                               LEGACY_MASK_IRQS | \
>                                 (n & 0xf))
> =20
>  /**
> @@ -235,7 +239,7 @@ static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u3=
2 arg1)
>  {
>         int context_id;
> =20
> -       register u32 r0 asm("r0") =3D SCM_ATOMIC(svc, cmd, 1);
> +       register u32 r0 asm("r0") =3D LEGACY_ATOMIC_ID(svc, cmd, 1);
>         register u32 r1 asm("r1") =3D (u32)&context_id;
>         register u32 r2 asm("r2") =3D arg1;
> =20
> @@ -268,7 +272,7 @@ static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u3=
2 arg1, u32 arg2)
>  {
>         int context_id;
> =20
> -       register u32 r0 asm("r0") =3D SCM_ATOMIC(svc, cmd, 2);
> +       register u32 r0 asm("r0") =3D LEGACY_ATOMIC_ID(svc, cmd, 2);
>         register u32 r1 asm("r1") =3D (u32)&context_id;
>         register u32 r2 asm("r2") =3D arg1;
>         register u32 r3 asm("r3") =3D arg2;

Is this hunk really necessary? The defines are local to the file.

> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-6=
4.c
> index 7686786..8226b94 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -14,7 +14,7 @@
> =20
>  #include "qcom_scm.h"
> =20
> -#define QCOM_SCM_FNID(s, c) ((((s) & 0xFF) << 8) | ((c) & 0xFF))
> +#define SMCCC_FUNCNUM(s, c) ((((s) & 0xFF) << 8) | ((c) & 0xFF))

Is this generic? Maybe it should go into the SMCCC file then if it isn't
qcom specific? Otherwise, please leave QCOM in the name.

> =20
>  #define MAX_QCOM_SCM_ARGS 10
>  #define MAX_QCOM_SCM_RETS 3
> @@ -58,11 +58,11 @@ static DEFINE_MUTEX(qcom_scm_lock);
>  #define QCOM_SCM_EBUSY_WAIT_MS 30
>  #define QCOM_SCM_EBUSY_MAX_RETRY 20
> =20
> -#define N_EXT_QCOM_SCM_ARGS 7
> -#define FIRST_EXT_ARG_IDX 3
> -#define N_REGISTER_ARGS (MAX_QCOM_SCM_ARGS - N_EXT_QCOM_SCM_ARGS + 1)
> +#define SMCCC_N_EXT_ARGS 7
> +#define SMCCC_FIRST_EXT_IDX 3
> +#define SMCCC_N_REG_ARGS (MAX_QCOM_SCM_ARGS - SMCCC_N_EXT_ARGS + 1)
> =20
> -static void __qcom_scm_call_do(const struct qcom_scm_desc *desc,
> +static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
>                                struct arm_smccc_res *res, u32 fn_id,
>                                u64 x5, u32 type)
>  {

From here....

> @@ -85,22 +85,23 @@ static void __qcom_scm_call_do(const struct qcom_scm_=
desc *desc,
>         } while (res->a0 =3D=3D QCOM_SCM_INTERRUPTED);
>  }
> =20
> -static void qcom_scm_call_do(const struct qcom_scm_desc *desc,
> +static void qcom_scm_call_do_smccc(const struct qcom_scm_desc *desc,
>                              struct arm_smccc_res *res, u32 fn_id,
>                              u64 x5, bool atomic)
>  {
>         int retry_count =3D 0;
> =20
>         if (atomic) {
> -               __qcom_scm_call_do(desc, res, fn_id, x5, ARM_SMCCC_FAST_C=
ALL);
> +               __qcom_scm_call_do_quirk(desc, res, fn_id, x5,
> +                                        ARM_SMCCC_FAST_CALL);
>                 return;
>         }
> =20
>         do {
>                 mutex_lock(&qcom_scm_lock);
> =20
> -               __qcom_scm_call_do(desc, res, fn_id, x5,
> -                                  ARM_SMCCC_STD_CALL);
> +               __qcom_scm_call_do_quirk(desc, res, fn_id, x5,
> +                                        ARM_SMCCC_STD_CALL);
> =20
>                 mutex_unlock(&qcom_scm_lock);
> =20
> @@ -112,21 +113,21 @@ static void qcom_scm_call_do(const struct qcom_scm_=
desc *desc,
>         }  while (res->a0 =3D=3D QCOM_SCM_V2_EBUSY);
>  }
> =20
> -static int ___qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
> -                           const struct qcom_scm_desc *desc,
> -                           struct arm_smccc_res *res, bool atomic)
> +static int ___qcom_scm_call_smccc(struct device *dev, u32 svc_id, u32 cm=
d_id,
> +                                 const struct qcom_scm_desc *desc,
> +                                 struct arm_smccc_res *res, bool atomic)
>  {
>         int arglen =3D desc->arginfo & 0xf;
>         int i;
> -       u32 fn_id =3D QCOM_SCM_FNID(svc_id, cmd_id);
> -       u64 x5 =3D desc->args[FIRST_EXT_ARG_IDX];
> +       u32 fn_id =3D SMCCC_FUNCNUM(svc_id, cmd_id);
> +       u64 x5 =3D desc->args[SMCCC_FIRST_EXT_IDX];
>         dma_addr_t args_phys =3D 0;
>         void *args_virt =3D NULL;
>         size_t alloc_len;
>         gfp_t flag =3D atomic ? GFP_ATOMIC : GFP_KERNEL;
> =20
> -       if (unlikely(arglen > N_REGISTER_ARGS)) {
> -               alloc_len =3D N_EXT_QCOM_SCM_ARGS * sizeof(u64);
> +       if (unlikely(arglen > SMCCC_N_REG_ARGS)) {
> +               alloc_len =3D SMCCC_N_EXT_ARGS * sizeof(u64);
>                 args_virt =3D kzalloc(PAGE_ALIGN(alloc_len), flag);
> =20
>                 if (!args_virt)
> @@ -135,15 +136,15 @@ static int ___qcom_scm_call(struct device *dev, u32=
 svc_id, u32 cmd_id,
>                 if (qcom_smccc_convention =3D=3D ARM_SMCCC_SMC_32) {
>                         __le32 *args =3D args_virt;
> =20
> -                       for (i =3D 0; i < N_EXT_QCOM_SCM_ARGS; i++)
> +                       for (i =3D 0; i < SMCCC_N_EXT_ARGS; i++)
>                                 args[i] =3D cpu_to_le32(desc->args[i +
> -                                                     FIRST_EXT_ARG_IDX]);
> +                                                     SMCCC_FIRST_EXT_IDX=
]);
>                 } else {
>                         __le64 *args =3D args_virt;
> =20
> -                       for (i =3D 0; i < N_EXT_QCOM_SCM_ARGS; i++)
> +                       for (i =3D 0; i < SMCCC_N_EXT_ARGS; i++)
>                                 args[i] =3D cpu_to_le64(desc->args[i +
> -                                                     FIRST_EXT_ARG_IDX]);
> +                                                     SMCCC_FIRST_EXT_IDX=
]);
>                 }
> =20
>                 args_phys =3D dma_map_single(dev, args_virt, alloc_len,
> @@ -157,7 +158,7 @@ static int ___qcom_scm_call(struct device *dev, u32 s=
vc_id, u32 cmd_id,
>                 x5 =3D args_phys;
>         }
> =20
> -       qcom_scm_call_do(desc, res, fn_id, x5, atomic);
> +       qcom_scm_call_do_smccc(desc, res, fn_id, x5, atomic);
> =20
>         if (args_virt) {
>                 dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE=
);
> @@ -185,7 +186,7 @@ static int qcom_scm_call(struct device *dev, u32 svc_=
id, u32 cmd_id,
>                          struct arm_smccc_res *res)
>  {
>         might_sleep();
> -       return ___qcom_scm_call(dev, svc_id, cmd_id, desc, res, false);
> +       return ___qcom_scm_call_smccc(dev, svc_id, cmd_id, desc, res, fal=
se);
>  }
> =20
>  /**
> @@ -203,7 +204,7 @@ static int qcom_scm_call_atomic(struct device *dev, u=
32 svc_id, u32 cmd_id,
>                                 const struct qcom_scm_desc *desc,
>                                 struct arm_smccc_res *res)
>  {
> -       return ___qcom_scm_call(dev, svc_id, cmd_id, desc, res, true);
> +       return ___qcom_scm_call_smccc(dev, svc_id, cmd_id, desc, res, tru=
e);
>  }
> =20
>  /**
> @@ -253,7 +254,7 @@ int __qcom_scm_is_call_available(struct device *dev, =
u32 svc_id, u32 cmd_id)
>         struct arm_smccc_res res;
> =20
>         desc.arginfo =3D QCOM_SCM_ARGS(1);
> -       desc.args[0] =3D QCOM_SCM_FNID(svc_id, cmd_id) |
> +       desc.args[0] =3D SMCCC_FUNCNUM(svc_id, cmd_id) |
>                         (ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
> =20
>         ret =3D qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AVAIL_=
CMD,
> @@ -295,7 +296,7 @@ void __qcom_scm_init(void)
>  {
>         u64 cmd;
>         struct arm_smccc_res res;
> -       u32 function =3D QCOM_SCM_FNID(QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AV=
AIL_CMD);
> +       u32 function =3D SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, QCOM_IS_CALL_AV=
AIL_CMD);
> =20
>         /* First try a SMC64 call */
>         cmd =3D ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,

... to here I don't understand why any of it needs to change. It looks
like a bunch of churn and it conflates qcom SCM calls with SMCCC which
is not desirable. Those two concepts are different.

