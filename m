Return-Path: <linux-arm-msm+bounces-103114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LJqMJMY3mmDnAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:36:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 337FD3F8CC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 599CB30E13A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BD13D649D;
	Tue, 14 Apr 2026 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpVSjgy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxSIHv2O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED03D47B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162640; cv=none; b=D8f00Qn/Q8PHorFauqw4d/jTeSf93M9TrskFDxTb/Iq40uaSnQGLqJgmocWG1WlIKILvY77QELOOjyL+Y4zy2jlYU9tzMiZnMU0K9uVaPLn+XXDmJKx5+fFeLvKZBuh38cQQbrgmLfU351rOFqJTOGHnnhNIYY0RpKLkKL6bWHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162640; c=relaxed/simple;
	bh=37knq3BarReMdHJGIwkVqi0G+bltRDwoTcZKP0HE8Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEuBZliINW1vxdyO2NpkspqCKhpBCQODKdOmke2WHHlfEq9c7dSmRB03y8E9/hLpHUSP3gIv6jlzwyb0zh/lJ0vJh9GdYu7al53LNsuHK+wkwIV1O2oFYmTHqPPkmgrPRr/nIiRxmbd5QMROU8U+DLTt+F3kdrytlabs6uGZyew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpVSjgy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxSIHv2O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6dLYR3424949
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=; b=OpVSjgy6FGmY5Pzb
	HI5tStViGlo3hQWjilcnM9T3FN1M4+cAgxgWlUWyEEeYsmVC0b19+u9DMj99ZtYZ
	mkAd7eCfOkGDRqWeZ6PriV2FP+S4muRdLDA9Q1rRSD3nQu0/PXsZ1lftN+FnSQqB
	/bTX4Dp+98cW6OIIKdmJodvxCskwMG0Dw7aYG7iM9eiXc2MJT3XmtUri15+5NfBn
	a/zZay9rHUrGo4i+AKXwzFZe/ck4Yk+HUWVow1sA5MliMApanvL3GGNhNGrLaa1r
	z90qMiBKl5zkQXKkHyNSZuPHal4fGgEODyelk/lbDgw/JJBBOwWzl+od5wfOt1nV
	b7ZQxg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87faac1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:30:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954b9b5da7so18246236d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776162632; x=1776767432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=;
        b=fxSIHv2O3xXkFtiRszECMak2WIgqdQaDare0QC5KWExSsd2Ec77VoRdasgo3toeGG1
         ig4E/AVY7yn+09Dg+wqv+MVyg60UpYC4UPV9k3qsFmju4FQseaoa3OLJAkc5OWlKNXf2
         REoK7KTVtNBH3xrTzB1CNnlG6lm5WYtSmGbnFOJ0SbCzz7Szal0YFQzph0JaKLsboFwX
         sStr11xecTv7hhUfS9RUMYDdQazS29IX4eF18D+avJAo0qgXiG3IrLn/5ju1Uj1GDKaK
         T5OsX2g9t7PJh+MOxmjYg7aQB+ygpBalrxIisx+gWx37YAC3NeqXv5LyNfBvkByVE67a
         zbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162632; x=1776767432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=;
        b=AeNBaYYrisy6/6SDOQRHaSj/ak/zQy34LmsO+8DS6iYU8WnzoL8whxjAMkxT05mgRf
         MnoPK/JNnzgH2r3m8NFfERl+pmJoiqFhqcMnRqKGbIULQ80UN58PsJBnMtOw06rylNqC
         nSK82aRv+vkga3cFRe4DrjdKegoRHy7EhgdQFx2nX1f0NTuopQVUbqyGHEKcoVN7XgM8
         u9JeSoy3//b25jvmxNCADJfgomD2+UWioxZYUNOI3rYwauqCsdQDzd1KYJXSsISYn6L2
         G9U2aUvPZzadu0aKxn4tzcqfxnMSSqWj8hF9sOWl8zmgYNn41KB6Vivy8KocYpl3B9oe
         pJgA==
