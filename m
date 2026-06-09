Return-Path: <linux-arm-msm+bounces-112137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pXDjJ9zvJ2q95wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:50:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B1965F210
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:50:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bZ5xwXc0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112137-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112137-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9513D300AB33
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAB03F99EA;
	Tue,  9 Jun 2026 10:49:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9B3F8ECC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:49:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002167; cv=none; b=FblBF4GVQjm+YOuj69XFZ4Y2WbGaC35P8VgTP5Z9c8Ds/cxVubqOVQ+djrMZYoepz4VZuw0Bw3l1MD4vgGaEWET42L2QX5BknT9p7Vxnv7dpMMiJnU8RbkYyKI3PBbHsbkpyYdjewCyPBaSUb/YQzIj/LHxur9S3JDSIcxSsCyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002167; c=relaxed/simple;
	bh=01L91rUB/L9HYoDMAPJ9Drd+CHoL9mYW9Yg/nS/zTUU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euLbe6q1Z3zsZTVqhvuORT3gPUH0dqxtwm2+ZQoI5DETnKAjbIorPvN9cqBztPpsNzAWD3Ne8ddvc1pcUIVEkU0Ps0Mb8Jo2zZaafoL/jmfz8tLinO2CLAU/EMwRvvivbh96Zwbn7pkMg/Y6DIoWiW2DD4PTMeZ8reCKT09OHY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZ5xwXc0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C321F0089E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002165;
	bh=goyB+rETfMey+3Y369yBIQXS1TEwIMkayGYni4dN4Y8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bZ5xwXc0EVnekDaF12x13TjnF359uh56V2I13eYxswpTZmYsMug6oyelahjVWDk9H
	 Y2/ir4pZsREm1CXWXbMNqfB7hhhRgh2KTxzbS4Oq2R1diGCOYuGcxm7nEXcg0rOP0j
	 4q7ZAExzGkguXC3bPUwevZ8RCIO6fvIf58kKJHEMe3sb9Pj7ljRdURB/2hINhDeM9h
	 dqpOXGNdq7BanSQY/n4qrlkXrAMeXtJDK6M4LphsHuBRfLxQcFQG+1WtbOFnZGKJQh
	 EssRDIE7QmSZyyDUB3rFaoOnDcaSvqBw2izNPCPWEahOZhK9ldbcSZkZ8yTI//imrB
	 gaEeLgRo6Hhyw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3967725a77fso53183621fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:49:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/65MLV8jQ+n1v5xGZWAFUN3B9ywjbc6tC4wXv0FVq5AYg/i+OMQ0KNGRKdiQZKA7hczUYDpv6o338chr5f@vger.kernel.org
X-Gm-Message-State: AOJu0YwSJUzTYtgd+lY3/daHY+B6Fa3nDu+kmmsP+jA5BONpngDKUv8r
	FRnODhm1w9cpgJsfjxWbGxW9FORF0uIZ4pfiF/8UKbcuBQzLIK6txxpPYjj6NfMX3vIbVK0hQu2
	7+BFTl6tMetByWBf/8OLxNUVlgxBIG82g12F6YAdaaw==
X-Received: by 2002:a05:6512:1096:b0:5aa:8823:e30e with SMTP id
 2adb3069b0e04-5acf91501afmr510020e87.48.1781002164314; Tue, 09 Jun 2026
 03:49:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 06:49:22 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 06:49:22 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <8697f148-5e21-44b4-a949-9d348e39c2ea@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
 <CAMRc=Met_U-1gDmGFM9hSWFc5vvs4SuRQOa3hZcfUo190rh59w@mail.gmail.com> <8697f148-5e21-44b4-a949-9d348e39c2ea@molgen.mpg.de>
