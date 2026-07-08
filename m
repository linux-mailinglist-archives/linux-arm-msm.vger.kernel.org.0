Return-Path: <linux-arm-msm+bounces-117467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gm57NCLWTWqQ+wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 06:46:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B5721A2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 06:46:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=vKc5Tjb1;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117467-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117467-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90CD0301AB8C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 04:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B48305687;
	Wed,  8 Jul 2026 04:46:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C723BD06;
	Wed,  8 Jul 2026 04:46:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783485975; cv=none; b=gzpoPc4PnAXbj3xmq6zZmmi6Xclh33w9f3uDRvv0E9IkW0s3gYuHVNbnX0EY/T6IELateCKDDyY4XiSchekasVq/UL0strXtDieKfNCnD5/bIChWsHoJblr1xogG0j1Sn2M3xegQImSi3ApjybbWiJc1IUk5Qxspas7yBf5HBNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783485975; c=relaxed/simple;
	bh=k8eSz3UPeDb1xHXbixSxk5F6fo5hKwN1ozpHmChFMFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJAH2yeeISQ+V6bw4jDxSb5oBUhPxR31HCyn5t9KGTUb0MSd6taseY42aaHRlbYVwthHFkfjJvy5BAzIem2mffc49IxLV/LDk2pNVahOXO8ieF4uBdtXcfBhVAUE+Oy0hjdFv6upzuf7imKlD4IVNsLt/30l0KI7qCrVpLsG5OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vKc5Tjb1; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=adWoLdqqX8285InOHHUleyt6hKDQ7O9XUGMsAwczw3U=; b=vKc5Tjb1mGE3FAiO6cHvyHHrpL
	WBg7vEIQL2vHQE6sQ+8FChCGGDNEfyjMTYKy5d5bwMVkoCKc+acGk4iK8N81+5mAjwbcGao2+BVBv
	NobgshllXiCRdDAzqw4REuhLIyN3oiP05FJeV31zxsHzrLoU+yfWFk5e62srSNfI8ZXbeP3YawqbE
	JNgANX7zVUAF/Qy871JHpP1zi1qKfigdEtjDXMwaRk6ttYEnGPtu6UkZ9vqBEHuMAbGwnObP2ld9O
	INgJ/CAQqea6A0ELRrN69tBM/KMud6ZM+XTqD0chBXsXNleQcqo8SdyXPOmZZjMJNWaQGJPozAY5f
	vyY7n9OQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whKAl-0000000GKrD-1oZS;
	Wed, 08 Jul 2026 04:46:12 +0000
Message-ID: <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Date: Tue, 7 Jul 2026 21:46:10 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] Add documentation for Sahara protocol
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-1-3a78362c4741@oss.qualcomm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260701-sahara_protocol_new_v2-v6-1-3a78362c4741@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kishore.batta@oss.qualcomm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117467-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 302B5721A2A


