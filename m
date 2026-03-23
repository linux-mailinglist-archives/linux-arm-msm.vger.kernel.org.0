Return-Path: <linux-arm-msm+bounces-99138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BNaNisFwWlUPgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:17:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 892112EED95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5C44303DF7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD8E386C38;
	Mon, 23 Mar 2026 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="oB5MUOcw";
	dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="OxctGTOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AF2386546;
	Mon, 23 Mar 2026 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257069; cv=pass; b=ikGBn9y5mMWXH3Y+HDxr4ZARJ893tX4AWNQd0P3MXZ8BHRcHWNMvjzTfoZwb913r6cDesfQZ4Hv1QOmYMNHn0jLztDtpbjbLgUUXSDpsZVjRyl6WwUrAnmm1XNglBUnOm3qOzPBFgqqEeeapoTvZKILYWhdmYUGgc4JG+KKjunE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257069; c=relaxed/simple;
	bh=suw9KHLI1LNKkl/PCLrf2qkeUAqtRJBNl4/N/e6MHDw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hcKGZcWuy9nGrI/hlBZH4XwFWKizI0IEvBpSxOy/71+NBdlnhvLA3c+yCHmf84ZrWgFEunhPYVaSGCbFMts3YlcyH7a1W66GjwRnQKvDievLBWvMCRoypV+QAoKLCMEJj1EAGBwfDrNlWkafcrAb/op15DLhH8DiH6DWsi3sFHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de; spf=none smtp.mailfrom=iokpp.de; dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=oB5MUOcw; dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=OxctGTOo; arc=pass smtp.client-ip=85.215.255.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iokpp.de
ARC-Seal: i=1; a=rsa-sha256; t=1774257016; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=fCnQxOjBHWAvciIhvDWKGSu1LEvxeGBq1dtQMwfQ/6WAAJnAx3Yp4cEn/ZabU9x/sM
    GIgqdDNxbQutsjV8oO8lPOLn0DpOb3Bkoq8I0uKtoF4cqWGt+gTdB6X0ByylvHnf8gUR
    JMKimUSb+RNCcx2n245u3T+748iW+y08/SRCUhsrhZuz7IWewgetlkXiKpxFeF9OMaWA
    804UyV/Q/Q9RAubQsnrfP2ieNJ40fkzT5ZJXl/ctRCmY30+9x5QrfVBfPbAKgeoc/nuo
    dQvcgEg8VW1iU4gK4sOFBovJLylMa5bx9O1TpWqp/V4s5NLxvAvR/ejnFPQbpcDJeibg
    mPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257016;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=suw9KHLI1LNKkl/PCLrf2qkeUAqtRJBNl4/N/e6MHDw=;
    b=j44P6oh9KjaapEvWeWAxinrm23dGpzGc6zQgz8zReYtOa8RQO1OZtijvbstav8i6TH
    y+e9aUAZguwnx0WsGDuoMcYVUX5ylEtlgqztFbRc8KybT5ARjQynxC4UA7LeXPElPkqr
    wC1AVGXoNo/vsaKHiJE9i20B3Kr/VSvUMtPkZT3YFWr79PoMgfshTB8yJamJoNXAdAo4
    Vks/GHstO1/+Ff+kWLQUyNUbqK03RupBrRmd+PHiMZbqvG03lpDg71c2dg869GrHeBwB
    7ILalUn4LJCoSg7K30giTEp1xd4ooKQGr/A3zDJpaxAxSuik5QrqD3SdHKefIB1xqfub
    PxCQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257016;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=suw9KHLI1LNKkl/PCLrf2qkeUAqtRJBNl4/N/e6MHDw=;
    b=oB5MUOcwnL8wCWZIvUbSF+n2tSmvY2PVB1F2iP1KO29zhSuG8WjCJd7fd9BCHBLaoO
    hCZji4UZWVbHd/cymJEyO1S+ozjz244YJBfyKb9vafioRhTGzelXhX4OzKC6kK5nhtL4
    YQR79nLITuX5GloZVPJoO/UpMz3kMEQO92qhPnTcL6pc37pfKMniHYxAQAZfa0t7YL1Z
    S1L3kuaFutU7wdHOboPeeVPCX/vhOxSEJR9ndUkN4paxKvvTF6X72S4NxJju1E+/ZgG5
    Z9NH3rqjY80KOT4BKWf7AYDRjw3oVY2qlgM2m1rS0eSuQi0Z8yn0yYbBvO6roGjoWV3Z
    Vs2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1774257016;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=suw9KHLI1LNKkl/PCLrf2qkeUAqtRJBNl4/N/e6MHDw=;
    b=OxctGTOoYRuBaiR748PWHh5Zf8TwSpWRVyedcUgy/m2eZ9JYyuKBf0kvDe4ia1Uls5
    cUNnrJp25Kfa9ukmmCBQ==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0DBslXBtZUxPOub3IZqk"
