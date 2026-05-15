Return-Path: <linux-arm-msm+bounces-107786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE4mNr78BmrtqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:00:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D67E54DEDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E861630E57F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BAF3F0A81;
	Fri, 15 May 2026 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Z/g+upg2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71993DF00A
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840964; cv=none; b=lk4wq4Lp5II8KacBCdFsN4RWGZJ5vtD1/zJqjXpB8k9viSZPlwhpjo7MHhHnLrIdNU2wcMDappckSEPGG7KNy8WworEFLJXZiUz10+5ixpKiZFw5lb9/sZhQE+00NF5ENaYunOSBurXTNvf47YtHmxcRfkBFXajbKYSahgFBW7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840964; c=relaxed/simple;
	bh=Q0SmKSe/0P9VzRddq50L0e5HM3amO+Is5Tvoi6qvD7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmZf9IxP67kSuPc9e27cR5soQf4br04G5Ym4pKbYoa6QKpSQ2IIDU7dcCuibVUSEqh9kg8Hz1/DZ1s8bpreEtDkbZWH9NXBDvFOa70Q+qnxpY2Tc4fuaU+Ax3/gJMq7JkX8XS6YZBhm/PJqFUOzKvf4iepcCu/VfUmVIa4pEOi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Z/g+upg2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso103210185e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778840961; x=1779445761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0SmKSe/0P9VzRddq50L0e5HM3amO+Is5Tvoi6qvD7Y=;
        b=Z/g+upg2PhgFsMKTFmb3cKXtV3OS+JGESFIbYHJN92MH8jyW0xTFFYcyQYpevH9/qE
         AlXMjppQr1FBtNC+3B8N6Cm0nW80iH2hxl50XHEVnCfoGpa4fjz/66SryeuQFMfHtyuB
         p+Z2uI8mHv90zwI0RAd7hixy4L2SwK8f0PQjsmwjf4T456t6bmyOj+sM0tLvFCKZGKpL
         rkcSDeFQyGZVg1j5iNe4+HYTMKfqASWdRsMIIYjEDKjO6jYpLntogNmS5IgcW7jfvKmS
         k1G5CUc00jkOrl5TNL2kHet2ieq5KrpSSmZJXdqBxa6Pmd44W6Jm8crMzHQjO1P9wGup
         ClpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840961; x=1779445761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0SmKSe/0P9VzRddq50L0e5HM3amO+Is5Tvoi6qvD7Y=;
        b=JYSe5HWrbyjoeyR2JKE6TqWs5Ri69JK4MMjT4coata1Ng25B/+0PZJnDhoBBmOQglC
         cwGhkwWJ0VLR6ABE+ZACKcG9X/+k/acmsuQ6tI8KVjujJb6D7J2VOU9BfyS7pfcNblLY
         MHvu0WNNBjPuTQrLeQ7o8GW09oGgaqcg0J93zGfKBxIuu8vryhl/xZ+wE5J5bQKrryH+
         46Z7vrwXFxANZtOiQ2obG/Dxf9nW8BBx3WlKeg779lWDWGcd/E6ft5gUWEqXimaPNAim
         tP61RKjWvQLATqIdWPHkzKi4K3sbs7KfZdk/sdSJfvME4gewve4dyBYxqg8cYoNt9TtK
         NwFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+S26aHgM6miHf7uKu5Iu6PMdtvg0TRFAgF4eOCnEqGBWhnP53ZidFFbXuacbLeyVAwDvjWn592jOac45pD@vger.kernel.org
X-Gm-Message-State: AOJu0YzLrld/InX5SJ1AWWIe0UqoaJEtCbvj4Y4HCDa4UScjvh0xg1hJ
	OiwLK/JTLTULsUbrFU4m3p6coBUlnMmMfwTGcoHwi0a1WXIlC0lkkU1DHVBBAZhWC+E=
X-Gm-Gg: Acq92OEiEI4gEgze/2WEu1VIg/sW2L17Ev7cVn3UXcBJw49BX+FG1L2aqPlVPYva1+m
	BYRbrCWaPVamyJew6aRXAmr4vhjse0G1AYRmf4YeQw2vqXWnD7kEuiyhTfB0W92Vy8eKdaLyv1f
	dkOEIvJH5N2EVgHhaCygv1XQtagSihJRKLobVuPgccSAePM3EzbLHZMOI0LdPjQEoYQuRrHpilO
	OULjwBBbluy04eJ3QjJ7n4tkValcHWoQtdJzKImjxXOobT9r3WiPG4EFxX472hCqmfVS47WC92u
	OhUTRr0fxeNpC0l23MoPcNj/803LAE+kjpTbm3ZcL95S8niIj3i+N0IWGHpFzZ3j6FzdUehy02n
	o2u4BM2vNUFuTQtYE5fNinyg/huryZkQ0zAb9Jskf6znV2vAjfIhT4pOYyTsr9pmpaO+N/ugWjQ
	nR1zIkn3Nsbaw679gsa5Mxhau+bDEASKXe9ojACYCswM+LThH0aCnv4z9I2aOaYHs/aC8uB1gkG
	uTdEv4zF2wnU47hRjaO7bdOPI+N5rNVf9fkdIQOpEU=
X-Received: by 2002:a05:600c:83cd:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-48feea99e02mr17119805e9.14.1778840961340;
        Fri, 15 May 2026 03:29:21 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:2736:8e01:7be0:318b:35be:abd6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab52a6sm49759555e9.10.2026.05.15.03.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:29:20 -0700 (PDT)
Date: Fri, 15 May 2026 11:29:19 +0100
From: William Bright <william.bright@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <agb1f1VZMvOE24B-@will-Legion-Slim-5-16APH8>
References: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
X-Rspamd-Queue-Id: 4D67E54DEDF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107786-lists,linux-arm-msm=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

 Hi all,

 Thanks for the acks Rob.
 Gentle ping.

 Thanks,
 Will

