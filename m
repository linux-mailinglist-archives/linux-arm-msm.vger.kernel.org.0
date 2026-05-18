Return-Path: <linux-arm-msm+bounces-108266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFKlB9xiC2rwGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:05:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C915728E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 643413036386
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125CD38BF72;
	Mon, 18 May 2026 19:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTqKYor7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7719932D7F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131036; cv=pass; b=jKOJcNf20uBDAoAc6PclK3qaY6ExHp4OqPCsiCphnDimpZHMEgjKIMdLnGTW6tm0kiJQ+9OpzTqbCYtgWXGjpko0jYdb4zioihYc5YjFAvKWIGrYFXb0IHb4JTOoEzdCGsh32kQbyUJr5WdC6TfKcfBbgYCYyqF7SCkIU2eIlcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131036; c=relaxed/simple;
	bh=lkkNE21DnhhtG6iaFAWZoEa4LXoYOovTFQ/2iagHgm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEpBASBK6Zxc4DtJT63qii20a4t1f1hY1XqYxgVTeIjwWxGW4myi4TE8fT4+N1+vasqoFti0PFE/4zZmVJsD6kP8K1yc6Iuhi+xoBVyFYTE9FSV5JUYUDCv4IOHAfsoJvaS7CZwy5pHVIhOOcabbn+sxuz4HYxHLkYiqgrhKO28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTqKYor7; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso2727734a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779131033; cv=none;
        d=google.com; s=arc-20240605;
        b=aoXLyh6ylgqcllzM6H7SC876ouozHnX1XgJ2hiRGm3+nOOXp3N69yNI1fq/GvR415a
         kZ18Xhnngr1mnOPiLTIoIGIUh/enlv3G77c5khbjC2A1F/UMX33UojkgQfCLxg8qYhM8
         hYwYogGzuEwEDr+SWhh2UvZwn0A84Ed4CovM/jqF2CXH1rNScmChfkUrFXWMsgazH76W
         peOG0ntw8VtKBGnInOXHckyVpEydZ40FTpQv3hhJRymtaWcmEQRlb25+bu8I3A0brexv
         wwmYlihcPPqVMnn++G4kLHrGkARwrX6hoBa3iBaswhnedJxmfHAe3IxAYhX/9aaXi/gg
         q59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2A8KoSiO9BqS7JQnE+gxI1qQl29fAk9Kx40U1JkRcE=;
        fh=ArzNilzz4w7r6mAb2KZ2ScfLL44OoD5gZnjclCRPSoI=;
        b=EvbC1NlunOfa21yoGhbifz62l05eHYHhNkmr6tMdy8y9DyKw5J4Vczv6IEh4cnPvEs
         tiGXfiRwqODXFSK3iPumJzrK9syr70NXGjx/S66ZcRJ1K3Rx6Tf9KJAwRUAAvGD3FuuC
         FbLVsGPJIoajmJih4+A2e2adC4FwS6lEw1fjHYo8yvV/KHJ/Dpe85fo6v+oJWNTWvKi8
         IndHgwGBd8Up1mj5yXROe0VO4x9ZyNyRTjoplOojJwHHy5xJB1DPb1X+mZbXwizhyQco
         YI0t0e+1nXBoPJnvsqfPhAZPqMYUiG92FwhGFzIkWe+Qeq8nwupgUJo4tZ7rOk+E5Ol/
         sb/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131033; x=1779735833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2A8KoSiO9BqS7JQnE+gxI1qQl29fAk9Kx40U1JkRcE=;
        b=OTqKYor7dC3ehcQkfIjrXWB0auiDQ0kTR938IA5l0EnbV6jGiRoq0asU5ZyPn6jeCY
         rV0VoCX/Pa+jb9dD8TMpzyvOgnJ+PvRrv8BHjgfnOT9oIwYOwlqTVEW6DQFLjJwUXFb5
         ue0+LkSpGSFoRe6kdqzmf1vOTy8CMGeU/JB+ABNQ2EhasAdJcuWNjaHbSfnZSkCpc5Oy
         mSB2sj8cKJntSuOcn8EYp/KE83ILMfpMyyqIZA3lN0TnNwi0P2V6jIofNLhioeNbnv/f
         riDFNA/cL6aha9PCZMsr6pXKwZ7K0nTSA7QeycjsSwGv/xsrcVhNJcvpVo33ZLHxmBdV
         qr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131033; x=1779735833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y2A8KoSiO9BqS7JQnE+gxI1qQl29fAk9Kx40U1JkRcE=;
        b=IKdbra56MOV5u5u7QvLWIGChYnuIUPGTp92FW9iwmSjOxA6lPRBQmXow4kL+NClySN
         9tmBng3XLprpqCPJThzl25vmuvrjbwudjU6Hn/lnRmFUkAG+02iWWEp/JcJs87CFKTtd
         O0eTs1EykQ52UGgl5UTt8dER+KnhRUQY8wi0cb0QxwNUDk9pwbEHBHrLUOxcuJCuOpu3
         vkDIUWmX91rrlz6F5LXi9y1K4fkmxRK4Kjbac5lM4/mWNul2RNPAxrXrw97i0/Y1zQuF
         Id8/1ExpIeNE668eZcj2m1Ci9SOnEIXlvlTosHfm3clzQIOI1QgU9+O9RjYS2wDJdgzY
         /d/w==
