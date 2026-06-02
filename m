Return-Path: <linux-arm-msm+bounces-110745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHxFJgKQHmodlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:10:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E4462A3C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5063D302C0D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB7C3BBA1D;
	Tue,  2 Jun 2026 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvA12h5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035173BB131
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387221; cv=none; b=cxNDZKDjyzqwInbessXVUAqDa2Oa4EpjjRa9irnMG0/LRzhU8NvnYaydtrGMDqS1zoAhiV6OANQiASua9Y38ULuEG/pwfJRzeHbWZSsf/LDCFOeOuTn0hhSkxR1YoKfCYl0Efk+ADzthtihCMlj83FtJ9b29qBg8lAuaCR95w5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387221; c=relaxed/simple;
	bh=37KTjZRL4G5Ngm5H44pJADKwMDqne/yoFzMJDKE33lg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6BbyRiQdLMoegYC0Bcqth9OTmQLVCV+kY4GIDTZEem3N2bJWT/vT0P0VuH/MM7OTmFuQxFJiNzkXaolLkklFunDt8cqNuceWACGe9WdwnLwghQ2AumZ4Pux6pP4HwU7UL91gh2Dvs/DwRT+lJW0xc6sikBQiENCE3yRa8acomY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvA12h5j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC521F00893
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 08:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780387219;
	bh=YcHbUW0/z6MxMlX2QsScaV0gwWaW5ODpoWMz4NoUgZw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cvA12h5jpr9uomKoHPljh8sjqjG/2oTGFvhgWAPBohOgYG7m+6ZwmqMuCk9K1xGXZ
	 h6hfd7egYu8bzidR9R4pwB1L1RJAPQhZVuBqENux1ajG8rhbiOINOrjLxlmTnzk2ba
	 ghpNfcMkp5vfRhx9QEa5z904pV3YRdk9eBlnLS7MF7DCWiGJqZPi4DRIjDw4wxCgbH
	 E7qrOVlNuzT48NIDfGUfwT8bGjoBelhnKz+gm0U3QLOERDOa9flsQZUlTwNNAViSiQ
	 bkXRVqURF8KMQ2QNT+wIobdFiTlF8ilMt7+g/SzbNyR1zbTyQFoqA80mUzLe4Sa+kt
	 +qYNpnb7MwZGQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3966c0d5ac9so27889251fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 01:00:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YzmlR0ZHFo4kIvDQC4kqtpqeY8UMJ9UaS2VIim5xMx3/NYWurat
	xAcq1BFvxbPM8j6/M6ENHTh97s5oHCNkiOz42ugTpFPGsplmJHvkEP+g+TbmGs9Cug1OUcauhhW
	P2RsMXAga9yGdHFxkVdwfFSTg7uN5rNNyDAV7H+jVwA==
X-Received: by 2002:a2e:8614:0:b0:396:9630:5ed with SMTP id
 38308e7fff4ca-3969a81a943mr7988131fa.15.1780387217586; Tue, 02 Jun 2026
 01:00:17 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 03:00:15 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 03:00:15 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 03:00:15 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfmosOiaYONd1Cs_G8M4bgL6k844gmANUD-tg_H+VcEqA@mail.gmail.com>
X-Gm-Features: AVHnY4LpWcxff9jncmRnjmUuLE6aaoj7VaQIrr97syxQJ21dl10x_BOM0i6sA48
Message-ID: <CAMRc=MfmosOiaYONd1Cs_G8M4bgL6k844gmANUD-tg_H+VcEqA@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110745-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,bgdev.pl,kernel.org,google.com,oss.qualcomm.com,gmail.com,holtmann.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85E4462A3C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 1 Jun 2026 11:46:55 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> The SM8350 HDK has onboard WiFi/BT chip, WCN6851. It is an earlier
> version of well-known WCN6855 WiFI/BT SoC. Describe the PMU, BT and WiFI
> parts of the device.
>
> The firmware isn't (yet) available as a part of linux-firmware, so it
> was verified with the firmware files from the vendor-supplied package
> (wcn prefix was applied to Bluetooth firmware files to make them follow
> upstream driver changes, vendor provided hpbtfw10.tlv and hpnv10.b06).
>
> Bluetooth: hci0: QCA Product ID   :0x00000013
> Bluetooth: hci0: QCA SOC Version  :0x400c0110
> Bluetooth: hci0: QCA ROM Version  :0x00000100
> Bluetooth: hci0: QCA Patch Version:0x00001017
> Bluetooth: hci0: QCA controller version 0x01100100
> Bluetooth: hci0: QCA Downloading qca/wcnhpbtfw10.tlv
> Bluetooth: hci0: QCA Downloading qca/wcnhpnv10.b06
> Bluetooth: hci0: QCA setup on UART is completed
> Bluetooth: hci0: HFP non-HCI data transport is supported
>
> ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
> ath11k_pci 0000:01:00.0: MSI vectors: 32
> ath11k_pci 0000:01:00.0: wcn6855 hw1.1
> mhi mhi0: Requested to power ON
> mhi mhi0: Power on setup success
> mhi mhi0: Wait for device to enter SBL or Mission mode
> ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x6 soc_id 0x400c0110
> ath11k_pci 0000:01:00.0: fw_version 0x110c80c8 fw_build_timestamp 2021-05-25 21:43 fw_build_id WLAN.HSP.1.1.c3-00200-QCAHSPSWPL_V1_V2_SILICONZ-1
> ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
>
> For the reference, the driver looks for the board data for
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=0,qmi-board-id=6,variant=QC_8350_HDK
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

