Return-Path: <linux-arm-msm+bounces-29492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A595F245
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 15:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E6F928174D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 13:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7C21487E3;
	Mon, 26 Aug 2024 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SmZu+7uw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B707E1;
	Mon, 26 Aug 2024 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724677245; cv=none; b=s7mJYKhCmOkjxKPTYznNa2GIFSqRJq6fEupXtsH8Hi/38X3hpdUqEs42AQydxiUxpnR9w6QBqNxDonLpxS7jrygxcx1cD6+Qn9zE0JMM++/JeZiDuMUPwI0EP6naOjvwGQjbuYLgJ+DIpzkAv/AFjpGZXggJRBAtxW5vpE1eEBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724677245; c=relaxed/simple;
	bh=JhpyAnaD7dWNN1bTpxCG0QZu8qf2suEDnGrq4j97Agw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Ets+S6vph4JAhzsXXISTCLWpmY+xK9MPMoMTgcOQkEVCnvRaaadNC6uhdAhN33LoB7y8+CrvAoJ0M9QwnWcP+jjgCCOiIKBCNjU/HFhcHuVoyPQ3fpYV+hcA9uULYYMQQSZYpk23GTvt+Txrf/VVd9/eu4kweB2wbeVx3a3GNW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SmZu+7uw; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724677231; x=1725282031; i=markus.elfring@web.de;
	bh=L88uf0gBYffESaPDmIR258SiEhKps5DkIATA3tWCltI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SmZu+7uwQdRG/RqsJn2TqEHt6rc4BorLyaEsMBySlIuQkiNC0xaVE3+V5eN6j+89
	 jQQZsIKuvwCfpAOjaZYXCQCYS9/H9oYGRwbN127PN2n/8pDM6dwxheeJ19+ZDlrir
	 YT58JUZAa/psvkORUeN5JOJb//5Lguo7HIzmHWV4ROtA/hbCFAIjWSnxccEvZtkY4
	 TdMbBF9VqOviPnYaH2N0fvmkojGb8//ohFmu3Vh1G4uhwmji+cjkOReZmU1aEV/gA
	 TQN7z1lYnCGyD6DpnXjnxFseM/9Q0O1clS4rub6mrDlU977e1gt6cX022VBTQ5C9C
	 OQnm09HGe/WwTEiOiA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLAVa-1sRS9d0vcg-00I3aZ; Mon, 26
 Aug 2024 15:00:31 +0200
Message-ID: <b96565ac-2052-44d0-aa9b-0f2d10b424b7@web.de>
Date: Mon, 26 Aug 2024 15:00:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yan Zhen <yanzhen@vivo.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, opensoure.kernel@vivo.com,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240826061717.2016126-1-yanzhen@vivo.com>
Subject: Re: [PATCH v2] clk: qcom: Fix error checking for
 devm_clk_hw_get_clk()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240826061717.2016126-1-yanzhen@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XwA4bHaeQfDr74DylbycT+tuFODVMxeUynR/jcYDiu3f6FrevyK
 pIxu1tSVpFq4PXOaUTVmne87EXf4NLQUOMrZArglwEgNwu43+cKoXxWXXqXoQbewYu5u+Q9
 uz9HDcJlsMrXgcUPfBDS4fpF4bRQIEsQqCo2+zCstsPBBpzDlZ71Hd+aHy4889z3ZqnS0vP
 bAhkLMiAnpPJGhhJBXQmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IDQt7LfK2gE=;7ihaKBDEgFsES1p/8cHXpATxkkX
 V80ztt41giRpRr1E5N6Mv1DgrHQoA1f05nI+wFqt983nLbh/iDInpdVKgrTT5EWU1XziW9igp
 SFgXg0e9le72OuCfQcqejpLTYESUhLVQkYQWE2Rgmhe9y+hy9T7yg2ihiGwtUqjo6gTN0QNJe
 fWhxMvd9Kft4AWDTwrJoPP7vx8fBmDtGoO3vqhihQ/4zoV2TfCZnPXYx4ux9De4UoaWRDBfYs
 Q+zbL8ijjBFLvh1tULFso0Z3mddqs3RMOPbLCZOGFj5CD0iDu6ttWcUjUDJcHbXAg538gzjss
 cBIPH55py8ramdyMon5kqve4n/PzKA742nYlGxka73lKLf/yNVPeGdCdmHUXz1zMuOZfb+sgb
 11vnzHRR5Tk2l7q/TOdV40ReRWTZZoOTDMQKOup8skGc8a11pHnMomxE+izRxQaB8SbpyBT8I
 0rSRF38Gbcql9aJQuCwNMmhVHq8QJHEUZZiwQkVpQakB2xYecUGI++j5p1cSlhW9cyP02xaLg
 UD5CVc/8JFDey1CZFQvaApd3z97wO+pamg5QBDDBHcExpFgabnp5fytWAAjqHOMUJeOIlb5aD
 mJOrVfkteM+Bq5+vXyrKVE8yGmbkHTjM2p1NvwulaFBIUIzw2cc5xAO7WpMBUy2q/vK9q6fpE
 Hv/Uvkqi66KQs4eltMd+mswir8zrlZ70Kz5LN1gFiG+OHolJHI4AvCGqS9YANn+26f2bH2zsk
 LsSLc+xdHvwnTMF2MbDvwtVfU5N1pHFlovHik7MX96xBCHZYmuZISRoSk8shVMhc0X2P/GyvC
 hmEEsj9gCcsNTfLRLYZJ/NxQ==

> The devm_clk_hw_get_clk() function returns error pointers.
> It never returns NULL.  Update the check accordingly.

Would you like to add any tags (like =E2=80=9CFixes=E2=80=9D and =E2=80=9C=
Cc=E2=80=9D)?

Regards,
Markus