X-Forwarded-Encrypted: i=1; AFNElJ/gcEsmopDMVUm9S+PpNRUz5vM+q8j0OFPeAPpRbNpUWRLti2clLUfUaYuARA+6mGR5f2r0MNKMFm2Cr7WO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1z4yuq6UDoQ7lLi9CphduRwO0xxAaJoJ/ReAGqwLwnQ56zLid
	kIdfnB6gGYTGkpOLCQk8HInQZzPSgXOmWtw45XRfXe/yyIMKi7dM+m7SVysqE4F9swxqPuoYuDe
	SaqcdUM+rSVVQkmtNhwXKx+uzdxG8JGY=
X-Gm-Gg: Acq92OGbwtbb/uh0fnSGTcBNZoaJ5miwSuPSDGKSasWq6OfzmPjIicc4hcFjmYv0Ns+
	Su27FcQdv0T3VLPH4VmL/fjFU1raSajqjNAy1Lwnp/oJ7X1lg+D+Z+pWW2qTAPTeVlC8bbgefL9
	Luvuiwb0VRnx6BeCX78xSQe3xItnKf3UuhsTX+JdfnkVbJKe9n8lHRIIdZlk34Ezj5ain6/o+PP
	6apXtVpT7Co3b20xOeMp7nhNtHh/U+LL5dp4X+clTuQa1+ppP64mKSFI4Gssh3aOH/8IYKemHXR
	VVU8RnysH0piBTQ8+n8=
X-Received: by 2002:a05:6830:6010:b0:7d9:b58e:55f2 with SMTP id
 46e09a7af769-7e4f2bb0184mr11881138a34.24.1779131033436; Mon, 18 May 2026
 12:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com> <20260427005236.230106-3-shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260427005236.230106-3-shengchao.guo@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:03:42 -0500
X-Gm-Features: AVHnY4IffK_aHDgASE6NLu5ss9pZv0QrcURDgMI5IHP3klFX-tFlfaWiO0EL67k
Message-ID: <CABb+yY3bJBV4S5na2HCiLCV=1gTFVJEKLp_WmzM=UMJ1PibTWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP
 mailbox controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108266-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A6C915728E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 26, 2026 at 7:53=E2=80=AFPM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>
