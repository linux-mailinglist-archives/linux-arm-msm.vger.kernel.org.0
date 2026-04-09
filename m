Return-Path: <linux-arm-msm+bounces-102537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCj5Afjy12n6UwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:42:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CA23CECA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56D2B3027316
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1237B3E1CE5;
	Thu,  9 Apr 2026 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="H0phYpxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch [79.135.106.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B6311C3E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775760045; cv=none; b=CxSf7JVNPyY/A2PDYURV+uQ1zECfGD6Tjhf0VQ5TGZBLizhpkalnF+T2ZW3Ipmoxh16y+BdCU+W+8i4WRuKW0voiuri3AkQmP6PU8MSy0IcCyAH8YdorAU1KSUiopZP9J3+/KqP+jElLRsF6RcZlQkdifmoI65RKDIa9JJttLi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775760045; c=relaxed/simple;
	bh=99WvpafNgC00TdwhpxyflrZyk31T3nLUtaw4nZnTa3A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZhH3MMBtytRtQ/Icvytp+yJbzRkBmx9swfGPgTeOhiicAodCKwyvb84NBZBOm4KuX1GWxC0OIykkck800hZIhk8/tLzpjVTX0xONet7VnffNN/oGtSUTujX2hA9s9QCeqdm6OvUmvxlJO3ML/pKICBjizXe+Aokt2pnvHjLnxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=H0phYpxs; arc=none smtp.client-ip=79.135.106.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1775760035; x=1776019235;
	bh=99WvpafNgC00TdwhpxyflrZyk31T3nLUtaw4nZnTa3A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H0phYpxsB7XPwLrtnfyBN6mvMhy+ifqvS1OVIwQxLRbLu8/GIAUFfTRcvbzZqfwUV
	 rf8I0GJvkpeiYA7OYVE9V7phE3AVR7XIXIaT/hOTsJi0wtvBchGd62vHCp1vCL+nnO
	 LNDmcVP7zqZO0xDNBRiSFIhY9OpPljgIDI8YIe/gtviZUuFKWpZG1O8jApfZbg3N/r
	 rKPWxjUKgn2LM+AoTjoa5qZyU0nhes1r9A3QqjVQOgipr67e4jJmxQ+gVRK88m5Kuw
	 j9neUNX1uiAKmodUnlM26VR0bDRNzJE0U4IpI0T8eKqoydCcp8mQzFJ2KvOfXlhBii
	 pYO2VWTYUkeIw==
Date: Thu, 09 Apr 2026 18:40:29 +0000
To: Taniya Das <taniya.das@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock controllers
Message-ID: <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com> <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: c775f395f3f55a1766c8ed589cec7719a6c679ab
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxsw.ie,quarantine];
	R_DKIM_ALLOW(-0.20)[nxsw.ie:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102537-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod.linux@nxsw.ie,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[nxsw.ie:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxsw.ie:dkim,nxsw.ie:mid,ade0000:email]
X-Rspamd-Queue-Id: 97CA23CECA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/04/2026 19:10, Taniya Das wrote:
> +=09=09videocc: clock-controller@aaf0000 {
> +=09=09=09compatible =3D "qcom,eliza-videocc";
> +=09=09=09reg =3D <0x0 0xaaf0000 0x0 0x10000>;
> +
> +=09=09=09clocks =3D <&bi_tcxo_div2>,
> +=09=09=09=09 <&sleep_clk>,
> +=09=09=09=09 <&gcc GCC_VIDEO_AHB_CLK>;
> +
> +=09=09=09#clock-cells =3D <1>;
> +=09=09=09#reset-cells =3D <1>;
> +=09=09=09#power-domain-cells =3D <1>;
> +=09=09};
> +
> +=09=09camcc: clock-controller@ade0000 {
> +=09=09=09compatible =3D "qcom,eliza-camcc";
> +=09=09=09reg =3D <0x0 0x0ade0000 0x0 0x20000>;
> +
> +=09=09=09clocks =3D <&gcc GCC_CAMERA_AHB_CLK>,
> +=09=09=09=09 <&bi_tcxo_div2>,
> +=09=09=09=09 <&sleep_clk>;
> +
> +=09=09=09#clock-cells =3D <1>;
> +=09=09=09#reset-cells =3D <1>;
> +=09=09};

This looks odd.

Why do these two controllers have no power-domains ?

---
bod


