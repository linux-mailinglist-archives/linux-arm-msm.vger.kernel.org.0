Return-Path: <linux-arm-msm+bounces-92719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDWrMQDzjWlw8wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:34:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1C812EFF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86A593015CA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1521F2C2365;
	Thu, 12 Feb 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="YvbsAGAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F16F2D060D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770910340; cv=none; b=WPLLuBR26PyFy9Ddoiy9hN5xElHlmxt8kqG94AhP+h8qihlTo+IBTXuTI4MAP0VhqJIeED76AYsBbW6Bi9ChaoMdA/7xOqG0ovp1swDQVIu6XtW9P7IFdTbDm8ctEZ2zm6f8XXgJla3Bazv9IXnAgwawZ80LibAUQyCHez2X03s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770910340; c=relaxed/simple;
	bh=VakrODivZnCIc9XzgFnaeASevfED3a+iFcY/MQAabeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDcqkFqKlT1tWjAfqFLiRw/oSKROpXcVijyS+2G98LEKpIstz11IfuNcasfq0dx3BZsIcrpiHmNXm0JC/WHtUBYRdM8k5Kqk9MZFj1duUHkBY8DjiL8PoW6jkjto7pGgfgFXhdJBCi7LN3sJ5GL87vFJT4iFqt3l4dWSjwZeEog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=YvbsAGAr; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <a5ec9742-e16d-4177-8250-46678fa19b98@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1770910325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VakrODivZnCIc9XzgFnaeASevfED3a+iFcY/MQAabeU=;
	b=YvbsAGArrIfxM9/OKVRXBpOOGava7zEw71onsFhkOsHVg+1dglOVbCS1eQNOwuakrHliDk
	3MBsYFtUu2VLMprxh5GfJRYPVhV9iGa3jYaRicxZpTnkHcDuveCNPuhhQ+GUj6UuMy6m5X
	CKQkBu4Ge5oRQOEjFyca/P2S62w/9YDs6YseG5hc83WEnbKL9KVRxxIWGZslseVVvBTx+a
	UTqqoYjAtjNlO9DdTAS6HwZzGuBii3hTsgwxHPYrSqNJHb+qqf+0hAtmxcVdFJTte9SQpZ
	s2AlPnGcuH6fYUL0y0cr1HBGJATT6enYBnyN2KIH+mG7tlIUYJtAZzL738K61g==
Date: Thu, 12 Feb 2026 12:31:57 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1-dell-thena: Move PERST and Wake
 GPIOs to PCIe port nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260210175001.7691-1-val@packett.cool>
 <2b1b38ef-3097-45c4-835d-d7e367f235b0@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <2b1b38ef-3097-45c4-835d-d7e367f235b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92719-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[packett.cool:+]
X-Rspamd-Queue-Id: 6A1C812EFF6
X-Rspamd-Action: no action


On 2/12/26 9:06 AM, Konrad Dybcio wrote:
> On 2/10/26 6:45 PM, Val Packett wrote:
>> Recently the DTs for most Hamoa-based devices received this change, but
>> the Thena dtsi (common for Dell Latitude and Inspiron SKUs) was skipped.
>> Apply the change to it.
>>
>> Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> huh?
>
> Konrad

Oops! Sorry, I *completely* forgot the entire concept of versions somehow..

This was a v2: pull R-b and Fixes tags,

v1: https://lore.kernel.org/all/20260114203600.5617-1-val@packett.cool/


~val


