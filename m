Return-Path: <linux-arm-msm+bounces-68729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61576B22406
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C2771A20335
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C37F2EACE9;
	Tue, 12 Aug 2025 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zr+F9DbR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9212EA754
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754993131; cv=none; b=HoT5QNFwBKeaB/NcfBb994UMuj5E0fjhqHnOJI636ANAzqSPNKBiLIVT5M0hI3tje6ujPh6Sdn1MS08XMA+7ZPMY7r4VRIF4w0oj2CeJM+s9GPrHQBvEMgVXVxT4gPYO3c6yOiWfUvZNq3iRjoowOb+qY8UwwHd+jdtma69OeyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754993131; c=relaxed/simple;
	bh=XWLmAcxb47LR5YyiumJRk7B+Aw0Td4c8Q4AvQT48z8U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=DxAERjWpg/ok8NVkyCsExxq1CPantxDt0JwG4jrkulOgsbL7MLslW8lsdU15/DYUFrtbFsk1x63NGRnYmY9UUIM5mzxQsHNm7ZfWPFDiZukX1BNoR7uXYSl8zCNsCxFsE4t9pNIcu9lN9JCoSLxK+MxiCKCNW74IUpZ1NrVfZrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zr+F9DbR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459e3926cbbso22132945e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754993128; x=1755597928; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4puXE3WG3G/o6QrhUTZRedOpdszGi21yFpntx6Hhf0=;
        b=Zr+F9DbRm6bKzpi5hJSCw3G7QuojjYnOZ+Bm0VN6KzoOYmvBzmhgyXDFhCXuo0zlZ/
         W0WGUHIFY7PntRSe8YDDejrzBnrvqCK4laehgdFIbqW9cI9TqY/ZL+DtdO8jpXAFj8mB
         3TjXOLC7mL4njevQS5xvmmjQKJlOXqSkpdmmJ8CI46aOZ/XHR5TA57k/vUL2ZarFwGIl
         Htel/dkRxYucWgnn1/YswZ9EJkBwQf5J3jaoK2vTK0oRIz2KLgAbFekACxPiNhJUvAZP
         4hK+O8T4jaSYzm1VX718lKl65pZIBh6jo/9YpO57ltWu3su3Nq99vNutWK4uUBxoFnzH
         m3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754993128; x=1755597928;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g4puXE3WG3G/o6QrhUTZRedOpdszGi21yFpntx6Hhf0=;
        b=p1eXMuaxCEQjR21kRmXSu6IZsVW7cOjOo9piyiGpzbCf3rxfv8zNm0N/fuslkVvAQu
         glv7GzKFTe8pqELlYLKNxHYJS4L8GreRIp6xojlkXzJ2OIxh81ecKYFbG1ivE2Ew39FD
         NZSBMru4sxCLnRpyL3h4scGAZWO1H1vgGiN3UzZTg6NpaUest5H/U+4qHHpuTlvzq4zq
         j47YraHnCazHPYsG4b1G83q7QnBObsDfZ6vkwCgoQjipG9gIiWHGNN9G2HgQ2mYVpsHc
         JPePs7aXYNFrGzCuEBsn/ZvSDRM2tQ/ju//hmDU/tEpd9hKH2VYAGvzbvm/834JTHfML
         xPqA==
X-Forwarded-Encrypted: i=1; AJvYcCUjNShAwWAdGkTa42pXF9Dg4kjJaGjwTQoSADAsW2dU8WQmGaSD6+RFdRl6hYxd6NfprJV4i3aJd3kzVCHe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhntfj6fu6/4eKtkwqwoRpViHTOALEN2JgKKyrSB/VlFmSuHqB
	cOCR+DVmvlsCEWIdhfAFNURdywbiogrlNmLKM/zub0j3pRLhUS1yb1cd8xN9dhJiSog=
X-Gm-Gg: ASbGncsRaGtVusl69aDtIDuZJmP3Od4VPZqLh2/cNk6aYiCDGSoM3JPwp8h2DcKjxAz
	rYH24mOUcs6cL2Xzvt7oFosKlBq4+L0Z/NnZSqiy83xQsA/UBtvTpXTF3MkmYsRPOQprubLrIJV
	IMsrsF+itA+2aNMt7En2TzLo1n15cTtZaaGmOK4RFzfUoVc7ilrPLSgD+Bms3Eo9VGr+Qncj8N2
	seLNRpZjS4O+uSmFYTesUdk0f1VvgsEaWMOvPksq+OwfvVa8AfIXaQxmCYN//6dTcfs8Nntgxjf
	TZdoS56w9JdzGFPQV0hJK9RAqfefNhVjL3gk0KOlfnn0+bHZfSV9X2F3LgqRRBeo3Cn/SrQ44+g
	KO8iqbwhAxuIPJLbGwxJW4W/U+jI=
