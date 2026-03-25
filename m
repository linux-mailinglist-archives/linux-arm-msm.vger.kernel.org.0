Return-Path: <linux-arm-msm+bounces-99769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMPtF3ZDw2mopgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:07:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F631E93D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFD8E301113C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B17D271464;
	Wed, 25 Mar 2026 02:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="l/p0APYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6D333E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774404235; cv=none; b=sBrM9AtITJ6nASiG3ag7nnKk1wY8Y/gKd7EGqb/TZu79Bgnn9u1hPqo91dO4y4ON3X/mXhTZDWzkKaYhfbmnaCEPct2PT6PyJx6bC8oYuGV1xvdU9Hi3gqolNvqv/mH8q/6SIeNhWG5qEZmLUMmuoeSzlLXsC05YTcrRWEeIrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774404235; c=relaxed/simple;
	bh=xoJ9gVGG+IeFQcCWPQHWopty6y4pcOv+rNj+cO/LrTY=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=MlJP2Ecj8kjV6pABwo/bn8L3qp3sgrD7SZBCpEr38txfMIpYAA2eCXv9+Y4i4vNUgoLfHwgQhIET9aZSjP82aK3jY4lqLw3KQ+/eaIweDsLCskrT0N20EmQV1BXNJP76HFvZRcwfOI36ZF9NddmggDpiaiSJx3ew8B4LlSMncCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=l/p0APYJ; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774404230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UCIg2TuAJ0x7hXMl7aBTuI5S/PwVnWJXD/57AkKX68=;
	b=l/p0APYJyC4dto/H8ogGc6jcOmS08l/7KW8r7+NsdrSXIOoZDYmVkOWjUyKhyAcK3nd3bD
	eFBUzXmasKsDdUKx6BBX/CkabrxDfcNrYs8LJekHvJ6KM3N7J8zmoJXbZ7ZSKvS4Ny/qKq
	xX+xmWVr+KoBGJJMX89jZjc4dp4Py/ZNCEWaYF/RiWicZD8WZW58o/eKiogTT6GqosSBms
	a7/ojwn+hXv87I6rD94jwwbG33RTZMj0xPcdhJa7XADmQof2H8JkHbjbuMTe8yG1+LWxQa
	jzLJrQgyC6JHfVv2KfzskgZ861KFnXiAEtnGU9ygTCTg+q9o3npGCJSpXfb53g==
Date: Wed, 25 Mar 2026 02:03:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <e5797ee2d4e6b6a0afd279a8943d5f63deb9dda1@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "David Heidelberg" <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, "Amir
 Dahan" <system64fumo@tuta.io>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <4rafi4dc7dqlcracrowkpznelezu2bg4fcwur6vsm332jcmxx5@uhno7k3xv5jq>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <4rafi4dc7dqlcracrowkpznelezu2bg4fcwur6vsm332jcmxx5@uhno7k3xv5jq>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99769-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B20F631E93D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

March 24, 2026 at 8:56 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualc=
omm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=3D%22Dmitry%20Baryshk=
ov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:


> >  &ipa {
> >  qcom,gsi-loader =3D "modem";
> >  + memory-region =3D <&ipa_fw_mem>;
> >  +
> >  status =3D "okay";
> >  };
> >=20
>=20This looks like a separate fix.

Should I put it in the gsi-loader commit, or keep it completely separate?

