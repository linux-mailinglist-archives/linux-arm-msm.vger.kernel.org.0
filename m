Return-Path: <linux-arm-msm+bounces-116258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3JV4IoOER2rkZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:44:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7D700C55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:44:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GJy48RWc;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116258-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116258-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C415300C7CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275A23B27DE;
	Fri,  3 Jul 2026 09:37:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556A1331EB8;
	Fri,  3 Jul 2026 09:36:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071424; cv=none; b=QFWx0+Qr0yT8KNkBZgQM2TkUQv0ZxFCUE90IR+opClB/kcnqxRKMVr4mBgQX5wu4ikIr9wJ2HsQWlmbIerhGnxpeaPg3gfxiHuZ7XidgLI3ifpZob4O77rIqCld9mcckTpqSLShszNyu+qcu+Wd+ODAEcw/G9dsqkuYAJjbgKbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071424; c=relaxed/simple;
	bh=jWFtjW2yC8Jc7r3ourxk24kcYv5zj8+DQev1sIaj8WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1z5Wqri773CAuU/5C5igmwSfCnximTdEpSZDcH7og4tGUGWamrEmH3RnU4DolX/uA/doinaJB91N1lgDzH1PqwiD1C1DfIWIXZ2gtj37tkfj7aiqyN3celtO/vvbSbt5ltG/m5tBNXr8eN/jznI7opHKWwvMTpPbR1DSDVIDwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJy48RWc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCF51F000E9;
	Fri,  3 Jul 2026 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783071418;
	bh=MKnHNclDiES+hsTrpnIseRxNU5ELzDEeEieHpnxW0XA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GJy48RWc36yExNZ00hLkjjgPK01Zy6aSDNrR8Jr/xkccOyaEbrzI7ExqTAgOmthIp
	 TrFGcfipMG7LRKGz1VtAINAq0ZSo2yZhffKVTpGP06QihhTQGqcw+ClSlP/9Pi5XeI
	 E3pZHPnGUI3SBvcCBTrKUjG3C7UOE1cSqbn2Jdl8N6k8qH7dLfmFp0SEBG0/wCmErL
	 PwHwMm8Tmji18FCEoJPZTGmdkDj4U3CmX1rA91NOwSiLvFezIzyQVVwR2UmwTvNUIW
	 O3RjKBUWSog+23BRri2mYRRmrym7fUulVMje7nUwm0u6izwPbdPdxnjpv2QrrwTtTs
	 8kKgGUjev4XrA==
Date: Fri, 3 Jul 2026 11:36:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: qcom-cpufreq-nvmem: document
 IPQ5210
Message-ID: <20260703-lively-intelligent-raptor-5edfbf@quoll>
References: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
 <20260701-cpufreq-v1-1-98656ad20ff3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-cpufreq-v1-1-98656ad20ff3@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116258-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:ilia.lin@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7C7D700C55

On Wed, Jul 01, 2026 at 02:16:24PM +0530, Varadarajan Narayanan wrote:
> Document IPQ5210 compatible for Qcom NVMEM CPUFreq driver.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


