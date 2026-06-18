Return-Path: <linux-arm-msm+bounces-113701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cLTEH0myM2qxFAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:54:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0629B69EA06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:54:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="K7/9yTiB";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eLaoBEDe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113701-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113701-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E756A301C150
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 08:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B663B71BA;
	Thu, 18 Jun 2026 08:49:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96863B4E9E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:49:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772555; cv=none; b=sxMx4x9bVqbc8DbPfKNc0+X85nCbqlNN2z7wPuraYOmdunyBN9RpvfuiMCtUVgZqB3ROGkbDBG/XObDCoOMGGqGD89YIUWmnt10UaNVCoQErUpSaup0YOgvqbdAXjovdgqmexE7XHp41xB6EPVpexk4/1wrLwr+rJIcDyb71mBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772555; c=relaxed/simple;
	bh=vwZ3ox+S8EieIsKYJeZmQbcya6G6wNYQsljtLPXCGxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SBOc/PGE0voJHMUR2wX9bNlmONF4UUuvhYU6LMdBiEHPiN1H9OJZ8Q4cVgk9gluePVJ/mbLTnrKXMzNtlZ6yZBCKXi+c7/ctitL+jDeFXrg7calqkKmXlMoL4pVVM1NcknRV3iuKXVyT2jAeyTcwRBYfd2Y8IK+eN89fCdB9Lfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7/9yTiB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLaoBEDe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FOb21177641
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bHBfnOAx1pzFWwgZXfmA4+mbnnhL+GXgdNbrmQVFYI=; b=K7/9yTiBl5cqHQg5
	fvVraopTRGu2bBf6exdrN6Q7F9Fewv2IYgq2+73Jjjit2s9x5kQtkAt4wsxSL0E5
	RmAwUof+CnqpAOVBuQx5P71IDfIrK4eGaza1dGlDUYlpY/vYvXj7C3mRNSeDexNG
	XrtdMpLDxPJt9I5XhfTNRO+si8a+LumH2ska9EZNN4339ySmmwcAoV+f8S89yXgF
	TdcmVzq0gHX8+yCEGvLrK0JiFuDdoFXunCj9w473ozI1NnK4n/kPDU3MEOs2jL3c
	qxdZyGf4ZtqbkCjdg7HPuCHOzvk0rCIzJLmGGRNP7EggezpZxXWuJClP1r8stgm6
	Mz/WjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev12kjnpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 08:49:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157263095fso18969985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 01:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781772553; x=1782377353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+bHBfnOAx1pzFWwgZXfmA4+mbnnhL+GXgdNbrmQVFYI=;
        b=eLaoBEDe1w4x6U2m/1h+ntxHFwnG6AZwiB/Cgdkq12aC6TvFE6V2JAXXqXpAOGJ9M0
         5tBrSKytprmobrr/gct5dddaywFh1Jd5BeWd/Xxev2BgaBN1ZWBZ70bCCYAO07xiSxuW
         RpmNd7QHGzCQjUdvGQOfhrZXNYDczsQb9S+jvLzyMtfBRfJ2zYcj7PonXVfKMjAQHysX
         3+arkQ2UpssZltjpo65Q3j5+fNeEUvf5/E46LnrKZSyx4pp7XZgH0bw7k247hXqwFN7e
         c8QdfO3LGSZjbM0aMCeUdRgFyV7kZFWjCEVe+A3T2MWD3QWvwu3yosXEP+c4KExtML53
         ufww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772553; x=1782377353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bHBfnOAx1pzFWwgZXfmA4+mbnnhL+GXgdNbrmQVFYI=;
        b=WVYq2DeSHL7AbwAQHsnWMvYwTOWv5kBEEP54/w/Anach01tHHzJsliHh2VT+btAMvy
         iGwGvGXDc3i5OnRVLfMw+ykbTgVhxx6KDN6WSmX4b+5g3kpQeJLyHiBbBEiNLapJnAgJ
         aHfZFX1MgeaC3cAe7jJZy2ilpVdJnGw1W6SEfu7tl6uxGqaXT8qS+c3pLfs2QMYmnQD5
         YmuEzQ+PIQvn6z8GWNLDpeGq1f7YRfxr1sK7Xs+yadNzs4gwtPNFSz9vPxNxYThdQ6BA
         aDf15Rfo1ZAgDQlfOIcttM6wCJTUTx3FqbJqxifYMulQIPdfEB8dGxvQcc+PXeG90W7C
         Z7ag==
X-Gm-Message-State: AOJu0YzC8NcMG16ZipM86ef+zdoVX3nJb8OPoChAxZEH7OO4524s+aB4
	vlxgQ+D5QnXlvb4SUzgeMteCwSouuS0Brw0XGvQVq4wOLHVdZKb/V/f6tkJ6D6/UhWhyBhSHyGO
	oEOYZAc1lqFNSwL7P/VeM1vyr0rjEH+UzZagrmYnYtLOkB+KoIjZQHg9x8FnYJ34dhUkD
