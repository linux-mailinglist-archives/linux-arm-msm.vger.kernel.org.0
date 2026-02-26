Return-Path: <linux-arm-msm+bounces-94213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePP/JafDn2nkdgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:53:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC491A0B39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64434300DCE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D403FF1;
	Thu, 26 Feb 2026 03:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSpIozLg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i38hVd+H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B083876CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772077988; cv=none; b=B/r9RvhleJoG8CEMzw7BETtem4B9Jb98OBqyuHE3iXWPqbOsNQAkWQEhUztZGZ87AWDBe5tD6LMZe4Nd9koKV9VBcEEF/V7xSTNZzfccJeCrRRghTj5b/iH7xazl6DrnscxTeDA5Ero/1sN8NWBtOeOEYvWiXos6RqtIYfatj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772077988; c=relaxed/simple;
	bh=HWKsFl4MnTZYIIfzagaQmPY9LE3X3hHNz1H5NLijfLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ps3fR0mePjvfXIfB4cC3NO6sS+i/pP8wk8fkYzJYzz7RNBz1Gf62iE9bylwDdiAh+ippoYV7wNfvp3AFMN0qkuyzJ9BFjwRzwergTVwy7pVrYhfRJIFbe+NgpPIy/IaiexuBCwNR0JPWMcFOZZgagJBOHy2DWBuDBE25/wpA8mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSpIozLg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i38hVd+H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q2kmah3005893
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eFGV6PObFQPlq8Zm7sCD2brL4Y1z+9apzS4m7uWhVws=; b=QSpIozLgEQAKF63R
	oW0IPMMSeIHMhhsNq5Kth7IOcVJ+HNrW8oWjmOre595up+4k3aAjOGGSvoxCPcIl
	/HG82mn+CIOV8Fyrg3ioxfmRTQwDrQyAPlyZJpoeHHC6D6KK0ObkoxVKcknZRJVz
	o6S2rmFzrMU4T/Y77U2kuyTA8OwgJuYZWsFhcBqf8CT1LYRujP2CigmE/tUJyiyR
	CTe7edtGSC0yGCqGkle8D1V7Ry2Z+z+FzVhLjCwZWoF3ZQnMZ6t/mZ2cR85rFtiL
	rrqS7UhwLu2vAy43Kj92+vUauJkyjYjbi518Hx/2n8UE973NA9WKu/d5pCajJgK6
	yO6dNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjdph058y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:53:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ad7e454f38so24974595ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772077985; x=1772682785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eFGV6PObFQPlq8Zm7sCD2brL4Y1z+9apzS4m7uWhVws=;
        b=i38hVd+HCvhFG0pF6tRe00zyiJYBh9IEJ+M9rAlpTxN1wnGI6udSu9WGzoC0WdLHty
         QTV2zWG3OOHQunkO5aY5RIkAtQSx2VI6xPuI5bR21kp7OfDw4SX8gx+LVwKLLCh6GTRl
         +O8vo6Tubg6yVx/uEwr0hQfNn8vX9zLFs6To/AWP3vq4UufavKlRJby+78fZWcBs6lYC
         ViPg6wBPmDtvuVslusu3gWg6wL7jKgPD1DVVI8DciZpJFWmKSa/nRc+SAkhQZbSxyO2y
         wep7PwXbO6klhdB9xG77OzTZ6naRnAJGl1EmGp5NII6ZzbGg6ZeGwqYe+HR/mlIyUkVp
         7QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772077985; x=1772682785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFGV6PObFQPlq8Zm7sCD2brL4Y1z+9apzS4m7uWhVws=;
        b=GSyjsxPJ0KOQjaJ1QyqWDbvhyV1CnTjvOysLs6fhklSgjNNxD8uXvoUcbNM/tG1sGh
         MmLA2IY1Ty6wzCIiZwOKM6j7Il2PfVfpEqPYPm9IJi1DbL+ftoOaVrBDvgZeTZjUXMSQ
         BpghyQ2v/Wkg8HCSAYQq/76APORusK5oxmi+aBNssXASvJwJ9JvA6Kt7FWb2FjAFCvzl
         vhhlzUQkK9Qwv38TMAuz2XzzIkyolHsLUXBHPHenDZbfxAyUJN2l+mRAcoJLjjkCYy9T
         zR7o5RtA0l7FpvcW/EYroX4vErig2y4kAEurjtlYH/qE/Ak4x8AykRUdNkBTDV//r9uO
         LCtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJfs+ObO042h724Bfk7vHkKW88N9IQlevCG2zCDiULjabw24PNDLvdpT3TD8eeRmSggO5DpiprJofZcP6j@vger.kernel.org
X-Gm-Message-State: AOJu0YxSUs9+RsHjibZls78F4lINbgygh15myb4XG/02GHTrspNJge2G
	fMTwDQ07VasJv1lzc7UnCmxsB/UMUdTiYS56END6ywEP9uPYyt9kVUaPXJ2RDsyQxS2nIaqGMo/
	3Z9DLymqD3N92rGvSblFaY+W+LL3X2Fv5oInbT1mXE8I0tM8xvwWJgtzT5zwfFefwjyxY
