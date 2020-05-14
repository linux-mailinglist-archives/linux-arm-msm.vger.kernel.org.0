Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E16F31D402C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 23:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgENVgq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 17:36:46 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:52391 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727929AbgENVgq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 17:36:46 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M42X0-1jZLX22GaO-0000DG; Thu, 14 May 2020 23:36:44 +0200
Received: by mail-qk1-f178.google.com with SMTP id b6so437741qkh.11;
        Thu, 14 May 2020 14:36:44 -0700 (PDT)
X-Gm-Message-State: AOAM532SsbXHphUrFp5DWXHU3Jupvx/OQZtF8qspUWft88ybQRx2PqyD
        12ZNvxQuTOn9EELv9Fa3BXAOKabPUnKGsg5ARfs=
X-Google-Smtp-Source: ABdhPJyf3ejLTtFf2bw9TFZMrkQqIINAK+cKTga/j0F6QfpmJ7vEMLRjK3kWorufMiwjUS2MDYyqF80Qn+VqVO6qVho=
X-Received: by 2002:ae9:ed95:: with SMTP id c143mr436949qkg.394.1589492203356;
 Thu, 14 May 2020 14:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org> <1589465266-20056-6-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1589465266-20056-6-git-send-email-jhugo@codeaurora.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 14 May 2020 23:36:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a34ks226S9UJMfCNdY3KWiBS+vscYdKwLW7wkLj0H_4Cw@mail.gmail.com>
Message-ID: <CAK8P3a34ks226S9UJMfCNdY3KWiBS+vscYdKwLW7wkLj0H_4Cw@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] qaic: Implement data path
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     gregkh <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vywY2JzhnvgMQcwkUNAYtUf8F0GUkknK2pgFUj3r5QUPsSVcAns
 Hbbe4fbwwtqAriQQppePPJFYgpdBwdrzcLN0Wzma0B7/qZwQwxxshuwr5v7NI2BvgoVTx/e
 SfIhmIMMH00X3fG8O5mifUbzjBw3lfz+hGw81FbztSrkvxP6y4LC0cYr6Us5pZDJMhImTXY
 7TiNbMfF06Y3kNjN/R+PA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hJNjae5Rvjo=:8+LH4etshqOjzgjVFBKerj
 qs628UALW3crvjgO8MYCBwm9U/EssceLvTqBNzSYaHNHDJ9vVUukVpZpYOZLn2jtcOmH7UAVK
 Lbv1gUuOxbU7huCOjt7LMmqFV9h37NgJv5c2cKAryP9yWfDyvwgy1ZMh7Bn6nf/ld+3zK0DcK
 uxLKSKdUNGHWEX12O19uz139wVNKJC8GvF/duJtv0EMeu090IpgMbUF2iF6pTJ2ibOHHtpTk/
 AzMDS3imMdLMkBQE7R2gZupgxdAjqr6DVk6mmhW0ZZRAg9TX9E3RLPG4vRw+ZSHMjPsEhFfI+
 Td49s++yl2awUrXtfndYA0TAgASoC5tXQP2OepRqwwPweTfXf9Zg2EAVs9esgicPFJQlbAGTR
 vzXI3UmXlmpMVKL11KtVj/nZbjwJCrWk41EHub0uKTfHxr/RfzMMlQEJV4vV/iUdo/O9Pkvpe
 ukxC7r3t0oF6I2ZzUBWgidBenXvyiGNEXFPhvWVo718Z3ZleBNUjVw207CECgruYqtU9ZIDdm
 x/RRfnC52LTOomSESCuce6oen5aOEJyfBR3iYfTkMDWfY9fUu3ha8TilzT4oi1BPW+hwUvuD+
 PRteInwcxWbJqi1pTKTgp5IaS8cEfesnp1wqsyTTW3IZrBDnWn+NCqVF/V7DiZBY5ak9MUbTo
 +lE0tSLbH3P33dUzCOnFjz9DGi9twTvx5BgSPJvBvhpJju18maIYHm+WRQP0isyPySqY7ClMe
 3WRixmX+YFxx0AFFNukMnPHHVCyl/47jxzRbsxWH72TCanAcFcDwhzBF63ciDlqKuWCXPm/95
 9eLMfkAHsxmKB4Y/7sU9sGa0sP2PK+YVixmtSr6rw+NHdr7CmA=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 4:09 PM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> +struct dbc_req { /* everything must be little endian encoded */

Instead of the comment, I suppose you want to use __le16 and __le32
types and let sparse check that you got it right.

> +       u16     req_id;
> +       u8      seq_id;
> +       u8      cmd;
> +       u32     resv;
> +       u64     src_addr;
> +       u64     dest_addr;
> +       u32     len;
> +       u32     resv2;
> +       u64     db_addr; /* doorbell address */
> +       u8      db_len; /* not a raw value, special encoding */
> +       u8      resv3;
> +       u16     resv4;
> +       u32     db_data;
> +       u32     sem_cmd0;
> +       u32     sem_cmd1;
> +       u32     sem_cmd2;
> +       u32     sem_cmd3;
> +} __packed;

All members are naturally aligned, so better drop the __packed
annotation get better code, unless the structure itself is
at an unaligned offset in memory.

> +struct dbc_rsp { /* everything must be little endian encoded */
> +       u16     req_id;
> +       u16     status;
> +} __packed;

Same here.

> +       init_completion(&mem->xfer_done);
> +       list_add_tail(&mem->list, &dbc->xfer_list);
> +       tail = (tail + mem->nents) % dbc->nelem;
> +       __raw_writel(cpu_to_le32(tail), dbc->dbc_base + REQTP_OFF);

What is this __raw accessor for? This generally results in non-portable
code that should be replaced with writel() or something specific to
the bus on the architecture you deal with.

> +       spin_lock_irqsave(&qdev->dbc[exec->dbc_id].xfer_lock, flags);
> +       req_id = qdev->dbc[exec->dbc_id].next_req_id++;
> +       queued = mem->queued;
> +       mem->queued = true;
> +       spin_unlock_irqrestore(&qdev->dbc[exec->dbc_id].xfer_lock, flags);

No need for 'irqsave' locks when you know that interrupts are enabled.

> +       head = le32_to_cpu(__raw_readl(dbc->dbc_base + RSPHP_OFF));
> +       tail = le32_to_cpu(__raw_readl(dbc->dbc_base + RSPTP_OFF));

More __raw accessors to replace.

> +       case QAIC_IOCTL_MEM_NR:
> +               if (_IOC_DIR(cmd) != (_IOC_READ | _IOC_WRITE) ||
> +                   _IOC_SIZE(cmd) != sizeof(struct qaic_mem_req)) {
> +                       ret = -EINVAL;
> +                       break;

This looks like a very verbose way to check 'cmd' against a known
constant. Why not use 'switch (cmd)' like all other drivers?

      Arnd
