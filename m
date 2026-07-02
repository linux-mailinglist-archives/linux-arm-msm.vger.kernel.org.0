Return-Path: <linux-arm-msm+bounces-115812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t+O3GBW2RWrqEAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 02:51:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BE96F2B16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 02:51:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Yp+RXgMF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="UD/kz+DV";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115812-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115812-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33F89302FB60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 00:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC3D269CE7;
	Thu,  2 Jul 2026 00:51:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A14E21CA0D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 00:51:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782953480; cv=none; b=oFczbr4t7HW5Aud6nGNYM8jKlSXtq0qU5x9VR0YfAJZkMMb1WRKF1gKx8g0QToSLxnKd9wEPaLzt+rrzmA4oVm5GDkX8C7V1ALSQL4O2T2LR965TKN7gZCKQ8Sidxhs0ItBzyVe37Ic1jglHRQzem6PgFdciUDdmbuRHsPCLeZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782953480; c=relaxed/simple;
	bh=Tu5S9jCJYgsObHMW5P/ZmnurjiMv0ZDJq2rX34bxwFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QG7vaKQM/rSQnmrIRYSCReIdAuoAtWVGF4yTZTE3thPHo/EkPf5Mw68ulBUn8MtWSRLqNkD108Oi+2LgQzIKLfdlUrDjVKXyQ7RXJ5KJMrAU9d+KPkGOCKgng3+FnlbRHM3CMWRzF5AnEBx7oOLUdaoefdgWSvyCgsIDklUS5uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yp+RXgMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UD/kz+DV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661LhlV62485627
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 00:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNehC+LYZqsx3fEVijuvFUAX4NEjwm4VUVbbO3e9BFY=; b=Yp+RXgMF+TW3nZYF
	6aFZ9BdeYbGRhu2uF+Nwm8yZAkaQgi3eRxMwJ889F+WLgpbmwJ9L1GQ6d1yWAS9H
	FCTBcX4pksrFnfCIufdtPiMx+gjo+44ORXJRybGh9jiGH7VKCBSM1bcOTAGxT2lm
	RPgAbbOXH5nm/xhjkKzVgRFJ3E/vKBFGmoMuSq1+EtHdCojYO0kw9cR7tCGICaug
	VGssj8Z/nKf3qhyZEsndh/yORjD+Xa1KJQFoFNMpaUdOIreF1gg75/WYQYiKdUFS
	mHu9TlKtUrv4rrwBGvRLZSDrCByPWeeyj92ZLwYS8XzP3ZsycJzAFeOZnB2Pb7eJ
	29QgUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f58k394ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 00:51:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so2099383a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 17:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782953477; x=1783558277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNehC+LYZqsx3fEVijuvFUAX4NEjwm4VUVbbO3e9BFY=;
        b=UD/kz+DVv+kPr6SUCuA0saosrLabluP5lRTlfLsvDZl7IYnTkwGUsYLOvBa75NOpYs
         7u+WhALN68+VwnKEQT5Jg2u2BrCK+arZ3MZLhrbJRIJcNTBWHUNb2vPGTJomJm7aYrNn
         wL5ZmkggNEcubUB/GMTEJGG4JAvlCe8L4J8mXX+QlWqmHFUNmKXrdR6c9qcY23xn+nKb
         nLDQQU51AjpnN4ao0tpqcSCwklEo2HPszq8MzRf43gQ+Os0gOiIL4eIk15hlzcj4BHhl
         poaoNbaSDakXIyvxEFmhxqpMOLaMccM8rp0ql+tu3A5MBMJktymesLFg59GRBEAVGm4N
         w4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782953477; x=1783558277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNehC+LYZqsx3fEVijuvFUAX4NEjwm4VUVbbO3e9BFY=;
        b=JbMvqf8RZNoRPb4PWqG2BbrMsTF9409bHN9ZGMumZM7vctBV6LWyzpSQpD/2clCfu3
         KPA8EgZSWAN8raBgwez/PQG1Vou3Qkz9/2UVP9hYaD+yCdc4G6FIujNqigxYUQ2lU39D
         APXBYLaxSxhnbi/P9NetyCHDfosCcK0ph7Ij8rj5HDCwx/2sHTd9FrZG0t7mxvWtF+88
         NjE5V/kGEDmVkyoytnFa6DKPNb3/6ClLTlYEZfoO3hK3VaPk6f74JVz9ln6KFO1NrCpu
         WkhyQTP+jzxUf3AJvBV/ZItc4yq1A/1QtEs987MraEpIRhh2szM1fmu/ynYfdCIhFwwZ
         uTLg==
X-Forwarded-Encrypted: i=1; AHgh+RosJCSGmq3LYWECy5WrcghY0GQG4fryg+Lv5tWLSTS/uUi/h1Ep6b0Rnchu1Uk74GTl0tqocmGwOV+5n0Pr@vger.kernel.org
X-Gm-Message-State: AOJu0YzO5kEq8w+b8YNJuMtfzQ3+9tm72bqYAC2nFLUKkn7QCeFwfOTB
	7FKEljE/Ge6T8723/mj8skU1CBGjF4PrqDkUu9f7HYo2YWPIsiVznlrdSHXvE8CN98+ZZeOaxuI
	Rn32eT6Z5xfsE57qmnfoE8BqYVdxjiKe22gl+BqAxY4e7zKP3tHDgNjwH6fYqLHLv5aDe
