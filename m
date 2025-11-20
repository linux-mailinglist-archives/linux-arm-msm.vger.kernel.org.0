Return-Path: <linux-arm-msm+bounces-82606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B21C71E35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 03:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 74FD54E3865
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 02:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618722BE7C0;
	Thu, 20 Nov 2025 02:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="Qx0VAVFg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971E23C4F3;
	Thu, 20 Nov 2025 02:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763606924; cv=none; b=Er/G+5ClR4YbHERTKghRtVm/V6a+GhmPc/uT9LrzmyFWugqX/94jhLQ1mxAuCA7hrc0qJi1ZpAqHqJoBft4sW5wdeWaSPlzf55M81sfL5aRLDwUB8daXZsXuKAfb7eIqycWc3dBdWkPAEH1HjTlIPI4LAOaHKrc3fdWXpvngr+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763606924; c=relaxed/simple;
	bh=nf9VTDivm/in8YbqaK9ezXTizbY/IXqU2F9LZDFm9CQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JVUF9BHPqtn0y07f/6FbIOoRGxwoev1GYbjMM+0Zfoo+6a126RFrHfji5mYnFsPjLsyEuxO/LjkT+JLnYxRdxY8Fq9FHmFeh/TrW/07R+aaKplftRm56FqfOL6uyHn+tp5iixv+Uq8J47s01rfF2xSDHFaMG2TpWmc2UfQm6/xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=Qx0VAVFg reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=aVhFvntcAiHl1cUfGa7ZdVn7XulScDHz6YAjay861B8=; b=Q
	x0VAVFgpJHw32eis5hycEVn3qgnMp6fTmfMtxaYImGf2KUEsRsnwioQtH5JT8aqI
	T4rQ236VA/DkGSfOWDY/jY4u8V6gnzPldPdsAYN/axi6Rfbt6rBiGcdLAnrdVVjY
	SfbvOpgrMNmsJkuJeCkcUe2Ez5EZEfl/+D35dhOxLw=
Received: from slark_xiao$163.com ( [2409:895a:3841:c8e7:efe9:818f:26:6687]
 ) by ajax-webmail-wmsvr-40-121 (Coremail) ; Thu, 20 Nov 2025 10:47:44 +0800
 (CST)
Date: Thu, 20 Nov 2025 10:47:44 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v3 0/2] *** Add support for Foxconn T99W760 ***
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251119180735.1baeaa8b@kernel.org>
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119180735.1baeaa8b@kernel.org>
X-NTES-SC: AL_Qu2dAfqbuUAt4iSbYukfmk8Sg+84W8K3v/0v1YVQOpF8jArpwSECY0B8BUfdzf6lCgOMiBSzdglMzf5CZrRIeK4rFIuMn+hCzQiN9/GlcT0saA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <16b8499d.29cd.19a9f29223c.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:eSgvCgC31GpQgR5pym8mAA--.5547W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbibh4MZGkec8WEzgABsS
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTExLTIwIDEwOjA3OjM1LCAiSmFrdWIgS2ljaW5za2kiIDxrdWJhQGtlcm5lbC5v
cmc+IHdyb3RlOgo+T24gV2VkLCAxOSBOb3YgMjAyNSAxODo1NjoxMyArMDgwMCBTbGFyayBYaWFv
IHdyb3RlOgo+PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMC8yXSAqKiogQWRkIHN1cHBvcnQgZm9yIEZv
eGNvbm4gVDk5Vzc2MCAqKioKPgo+PiAqKiogVGhpcyBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIEZv
eGNvbm4gNUcgbW9kZW0gVDk5Vzc2MCAqKioKPgo+UGxlYXNlIGRvbid0IHdpdGggdGhlICoqKi4K
TXkgYmFkLiBJdCdzIG15IGZpcnN0IHRpbWUgdG8gdXNlIHRoZSBjb3ZlciBsZXR0ZXIuCkFuZCBJ
IHJlcGxhY2UgdGhlIGNvbnRlbnRzIGFuZCBzdWJqZWN0IGFjY29yZGluZyB0byB0aGUgZ3VpZGUg
YnV0Cm1pc3NpbmcgdGhvc2UgKioqLiBXaWxsIHJlbW92ZSBpdCBpZiBuZXh0IHZlcnNpb24gaXMg
cmVxdWlyZWQuCgpUaGFua3M=