Date: Tue, 9 Jun 2026 06:49:22 -0400
X-Gmail-Original-Message-ID: <CAMRc=McV2sz3rd72oXrJFXK6qJTfGdNxciqckUrFJ0SaZ1+dTw@mail.gmail.com>
X-Gm-Features: AVVi8CdwNBVFdYg9hyK8C1_tnkRXUJxsISrgKsWa0jxOViZvA3ZLlxtnEs2YAik
Message-ID: <CAMRc=McV2sz3rd72oXrJFXK6qJTfGdNxciqckUrFJ0SaZ1+dTw@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: qca: Add BT FW build version log
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112137-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pmenzel@molgen.mpg.de,m:xiuzhuo.shang@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:brgl@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,holtmann.org,gmail.com,vger.kernel.org,quicinc.com,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,mpg.de:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44B1965F210

On Tue, 9 Jun 2026 12:29:41 +0200, Paul Menzel <pmenzel@molgen.mpg.de> said=
:
> Dear Xiuzhuo, dear Bartosz
>
>
> Am 09.06.26 um 11:39 schrieb Bartosz Golaszewski:
>> On Tue, 9 Jun 2026 09:54:17 +0200, Xiuzhuo Shang said:
>>> Printf BT FW build version log after BT FW downloaded.
>
> Please paste the new lines, so reviewers see how it is going to look
> like. Please also document a motivation (answering Why?).
>
>>> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
>>> ---
>>>   drivers/bluetooth/btqca.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>>> index dda76365726f..04ebe290bc78 100644
>>> --- a/drivers/bluetooth/btqca.c
>>> +++ b/drivers/bluetooth/btqca.c
>>> @@ -143,6 +143,8 @@ static int qca_read_fw_build_info(struct hci_dev *h=
dev)
>>>
>>>   	hci_set_fw_info(hdev, "%s", build_label);
>>>
>>> +	bt_dev_info(hdev, "QCA FW build version: %s", build_label);
>>> +
>>>   	kfree(build_label);
>>>   out:
>>>   	kfree_skb(skb);
>>
>> This string can be read from debugfs, do we need an additional message i=
n the
>> kernel log?
>
> In my opinion the firmware version should be part of the Linux logs, as
> that is what users share with bug reports, and you do not want to have
> several cycles collecting information. For example, currently for
> QCA6174 it=E2=80=99s currently:
>
>      Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware rome
> 0x302 build 0x111
>
>
> Kind regards,
>
> Paul
>
>
> PS:
>
> ```
> $ sudo dmesg | grep -e ath10k -e Bluetooth
> [   17.880668] ath10k_pci 0000:3a:00.0: enabling device (0000 -> 0002)
> [   17.883428] ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2
> irq_mode 0 reset_mode 0
> [   18.138972] ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000
> chip_id 0x00340aff sub 1a56:1535
> [   18.138977] ath10k_pci 0000:3a:00.0: kconfig debug 1 debugfs 1
> tracing 1 dfs 0 testmode 0
> [   18.139068] ath10k_pci 0000:3a:00.0: firmware ver
> WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
> [   18.206593] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A
> crc32 d2863f91
> [   18.221145] Bluetooth: Core ver 2.22
> [   18.221802] Bluetooth: HCI device and connection manager initialized
> [   18.221807] Bluetooth: HCI socket layer initialized
> [   18.221808] Bluetooth: L2CAP socket layer initialized
> [   18.221813] Bluetooth: SCO socket layer initialized
> [   18.258187] Bluetooth: hci0: using rampatch file:
> qca/rampatch_usb_00000302.bin
> [   18.258192] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8,
> firmware rome 0x302 build 0x111
> [   18.301557] ath10k_pci 0000:3a:00.0: htt-ver 3.87 wmi-op 4 htt-op 3
> cal otp max-sta 32 raw 0 hwcrypto 1
> [   18.381567] ath10k_pci 0000:3a:00.0 wlp58s0: renamed from wlan0
> [   18.619003] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [   18.643646] Bluetooth: hci0: HCI Enhanced Setup Synchronous
> Connection command is advertised, but not supported.
> ```
>

Fair enough.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

