Return-Path: <linux-arm-msm+bounces-108911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG4gI/aJDmp0/QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 06:28:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2840D59ECE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 06:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BB523006032
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 04:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45CF1FBC8E;
	Thu, 21 May 2026 04:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="j+5JhcKT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5DD1CB31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779337712; cv=none; b=mJZMlE0Y7RauKo8g/ALOrUr7vnK8PG6mr/svjGzD/3Fe734VSJ8nnV3IQOD8FLykdOvrhIZqBCpoLo+ib2VnAhMp5HetpvCb9E5PRZetLeDz++XU/6jjq1yDuI2gX2279XGBD2h9ZMWac3E2grZTJKELJttnqk6u9XawzLJLaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779337712; c=relaxed/simple;
	bh=1fn8nNIfAciVYywUEDqcLHwnewpkWRfNE2Jm7RnUmr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uY4nmZrollvCvEpGtEp54O3hXijragUW/dTbGf0tuEt5b79rTF0aCnsR2uumWZp6/rzFNlWUrhwicRxyyCORE7iyD878FAknPUaM2c3zGgR/qaUON7Wa2Fa9whQLEtzD1r5fGyEFh909NWjq45zo85fyb/T9ZBK0XdK3szsYgN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=j+5JhcKT; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <ffe27d38-5627-4201-ab6f-72656f5188a6@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1779337707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l0Mbqj52klJDaYVrqr1HbvDq6wUyKpixCsk5uYYS4F8=;
	b=j+5JhcKTMjPxoUC95Kz4ElJaqjQUSuzJHi6aj64lHfnS50ZbSIYktmGl372tbEL79RTofN
	Nh1suA+1ruN6eq8riu6dLM6xdrX04zvx5nNkrTDg1UYWIFfDfDOFfifwWh+f+IWysIzoxT
	LU/a/OHrOl5+mbuk/yHlVBvvIq0qQB5/0+Wh48+4E3pDjVUQCx7bvx+4mmF5MMFekqlhYX
	NNFKcFeDjfskZTBH69uO1aG/mzybsdAsxks4vUObfgcU3MjNA0aH73HePwBUm7KaHGR1MK
	itCFy+IG+gUZYDlj/AP0mj5tqj4nIsOIIk7crQ3O3ZzaCU3IX3V+h2x5Wc4iMA==
Date: Thu, 21 May 2026 01:28:16 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1-dell-thena: mark l12b and
 l15b always-on
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, bryan.odonoghue@linaro.org,
 laurentiu.tudor1@dell.com, alex.vinarskis@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-4-mike.scott@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260521010935.1333494-4-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108911-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,dell.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2840D59ECE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/20/26 10:09 PM, Michael Scott wrote:
> The l12b and l15b supplies are used by components that are not (fully)
> described (and some never will be) and must never be disabled.
>
> Mark the regulators as always-on to prevent them from being disabled,
> for example, when consumers probe defer or suspend.
>
> Note that these supplies currently have no consumers described in
> mainline for dell-thena beyond the audio codec (vdd-buck/vdd-rxtx/
> vdd-io on wcd938x), which can release them when the codec goes idle.
> The board-level gpio-fixed regulators that feed the Type-C retimer's
> VDDIO and other rails are not described with a vin-supply link, so
> the kernel cannot keep their parent LDOs alive on its own.
>
> This mirrors the same change Johan Hovold applied to every other
> X1E80100 board in a March 2025 series; commit 63169c07d740
> ("arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on")
> is representative. The dell-thena board file was introduced four months
> later and did not inherit that change; this patch closes the gap.

Acked-by: Val Packett <val@packett.cool>


Asked a friend who has totally legitimate access to the XPS schematics 
about what those components are:

L12B: IO_1P2/275mA
- MOSFETs and pullups on a bunch of I2C, PCIe CLKREQ/WAKE, etc.
- VDDIO for WSA speakers
- NVME_PLN_N_1P2 (Power Loss Notification?)
- bunch of VDD_PX pins on the SoC


L15B: IO_1P8/1.09A
- MOSFETs and pullups on eDP HPD, bunch of I2C, PCIe CLKREQ/WAKE, some 
INTR#/RESET#, SSD Load Switch, etc.
- VIN for Load Switch outputting retimer's VDDIO
- VDD_1P8 for WSA speakers
- VDDIO for power monitor ICs on IR_I2C


Yeahhh.. I think the load switches could potentially be modeled but the 
huge bunch of random pullups not so much. I wonder how Windows handles 
this. Maybe it could be in low-power mode when speakers are idle?

~val



