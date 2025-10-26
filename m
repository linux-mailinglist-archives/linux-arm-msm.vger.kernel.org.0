Return-Path: <linux-arm-msm+bounces-78796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FCDC0A1D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 03:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5BD63A7C07
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 02:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B691D6DA9;
	Sun, 26 Oct 2025 02:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4Y6JVVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A841917996
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 02:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761444764; cv=none; b=uAbg/4rdylIZsiWWi4Knl/5Q5jqDir7soUuHL+afzbJ3Odj5OAPxAaI8Ozk7Xrw2wHvHbXNQJng3mtBCB7g21blIkYtrjJsE7CzvrZmIKJ/8Pp6MWays5Ofof7wUHT7IchBBO+Kfte0aRDpDXI4BSO81vhtMSKDraGvdRBc4etU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761444764; c=relaxed/simple;
	bh=sizgrOArM13vuh5KN+HY6fKxmN1f0rHtVXl+qRJ/RRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XImfM0sdYytmTLL6BNoTcBUdAxkxscAuddVDWPudLdN1SKgoMkkO0D7QhZUVCFyrbj3gqq4zvt7Y38nxx789K6VsNEOFcFgUaVhF6X/0Osk3QQIZjcsab+2kpUqtZoUK1xebSC6ZcdhS4Re8CUcdRqivb9OlxxB6S9QJWfoGsiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4Y6JVVF; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5d6266f1a33so2182677137.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 19:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761444761; x=1762049561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xL6yZ/yFhmNmGvye1LiCJyEZQmyqAagjH85CK4Fh8qk=;
        b=j4Y6JVVFAIV4cG+iDil1nY4IMf0L8pqPQ5VA1hI8p4lVDYudpcVBWsCnqASIJ5NhgW
         r8uMBZ8WAU3mU4EMKeL8St70+SoL0tUwsqJfggCNduMl5COXrjBtvjO0OWIhG4MWkpvu
         10RosKH7GHfPpSFWdzPkafJtypqYE9kiuS+TeV2pKLp6W/f0g8sWGEK/vg2IhHUsM+lf
         0HWqeq+VVm+QIqLlKAVVkpceiIA67eIvd1TY8Jg/GaR0k2jfBCVtBI6bxI81s0vQYgCO
         9ptFR+h4zxA5HKhoU0gvu/ckQITe+GZoOnNoiVllp/TlSIi7nC+ZWBYu77WsZwnnIPoD
         sHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761444761; x=1762049561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xL6yZ/yFhmNmGvye1LiCJyEZQmyqAagjH85CK4Fh8qk=;
        b=I4Sbd8TFIl/+iUkBY+eTNRBR2meFGm5dLoTVy6GWeUIGWnVzh64X2OVYbyL8t6h/2n
         zZzVXmIHGHp5JJmJppSXraILdJ15xI6ZCd/sl/uR4GV5Ku9Vh4JksnPpgaCqnZSNWi8+
         v5W++OfRt9I5rmLq2iptYuIWF7FxzpW0fdZ4WeJjddfqm6XRX/nlJ+SY38laC5a7hCEs
         MC6/aj5nkIvhdY9YL9VJTBqL2O1hOzzsvuaCVOicNj1KaCsqbQTZevmHFluOm7h5uYlz
         jDWDl7MfxYvflBCxAPUexdUXt68nYFAWd+7Ps1nq8AJODyF3kWfWeWHeaxAsYTgQu5bd
         2hqw==
X-Forwarded-Encrypted: i=1; AJvYcCUJeXSb0Mei2XTUn2bvYK9YDQkX6kAiom+7SROv7ANNTlOOUoLmI4S7puxoYR5jdjQfh9fOmV+xFYMYQyiK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm25i8MT4Gwps9uAZzDq40F7P1O1fJ0LyIGvbjpsn8UFuXE/Tp
	vvZWldvEzN/6Gtm4/6EVfhthNO3ZwoatdmDbvjkBGtpvEtfZK8DQgaUq86UdKpFKmoV4t+nzbHp
	U/6fhdexuDV6XBf5nnKmDIpn07LE9jDs=
