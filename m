Return-Path: <linux-arm-msm+bounces-92032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLJSMLXdhWn4HQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 13:25:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DCFD97D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 13:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD3C23021E9E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 12:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B333A6416;
	Fri,  6 Feb 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7O8eZVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZNYKaXr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA82EE5FD
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770380689; cv=none; b=MeHqMyQja7pl5lvBvIjPT9WUl0h/QzYtEkL6mTTnVq9sSh0Q9cjtgS/lZ2HbPP+/YreM9E/2OTqcxG8iHXGgX0uhSJH3YKcgPOGA00wk53JTJXutUKEh4fBBjqaPZpybrSCV8costG8F97JDLRF1nNewGDwnhxXiJdKc4EIadXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770380689; c=relaxed/simple;
	bh=Kcw5tte/SQdqUSD5bhX770VA3mlzmi+RhGc5xPs8lww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUGRzVdda1Y+sDs/ZF/guvOqflRsHLn9MBnc+VfuQWh7Rhs60Or86AA5ZqjsggGOzm4TUIMgtogTIJPbXRe3EfjPIueBQbeY7s/F8Bc8MW8sljYTLMCRLYY5Cryc3mgGdZFqhd0p/QxIOyTDzE1vzT/R6ciZG71HRG34ksDO15c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7O8eZVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZNYKaXr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167XeCX1852690
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 12:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHIQAwiy6oasXdl51CW9qtAH/3JxSBQYKbol0cPU/as=; b=E7O8eZVb2/TsYsjT
	wYdPZPegyMJc2KhXkhBdarpRx+R5+GzKgi0CFRzQa3RJZLD5X4xioV55Xw8+8yFm
	q+ERXKKrgfKRS0x9GdhdNOUdNhN+nltXEuXdYQkubpZPo1qAa008ui3a3rgEih1k
	Mc5rFtB9Gc8OsP4s/1MUwRmvpBt85Z2Xu/Fnl3DLtqbPoKvFgLG0cz+uOfrFMLhD
	rcwerJEnbQhkOl1S3hHf0r+6RfVLM/Nksl4jarYpUq1b/akL902KLr3FMLAxFkhT
	5d5h1EuAZNP/vDpcqZpc3dDVTS/xkADrEavpSYelSfJDQewNbXabLQM5F6jDVWpp
	OU9RDA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c148vj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 12:24:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c533f07450so69555685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 04:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770380687; x=1770985487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHIQAwiy6oasXdl51CW9qtAH/3JxSBQYKbol0cPU/as=;
        b=GZNYKaXraUobKCiO97pYZyMG18OKC3XrLyW7LLUz7dae5jcoSDerHAsUvMvwhalrB9
         HdE7S5xn4KgAY/7095gVNxSMRkKJQu99R+QFGhU4+m7BakJWHwbvWhO8xbtLqfWvAbNj
         wnMsr1au3maS1Gy5tPktI2HQ4OBi+gCFJYNFTc6NWYYgvoY+bz9St8dFZI8rWGBOJooi
         MrfZDGlS4SgcV9PK2FA1VBeztjoCITSHZZVkEdNUvwxqHdAWsXFKVI44GXLxwrDYJZqp
         Zz5p5w/OPYudKc81Qc50VW63Gdzd/IyCKtr+NhjnJEZu7SGhdVRzya/m8DNYRqeCgrMO
         k/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380687; x=1770985487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHIQAwiy6oasXdl51CW9qtAH/3JxSBQYKbol0cPU/as=;
        b=cRe7MbwXZXQxcIMg++oIOG+nLsZXyohIUaMiBOrCa/+68jlxSMjtkhUvcxnyl7TaJl
         m1KdqH8UtDKDPcZ/swT3iW+fey/1VTdKpbJg30mAZ4vpvpYfuFCtGxicxbPehb5me91O
         wWC16YqR1zHDDW+07BkmXaIGI5RN5z9JhCRayFZ/jh6zUj227jmU41w7E4+034+k+rt6
         AAxyer55/c8DGL4HSmePRFZRywiZiOTj/hTbQcqvfpdHjRdag5HiuZuXjR8QoP/U3sgF
         Clib1KwFUS1JhJf5YOWc3eJfxRPUvCbfa9sPwh4cJUurybcTVHQXOfERue1wL/qUteCv
         YKvw==
X-Forwarded-Encrypted: i=1; AJvYcCVj4CwTmyLaVPMb1ypieJ2T24vXjhk9gDwGmr7cFClSRukSDYkmt23Z2ap9W88Za+NQEatjA4kl6mw/b8Zl@vger.kernel.org
X-Gm-Message-State: AOJu0YzvmQNmQS7R+Vx6+hcWYQl6FA4DKwa3ryVePiAT7ID93oXOYL+7
	tnMydjLohDqxcC7QQD+g6aKPYWBoVrxtS53b/IesToCl6dygeQWWeTE498WAjWEjAhWP9jrxUUA
	dGmPML7oS1T4uv0xW6LPe5eZIqDRxiDKF0V/uYYKr2ZL7h7vrFkMiYn/89+Le+XS1y0hf
