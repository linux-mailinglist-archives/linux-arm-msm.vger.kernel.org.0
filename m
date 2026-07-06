Return-Path: <linux-arm-msm+bounces-116867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zeqOCB26S2oZZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:22:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B175711E52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:22:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=J5s7ClcH;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116867-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116867-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 618ED319AA7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241D01A08AF;
	Mon,  6 Jul 2026 13:48:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AA126FD93
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:48:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345719; cv=none; b=jSUueZpFuezGDaJ+RfTjrNQsl2ZUI7TR0Qv8l2zUDltf5rM6FCfuAa2zHRAusLEOmcuvA28bunymVumbVazjt5iZ6H8Sm9oqkn6zRnQGNsUTJ/vK4n6WcEGN77x0mgKSV1VcLUpTFlqbFBdXDkvD+rz6BxrP3NfkLppMR6F2vpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345719; c=relaxed/simple;
	bh=ibnrBHSTV6YrMSb8FOXrZzy2nwQTPbRf2kWs/xG2sQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItfUeD0dGEyBZ4S/QJOkiKHXi5Z/UVz6AeT7xOD654dFnc3Y6dJkVLF3twoOZ+vjj9mdV15IBVqMR8qXH0pKtKJWZoisppMEqWS5mv2bYtXQlhqrpVw4qdQdejxqJEYTtzOjxc/lXthKxt0RCo1qDHWQG7XM8Wb2lub0w8RJpIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5s7ClcH; arc=none smtp.client-ip=209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697763eeafcso4776407a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783345716; x=1783950516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjiqVTsfvn8YqAihbqyvY/iUlGY8yjdbz0rz3LGCJoU=;
        b=J5s7ClcH8FOAgOBNzlOnO1vROhK+l2CJqQTI+kBN9srZOgL7SJPpW0BrlCqn2ekbut
         wilQ8Kl8rzQklVb6lVxYjH9C+kKfLTLDTUeqiLs6XWuBnts4IWUnFyki3iw+DE1YhpHy
         tOiRGxIEmdL76U14bsH+uGDKp9b7+i1mxj/WRNrdLMrv/HTBu+GcQon9Sk2SJLfmv8Ms
         fZRBHDRpXHJDtj9zYVaHFCwXWfXBzOWIuAEbTHM9yawOshBE/tNMrl08WfUs23mK/BzG
         nO9o0KO6pQAEToSI7AI1FO7ocmRmE4kpuOcJBGxt6XiIRC+5GCDqLY5E20iucvPFqKhI
         q9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345716; x=1783950516;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjiqVTsfvn8YqAihbqyvY/iUlGY8yjdbz0rz3LGCJoU=;
        b=A+Oxd8uOgskmHN3lCB+M5hqKNhXkYUlP37O6yxry9V9kew5bbbMEEZ0Ze08l5M0vZA
         s9tQZn/jVT4evLRfcOsgriv7+nf/flhpkb47jBgIvE/X6f9v3HPb6OPhJAX56hV98FRH
         2lkmf6LWUJjnF1m92fMJNtFEWh03tzVEpHNp1AG1WbIqFOU+VEBBaOjm8klq12X8AKM3
         +lv+1o0WdcGO5ntCrgZPZgODk0HtCNggN0FFOJZE5XAU0poDlxWyZ1rvElpiwuCyHTm8
         TVqaQYrsTD3nsQLgqyuyyxQh8gY1WCGBeVG8WMefRP1bQCtmFbaMnfdWLTySJGB5uI7H
         u+pQ==
X-Gm-Message-State: AOJu0Yyc2k8Vg4PX52GUtgM4fLSCSEED2Iptx1alBvcNic+Jy3IzP3JQ
	OqHBvaGhdzXAWEzHnlz3MWuIRFeKNMFThekNlx+vOdvGRHhOHZB+WwxxKQYGoC5d0kDtC9wM79+
	43fF6
X-Gm-Gg: AfdE7clf9iS1rn1GR3Lmg8HR5mK1uM24cdVHXDfQTJpzq6+aMo2VZNSe57glq7aoo8E
	J4H9a2NVGlRENw4y+Jrh95d/CGxmkbC3KXk90ox5IDJqjmRb1+rgfYv1WS5z6Lem4FedluRBBHz
	vTAOafS7SOphSfUz6aURULgrQR8p/2QDxls7mNQdD2ThDAvl0dEO0SbYbvlcyNLxoNhpPyzVVNR
	GFEmb1lVcrd7WQl+YESaTxOJt0KlSkdavOngM9YZmMA0lWsEI6vFGuuvGhhCGHpLTvXNfb+MzvI
	HYP89aFhYdo2KzVfC19nvkln6f5rbD3NEAxuFR9mWErRueFw2jt8aeiGElb0CUpnO0TTQVTAa8g
	VZAIsBLvYSOV3//spdZw/IFzJSm8kR0yVvc/+JkHu1Vti0/mgegnrTHeLHuwpbgNy8VzHBzWHu3
	mgH18zntTYQf+EJwjaDNO/CWbOHQ==
X-Received: by 2002:a17:906:26d1:b0:c12:5192:23ed with SMTP id a640c23a62f3a-c15a69d9d8dmr25824666b.56.1783345715677;
        Mon, 06 Jul 2026 06:48:35 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f38f3sm771328066b.57.2026.07.06.06.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:48:35 -0700 (PDT)
Message-ID: <dea84207-27da-4ae8-a3d2-1c37aed0096b@linaro.org>
Date: Mon, 6 Jul 2026 14:48:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
 kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <ei7QBvzi3ppMJstCkVu_P-NrpZAVnEk65hBizRPRTzaBJ_NVEI0LobKCwCcLTPbWPPA5GAtO9w7sl7j10Cxrbg==@protonmail.internalid>
 <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-3-999d78a87b81@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116867-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B175711E52

On 06/07/2026 13:31, Rakesh Kota wrote:
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector.
> 
> Add pm4125_data using the abstraction introduced for PM8150B, along with
> dedicated voltage-selector ops and the pm4125_vboost_table covering the
> four supported boost voltages: 4.25 V, 4.5 V, 4.75 V, and 5.0 V.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

