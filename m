Return-Path: <linux-arm-msm+bounces-89990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAOSG4uxcGmKZAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:59:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53608559D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8E8175A9E22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746374779B3;
	Wed, 21 Jan 2026 10:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBjZgHP8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSf65TW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D830545349C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991963; cv=none; b=hQFS27aiZDd+7cbLcnwU1Oubsga30uyUwJEd9s56+fRLzbAEmet5vZUd3viFH6ojXL6gW2y00Rb0/1l2V8oTHHmEQCptkTn8l5Yj1aGyL1tlRduvvwH6p2qAaEVnuia95cMmSBXCsWRXeQf1ZMiMMiSTYRINZ+wGzmav0HOr0WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991963; c=relaxed/simple;
	bh=horiclb7a1GbJNK+RwDm5v3LpzYgP0hpkH/P4im7RQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=al/5hqcVS6yz2QxVDa/kL8OO1jSAkXoCqP84tkNdPZvQXEGEPRkgI4ZKvTYQJBwWOUE8c2klCnAZ8vDon+q4rEV2lPz2PI6+zPkMUfhXoxbMdpIzPG674pk8IKKgGYl5U++B8nlY45wuuhZoZNinQH6ZWFcxDyAgd3EN2LRV23w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBjZgHP8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSf65TW3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9hdor824271
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	veLz1Derzq+KtxQrVIaUDx2xf0+CV8uyTORbOftLzW0=; b=JBjZgHP8TSfS3eG/
	v08iKUI4UgBUMTqSSRxnYtOrJD1SAlOEwjoVyP3lSxxAy9rqApsuaL2kg8eT/Yse
	7pl4lBsKNxo/0iwbm0sGuXwdJTwx4TN0slflZ3ZHTfWYo1ceNCN43ybcYSPcB2H9
	hhZGn8TYcmLBVsSWpbWoWW0CxQOxLUTeeY8IiV2Pwl4KwTRNj70RiRh3cG63H8G+
	wnzcU8zgn506NKjLBaw6Z6mKxE8kK5Oo6fEVdrpoT+DOsrRNC36aKgW7bwoBWRb0
	maQkq2g3DwmVAcXIst4+HggSqNdcuZCeZ8Hpu2XW/lyBNYSngaDrzQJ1yx/e1o9w
	UDhatA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e3j8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:39:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6d6b0f193so8181985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 02:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768991959; x=1769596759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veLz1Derzq+KtxQrVIaUDx2xf0+CV8uyTORbOftLzW0=;
        b=XSf65TW3PITYg4qXZHhSrpYw/frHQj6nm/KlMHpU4erq39jmFZMLy0/yKDQiPuSKkX
         l5p94rl/NcBPAl4++4qs5hDp8jh79rHfNwry+ZA7AnWpqWhJ0HTHRX2XM6ABIGdKOXtz
         0deNu5IbWcYsGeY7CJUfacnBbIrwFzUbno/np9ADCLewyfQPmq3DlftyitEy5FCi15Ds
         njQ6XonEClawMK/nb0KYPaTFn+QpgjHUU7Y+M6Y0OWOow2vqDGrVsWb/10NJ1Sg2Cs/A
         1C6ck+gMyv+xaB0disiRBgsIzWeLiejVCakwYh0CCAv7onqdHh5DSVXK93BTjZLd5+1Z
         9MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768991959; x=1769596759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veLz1Derzq+KtxQrVIaUDx2xf0+CV8uyTORbOftLzW0=;
        b=JLZ9eWb4hEsjk8sFOMzhErgiZyPqVOcRqvd+gqEYoIxx8uGPYftMmTHT4z1fRpLlmh
         Une0lAtsYNgPiW5ZUyrWGMM2Mo6ken870hct11isj8fmLhaQM03G6yh63TCqMMFUDF02
         +MDx5KIIbmDPAnbTX85Tw8sZpXyDVJbQctxuPhfOS4OJxg+ZLK7DYnTD4p6diidJMUoL
         DzK6dL0eBegBHX84IAZZnphn7rE53cPFAcuLRq1ndU1b+QYcFekZR0qDsudrU6MNGM1P
         FuJFpYV3fKNZvQ65M2+LZgSn93FnSM8o7pb5anid+0+LjkmXMqn6oT77L9Uth5YUj8Ra
         hEtw==
