Return-Path: <linux-arm-msm+bounces-108909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EMeEBSCDmrq/AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:55:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0DB59E933
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CEFD3031AC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67FA299959;
	Thu, 21 May 2026 03:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="jGJZCG6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA80D54654
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 03:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779335596; cv=none; b=ke2tpBpL6S1xEGQ9If00NX2RKxsEn42/wO0xub/teh7bhQxiUo2X8xNBX04PatAAuV85ZItwrOa8cWd0PQa4CXzC04HQFezDf3KEVaL92fkcNRUR6mFOBvl0zoUcbKnjieeb04wzRw2GdrHIk96KiX/QEl+GLfcagrKvwDqGwAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779335596; c=relaxed/simple;
	bh=v0bjRfOnniX9RSbiXs+u9ZgT6f1izKXujtZVBzZoDZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uANvRZAQn1y+v/kYjW3ILbHFfbZrO9gS984i+p9yTC1ftN2fje29Mxz5qdmWY/U4/38oQ7WbvMTYNmEZ+zEXSJXHGVYHX6N5cYrLh3JMHO/VsMmlNFiIODlJ8KtAuu6pEqBSd2H34TlezMPIzUeJjQB8eIW6xwYPRTu5iK504ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=jGJZCG6b; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <e5b40f3c-25f6-401b-84d3-2fb96897d936@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779335581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4jM3IMyfdKs25SZpyNI9Om0n89NTgnxOlePLIEzgJW8=;
	b=jGJZCG6byCD/8otwlmej1JB83HUbaCT2TxVp0eUshi6T/i0B8OoC+6X/uIaAllqmHSfDE4
	dRB6aBQ2L49GtoCnirTnmwq3NWwmwoDRDjqXAt1mJgXCqCUaR6d+AbJtO+7cF5x9w0FBmZ
	8Xg2tcrTIO6X3vdccn1JypNDqn0O1gF27uMbcnAP+3NMQtYIfFEha1UyQoaGUHNOCwlTM9
	VeQClJxN/Dac/xxyGfbX0jM1vSJLss31MW/4NsuvU76xXr1QQx/3pf5zD9c49Rf7otHE0M
	5oXdX8wvRqyombtSwwNY21+iAsoSGJnHVg6pOA5r+c+xXodAUUcGQUkd0RylDA==
Date: Thu, 21 May 2026 00:52:47 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to
 256 MiB
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, bryan.odonoghue@linaro.org,
 laurentiu.tudor1@dell.com, alex.vinarskis@gmail.com,
 linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108909-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,dell.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.10:email]
X-Rspamd-Queue-Id: AA0DB59E933
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/20/26 10:09 PM, Michael Scott wrote:
> The 128 MiB linux,cma reserved-memory pool on dell-thena is too small
> to support the camera pipeline in parallel with the normal Linux
> desktop. On a freshly-booted system with GNOME running, the typical
> runtime consumers — msm DRM framebuffers (Wayland triple buffering on
> the eDP panel), qcom_iris video codec buffers, qcom_camss VFE
> pre-allocated buffers — already occupy ~100 MiB of the pool, leaving
> only ~25 MiB free.

Huh, I'm surprised that drm framebuffers use CMA… IIRC, msm drm can work 
fine without a cma node present at all.

Indeed, with a desktop on a 4K monitor I'm seeing..

CmaTotal:         131072 kB
CmaFree:            1704 kB

> The libcamera "simple" pipeline handler used by /dev/media0 on
> dell-thena allocates four ABGR8888 frames at 1920×1088 = 32 MiB total.
> That request fails on the fourth frame:
>
>      ERROR DmaBufAllocator: dma-heap allocation failure for frame-3
>      ERROR Allocator: Stream is not part of /base/.../camera@10 active configuration
>      Can't allocate buffers
>      Failed to start camera session
>
> resulting in gnome-snapshot's "Could not play camera stream" and any
> other libcamera-mediated app being unable to actually stream.

..however I couldn't reproduce any failures, Snapshot started up just 
fine, lowering CmaFree to 300 kB.

I have even launched both Snapshot and ffplay with a 4K AV1 video 
through av1_v4l2m2m, CmaFree went all the way down to zero but there 
were no errors whatsoever, both worked simultaneously just fine. o_0

I think drm buffers might just get evicted from that area or something?

> Bumping linux,cma to 256 MiB (a 0.9% reservation on these laptops'
> typical 27 GiB RAM) leaves ~150 MiB free at runtime — sufficient for
> the libcamera buffer set plus headroom for video playback or other
> CMA-hungry workloads in parallel.
>
> Tested on Dell Latitude 7455: with the 256 MiB pool, CmaFree at
> GNOME-desktop idle is ~150 MiB, gnome-snapshot streams the OV02E10
> camera cleanly, and `cam -c 1 --capture=2` succeeds.
>
> The companion board files dell-inspiron-14-plus-7441 and the upstream
> .dts variants inherit from x1-dell-thena.dtsi, so this changes the
> pool size for every dell-thena-based laptop in one place.


In any case, that's not an objection of course, just wondering why it's 
working fine for me and not for you..

Acked-by: Val Packett <val@packett.cool>

~val


