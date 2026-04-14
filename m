Return-Path: <linux-arm-msm+bounces-103120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN8UKuMl3mmMoAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:32:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D4A3F9629
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41975303D573
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76A73DB645;
	Tue, 14 Apr 2026 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHkQPZCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/lQz/kZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F63D9DA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166196; cv=none; b=WlwavErpZYD7Up18GwnZdD5ShaTXwLooCqJ2sSTRhp7vx87aBuN+Irp8MCq4NjnZgmDpUhuDSWesNg7AuL4e6j35ox8rDRsNfCdAkvqnNfaX+p0jvz1wiX4J4bkeDQYyJ45z9UJhatrLfQo7fMQd/h7vVEypI1ueEafJpkuIVVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166196; c=relaxed/simple;
	bh=2IXKWrkYyeRb+s9HVtPXBjviMqj5Tdo1Egu9bREL+u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tw3/z0boC6hy8njHKixS/i2hwhZ6tvLcFd7wCqGr2UOnq6tjiicns+vG0OvyIYMX7NEh7fZPy0e3oBGPlGwzsflr1+QcZ/mCPTXHVivbWPp1bVKDIXTmg1KcL+Pqmg/dsxI6yJMZmN1UGyXrDj7L5PcJyx0URQ+PgjnJv3a5Bpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHkQPZCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/lQz/kZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EB911S3424963
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBqaK0JNjPjAUSVizOw4HOKXhA14WjZ3HGAdeAIv7aY=; b=cHkQPZCDaE8Gn/hk
	kZadwKjb36ZUVebhBimJp70auKUpWxS0O3Y22wJmyGHyYUxUBM+XW2BMz5+pgB/+
	6xU2dKmh0AA9FYzN3licgZjldBRfCgo64XxWk1X1jWBCyQhCAZqr74mqSozhGy+D
	Xrh9TOEdcIzOYCByK/3j6EHwDT8iv1t+ZIb+16PreU+PKS9zyLATW9FdHI5U5wwz
	pP5ikmS6k3W/emn0XWbYoEMeZyPaX8Ac0vZEVPK6Zj5NqLz7k2BWeFbfMb+MDvic
	2h16gfqdzPrtXYR2sSp4kedUqj0kyIJuomu8VR1Qzhfy4UhuwlFtuAqHhX/DsvR7
	xUxUCg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fagec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:29:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so15371165ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166194; x=1776770994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OBqaK0JNjPjAUSVizOw4HOKXhA14WjZ3HGAdeAIv7aY=;
        b=N/lQz/kZk65aIqxMi/URvpJnGj7pNYT8AGMlQKkDi/CxAT8BbpHRthNWIBjlEGpPXj
         MMlMeBMZA+lx7qFHS+nPP3ljZOcxzHDx2p/Ea1jPOtwr+2bzRXBY0akYMM6oObIek0Dd
         Ppq257cNaJnZv0aw5Dfkq+tgmYCYZgcWVg+6X9LONf+GNZmHKEkifEOo+u/Fh0r4sORs
         gA9GifAwSB/R9jNnvXB0kYLtZcQj4WjWwzH1K4GST8F3ADEeN9MD9jwTcLj4NJ8/BStJ
         0fFRcAdCTxkiES1G9w273ENdz/18LfBg6+ewXalJVaovu7d0g4PzmCrBd2mIjWqvnAz7
         f/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166194; x=1776770994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBqaK0JNjPjAUSVizOw4HOKXhA14WjZ3HGAdeAIv7aY=;
        b=Yt5dS6PPyLk3rDCaIIfGX8AnyCe7Me72FirImJcnfxac90NkwGoSXCmu0SoU3zahsE
         NghYqOWPMI2gMR2pBiVAwLLWdTFTTQhOeDv1HL0aoXaVPiwLbB32wgBQ3NptyVKYA7FT
         kHUnIp0svaKVoN6MBDB2S45IBNpK43+4kEhkMsb3lZNagOaCx8NXP6jXZSX+c5tI5+ao
         18/cIAXLvD3PJygRLoiqx9+inYXaC/Y+Fotgn4LxGFVKhsFScE0kVA4Z8aQdBjJyRXUm
         HJ2djwPDsqTWCLRdKANmyj3vOtsRHN0Pql59PefJ4MtRkXPdNTxoJDkw1T/wBbeGC/Zw
         ZDlg==
X-Gm-Message-State: AOJu0Yz1jMaNYZZnx91VHTA/eoOc4TiNQw30vGOTKZXYrCLgti/tuTH2
	2ZvoE3cOOEc/wMC3F+OcnzRSYYk9HPuK9gTH5gXd9jluDT8rrX7KNlG7yTCPHmg/td/NdZr8Ous
	vTuAKMckGBEzTNSmFRQNLWFDwrZtc71hz3BTMEA01pC8SnFqzwnmAoDVVfKYr7YO3cetY