X-Gm-Gg: AZuq6aKIXfKa39uPuhCvtb5W+uwMYpO4v8dY0qnpHCBVWq4WafqAuc/imdfZfU28mbT
	awpUdgLi3GVFF4SSqzmRThSqIpsaurUrplPY3j8O+q2ZJKg+AF0iR7a2Rk4H9TEe/1Z06qMiVi+
	dDvo5mP5MCpV5YyRTust3/8HObwndz/s10IVYUZTxvfgLWlAh+R0nUnLG3FlMrxiQKSssK+Oa3I
	I9FwNa/p82h/f4XftIaNQ8oiXsuPu63IxNtXh4CVq6ItuvtILHBtsnhhKcKj3lVIpZh6zWecERE
	IAr/5yjV62/j4NT0aPdv2a0zGEbyStGDC2Aq78B4QFpp2g42QAHOMM2WdinxP+MwYKce2W7O/XJ
	2u/8gwanAxStmry8so6nbhQAl5nqonpHinANqUM3NtUjn0XxLspIClDw3bXqyO1kZiXc=
X-Received: by 2002:a05:620a:3185:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8caf0e3369dmr230700085a.7.1770380687269;
        Fri, 06 Feb 2026 04:24:47 -0800 (PST)
X-Received: by 2002:a05:620a:3185:b0:8c9:eee0:dba6 with SMTP id af79cd13be357-8caf0e3369dmr230698485a.7.1770380686853;
        Fri, 06 Feb 2026 04:24:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3ae99sm80306766b.60.2026.02.06.04.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 04:24:46 -0800 (PST)
Message-ID: <93c81950-e679-4c2f-b0f7-c94be471a1df@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 13:24:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: lemans-evk: Enable GPIO expander3
 interrupt for Lemans EVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
 <20260206104642.1038381-2-swati.agarwal@oss.qualcomm.com>
 <s2z4z2evasqi23n2agroelphvmx5y24sc5nv7t57iib2tqsaen@cvricqqpulh7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <s2z4z2evasqi23n2agroelphvmx5y24sc5nv7t57iib2tqsaen@cvricqqpulh7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985dd90 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=8T1I-DRWcJqWW9-jwCcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA4NyBTYWx0ZWRfX14EJOU3ocIZT
 0J1gN+8E/fNV4FKFWId90zuAZsalBcOgICtM8UuhWBawccDDUGMj5jpmQzbdU7o/4PRJ5CxiyQz
 NRzJz6MzbFVfkOLa+XIroh3WnfjvrjXwGYWbti8GNoO/Ja0dX1op0wPsy91FsZes0TOLhc7BQJi
 MTcourNKqUe6l2dwQQJ3PtJee6vSazzJaUSNvu9NFcR1lc1fDioBcrKUm+Id49DS48SuBh8Use1
 pkDFkUXkpyIc0vF5CcPvMsPmGrXAKOBDZJocXpq57QVCEL0tRvoC5MTugNZEwkAg5v7nJR2Cyf5
 nJssCJMzGC62CTF+mM/HSklTGqWe0tZOODNqVemcWwSw4fWiLiczXrSLvSAeiJ/ISMgNBD3B5CU
 AdYE2b+qgTkRisrbbuuTtLYpQdFtQaKSdI7+cRo9Czb50xeBZgZYGLhPU1ZK9CB0XckACYeLKdn
 GZodj2e39DEAClEYSJg==
X-Proofpoint-ORIG-GUID: 14SVh-JJBHBkijn046Km39583HYKcJw6
X-Proofpoint-GUID: 14SVh-JJBHBkijn046Km39583HYKcJw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,3b:email,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92032-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E8DCFD97D
X-Rspamd-Action: no action

On 2/6/26 1:12 PM, Dmitry Baryshkov wrote:
> On Fri, Feb 06, 2026 at 04:16:41PM +0530, Swati Agarwal wrote:
>> Enable PCA9538 expander3 as interrupt controller on Lemans EVK and
>> configures the corresponding TLMM pins via pinctrl to operate as GPIO
>> inputs with internal pull-ups.
>>
>> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> index a549f7fe53a1..473cc2a81670 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> @@ -649,6 +649,12 @@ expander3: gpio@3b {
>>  		reg = <0x3b>;
>>  		#gpio-cells = <2>;
>>  		gpio-controller;
>> +		#interrupt-cells = <2>;
>> +		interrupt-controller;
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
> 
> interrupts-extended, please.

I think interrupt-parent makes sense for a child that's also an
interrupt provider, IDK if interrupt-extended maintains the
topology

Konrad

