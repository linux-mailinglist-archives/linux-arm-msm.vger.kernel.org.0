Return-Path: <linux-arm-msm+bounces-90045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEoTKXEMcWmPcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:27:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 158AA5A82C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C06F5AEB842
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA9730C344;
	Wed, 21 Jan 2026 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4U2sjQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2HcvOWZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBA43DA33
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009486; cv=none; b=gWENRj7GxWUnrgoi/PbM4bKnuMfv4camMWjMCmjtQmuyN0YhOXE74miprDh9kKavYaGZZn2R3hEA+96JC9I4pRsF5A+xy3Qombr84tgVspJ83q3SGQYPixoVmtf8Ev5EWN2g7COm//tb9gokHNjuRgQ4HRAIPtgrHDkQJAMNy5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009486; c=relaxed/simple;
	bh=zsX27Mca8HN9B5bADNfbbpGBalcAWHy5dbS4xUpZk6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3OH0/OKzoDxrIpEP/HjBzKkYiVpw9muq43CYCiaiuJJO3d5IENMxd+CvPjvrxiON0h58XCX27neGiwQAnpLA5f4UkBprGnQ3Aa2mKOfop/jfquOfCgXtsuDnqGrTPyTGhMrwGc6JV6oOf7veoeMiXyAgYn/RuuCEgmF6pCPzog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4U2sjQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2HcvOWZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9h1Md3991357
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 15:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zsX27Mca8HN9B5bADNfbbpGBalcAWHy5dbS4xUpZk6w=; b=P4U2sjQQcdRJ3zjO
	mCaMrL0+DW/1ael+/16AELa0KpX3EPSOh/lUK2074ig18a1gIFj3pcs1VKvaS+fk
	KMdmTn4HBrmY3U+XQbkMOLTAFQeyJEx/zaAcb7AzOrb8OyA4+uggiMlJPT3rCCmc
	xnpKfgAC1GiO/U2qEO7cG6z1URsAMRKT3+UcwuI8EUvcIFYuJmfCDfZzohe68GEK
	3hMKrYYaSMB7wMDAufPfIA8kiji+4VvVdVwPeAMBnkf7Bq0KzpJrVsGz0es1HSrb
	FSNUAOPDN3C40fqwO8pcFVuVec/kiqw2e91xBtjn6ertO09waJn5mMRIlAEx+AeQ
	Sh1r+Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btpm42sm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 15:31:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f50f5ae967so232198137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 07:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769009483; x=1769614283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsX27Mca8HN9B5bADNfbbpGBalcAWHy5dbS4xUpZk6w=;
        b=Z2HcvOWZxlq0bqbF0GIaiTXrkZFle5ccsXM6HcdawV+e0JfbFU3ZfPeack8RMrYaDW
         Aaw1/FJV5NvDwetkwbdXyyISQH/eexZ8ROQT1NJAKx+WlrwupwsNgfih36vqOypBSD4Y
         afKNVD09FhVqUOQrBZwpzaIjS2sxzPnA0kpVwfnY679l1sU1t/jbKFDRk65rUakJU6Gn
         dWt5LaNeo9GT5R4h/fxIGwccb+wiM/mCtEMKd0HBRrbtbndRFRolKLwClTAF+LYsOWPv
         7YBJnRD1jsoYUADUMhLGpMj6wcyldRuttE6KanX3e3WpsCyYWqrt+cQuu9+3mZZFZVL6
         fspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009483; x=1769614283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsX27Mca8HN9B5bADNfbbpGBalcAWHy5dbS4xUpZk6w=;
        b=B11/+4FLiMjWTqlCqZ5z5gQ8T8OcRydZWKQy8T6RWS5Th82GKJjTpv08HDZRqiR4c2
         A/IbuILgUEHuJ3VLMKfp2aYFmeUuT2R/XZbTq+phdDxhmzGOfNZ59l+Grqbl+1jAS1wj
         ARzpYSVeg4Dl8sDlwQGmn4cJVePcVJ9cqVI8bVFXhSP4gE4DVMMx2bVqeqAXCcm9tQK3
         zZYRgAOQJQctT5jPx4N5KlDNb9js2BGh7cWhqFwQyIHBtnInaPQY6OfHkuGYeUdmYF+Q
         noaQTim1E84R2iOnGSVInh+I5q15lDeme8CmgNr0QjAe7YG00EZ92VUbhrNDR8MW6BTE
         G2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXMpH9Wc/PZHAzxjLeQjc6CrJA4sduEQNSYCsjigsp/WfDFw2s6IpcOTkt7R40eJ6LiDkN0LynZ5Yjt//eH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7rSFbrLyQDz35hQDwhwugcWjyg0n67swZMSmcE/epeKXBPtij
	nAv0AGd41OFf5NFvFZvVj1qa/WAuQ1a4+H3JGfqfNlvR1tLnGQMCh5CrRt5nqElH6FfUA+U70/h
	WMhT9jLlx/6etkS/SEBLbOTgDsyBk4zrI2W+7I3RDOPamsSmZ5ZsBhsNaFb3cCkv2GlnJ
