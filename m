Return-Path: <linux-arm-msm+bounces-100513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TNLuOFkxx2mNUAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:39:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF534CEE3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEB853028106
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 01:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EF33385AC;
	Sat, 28 Mar 2026 01:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAV1895k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F5C3368BD
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 01:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774661974; cv=none; b=kOnKnpPK54s9VOofz5IMgL5oESM4IMJgGe1flwS7yfng2G5TiigMakOjr6jP+DLxu6egW4FMpv6LDa/TqwaQ0LXGjeIHOOw633Oucdp20S3QXkH/pv+XAwoX24lw5+6PQ2Nr226V587e9ZMZrx9XfkkFyGfwkmKa5dmu5Q6b3V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774661974; c=relaxed/simple;
	bh=eTTj+5EPZCMy6+zcM4jnUzxX/L65C8rc1ct+Ub6oV3M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fYpeDXx2O5Vkm4kJuvRDKVNJ5fQsq/VXEiZe9NVbbex1VSbfIxVLjeIehf+f1O6/5rNmvyPi5cMzY98GLyg8b0/7rFdBvx/7yfJWw8riDTG3g/Gk8OH6yowrz5mKOkCqNjRZfO7uWRVRLl82toMUJG8yiwjnN4G20uwxvhhnSTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DAV1895k; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b98652f05so1260295f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 18:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774661971; x=1775266771; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eTTj+5EPZCMy6+zcM4jnUzxX/L65C8rc1ct+Ub6oV3M=;
        b=DAV1895kL/WNRuDb68BX4Z0OhLFqXiyxrfpIevemYUXUgQGB36zlItSU+zPGSW0xDI
         +pjIN9RHfyWMQH67Atc65Yv3AATJRmW2h2anBfUmf06X/+7ZrIbH+j9ypS7lkh9zwb5q
         sr8uFTJV/yttmuDXEMAND77fEh3wTSbgi9zp5TZPpQxdPRJvV61k0lxQlGis2C5AJ/LL
         zBXNaCYDYWHa9HEKFKj2P5zGILOH+0DZsjVEBOD/leiVYPKjSzKRZzoJXpoLy1KYEgjd
         AR2yPHv/wOH22PIlD2j8CeitsIrVUH5ettItstRpTOU/gdt1JVaRbIAG7rPtKUVyKiEV
         5Ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774661971; x=1775266771;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTTj+5EPZCMy6+zcM4jnUzxX/L65C8rc1ct+Ub6oV3M=;
        b=L/C56dMkI50Eb5XyYV9+pxAsrzLNj1rhXk3wDr+YviEwD6mAJbxrN+8BStFKwooizE
         nl5nhPTP6a/H/eX2EN252BCOkasr7UfgxOKnT1uZFRgu9G9wdCs+4MYwVBNfqcAaF2O0
         4J9qno/sJCr4SOJlutgjPtXj/vsl6Y3utUn3p+OzjtcWa2IX4t5W14yfnyrJzjM8NDyt
         VWslOxOqtH/43MSd5o9pKH7hh/8BYPpTMLovzqaZ9FWdrdUMG7zSX7h9CHJZTsoZ1dAJ
         CZFNsA4pS0unINShWiBMVoFwSUEO1WIIYRjOFPg46V1QFdaD4Slq08F0hzh4RwuPNQef
         ENzw==
X-Gm-Message-State: AOJu0Yx+T3OxZiMIUp/eXfua6Yg+JcjFkMXJLx/glS+Dhh6fxltK2J1v
	oWy47tBWkcX96d34POYuVnFby7t+/4DuMQgYcoU1a7o9F/S5z4HSGmTEOlzENsBRlJA=
X-Gm-Gg: ATEYQzwX5aWbOdEcu3ei5UlX6o9FC4rsJtSphtdm1XUgebwxycdBVL1giihTcfO6ppF
	Tvxkdz+LyE2WCpnfC0UaoSVygsFNhOQQ0QdNg45WVM8Qvq5nr+ZqhumTH/sqCpPedYTJSqyfuY1
	s5lxyKtlSKdm7/xZyawGWb061InD62H2y81WpaZuLrFpaMtmcY2Z4FTt4IPmb2sb3NJPBKSGpwV
	7GChjogVMjgruU4eKKgZxj/DWjyVe14sVS3MkWmK4DsSmhCm0UKo9T5ZqjwU74PkU/RmYF29yyl
	cuE0zBNr84FiXuq3i+HYYr7rEDKOUKZbW7VKzNMW+rviPl3f4Cx2N9HeEzg072w9oknjXLN8YZ8
	bQKyc1+bbA0fV7Y1BZSpo2y06Cyf724dXjCidntu06rvKBU+COkCzP7WGpVG1gc2E+SiJBgE6IO
	uJWgGuLRU1uSl7ienfa3jfFYCy/sJS73LQfhY3K3bwJNZNyY8NTbHSpv0mjegfLgtwz5dAA1JZL
	ndfOnBkCpVDsBWBkGUHbw==
X-Received: by 2002:a05:6000:3102:b0:43b:4983:5d2e with SMTP id ffacd0b85a97d-43b9e9f9e8emr7373216f8f.24.1774661971415;
        Fri, 27 Mar 2026 18:39:31 -0700 (PDT)
Received: from [192.168.16.142] (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf247102dsm2438310f8f.27.2026.03.27.18.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:39:31 -0700 (PDT)
Message-ID: <de4664dfda9bd0d48cfa7a576e0f78788c8856cc.camel@linaro.org>
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: x1e80100-t14s: Add on
 ov02c10 RGB sensor on CSIPHY4
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 28 Mar 2026 01:39:30 +0000
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-7-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
	 <20260326-x1e-camss-csi2-phy-dtsi-v3-7-1d5a9306116a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100513-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 58AF534CEE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Thu, 2026-03-26 at 10:27 +0000, Bryan O'Donoghue wrote:
> Switch on the ov02c10 RGB sensor on CSIPHY4.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>


Cheers!

Chris

