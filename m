Return-Path: <linux-arm-msm+bounces-100192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN1jK+gAxmk/FAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 05:00:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4428E33EFDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 05:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB486303663D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF5636A036;
	Fri, 27 Mar 2026 03:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="K7oalgpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEB61C8604
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774583990; cv=none; b=OekS21PBBRFSaAcY2Nv8mNef+1yIPoEslFMDNLvn4v92aSm+nGO7rAtKZ8el4m2Vbd/5Rzz/BA0Dvmgc2dJnrEvnQVyMPL+U3CvcczTRszVUIT/V93IIKAEajGqaP9FzM9SqNv+VXT6KNOy/Ch6v9b0C5Kr1vToKxtO0e80hFv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774583990; c=relaxed/simple;
	bh=M8yHXRrctmAptnPlUik3AXAXll3yIV1xDj26jXEAp9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOJksGp1M7Qf4n+DnLDpguCrsb7xPST/oOJmCCY6zplOsof5AkDweVJ3DhNK+Kc0Ninz4JK5m0txLp1ZzRkQiUViJgo3PiQEa5NXlf05lRPG6hV1j0VACIdngdSgkQfxx7YZg9eMykV8uCMg+4m3i3nlTvVVXEi++Fzf7AvJFB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=K7oalgpK; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <a6cdd237-3b11-40a8-865d-cfe97f97f01b@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774583985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dakhjmCQp6GVkDLoDUU4hYoePqqMLtz3QnhrzCmmiRI=;
	b=K7oalgpKKghvuokGaQvZG5Rg8KjZLI8pdUE1bOullKLN2FfVpUl+GCPLvJewx/WuwRlAhi
	wIZYzD4GaKnRChKSlNYQLgVFCUIIJ1aoWGRcbYLB5v2vUyAMFYdwa77aGI0lHQ5pYACRGJ
	iDFdepE/D75H45eFCLJxBOcwVgMmQ7CzZwSZKscNmRBz73BKtMQEwecimomlgG/ussJW0D
	LnoybeyIa8aTosgxrxqe7UwPwfM+Kz7I2oTtgN7WsGRVxMuxKbur7BqaA0SeJWNrL8d1DD
	fPuiS/dzf6BQ4pwLVGUXWDvzwiNV7A0KIFte8HKHDFkl4eJBJwUpiPyGDI1LUA==
Date: Fri, 27 Mar 2026 00:59:37 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
 <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
 <41476442-648a-46f9-a9e8-f5f4f7cf7bb5@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <41476442-648a-46f9-a9e8-f5f4f7cf7bb5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100192-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[packett.cool:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,packett.cool:dkim,packett.cool:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4428E33EFDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/26/26 7:47 AM, Konrad Dybcio wrote:
> On 3/25/26 11:34 PM, Bjorn Andersson wrote:
>> The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
>> ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
>> display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
>> headphone jack, WiFi, and Bluetooth.
>>
>> Introduce a DeviceTree describing this device.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>> ---
> [...]
>
>> +&pcie3 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie3_default>;
>> +
>> +	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> In lieu of the recent changes, these 2 properties need to be moved
> to the root port node under the RCs, for all of them
>
> Konrad

…and without forgetting (as I have for dell-thena until noticing in v4) 
that under the port nodes, it's now called "reset" instead of "perst"! :)

~val


