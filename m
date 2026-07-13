Return-Path: <linux-arm-msm+bounces-118711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VjoUInGzVGrkpgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:44:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BE37496D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:44:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y8Vpn6+X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZRaJNsRw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118711-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118711-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 256533031033
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DC83E3158;
	Mon, 13 Jul 2026 09:43:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295B53E1D1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:43:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935820; cv=none; b=qnVGidBTlLM7tw5QxDGAtciasPjhgGpDT8OTy3oNkgTw4Vdpif8S6qKSr0eN6p2eVbVkP+q8ll3VFULAIFgR+DjJ1ezDW0VShUt466NZUzyqU1S3rnUSAOJVD603N8VaplX5N3CizVdXWz2db3ApAPKTVJBtLuug4hNhKXGLXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935820; c=relaxed/simple;
	bh=1d1gIgKd/rxGakwIfoQkZDJqlQDsvXgB5BX3doT1Uzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JB6xh7SChG9nubF9bqhdcWkcJhKre13mN0F2q6eqUfkT6UxwhJMzT9AKt7IzHVm5qisjpm4GtP0KpxWYBsqBUYGxPAFXBYI7Rwqjg5LyxaZJPcXllfB53Qj1CR666zsAQRKFRt0hoPBSFIwq7Mj2IwfUMQais7IrBGQ7wvM6Jjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8Vpn6+X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRaJNsRw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dahW953008
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E09LB8FttLtJXfseyW8i4L083+99GbXlC7bLX0eDPNY=; b=Y8Vpn6+XDg1v3UVs
	ifJVSOVnJCK9iNSdhYFo/MtAVTPoxOgcZc8sfLmOylqkBIRGMnO2w46/2H81dmQq
	UI5wdNAZCI5EVeNea6H1A2HBb+e3nUomuojBiODBpWEvoBqrG12i8U96KeN5d3PD
	xe/9fKq9TIgoG8hxGNzf1lDDC6x9OtoDdnLC9pNDAxpvVECVmS0I6p1wpS/8nROZ
	5Wy40eKFg/ULSV8scDUj9VDslMpsukGcgTDHK3jbd81GDMnAJPi5ZRUS6Lez4RRf
	s1R8wuSuVhm7V+wYIobJ/mpCy2QsgIKS700mKTfWLqAuDOlZbiaYJaU7nDzx3oha
	PJdreg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g0fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:43:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38de4c60f0eso328925a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783935817; x=1784540617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E09LB8FttLtJXfseyW8i4L083+99GbXlC7bLX0eDPNY=;
        b=ZRaJNsRwW/zguBharFpaG5zTDNpxrabdFaafPy3fGn/I4V3XQgemDSjSiAF6Ofq/rl
         aSOAitvcPzXeyUMJHGACQXgHoqa52+a73tMQxvQmQ95pk4l4LBWeO1mHsCgZ6rRTLzio
         FPqOC2raoJEulmm+GuvwQpBtFfBr5Bj3YC7TsrrudcK2cvioOVZXlLWLd8/byKZ3dD52
         sSj9L0h2kxokLnECV5Z+t/lPT4NosZ2zOv+Xq/IFo1Ju/KI/4pntt45s7/OAe+EaNJX5
         5VUAq5WdzndpegCstXYXMzR2JOsnkAUTA39zUJsA1HXf+d/MjKMllh7FUmhCheLDLzfr
         VgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783935817; x=1784540617;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E09LB8FttLtJXfseyW8i4L083+99GbXlC7bLX0eDPNY=;
        b=K0y5FacH504HyS3lNShHGcIsUu44Dj3Y6dUQoEYh+OQWdCw3TiM/X+2EyC0FrZvocC
         dviwwJabmt1W7d8vHUAdHPpfRpYoFz+a8wibuq12nJbXIU41kNUF+er4YTaNZhdSysBM
         KKQhpD4zl8ysnS8F7mMYClM9UGlA7TMqlrXfqzVtgXupr4Tm9rYDtdgT2VjZun6Ah/fX
         V+I85CgmBgU1+ehejNyEilws73tRl9oCnh9u4ZVaU3qQzTjGMUIclspCd/EZ9h/pGxaQ
         phwxGqaKa/Hi3PtxPGUl8VftqWZ7n6uIz/aggihKj22eVlHzSE7ha7wO0DyV2XGa0j/p
         lplQ==