On 7/1/26 3:37 AM, Kishore Batta wrote:
> +The packet flow sequence is as follows :
> +
> +1. The target sends the hello packet to the host to initiate the protocol
> +   with the mode set to image transfer pending.
> +
> +2. The host sends a hello response packet with a success status and sets the
> +   mode to image transfer pending after it receives the hello packet and
> +   validates the protocol version running on the target.
> +
> +3. After the target receives the hello response, it initiates the data
> +   transfer by requesting the size of DDR training/calibration data.
> +
> +4. The host sends back the DDR training/calibration data to the target.
> +
> +5. The target decodes the training data and does not find valid DDR
> +   calibration data, target sends END_IMAGE_TX to interrupt the transfer.
> +
> +6. The host sends DONE after receives END_IMAGE_TX.
> +
> +7. The target sends DONE_RESP with mode = IMAGE_TX_PENDING because it has
> +   not received all images.
> +
> +8. The target executes DDR training process to generate valid DDR calibration
> +   data and prepares to push back to host.
> +
> +9. The target initiates protocol by sending a hello packet with COMMAND_MODE
> +   to the host.
> +
> +10. The host sends a hello response packet with a success status and sets the
> +    mode to COMMAND_MODE.
> +
> +11. The target sends CMD_READY to the host.
> +
> +12. The host receives CMD_READY and starts to get command IDs to be executed.
> +
> +13. The target sends CMD_ID = 9 to push DDR calibration data to host.
> +
> +14. The host executes CMD_ID = 9 to get DDR calibration data from the target.
> +
> +15. The target sends RAW_DATA with the payload which contains DDR calibration
> +    data to host.
> +
> +16. The host saves training data in the kernel buffer and exposes to userspace
> +    via the sysfs entry. The host sends CMD_SWITCH_MODE with the mode set to
> +    IMAGE_TX_PENDING to continue booting.
> +
> +17. After the target receives the CMD_SWITCH_MODE command, it sends HELLO to
> +    the host with the mode set to IMAGE_TX_PENDING. The target and the host
> +    repeat the packet flow for image transfer to get all booting-required
> +    images.
> +
> +18. Upon successful transfer of all images, the target sends an END_IMAGE_TX
> +    packet with a success status to the host.
> +
> +19. The host sends DONE after it receives END_IMAGE_TX.
> +
> +20. The target sends DONE_RESP with the mode set to IMAGE_TX_COMPLETE because
> +    it has received all images. The process has been completed after the host
> +    receives DONE_RESP with the mode set to IMAGE_TX_COMPLETE.
> +
> +Subsequent boot scenario with valid DDR calibration data
> +--------------------------------------------------------
> +
> +The below firgure shows the subsequent boot scenario with valid DDR calibration
> +data process being loaded from host to target.
> +
> +.. code-block:: text
> +
> +                        Host                       Target
> +                          |          HELLO            |
> +                          |   (mode = image transfer) |
> +                          |<--------------------------|
> +                          |                           |
> +                          |         HELLO RESP        |
> +                          |   (mode = image transfer) |
> +                          |-------------------------->|
> +                          |                           |
> +                          |         READ_DATA         |
> +                          |   (img ID:34, 0, offset,  |
> +                          | size of DDR training data)|
> +                          |<--------------------------|
> +                          |                           |
> +                          |         RAW_DATA          |
> +                          |(size of DDR training data)|
> +                          |-------------------------->|
> +                          |                           |
> +                          |                           |
> +                          |       END_IMAGE_TX        |
> +                          |<--------------------------|
> +                          |                           |
> +                          |                           |
> +                          |          DONE             |
> +                          |-------------------------->|
> +                          |                           |
> +                          |                           |
> +                          |         DONE_RESP         |
> +                          | (mode = IMAGE_TX_PENDING) |
> +                          |<--------------------------|
> +                          |                           |
> +                          | Subsequent boot scenario  |
> +                          | (valid calibration data)  |
> +                          | DDR driver configures DDR |
> +                          | using valid calibration   |
> +                          | data                      |
> +                          |                           |
> +                          |                           |
> +                          |          HELLO            |
> +                          | (mode = IMAGE_TX_PENDING) |
> +                          |<--------------------------|
> +                          |                           |
> +                          |         HELLO RESP        |
> +                          | (mode = IMAGE_TX_PENDING) |
> +                          |-------------------------->|
> +                          |                           |
> +                          | Boot/Load rest of the     |
> +                          |    images....             |
> +                          |                           |
> +                          |       END_IMAGE_TX        |
> +                          |<--------------------------|
> +                          |                           |
> +                          |                           |
> +                          |          DONE             |
> +                          |-------------------------->|
> +                          |                           |
> +                          |                           |
> +                          |         DONE_RESP         |
> +                          |(mode = IMAGE_TX_COMPLETE) |
> +                          |<--------------------------|
> +                          |                           |
> +
> +The packet flow is as follows :
> +

s/as follows :/as follows:/
in 2 places.

> +1. The target sends the hello packet to the host to initiate the protocol
> +   with the mode set to image transfer pending.

-- 
~Randy


