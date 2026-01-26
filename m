Return-Path: <linux-arm-msm+bounces-90525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD3xJopCd2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:31:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E186F82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFA243015D09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100CC238C15;
	Mon, 26 Jan 2026 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKR70joQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKsgN67E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3852D060B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423480; cv=none; b=nOBGMMTIV6WV8zg9iPkql7fgOxHE+KYN81oA2+iCkislTSyzxLsozIS7EjWDejBIOvYWmUkdky+kM/KdD8BDoPhD7dXhBfhoXdsfxGwLNA3jxvbz0I4qcgJHpmqk9ynp4Bk8x/VWQhtyqbMC+c075jGQa42k5EHU5jlFnnIZKLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423480; c=relaxed/simple;
	bh=nVJg7imRYSQSdLhTTEqD6KfatiTBtOhegBV0vcXcPu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MflVVuicT3PKNLXd7XQ/dj11uohwbmHB5iwAPmwtONmqum5qM8WqeBmQwTuFZxVOo+dXQ744Wzr6wHuYGNSsf2fUYt/r0AdK5E2qnywuiVVsQnd5BKovyb9wrpuexOR//CLbVSsixArIC6F9wB4od2qAe0T/WtvpZv9w8zj1dko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKR70joQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKsgN67E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5UKPO1019099
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z6AltB38+W/aWrXEYhQXQSSpZIGF1tOyOzJmfK5LASI=; b=QKR70joQILhfhaC+
	I5nLZUkGeMSg2+aIxwk16k7IDmjACzaRhLceN6QG/97b5G5I9HuW28SAEl6BSpyZ
	PEJn63g/BhvFSTS1zYL9m0iB37WedsaRjDyRdxSlbSXmHpGBoYj9EanXEPVNw6x6
	2Lci56upxT4Gj0mEgBQQsrh2a3ei9rG3fKb7ABjY+OpsZbeSwsoWx/it2O/HCjY4
	4izBdbVWKtwENfO/MszLPaqqUBlbQ6gg+/hAuU4EdSGgCmACk7lKfM85LPN/3lEk
	/zOwUNe9T8r9Tz8//uik62rnXDcckIaf8ySsFQcRmoqneWgI+M6VPeXY9T+ZY2e9
	5KSyIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2680q9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:31:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c533f07450so116121085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769423477; x=1770028277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6AltB38+W/aWrXEYhQXQSSpZIGF1tOyOzJmfK5LASI=;
        b=EKsgN67E2Qsl9FYFn3pGiTn/4W2Fy+vAOouyol56BTKQx6ioVSxpqyhC5SKLOw90Iq
         YBYHflarji2ov4cgVeNDofPZx/3YAUCbPal7Dk1HCgarwOswN7MD+6vPn0yRrXbQBKlT
         fBhsDYd36xODHFhPe7t6tvVDp/g6gY5GWxCkHXHsJ9eMRrDoJwX1UxyjyCsHhwxXQPw4
         y5GmVH0ZO/F/2MxQD3qoWKc4+jfp8w/vF9sUrD8z3vOYPwyJ1B2WU3TbFyWIDAKnOA19
         Ul77NolyM2oVeWZPPBUFKqz4KlZYtmfggAGMn8xCe9lLw7mvZNWPdjyC9WujZgq9Jb5d
         BfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423477; x=1770028277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6AltB38+W/aWrXEYhQXQSSpZIGF1tOyOzJmfK5LASI=;
        b=BFTfAqVQzQP5gX0QUXfBL9IOALR7pw+6firr5q4T5oUT8Z2xw8oMEzTOxXjL+PZOu7
         KhmPW20/JSyCJMYVrzijyZtJ8dulF4Kpdu7NRl1ZMzu9nCbsxG/ArASvGpo5uZd+tcsP
         UTjPKdU8p0n0FBnU6gZdIsG8avykDZVJIOa+Qa6JtlG2E+jmsGfkAFwI7YP5iO7Wh3WO
         wIPUxOXrLhsIsYuKw5upkTuo58ttgb6U7rPoGxGeOD0qppJcGYaFqQyyUzo9KNVeQwZA
         waRjBkNeeo4k6ZtZjVsiwM/HjK2ZZ4Gqau5ruo/pkF86ZPqGJCf5c0k8ixxxH4exXmKi
         L1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+5x8O4Ak2j4XCFtR6ZhbmiEQfdzRy5qUsRkVVsTblQA/LnkPkieqJ+gV9+j0udzbgGHHFiRnHLOLQ3wAe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzko53Fv5pRhzNMfkoLychqT/+GpeQaWEmhkV4MyBP23mP4wuSM
	A1oX10XzB2teDSob7CtfIJQZE1uSuAwO5f/niyZ6cvM2nkgSUAndlvHruthwSEwnQcfP344bGZ/
	DE7VHMhjj6Zq6ICMc0V+XMsvNJJ/ujp4MGSCL46JhULQO7E0kRbNCgrZf+jVStTwnnQva