X-Forwarded-Encrypted: i=1; AHgh+RobRwTOB3haajdBTKAf2lFRD26YAOLR9Mz6mwN+dgue737/luBnB9ridK8SoF5FpkIfpeSl3Om0Rh5E1213@vger.kernel.org
X-Gm-Message-State: AOJu0YzOO+fNwaAkHjtaK8c9zfy5aL5GZz2s0wBGkPgRhF1mDZNwhe4E
	/o+8QB+FlJ9ab7Ro/Kxop0zYQ9Kd+joGY+MQzxydc932WksYC2E5U0msiauznrfrPi8QJX+6xsB
	ng83znX92vWjnWYLhJK+6lsXEjJtsMa24rH7iKYTDYDyT1Wp30EKzcSEFbkvGotkE3d9b
X-Gm-Gg: AfdE7cm1GGxEnnccS/z0BgHyAMenT6W5SxaCAMAY5dLq+TumMQTIfCC3PnUftvb15OE
	8jMJ4w1YOc5Ir25BmroMeSGOuyvVLvYsAwSVYG0OWj+9Oqve8pVUFKjVPMhzPE3m/W4cy3XAoHo
	Wyw9dcVRkMXazF0mnyQ82/iCtdKBl7iQb0x39BL8UgQGN23dMtw/GLmbIoZkUHqXQzdj1eGFOSi
	JjTR98smWTSSQo9ddvVAQJkLv+lCcAfC9EU046ZdN3Z4kf55mmRLCRHoWFY+uvzbRXgxz7geDfr
	a/LuVORjLMwt0v6p4MrS1xyDkDgny2BPXlkf3vs60vyOTkraX71rs/jzRoDagu9i4YyDHpQf88r
	TQrezVjmSrT0Xg7654PtBYrVuRxdD9HKYDw5ypnaK3HnphLBcTA7aMGeVrR3jFA==
X-Received: by 2002:a17:90b:2b4b:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38dc7b7063dmr6317600a91.6.1783935816627;
        Mon, 13 Jul 2026 02:43:36 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4b:b0:37f:fc3a:382d with SMTP id 98e67ed59e1d1-38dc7b7063dmr6317583a91.6.1783935816051;
        Mon, 13 Jul 2026 02:43:36 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm37848388eec.16.2026.07.13.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:43:35 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mengshi.wu@oss.qualcomm.com, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: Re: [PATCH v4 12/14] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Mon, 13 Jul 2026 15:13:29 +0530
Message-Id: <20260713094329.4105208-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709095726.704448-13-wenst@chromium.org>
References: <20260709095726.704448-13-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Kjx-zRnhv5CHxwlDk70094X56zaESYwu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwMCBTYWx0ZWRfX8TVQkALRTUGx
 Y2EvugqV/vlGIRNrnL+hieOr5g+q1Q5m7meMF2DwOOojJ8UFhR5b/XBY31bcI6uet7Ag1zTtNcY
 CnS2OqTBYSpHV+H6ItVUYex+Nqq4Bzs=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54b349 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=AJ_gLjkuB4Bcd2vTZOEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwMCBTYWx0ZWRfX/Ahv0i050SYV
 /doJuNHy0iS/VkkdePHlLBY3vOwUMzcrYm8wWPO2ikNFMB2g/RHJY/7Lm1dazVArb2Wwrd/wYHd
 pQQkj7X4y8iPEzYKjW42ixI20J1eDLwu4OwUhwEM559JatcvZaXVjvD2sv7q2NNnI3IACiaEkWO
 ievuxbjgrwAuuEGXQUCbKpid/nxhQzTgTlqUZCwXonV6OUJnRQ26OWQvJbXtpmo/27YwW2zXFgH
 sgDW2dHpIFqWRCBaodM+RxYYkzlEDoZ1xMVGFL+r7AlWfrC6nO+dwsQzV+GijaByvfUHx8h3LzK
 PVG5V1Ku17Cll2UVATwGUaZu9B8/N3SizgcOpQhqDGAEKCyn558NIrRAhg+PGJ7XKx1dRGLOw2Z
 SEevUe9Q7giv/QWNhVeF7DFMWVZh/Kv++3aBT11uMgWcZnDS8Dc/qEgkJdMP7BOCX5820wG8fGD
 MqMXQSTA24Tse8wQuug==
