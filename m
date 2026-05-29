Return-Path: <linux-arm-msm+bounces-110240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJCIJmhbGWoLvwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:24:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B95FFE35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC5343022E3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB733BD638;
	Fri, 29 May 2026 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMlQkBu4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9gw2Y04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F224C3BF67E
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046692; cv=none; b=DT9GA8ACUulX8lBIL02/z8qi7bCTbt6/QtZK9rcggYdzhBRhB+cfXoUPQqLnYP92/n0n457756o7QwhWJIAEisZyJcX2raIa9LaILOOJbb7Cxy1MWI76lNtWi3CbQrjXLr15/++pgSYzz+F2R/F3TD5wOmxeDiw6Yh4+UukiJwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046692; c=relaxed/simple;
	bh=o4sUJ27v7ooORme6fNzh5GE20SY6LLW/dSjlsVpGr/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imvb6ABz8Nz/UYCzhyLCVSl8fAbHaztmn5zrBe3MzMxXt0u6p2PMUgyw8spTEBf6wesVCy2A69bVlyQn46Hg4PNuXaw2oPK2kwbMqFwQ7tQ7n8Ev6IfHAkKxPmeX9x9HddNOSKWZkDBk8hJDW6IYEKGeYoc1IiVCFAR8c/AT+DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMlQkBu4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9gw2Y04; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7pDrQ1495413
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVKptdVMaslRjADnb9LxrFMeUYcIm3eFjbr7EQiByDY=; b=MMlQkBu47y7y8i4d
	P0U0AgCGNXa5btwDSf7xcZbwiCvFVzGSiU33BXJ3sa1xYJ+nXXdR4hA2EMNaWnbO
	NZISikq+ARksdmF/YGs1FwGbRygVn8fr/mCBvrZeaXuG3GIRJmD9yMy8qbNf220q
	KIlbhm+C5eGeAiTG56Ql0kuu2/cS9yOS8B6OYS/DAYYGd8UHCk+xpWsmnbrw+rA/
	fI76xP1kMAqW2iWud1NE1JbuudQ+oWKTGQhlxiIQEOC6lFI1u5+UAayoKOdxyRZc
	45x09hgMC45GqbFcG/0Gu2cpnqANuWmDG4tFeoQuuu0pxW8F+tiDFGPbckZ+bya+
	atMFEw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef0159w5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:24:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso26054271a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046688; x=1780651488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVKptdVMaslRjADnb9LxrFMeUYcIm3eFjbr7EQiByDY=;
        b=Z9gw2Y04Ot+D8E46bX15NeHZK58vvR7YqUuH10Cbr+UdK791kClQE1/zHUB1CLy27T
         pGm19VWplMrlN/dCnOIdXKaQWGOZY3KOlPTCpo+MejVHmmcoW8tJ3W0v6Djg8dQr2MIL
         FAlJfqRGtGAHkcfSeJsmgmIKUcFmKMgldbTx+Di6hs73cJLB5MBbtYYGRaJu637S53TY
         rcuj3vHI/ixEW/MAzTiKZVuSu3FrJ95RVmGWYugsESiv+X7+zkzH7nNAMErGMRNaefez
         HjymWt33qSv1ddyHoO5fRhVxiwRe1GqPUyMHiL1+9V8UxeXeeyoOBsExIVYFrlVKjCDy
         hXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046688; x=1780651488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVKptdVMaslRjADnb9LxrFMeUYcIm3eFjbr7EQiByDY=;
        b=gWZCrgQ5fT13KZjhpFZcOOwZ34/QJiSJ4Fbto89dKVVhxoH0YUxvYokiy89GCfo5T7
         IjEwDXd7yWbZFSa7wc2ccIWN5Hz+a15Z4AZeMoRvmh/sQvl1sN3JWy5voWHN3ybg2flM
         w8VxFwyXbm3wd5pFgVm7bwjQt4Gfdy7bvcqCxf9nyT5zqPSWDNTWcqH72LcNXZEH/apD
         Add7GTyf0ixSs93vxLF37pOiNJ/F0/1Br00ArLEITi9SovtDjrClWLeb22ijhApHbGWx
         H+pUGW9uzfGY0GNStMhNn93+VXxN+zHZ0FQx/8frol2JLTWFppuQwyQ51lqbTDAur0a+
         1l8w==