Received: from [10.176.235.211]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z7934522N9ADQJ7
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 23 Mar 2026 10:10:13 +0100 (CET)
Message-ID: <d74ef14d2376d6b4ca819eccb4570120f658caeb.camel@iokpp.de>
Subject: Re: [PATCH v4 01/12] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, peter.wang@mediatek.com,
 martin.petersen@oracle.com,  mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Sai Krishna
 Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>,
 Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>, Stanley Jhu
 <chu.stanley@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  "Bao D. Nguyen"
 <quic_nguyenb@quicinc.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Archana Patni <archana.patni@intel.com>, open list
 <linux-kernel@vger.kernel.org>, "open list:UNIVERSAL FLASH STORAGE HOST
 CONTROLLER DRIVER..." <linux-samsung-soc@vger.kernel.org>, "moderated
 list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:UNIVERSAL FLASH
 STORAGE HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
 "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>
Date: Mon, 23 Mar 2026 10:10:12 +0100
In-Reply-To: <20260321031021.1722459-2-can.guo@oss.qualcomm.com>
References: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
	 <20260321031021.1722459-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[iokpp.de,reject];
	R_DKIM_ALLOW(-0.20)[iokpp.de:s=strato-dkim-0002,iokpp.de:s=strato-dkim-0003];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99138-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,samsung.com,HansenPartnership.com,amd.com,linaro.org,kernel.org,mediatek.com,gmail.com,linux.alibaba.com,collabora.com,quicinc.com,intel.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[beanhuo@iokpp.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[iokpp.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,micron.com:email,iokpp.de:dkim,iokpp.de:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 892112EED95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 2026-03-20 at 20:10 -0700, Can Guo wrote:
> Most vendor specific implemenations of vops pwr_change_notify(PRE_CHANGE)
> are fulfilling two things at once:
> - Vendor specific target power mode negotiation
> - Vendor specific power mode change preparation
>=20
> When TX Equalization is added into consideration, before power mode chang=
e
> to a target power mode, TX Equalization Training (EQTR) needs be done for
> that target power mode. In addition, UFSHCI spec requires to start TX EQT=
R
> from HS-G1 (the most reliable High Speed Gear).
>=20
> Adding TX EQTR before pwr_change_notify(PRE_CHANGE) is not applicable
> because we don't know the negotiated power mode yet.
>=20
> Adding TX EQTR post pwr_change_notify(PRE_CHANGE) is inappropriate
> because pwr_change_notify(PRE_CHANGE) has finished preparation for a powe=
r
> mode change to negotiated power mode, yet we are changing power mode to
> HS-G1 for TX EQTR.
>=20
> Add a new vops negotiate_pwr_mode() so that vendor specific power mode
> negotiation can be fulfilled in its vendor specific implementations.
> Later on, TX EQTR can be added post vops negotiate_pwr_mode() and before
> vops pwr_change_notify(PRE_CHANGE).
>=20
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>

Looks good to me. Let=E2=80=99s move forward!

Reviewed-by: Bean Huo <beanhuo@micron.com>