X-Gm-Gg: Acq92OH7T+jcBB0nqjZQsx0SQXOaPc3cyKB984O2bfBleqS5c5cxSQtVf5WkyeZnaX5
	3WxcZMxbZDM5eRsQyJ+7ywJm/2nrJ1rD/7RgPmarsDEKnUa4TwF5DzYaJJrHWPFev6pyiuJMCos
	yl0r3pUnfhvjdC8OzneNJ3/fmI63/XIZDOoocNhrMTfKMjyye9p1BxDZnkNCa3xA7ToWiQUvS4n
	ve9r4zYOMrXexQNv1a1EdYfl6U13tapufxaizunLKgK4Am+V6s6PXXM0B+0jZc940G4z0/etKTE
	0N4hg34M7l13LXl9lCxZLcNw0OL+6/3ITJ5WhdauksgJIjcJ3BAIaZN0FkpmeMH8Y7LowUbDac4
	oQR5z3mClwWM+uxToVmIs0o0Z2g/tvpUQe34=
X-Received: by 2002:a05:620a:3910:b0:915:fad5:9096 with SMTP id af79cd13be357-91f2ba5e3bbmr276505485a.7.1781772552885;
        Thu, 18 Jun 2026 01:49:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3910:b0:915:fad5:9096 with SMTP id af79cd13be357-91f2ba5e3bbmr276503885a.7.1781772552496;
        Thu, 18 Jun 2026 01:49:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22544sm897196166b.14.2026.06.18.01.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:49:11 -0700 (PDT)
Message-ID: <d9e778ea-8a67-4576-9c96-9cfd859a266a@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:49:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MCBTYWx0ZWRfX2WN/k7QOIvIZ
 WIqbQbEeF46v6+hQ22o6v3QtMTaJ0sndXsrJav9buCMao7dFGxJF4Z5FHLv7RRAdcU93Sskab3T
 gv24ILo8qSyzlBUBLdcozqY2h5qeEvGGqkZdynggu2DsnRe9Mg/3BjyJSbLW9iAFDc7miQnIRY4
 vtzzFd77srXazh+8JOuFT7IU3m5aBzZqINiBwH2f8gY3nQ3NIB1w11tMhiDqKBDsMmhVMtglvJ3
 /g1khDBXWjKXk1raVqELTGOpL41PE8ENiwDDKWL//E4Ue0ktENXEZRkCVqeGd+zqCEj5SWu9mIk
 PfwfFVEdAimxtZTvuRTfjESKJB1AUVphd9XHGNAnLpuT9tt/fKTlEsI9Vs2Tq57HJKoKxf2U39H
 IsqmGjwccvQrvm0nejWD1xEZEhxV/jWjD2W/LhZ3gkkszkpuUI/R0uSxMjLx+Kvsj9785wQU13z
 5/fJkmRdMv/H46mv0Nw==
X-Proofpoint-GUID: e423wT5Zctu3yX9NXJrC2RxA_b0dHpnL
X-Authority-Analysis: v=2.4 cv=HpVG3UTS c=1 sm=1 tr=0 ts=6a33b109 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=rd1qytcpxr8NqP3Khf4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: e423wT5Zctu3yX9NXJrC2RxA_b0dHpnL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MCBTYWx0ZWRfX88u+wAJP2LLj
 B9+FiA+8Tj8J3uYJSJbetaETLHCVkgAi+65VwFVzFjSwbtsIjcI0uRZiBtCLyF6pInhRyilHVkY
 4vV/mlBSQi7cnPVUDXcrUboLulRH6Bs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113701-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0629B69EA06

On 6/16/26 1:54 PM, Sneh Mankad wrote:
> GPIO interrupts that are wakeup capable need to be forwarded to wakeup
> capable parent irqchip. This is done via writing to it's wakeup_enable bit.
> 
> Currently the bit is set only for PDC irqchip by checking skip_wake_irqs.
> skip_wake_irqs is set to differentiate between parent irqchips MPM and
> PDC. It is set when the parent irqchip is PDC to inform pinctrl about
> skipping the IRQ setting up at TLMM.
> 
> However, the functionality to forward GPIO interrupts during SoC low
> power mode is needed regardless of which parent irqchip it is.
> Without the functionality it is impossible for MPM irqchip to detect the
> GPIO interrupt during SoC low power mode since for MPM irqchip the
> skip_wake_irqs is always false.

This is a much better commit message, thank you!

One question remains - should we set skip_wake_irqs for MPM too?

My understanding is that no, since the MPM HW is simpler and doesn't
have a register for acking IRQs, so we need to do it from the recipient
(TLMM). Is that right?

Konrad