X-Gm-Gg: AZuq6aK3vlwCv8cifKuZGXVkNMOHEdwbGy86Sl4djwmkwVIJHXkMa5Kkz5zG+LDdO4R
	I2u1s1FJGoQGLjqCTqB8ELlr6COCsgD11N1g2V8eXkQ3VlL42/otjLmQTtMvkm8heFK4Q3EDUkz
	Q1AG5HqHYpwM+m1LZAk9R95bb57mH2EtrCAoQW8gU0xgh7Wy+zNcaMl2C0NqqcpZ7pc61W2Ihv+
	9uckdtjFhf1TrA/mkommHUzCDfMyj+Ag6uXZQBkHBrkA03a+9bla+Q3YuMykxGoUueWzHDMZruh
	Hr8IFEchJD2gqdVv1Ni9zzq7G62Vz6ocZAlGUbS9IZpWAYuA3u8gq6Rn6/bM5S8gKCEeS4gPgly
	WzBBke+CA4LXLcx7fzsUZhsTL3sUFQeJ20xUe4Ho9uBS2xFVI00qkk/LBJRYGKYHmP3s=
X-Received: by 2002:a05:620a:2588:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c6f95790c0mr358352585a.1.1769423477138;
        Mon, 26 Jan 2026 02:31:17 -0800 (PST)
X-Received: by 2002:a05:620a:2588:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c6f95790c0mr358335085a.1.1769423471971;
        Mon, 26 Jan 2026 02:31:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b6fc4c5sm621398766b.40.2026.01.26.02.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:31:11 -0800 (PST)
Message-ID: <c488e092-2319-463a-b73d-68e487cf3770@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:31:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: glymur: Add Mahua SoC support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260123-mahua_icc-v1-0-bc82cb087f1e@oss.qualcomm.com>
 <20260123-mahua_icc-v1-2-bc82cb087f1e@oss.qualcomm.com>
 <vpaz7jhnuagfl24dow3ktyhjtzktmhiiwh2rnflub3jbc3pgu2@2ydlmugmqgbt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vpaz7jhnuagfl24dow3ktyhjtzktmhiiwh2rnflub3jbc3pgu2@2ydlmugmqgbt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69774276 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aHkru73TLWHWJvrfeGIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4OSBTYWx0ZWRfX4UFa7NdwOcOg
 gpuy71Lb5Nn/JQKWZT+69vxQ5MK6aJ4izV679X6oUo619cnQoYnhZjW0XmUh9tcZ7DfYsBL7CKl
 7EdpnCnugkcbHSR6YMccnTOhUP1hKxkEBc3xKrwVO8c2Pis1qA0YLjOubYhqSf85vu9Ydp1wGRD
 W70w3WUBNIeT6x9Ty5bC9uDMr8a4QrbTUu63uCL9TEu8ZGC7YbKkZwSb54VsMRUQPCkoqAZkHbE
 eWCc7RxbFDUnpiH5ZzGIGxdFjLYMvgV8zUi9mslaJ/w5A7WVYpE4GVOkRLyC6OO1h8hZmZjzbUG
 FGfS36yjJqxfqDDcU5ifi5t5d9dWC08R+ghvdfCTByLOWsNMfdJamon7TROTkDm4WXWTizghOzX
 LFv5m7UB28fH/m9Z/Nyo70FNXscVbJbt0IGWgZK+Yb59kkFsDZbEjVKSi3LS55agLQpNrUWp4Kg
 szGP/ToARZVabVUgnRw==
X-Proofpoint-ORIG-GUID: lbSr9c61dAnJK-Tbr6DsiIEOT1mMaa3O
X-Proofpoint-GUID: lbSr9c61dAnJK-Tbr6DsiIEOT1mMaa3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90525-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B6E186F82
X-Rspamd-Action: no action

On 1/23/26 6:58 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 23, 2026 at 05:12:36PM +0000, Raviteja Laggyshetty wrote:
>> Mahua is a derivative of the Glymur SoC. This patch extends the
> 
> Documentation/process/submitting-patches.rst, look for 'This patch'.
> 
>> Glymur driver to support Mahua by:
>>
>>   1. Adding new node definitions for interconnects that differ from Glymur
>>      (Config NoC, High-Speed Coherent NoC, PCIe West ANOC/Slave NoC).
>>   2. Reusing existing Glymur definitions for identical NoCs.
>>   3. Overriding the channel and buswidth, with Mahua specific values for
>>      the differing NoCs
>>
>> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> ---
>>  drivers/interconnect/qcom/glymur.c | 153 ++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 152 insertions(+), 1 deletion(-)
>>
>> +static struct qcom_icc_node * const mahua_cnoc_cfg_nodes[] = {
> 
> As you are patching other instances, why can't we just patch out the
> PCI_3A out of these structures?
> 
>>  
>> +static int glymur_qnoc_probe(struct platform_device *pdev)
>> +{
>> +	if (device_is_compatible(&pdev->dev, "qcom,mahua-mc-virt")) {
>> +		llcc_mc.channels = 8;
>> +		ebi.channels = 8;
>> +	} else if (device_is_compatible(&pdev->dev, "qcom,mahua-hscnoc")) {
>> +		qns_llcc.channels = 8;
>> +		chm_apps.channels = 4;
>> +		qnm_pcie_west.buswidth = 32;
>> +	} else if (device_is_compatible(&pdev->dev, "qcom,mahua-pcie-west-anoc")) {
>> +		qns_pcie_west_mem_noc.buswidth = 32;
>> +	}
> 
> Right here, set the node entries to NULL.

+1

Konrad

