Return-Path: <linux-arm-msm+bounces-73244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED573B54536
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1AA83B2C4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9032D3ED2;
	Fri, 12 Sep 2025 08:25:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37648F5B;
	Fri, 12 Sep 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665531; cv=none; b=tIG1JF1ZO7RkKQ968s862XQtuqPf3zaBqzIveluKIN25rR0YOD/geZ0Q6AL3Cteld0B1jdLR+ghwzJwAKdVBbzycRLvweGjRAyab2E2gQWpsCuan8pctAuvGNscauNkolZfHiTKRNNb9XgDSUhVdxUjDpm2b+GZzZM+O4dHEFkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665531; c=relaxed/simple;
	bh=jHlaG8Rvrr89c3/jwlzVU9wBaMZ6AxQm70VM3ThbnXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmUPO8a2uCwsvyhQCl6MDYea9kR0+j0AYk1Ai2sKFnujAkijna6S37loQGro/fXarrrjWCRgAUnpTPFS998ZaVbOK3GEV1ZhHjAfeD27H//EjRzfPuVQw9OKk3T/KcZdSFN2USwxYYO58M2s0+OU8ZCiyEiZgCi73E30Gvko3GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz1t1757665514te2290d7d
X-QQ-Originating-IP: Oy1QpcqzeLXgls4v6iC4lrcLJlW/95LBchnsiKAzef0=
Received: from [127.0.0.1] ( [116.234.26.9])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 12 Sep 2025 16:25:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1419117904616151380
Message-ID: <A671BED7100C2766+849829a3-7da0-4d9d-817e-f8ce78daa56b@radxa.com>
Date: Fri, 12 Sep 2025 16:25:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
 <1ae48740-1788-4304-be86-455251a02ce3@kernel.org>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <1ae48740-1788-4304-be86-455251a02ce3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NL8LVyPxbWO0kNgjQuLRnZZ1+b/M9rvqqoCRJ8q9iPBATLUCvnpOmRUt
	Wl2KRTbMuBlLowqXfg7MY4tQRoFRCTfGHUEcPszhchtgbZ6XSq0dKm/Z1rrER9J3aTe5MUg
	wMDFnBzixyq1tzAXqhz9wYazE5QTPCcltZNp+radThbMmhA25kUAgFY3ECieCl7fqhv7J0q
	3XQ3x6S5uzouh2RSuK+KzO/8HnepVtQKNWJxASyftyNAILohyCu7NAkSv2ufXTmlJDd6np0
	j69dytnIqG5qPA0F5c8rpjv9qIdZDPG3kpJurlYi8Fsu4o1EppOZrsSZ2VxWh9ie8AkTBdh
	Oy17FmtVXB5KpirR6OAd/jxa3VYmDpcg9MTNVZtpeUCC7Eh6CbVEYm0CdXdhdfunft35orr
	Tx2wMUGH1dt+s26w6MeAP+w/qgkMr8vr9GPng0hdqIkTyJdMV8B4in3DC7XEQiPWEJJcfyp
	Q87MiePvNeW5r8T7uVke49vOTRD4vwwr0WLUvZMGxr+nRJJn1uKzkLuTIaIilWVPPtcpX6m
	IwjYiYiRGtnLIBFV7RIlPuuTgAQ3IUp2/tDMi7ykqkG4tkdla4MalAs4XKcYlbAufMjuiXB
	Z/jQq+w5vLtVVhM+sk8pnJxsOZiCUZ0dEzaoIflHRI9qHpKpNTeyduGpr2Urx21tCFLOPva
	Tg9T5BaAGHAY//HR6d5zXuRF4A/p4vAjLzy0uIQmot9jKVbyowH/ZLnaBveclytTP8d5yAd
	ABZSDBaoTiWX6PT0ynIT2n5N9MvIrzSHaXEJjQukyeEdjj3+f0vukyC4uAEHogA+1FrKvn7
	2BBkuwA6KTvAcKkJy9/V5ivhthsYOL10NrTN7ANIyubThHq2D/ck3VaX7szD737TScJBKNy
	Qho+abTXuidGArVXiT3Sdm9aO+2rYEjZgI8uGxczh21UYUnV4rtA7RfKhF2eT01gKiTV0Ra
	0P/sSqPgEkio1/t4uK373+m2ath/Bj2I4I5UV9AuttT+5JYWc/ccIVr1N9MWcD+VpzPB3FK
	4ntjRrkAn2MNkeG2tB4FBt4dl1rLx4O4xuOsXcAw==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On 2025/9/12 16:12:54, Krzysztof Kozlowski wrote:
> On 12/09/2025 10:03, Xilin Wu wrote:
>> base-commit: 51095600e8c19d53729a7fbd273abc4435a25e9b
>> change-id: 20250912-radxa-dragon-q6a-eedcdeaf3e66
>> prerequisite-message-id: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
>> prerequisite-patch-id: 257564b609217fda19c9f3424fcd9f6e2ce3ef3c
>> prerequisite-patch-id: a8f21781f3bff140260100b74041752000c06000
>> prerequisite-patch-id: b46127e2433ede17cc5e1a012f58041c6ef97b13
>> prerequisite-patch-id: e8978c5a30373c3ff312b2c8720f586c389f18f8
>> prerequisite-message-id: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
>> prerequisite-patch-id: c7a057030b78afbbb231280de3765294c006c6f8
>> prerequisite-patch-id: 56011305aa35e4c64fc7d63950764807cb81cc4d
>> prerequisite-patch-id: c3d3b313ac6abe4ec10fd820b6a9bbc63fdbdb82
>> prerequisite-patch-id: 63ee94d0ccd40f60a98b0004d627ad2e7b440d25
>> prerequisite-patch-id: 392e8f1902571e5035d5af72e40dc474b5f1b274
>> prerequisite-patch-id: e38fba722bdabc02ba09d2dc51df7010dbe28168
>> prerequisite-patch-id: a3ca5dba8def5769ffb4b95df2963da60a736f96
>> prerequisite-patch-id: 4c0fe8d677d73aaf1b5b842e072246d84729d1c4
> So the RFC is because it cannot be yet merged? Please always add such
> note in the cover letter.
> 
> Also, are you sure these are real dependencies? Like REALLY real
> dependencies?

Well, I think these are indeed dependencies. The dtb does build without 
them, but dtbs_check will fail. The board will also malfunction or 
simple crash on boot without the DT and driver changes.

> 
> Best regards,
> Krzysztof
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

