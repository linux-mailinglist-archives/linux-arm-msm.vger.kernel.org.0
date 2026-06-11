Return-Path: <linux-arm-msm+bounces-112679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yz/mGON+KmrKrAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:24:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E177F6705F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:24:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=cLkMayuJ;
	dkim=pass header.d=redhat.com header.s=google header.b=TTd2jaqu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112679-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112679-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 226D13051A77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7A63ADBAC;
	Thu, 11 Jun 2026 09:24:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509963BB69A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:24:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169862; cv=none; b=BmkspNLEHlY088atApXMZRmt+zQuw+/+k2lecKQ0RPLs3IedzsF2Fbmzh/dQfZTSe1AljBX8iByICF8SfVK0jkmd7BiUVt99ur/hCcmsgQRAgilf34eyRdlBuWhl4Yo1bfEQp3D5wtXqrQezTJ/oAFSqoWySbdqGoEd75xhdvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169862; c=relaxed/simple;
	bh=TePx6sAT1Rm99eGMWoZiia/B6i/vV66CziWOWxaFkkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdCw9a5BVymFrPsXNAGDzR9slQx/zOcYBPwObzEIZB5qHDBDJur8RbbKL+1mWyMrbbk98iX9UJ563F9rvOpXKOTpXtJ+z6qITYY2MNGFwV7i0zYVXltGHFMYnU3ysh6rDusQif1dEKK3C+3zZQkSvhM7RvCYMcb4PRADhw9UZ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLkMayuJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TTd2jaqu; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781169859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+2xaEKiZA3gEu8WbXqmvB4iNhVU2+4QCQa/jHjj52U=;
	b=cLkMayuJk3uLbZ4+LYQdKPEey1IoirQ6Vp4AVRTGgKRP9TPHVYOvTpT7WcVRf1FChg8DS8
	qxSrEblPHcRSv+BhUZl237nKJ8apOaIIcGZHBB78Ev/d6Z6CI7RpCfBBpl6cIs5eUnqK/L
	/2XR7tk19wzeTOT6ALzvQlgXHsk+DCo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-wlCMW-rNM8W5msXOSnVukg-1; Thu, 11 Jun 2026 05:24:18 -0400
X-MC-Unique: wlCMW-rNM8W5msXOSnVukg-1
X-Mimecast-MFC-AGG-ID: wlCMW-rNM8W5msXOSnVukg_1781169857
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490dad70f95so22284915e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781169857; x=1781774657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6+2xaEKiZA3gEu8WbXqmvB4iNhVU2+4QCQa/jHjj52U=;
        b=TTd2jaquegp5yUv5/5wXtaycwBPeQ3CG38Od1rELHvlX3PhuKG8AYvbLwwqDkGqFPn
         sADSh6uTQ1xRPA+EqodNhMKXBku6AtHOTAO41ZYbDAdGyJf6EmBEGM9PceHxekbwYUs6
         EHRWB0ya1toGJVqvqDU3h3eiewwzQ5owB8q8UxWIEH5oUotfFZMSFeHoz9DUoShWRxBY
         KYBUBTJxle/QVXkqUuAPiY5D7KqByJJbBdjU2CdkDasC/0mBc9mMTWDuBHO8OQ3tFlqu
         DROjqoBue6Bc6gObWGysFw4hSUmP0J95De1YDZIF9d4U+ynmc+zBoCArizKN21iOLAjT
         cXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169857; x=1781774657;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+2xaEKiZA3gEu8WbXqmvB4iNhVU2+4QCQa/jHjj52U=;
        b=NE1cd6BsmrwXtIxC2RzvdkUWKs49jDLVygNAMKyk7fQCFYanZ76BSnEanBaw2uE6Y3
         g3zn0di5AJd2BOO+WYx/HgGzwl447i0WlUrpPIt7Za4qXxhmq91oD7PfP0WkrHzbxFJ8
         It3J3f24a0YV6NV9H3wqKUB1INKcW9yKOyzl0JcUaaiWR1x733jMreo8Zw/BZxl+NgIP
         j2zJBJjDrvlf4b32yy5s+4OS+sUP6oM9cbn6ycJ+MKUBVjjzAv3fR9Iz0d8AMRTCh8Sz
         wAilWhYoWn3Xlza+c/lLIOZZJo9G6ODwOAP+ibUUlyLgagIIktA2/GaZEqmTTTFc133Z
         86EQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Mb2SRvIAAZrtQd4o2+oYe9AXD8Ig+hesKP7NJrrLzzyBTtjKpLCc0TonZCswiyfmedmxbN2XPo5Z4EJmF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyweq0vvY0ngHaLSiMqWuF/Kc7HX2DNptVmJ0cYEHxoxg2QJESR
	sr57nFGk5z0RLh3WyqHdP5IxDZyFK1uMDTw2+OnR6Tt4/F5CqqcptbyYduz6aNIZ5lv48OrLpu/
	N9NopMT8UZTJj8g2dkqzpejdIJZ368+w+fneGPoUGgEz1n2sSfyfuStLTrgDsPAxgeUc=
X-Gm-Gg: Acq92OEjLzanaew93he8mV+O/bAmbfiZO3PfcNqcK+eftQrkW0Yyal/CB1vBKSK3eTB
	Ljmpw7Glq0u3LHWaFw8yM+aVjVdEw1zBpxtXFe4dCSR39niGFbtHYuRVJFmd4CNDe75Kq0SyydB
	3ygmVcmxnbFhAJcMi2KW5Xk9TRXJ++uXg4ALSzQODlCLD5Secg2k1nRbfE7fPM7othMB1JdD6cD
	ynsA6y5+B7JD0JeiRnd4IwHPf1IYkOjlaOVDmJA0i0QGdDghJX7CPIuYZ2k9E3c8jysDFE4MlDu
	FYyedVjMRLuE9841o/H4OazDKRByfIP9YDgHokBKVSJqGlh6QJeFfWnlIYmbJJg/uC1D/oaW4ms
	Qu6Di0GGBEiWH1CN5lH79dT1Lwv97353BNdUUD5UpBjQljfMhifq4jScFXYEtrF2qBA==
X-Received: by 2002:a05:600c:4e0c:b0:490:bb45:79ee with SMTP id 5b1f17b1804b1-490e5379dbbmr28531795e9.0.1781169856810;
        Thu, 11 Jun 2026 02:24:16 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0c:b0:490:bb45:79ee with SMTP id 5b1f17b1804b1-490e5379dbbmr28531295e9.0.1781169856414;
        Thu, 11 Jun 2026 02:24:16 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2d0475asm78210765e9.12.2026.06.11.02.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:24:15 -0700 (PDT)
Message-ID: <03073247-c4c9-4e31-b8d0-2f03c9bbaefb@redhat.com>
Date: Thu, 11 Jun 2026 11:24:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
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
 <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-4-f232d9ca0966@outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260605-ipq5018-gephy-clocks-v3-4-f232d9ca0966@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112679-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E177F6705F0

On 6/5/26 2:41 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Acquire and manage the RX and TX clocks for the IPQ5018 PHY.
> These clocks are required for the PHY's datapath to function correctly.
> Gate the clocks upon link state changes for improved power management.
> 
> Fixes: d46502279a11 ("net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support")
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

I read the above as this device never worked. If so I think this should
probably target the net-next tree with no fixes tag (basically it
enables new H/W).

/P


