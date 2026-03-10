Return-Path: <linux-arm-msm+bounces-96647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANkNHjUjsGmVgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:57:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12226251142
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0548333D3F02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8D73A75B1;
	Tue, 10 Mar 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YqhqqXn/";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qcj2U8WT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6083A7580;
	Tue, 10 Mar 2026 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147460; cv=none; b=QF4jygOQMOzS+770hq7KVcg1XbKsWRUeLtJImYFBlbgbe95xQciNDa3k3nvkqBtFj/9Hc8fo6Kibuq/emxOEj61is47DDxQa37qk+pff252OESwjqYeDc0qd8UDEDRmjCgWAOrq4Iklyr3LU4sDQSDDLcZOJRm1WH9pWNFyyqIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147460; c=relaxed/simple;
	bh=7B1yL4NXUbSrk9RavCHgDv8l+QllyzHuM2LtcNkdcqM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=VDCNrplIjZQnzjqehw5QGJ5MPeTxYM5VJ51ZKMJpgykcNeg12TfMdwBqSHyZQn7HOYd+zwDpygK3XJhqANejMMRxISKdjkcpCvkXuus5PiApzPpAMJ1ovY5xhJnVUKHEfjlHi2nPbGb54VH15H0EUm781rkwNf0IPpIEDA4bHkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YqhqqXn/; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qcj2U8WT; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773147455; bh=AgluKCXDjtXXarLidShHy0Q
	ZPjPkfIfpD3Xwdip+tb0=; b=YqhqqXn/zNSwmjWn+bZkLj7k2kuIvRlkvvzL7jd9KGJVYnsJD6
	8CKLknSSPq2pkQzhzwqfqeabhU+vfZXkUm43aX3XDzdRdpZYRNN6iR+y26UxnHQqIJ4pfiGoJvL
	o/gIzNwVA0IJnc9EtwUpG6v3e+4ex1z5GO76OVs5XSA7vIhYLr94KI+/o1xV7Arfa0po9QvsZzy
	0xgW7I+BIfVHmHuNJS2fLM6IxGoLWrDiavv8Oy77AuiBZAtMnI/YrmqRb1TTa/soSYJKpEVEXgY
	TYFaIVM0Y7Cdfgw0c/sq/TztAPPtA/JpAA+0wQiIea7cuQ+3+480pYqwrkyNIUZTgAA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773147455; bh=AgluKCXDjtXXarLidShHy0Q
	ZPjPkfIfpD3Xwdip+tb0=; b=qcj2U8WTBiAiqZ+wQUEuw39D+Ylai2HEHwGx2zIxI5HxrVHAzE
	OfjbrQ4ncl6qJq8RaGskiP7D3uo6snoQ/AAQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 13:57:35 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
In-Reply-To: <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
 <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
Message-ID: <fabedbb450f409aa0aa415151de0263b@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 12226251142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96647-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Action: no action

On 2026-03-09 13:55, Konrad Dybcio wrote:
> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
>> it can be commonized for avoid unnecessary code duplications.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> Could you please try adding the following to your gitconfig:
> 
> [diff]
>         renameLimit = 999999
>         algorithm = histogram # or 'copies'
>         renames = copies
> 
> and see if this generates a shorter diff?
> 
> Konrad
One more question should i rename msm8917-xiaomi-riva-common to 
msm8917-wingtech-common,
they are wingtech devices. Which naming is preferred?
They have wingtech name also:
S88503 - Redmi 4A (rolex)
S88505 - Redmi 5A (riva)
S88508 - Redmi Go (tiare)

