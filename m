Return-Path: <linux-arm-msm+bounces-112681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o0fEFKyAKmo6rQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:32:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B606706F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:32:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=MRBzM8C+;
	dkim=pass header.d=redhat.com header.s=google header.b=UdvfcPzN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112681-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112681-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3B63323D0CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C66346FA0;
	Thu, 11 Jun 2026 09:28:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356583AC0C1
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:28:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170135; cv=none; b=FE5OAlUSkPWSy1UUe94mVDSiaZR/Fq0AW63+asW6/XRnW+HbEvyO9G9MSVkFr2k54xETAI2y5GLOnCmyCRbOxxScXn7E0OvbxFj4FevZR0nvgU/RfhK4NS9qoFFiBJDjpplFT7AvHYZ9QhD39WPgCaxvRwjEjR0aNM1rBCGenP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170135; c=relaxed/simple;
	bh=9O9rAbCp6LhGpKp/O/bpx6Kd7dSvDjEqDrMSqpiXYSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LPpiDi01uwIhrt8Y2onGvZ6vOKSsFdxVKosHLB2MB1o34+/axlKzsu5tkgamx2zwcZMqzCfq7Ydg2EoUZGgZ5QV4AgQ+q35QzREzkyqYjXM4qk9XTOqputcUYRN+hKDIMfl6jy3YsK5NCdi0HlwxOEiNMcm8LfEaMLvuD6/g3ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MRBzM8C+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UdvfcPzN; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781170133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3uwOwtcNS5mjb7Xnt9p/AnzVERIGWIFYdvxM1P9+a4=;
	b=MRBzM8C+cY4VcMOu/BnEXVGQmxU9GMpx0aS4N2SoMCb7O7GJXfHqTPHDqqCmHLZnfXn8rn
	QxBH42u3pif/N+pJffPOfr41yKoDq0J8wW6h56FFnXHUEOEzd2QxsBp8a4z1Nr/17R2aIH
	+NqtfF2yYD/n81wGtu8uVtqGQ8XiAxs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-kWB3zW8IN9eFTFiNsrf8LA-1; Thu, 11 Jun 2026 05:28:51 -0400
X-MC-Unique: kWB3zW8IN9eFTFiNsrf8LA-1
X-Mimecast-MFC-AGG-ID: kWB3zW8IN9eFTFiNsrf8LA_1781170130
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-45ef93c359fso6391213f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781170130; x=1781774930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3uwOwtcNS5mjb7Xnt9p/AnzVERIGWIFYdvxM1P9+a4=;
        b=UdvfcPzNPivwmdPmfFZeQ1wHGlC3QhLDOpCyi1dmQ2YXXdLhs+AgYzNDBlCUGQpHEe
         aXnHhvp0/HthClsiL2KgGYQUuWgZpVbZaLKIYLpTQFE9KfhzIEHdQcIrSm8tXK7RxMUr
         MKD0+Y6gxqmtXHx+5/zW9r5VPVbjQIsAdBddv7zF4k/Vm25HDPCOgI3Ekt/C/9ohyeEH
         TURNTSuIXTJtAZB38vh/ACi3hYMaZJSIG9dkNfm4C8jRyiJOJLiy0LfXH8fOjX50XtsL
         jCFuh9a1nY7MrERsjfKe4NyH00Ww35lv84HxHQe3E8upL0vf/dxtmFFrxymQKA1w7IAv
         utOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170130; x=1781774930;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3uwOwtcNS5mjb7Xnt9p/AnzVERIGWIFYdvxM1P9+a4=;
        b=feE75A1637n3XdoC33RFC8aONj6EK8JEpZ/ysyjKP03fE1reMlScrlrXEYbz/WF2M/
         dktmeSYZwhsJ9lK6ufn4qpHTTw/pK+UrBDljMWrzzp58ZnFGLMnMeP5bffafVAu7ixJb
         LNjO3Zmg6wg/j2X57BHMMnbnS8LnN1hwYP07rsTBroobhRrKK5T6A+TnAOSUSDEVUYMx
         0+pnRdtMZLgAZzpCeJLDzfy/AVB3gvEaagYcvKESevLveFjPqBrqqAtunFU8vTi1BzvP
         5yihJRYQQUm0iz5OrKtKVf29FARbfWh0g2enFcyhmQTfMsIDdemRi6BM1fGvCgjociZZ
         M4Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+/AAuFdo3B+K+i1ki1xQU375zE4Oi0dpWrOwkRgPUUE7dN2EwuQ78MZC3pn3GVWfZ9odMnTlFuwFpShuZb@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRv2g4CF51qNMxBFcvOzUZsKPY2YayFsM/Tbveh6w6UuqQOoD
	jSH+1Uujos/3a0b1beyOZUavuuolCicHJLayBbZAHNzhYtfi6gwKWVa7Ayl65D+mjJIbIKtaVKa
	e6+T9fkzRbVsE8NEWj6j68W6Yp50Trz9Hu46sezctWx+k80Az8L6cDwAyY/nN6dllCPE=
X-Gm-Gg: Acq92OGbK/uekglTLygA/Ivhn8ePh2gV+b1luouTLRzk2IOcE0T52VoDJ6THIvsSliK
	0HdIL1pTwccjyXuTw+Vx6nGKDdx40sOrGMCUr9JFfXRjB6u7BFlZ6yJHim57AYLza9zgjuyOV6T
	Avp4Gf1GKTPXP4gawK1ULXLMaC02S4EgX8CEODQ7onvzY27DgJsmQJv77tc2ksvckqeBwRhUUZQ
	Y+jVyVWt8YVj7nj72HTBKUrfl7xBg2SbZlOf4PygVA9cgz41jfM2Ok6KbrnIDblegKC8vLcj7G3
	aXZS7TPfjFxvTGETaGUm5cElcjAHyXQR/e9BuMKVD2YWxSRwRnu3VQnz4TqSVpYuqi5a8X/fZx+
	1yMIEG18dHwJbM0idOz6qbKN0+LrnZBOUXzAhpnpr2jfBBiuNqW4ON85zQr/igSekJg==
X-Received: by 2002:a05:6000:4289:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-460677c089fmr3386193f8f.25.1781170130020;
        Thu, 11 Jun 2026 02:28:50 -0700 (PDT)
X-Received: by 2002:a05:6000:4289:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-460677c089fmr3386136f8f.25.1781170129620;
        Thu, 11 Jun 2026 02:28:49 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm80443345f8f.2.2026.06.11.02.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:28:49 -0700 (PDT)
Message-ID: <850ba1ab-78fd-45b3-9411-97d50bb02ed9@redhat.com>
Date: Thu, 11 Jun 2026 11:28:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-3-f232d9ca0966@outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260605-ipq5018-gephy-clocks-v3-3-f232d9ca0966@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112681-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,outlook.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7B606706F0

On 6/5/26 2:41 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add RX and TX clocks for the IPQ5018 GEPHY to enable the datapath.
> 
> Fixes: f5f2b835e316 ("arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

I think here we need an explicit ack from arm people to take this patch
(and the whole series).

/P