X-Gm-Gg: AeBDieuJC3gPBwQFloHggvKGP1s2kxfFrIF1EGQ5UTmS5MTR8U67obIPRkJsHZ1cTkH
	u6muXG1L0nLyKn16dg6G3Sm4h5djvK4DqKsOa6jq41m8nwDFTBECEdwPNd6989ZSTDO+E6p07Ns
	uJWA09ssnwPxJ4C7ZUCko5SeiZiIq9G3S6p66TCWAivHbTa2rlVzbebLlNyefUEho2a8KgJo/GH
	TG9kqFaZ/tone2r46srnoHzIVoSITuIoDy6KRcu6nKVDCrR3tgJbXTUOIrfYCwiEz3hbCQ5EVzV
	sieYiGO75/RqNvz6TWjSoPZ/8xkeUFNo+4l7yNHdcMZ8RiWl6hpXKhCpDzphbOaDB1/YtFvfo7W
	H3W/RQDl1Q4+96RL3nqhP/bAo97JZS8ctinz14bIMuJetKRvWLcA3kSjvxzTV1DSgxoLTuJTPWZ
	rtfCSG0bwy0w==
X-Received: by 2002:a17:903:1aad:b0:2b0:571f:6f09 with SMTP id d9443c01a7336-2b2d5aaadeamr183190145ad.44.1776166194171;
        Tue, 14 Apr 2026 04:29:54 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2b0:571f:6f09 with SMTP id d9443c01a7336-2b2d5aaadeamr183189895ad.44.1776166193694;
        Tue, 14 Apr 2026 04:29:53 -0700 (PDT)
Received: from [10.133.33.11] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45f192203sm60466495ad.23.2026.04.14.04.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 04:29:53 -0700 (PDT)
Message-ID: <efc7038c-c944-4c41-b80e-17d37ff1597a@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:29:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8750: Add label properties to
 CoreSight devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-6-d71a6759dbc2@oss.qualcomm.com>
 <6187fa72-d14c-40a1-bc03-ba43860d0e27@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <6187fa72-d14c-40a1-bc03-ba43860d0e27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfXyLXqd6lZIyLu
 xQQcSWUWtG3Fy3sjwALesnvP6IUbwrGb8itXeTDeVkzd36xIjI+7PspixeXNjtYk0NjlpAvW4tg
 X7rPZ9BlopjETVGg49SlnH+kd0SXAYa0icc1EvkhsEcOD3cyGOnuBH6tPxfw+dSGTmhHqJXCBZE
 o3OjSbYN60OzhtrnXYlJr30rB6XgJ6YeDuzjzB5xwa9JR3LphmSowefxBeI+YUSnM84sVgYISbV
 9lE5ZQxP0tfVRA3Be/F8/5O0/ncb3K0L7L/jpVqZnddO+mRq8lOqZ+R5Ls0WwQ7dIk9KnliABMF
 ePIlmhusNzh/mUobxYm9FHRnMOI5R9JXi6Sja3gMVv26iMYirpH+A/WQW4YOKbuPaa1AMfQFHrF
 ojvMMA6uvnFvrI1/cfrplOn6/BThK86fYVICweCY9IFuPTAkywadI7Hz8PrBieP6lIJfo711WXu
 6svCjlMXeFuAKV6RfGw==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de2532 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7ipe1zbxdwhyCGfuPS0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: RB6Py7YMJ63PQEri6SAIsND3rMqw0gQB
X-Proofpoint-ORIG-GUID: RB6Py7YMJ63PQEri6SAIsND3rMqw0gQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140106
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103120-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 21D4A3F9629
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 6:19 PM, Konrad Dybcio wrote:
> On 4/10/26 5:08 AM, Jie Gan wrote:
>> Add label properties to TPDM and CTI nodes in the sm8750 device tree to
>> provide human-readable identifiers for each CoreSight device. These
>> labels allow userspace tools and the CoreSight framework to identify
>> devices by name rather than by base address.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>   	tpdm-cdsp-llm {
>>   		compatible = "qcom,coresight-static-tpdm";
>> +			label = "tpdm_cdsp_llm";
>>   		qcom,cmb-element-bits = <32>;
>>   
>>   		out-ports {
>> @@ -6814,6 +6839,7 @@ tpdm_cdsp_llm_out: endpoint {
>>   
>>   	tpdm-cdsp-llm2 {
>>   		compatible = "qcom,coresight-static-tpdm";
>> +			label = "tpdm_cdsp_llm2";
>>   		qcom,cmb-element-bits = <32>;
>>   
>>   		out-ports {
>> @@ -6827,6 +6853,7 @@ tpdm_cdsp_llm2_out: endpoint {
>>   
>>   	tpdm-modem1 {
>>   		compatible = "qcom,coresight-static-tpdm";
>> +			label = "tpdm_modem_1";
> 
> Please fix the extra \t

noted.

Thanks,
Jie

> 
> Konrad