X-Proofpoint-GUID: Kjx-zRnhv5CHxwlDk70094X56zaESYwu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118711-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wenst@chromium.org,m:brgl@kernel.org,m:gregkh@linuxfoundation.org,m:andriy.shevchenko@linux.intel.com,m:mani@kernel.org,m:stern@rowland.harvard.edu,m:linux-pm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mengshi.wu@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,chromium.org:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8BE37496D8

On Thu, 9 Jul 2026, Chen-Yu Tsai wrote:
> The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> UART for BT. Currently the driver only supports PCIe and UART.
> 
> Add power sequencing targets for SDIO and USB. To avoid adding a
> complicated dependency tree, rename the existing power sequencing units
> "pcie" and "uart" to "wifi" and "bt". The existing target names are left
> untouched. The new "sdio" and "usb" targets just point to the renamed
> "wifi" and "bt" units.
> 
> The "unit" names are internal to the power sequencing framework, and
> should be confined to a single provider. The names are only
> informational. Dependencies are tracked with pointers to other units.
> 
> The "target" names are the strings that the consumer uses to acquire a
> descriptor with. As these remain the same, existing users will continue
> to work.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Expand commit message
> ---
>  drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
>  1 file changed, 27 insertions(+), 14 deletions(-)
> 

Hi Chen-Yu,

We tested this series on the Qualcomm Hamoa IoT EVK with both USB BT
and UART BT M.2 cards and found an issue with UART BT power cycling
when the USB hub is active.

The "uart" and "usb" targets in this patch share the same bt_unit_data.
The USB hub acquires the "usb" target in hub_activate() and never releases
it, so the bt_unit enable_count never reaches zero when hci_qca calls
pwrseq_power_off("uart"). As a result bt_disable() is never called,
W_DISABLE2# stays deasserted, and the BT chip cannot be properly reset.

Observed on Hamoa with a UART BT card (WCN6855, sub 0xe105):

  With your patches:
    lsmod: pwrseq_pcie_m2 ... 3   (provider + uart + usb)
    btmgmt power off -> GPIO116 stays HIGH (bt_unit ref 2->1, no callback)
    btmgmt power on  -> "hci0: command 0xfc00 tx timeout" -> failed

  Without your patches:
    lsmod: pwrseq_pcie_m2 ... 2   (provider + uart only)
    btmgmt power off -> GPIO116 goes LOW  ✓
    btmgmt power on  -> hci0 UP RUNNING  ✓

USB BT card (WCN6855, sub 0x3374) tested separately works correctly with
your patches.

The testing was done with the following Hamoa-specific patches on top of
this series:
  [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
    https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com/
  [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UART BT variants by subdevice ID
    https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-2-5e725091266a@oss.qualcomm.com/

The fix we verified is to give "usb" its own independent unit so its
enable_count is tracked separately from "uart":

  static const struct pwrseq_unit_data pwrseq_pcie_m2_e_usb_bt_unit_data = {
  	.name = "usb-bt-enable",
  	.deps = pwrseq_pcie_m2_unit_deps,
  	.enable = pwrseq_pci_m2_e_bt_enable,
  	.disable = pwrseq_pci_m2_e_bt_disable,
  };

  /* change usb target to point to the independent unit */
  static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
  	.name = "usb",
  	.unit = &pwrseq_pcie_m2_e_usb_bt_unit_data,
  };

With this change, uart_bt_unit reaches ref=0 on UART BT power_off and
bt_disable() is called correctly. Since a M.2 slot can only carry one
card variant at a time, the two units do not interfere in practice.

Would this be an acceptable fix, or do you have a better approach in mind?

-- 
Best Regards,
Wei Deng

