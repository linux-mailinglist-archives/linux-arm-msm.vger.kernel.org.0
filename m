Return-Path: <linux-arm-msm+bounces-82462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A843CC6DA60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78BB7385FA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5A73358CA;
	Wed, 19 Nov 2025 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="lmbLVID1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD659333434;
	Wed, 19 Nov 2025 09:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543590; cv=none; b=Q4/5dcRpb/m0xoSfJfCPEPR5sPttP2TpU5yLS21rKdgTek7j5d3yJcb/L1vvEcWHniKyWUjHTu+2fG2nmwrU3R5yz0WswicewhCQU4WiXXgV/wznglLYWp7t8EpLM85tFgLuRTxz2kQ7A+Gk8c4MIM7eMlCsc4wn9uVQdqeoUf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543590; c=relaxed/simple;
	bh=NgXDY7QxjJcYHOtGGd/GQzrbOCkOJWWe71Y0GZ7Tg1o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=hr5Mp950azE/2sjSMCysOQTwa5XQwfS4VSvBjK4pbpXI+u4dw/nH5tRYoE5OWwQlV/Boe/+2JhAILg+9nKZSEtImNFM6uWaAKVzaCk/5cCth+BnIA3p8MiWEGO8VB3/FuJuyDmioIHyLcNVajcx4mDLUQET3m+f7Jxjh+VakJnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=lmbLVID1 reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=n9idDs2A6FYZYy9dKNjBnmY+s567I+LYu9oc6ROTL8o=; b=l
	mbLVID131Gde4ur6s3UyWxdIS938xX/Wv6wERo3UNnPGmFovqQAUYJCsax71TWDz
	NzPa1VWfJrpyy10Xy4hIwUfMo3gOa8Cn/iFujgkMwPBnxBGCLEB2St7oqVY1DSNL
	mgYqDxxmA5+oTDwS9VDsYrVKhgrUugedNC81gkB6Cs=
Received: from slark_xiao$163.com (
 [2408:8459:3860:2d7a:43c4:19f8:8dc3:1342] ) by ajax-webmail-wmsvr-40-123
 (Coremail) ; Wed, 19 Nov 2025 17:12:06 +0800 (CST)
Date: Wed, 19 Nov 2025 17:12:06 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Add Foxconn
 T99W760 modem
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy>
References: <20251119084537.34303-1-slark_xiao@163.com>
 <aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy>
X-NTES-SC: AL_Qu2dAfmfvE0p4CecY+kfmk8Sg+84W8K3v/0v1YVQOpF8jAnpyg8icVhkOV7G/8iADTKmnCKcXBVe5v9ZWqxWYqEqFk9uMnoTPeNQVzxcbDIp4w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7373f6c5.8783.19a9b62ad62.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:eygvCgDXH1bmiR1pDOslAA--.1156W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiGRcLZGkdf8H9ewAAst
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjUtMTEtMTkgMTc6MDU6MTcsICJEbWl0cnkgQmFyeXNoa292IiA8ZG1pdHJ5LmJhcnlz
aGtvdkBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPk9uIFdlZCwgTm92IDE5LCAyMDI1IGF0IDA0
OjQ1OjM3UE0gKzA4MDAsIFNsYXJrIFhpYW8gd3JvdGU6Cj4+IFQ5OVc3NjAgbW9kZW0gaXMgYmFz
ZWQgb24gUXVhbGNvbW0gU0RYMzUgY2hpcHNldC4KPj4gSXQgdXNlIHRoZSBzYW1lIGNoYW5uZWwg
c2V0dGluZ3Mgd2l0aCBGb3hjb25uIFNEWDYxLgo+PiBlZGwgZmlsZSBoYXMgYmVlbiBjb21taXR0
ZWQgdG8gbGludXgtZmlybXdhcmUuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBTbGFyayBYaWFvIDxz
bGFya194aWFvQDE2My5jb20+Cj4+IC0tLQo+PiB2MjogQWRkIG5ldCBhbmQgTUhJIG1haW50YWlu
ZXIgdG9nZXRoZXIKPj4gLS0tCj4+ICBkcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5j
IHwgMTMgKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykK
Pgo+Tm90ZTogb25seSAxLzIgbWFkZSBpdCB0byBsaW51eC1hcm0tbXNtLiBJcyBpdCBpbnRlbnRp
b25hbCBvciB3YXMgdGhlcmUKPmFueSBraW5kIG9mIGFuIGVycm9yIHdoaWxlIHNlbmRpbmcgdGhl
IHBhdGNoZXM/Cj4KPi0tIAo+V2l0aCBiZXN0IHdpc2hlcwo+RG1pdHJ5CkJvdGggcGF0Y2hlcyBo
YXZlIGNjIGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnLgpBbmQgbm93IEkgY2FuIGZpbmQg
Ym90aCBwYXRjaGVzIGluOgpwYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFybS1t
c20vbGlzdC8K