X-Gm-Gg: ATEYQzw+RfWEs7KtHC3cF6HOiuABpu56WpxkMbYgOVlC6Jbva4+oE13sWp+FkK7UovP
	1wJx9RS76w517c1pYO39KqO4LbP/36zAvb+AigvTUo9H6BPoULAOezBt8NoW3/Kwmpsll5zETno
	MJFXPdP1SGJhWejd+g585pgf2Yk4F1wOmLCC9/2r+MO5l9rA1cRu93I/CJ/2zIVnYGUDiXLVkZr
	UEbCuB1V7bjCTa4zvpz6RTfVaALcRlbun6erl2UxxnP9xVqicYOBdsKeRDjk6TMrWCcTlgm1ak+
	60RsjUE7rc7UFCTbhZlvyC0oydrFqwwuKNzBkdQN1JDMXdwV2mM16P82Of+Z1tLlPBGKL2pzWGZ
	8S04G2m1F22y4A0v1xiWxr0eiackmcRdiYEx9Q4PANi19XX6aRpXL5A==
X-Received: by 2002:a17:903:22d2:b0:2aa:d6a1:e18b with SMTP id d9443c01a7336-2ade998e04dmr30034325ad.18.1772077984868;
        Wed, 25 Feb 2026 19:53:04 -0800 (PST)
X-Received: by 2002:a17:903:22d2:b0:2aa:d6a1:e18b with SMTP id d9443c01a7336-2ade998e04dmr30034055ad.18.1772077984304;
        Wed, 25 Feb 2026 19:53:04 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6d1ba9sm8262105ad.76.2026.02.25.19.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 19:53:04 -0800 (PST)
Message-ID: <d9eda4d6-b9cf-4525-be4c-f718e17b61d8@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 09:22:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] soc: qcom: geni-se: Introduce helper APIs for
 performance control
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
 <20260206174112.4149893-8-praveen.talari@oss.qualcomm.com>
 <0b969abe-d9ce-4a87-be61-212a1b8cc8a9@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <0b969abe-d9ce-4a87-be61-212a1b8cc8a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TQ1aKB9eOTBhiy0nfoNJhnv07VIj47or
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAzMCBTYWx0ZWRfX4YW+IeG0eOEh
 KViOhuw87pzkhiUqFwJ8MI1U5RDmIstv5vsEXTKVNdKJmZ/lIDiXKYmUAA4L1/BMWQXn6EC0L8i
 oX2XqYtTdpmmvs9wE5HPo4aGPnfABuppsM5JAKMb/vWEH3antwZsKtLMbyNyLi4IoJgRRfURbw5
 r2DHI6nFwPTgwYLxwR//5D+QW0nKdCzKMrCGpw2NiCa0gd09f+MkjBeVFIOnKXsxPRy2oYAABCG
 FyQ9ZZ4a5ENF9aTyaUMOB2jHRN6yEGSBDaZckCiTjNkizJJNugR4K8Sb9zMKWWq2+XephLfHiil
 xNxjlQnt+YFOOM38vBH4LQOu84yFIaD2Zi5/LqnYWcs2XbZFIZSwZGO1LM/kYKg6DG9B/pm+bs8
 qSD1P0AXCr7EJSj0VEURxe7d1hyIrAP1TtsHC+/6sOSlVyFQT3pTV/ASC8Acp0/sQmNuv9fW3uP
 /AQf8S0/M612YyxPbGQ==
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=699fc3a1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=anB5c4ZMOrDm_4fku6gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: TQ1aKB9eOTBhiy0nfoNJhnv07VIj47or
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260030
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-94213-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3AC491A0B39
X-Rspamd-Action: no action

Hi Konrad,

On 2/25/2026 7:58 PM, Konrad Dybcio wrote:
> On 2/6/26 6:41 PM, Praveen Talari wrote:
>> The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
>> manage performance levels and operating points directly. This resulting
>> in code duplication across drivers. such as configuring a specific level
>> or find and apply an OPP based on a clock frequency.
>>
>> Introduce two new helper APIs, geni_se_set_perf_level() and
>> geni_se_set_perf_opp(), addresses this issue by providing a streamlined
>> method for the GENI Serial Engine (SE) drivers to find and set the OPP
>> based on the desired performance level, thereby eliminating redundancy.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/**
>> + * geni_se_set_perf_level() - Set performance level for GENI SE.
>> + * @se: Pointer to the struct geni_se instance.
>> + * @level: The desired performance level.
>> + *
>> + * Sets the performance level by directly calling dev_pm_opp_set_level
>> + * on the performance device associated with the SE.
>> + *
>> + * Return: 0 on success, or a negative error code on failure.
>> + */
>> +int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
>> +{
>> +	return dev_pm_opp_set_level(se->pd_list->pd_devs[DOMAIN_IDX_PERF], level);
>> +}
> 
> My only remaining concern with this patch is this export - on v3 you
> mentioned that it'd be used in the UART driver (which currently does
> more or less the same thing, open-coded) - are we unable to leverage
> dev_pm_opp_set_rate there too? i.e. are the OPP tables produced by the
> SCMI servers not populating the rate field for UART specifically?

Yes, it is populated, and we directly pass the baud rate value as the 
performance level. Therefore, there is no need to convert it to a 
frequency. Since we already have the performance level value, we do not 
use dev_pm_opp_set_rate.

The rate_hz (frequency) value is equal to level × 1000.

Thanks,
Praveen Talari

> 
> Konrad