X-Gm-Gg: AZuq6aJ6J6UtpNvSoYjQ+VrBm2L0vyArnPXvl5b7uB8qsyTYdTtSzZKDRdYuKSdMqoZ
	SXxHxYTWHN+TDb+MCx6AsBDQrsRcDrwzIu1RyJ4vh6MQPGGJPNZGAct2exzWgkcsEHqVIvo44Qv
	UOjFttl39m0PoeEXhS7xlEy8OyGEMlLkIfircwlsqrn8sFTi5D257Z7fNIiVHTyYfXuRpcgDtZe
	TYaBAvY9rnHGm/HrWNAAse9LKFvX8Jm9D3gX8CLPW6IRZ/qyVMnYeXWmYqtV5MWTClNr5k+U/oV
	W72itcwt+454jvXbJSyqM7gplPIqyHDwpTULgSPHToerSbwByQ4a4WG4RwYBbUmJ9mW8L/GrGdO
	6lrZYCGN8/ebMUizfgBM0bBA/F8jubYlq0YFTCy4F+q/UK9QnHVH3P8ZmHTBJIvdQ9c8=
X-Received: by 2002:a05:6102:370e:b0:5e4:9555:8984 with SMTP id ada2fe7eead31-5f1a556805bmr3562933137.6.1769009483227;
        Wed, 21 Jan 2026 07:31:23 -0800 (PST)
X-Received: by 2002:a05:6102:370e:b0:5e4:9555:8984 with SMTP id ada2fe7eead31-5f1a556805bmr3562900137.6.1769009482784;
        Wed, 21 Jan 2026 07:31:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6580eabee8dsm2085168a12.30.2026.01.21.07.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 07:31:21 -0800 (PST)
Message-ID: <a51b1fab-c630-48b8-8b58-2a906ee31424@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 16:31:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
 <20260116-xiaomi-willow-v2-2-4694feb70cdb@mainlining.org>
 <01d254f7-8c62-4061-ba7e-f358f1904ba5@oss.qualcomm.com>
 <90a74369a2c4d9453de733a46fdd0ef1@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <90a74369a2c4d9453de733a46fdd0ef1@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=6970f14c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=tG82vpoCcTU8gc5Gbs4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: pjdE9_FewZhzUgaecF3R5uOPUEG3rcm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEzMSBTYWx0ZWRfX4HTVhfIDulhf
 uD0IVyh/pISMOuVgk9dYRanNZp8L3ZrECJiVzXHg3QfH4xg5i+6fmt9Brt7gIYGTnsB6saCFYXS
 yBraO9e1DSC0O7rXwDBwQUMxWeMHJKxsguhWzgdPL6FJel8uiHucU+7Es1tP3lChpuLgme4uT+y
 rOgs2i/J5pmG3296kIFAD9ZRHrxZMuajMd1r8G5nrPe9QSwovazPdeS4D+qxEk0sbGoYveX5OOB
 55+/66+Rs4MeouamRPvijAhBvlFzVAE0IxHegpcAJkcvzrHGdiMm0dUlULqOT0108tGv7DgsueJ
 C7R8Mjy9JmfBojTEF+8f2T80QQT+jsz43M+LiKVFDSgF6MhnN4CChMuaUBlOb3wJ2S2gucXglhF
 PDmJ5L7dYBUxHe++a+ZC1g8MpsUi7IUxBg1ITzlbd2DS2RhAdTM00ot3w+INl0TJd18pa1ZBfmM
 5mcUXLhPZvWe9q9mL3Q==
X-Proofpoint-ORIG-GUID: pjdE9_FewZhzUgaecF3R5uOPUEG3rcm5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210131
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com,vger.kernel.org,lists.sr.ht,mainlining.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90045-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 158AA5A82C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 3:21 PM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-21 13:45, Konrad Dybcio wrote:
>> On 1/16/26 4:54 PM, Barnabás Czémán wrote:
>>> The device was crashing on high memory load because the reserved memory
>>> ranges was wrongly defined. Correct the ranges for avoid the crashes.
>>> Change the ramoops memory range to match with the values from the recovery
>>> to be able to get the results from the device.
>>>
>>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> Have you verified this new and improved(tm) map e.g. by booting up
>> the kernel with memtest=1 in cmdline?
> I have verified with cat /dev/zero | tail | sleep 5
> I can test with memtest=1 also

thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


