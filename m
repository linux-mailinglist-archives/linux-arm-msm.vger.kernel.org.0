Return-Path: <linux-arm-msm+bounces-118967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q3VvFjDhVWrIugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:11:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574B751BEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:11:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=dJCfxaMG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118967-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118967-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1844130430C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0463ED3CC;
	Tue, 14 Jul 2026 07:11:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA73EB0E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:11:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013097; cv=none; b=rCcOSZhcsutawJmOqWjp+D7lvELgOpwXLAh+lNYSjkyNB+HLUw1zXPp1FQzB6UxAEOw2oWFKKu7S4vF80nKaItfXdae0D8d+9u34ervh4VeSokMpd1OLchMaPXUjTiTg4wENvI1f5E1dhDBnzWp+OQOVjBh9YgXkPLr51okDzxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013097; c=relaxed/simple;
	bh=coH8VC94/khLrpGYl34wxhGzd6kX96i3kKwq65dq3Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kf7S/eHL3wsqzHAWnYylhDVb7ugiA+uvrW1y5tMkM9RtxCGYB2gcn1qQZJfNsbH1CIGbm42jKJijOeDmvoA56uyxwGStJCiLUW6z0lqpScexo15Y3RAQverS2VP1ALtFdFPXH0w0/fKB5v47aeNOJok6Tp444SlV+elH+0MiFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJCfxaMG; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f60208a5so34114595e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784013090; x=1784617890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZwJYLmaCN63FrHksr4D9gyqJ9UQ3ZjFepwTLBT+MyQ=;
        b=dJCfxaMGqNCJqPHbVgLWA/hi3TkJGZKcyjwXHE/m6i8L8iVd/Cxty5flV3LKYdsstu
         9OolDHB/hJiyNCYjGWsdoNzTcYIns1cPsBP8WyDpX+g/zRHzHbdsq7biQMhl52NPKmEE
         QOtmF2Xo3t6MW0DbzwbOddzOdhvQEG9GMgLEeFZbNBLnqoP32B72TNAPiHAx3E8++QU7
         NpEcT6ZhhmrS3Wd7Bign4MWfped67BJW++u3G3ddAILPJFGWKqfU4jEJqjoTwSC0Quoz
         bW/To/lm429juJFAGknIORTLflKE99m091k3xYK+k0Pk+LJu1v2jiuRTH6trIT8wxpdW
         vMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013090; x=1784617890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZwJYLmaCN63FrHksr4D9gyqJ9UQ3ZjFepwTLBT+MyQ=;
        b=ImY0nLfEYl4UKWHfDmjXBsDdWrRVlgrad5G4nYr6ZGT7rFKJ2SdwzYlKei3Ncd1zeK
         AYfVpm2UGbXaBHOLKheidARMIEQa0TZHiaiC7DPVZn8YntgkCDKA9wpDq8ENLhcxLTh0
         uHEi65tbOsnevsvjArCof3kZoJaIuUmVZxubVi3NNQixPr42vsS3THqbxmpFZmfBujWQ
         VE/kky/ZSTuXeo1hyWWtZD/k6DJsp2hF65PxO6jh06p5IqAv/o84il25Fqb32aB1YCyH
         +su2EBuNDrsu5njfeF2ZrQdLEqlh2DMoFA1eAz8tb8EUlF38J/ioRuBz5wWqfCIJtfS4
         puhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNmLLoK+eeq9yl3vsUNILqKi7jzc1TZkNRAo/O6UJKjf6V2wpVA8HlPz9JJzqEh49yg30W8iwQQFBK2dNh@vger.kernel.org
X-Gm-Message-State: AOJu0YxmqPywuJMSrLwDRoh53OFXVsLHLsGxFIkXs7BLZS5rv3Up+TBW
	9wvOXFIdxnxAxx8NxnBIJnFd9in1Nor16rs/W2ghxs32ePHnIo1+XfSHj3wMC6yrjNc=
X-Gm-Gg: AfdE7ck7Fxwza4KaV9xUjGgvFGGLyh6ErvfddDk9D8rwl6E7Nur+dQh2JfQ1jLrhsAT
	mhLkdrVh0LwYmjZPnWWtm+SE5Hb5BlreqiliY/6Q9StWRXR8hc0JMMwOLfvTQlblESLns75ATQN
	g+3u+/szkuq4RL1bvhxvMUcFuylCj/QWqu2hgvLVBy4H36Vynsf0ses+HNAA+uLsUKoYqKlJ8p0
	BzlZhQBiWkcHsgWTTH0ANpM/MgS/SNtxeMky1E+OxyZ5zDfamYdsGkST5oWZ6Sp00bUeWbP7TpB
	jrVp3plerJ+9VsCCbK7yXgYnjFhE2SxPvQr+PwDhSZU90xJfOFpeND8H7Mu0YRdGVyzEdG6ytc9
	pTxqqwmi4drdqlydFnj8ADSgg8EOtZzGrBlFp+abEwrO+OD2rlnrlM43MfuM/JZ2gqjC3iLUjMV
	pKKm6bWHYg3+yGMIixs2lrv6Xa
X-Received: by 2002:a05:600c:4ed4:b0:493:e946:c0fb with SMTP id 5b1f17b1804b1-493f87804fcmr139236605e9.0.1784013090553;
        Tue, 14 Jul 2026 00:11:30 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:6c30:6cbd:7b12:2745])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49506a1fbcesm58016765e9.0.2026.07.14.00.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:11:30 -0700 (PDT)
Date: Tue, 14 Jul 2026 09:11:24 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	chris.lew@oss.qualcomm.com,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,bam-dmux: Add
 qcom,shikra-bam-dmux compatible
Message-ID: <alXhHH0mGvFeUMd7@linaro.org>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-1-3f29da7cca76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-qcom-bam-dmux-vmid-ext-v1-1-3f29da7cca76@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gerhold.net,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118967-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vishnu.santhosh@oss.qualcomm.com,m:stephan@gerhold.net,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:johannes@sipsolutions.net,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:deepak.singh@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:ryazanovsa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0574B751BEE

On Tue, Jul 14, 2026 at 11:02:31AM +0530, Vishnu Santhosh wrote:
> On platforms where the modem DMAs into the BAM-DMUX RX data buffers and
> the XPU enforces per-region access control, each individually
> DMA-mapped RX buffer consumes an XPU resource group. With only ~16
> groups available, the per-buffer mappings exhaust the table and inbound
> transfers fault.
> 
> Add qcom,shikra-bam-dmux as an additional compatible for the Shikra SoC,
> paired with the generic qcom,bam-dmux fallback, so the driver can match
> on it via its of_device_id table.
> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

IMHO (the DT maintainers might disagree) this is not a different
BAM DMUX hardware block on Shikra, just a different firmware
configuration. I'm sure the existing SoCs also have those XPU blocks,
they just don't make use of it.

Personally, I would rather describe this with an optional "qcom,vmid"
property similar to your bam-dma patch, allowed for all SoCs.

Thanks,
Stephan