X-Gm-Gg: ASbGncv4Q6JYMWxXi+ELVkb3sYGeG5+o8X9CAKegg54qSI9h9H1CheHycb4n5BKLz7L
	1E1h9EHxKCxDxSmB+hTNZHz0Q+XTAUzb6Ha0HpXODfs2ZZ+O+eBTD3lZHCuTGn9iwi7EQNr4AfX
	vaCpS6GLyk3L5D0KpAcRsFyAj6O3NTLlpm2i6lHbz7ik0UtqQ2tToxR7KePnvTN1u7LlWSSbZM+
	TM3BFGBxkOFyRyWPe/1vqUXtBipdGfeCeTyuLOjYjf91niO+tkc18/JG8s31m/sAX08DTWi
X-Google-Smtp-Source: AGHT+IE5fbA2DCFqDQtleRTLb2gV6MzX8pROJPpV+pPzqG3ajyBgO3UJ2zZrCG9BeRUsdJBQXF80eXHIzYjwMEmqU9w=
X-Received: by 2002:a05:6102:508b:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-5d7dd53f265mr10396957137.16.1761444761472; Sat, 25 Oct 2025
 19:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
In-Reply-To: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
From: Bjorn Andersson <andersson.kernel@gmail.com>
Date: Sat, 25 Oct 2025 21:15:12 -0500
X-Gm-Features: AWmQ_bmb0rE3ZH71wEvpaqrJgGtUrmO07lzDNNqQjT9VRL0qPatYtPlgOE8134w
Message-ID: <CAEQQ6OLaEh138CgW+OvMzt0AhYgGX5xJKXTpFLwQS7UF+qE-gQ@mail.gmail.com>
Subject: Re: [PATCH v2] accel/qaic: Add support for PM callbacks
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com, 
	troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com, 
	ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 11:29=E2=80=AFAM Youssef Samir
<youssef.abdulrahman@oss.qualcomm.com> wrote:
>
> Add initial support for suspend and hibernation PM callbacks to QAIC.

Tell me more. Say something about what needs to happen in order to
suspend etc...