X-Gm-Message-State: AOJu0YyR7DAUpQ50GgNIXmtHFQVvMhuwtTr6OEeh4J/kYDOlK/QDgk2c
	4MOd/eXq/KEStNCR6FmumQWqljzMorgbxz4IkoG/3hAGCjFlcWoFfPu3O4V2djpAYcZAl1j1SwJ
	fg+0MhP8H5CHSqbmgMjDWEd5bIrgfGBF8fGndX118cmDuKPDJXom+DlZYuFo756yA9Owv
X-Gm-Gg: AeBDievbD0TqAoJWHWTefFIsFKhriadgg8IW9NwBwAcy7Qa1V6LqE7bbhKzNku9gFRn
	xTyi+FTS+fkvQ+eukpGYzyvTHmU3pPJj52qt7/ckWPgjgrShef8nGVbkWXb7mpSUMoUScDi9hJi
	gby3a2+5vUjl3HXikGOatC3m9ShIWKmmJfveGaZd93BrsanlNZQJkdXKckHDD9rZJXXuUEbjCxC
	n1HxdGFJ/LE26FLaOcXpWE75eA6pgWwhGPfhY8DJhTIfvZQWbOH4DJbYEhXVk8ZgdNfcd5euZuF
	MV92/QkCFOcV+B38UR+m4CBoR7VoVAqRi+wqJx8BqtsSBaAphDrwQC9pOfLOkjFifcZdZinSkQB
	mAdUdX3xOmdrOTWofeTnzzv20SyOrf9z3pLWOMzEBRoT2AluryNSkTd4OtrNOKMVWDn5O2I7pS9
	XcYevNsEyLLXMPrw==
X-Received: by 2002:a05:620a:4547:b0:8d7:a2b3:3aaf with SMTP id af79cd13be357-8dde924b1f5mr1501741085a.1.1776162632222;
        Tue, 14 Apr 2026 03:30:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:8d7:a2b3:3aaf with SMTP id af79cd13be357-8dde924b1f5mr1501738085a.1.1776162631746;
        Tue, 14 Apr 2026 03:30:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6717eb70fdfsm1265526a12.20.2026.04.14.03.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:30:31 -0700 (PDT)
Message-ID: <85e0826f-48ca-4b7a-b3a8-ae0ce3aa475a@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:30:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: kodiak: Add iface clock and
 power domain for ice sdhc
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
 <20260409-ice_emmc_clock_addition-v2-1-90bbcc057361@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-ice_emmc_clock_addition-v2-1-90bbcc057361@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NyBTYWx0ZWRfX5Q70ooPFJA7a
 3lb4UtqF4tj1SiWpXAxskAaA60hb1CfVcEHSOu/hha0JMKwrEgmJpFDmfAe2ZuRD5uAOoMD1cnq
 n6orw4n/HoZbHUwoCSaFI9ifUVlxCt+wVN8yHFiHY8BA2OigAo3z6VkF5VRgROeT4+Efmvey6M2
 8qiOQ8zKt6B0qjHyy1K+tn3hOhEMGZTNM2A/KyzCS4Krd9Ax11pGSrl37MD/ZG3bLLVeu6kc/aU
 UREk31CzNNuEm8PaH1okxpdHzj2gL81ARZlr7INZ57Hs32oWg4PVoq/LxVP3k/k7DqZeIM3YYUS
 PbiTfcYAediKk79f7nYE+zggngrkOCRcE1Ypvh3czcU6joPYJjMxhDkcgbzMhomkSt1nJ5efKYH
 S/WbFAcwpNMFWYSrJU+34niygT34LAkrspeDQwl4yk3AqRNq2FB7VKb2A1Dlj4AVUjXagS035cx
 4KvZbTFQcQIj8qRxIKg==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de1749 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=D6AGceYv9MrH0eYzXVsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: qw9R4vH506frn4pWkL-_T7a4Qipi9O2P
X-Proofpoint-ORIG-GUID: qw9R4vH506frn4pWkL-_T7a4Qipi9O2P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103114-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 337FD3F8CC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 10:31 AM, Kuldeep Singh wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core'
> clock the 'iface' clock should also be turned on by the driver. This can
> only be done if power domain is enabled.
> 
> Specify both power domain and the iface clock.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

