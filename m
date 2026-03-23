Return-Path: <linux-arm-msm+bounces-99157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qICLI1IHwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:26:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D102EF05F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFDE83006B18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5913859DA;
	Mon, 23 Mar 2026 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="L88YD3Mc";
	dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="k4nHYFKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482503803C7;
	Mon, 23 Mar 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257996; cv=pass; b=EbFZboO5oxldAcSzkGe8P2qZa1yPIEBvaZ9Aax9mDgwFoqqHYrhXknsrhZZ6l2dv9UDmtWSFpXr9tZPLML4Ii9iCJrWr0B1ww9MeNLCl0e01NxkANeYHo4zw7jNpmxgGlCEBXex8G2DkVRtmle8rpcSIRDqjyGdM3cBXVzHDp8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257996; c=relaxed/simple;
	bh=jz69uyUwGakrpmRYC+wtRgveOX3LIKMiUdjPcO7KpWs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZcncuUf1u3+2Fw6zUg9PkAmWejipmUHT75kriKcB+0Y3QXQoNOdtCAZuAFiI+3ePYs/ke9nj0KvDZWcpFdtPoxyR7ohvZJNb+2u6NjH3Bm7FuGspCXFq1bLUwuZ2jdHvnDe+vlLHuv5qPHAXiTd8aEyzfyzaPH3LrzhrGY/rEIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de; spf=none smtp.mailfrom=iokpp.de; dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=L88YD3Mc; dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=k4nHYFKt; arc=pass smtp.client-ip=85.215.255.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iokpp.de
ARC-Seal: i=1; a=rsa-sha256; t=1774257811; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=TCH+GsKHAmSoyGjxZXTn2+Pe7YK9ZDkOD3r/2tIb0cERx7a08lQxecCR+yTWeQzf44
    CVdKzHyVLh4JdyWTsgoIRvhOVo/7fpeITAB3bNBigx9aDLP1+6G0v5KAWT4rtszOPH3O
    TyNBl56cd14Z8ZRoJWmIve8IcpKiGIvfpEAAL5SOZ0dC9X8npjcAaAcOvCwacNGvYiiP
    /5H/pxZCs9PZwXuAyyrN3lqg64EZscgLP2smzUnGuA5M7uZ4c2LALjwzVYT56dM+k9Qu
    cGkh4djc1B2ZmvSvM+0Hw0NxwwBOXG9sZ80SyZSWP/TirzHxoS9W/RB+w6Z4fvshnqri
    KdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257811;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=jz69uyUwGakrpmRYC+wtRgveOX3LIKMiUdjPcO7KpWs=;
    b=LP+3th9ztuKI2ehEzn1Nj7wzHgTcgvI09qp/A8AAB1QZeJPU7Z1im5OBEDesR9FP0+
    6Bcg4Nk5ULpkZvHJPULYjX9Rb9jv7u2zwEjcGpq4wZ5H5d3xFyDjylQ14yFzmrs168MR
    TbCK4Aql+cn0VybSdv+iK8OBf5hZVIyAy0gSQBUx7jbTDuTcy3E6jXzVyNvMpSAs2srA
    FD9U3ofos+C7Y1DnMiwTU+J6FurJNQA73PccLdLvFvC1PH3SHox3HHXHhHEdM4QZa7SX
    CxfwXxJTp9fkN7RzXV4RhkKtQw4Dcvj0MxlWFgYvxCOJoCentR8Wm9suNX91Tqqx4lJK
    U3cw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257811;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=jz69uyUwGakrpmRYC+wtRgveOX3LIKMiUdjPcO7KpWs=;
    b=L88YD3Mchi3UHeb0G7M6ImtoRNJ06X0edwwNkcZHp+zlwb63MpRRblH1eIunCvuMbC
    WWdSXpP397ddkjImVFI1uUYCl+hQUjPRsToHSIpJYmgTm8yCREgnfYXVZpKtBQ/DOZNA
    7sdKedSIVZOJKKyXZCckj1lp9b36i2QSb3Fxtf6fxR4QXQSg/Qcw5+ybbKAcz7nhkTAp
    dKKtNL5SSxSVRqsXgyB/4gMjtGauY5rbXyoWHxc973QPT9VYhwRAZeglP2PZGK5TKaOA
    xRvI0f0dcAY4xTNhmyPD9oisG+q56RyTbNoH8S80qndAkFndabwHnt/Vuoq1J5nC+q5p
    jxxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1774257811;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=jz69uyUwGakrpmRYC+wtRgveOX3LIKMiUdjPcO7KpWs=;
    b=k4nHYFKt5DTPJLN2WNipCR6IYo5EYmz4OqpP9TbK2FbkOZXFZPSWzZif8GphvbTQ1M
    c9q4yxzB4yeqh36cE9Bg==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0DBslXBtZUxPOub3IZqk"
Received: from [10.176.235.211]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z7934522N9NUQOa
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 23 Mar 2026 10:23:30 +0100 (CET)
Message-ID: <3983cd37bc49045de7354b659f441730c1660db3.camel@iokpp.de>
Subject: Re: [PATCH v4 09/12] scsi: ufs: ufs-qcom: Implement vops
 tx_eqtr_notify()
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, peter.wang@mediatek.com,
 martin.petersen@oracle.com,  mani@kernel.org
Cc: linux-scsi@vger.kernel.org, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "open list:ARM/QUALCOMM MAILING
 LIST" <linux-arm-msm@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Mon, 23 Mar 2026 10:23:29 +0100
In-Reply-To: <20260321031021.1722459-10-can.guo@oss.qualcomm.com>
References: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
	 <20260321031021.1722459-10-can.guo@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[iokpp.de:s=strato-dkim-0002,iokpp.de:s=strato-dkim-0003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99157-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iokpp.de:dkim,iokpp.de:mid,micron.com:email]
X-Rspamd-Queue-Id: E4D102EF05F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 2026-03-20 at 20:10 -0700, Can Guo wrote:
> On some platforms, HW does not support triggering TX EQTR from the most
> reliable High-Speed (HS) Gear (HS Gear1), but only allows to trigger TX
> EQTR for the target HS Gear from the same HS Gear. To work around the HW
> limitation, implement vops tx_eqtr_notify() to change Power Mode to the
> target TX EQTR HS Gear prior to TX EQTR procedure and change Power Mode
> back to HS Gear1 (the most reliable gear) post TX EQTR procedure.
>=20
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>


Reviewed-by: Bean Huo <beanhuo@micron.com>