>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
> Changes in v2:
> - Guard the pm callbacks with CONFIG_PM_SLEEP to fix openrisc build error
> - Add __maybe_unused to helper functions used only in PM callbacks curren=
tly
> - Link to v1: https://lore.kernel.org/all/20251022204005.3888195-1-yousse=
f.abdulrahman@oss.qualcomm.com
> ---
>  drivers/accel/qaic/qaic.h          |  2 +
>  drivers/accel/qaic/qaic_drv.c      | 93 ++++++++++++++++++++++++++++++
>  drivers/accel/qaic/qaic_timesync.c |  9 +++
>  drivers/accel/qaic/qaic_timesync.h |  3 +
>  4 files changed, 107 insertions(+)
>
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index 820d133236dd..2bfc4ce203c5 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -161,6 +161,8 @@ struct qaic_device {
>         struct mhi_device       *qts_ch;
>         /* Work queue for tasks related to MHI "QAIC_TIMESYNC" channel */
>         struct workqueue_struct *qts_wq;
> +       /* MHI "QAIC_TIMESYNC_PERIODIC" channel device */
> +       struct mhi_device       *mqts_ch;
>         /* Head of list of page allocated by MHI bootlog device */
>         struct list_head        bootlog;
>         /* MHI bootlog channel device */
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.=
c
> index e162f4b8a262..8d42866d758e 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -660,6 +660,94 @@ static const struct pci_error_handlers qaic_pci_err_=
handler =3D {
>         .reset_done =3D qaic_pci_reset_done,
>  };
>
> +static bool __maybe_unused qaic_is_under_reset(struct qaic_device *qdev)
> +{
> +       int rcu_id;
> +       bool ret;
> +
> +       rcu_id =3D srcu_read_lock(&qdev->dev_lock);
> +       ret =3D qdev->dev_state !=3D QAIC_ONLINE;
> +       srcu_read_unlock(&qdev->dev_lock, rcu_id);
> +       return ret;
> +}
> +
> +static bool __maybe_unused qaic_data_path_busy(struct qaic_device *qdev)
> +{
> +       int dev_rcu_id;
> +       bool ret;
> +       int i;
> +
> +       dev_rcu_id =3D srcu_read_lock(&qdev->dev_lock);
> +       if (qdev->dev_state !=3D QAIC_ONLINE) {
> +               srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
> +               return false;
> +       }
> +       for (i =3D 0; i < qdev->num_dbc; i++) {
> +               struct dma_bridge_chan *dbc =3D &qdev->dbc[i];
> +               unsigned long flags;
> +               int ch_rcu_id;
> +
> +               ch_rcu_id =3D srcu_read_lock(&dbc->ch_lock);
> +               if (!dbc->usr || !dbc->in_use) {
> +                       srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
> +                       continue;

Perhaps I'm missing something here, but what if you have num_dbc
number of unused dbcs?
Won't we continue until we exit the loop and then return ret, which
hasn't yet been initialized?

> +               }
> +               spin_lock_irqsave(&dbc->xfer_lock, flags);
> +               ret =3D !list_empty(&dbc->xfer_list);
> +               spin_unlock_irqrestore(&dbc->xfer_lock, flags);
> +               srcu_read_unlock(&dbc->ch_lock, ch_rcu_id);
> +               if (ret)
> +                       break;
> +       }
> +       srcu_read_unlock(&qdev->dev_lock, dev_rcu_id);
> +       return ret;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int qaic_pm_suspend(struct device *dev)
> +{
> +       struct qaic_device *qdev =3D pci_get_drvdata(to_pci_dev(dev));
> +
> +       dev_dbg(dev, "Suspending..\n");
> +       if (qaic_data_path_busy(qdev)) {
> +               dev_dbg(dev, "Device's datapath is busy. Aborting suspend=
..\n");
> +               return -EBUSY;
> +       }
> +       if (qaic_is_under_reset(qdev)) {
> +               dev_dbg(dev, "Device is under reset. Aborting suspend..\n=
");
> +               return -EBUSY;
> +       }
> +       qaic_mqts_ch_stop_timer(qdev->mqts_ch);
> +       qaic_pci_reset_prepare(qdev->pdev);
> +       pci_save_state(qdev->pdev);
> +       pci_disable_device(qdev->pdev);
> +       pci_set_power_state(qdev->pdev, PCI_D3hot);
> +       return 0;
> +}
> +
> +static int qaic_pm_resume(struct device *dev)
> +{
> +       struct qaic_device *qdev =3D pci_get_drvdata(to_pci_dev(dev));
> +       int ret;
> +
> +       dev_dbg(dev, "Resuming..\n");
> +       pci_set_power_state(qdev->pdev, PCI_D0);
> +       pci_restore_state(qdev->pdev);
> +       ret =3D pci_enable_device(qdev->pdev);
> +       if (ret) {
> +               dev_err(dev, "pci_enable_device failed on resume %d\n", r=
et);
> +               return ret;
> +       }
> +       pci_set_master(qdev->pdev);
> +       qaic_pci_reset_done(qdev->pdev);
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops qaic_pm_ops =3D {
> +       SET_SYSTEM_SLEEP_PM_OPS(qaic_pm_suspend, qaic_pm_resume)
> +};
> +#endif
> +
>  static struct pci_driver qaic_pci_driver =3D {
>         .name =3D QAIC_NAME,
>         .id_table =3D qaic_ids,
> @@ -667,6 +755,11 @@ static struct pci_driver qaic_pci_driver =3D {
>         .remove =3D qaic_pci_remove,
>         .shutdown =3D qaic_pci_shutdown,
>         .err_handler =3D &qaic_pci_err_handler,
> +       .driver =3D {
> +               #ifdef CONFIG_PM_SLEEP

No, that's not the right way, same with SET_SYSTEM_SLEEP_PM_OPS above.
See e.g. https://lore.kernel.org/all/20250708-arm-scmi-modern-pm-ops-v1-1-1=
4bc9c352888@kernel.org/

Regards,
Bjorn

> +               .pm =3D &qaic_pm_ops,
> +               #endif
> +       },
>  };

