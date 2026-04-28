Return-Path: <linux-arm-msm+bounces-104944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDxaNEqJ8GloUgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:17:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EA348270D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27CD6312968A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11883D75C2;
	Tue, 28 Apr 2026 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tq1QeJja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpLQbo16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324263D5252
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369151; cv=none; b=fg9vFinBjWJuDtWIBu0Xt8qDdI+RvtL4BG6Ukd3G5s/FJvkv83XFKm1fsQ1OGGudQvKuQnLE1VZNgixW7mFTqOZmWosVz/2Dj0K5xqyqZB3Ca9LXW51ndd/ZLOUC0TjAob7lkZw9IktH4fymk222Bi+ZrNseGRyZIqXnLKTk6ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369151; c=relaxed/simple;
	bh=NYZZRu9Vmp57UxGErdMBcdJZAKKcxfcjb13kgumPZAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h61kQ5HHXkaMpWkrNq2qu7wMLLEqq7GslaqonMBXGKPXKWqESmrqH8T0SV6BXDRo+HIhfjrMWUqnEIz2jKXE7yBRES8o1qMPv4MLY62ErtuNTt8ugTc2WWWwd6J2MGUNiQp6LitmuqaqbFtnFzzjq7mOBgsUKzSP0S7keHEDhL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tq1QeJja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpLQbo16; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7wCvl1746795
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXoJY4FuJSbe8J5EY9XQhH3+vH7oWu4r6aoUqSiDQTA=; b=Tq1QeJjamUCx6Xat
	Fp+tdEAukEt4cXbO+91oRqPYUeoq6+Ye9eSQTh9dTo4PAXPSqZEIizlXLMdEYw0l
	hucCk1hEIAewhslcRHmFVOsShBnbXvkUTFp5sxt5GIRSar0cVapdqBE9ZeJjuA1e
	YIXLwM3zLNvgYNTLePP0SyN0PyNEEhGLOLPEzNpd/y+MAs8hvYFGu0be9h619HRe
	IWcyoOx14VGQ+OMuTxMgcJi4o6HZePKdM7gU4Jjp2djBpqZ+7Mb5FbiVpAZebsT2
	7mtRI/sqi71qNY/aDSX/bvjRnwAh2V9YdzxDbS+C4Nnvkx6NNmbIu1S+sP9lqPSl
	OQUKpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd8d3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:39:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e576143baso23415331cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777369148; x=1777973948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXoJY4FuJSbe8J5EY9XQhH3+vH7oWu4r6aoUqSiDQTA=;
        b=fpLQbo16XwSN5pyjLto6aF20oolVxgXbh9ANGmNh2CGwX4aMpK96lIRHXowNTy4xKb
         8INQslpvVWwU5TsRqFu3FnKLU52r+npYMq4yJGEJOIMxsHXNXJRlG3dbwMAiYcUgEv+3
         fwbe02ZnGK3EsokdI7tjTML2c7iAVsYubudJ6TvT1DGcH8t6f2e1eNTu+cJcGfZiXaXH
         cDV3ks6iWpcXaJL6klAdcZ18pJ88mg5NnLW2buth5IJr2uwN7F1Ab6R7uL8hWIoH/+a5
         TY+hG5qwrBhhvgJTIbN4tnwU4J84W+UiZStDovF+oFB1n9s7SzxldosLtS/zHcZ5NOdk
         rSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369148; x=1777973948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXoJY4FuJSbe8J5EY9XQhH3+vH7oWu4r6aoUqSiDQTA=;
        b=Mylezk9U9HfKRdqwPdonyVhF0oNi9MzeD1qF5DY7M7E/Z6nWQH9/6R6h3Ac6AdnskT
         7aO+R+VZ+xBABwE5rUmh0HOQ+4tjvnK1tknQOGT3YKlqy6/6xqhq+XmMTzdquRqh0x+n
         HkwGZ478WHhRDr9CVlWqSwbBvy5CD1PRGpgVaL6aW8SDwSc4UaMOEaIonsj5GWOvWUSl
         oAXX09OXiINJgFS9S4Kg4SWa9FqFKyCDgyRfbk7FmEmGOMRX3i2FRFLeXEb2o1puccRx
         TH5xHi6NlNzXMm1oYX1yb8Tddx2SlMQnb90MUjbDpF7kEjdSWrhYucYS4FcpBVymE23+
         Y5kw==
