Return-Path: <linux-arm-msm+bounces-52922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AD3A7748D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 08:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05FA63A937D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 06:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18F01E47CA;
	Tue,  1 Apr 2025 06:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="KE/GD+1q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E7B1DB55C;
	Tue,  1 Apr 2025 06:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743489162; cv=none; b=nYCh8flr5qpupkG6C8BXTrpulumLIrC/qlyjOLCUW4d74lLFQXo2oBqYQ7rkQZMDaAQEGbUMHIoEKGPiLbCXg1MfzSE+SksSvvEQ6FnZps7ECHo0auZirPob96XnU0uTMZhdmKVSbm9JXFtDlp7sVMUcmHV5Y6kAhLoWtJG3Ke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743489162; c=relaxed/simple;
	bh=Z3TWmIlEniRqULTMH6pCpJTJm/AArQf/z43T2jywDvA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=VcW9KRdUupsqAZ3Ytgu7qkl/pID5od4pr0jEVst/O5b/moEf/iL1XQGnSegrt0aJicy3tiChxqekuyShH4lZSj/OUcfHTI8mnDUPDFncuIXYYBs8IE5iBZNmXP+J+i/cNSGamA/tVakph3ASLOepm8mYQl25VxIhn2UBHHWMbwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=KE/GD+1q; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743489158; x=1744093958; i=markus.elfring@web.de;
	bh=mLFMFxxnB4HFSX6cDRqMCxHvEjCtGqBL4hrLzV0ECUE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KE/GD+1qz4wm6lPInNTNHmMuDrLeb+eWlU3zoOYK07EUiOgyWCiujJoZ+zAJFUQj
	 yT561FxTP3RmkSJII5rQEEAdjsOvvjOJkgwq/dWooBrDM4lHPEcd4trHqMbPPnbzR
	 X2jDmsogzir+wJZKoSWmKGtSSM7wpgANT6DqzCi5DtF0zN9Ya67LynoHR10kwWYcK
	 EiCmVV3MzHE/V8vLBwnHPiSkJ7dtO5pw9dyailC2VB4Y1WmkFYhAz28lqEGW114wC
	 V4mJFrA91TmdjN5dJtkGrMy3v3o/5T5zclG/o8s6SPaA6L11e7AUl+4Ln8A4Xrodu
	 iAOPbvoGMLOdnocFKQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.54]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0PR-1tpMUQ30kX-00HN8H; Tue, 01
 Apr 2025 08:18:43 +0200
Message-ID: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
Date: Tue, 1 Apr 2025 08:18:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Daniel Thompson
 <danielt@kernel.org>, Helge Deller <deller@gmx.de>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>
References: <20250401025737.16753-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401025737.16753-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fE8a327Xw3HBuN0WBwRxTiZD/qUsUvAEGdxo9UcXdU5HnFaYLaI
 +FoMTSCp8Lg7iDnfCBbuNl1sE1pLfKHC4xozs+wJZ8huc67ozhOpwGyPYxxMPzp80k7ZqiE
 bH/yd+EwqIVCMOpQC18ultCSGDlsUGk4jwxcsSdT1IQ3YSYyJqao/27E4nUY5tqi1fBHiJg
 /LH9gnCVJNtzEMfEzqysA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gz2tuASMJTw=;BRKaTYjbX80tcujhLK/LqYTO2BB
 fgmKqhSeOCs13v6cl7tJILD3sQc1RQjFVGsC0Nn1lV4tSmZGUrNRO6/PAxXu+dusnPCWc36+6
 /B4u1wWDgR2zm8/7mYqi6xy0qMnLC1FBE4gRU9/hDZJyhM0Z8foglzesQrhCdw1YpPz1AUMMl
 dkp1ZHvraknxfzEt0qM126zK1K6gcIwGR3SM2h4t9CB0l7hghenGE+6yiDAVnmCWNi+8PItUt
 5kSqOmashQKWqFcVoWOa7jGVbODMiQnpZ14dlG6JaWGoJ/QgbQk/5jpmylxZ0EQP2AJ81eDhs
 C7XAChGMLGzpetRlwSNUAkjous+nHhipWSR4d18fTwBTmDaYAioKbLXfY23HcIJALgszaEB3R
 ZfOsTmLuWOXFIw0fmdSjLumg9CqPe5GzwIBevbBVjJ2GIlDKUz47QuoC4wBiOfQezEpP03kc8
 tgPnF3k+0VUwnEoIYJx2lBHBE8+S3cwRMb0DVWSuJeAjy/eFcu/o9/Nv6Zd3dtk4fhOkWx+6x
 izob7tWBc2g3/xcaQxD5MrBER+bY5hGIrzOFm3NHCYLzkb2J/lTl62oHKgBsUPnTNyLd9jkEw
 vAvmY6gxl7mBM4slUlqwua5/C/ZUXp2qFSmbQry+3HcySzScQw1AAVz1jV10Dio1HGBX1F63/
 mZtFAKQBEYEyMr5fZXRw+dAAJDdex8VWgTzraX+OKhvUZM9D9LeQJ3aEl70Cndao1gZqnCwz0
 muNxfGzbI8UfMzpKAWy8tvzYNbWcSfJhNVEyAAFNo0C2GKS/wzWF6U/wWozrPOOQZJFIK5Aj6
 ubI03ZBfoRmX1zbJ8d+C+Vca9UIl3cAtv3Duru1Y96UTAIgfeoYYHyibaQO7tCifYEDF8HZCx
 WESqdGWiNhk8gHSjtfNj74/F20F+MvyYXnanyScHOiHvbOYGPlzBf7QwdobuEBH0AKydU75Kw
 dKpT+h90z7N0QZ37jmVnwMoLKWAXVrev31+uL0Ty9KyJTkNd6nckXfxjqcbojcdBmCKahW1lM
 8bch4IWqzE172L/7fhOHEWV6SV22MZom8meHrR8rdJeV5oGbsZ7EWawrG+UFZVc+5WfaU1TPm
 5nbusk0z7E3C+QDQJsUFracY1CxLwAPP/BWXkjqMsFg320eXN9ORbTMlXrNit3BvzNdBQamvR
 VgCf+lE7naRmtOL5qXWVLRp5/XlLawYpNHL8YwlZNoZwKS6OUqOh/PneB8UikIvV4qgGFQRWs
 QgGzg0mPWHQ7RxSuSNZx+/Pa0eLt9/8hhu/Xsu2VXAU+RUWAZuZdGIf7ZGwWQ6ONryaVfHQBo
 76OFLiA8VHj6X/3yO3W6ZMfFY2lG1Psm45EN7eGoHdh6mjg3+9DMEsNRuxsIHKYqsLObYDgeE
 NC3ODwJwJQo0G7s+KF4k3gsL4Y1lbgCVy9ZrksZa1Rkh7iQIK9LlhqZd4jul8KVEEWhUVFcC9
 3wbXjfHKDY9BN9CzL8MKBIdPFPxIGG8qXtsObgUI4OugxrmLDzXIMRLtRUIwIYFPIjPPgMA==

> devm_kasprintf() return NULL if memory allocation fails. Currently,
=E2=80=A6
                call?                               failed?


> Add NULL check after devm_kasprintf() to prevent this issue.

Do you propose to improve this function implementation a bit more?

Regards,
Markus

