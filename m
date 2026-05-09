Return-Path: <linux-arm-msm+bounces-106763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GQTF9OM/mlasgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 03:24:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F384FD43F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 03:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 325903011761
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 01:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29D3265621;
	Sat,  9 May 2026 01:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="fwhziwnS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1822B2D7;
	Sat,  9 May 2026 01:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778289867; cv=none; b=c8bFk45qYf4c0kFsE7prxSPPxVywKhQEGKo8LZqMmN3/nGTH05gYlSsfRF9qfUg8dS0jqA2JjNDAuD02P85zdy0RZxIQcc8akrwgRbhLuCGTBJPtpJVA6l0Q520awq+NRpCH5tnORNMzHEHinVXULvnKaiQI20uxfuXY6rfyKeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778289867; c=relaxed/simple;
	bh=bGvLkQAWUeluJwFLbkrFRYlfbhdNC9Zv8QpnEgZde50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNQKu6dKFMXDK32H0HmD2WobnjjqrpB9Yxw0nmYQkzRUCLBqP2nwE23UGNhaavbrrPqN8lHa+E+F4vc4txPWNqSTe8ft9+aynhAOJpbfexGBhH/VfUSro4MZQcKfaUT5DDLKX0xrPMNUtJQ7Ye077gVULQcavWBu3vKa2oS7chU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=fwhziwnS; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=5ACAHlhc8wdXure4xEmTXBco8HgiMQSDTZo02rH24uU=; 
	b=fwhziwnSs6sG6Dm2WKW84kRRlol7+ZTOu5Cgz/6B1QDDRvu3GcyhONDGgPRwFZiP/9DMW+kHDw9
	6hc6vjLDNBMrgrjhp9dYp/YEQOFmloRfxACvRZJC8R9V2qH2OEa7W0/NfuZCgUYpIUpqBRJ9N8Ifz
	fYQWnEPA/9wMKV0AsOlsn3DnvZejO3b3aXpnWgCW+5fG4NfbcJ8e4Cap9TfWxiDVKCFG89A8iNJe5
	khLU2bNsIZvLxNyN7H7TgaeDExp84jt84Nct59L4kzu4jGTs0IGfAh/9emRS9R5oeUXnPwvS4Ts+Z
	04mbZNYsOhAtBMh0zoFYtxV8kdv4x3MHc0LA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wLWQC-00CZXK-09;
	Sat, 09 May 2026 09:24:01 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 09 May 2026 09:24:00 +0800
Date: Sat, 9 May 2026 09:24:00 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	cros-qcom-dts-watchers@chromium.org,
	Eric Biggers <ebiggers@google.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	David Wronek <davidwronek@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/13] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
Message-ID: <af6MsD1wDs9EZl5q@gondor.apana.org.au>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com>
 <afmuncmBrrvddHTU@gondor.apana.org.au>
 <b8805117-d54f-4e42-a7d4-6fa18af63e69@oss.qualcomm.com>
 <CC0E438D-5544-4BB8-8512-7F93A7FA4DC1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CC0E438D-5544-4BB8-8512-7F93A7FA4DC1@oss.qualcomm.com>
X-Rspamd-Queue-Id: 56F384FD43F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-106763-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gondor.apana.org.au:mid,gondor.apana.org.au:dkim]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 08:11:45PM +0530, Harshal Dev wrote:
>
> Can you please confirm for Bjorn once
> that you're not picking this up and he
> can pick it from his tree? 

Bjorn, please feel free to pick this patch up.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

