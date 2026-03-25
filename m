Return-Path: <linux-arm-msm+bounces-99770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLf3H0dKw2lnpwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:36:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B731EBFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6BD453057758
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334DC14884C;
	Wed, 25 Mar 2026 02:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Sf3dpGRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7312B27FD43
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 02:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406160; cv=none; b=Dpz/PvpoHEvNcsFdYX1P2vP/YPjEthvM3FfkkhQRJHfn/RpZUvYiEOSNfhLrW6nKFb1zPCNCKEV2GXnCRmMIE3NPgm9h1KshVf64729XOiPnXbTHhSt2BCOH5x6fQaUPB8y7XmGmASUBeF94AEgpR6UOOIuQ2qsd2lXRLAHLNN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406160; c=relaxed/simple;
	bh=SGDmbIspiQNVImx18plf5FR6FwVpfISCceQ8VFjXesQ=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=gPufpqCiwEa3fKg52btStvchMQqwS9VWwNETDUJaubzqiFHXLRhw2/N/FB2xnBDvHoqCjb5rgVAcHEUmFf41tjsvRyQxzvo5fqBOXD+fb+G6Pjji/PhrTmkTiPMS7Hlpva778sqZkXwZrly1h7uRqlZfWdzk+ePYMWbmWh3VppM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Sf3dpGRV; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774406145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K7IiqspCvnP0oEDFZpJaGFjVlgHOfuowmEyXaR7/MOE=;
	b=Sf3dpGRV9xBGIiW34MWCOFd9xzuh93hoOzyLyQJCfvTx1NDZHMumyLU6i69veTvFsyztLn
	xSD8hBSx3q7blBl7Jl/ax9eZ4I9bvHtjhBQpw4OPgPubuLzNAI0AVHdnSw09O1QN23chdF
	KpwxSUUoIhfAF0MO66m4zLx7j1ZKMYPPRxmohpOmMaPaIqMYiwSdoc4/+wHbCNiGvwWEYl
	UOAnOzSz6IkGJv5WjJ3O2tvj9bpAIPQO/f/XMLnxvcFqBHTihpug6zGpXVp/sdU5Ug9UY4
	UziUq1RGrZQf3qyZLlT4c7X7D/mIWp9MFcU0sxl7yePxbPiodYaSHr9/hxpI5A==
Date: Wed, 25 Mar 2026 02:35:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <b75b4b217c2a1d1a5edefd699f0ae9966e612d64@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, "Amir Dahan"
 <system64fumo@tuta.io>, "Christopher Brown" <crispybrown@gmail.com>
In-Reply-To: <vjf4lqbd5igkhvonxed3tkydxkcc5rmt2hsefng4oojrpzf3fc@a5hujilezcdy>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
 <e833f72236342a7efbce04c2109bf921f770673c@postmarketos.org>
 <vjf4lqbd5igkhvonxed3tkydxkcc5rmt2hsefng4oojrpzf3fc@a5hujilezcdy>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99770-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:dkim,postmarketos.org:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 145B731EBFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

March 24, 2026 at 8:55 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualc=
omm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=3D%22Dmitry%20Baryshk=
ov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:


>=20
>=20On Tue, Mar 24, 2026 at 04:17:09PM +0000, Paul Sajna wrote:
>=20
>=20>=20
>=20> March 24, 2026 at 10:49 AM, "Konrad Dybcio" <konrad.dybcio@oss.qual=
comm.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22=
%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> >  What about the other board (judyp)?
> >=20=20
>=20>  Konrad
> >=20
>=20>=20=20
>=20>  I don't have it.
> >=20
>=20You don't need it to define firmware paths.
>=20
>=20--=20
>=20With best wishes
> Dmitry
>

Should I put firmware-paths for both boards in 1 commit or 2?

