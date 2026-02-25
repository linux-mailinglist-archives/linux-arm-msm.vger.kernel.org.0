Return-Path: <linux-arm-msm+bounces-94123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDO6HKP9nmlAYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:48:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9897C19859B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95630300B8F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750003B8D67;
	Wed, 25 Feb 2026 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RKgjavTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02369395D8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027291; cv=none; b=FUr/XZJb3GI9YIz5sQZ6MzVgjA37+Ms/PLCPDfQcZeNg1HiFAD14yOkLakpPWQ09/xnfqhKWdIQVk2m6r280maR66jskBr7V6bBfBeeb3i6BmXPBm1yh/G4AyegMoJe8BU6ulvSugNIsmAakirpwee4dfgvDLce/1shpYd0p1xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027291; c=relaxed/simple;
	bh=RlmrWYpC27I3CmQ2g9mtzwZZvCPgpL3v1Rd019SyxTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LH47/TNZ1KORW+5RYoB7YtpubFZhZq+MGme5yBW/Ke4UAalbX2Il8gycUUWQT2Z6Wpt8NVEho5xmHJg6twtkR2rl35oTiXQFRqD9ErKY8ybZN58rZ6PBmMeMrLD6AVmRFv/2n/2v0fxTwpI42j+CsVv8WGEBQ/6FZd0RKZvDCmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RKgjavTx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483a233819aso66297955e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 05:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772027288; x=1772632088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eykmgvSbv0vLUxYY3jrSx+qlZUgAvR5496gVQzQWS8U=;
        b=RKgjavTxc90yhm4olN2IfaQ+LpJmO27IsSpqEWQVLHqveqiqdtA6tQLh/ovpSipFfv
         0brrHI4V/SWiEBFozQPQ0iT6v150WVv1Fa5ZnMcZ0pnGjmneGr/r1YPbt2ri8yirwERo
         NJAJc53BYNY+yhCLXKhiLO/DT9+ggKqxEfyk226n4s/4aBvkSICZyk0ITFcpHaAHSmrY
         L28StWalaM93DWTkdVwVndXDe3fCb1IX8KVoDJOrjr0imHJZXpUfQNThfTllrQoSK5Y3
         OEwm0jtzU/0/qosYmIm4co+4pLfVK5WgNjmoprhsgdCaqlcmrxUaO871J+uvu77oEB/t
         fzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772027288; x=1772632088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eykmgvSbv0vLUxYY3jrSx+qlZUgAvR5496gVQzQWS8U=;
        b=wMTCYP268GZOqg+wioHlBljQP9ZTFzQrutou4WyxdpkiV3rzX4Kao+7Jq2GNJbb8cT
         QOdi1mGW/P+tLRBkPN9+r5Akk69DccuWZw0e8ZF3d3tXiFH/r5QInCQikLcHTe4WQVT/
         V/bdAT0/CZzdIud5QgfM3C1SoFWTIx5++q1WCrBKPg4CZsjS+dg9xy1gYV1xGm5BfmS7
         TYsPLx+6Z+a1/7HofzFsB5u9L7N/O48YTUF/8+yklRSi6R5PIb0ZSfjsZxF1cbg1+mqd
         CkWf60e9jJCRcA6W1YCr0PJna3kuZKSBAosrcvjz4lYNVqXy4PB7b+gQREaq9dhOhNT0
         1IDA==
X-Forwarded-Encrypted: i=1; AJvYcCUBr5lLWmfHDiF6qIPS8qqkgGaYhFEb2gpIVK/oEBBBQaToVsKQG7ZIZoRaYNpNIVKRwpytyn0E9+A4w2od@vger.kernel.org
X-Gm-Message-State: AOJu0YwGgepnxmQm3m4AV93gRFoNNgdiHoZHIX3aip7puEd4sGZTLtdw
	qOLew+3TTF5uD8Orf1IR0EzQF+sA67Bd6VuJau84jMsgrxYKFXVe2bkN/9ttMkHYTds=
X-Gm-Gg: ATEYQzwJM8Q5w2euKITGoz9klY0rqtCWRPyRm0noUsU4vOUxqMBOWtmTjCokJDqPBrX
	wzIZgtFDZ1q7e1/CDNtsHGazT2rAWlqEdmNpqTrPGbYf9BU38nLlbWm9Njm/PvVYCB0xDC5L601
	Nsh4ctSnDsmmC+wmNGa+zSARlhWCJ3APWIWcbvIz26RBJs/tbF+ZF4nwZSu4zZ+W+VoBaKVTWRO
	Em0SkMlhGJTEcPCxmmydW7Id0KNK5bcTTXBaTXn1DUZtB4XT6KVB5WZRknv4SP9k7U5ZT+M1iGC
	/V530FciP2mgXrHQfgNXyKpQDdtIizkvFkSfzJflfIAcSL0DegeVXXL2grgIJohMhm/GPPQqhlj
	Jc5tK2bOie4WPz+lZb6LAORoS7ZRDffBiRq3pxhg96gzjCukDfmvGm3ic31yrfTAW3m+duesfH4
	TIgRNuQnuMQUKZiJy/8B8F9YwT0wCh/8mVQR4FkiW8ZkmPAkZjYHuZt3gRjqj7XvAv
X-Received: by 2002:a05:600c:6207:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-483a963d61emr248565825e9.33.1772027288189;
        Wed, 25 Feb 2026 05:48:08 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7272bdsm62100135e9.10.2026.02.25.05.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 05:48:07 -0800 (PST)
Message-ID: <7c68d164-e2ef-4e2b-9ba3-9a8515128cc4@linaro.org>
Date: Wed, 25 Feb 2026 13:48:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260225-x1e-csi2-phy-v2-0-2f3770f660d1@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260225-x1e-csi2-phy-v2-0-2f3770f660d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94123-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9897C19859B
X-Rspamd-Action: no action

On 25/02/2026 02:08, Bryan O'Donoghue wrote:
> v2:
> 
> In this updated version
> 
Oops I typed "b4 send" @ 2 am instead of "b4 send --reflect" this series 
isn't quite ready yet.

Please ignore.

---
bod

