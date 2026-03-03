Return-Path: <linux-arm-msm+bounces-95159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNWKJ1/4pmmgawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:03:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A21F1FB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 546653074A0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 14:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B758C3DA5BD;
	Tue,  3 Mar 2026 14:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGhTW7gO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522013CF66C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 14:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549759; cv=none; b=ml3a+qXx/0Ozs380mRiIJ+Kzh5jJ/cYQDE8inOLMxPs3PNbCtd41WHjMBMRt0Z+pYW9MNdXYfg9z767RdhNBUNWCsHzjvZGdOd94CIZHnIdB6WzPsboKC9I7UVT4p+d68Y0AMXmGS95tIY03UWpnjUOHgdVmS3QiHicFMvAv2ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549759; c=relaxed/simple;
	bh=hrLPfwP2F8z17FAq2PhT8sl4gqA6PODrX3gTp54f+Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmMp37gxjH0HLjaWWyeLlSshNvKkhugAexG72Rz3jn2MfDC5YB02JusHQSasxl3F1Thvg406ZW6oFrfJeYkV5t763ZMWsb8FPlR8WetcCwRHhibcch5xScM4FkqM1KIl+OQ8fdVVwhJPiFgt83/Q62EKYMJbp14hWkRazoFU9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGhTW7gO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-480706554beso63892135e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 06:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772549757; x=1773154557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+MDG+fHqbczardpdRalYE3e5+KsIfu23xnB/cF6drI=;
        b=xGhTW7gO9H7ydAZ11Q9WXYVBEssnfH0ed4MCMubDHhVRtUe9Iz3Mqiahk8SetgBl1h
         pKK64nUDWNcUiNmlkjFS8vns8/HqqEr6I7Q93am02skUMnvzOGazwx2hCzV0vmZ0EIma
         1CInPOEhYO1fiYUcWTR4PsQB6E+x5JMj62UeagGNYDnB//tLVEt1OczqN4Db9WmmbLzh
         CD6Gx2h5ZrZTPIO7g6ktLhA70wyKSNe5cmEOYchoxpUFKTPk9di1zP8jSDo4fjOOIjCn
         MeEPD1zTsHhyZ3m7RnWWuWi8GwK4MEI78GCNsIFrgtCPCCRE58SRiFlKblgZbMPD8A+h
         NQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549757; x=1773154557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+MDG+fHqbczardpdRalYE3e5+KsIfu23xnB/cF6drI=;
        b=cMiXUYFfl2+ZD7ehlgKsEXevY/bJjx6zrFD6EUwE4waEgLQhb6i2gPEidE8bypPYX6
         lDLcIezwQMJCA7+uaZx4oM67GgfjVRpfNG+g3l7qRtJ+Dk5VHG22WoxILxPLme1Vlecn
         VWcKHg/oPAMw3GeRkJ4sWMNFzifNU4Agv5jnv4yq4znZ88GNwQsegfoGcnqmO5uPwjgD
         MlGp0EQAAhnmoWxEi9v56gHJOD5TapYyHKmY2MLksQeX5BWLVTR1+kjIqAtbfT58pclh
         6JnIUr7DL1tDrnadeV6nPj4rcdLFS2WbYZ6wW+Ie0krr3wFtvDwpa1/KRwI8vTFYsJfe
         Gh1A==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5C4Wbf5NKvkt95uZAG0MS81U2dZrGCUiOXBCqc1qIK9jSpkw8AO5hwMI7qKTQXPVevHwKmfivZFDPlmA@vger.kernel.org
X-Gm-Message-State: AOJu0YxDLp1zMwpYrB9LDIF/obwTlV8s9nDGETbRIECQwi8PFxaRYGsQ
	44XOx75PmxGc1zXeeI105yYEhJpyWvuDOOJqbqjOxFad6pH9ROZ7UGj1r0Mtt3ZEmVQ=
X-Gm-Gg: ATEYQzxFwarLIQOiICJYlOut9U8T5CIvpQyR5/IOS0tZgyHSSLZ/jY4bx9ISQsnFFRu
	wlloaF4Mpw/8sJfQx2vmgTyCRNdoj9PeXBtL8+CYluXFWfnxA+yPlSryfKWkfAFFXen3vO+JDtE
	h5UfHQAt4tlmoncdxeOgUFvPPu/xrFb3xzw62Bx3T41zs2jcSZ0b7ktuZrpjDE4Mg2np/7M3l0U
	SFTTrxMLb8ryFeq4NWDhQPmR/JfJFTBq3knV5Y+WzrxzFjLBw8DWJZWzVVVuclkIP2vqeZ2Rqwn
	Ju/fwrRm8BniWGMOj9ykwPOhyBhf/3y/GdMgstLUHrGyrTZTc+fBiHCGLCCKgVMbilhFiSUbrh/
	YgYLgSZ1pniccf9nClndLTFv+1W1JB5dGw7QDgtTIqs7jzPM3Y8Ax2e7sJK5GpOyH6uLcu9qaMR
	zadjM+BLy6j2/WbJfON/pVE4+fprdwACq5PHQmU25aogldoXTyPH2GVAvLzU6gfMCfvzMsyR+p5
	nI=
X-Received: by 2002:a05:600c:46d5:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-483c9bbbe77mr264243655e9.20.1772549756678;
        Tue, 03 Mar 2026 06:55:56 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm482928495e9.1.2026.03.03.06.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 06:55:56 -0800 (PST)
Message-ID: <1082062b-87a7-4254-b5e7-2dc3769a619f@linaro.org>
Date: Tue, 3 Mar 2026 14:56:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@nxsw.ie>, Bryan O'Donoghue <bod@kernel.org>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <676e2a9f-d274-40fa-988f-e9388ba40f71@nxsw.ie>
 <04f22394-2dbb-4b7b-bce3-9b41ebfb7709@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <04f22394-2dbb-4b7b-bce3-9b41ebfb7709@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7B5A21F1FB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95159-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

On 03/03/2026 12:34, Konrad Dybcio wrote:
> That depends on the use case.
> 
> MXA is always-on (that's the 'A' in the name, as opposed to 'C'
> for 'Collapsible'), but it's not always at the required performance
> state (svs, nom, etc.). For some clock controllers specifically, there
> is no need to put them into the picture, as the rail may be unconnected
> altogether, or only used for some retention mechanisms (which only
> require the rail to be enabled and nothing more)

Does this rail have an OPP table you can share ?

---
bod