X-Gm-Message-State: AOJu0YyyoObXbxdrhtel2ocNDiJvfV8n9GJKzF127Rv5ZJk+/Kat4VyE
	xMGs09r3Y8jykpwnrCUcVbZiqlSLsvCNEqpG4mxMMBm8CO6RA+ek3h8q9WP9ZXhzRItiQ9fmtX7
	rYWyeP9kqszHfw6mBgCzd+NeGAc/hJLAOnrNDbnz+QufLxGPZphxMzWjf+AlgKUjrpeuW
X-Gm-Gg: AeBDieu3jbtKuvpYoQFF7a7B5plTAIn8uHZi9Vz/pV0XdfA5lMISKGmYnzEHnO9/wE9
	ZcXrhcSv2eYwbChijIu68UYCx8UvnpsES3fvwWh8pp60GJeyeIYy+yMl/s5DjR7c2t/1qSQye01
	7ysFm4XCx0r556QNpgoEXMq2k9F6sBBlxVFodyuqGlWUTgtXivmJf+7ViC/fU5xLh76Zi9lswsU
	6PXZ4xBOHXWvR0L8/4yzz0kqtfAuev0zUFOj9Ir/xYEl1PnXq8i+/ASUPcvTx8+aPUzQ+yMo4wG
	WPdqLhnY+4RzKm1kENEYZCcIey2cK6C/LEzGhXHmK72k/Oa6X2yf6M+QGDRm3mzeAubZrViSpQl
	PEGjbTKqL05dpEYtU7my8IXdK1+c1P3vcmgRLYPD20gofJ7lTGN2o5sSR7aKW94nDv061+psXZW
	Gs5chHNNC+R8oviQ==
X-Received: by 2002:a05:620a:2844:b0:8f1:d4de:57aa with SMTP id af79cd13be357-8f7b28fd1aemr253469185a.1.1777369148322;
        Tue, 28 Apr 2026 02:39:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2844:b0:8f1:d4de:57aa with SMTP id af79cd13be357-8f7b28fd1aemr253467185a.1.1777369147830;
        Tue, 28 Apr 2026 02:39:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67ccc30sm534549a12.1.2026.04.28.02.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:39:07 -0700 (PDT)
Message-ID: <e0736f90-4fd3-4d92-a19d-9f2c2ca363fd@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:39:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Shikra IoT
 variants
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
 <20260428-shikra-socid-v1-1-6ff16bad5ea2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-shikra-socid-v1-1-6ff16bad5ea2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cC1GN2ePH-DB4EUcsqGMptNKxk4iFZiO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4NCBTYWx0ZWRfX+Yrk3xsRIjfy
 L+HHxH9fd0Hj7nXuiZ6v8+I2D3rbWHd6t+1KXdUlsayAn197AJMsEqGY1HPaDTtdprdOUsQ9vsA
 hHeE9T/iM4DJqRtrm6QlDWCkm/F20arAKgFfQuoKA0xkvGp6GWiyOxQ4PchSP0zD9WGCrbKtLud
 UIVdYANsXr+WvGIiarpO6jH6I3Q6N7OfTWejRPuaT948Pb07cpYeaVXf49IyPaazQVSs3hkw5sg
 SaRfIhPENrwzxZXi/CLhmHuqx9U/RkpH5QArTAZFLjaa9d4I0gAWNOSRN5NbiZJ5jCxWzstR7Gn
 9JDHtU1ymOde3teqTgO7XSPyEWpcalEiFMww1YJKMtNZmnGoZPxNLuL+xYwaLN6g9R9RwVbOQHE
 YHEl4GhuBrObSdPRNP4pLcrM8WtDL/UFQncxhmg8lxl4f5Ftuy535Y+uvx3FeprfIHhvg6XDzdn
 Sur947ZFCWUhaURmTIQ==
X-Proofpoint-ORIG-GUID: cC1GN2ePH-DB4EUcsqGMptNKxk4iFZiO
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f0803d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nWrQU3d5iJvTSWghx0cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280084
X-Rspamd-Queue-Id: 29EA348270D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104944-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/28/26 11:17 AM, Komal Bajaj wrote:
> Document the IDs used by Shikra SoC IoT variants:
> - CQ2390M: Shikra Retail with modem
> - CQ2390S: Shikra Retail without modem
> - IQ2390S: Shikra Industrial without modem
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


