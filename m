Return-Path: <linux-arm-msm+bounces-69675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E9DB2BA67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2E941BA7A1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 07:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4371284885;
	Tue, 19 Aug 2025 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tarb7+2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A915D5B6;
	Tue, 19 Aug 2025 07:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755587797; cv=none; b=aKryvk2DFkPBD2+8ezfwFktylgaPftaziG6RG4iKl+YebiLBIS97YEl2+Ydy27pxiHYK53bODRO1ZK/k0ZcgUvWcOnx61rMvr+S/SJG80/v9pGXHyU+2SbgAxyvGrKVWyKv+xkU21E9P4CyUJwy9HR56MznMa5xd7LX+j3oVAJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755587797; c=relaxed/simple;
	bh=pW8jphqOqOIO98h4scz9n5wwVgDgp3LxF3Uan0tsmHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcCEDUnSIImf9b1azszjEUtA14Wy82qY8AQEDKlwXPGfmqu+5YRNKCIZeBNjVPJHS6THslpfs+vhO1PBK40M1dOkZcU0lle2CB2Jjj31E1FHa/h2IHJCU5BzSDRHOJQ1Ayt/7dSboSAMHaTM3cGPEcDDv927WhHFHwjjM6ouDSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tarb7+2Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB8DC4CEF1;
	Tue, 19 Aug 2025 07:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755587797;
	bh=pW8jphqOqOIO98h4scz9n5wwVgDgp3LxF3Uan0tsmHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tarb7+2ZcKMq2nd3MktE3vAAPxYiRWsPoE0IQGyuWKjhGVxagNdH0mMxRpHFZwiWC
	 XfWA1FlLSBw9v/Xzcs/xsj7jy0ORqdy1daRliMpB73/+ej/JNZvYvBZCBNYxurbM4G
	 660jn6po0TsOeEPXNmFKC/Y7JyYfpqBEiLFiFTwNC9QUPqtMZ5kkh/xviXuEh7Qoe2
	 TK+4M9QJyKxcyZqakcw1LEV+sEvsJpCoIer9PiEL0jSBmpvveSolBcKsw4IVf1NtEP
	 VSz7px3hJcc6ndkUAzGksQzTzvJcn2r4eEFgxLp+V4+F8GfsXAKn21XvQksC9fPoWD
	 1O6ZuT/rkOA0w==
Message-ID: <dcad137d-8ac9-4a0b-9b64-de799536fd32@kernel.org>
Date: Tue, 19 Aug 2025 09:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_cchiluve@quicinc.com, quic_shazhuss@quicinc.com,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 bryan.odonoghue@linaro.org, neil.armstrong@linaro.org, srini@kernel.org
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
 <20250721174532.14022-8-quic_ptalari@quicinc.com>
 <DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org>
 <577d05d4-789b-4556-a2d2-d0ad15b2c213@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <577d05d4-789b-4556-a2d2-d0ad15b2c213@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/08/2025 08:50, Praveen Talari wrote:
