Return-Path: <linux-arm-msm+bounces-95056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK/SFZKCpmmIQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 07:41:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C65171E9B84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 07:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 907053006B25
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 06:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFD1375AB8;
	Tue,  3 Mar 2026 06:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2Dqf9e2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FCB39098E;
	Tue,  3 Mar 2026 06:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772520075; cv=none; b=hzJmAFCwGqCeHMdpuzO5K1LbZtvu9jSIFbm5B5Dj3EUwpFNYwNymTX9+EN6FpaqkNo9OjnIL0nxNHoizeAyWtDFcmd6lgHGDxl0mbO28f1vWalUViaCFnNWU1esREYTb3os0O+iwFj1Xsp1DjJWB/tCWQ1HfsIXJnv0K57Rq4uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772520075; c=relaxed/simple;
	bh=Cwm50ylfevANRzYIb/eotdmZ4xDlq3PqRB4EDBJoxCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJyD5cuyVaPaqIQ29MA0JdDY7nW01TXz9D1HufN0D/uOmV+tYCNr3VxebwkWE2C0ArS1IO7kEZF4bZo/zGJ7IsQhfby8H6h0RZ4krbyJs6EHH/ZNa9cYKecazhn83lT3H2gZHCewrj4EWaX3kuJi1SdR+n/U9vnlzx6TKqA4Ih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2Dqf9e2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C658CC19425;
	Tue,  3 Mar 2026 06:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772520075;
	bh=Cwm50ylfevANRzYIb/eotdmZ4xDlq3PqRB4EDBJoxCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2Dqf9e2kOM0JrtCSAgxJnQSN2LrUVp+Azb3dLk7IBYKAqYs7jqT90Vp7teVDSGO6
	 F7AOaRJmj0G5EtQ1kQgIrI021/hQI7AFn8Weac3qKVICIdRY/J13XFGHJ4vq73oKkD
	 8QIeXmw2FVxPwZAwhpxgntBGJ237+7dfA6Y6JapXN6HvsG2ehAILvVM0BY00UZHIPJ
	 ih0yBhwK9hNCpD4brVKXlVjtNCg2b2OZvFIBnDWp5aC76j5OJB8/QqCbomWPmgx267
	 ZFozFC2XmEMjeuR3LkUpB9s58INZvzrM/gDO90oGJ6RkLYsFvXIMTX6eqULaMoY0LD
	 MOOTQffeYUKJA==
Date: Tue, 3 Mar 2026 07:41:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aelin Reidel <aelin@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@mainlining.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC IDs for
 SM7450 and SM7450P
Message-ID: <20260303-spry-awesome-giraffe-120eca@quoll>
References: <20260302-fillmore-socids-v2-0-e6c5ad167ec4@mainlining.org>
 <20260302-fillmore-socids-v2-1-e6c5ad167ec4@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302-fillmore-socids-v2-1-e6c5ad167ec4@mainlining.org>
X-Rspamd-Queue-Id: C65171E9B84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95056-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:10:14PM +0100, Aelin Reidel wrote:
> SM7450 and SM7450P are two SoCs of the 'fillmore' family.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