X-Gm-Gg: AfdE7ck+djPVpfMkZcrDobNqnUnH0yQr42hq5omq7Udbt9f70ZJVWGNRs/7t7L9T2Lq
	IrAf0X+Gs2rWXPFyTIDDUd5Q1E6Hy2l3qRPLsVOEbpsXpJshXQRJ7BOuXvHzbXVK6X6suQPY0zU
	HpXRjRrahDAwEbiQQd7BIKotT+ui9QzpG+tNFYVW/FnYMe7gfgReOV/MfRfcOzWcKq58Jr/35ad
	wdB3gl2YPLRvfAMANS5G8wfxbJYMH610VqiDUji2CteyT+eh4sZDJDUxIWoUbdgx1A98X987ns1
	E+oq1wEa8biQAa0IV4ZApnr1XIubf3PcpHqQmNHOHSVbfTqzer2yG0XQMPMGaZTuqyqqp28WAgN
	HFU1It/qFY+nQllFxbf5l0re/WTNaStoulcvd2ZDB9Suk8g/DLDFeVy7VhMuXsurqQS+tNqEvY+
	qq
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr3313993a91.31.1782953477414;
        Wed, 01 Jul 2026 17:51:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr3313940a91.31.1782953476867;
        Wed, 01 Jul 2026 17:51:16 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e146f003sm84699a91.0.2026.07.01.17.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 17:51:16 -0700 (PDT)
Message-ID: <6b789ea4-e06e-4f47-9a35-a2b58994f433@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 08:51:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
 <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
 <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
 <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
 <12709ff6-bb42-4d3b-9f9d-e327cd8d89cb@oss.qualcomm.com>
 <0f05e07a-57ab-4ae6-8274-c9c496ca60c2@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <0f05e07a-57ab-4ae6-8274-c9c496ca60c2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAwNSBTYWx0ZWRfX40d+qtMF0p+0
 z2lo40dGfvgLehy5nmG15Y5JUV2BvtqCbzwKih/GSsWUknf+OXsDw3vyDvsfdK+LSMT5EEYRK4l
 KQZxuyYHbp/MvNl2+4DlnwPUlM9c9mjDuH2Ot3NgYx47pwG0bziTfCUtZEqIpCt04gd6OyFO28/
 i834mYu3nWiUh5vS/p+8zhTI7yBfdZD3DLKk34x7N7Lzw7SomLEsbtBhaHR3LgkI89qICeyWZi5
 gOcgZzdluzkbC0obTJZOTISqGkD2Ly4pWHeo4kMQHsLaMRUo5Gv8NtQiogf8J6XShyUUMIH1NR7
 B0WeGhwEWvIII5F4rsHAWtIvBD7afa7QdY5u5HECEgr3MwKs/JIrno2ElDYKtQ+1K9Opt80bPEz
 oqaQAsRRdx8H/qBKfnJTxigtp8TaZ0U7OrMTK5h3+iTkn6pjeuLc5ukFH47Ena1u8C27xixfXSJ
 HGO5VsfIdeFE1rFXnnw==
X-Authority-Analysis: v=2.4 cv=SuGgLvO0 c=1 sm=1 tr=0 ts=6a45b606 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=hEVlawO-5ZV4_H5CQOwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAwNSBTYWx0ZWRfXyhCXtbv9ktCU
 0Uw1if7wReZXgxrYWcm7jbZCjtniffWw5Ty7NDoIqxsgoLCsjvI3nhAuPP3q+xXiBPkSrUmEjUz
 k45o5Mb5m9dZ6ppbu5SAC/3b9TbYJuU=
X-Proofpoint-ORIG-GUID: rwVxruGLLLw4t8LlS87bCdBotLMMvSkA
X-Proofpoint-GUID: rwVxruGLLLw4t8LlS87bCdBotLMMvSkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020005
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0BE96F2B16



On 7/1/2026 9:30 PM, Krzysztof Kozlowski wrote:
> On 01/07/2026 15:09, Konrad Dybcio wrote:
>> On 7/1/26 2:54 PM, Jie Gan wrote:
>>>
>>>
>>> On 7/1/2026 7:02 PM, Konrad Dybcio wrote:
>>>> On 7/1/26 9:31 AM, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>>>>>> On 01/07/2026 09:16, Jie Gan wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>>>>>> AMBA bus.
>>>>>>>>>
>>>>>>>>> Convert the compatible to a oneOf and add a standalone
>>>>>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>>>>>> created on the platform bus instead of the AMBA bus.
>>>>
>>>> [...]
>>>>
>>>>>>> AMBA primecell identification. The purpose of the new compatible is to
>>>>>>> clearly distinguish this platform-specific case from the standard
>>>>>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>>>>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>>>>>
>>>>>>> We already have a similar pattern for the interconnect TraceNoC device,
>>>>>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>>>>>> I do not see there a fake, duplicated compatible for the same device.
>>>>>> Can you elaborate how is that relevant?
>>>>>
>>>>> Will fix it by removing AMBA related description.
>>>>>
>>>>> Shall I update the clock name from apb_pclk to apb as a platform device?
>>>>
>>>> Why?
>>>
>>> For the previous platform devices, we got comments to add the clock-name with "apb" instead of "apb_pclk".
>>>
>>> Please check the qcom,coresight-ctcu.yaml and qcom,coresight-itnoc.yaml
>>
>> Well, if you need to break the bindings already, might as well on
>> the grounds of choosing a saner ("clock names shouldn't include _clk")
>> name.. Not sure if Krzysztof will like it
> 
> I miss the rationale for doing the change, why exactly this binding
> should have clocks corrected.

Thanks for confirming.

Jie

> 
> Best regards,
> Krzysztof


