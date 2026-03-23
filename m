Return-Path: <linux-arm-msm+bounces-99155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP0EABMIwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:29:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E81D42EF14F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC3FC3021C10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0B7386454;
	Mon, 23 Mar 2026 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="C4K50jfl";
	dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="VhCA2s1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4516B370D48;
	Mon, 23 Mar 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257914; cv=pass; b=L2rXcaHKzoQLkhGNqeaj+1v44e5w39uHA31jUjOSgzkNwR46Om0WWUxBFhGmB1k/GKBR1M/ZfwdzUXrptujxKT8zqIvsCBuiqI0Gtx7a5gkSSpQw+8bx24SdYObUWh+kq3tCT7ZDjSuX/36F6HwWO8J4RbELffuJAKueTQPFfOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257914; c=relaxed/simple;
	bh=TL2pAP58JGbXAJYSWIcnzBdfKYxlVXtPUI89vibJ+O4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mPfowvrjLCFSB1Td8n9stV9jchnoM5iAzsK1x4WyBz5xmoTOCeZ34tQ9Ca+g0Dt4lbfIog3Xm8IHLp/3dsT/l2p6vsmZRVJwzGA5FKyJrPobsZg70jdrO68hdETclwsZ/ziXsqu730lDPKIQAfEvby4jX1ZSorGy2ll5FOqncKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de; spf=none smtp.mailfrom=iokpp.de; dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=C4K50jfl; dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=VhCA2s1/; arc=pass smtp.client-ip=85.215.255.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iokpp.de
ARC-Seal: i=1; a=rsa-sha256; t=1774257907; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=CYnq/foWF0ea18K7GXv4UYI9nwzGNXgxY6Napq9McF9Nlo09uILxr9bv4jDvXMyf2F
    G8dBW1g1H4C90cWUZv6xL+smiTA2CmW5T4iplvGbn3Mqa2/jS5KIhzvZmoPJFHUM0Ubn
    u2hBRciCJexIxPTMbEyjUew7N2EEGm30EgBx5R7MI0s0wuk6t0NiUEla1utB/tnWxQ+N
    yX3mr/bjxOf/S2tnXIKNiKXbpSh4M3Yq0sqX/wd7ujhvuGOzgkaQgsv4wdBRx9crLaoa
    5qpiPwvY0b7qaNFzdyFhvjIdaPGUw6f3x9xqfPHzcMZSpn2fc1pzKvEOIFnnX2ooZv4t
    Dk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257907;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=TL2pAP58JGbXAJYSWIcnzBdfKYxlVXtPUI89vibJ+O4=;
    b=JNpan1qt+SmL2WkGLTZEeSFaduzlfLdtUZGpVwH1oR6YcZp4wNpDEdL9Zcp0Q0zevV
    Xbi7DxfUE5LBs+FSROiUcPmOVmipPVs9jceIvmaM8IXDfIYW6XrK3og6opK6OQhyG6xc
    9YRFltQjOoUL/H0mCiQ6961jTzfN3vb+ZiMS19MP11VlfPH7KgK+8ry+nzMHbRryVIaM
    2TdVZ3m7+e8gUGlSB66bmOg4fI5GDb+umSGrdS23SqFZ4OyJUuXjQGGxoPeYN0VlOXAE
    NIqYBLqmDwON+hdD12wbUCFcRmyX2e29BaVgE15rCgVYunbhz7tluGTAMMF4EGnW5YOf
    3Bag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257907;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=TL2pAP58JGbXAJYSWIcnzBdfKYxlVXtPUI89vibJ+O4=;
    b=C4K50jfliln1nZ5NKDuyUCb/GjL/WYiT6TIej4X0mVqR3xwznX851WuqmdgKEpC/ox
    zVhD3nYcXB1xDfqPbTpsZwMH5Qh6EpKWkWz1/Gz9pdI46z4SvCCvIJouT5+TYgHkHTx8
    hWvHoR1c3tUlfJ4gq5OJKkGmbwCNIcyOgLkMnc1y8dhcZibfgXFCXbYNyYywJ0EIqEyq
    Hc69bgvedK41WxMFtLiDJcuC5fKalfsk7bvHg2AOwG8ZFhqWupOHTeq1vNv9Q/1GFsGm
    Nz/dn17UfqJ9dtinsZJAPv3LrAeI2siU7q8QGRj69CLE09Ps2H5U5lx6uv+duVfTWeW4
    7U6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1774257907;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=TL2pAP58JGbXAJYSWIcnzBdfKYxlVXtPUI89vibJ+O4=;
    b=VhCA2s1/iiVN8bSomJNntiWXz0EE0upa5v6SglAmON8Hvl5/IuvqHgga4EkkUJSeye
    riBIDR+DuP5c/qS5d9DQ==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0DBslXBtZUxPOub3IZqk"
Received: from [10.176.235.211]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z7934522N9P6QPD
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 23 Mar 2026 10:25:06 +0100 (CET)
Message-ID: <b10d327bd48c0513fd78d208f79b62c1dc7bdc21.camel@iokpp.de>
Subject: Re: [PATCH v4 12/12] scsi: ufs: ufs-qcom: Enable TX Equalization
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, peter.wang@mediatek.com,
 martin.petersen@oracle.com,  mani@kernel.org
Cc: linux-scsi@vger.kernel.org, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, "open list:UNIVERSAL FLASH
	STORAGE HOST CONTROLLER DRIVER..."
	 <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Mon, 23 Mar 2026 10:25:06 +0100
In-Reply-To: <20260321031021.1722459-13-can.guo@oss.qualcomm.com>
References: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
	 <20260321031021.1722459-13-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[iokpp.de,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[iokpp.de:s=strato-dkim-0002,iokpp.de:s=strato-dkim-0003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99155-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iokpp.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[beanhuo@iokpp.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iokpp.de:dkim,iokpp.de:mid,micron.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E81D42EF14F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 2026-03-20 at 20:10 -0700, Can Guo wrote:
> Enable TX Equalization for hosts with HW version 0x7 and onwards.
>=20
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

