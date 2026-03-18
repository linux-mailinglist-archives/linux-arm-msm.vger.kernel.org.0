Return-Path: <linux-arm-msm+bounces-98435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLzIHnWMumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:28:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F422BACB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9888330151C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0B435DA70;
	Wed, 18 Mar 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nt7dxDEI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA21E329E46;
	Wed, 18 Mar 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833122; cv=none; b=SEHPeWknGwMQF5fWSQPyRle/rsuq51APJXqy1HdkdvX3dZ8apGR8oduXjmWgsmCtM3zZbhI270fjhXcipeaI/Q6ibx2o9Yj2N0AbsuX9b1YVA6f+CqL4rO7rrKxKAL/8gWQSfwK8aymrZ9OIpMJpkmznmsEwzNqWnC3WBdF2U8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833122; c=relaxed/simple;
	bh=a+Gwji0OKL5eQZIQ/6rN8rq0Dw4D0OuMlM5vMnc0Xhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4IdvjmiL+J3RRltwdpm9WPiC2c2spMXDKxvF+kc9QgnryaYynm8JhY/s0G25rZ9DdaxQoh0Uz6EmSQPqYtzhEmA3C3hZf1lM9SQRsPp8G9a8XcbGdv/aAc5SwEKmVySK70qOcVAGIZtRpo5tvPjQTzXKxDgCHXaVtbrsGgCzzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nt7dxDEI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3C0C19421;
	Wed, 18 Mar 2026 11:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773833122;
	bh=a+Gwji0OKL5eQZIQ/6rN8rq0Dw4D0OuMlM5vMnc0Xhg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nt7dxDEILFsEmHtLmm5Aw6L4T8PJwTgbGQPy/8Vrbj0K9/AdettNQ6/Wbv4XTLk2M
	 axWnE++xOMxvwDgfUfS6oRorqHTt7V8/nfTi9MGARjLsmVEVriLlgBTDHS/QPVOJFP
	 gyQqiF8BWtQtLBHtDur/x+DApVGcglCkYgw9HS6wSowGWc0OT69S4ayZgkVKwGSx5u
	 5QaCB6U7VR7WZ6Lw3b2TyrE89h/h5htQhPA1MO3BbpWTK5rB9YOE5bYrjRwUgsu+BZ
	 yQKmXJR+4QPIux/7gBMmkjsY8tGf740l8LEzahKdCBiOG+TXqvEeX08w3LYK4Q4PCW
	 zx7iqZRWr9X2A==
Message-ID: <122318db-06e4-427b-a575-c84a3f55d2fc@kernel.org>
Date: Wed, 18 Mar 2026 12:25:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo
 pin keyboard connector
To: "Rob Herring (Arm)" <robh@kernel.org>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, patches@lists.linux.dev,
 Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Pin-yen Lin <treapking@chromium.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org
References: <20250225223038.879614-1-swboyd@chromium.org>
 <20250225223038.879614-2-swboyd@chromium.org>
 <174058524070.2499032.1136545857184253798.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <174058524070.2499032.1136545857184253798.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98435-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: D1F422BACB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/26/25 4:54 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 25 Feb 2025 14:30:36 -0800, Stephen Boyd wrote:
>> Describe the set of pins used to connect the detachable keyboard on
>> detachable ChromeOS devices. The set of pins is called the "pogo pins".
>> It's basically USB 2.0 with an extra pin for base detection. We expect
>> to find a keyboard on the other side of this connector with a specific
>> vid/pid, so describe that as a child device at the port of the usb
>> device connected upstream.
>>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Benson Leung <bleung@chromium.org>
>> Cc: <devicetree@vger.kernel.org>
>> Cc: <chrome-platform@lists.linux.dev>
>> Cc: Pin-yen Lin <treapking@chromium.org>
>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>  .../usb/google,usb-pogo-keyboard.yaml         | 68 +++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
>>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob, this has been stuck for a year. Could you please pick it up?

Konrad

