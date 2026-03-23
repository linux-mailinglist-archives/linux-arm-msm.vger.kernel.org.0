Return-Path: <linux-arm-msm+bounces-99153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCMnIbEHwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:28:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9059F2EF0FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F2E23008CA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB4E370D48;
	Mon, 23 Mar 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="U4e/Ar8R";
	dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="NrBz2eFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [81.169.146.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2922EBBAF;
	Mon, 23 Mar 2026 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257877; cv=pass; b=nEubdobq0fkrcQAPz8W0VlnFBDxHg7Kbt6hUVw+TLXcsuA7VpRooooMx6y05eJTIqGbzIiM/YUc96O6Hy1WChI5i/jiGUr1R49X+JbFtlR5Zzon/tFetMkmv11NkTYXfdlJDcUUOkj5mMjy6uWDs2SsAPElf2zOZ8sXAV+6qCxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257877; c=relaxed/simple;
	bh=hiSOVJqwIcyS4VFBMsQFo2gPlp7wLRMjStn4C8xySDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oVwNm9ybb3WVNXI7KgszlfLivswQLJzKxCiQZkNH6pFH1qPyQEZDONHuJBqvr+0CuUweAp52w/A9lc5WOB4b2HOooyqcx24WPl2PlgS3nc+ipLsVxom+IZtdbtFi2D73hMIJUgZrwZmm8oVuKdoa/ldR+R+rxT448vlG/OIa040=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de; spf=none smtp.mailfrom=iokpp.de; dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=U4e/Ar8R; dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=NrBz2eFV; arc=pass smtp.client-ip=81.169.146.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iokpp.de
ARC-Seal: i=1; a=rsa-sha256; t=1774257866; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UAbHx9D3zuHVDIyxVqdKDtRe6oj4lLZltTf3DSxfCnQYb+6mJVUuKRnZJvAM44pvoT
    Fk8W9TcLUVETOxqs/SqJYf+0kZy89/wJzxuIK6P10DC2mj7MuziXMm8gsQkEPA0FlFZ6
    adKL+wIsECIkbtlNlsHXrND2MUYH0EXklco4lsivMa1+i4xJ5hAx/W4io6Qdl/GJyaxz
    fTHvNhBzTr3gMtfJVrFWO0M0dRCDz9RvMvD4QqKCjlbVYiLK4g0LliD4kE7wS8xmzbG+
    ScHv7Sqel54iGqjYM/eNrgtpu4r3/EACNhKVLgnmjLmCETzinrUxrhYLSbIf7VHayJWJ
    TABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257866;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=hiSOVJqwIcyS4VFBMsQFo2gPlp7wLRMjStn4C8xySDY=;
    b=nHNnK3AsJV+IfRsh2YgprZykYbeBpQYNZdMU0JlLvQLV5/5KiekZ8yqHn8IjRAeIm5
    R2KcLTb9QXUBw15Fi26O3nDiXun0LQFRHkiRGSjlBTLDPkUySYUDixyDYmdO/jQxKysF
    4GtRhft7HyPJwxsAZ1qrHfsFijBSu/GMz0ND59NPBUO3y4r74X9E/lin64VSHnHHNLlF
    d3hjL5Kf5Hf+Ch6qnxuqrK8PwKUB/0EILgfKWVAwHBgLklcRDMvY4NEMd2x7SQdEQJtJ
    CvgM9NDdXH73PfvnuogLXbcT/aQjhjHPOi4pls9wi9nDBRKo/BlCdoK4VqqnSS3wlb10
    nbYA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257866;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=hiSOVJqwIcyS4VFBMsQFo2gPlp7wLRMjStn4C8xySDY=;
    b=U4e/Ar8Rze0CHu0gpo5tQxRNw/f9E/8YHAmvCMFxM83LKzeBpX2wJe/RrEfho/7BMA
    WA6GX3qu/jO8s+mUbEG+D0ZjU/YjvcUy3pm0qjjlMbQsi+aIAla+Egpn19gd9PRt1xJz
    c2k8UNG9L8mBxI+Ejb/ZxA2ySPq3HjFe0VKItgFC5EUydxbh/87YXqj2pzNWA/3Ry2L5
    TqZ9FYM2JgQBfUmoLplxzOLqGQHm2Mill6LKeVqTAh89VLSB2nksrkdkyHvPlFNZdqWi
    UmOcZAlw2N3hGKIJWh53NWypZYtMejdTfcGc9OcCS4SoTnmN5wUf0h8R0UUqNuKRl544
    wBpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1774257866;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=hiSOVJqwIcyS4VFBMsQFo2gPlp7wLRMjStn4C8xySDY=;
    b=NrBz2eFV/UoQPFlQkqdr3tXh/Okgel6MpEqEMzliQxJRqEop881mSXY8HKc/dEW60Y
    Ns3c1hvvGxSh0DdnKGDA==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0DBslXBtZUxPOub3IZqk"
Received: from [10.176.235.211]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z7934522N9OPQP0
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 23 Mar 2026 10:24:25 +0100 (CET)
Message-ID: <143043f520f3c08bbad69ef11bf098b183e13bb7.camel@iokpp.de>
Subject: Re: [PATCH v4 10/12] scsi: ufs: ufs-qcom: Implement vops
 get_rx_fom()
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, peter.wang@mediatek.com,
 martin.petersen@oracle.com,  mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, open list
 <linux-kernel@vger.kernel.org>, "open list:UNIVERSAL FLASH STORAGE HOST
 CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>
Date: Mon, 23 Mar 2026 10:24:24 +0100
In-Reply-To: <20260321031021.1722459-11-can.guo@oss.qualcomm.com>
References: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
	 <20260321031021.1722459-11-can.guo@oss.qualcomm.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99153-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[iokpp.de:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[beanhuo@iokpp.de,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iokpp.de:dkim,iokpp.de:mid,qualcomm.com:email,micron.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9059F2EF0FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 2026-03-20 at 20:10 -0700, Can Guo wrote:
> On some platforms, host's M-PHY RX_FOM Attribute always reads 0, meaning
> SW cannot rely on Figure of Merit (FOM) to identify the optimal TX
> Equalization settings for device's TX Lanes. Implement the vops
> ufs_qcom_get_rx_fom() such that SW can utilize the UFS Eye Opening Monito=
r
> (EOM) to evaluate the TX Equalization settings for device's TX Lanes.
>=20
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