X-Google-Smtp-Source: AGHT+IFgVaBDrE/OVb0Lh1YQvuxoYmxXAVREy1eRPSTlBSW7jn1WRvr6YcYi0LzfZNKXStQpAN7nxA==
X-Received: by 2002:a05:600c:c4b7:b0:458:f70d:ebdd with SMTP id 5b1f17b1804b1-45a10bea224mr24581875e9.16.1754993127536;
        Tue, 12 Aug 2025 03:05:27 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:42cc:2c69:7a9c:4dff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459dc7e1ddesm381057535e9.27.2025.08.12.03.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 03:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 11:05:26 +0100
Message-Id: <DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org>
Subject: Re: [PATCH v7 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Praveen Talari" <quic_ptalari@quicinc.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: <psodagud@quicinc.com>, <djaggi@quicinc.com>,
 <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
 <quic_arandive@quicinc.com>, <quic_cchiluve@quicinc.com>,
 <quic_shazhuss@quicinc.com>, "Jiri Slaby" <jirislaby@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <bryan.odonoghue@linaro.org>, <neil.armstrong@linaro.org>,
 <srini@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
 <20250721174532.14022-8-quic_ptalari@quicinc.com>
In-Reply-To: <20250721174532.14022-8-quic_ptalari@quicinc.com>

(c/c Neil and Srini)

On Mon Jul 21, 2025 at 6:45 PM BST, Praveen Talari wrote:
> The GENI serial driver currently handles power resource management
> through calls to the statically defined geni_serial_resources_on() and
> geni_serial_resources_off() functions. This approach reduces modularity
> and limits support for platforms with diverse power management
> mechanisms, including resource managed by firmware.
>
> Improve modularity and enable better integration with platform-specific
> power management, introduce support for runtime PM. Use
> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
> qcom_geni_serial_pm() callback to control resource power state
> transitions based on UART power state changes.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>


This breaks at least RB1 (QRB2210), maybe others.
Currently broken on -master and on linux-next.

Upon login prompt random parts of kernel seems to be off/failed and
debugging led to udev being stuck:

[   85.369834] INFO: task kworker/u16:0:12 blocked for more than 42 seconds=
.
[   85.376699]       Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
[   85.382660] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[   85.390547] task:kworker/u16:0   state:D stack:0     pid:12    tgid:12  =
  ppid:2      task_flags:0x4208060 flags:0x00000010
[   85.401748] Workqueue: async async_run_entry_fn
[   85.406349] Call trace:
[   85.408828]  __switch_to+0xe8/0x1a0 (T)
[   85.412724]  __schedule+0x290/0x7c0
[   85.416275]  schedule+0x34/0x118
[   85.419554]  rpm_resume+0x14c/0x66c
[   85.423111]  rpm_resume+0x2a4/0x66c
[   85.426647]  rpm_resume+0x2a4/0x66c
[   85.430188]  rpm_resume+0x2a4/0x66c
[   85.433722]  __pm_runtime_resume+0x50/0x9c
[   85.437869]  __driver_probe_device+0x58/0x120
[   85.442287]  driver_probe_device+0x3c/0x154
[   85.446523]  __driver_attach_async_helper+0x4c/0xc0
[   85.451446]  async_run_entry_fn+0x34/0xe0
[   85.455504]  process_one_work+0x148/0x290
[   85.459565]  worker_thread+0x2c4/0x3e0
[   85.463368]  kthread+0x118/0x1c0
[   85.466651]  ret_from_fork+0x10/0x20
[   85.470337] INFO: task irq/92-4a8c000.:71 blocked for more than 42 secon=
ds.
[   85.477351]       Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
[   85.483323] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[   85.491195] task:irq/92-4a8c000. state:D stack:0     pid:71    tgid:71  =
  ppid:2      task_flags:0x208040 flags:0x00000010
[   85.502290] Call trace:
[   85.504786]  __switch_to+0xe8/0x1a0 (T)
[   85.508687]  __schedule+0x290/0x7c0
[   85.512231]  schedule+0x34/0x118
[   85.515504]  __synchronize_irq+0x60/0xa0
[   85.519483]  disable_irq+0x3c/0x4c
[   85.522929]  msm_pinmux_set_mux+0x3a8/0x44c
[   85.527167]  pinmux_enable_setting+0x1c4/0x28c
[   85.531665]  pinctrl_commit_state+0xa0/0x260
[   85.535989]  pinctrl_pm_select_default_state+0x4c/0xa0
[   85.541182]  geni_se_resources_on+0xd0/0x15c
[   85.545522]  geni_serial_resource_state+0x8c/0xbc
[   85.550282]  qcom_geni_serial_runtime_resume+0x24/0x3c
[   85.555470]  pm_generic_runtime_resume+0x2c/0x44
[   85.560139]  __rpm_callback+0x48/0x1e0
[   85.563949]  rpm_callback+0x74/0x80
[   85.567494]  rpm_resume+0x39c/0x66c
[   85.571040]  __pm_runtime_resume+0x50/0x9c
[   85.575193]  handle_threaded_wake_irq+0x30/0x80
[   85.579771]  irq_thread_fn+0x2c/0xb0
[   85.583443]  irq_thread+0x16c/0x278
[   85.587003]  kthread+0x118/0x1c0
[   85.590283]  ret_from_fork+0x10/0x20
[   85.593943] INFO: task (udev-worker):228 blocked for more than 42 second=
s.
[   85.600873]       Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
[   85.606846] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[   85.614717] task:(udev-worker)   state:D stack:0     pid:228   tgid:228 =
  ppid:222    task_flags:0x400140 flags:0x00000818
[   85.625823] Call trace:
[   85.628316]  __switch_to+0xe8/0x1a0 (T)
[   85.632217]  __schedule+0x290/0x7c0
[   85.635765]  schedule+0x34/0x118
[   85.639044]  async_synchronize_cookie_domain.part.0+0x50/0xa4
[   85.644854]  async_synchronize_full+0x78/0xa0
[   85.649270]  do_init_module+0x190/0x23c
[   85.653154]  load_module+0x1708/0x1ca0
[   85.656952]  init_module_from_file+0x74/0xa0
[   85.661273]  __arm64_sys_finit_module+0x130/0x2f8
[   85.666023]  invoke_syscall+0x48/0x104
[   85.669842]  el0_svc_common.constprop.0+0xc0/0xe0
[   85.674604]  do_el0_svc+0x1c/0x28
[   85.677973]  el0_svc+0x2c/0x84
[   85.681078]  el0t_64_sync_handler+0xa0/0xe4
[   85.685316]  el0t_64_sync+0x198/0x19c
[   85.689032] INFO: task (udev-worker):229 blocked for more than 42 second=
s.


Usually wifi, all remoteprocs and anything that depends on lpass/pinctrl fa=
il to probe.

Reverting these:
86fa39dd6fb7 serial: qcom-geni: Enable Serial on SA8255p Qualcomm platforms
1afa70632c39 serial: qcom-geni: Enable PM runtime for serial driver

resolves the regression. Couldn't say if we should go with reverting since =
86fa39dd6fb7
adds support of serial on SA8255p and for clean revert both have to be reve=
rted.

Any thoughts?

Best regards,
Alexey





> ---
> v6 -> v7
> From Bjorn:
> - used devm_pm_runtime_enable() instead of pm_runtime_enable()
> - updated commit text.
>
> v5 -> v6
> - added reviewed-by tag in commit
> - added __maybe_unused to PM callback functions to avoid
>   warnings of defined but not used
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 81f385d900d0..aa08de659e34 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1713,10 +1713,10 @@ static void qcom_geni_serial_pm(struct uart_port =
*uport,
>  		old_state =3D UART_PM_STATE_OFF;
> =20
>  	if (new_state =3D=3D UART_PM_STATE_ON && old_state =3D=3D UART_PM_STATE=
_OFF)
> -		geni_serial_resources_on(uport);
> +		pm_runtime_resume_and_get(uport->dev);
>  	else if (new_state =3D=3D UART_PM_STATE_OFF &&
>  		 old_state =3D=3D UART_PM_STATE_ON)
> -		geni_serial_resources_off(uport);
> +		pm_runtime_put_sync(uport->dev);
> =20
>  }
> =20
> @@ -1878,6 +1878,8 @@ static int qcom_geni_serial_probe(struct platform_d=
evice *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	devm_pm_runtime_enable(port->se.dev);
> +
>  	ret =3D uart_add_one_port(drv, uport);
>  	if (ret)
>  		return ret;
> @@ -1909,6 +1911,22 @@ static void qcom_geni_serial_remove(struct platfor=
m_device *pdev)
>  	uart_remove_one_port(drv, &port->uport);
>  }
> =20
> +static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device=
 *dev)
> +{
> +	struct qcom_geni_serial_port *port =3D dev_get_drvdata(dev);
> +	struct uart_port *uport =3D &port->uport;
> +
> +	return geni_serial_resources_off(uport);
> +}
> +
> +static int __maybe_unused qcom_geni_serial_runtime_resume(struct device =
*dev)
> +{
> +	struct qcom_geni_serial_port *port =3D dev_get_drvdata(dev);
> +	struct uart_port *uport =3D &port->uport;
> +
> +	return geni_serial_resources_on(uport);
> +}
> +
>  static int qcom_geni_serial_suspend(struct device *dev)
>  {
>  	struct qcom_geni_serial_port *port =3D dev_get_drvdata(dev);
> @@ -1952,6 +1970,8 @@ static const struct qcom_geni_device_data qcom_geni=
_uart_data =3D {
>  };
> =20
>  static const struct dev_pm_ops qcom_geni_serial_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
> +			   qcom_geni_serial_runtime_resume, NULL)
>  	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
>  };
> =20


