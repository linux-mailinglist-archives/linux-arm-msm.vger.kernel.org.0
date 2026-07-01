Return-Path: <linux-arm-msm+bounces-115792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J0ZAI995RWpMAwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:34:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D85B86F17E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:34:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iokpp.de header.s=strato-dkim-0002 header.b=Eo4nk8ri;
	dkim=pass header.d=iokpp.de header.s=strato-dkim-0003 header.b=p+3CoDDj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115792-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115792-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iokpp.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C6A7300CC13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875073A59BA;
	Wed,  1 Jul 2026 20:32:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED33A6B82;
	Wed,  1 Jul 2026 20:32:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937938; cv=pass; b=XBud86b2x1U9+f72czpPEZhQaj8mMGzWeC4MWayeuvMOP6aafPfsc/WvkdJryJJxnkiGku9sW2jIVay1A67x7F7WjtTMCoXng68p1JWpIq21FhhvU8vQj115Xq8ed2HUzvNw1dLaMMT7WNNb8KQTrtxzDyhCH95M/IT9rc7D0io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937938; c=relaxed/simple;
	bh=mUwWyk6ljkIBUnO48igvAl6mE3l3lYg8d3QjUEepim0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dbaMotGikz4nevSNsxQPv0auTfr7d8+a9E4OOBfeCBkw0RDK0oJJUzuef70bpXfjQyQ8xFUaIBi7EClJMrRdIlAdGBHM1I4QE5Oesj52iqt+a98e9dOe2AW8c/1xHNVvE2fEjarxlXDyFedUVPBDxvfXM9VtiFYoFg/jyRkxaN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de; spf=none smtp.mailfrom=iokpp.de; dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=Eo4nk8ri; dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=p+3CoDDj; arc=pass smtp.client-ip=85.215.255.50
ARC-Seal: i=1; a=rsa-sha256; t=1782937929; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MEASrHTMeN4OwX9U3w3FQYb7D3T+fzK4yUCQYi0y7tcXJzQ0hOJImXotTQOdqO6zYu
    JsYkEidBWhSjDEE3ZDB1EVbTMt4GWG/8GrfbZrZzwBtpUzXy7yPpavpuzgzi0JliDJJC
    tsWzQA0vALPSgre9ImWi+dRdfWvBfgubHfMlm/IhzU+ZUJiBy7O6IdE97pCab6/nVBBC
    iBKmXuhEaflf8oScVmBmUoI9N4Uof9eHk1xQBRtXnDI9OEPumm7KKRinZtCFWWLoWRvl
    dxZL6uHuqgzWqxMQvev3L01dMolrrhaLzRtPW3EBqviILAfhDqdvB5ugKQZpDr15FaOL
    lHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1782937929;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=mUwWyk6ljkIBUnO48igvAl6mE3l3lYg8d3QjUEepim0=;
    b=CIZlH/UKUa1pGMsiNOjU4IfrFxsQeLInQjo92DSCT1vwgTqB9Vm4Dg8oIDo61M2k3k
    cpN0Ea01lB9T6ROoJuaKEqaNvDP7wuFOjJXZlpuyWhJt+AKv08fV4F8Id/IvLQ2dRmoW
    cvE7IT1tfv4Z9pAmOHVBtHz6/3DY36BBxQGhpKs9FRy3/xOQHdxDZPWHTK+IFMzAlL/+
    AeDK3FBYkPnivc+TrbsQaVKstcbHeIn/KpefV1W6CEri48a4xeEbQVejn/np3JZLKDao
    g57cbaAfxA9LLGqiaQ7ywHq0p9W7sJtPlD3uGR5g9nK0kUg+alCeeKoIft3khBn6d9Pq
    yZSw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1782937929;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=mUwWyk6ljkIBUnO48igvAl6mE3l3lYg8d3QjUEepim0=;
    b=Eo4nk8riYmy3luyowaaALzWfH1/O+sXjPPpSdiXmvwB+mOBvP8nKWhwNAznb5g2iYd
    sQ2fQWS3Hi+I4m8wMUb8BeBiCCkvReN54W0d3Ap/OmH1yCJTFMYl30KXUu7NAaXjYOih
    3RSB5xo6cR4j5ZRDMd6GQoG5oykf867K9T8bQV5K0Wmv1IRZbvOAg2eEt7v76c0MDA1a
    A6QnQYBWUgcgV8KswAQDY0y/Y0hsf/5w/qr/gYrNvjIOBEdAxMoleqnSB9ukJVqxsHPW
    xX2n4YQ7fI6zKOAMmcbwXB8PZIgtJIVbApQObnJKGmAYN+S9EU3SqpvLk3RmOZZYCI2j
    FB2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1782937929;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=mUwWyk6ljkIBUnO48igvAl6mE3l3lYg8d3QjUEepim0=;
    b=p+3CoDDjy3PJ3q9eowSmlpuDwdz8NklzMBHrmbW1OSb44aK9iLQD0L5KU9H6ysix+s
    QbW4C9DqmNANuMPPcCDw==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0zNriHg+YfT0rGWUpI6weUrZX7j5d8vw1ZwljKUZAZetExYucA=="
Received: from p200300c5871477310ac0be5030e43536.dip0.t-ipconnect.de
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id z4d388261KW8VOK
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 1 Jul 2026 22:32:08 +0200 (CEST)
Message-ID: <47949382311da57d59a711f2ed91a3c9f70fec2c.camel@iokpp.de>
Subject: Re: [PATCH v2 1/3] scsi: ufs: ufs-qcom: Restore TX Equalization
 settings on FOM failure
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, bvanassche@acm.org,
 beanhuo@micron.com,  peter.wang@mediatek.com, martin.petersen@oracle.com,
 mani@kernel.org
Cc: linux-scsi@vger.kernel.org, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "open list:ARM/QUALCOMM MAILING
 LIST" <linux-arm-msm@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Wed, 01 Jul 2026 22:32:07 +0200
In-Reply-To: <20260625121306.1655467-2-can.guo@oss.qualcomm.com>
References: <20260625121306.1655467-1-can.guo@oss.qualcomm.com>
	 <20260625121306.1655467-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[iokpp.de,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iokpp.de:s=strato-dkim-0002,iokpp.de:s=strato-dkim-0003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115792-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:can.guo@oss.qualcomm.com,m:bvanassche@acm.org,m:beanhuo@micron.com,m:peter.wang@mediatek.com,m:martin.petersen@oracle.com,m:mani@kernel.org,m:linux-scsi@vger.kernel.org,m:James.Bottomley@HansenPartnership.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[iokpp.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[beanhuo@iokpp.de,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[beanhuo@iokpp.de,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D85B86F17E1

On Thu, 2026-06-25 at 05:13 -0700, Can Guo wrote:
> ufs_qcom_get_rx_fom() applies temporary device TX Equalization values
> before forcing HS mode and running the EOM-based SW FOM scan.
>=20
> When one of these steps fails, the function can bypass the shared
> cleanup path and leave temporary TX Equalization settings programmed.
>=20
> Route those failures through the cleanup label so the original TX EQ
> settings are restored and link recovery runs before exit.
>=20
> This path also reuses ret for cleanup, so it may overwrite the original
> error. Keep that on purpose: if cleanup succeeds, the caller can proceed
> with the FOM result for the current iteration.
>=20
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>

Loods good to me.

Reviewed-by: Bean Huo <beanhuo@micron.com>