X-Forwarded-Encrypted: i=1; AJvYcCUN253POub0bvHSlbFnutQJay6mvlmetfVCYqUPz4feQCOI1eIr2/0Z+Z9qhF7aK1y5VdNnG4vmbeLj7l3K@vger.kernel.org
X-Gm-Message-State: AOJu0YxWUsR7oMaWuQCHwUSdU6iIaE3iY4A+rNWFNnfsbR33DQUX+/Pa
	QF1IXOK8qFug4RAQU2QAIZPk0yWP8fjRxybFYxO1bTikNzBs7+hPQ9lG0lkuJIRF8Mr5EpcByWV
	hxG7p1ONsCxl0feNagAAuyYxl5aYuLcYtWSdqS6M52vG3JAIReRD0h8nja4NiiFVc5YlS
X-Gm-Gg: AZuq6aL2GDwOhnst8n29FQRKrvMHD65Z1Qg+xWuvc2HyyWFykXzaypNdxH3fkbrguLS
	9M5+slmvvN0O4yUof4Pfrned2RyzEQ2emRygy63TBEXBACBb7o3eu7qCM4EIXqtdaUUtcgnU6Z5
	i1VpfIQtekZqINJM7wIme0NzgUTKJzipF1QLtGPTLE/jB21LsIkOoFHZnailOUD8bET9nJXBvaL
	gtSxE5fZaIGrsKuBfmIyqNBV0lHin8dhZgNPfu/q/X7ROLgfBiMjtETLXH7HSQDwDBqOnBkKr1W
	b+K+LhTpIZin400hQXc8khS47RxIWuSBZHpoG3qgtqov/bauN5a7DoJcKRpJuIJp2/Zy7ifG6x9
	6gXJ9vNylrYJ1GrxhnnyfbZgv/YAIooh6KpW2vTtwLlZsZHaCWHC9o/am0YeAbCyhtQ0=
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1792486685a.7.1768991959117;
        Wed, 21 Jan 2026 02:39:19 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8c6a678d49cmr1792484685a.7.1768991958684;
        Wed, 21 Jan 2026 02:39:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168b2esm1582138766b.17.2026.01.21.02.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 02:39:18 -0800 (PST)
Message-ID: <435e36b1-4b95-47c8-a7e4-b40308746b2b@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 11:39:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7180: Add missing MDSS core reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Kalyan Thota
 <quic_kalyant@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-3-0b1b442156c3@oss.qualcomm.com>
 <xdllt4b42d4srxaqszlk5tadjvd5zyj5oae43sgwllvzcsva4i@2er45lhhfwij>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xdllt4b42d4srxaqszlk5tadjvd5zyj5oae43sgwllvzcsva4i@2er45lhhfwij>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=6970acd7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OI1ZiTBWHRg4Fdqgt94A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: QqCbnhbKRBbay_jEQiM3UWAdHrwX0smq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4OSBTYWx0ZWRfXztIj5WYVn37h
 OMSUJbtriB+QoZmFfeaAXcpzN4LWhROk0bj7iubOZw7hhS5dDLz2jVOuLDvAD9B1T71kWuutKe4
 Clgakw+6Qmct8oZrrqzNYXWGHAA0yWn5+3BI8VZ4Su1MGRWagpt9poWKb4E543xc6+9Xihgy04V
 QJ/5MHkJTjcxcKdYsVAXiLzKxV43/aaoLNZRgohh+Nxxv16L1HnCFFj5yD8gezWsEf/bgTp8CfT
 jZc9qza0xRDc+62+M0r+Q1uQNpbPQ+7cKT0SLaMssKEqINCP1Y9xZOoUWE2uh+BjC+XFChGFkcN
 1SCtliZVZoBsqmL8UULd1XSjhre0ov5hMTJx6GAgMh5/USIxiTJXCoyW45ochauKyyNj9FLP8kU
 rowSC51D7ThUiBwM9EQN7NZ3cmwq3a/bqY4qHwTSmyONaWmKEToByAkPZjK5BtRb1viHxGFi4RH
 /s/wydLh4hYFR37ExaA==
X-Proofpoint-GUID: QqCbnhbKRBbay_jEQiM3UWAdHrwX0smq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210089
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-89990-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	SURBL_MULTI_FAIL(0.00)[packett.cool:query timed out];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53608559D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 11:03 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 20, 2026 at 12:19:27PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> To make sure the core starts in a predictable state, it's useful to
>> first reset it.
>>
>> Wire up the reset to fulfill that missing part of the HW description.
>>
>> Reported-by: Val Packett <val@packett.cool>
> 
> Closes?

Outside lkml

> 
>> Fixes: a3db7ad1af49 ("arm64: dts: sc7180: add display dt nodes")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> Let's check that trogrod users don't have anything against it. Doug?

Good point, I don't think there should be anything wrong with it
though..

Konrad

