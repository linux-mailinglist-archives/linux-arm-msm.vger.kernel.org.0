Return-Path: <linux-arm-msm+bounces-110561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNF8IBRlHWrLaAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 12:55:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE77461DF22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 12:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA3C530B80E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 10:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109D8392812;
	Mon,  1 Jun 2026 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pAJIFqJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA15257459;
	Mon,  1 Jun 2026 10:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780310908; cv=none; b=r1+/mrE7+UzEmHZZpNXDvTD1FZ7WYPwLJJMbdfzHRz9wFyJiJhjn/CK2Y0zK0Zf79m6bb88bLAvs1WaCVwNk3qrqpLW2GdEN2OaRmfFPQZBtEPCsCT21ETDC8kXif3BU70PVNRkolyUivMmKfRziFvIpTOgOwqvbNBcMs++xE3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780310908; c=relaxed/simple;
	bh=vq7v/eZo0978WXJgs9YTv2H2GgZImRyHXcQrp2ees5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAqb8AaookcmzikbvqLuPlEFUGJCzT3Q7Mpz1AZDcdFOK5YI5MCuMSBXbAjK/F8x8dIUqqI0hIrsnOEkwOhUoMjWsiJUcaM/qqHbOcgcIGfR7J90GS5BTAjPPVORxZSHoyK3SIw2McAuGuSNub2umqSOW9TlZ7mKQJe0nUA1JTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pAJIFqJh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D7C1176B;
	Mon,  1 Jun 2026 03:48:20 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D2023F905;
	Mon,  1 Jun 2026 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780310905; bh=vq7v/eZo0978WXJgs9YTv2H2GgZImRyHXcQrp2ees5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pAJIFqJhF/tTwSYuujWia2xGW7MdCs5MYXG9HuSEV7fVkdK6ORU1xbE6eJluGBQik
	 V39B9fMAurHhqpKyTseAABX2HThb5zRLI/vb6myCiA0OMICZyYYjUqEAyllxMOpGN+
	 Uw31s4wnFLwOfftaFrkGXTEruaAhyOiO4EOAokoY=
Date: Mon, 1 Jun 2026 11:48:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jinlong.mao@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
Message-ID: <20260601104821.GM101133@e132581.arm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-4-d21f4f92c51e@oss.qualcomm.com>
 <20260529153200.GL101133@e132581.arm.com>
 <84614238-35dd-4b10-8267-488d840033c4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84614238-35dd-4b10-8267-488d840033c4@quicinc.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-110561-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,e132581.arm.com:mid]
X-Rspamd-Queue-Id: DE77461DF22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 10:08:55AM +0800, Yingchao Deng (Consultant) wrote:

[...]

>   I noticed that among the new sysfs knobs in this series, the
>   integration test registers (ittrigin[1-3], ittrigout[1-3],
>   ittrigoutack[1-3], ittriginack[1-3]) have no existing documentation
>   for their base (index-0) counterparts, which were added long before
>   this series.

Ah, thanks for pointing out the missed piece!

>   Two options for patch 5/5:
> 
>     (a) Document only the knobs whose base versions are already
>         documented (triginstatus[1-3] and trigoutstatus[1-3]).
> 
>     (b) Document everything in patch 5/5 — both the new indexed
>         variants and the previously missing base IT register entries.

Please use option (b). Could you fold the code piece below into patch 5?

Note, we cannot merge ittrigin and ittrigin[1-3] into a single entry
because they were introduced in different kernel versions.

@Mike, if any chance you could give a review on this?

---8<---

--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -134,6 +134,60 @@ KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) read current status of output trigger signals.
 
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itctrl
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(RW) Control integration mode.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchin
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the values of the CTCHIN inputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchinack
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Write) Write the value of the CTCHINACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigin
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the values of the CTTRIGIN inputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittriginack
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Write) Write the value of the CTTRIGINACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchout
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(RW) Read or write the value of the CTCHOUT outputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/itchoutack
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the value of the CTCHOUTACK input.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigout
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(RW) Read or write the value of the CTTRIGOUT outputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigoutack
+Date:		March 2020
+KernelVersion	5.7
+Contact:	coresight@lists.linaro.org
+Description:	(Read) Read the value of the CTTRIGOUTACK input.
+
 What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
 Date:		March 2020
 KernelVersion:	5.7

