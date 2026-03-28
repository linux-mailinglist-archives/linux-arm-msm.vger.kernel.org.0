Return-Path: <linux-arm-msm+bounces-100543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGPsDtLwx2lMfQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 16:16:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE67F34ED2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 16:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29F0330131E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 15:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B1A330D24;
	Sat, 28 Mar 2026 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA+R35wl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06105330650
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774710941; cv=none; b=lHoguEBzKxzwNYpPdcaqy4t/lV/XpNSEEEEOF+9EroF3CUFiuTXFMkywahVCZHuAwMymptlcAy2JvgUxh9wdUzt0nS5mXVayTQFsBJHZw0oZnLuwITP6CuB3OMg+UqIgiD6/GUa4Jyidq1D9WRwzey0W/2/3ezTxopLseV7mPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774710941; c=relaxed/simple;
	bh=ICqzzqLxaQ0oD8cZsvkZ1Auyp2BNEN+4P7TyZ9353cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwQE7+h//oeRFD9aImSLuEOFJDR7bC2fP81taNhUXbM3mbm1/UqsgTbOKQBCw+pP1VCGLTw1FiL6kN+hkVGyYLZHMhQQlnYqXusNSaVVBy4hScAIhOYjGihGih9ffl/cQoQkTtdbDF48lP9lOPHL8lOeZ5ziZD02GY03ppFbsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA+R35wl; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cb4136d865so389751985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774710939; x=1775315739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/kDUry0xFE9vHvVj18ny7RFWBuEEHB+W5Lxw16DJs+g=;
        b=dA+R35wlUXZthVYGFUmdvTh3S5roPveh3Y/N6QKO297DQmVZkjvhRagCSqIcVWYsfA
         Jf2DdqM0E9BzSrjkYKH/SiUvBSVtlCIyzbs2YsmjOJcby4VyB3/YLft/0BVno25gdlg+
         HuDDa/S4epzZ9or/feRGuInInpPyldD7dUI9yEpDk94OEoE4g1AWrJIjWSMq86K3ZHco
         CFM2AHFPLB/3OInhMbyxiXzyVyUWocSA5Lk853bSg9YgKzKj/9IJhRg4kCT6Iufua3Vd
         A+SLJM3IO/8VBNdN19oB4ybvAIpCymqHbuQ8z04WUjxOm+UI7Z7DPOmeCFOMLPVid0bJ
         Pzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774710939; x=1775315739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kDUry0xFE9vHvVj18ny7RFWBuEEHB+W5Lxw16DJs+g=;
        b=VDeBuY/pZqvBTZxTC4UD3CYWv+b430BywCmdKqBGUTY6uKllS3XiFRVCJSc5dZ4Z78
         20arGZ2y8uUkiClvMGGY1bzG5+/s23kzdkgoIiCZCkSfcU9PjfLKBPE3mqTnf9/ONCzc
         yIQwp0qcz1BEpXig+9ClXzRKwOUhNBQda9OnCL/pk87cwFx/sABpQeBHj2bIHt121i8N
         WTAkBKGiM7bUsDUcD8wVQJ1Dp36VjWsB8sgfJv1W2T7+PU+Sjlg8nZiS6E/HNr7st2pT
         gHXJNz3uOsTc4luwH7GNqpMshCL5gOSfsvT/wQZ9Ti+QFUEEwA8MB05bDxVHdw1Zku43
         gr+g==
X-Forwarded-Encrypted: i=1; AJvYcCXGjl3Z334/MybXRODGRC/sH9f5C33fBRdTvxASmBWaaSISLCpo0OUIaThJB3wuJPJFoYkbRp4fzIGW7ybQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxSvuFqxkqE0dhOIf0HKNsxBbvnX4iBZpXFeUuc0trosNYzNerF
	6EsGTPeYXuuwuCssb4I6aCM1HhFqK4dpUu1VKNS41bx49QHi1X12LqR4fweZtQ==
X-Gm-Gg: ATEYQzxrLkjLiowDG0fuWsop1wLnIH18jYOMYaj8U2bBLcu7sLi9dW/DN9p07z2CwAM
	ffIeKr7LLbLsIUC9yaj6F1paosKvShHnkVBpW5UMLeboIf3Em8mOx4ecsbGxRrnwWVEIHoDK4nX
	u13nRrTN0ybyOAmPXYDM8fPJ1kheO6LWDO1woNwTGIGphO5LBiLbZiPxCySOQgEGVBSz6dg8k13
	jejP07mrDeKfIU6xgqPeBn8Mky4rfidEUOGpOxAvA2/RwfMWucxJkAC7X/FzCmHY/TTM8qli8kJ
	TwCkd5PTac/19mfDvu5nrycDnphnT8CngWUURBRyhRtRPy9C3FqSJmumps0AXqIxVpESh8SC6qE
	gxyUzeWFH4IVL8s/7wftl1EsdrPJmYirgk6IitnCd/7x5gkI+z5Kqhz4vnh27N3fFjQbAGJmZEh
	0gTNOa2UAiWoVcb9H/5qBwhUklAw==
X-Received: by 2002:a05:620a:4446:b0:8cf:e0fe:f217 with SMTP id af79cd13be357-8d01c60d34cmr849118585a.20.1774710938926;
        Sat, 28 Mar 2026 08:15:38 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02808677dsm181603085a.42.2026.03.28.08.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:15:38 -0700 (PDT)
Date: Sat, 28 Mar 2026 11:16:14 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: thermal: lmh: Add SDM670 compatible
Message-ID: <acfwvk8ptnBrGmVx@rdacayan>
References: <20260328014041.83777-1-mailingradian@gmail.com>
 <20260328014041.83777-3-mailingradian@gmail.com>
 <20260328-resilient-smilodon-of-improvement-a8619f@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-resilient-smilodon-of-improvement-a8619f@quoll>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100543-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.981];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE67F34ED2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 01:20:43PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Mar 27, 2026 at 09:40:39PM -0400, Richard Acayan wrote:
> > Document the SDM670 LMh.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> 
> Why are you sending patches already applied 18 days ago?

This one in particular was applied with the assumption that there were
no driver changes to support SDM670, so I re-sent it in case the
different CPU clusters change the suitability of the fallback
compatible.

I'll drop them next time, and patch over this if necessary.

