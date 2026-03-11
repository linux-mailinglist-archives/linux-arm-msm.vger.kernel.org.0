Return-Path: <linux-arm-msm+bounces-97012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PvtLGV/sWmjCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:42:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D380265991
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FAC0318A168
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7673C1973;
	Wed, 11 Mar 2026 14:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mVDHKYgU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="deitwnyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171E431F9A9;
	Wed, 11 Mar 2026 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239929; cv=none; b=iv6JxbkAmClBAeOyXhRRcWufaV3kP9WRTa45YRoDq8PLUXNvQ6hUjQ6ph5c3bjBv4GSVsQ+U/dUF4uFBjYOfOMmxmzyrjyjlnViyMKN6kj48w2FN5IQyoArrr3oSxZ0NPzMNqyI7BOjoTg6JOyAgb0wNnWzkxXwgKdJD+d1JV2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239929; c=relaxed/simple;
	bh=qMMy5A94gz6RsaCuJ8Z2SJDEihUSquADjkr7aioQj4Y=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YDUP+AKpgJYc6ENqIr4mKwY/dJA+u9qyD6bmrvfRScAIngSrH+uKSXSKpoyDpe8+jJ56+nNstvifvFHJ/s3cLgDXG7MZycZPUlpR0v+ngcI3Gkdx99XPgxxVE1fxY3iuOZ1N/j0lFpZ/A1tMLI+jQHfHmm2AQQwwGCk5T9ScsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mVDHKYgU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=deitwnyt; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773239923; bh=NMGLea/U+XVtK+8ZcCy3z+w
	9ohGbvbUlzo/mZjIWQcU=; b=mVDHKYgUVT2o3xdUfqpodzCSrroPVNRQTJrphGnMtumTsW7pDx
	vMIvJfNRcVUwKvRjP5De/qgBXjtick6p99URLcQGGNDPhJV3R8tXx5LG5qcGvHe6Kr7PMZ1QWqY
	JAAiWpgYVWfx8FAlEQMwz70gHeF56JXUTrjn4UceQQZl26Wu4iRDWrz2q/7AhB88sq2ky4lS0jE
	1jy2WIwgJvd4QUdgd6ogIpxQONuqcwH40pIPeXIXPNRhx1bSGVTb/khkQuTUGCywYIniidViobO
	QKQ1SmXrszBMMkD81dVSBuOvMlLyRp4GtHa8+OQXZ8QpO2twE4xvfUiwqcd51q648rA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773239923; bh=NMGLea/U+XVtK+8ZcCy3z+w
	9ohGbvbUlzo/mZjIWQcU=; b=deitwnytlbC2MZD12233j2ZPyV7dA9B4XNkuBpuPgSaVr6hQR5
	HHvTULEqWvDBHtKh5BHihwghxCl9m8vxTNBw==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Mar 2026 15:38:43 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add Redmi 4A
In-Reply-To: <9b6520b3-aa43-4657-aba0-bba89af8a47d@oss.qualcomm.com>
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
 <20260310-riva-common-v2-6-3bfc23996857@mainlining.org>
 <9b6520b3-aa43-4657-aba0-bba89af8a47d@oss.qualcomm.com>
Message-ID: <37f385d1ad7a464771e641807d75f5e5@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	TAGGED_FROM(0.00)[bounces-97012-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0D380265991
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-11 10:16, Konrad Dybcio wrote:
> On 3/10/26 6:21 PM, Barnabás Czémán wrote:
>> Redmi 4A (rolex) is like Redmi 5A with small differences like 
>> charging,
>> fuel gauge, different speaker codec configuration and display.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> I see the Go has some differences in regulator configuration.
> 
> Does the 4A's one match the existing 5A?
Yes they are same, l22 is vana l23 is vdig for camera sensor.
riva and rolex is using 2.8v for vana and 1.2v for vdig.
tiare is using 2.85v for vana and 1.2 v for vdig so l22 min-voltage also 
should be increased
but l23 max-voltage increase is unnecessary, there is no reason to keep 
downstream value there.

Here is some proof 
https://github.com/Mi-Thorium/kernel_devicetree_xiaomi-msm8937/blob/dts/mi8937/4.9/master/wingtech/msm8917/tiare/camera.dtsi#L16C1-L23C65
> 
> Konrad