X-Forwarded-Encrypted: i=1; AFNElJ8WMgLhGNPMQvtX3Uenwl5MDlZqV5K+DQoCIE5laI1B/5BodKuqaGO2XgOgbH4qgI26kF4fUhUYtI/5PtlJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzFQ9deLgqkqyZnXc6/45HQOEs1vMosXW7r0O5Y4cUfnU0u/6QX
	lNNf41Z7r5VkCpMiOTaVMlCv1cGb2iJsbwc7H+NXrxF2TSPW05G5H05u6o+HodaCTlEPejSB4Tt
	NdhmFl2eie4M+vrMHKQt6uu1x8pc677tavIxKtF20KWRBiuFgsj+zcOY/ziTi5IRMON/B
X-Gm-Gg: Acq92OEjjz9rPDmOXAk/uEoTkRUkFNv4MJmFt4TXqqeYUmwVP5Kwy3jpdN/4dfglpcT
	QxbuzhBSDdjUN5u/kc3Otw6+PVC+4fmhZdmTESxpNS38UWdAizvUQURxDgZ1CAVZM5AdalvvhB2
	qPeO5ZisWyNn4XNWam5vKAl+wj0pSPc1XntjWECEhGPN0p6km6kOWwIhS2fCRGaBznk24K5H8RV
	+1MnGDdYX5CVlPnEfdpkWuaaD/PrvkugwgBwOKiLOYKJXzAcbWC/JaXoxme232Sf1F9L0OR0Nk1
	MnurfSx5f7jyIPWxX3Ihh7FlRq5MQ2r7cCP19uM3Irda7WzsBhwHlHySZYJFHKjaEdrZN7J8Qm+
	xm/lDYgvQVgeef66k4M5hvpiRP/SNXdtAv6ezqhYckudn7TWmSWMlMaRBiCfnlw==
X-Received: by 2002:a17:90b:2f07:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-36bbcac99femr2572479a91.3.1780046688474;
        Fri, 29 May 2026 02:24:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2f07:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-36bbcac99femr2572446a91.3.1780046687963;
        Fri, 29 May 2026 02:24:47 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0ae339csm1468021a91.12.2026.05.29.02.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:24:47 -0700 (PDT)
Message-ID: <95c74b63-2155-4118-9c99-da483ade3203@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:54:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-5-953f246a0fbb@oss.qualcomm.com>
 <mnbrfojxfu7acedzvaxv3wpkcv6u4fhfoc5lh7xv24spm7juvo@srxwa6rnpje2>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <mnbrfojxfu7acedzvaxv3wpkcv6u4fhfoc5lh7xv24spm7juvo@srxwa6rnpje2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mACWrrt7ZCWBi9LctPXsdAIZ8ClrcKCE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfX+yH5BD7Vll24
 e7CFnpslnCRfTEoL9FJ/AN50MgtljNDCWj/kgjgR7kfBOWd9iQBpnDOs9O7Dn/h3MgWxQ0nEKV/
 wGH1/cwO4Bwb4SNavow9dbrLwMOFwgQTvd1CCL6uvRUNphDsfiVAmLusXSZfjs4nxrfZx4QbxGM
 OBcUnEnJB+qMZdM6P6X/axQYpkX+51MEXZpNsY3xAowiiOYvHtRHzvQW1DsY5IP9O7HC8e88o4Z
 cqcgTR8BIPJkKPsf8PIyOuQKKC4NjW06Vk7ZjHmGVFPnIDE2jnN1ZY9hY7pxtfXzkNEs12O0Zd9
 V1O4n8Vy9dHosli/Ge9AIhh/OaQyvxbniDn98KpdXT0KDDHbC/1K4kR+wU9/Er0OQ/E2stq93Fc
 HnShez6Wbo8RxnttAok/QHnhs3c6sca676Gmc6p61pwsA6tanW4VaglD+7RmwZpUinIdf5d33Zu
 RH/AXgwiq2YZO3vMLXw==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a195b61 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ub0LQIPdQfE24AbRluEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: mACWrrt7ZCWBi9LctPXsdAIZ8ClrcKCE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110240-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E6B95FFE35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 28-05-2026 07:16 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:06PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
>> hardware block, with minor differences. Drop modelling of critical
>> clocks and keep them enabled at probe time, update the QCM2290 GPUCC
>> driver to align with the latest common qcom_cc_probe() model. Update the
>> GDSC *_wait_val and flags which are applicable for both QCM2290 and Shikra.
> 
> There are a lot of separate, unrelated changes. Split your patches (not
> only this one) following the 'atomic logical changes' approach.
> 

Sure, will split the patches in next series.

Thanks,
Imran

>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gpucc-qcm2290.c | 174 +++++++++++++++++----------------------
>>   1 file changed, 74 insertions(+), 100 deletions(-)
>>


