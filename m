Return-Path: <linux-arm-msm+bounces-19651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0868C2406
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ACD5B25839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 11:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7DD16F837;
	Fri, 10 May 2024 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="XLgQjyR8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF72716E894;
	Fri, 10 May 2024 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715341960; cv=none; b=lAVQXgqpeEU73SmQm0kz9MAnCwEV31q3orKu0Qcm3U9R9UbvsdhqeuLcX5gSJNcPetn/Xb65Imx7zkNSCBlXaA8YitB/TsT5OmsSfXL2ijZ2L3Iu8P2Bg89Ve3NNXiBdNQenAz9NmTRSn7h5VzZHD964riAs0+LJCQsM4bf1tNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715341960; c=relaxed/simple;
	bh=Guh5VZYFKjMQLQAhP0rT6QQW4U6WTlMZkptsToslItY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=MAvgN+iFsVcWWVx6ZNwvXJr9I11RuCuJCfx6OO6RRtgNupJt8INXfVgMjZwHqueB5TEh6UeGQdrIxogRCEqwijdINK/GgbbRkRs/bpjpssD+AUH4Ie1aBWH7ZnRblm32PgvkSYgVtvUTubLDGCV2eZ+FVx7shq/nj0WlHyMwtsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=XLgQjyR8; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1715341932; x=1715946732; i=markus.elfring@web.de;
	bh=Guh5VZYFKjMQLQAhP0rT6QQW4U6WTlMZkptsToslItY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XLgQjyR8o5LvICfsb0u5ZSGz0WKBZuQObQz1CC4A/RdHQC1mkUNuRFDq0RKWOuX2
	 4Vh3Z2E8fTlYIQFr1KQ3xcre7plemsno4ihzvGIck1oIxlJJ6DhrXgzIeASaN8S9m
	 mLDt2Sx9kU4xDSwuCoy00ahXy6HFJB38wwQZbhkPmL0Ka7xIZ76CfzIvusjeMT3Dp
	 ElCJETM8faTfjNepQhplv/sQck65JKd1sC2J/Kc1D8unQqvhXDvbM+j30AgImo2bC
	 DWYql6S+3ZqMZYzriInlgdVW7frjtXr2KmpgQKKu6KAYHJqM4yel4kJee38/EzjBB
	 FcZpzegQ2PeHE29OJg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3Euv-1s2N3R1q17-003k5f; Fri, 10
 May 2024 13:52:12 +0200
Message-ID: <51d46ce7-ea0f-401d-ad72-4bfb3f2474c5@web.de>
Date: Fri, 10 May 2024 13:52:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Caleb Connolly <caleb.connolly@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexander Martinz <amartinz@shiftphones.com>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <0da17f9c-29bd-443d-882a-69c339288a02@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add QCM6490 SHIFTphone 8
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <0da17f9c-29bd-443d-882a-69c339288a02@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+WcrWbrfOAtjFAQjN239/ZcsvvDaUEx+Q4x5acrBpy64bQb1nOh
 E6PdwlrmT01+dEVPBsaCLXuMBZNrf7UAdTQccD+EFN82VlS6TkmmH5t4vPB6UrgjI4n7zS7
 QPstY3HUPIroifjvAMswTqtwrXminHtVff6OpkTSqjeodvnQG+h/44kre1oaYlpJI25WfZa
 6C+6vf/RV7zRkNgj7zvHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eu5yCl4Qhw8=;9WFX63WP+SrIbyhdZy92EN5NqFx
 yWzDMhqCDgtX/Go3i31xOtdil+FjrqfQOWNO4V8z2JNbFbk+PSUR6/lB0CC40fQ+KXjC4KeJg
 cpNcdbYJFPOoiVogowpRhrBLDECsvLC6m3jT4zNLD6YGcjvl7Q3/0AAVR6c5e+nOt6Rs9r2vu
 bT/Hyi2bRoGm+AX7v91XTMwRbAOSW+GcO+10J+RBrc7fk3hMie2slICEzUCgb2I+paRZAL1rr
 OTvpZW1VXpoSZC4sBGk82rQfi/aAz11K/GkA0w+vRa9Eg4B7XnGA7AXcOg30pansLyndKDRO0
 buIwN1GAIHAp2hl04wa4LNmd6l10rV7/t04U29NL0RKG9z25A4+/TkIuSO6PkjV1SOsxTjSpg
 OwdjvzZp62SM1MOf34ej1Jg75yHzgHqyXfotV526k42dZ1YCRiqMe1TQCtvb6zfmF8YHke3wp
 OdKxJx2eB5LbiDTW19xQgh+qLkf0z3o8/6UGbcSZbOWYBAn6tEEVvD351MrH+0/dO+PxHqP/+
 f7s9It1cVy0XNNMRXg52xvv5pQTF0JubBv2RVCNTmhYLhEzfXDqJlyagZu5EAXsoORWLJlc/d
 YcKJyf/auc/hDdCuTRj8TMNDOWRmK8ODfoImURSy8ZFfH4SlooOHebTPGmwdFqhXhOBhENwbp
 NlMwxSIAEpSpXhqPtcMzq2Uj+8Nqk8XVYzlJW5ZmUyTxetKJf5aBXLWpVEmH91IGDsKfxDcGY
 TSGp1+cExGP5fJJSjyLke0aYq/qGrgON/pRNp0cX8EFhyPUv4IZenyelbw+5Uk77hastQ/QdB
 ncShkFn1iE7t/InH/cSnMIkmFR34jLcHcEmLdY1nGaNWU=

> > > The SHIFTphone 8 (codename otter) is a smartphone based on the QCM64=
90
> > > SoC.
> >
> > * I suggest to move the last word into the first text line.
> >
> > * Please add an imperative wording for a better change description.
>
> Feel free to ignore all comments from Markus

I hope that such a hint can be reconsidered.


> (or implement them - up to you).

This would be nicer also according to another known information source.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.9-rc7#n94


> He is banned from mailing lists

This was the case for a while.


> and ignored by most of the maintainers.

Several contributors occasionally adjust their change tolerance,
don't they?

Regards,
Markus