> The Nord SoC CPUCP mailbox supports 16 IPC channels, compared to 3 on
> x1e80100. The existing driver hardcodes the channel count via a
> compile-time constant (APSS_CPUCP_IPC_CHAN_SUPPORTED), making it
> impossible to support hardware with a different number of channels.
>
> Introduce a qcom_cpucp_mbox_data per-hardware configuration struct that
> carries the channel count, and retrieve it via of_device_get_match_data()
> at probe time. Switch the channel array from a fixed-size member to a
> dynamically allocated buffer sized from the hardware data. Update the
> x1e80100 entry to supply its own data struct, and add a new Nord entry
> with num_chans =3D 16.
>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-cpucp-mbox.c | 35 ++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpu=
cp-mbox.c
> index 44f4ed15f818..862e45e8fbd5 100644
> --- a/drivers/mailbox/qcom-cpucp-mbox.c
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -12,7 +12,6 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>
> -#define APSS_CPUCP_IPC_CHAN_SUPPORTED          3
>  #define APSS_CPUCP_MBOX_CMD_OFF                        0x4
>
>  /* Tx Registers */
> @@ -26,6 +25,14 @@
>  #define APSS_CPUCP_RX_MBOX_EN                  0x4c00
>  #define APSS_CPUCP_RX_MBOX_CMD_MASK            GENMASK_ULL(63, 0)
>
> +/**
> + * struct qcom_cpucp_mbox_data - Per-hardware mailbox configuration data
> + * @num_chans:                 Number of IPC channels supported by this =
hardware
> + */
> +struct qcom_cpucp_mbox_data {
> +       int num_chans;
> +};
> +
>  /**
>   * struct qcom_cpucp_mbox - Holder for the mailbox driver
>   * @chans:                     The mailbox channel
> @@ -34,7 +41,7 @@
>   * @rx_base:                   Base address of the CPUCP rx registers
>   */
>  struct qcom_cpucp_mbox {
> -       struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
> +       struct mbox_chan *chans;
>         struct mbox_controller mbox;
>         void __iomem *tx_base;
>         void __iomem *rx_base;
> @@ -53,7 +60,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void=
 *data)
>
>         status =3D readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>
> -       for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN=
_SUPPORTED) {
> +       for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_cha=
ns) {
>                 u32 val =3D readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD=
(i) + APSS_CPUCP_MBOX_CMD_OFF);
>                 struct mbox_chan *chan =3D &cpucp->chans[i];
>                 unsigned long flags;
> @@ -112,15 +119,24 @@ static const struct mbox_chan_ops qcom_cpucp_mbox_c=
han_ops =3D {
>
>  static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
>  {
> +       const struct qcom_cpucp_mbox_data *data;
>         struct device *dev =3D &pdev->dev;
>         struct qcom_cpucp_mbox *cpucp;
>         struct mbox_controller *mbox;
>         int irq, ret;
>
> +       data =3D of_device_get_match_data(dev);
> +       if (!data)
> +               return dev_err_probe(dev, -EINVAL, "No match data found\n=
");
> +
>         cpucp =3D devm_kzalloc(dev, sizeof(*cpucp), GFP_KERNEL);
>         if (!cpucp)
>                 return -ENOMEM;
>
> +       cpucp->chans =3D devm_kcalloc(dev, data->num_chans, sizeof(*cpucp=
->chans), GFP_KERNEL);
> +       if (!cpucp->chans)
> +               return -ENOMEM;
> +
>         cpucp->rx_base =3D devm_of_iomap(dev, dev->of_node, 0, NULL);
>         if (IS_ERR(cpucp->rx_base))
>                 return PTR_ERR(cpucp->rx_base);
> @@ -146,7 +162,7 @@ static int qcom_cpucp_mbox_probe(struct platform_devi=
ce *pdev)
>
>         mbox =3D &cpucp->mbox;
>         mbox->dev =3D dev;
> -       mbox->num_chans =3D APSS_CPUCP_IPC_CHAN_SUPPORTED;
> +       mbox->num_chans =3D data->num_chans;
>         mbox->chans =3D cpucp->chans;
>         mbox->ops =3D &qcom_cpucp_mbox_chan_ops;
>
> @@ -157,8 +173,17 @@ static int qcom_cpucp_mbox_probe(struct platform_dev=
ice *pdev)
>         return 0;
>  }
>
> +static const struct qcom_cpucp_mbox_data qcom_x1e80100_mbox_data =3D {
> +       .num_chans =3D 3,
> +};
> +
> +static const struct qcom_cpucp_mbox_data qcom_nord_mbox_data =3D {
> +       .num_chans =3D 16,
> +};
> +
>  static const struct of_device_id qcom_cpucp_mbox_of_match[] =3D {
> -       { .compatible =3D "qcom,x1e80100-cpucp-mbox" },
> +       { .compatible =3D "qcom,nord-cpucp-mbox", .data =3D &qcom_nord_mb=
ox_data },
> +       { .compatible =3D "qcom,x1e80100-cpucp-mbox", .data =3D &qcom_x1e=
80100_mbox_data },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
> --
> 2.43.0
>
Applied to mailbox/for-next
Thanks
Jassi