> Hi Alexey.
> 
> Thank you for your patience,
> 
> On 8/12/2025 3:35 PM, Alexey Klimov wrote:
>> (c/c Neil and Srini)
>>
>> On Mon Jul 21, 2025 at 6:45 PM BST, Praveen Talari wrote:
>>> The GENI serial driver currently handles power resource management
>>> through calls to the statically defined geni_serial_resources_on() and
>>> geni_serial_resources_off() functions. This approach reduces modularity
>>> and limits support for platforms with diverse power management
>>> mechanisms, including resource managed by firmware.
>>>
>>> Improve modularity and enable better integration with platform-specific
>>> power management, introduce support for runtime PM. Use
>>> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
>>> qcom_geni_serial_pm() callback to control resource power state
>>> transitions based on UART power state changes.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
>>
>>
>> This breaks at least RB1 (QRB2210), maybe others.
>> Currently broken on -master and on linux-next.
>>
>> Upon login prompt random parts of kernel seems to be off/failed and
>> debugging led to udev being stuck:
>>
>> [   85.369834] INFO: task kworker/u16:0:12 blocked for more than 42 seconds.
>> [   85.376699]       Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
>> [   85.382660] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> [   85.390547] task:kworker/u16:0   state:D stack:0     pid:12    tgid:12    ppid:2      task_flags:0x4208060 flags:0x00000010
>> [   85.401748] Workqueue: async async_run_entry_fn
>> [   85.406349] Call trace:
>> [   85.408828]  __switch_to+0xe8/0x1a0 (T)
>> [   85.412724]  __schedule+0x290/0x7c0
>> [   85.416275]  schedule+0x34/0x118
>> [   85.419554]  rpm_resume+0x14c/0x66c
>> [   85.423111]  rpm_resume+0x2a4/0x66c
>> [   85.426647]  rpm_resume+0x2a4/0x66c
>> [   85.430188]  rpm_resume+0x2a4/0x66c
>> [   85.433722]  __pm_runtime_resume+0x50/0x9c
>> [   85.437869]  __driver_probe_device+0x58/0x120
>> [   85.442287]  driver_probe_device+0x3c/0x154
>> [   85.446523]  __driver_attach_async_helper+0x4c/0xc0
>> [   85.451446]  async_run_entry_fn+0x34/0xe0
>> [   85.455504]  process_one_work+0x148/0x290
>> [   85.459565]  worker_thread+0x2c4/0x3e0
>> [   85.463368]  kthread+0x118/0x1c0
>> [   85.466651]  ret_from_fork+0x10/0x20
>> [   85.470337] INFO: task irq/92-4a8c000.:71 blocked for more than 42 seconds.
>> [   85.477351]       Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
>> [   85.483323] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> [   85.491195] task:irq/92-4a8c000. state:D stack:0     pid:71    tgid:71    ppid:2      task_flags:0x208040 flags:0x00000010
>> [   85.502290] Call trace:
>> [   85.504786]  __switch_to+0xe8/0x1a0 (T)
>> [   85.508687]  __schedule+0x290/0x7c0
>> [   85.512231]  schedule+0x34/0x118
>> [   85.515504]  __synchronize_irq+0x60/0xa0
>> [   85.519483]  disable_irq+0x3c/0x4c
>> [   85.522929]  msm_pinmux_set_mux+0x3a8/0x44c
>> [   85.527167]  pinmux_enable_setting+0x1c4/0x28c
>> [   85.531665]  pinctrl_commit_state+0xa0/0x260
>> [   85.535989]  pinctrl_pm_select_default_state+0x4c/0xa0
>> [   85.541182]  geni_se_resources_on+0xd0/0x15c
>> [   85.545522]  geni_serial_resource_state+0x8c/0xbc
>> [   85.550282]  qcom_geni_serial_runtime_resume+0x24/0x3c
>> [   85.555470]  pm_generic_runtime_resume+0x2c/0x44
>> [   85.560139]  __rpm_callback+0x48/0x1e0
>> [   85.563949]  rpm_callback+0x74/0x80
>> [   85.567494]  rpm_resume+0x39c/0x66c
>> [   85.571040]  __pm_runtime_resume+0x50/0x9c
>> [   85.575193]  handle_threaded_wake_irq+0x30/0x80
>> [   85.579771]  irq_thread_fn+0x2c/0xb0
>> [   85.583443]  irq_thread+0x16c/0x278
>> [   85.587003]  kthread+0x118/0x1c0
>> [   85.590283]  ret_from_fork+0x10/0x20
>> [   85.593943] INFO: task (udev-worker):228 blocked for more than 42 seconds.
>> [   85.600873]       Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
>> [   85.606846] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> [   85.614717] task:(udev-worker)   state:D stack:0     pid:228   tgid:228   ppid:222    task_flags:0x400140 flags:0x00000818
>> [   85.625823] Call trace:
>> [   85.628316]  __switch_to+0xe8/0x1a0 (T)
>> [   85.632217]  __schedule+0x290/0x7c0
>> [   85.635765]  schedule+0x34/0x118
>> [   85.639044]  async_synchronize_cookie_domain.part.0+0x50/0xa4
>> [   85.644854]  async_synchronize_full+0x78/0xa0
>> [   85.649270]  do_init_module+0x190/0x23c
>> [   85.653154]  load_module+0x1708/0x1ca0
>> [   85.656952]  init_module_from_file+0x74/0xa0
>> [   85.661273]  __arm64_sys_finit_module+0x130/0x2f8
>> [   85.666023]  invoke_syscall+0x48/0x104
>> [   85.669842]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   85.674604]  do_el0_svc+0x1c/0x28
>> [   85.677973]  el0_svc+0x2c/0x84
>> [   85.681078]  el0t_64_sync_handler+0xa0/0xe4
>> [   85.685316]  el0t_64_sync+0x198/0x19c
>> [   85.689032] INFO: task (udev-worker):229 blocked for more than 42 seconds.
>>
>>
>> Usually wifi, all remoteprocs and anything that depends on lpass/pinctrl fail to probe.
> 
> May i know what is testcase which you are running on target?

Boot the board?

> what is target?

It is written in original report. Did you even read it?

> Which usecase is this issue occurring in?

Boot?

Best regards,
Krzysztof

