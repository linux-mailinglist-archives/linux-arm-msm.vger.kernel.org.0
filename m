Return-Path: <linux-arm-msm+bounces-110842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lBqhDL9FH2rUjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 23:06:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F780631FFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 23:06:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=YF2xCCuJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110842-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110842-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACD4630651EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 21:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6293955DC;
	Tue,  2 Jun 2026 21:00:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3027338656D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 21:00:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434031; cv=none; b=hsHRvDa2uGy8ePCXYBhY5DY9LXUdkFk26fZodfVzxQsl5V27NC0eogAA8I6rso1OqPR9b1vI/H9JMY25wAKWibbMMrEYyh1SqkSnfQuiOeKSc2cRekqqzH8KauvSpMZFfKzBemqehKEroTsB3eRsRuLSmJpBYg52mYGCdr5O6KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434031; c=relaxed/simple;
	bh=uvhufSHkS27pkk5zPIVNeG5TbVytzxmiQf16IumQwvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DItYtQ2vhQZcDoHn5FtLKVh5ZuaMiKZpd8kCmoz8LDM7hBTee9qS8X+dtSZQuZEktcZfz3ulJYluTinCUhr6eVyQPVoABHgWAKeQmeGLI2mqq+Besr2CXlwfpHrk1rfrlGGyWSh/O/k2aenPTOXiqGpfQaVPysCvOx/cRghIus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YF2xCCuJ; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so3641979f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 14:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780434029; x=1781038829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3xo5dhddNfd1GteqLJrkhqAoPlpEA1sqWA6MOtGTrE=;
        b=YF2xCCuJxynz08ycnNg6UkGnNlwN05tSjivjUi6jtdz29GiqQFZJScpt1NiN4daywK
         bJzpU7BKkgtjHO0/WDpfCQBHm9+Y4mOt5Zkzggh8aXQgojDIrr8SlZImvuI/rEmU+k/N
         dsY8DchWBwumWwSe4RDNVzDjOZ7A/A3rwWmPO9vtIrAWhw6PZDVexwu85JyBuk6s34T6
         XEdGt6WD67CL5/X5TRlymbFq41L/kdsx4i6Wt1TP8/4jZJoXihOJU2lba3CwkO5S28Jd
         TMrw06kE7NntZRrgMS1lE8bf6rbDBERJEklUaTnkLOpvqDCHZ6ur3rM6HsSs3IqheaK7
         cppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780434029; x=1781038829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3xo5dhddNfd1GteqLJrkhqAoPlpEA1sqWA6MOtGTrE=;
        b=ANkREpQ7l87pwDhi8w9djQuPEVt9Rk7GKmwPDLaIhU3JvcZfq+6PaP3fGb+1sy2iXO
         8RwYCBdiQJXljpgElZAo2tY/yQ3/eE+MO8SrU29bww+WndA/hxwxh+G4AjocvwxnTvNp
         D+YKYc/uOf/KiSYLqqbqjbA+7mpBiGa5SYF52WKeciCOoWVXp4r1sMf3F5mhmVrvQckd
         KCEOBc8lDFiRoqUIkfi+zBP7WAY/RiXKDzpaucqjTm8BbvwekYX1xOiLKCd7Ztycv6pf
         iOFTDv5JKShssuCtz2FUbW55Cj7DQU5F1WXcE9XYifKThnwUi8rqoAlgkn6VWL1UWpQ5
         48uw==
X-Forwarded-Encrypted: i=1; AFNElJ+Rr+ercrDgkfe/EOPzoe+C0xy+IsZ66XYwRUZb1arvWaPvXL/+8WqLTJbM+aKW+W4ktFGvq4eJt7lbUj3d@vger.kernel.org
X-Gm-Message-State: AOJu0YzkkXtVzL6EqbSOnH1SAV9IhLaNDb2iwOZsnFmtUSr50P5vxBhD
	sdOZnkHj62sIOBqIwFZknbNV6Uugr/IW7EbkQm8DE2BAcFsqQy/Q/LuxY05tJ1Ei0pY=
X-Gm-Gg: Acq92OGNKeN3xmbPaOFwsZk6tsKsemW5hOMXnfS5JokdgbSkXXuKvG/d8+Y1rYq1bEe
	afSslnJ3acrdF1/eUmy34atqaf3WBNtxzUeoDVRKlSwNOpfQ6Oe1o7DAds8fUMiBIr98uUE8ML+
	ZY4yhH1GpU/zkeYRwks5IphdKBqcvSEYGN06JX6Fby1PtzwTWlKqZFP3Vp7eUGFufHo7E+BiwdE
	108fBTUyezhgR41ss6YbWrP1gwClb+zpvzzGxeRBv035c5GDYqTC2ThN19PbkYbihJuqQ8gKZso
	5rq1htFbNBGK0sPBdGfJO7BL5BcIJOB1pLF6WMWfzDBsHpGXw2KcskVvnjw71I24XLaMPD2CTP6
	ziOOwmkBJ0gwi6FZ4hPPLchT7Qd4J0snoWBFxyrAuY5cKuYwUQ5tnTd4i/9QW9RhjnH2sgHMLDt
	vshcsHCPzWuuorlBg+kNvJG2MNdYw5v4cLb3wZ0UU7CxsE
X-Received: by 2002:a05:600c:4513:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490b5fe9bd8mr6349125e9.25.1780434028575;
        Tue, 02 Jun 2026 14:00:28 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6d16f0csm1316135e9.15.2026.06.02.14.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:00:27 -0700 (PDT)
Message-ID: <d45f3000-35e7-4f65-b9fe-5348105abb0f@linaro.org>
Date: Tue, 2 Jun 2026 22:00:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <ah9DMPcKUaTm324I@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ah9DMPcKUaTm324I@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110842-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F780631FFB

On 02/06/2026 21:55, Frank Li wrote:
> phy {
> 	...
> }
> 
> csi2 {
> 	phy=<&phy>;
> 
> 	port@0: {
> 	}
> 	...
> }

Agreed.

However, we also want to support "split-mode" which is a special mode of 
this PHY where two sensors can be connected to one CSIPHY.

After a lot of debate adding ports/endpoints to the CSIPHY itself has 
been pretty much settled on.

---
bod

