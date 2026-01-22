Return-Path: <linux-arm-msm+bounces-90260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPp7CTl+cmmklQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:44:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DD6D2BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE17F302BDF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE25389E0F;
	Thu, 22 Jan 2026 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzR/a2Th";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtBkKMBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD573392B8B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 19:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769111014; cv=none; b=KFGA0AzgRXux1PB2SXCEX2y6483Cixu/3KBzkT4d2awjeh/HUI6bmtvx4WcFR8Fpw8IxmNwDhMqEV4h+HxCjmsmFZVwZdA5xlKbbDpV6HOjjfkQYipBb2NP34erwaL6Xg3kV8f3n5UhXMpL0+BIVldkJYPXsgPKkGP3KUCMfjuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769111014; c=relaxed/simple;
	bh=5WWVGM+JfPXRUfkCaxGMA8sshzQiLftp3qEukNNwWwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h3idErfAfPAN/+WrPESk3JDGNf3UmVlmia5w4X7A/jEHdAciw8X722lhLbOgN4D/y3F5tTX4VKBpWf4PkjztZGVY/v5LiOyx4pras7hgb3gRTPfbgBSKV+bkVIBpywOxk1Xe2H1LhKSdCgq0T6wFtZFM7EGdDOmlNxnvTEUQT1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzR/a2Th; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtBkKMBl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MFVBvW4057918
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 19:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKVTACrrODqnRD/iKH+1UNXgSL8l5zryD5VIb3rk1lM=; b=ZzR/a2TheSqkRVE5
	39tQxuwqRj8RFe8pjwTpqWDpYqDZqAUqD++1kliVOT4/60Kt04LoGxo5Ge/xIaDd
	KJQHlQ3rJfsUG5jgveKydR158x6kLpSUAYvO8H0T1ny14nXOYTFIetnLyNGebdnF
	iDl38WkHkJv8SpP7vlXk46u4klJzLJ8d88NY4O/ng32AbHMDxWScISBEapa5gt0C
	89wmNJlQb022TVAv2oAYWIX7Aq///mVpNCl0pdj7iWWYCs8/CZWe8HOT9aiHoWk2
	YYJ2j96sZbY4rSXVTPfiAbt10Rsss8hkU+46b7Tb63XFHvD5Af0LqkGRc2b5Tbwv
	AGm/2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbutb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 19:43:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c532029e50so39516085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769111000; x=1769715800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKVTACrrODqnRD/iKH+1UNXgSL8l5zryD5VIb3rk1lM=;
        b=WtBkKMBlM2qnEVohgPlpXf2SNVcApWE7uFZTXig10FoDXJr7mx3f0wX6gEjrGqfVMj
         nB3wSJcv51NxOZpVbBcBMnKgSNWtRwJITFTSWxYfX/2EtvJL5k49Dn4KarLs7cTfyUrJ
         QbA7QATnzbgDpbasJ2spLV0TexWJtVrd+/OcLhfavWCtSMBZQjwIfoEdzMZSA5grmVod
         ouJKGgR3MvElBG0SuBJo78pjc4595sSjplo6xsXAZJUcRu5s2WWxqkRJ+/8nPhVKaabc
         wy/nituV5hwu2l//48D8xq7muCeIXN9/WMAIa6OJopB5erYlS/RjW1lwzN6dQoMCwNpw
         TKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769111000; x=1769715800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKVTACrrODqnRD/iKH+1UNXgSL8l5zryD5VIb3rk1lM=;
        b=RujLqSHL7QhMyHoqXK1h3gibWiede0D70cPGOstcFCVL70olUdciwCXqzWNyxI1tPk
         EZYmh/ipz8d+VIXJssgKGvPCpYodV95BVonvvIqHNyHH4YkUOEmzUQg1AL3JsDR/xYlL
         pbwEdgLRLbJBIeh8M+S4/oeFW5YCYPSNCkLyXXN/pIlcc8tDNzJ6Ei74/e6gAJ7ZeRdx
         /0nsP6wNLIMtt/0SObtusgiDrd6/1N+mEGVtRgi69B3RxfLEfS2j+yQ3ByhrTqDEdT4t
         1EDUEYtzTqxPJ8NasddMmFPQhhF8cQo2FA9ELaC5rnwuMa1rMFDTBmWK8Dh2cMomTFvw
         Pdzg==
X-Gm-Message-State: AOJu0YzlgNurL1+eg5MmaU5H8Xj8+5xxdi/FAPgeAngWOVNn5ZNav77z
	ixlinsHChD3Xx6VmOFH+hsgFKehXnRSB/eGnreFYlX4kUDZyi5gJKuPsdsxKTDWutU/6UF3dN+I
	Y/x1n4Lr9cnc5zqDKxDt3BQD70eeasTpad5VQMAF4ek56geRFxNZemvLdtl/f6w/rhCwc
X-Gm-Gg: AZuq6aKWmgklgdjB9xTACj1jsoMO4va1RusBATmAUKNEepS8OFoSq2nreapwOLEuCXW
	ZNxThMI3woNTf1RtXZDDYvuLSZBvnGz4Bj0DUCXcuY/C7gn105RuHiiBo2w8ldomlS9Gk3Bocar
	Z7snnKYubkT5r0Dffjuo20DKMF/Q6KPs1afYzg+1TJX6bDc1AIvOwszh8tqIhooPk1cXnPIJsjs
	9MhFZA07JzcXpQv1tC2z9pu+V3Pk5tQHN3cGuWRO+rS1jyqJ8MOn6svt+D7yYBmrN842uRXxSLS
	6m9ETCha0DtmosBUsfHqhIZ5Eo+pHLGmQcdkNSFMHBc/qGgUZ4wYIBBaFDB3FSQk3yIh0iDbxwE
	xa1VuXMw2rJ4iRr3r1B5tlKvf94P5Nt2YbsgRxdCHi4U8gYbM1jqRmgksn01pLNJXemk=
X-Received: by 2002:a05:620a:1786:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6e2e31c38mr62989785a.6.1769110997530;
        Thu, 22 Jan 2026 11:43:17 -0800 (PST)
X-Received: by 2002:a05:620a:1786:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6e2e31c38mr62986385a.6.1769110996999;
        Thu, 22 Jan 2026 11:43:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b75d669sm9891966b.51.2026.01.22.11.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:43:16 -0800 (PST)
Message-ID: <9f87312b-7468-4184-83f1-1fe1fc351db5@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 20:43:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] interconnect: qcom: smd-rpm: drop duplicated
 QCOM_RPM_SMD_KEY_RATE define
To: Gabor Juhos <j4g8y7@gmail.com>, Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260122-icc-qcom-dupe-defines-v1-0-eea876c2d98f@gmail.com>
 <20260122-icc-qcom-dupe-defines-v1-1-eea876c2d98f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122-icc-qcom-dupe-defines-v1-1-eea876c2d98f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S0LNPslyCTyeqEuqT0LzFFUEabvD47HK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE1MSBTYWx0ZWRfXwopGuuCcgefh
 iaMZjTXjkFL+hRlf2YiJrhHhvqZqJhuICnRNJtPjii/mvd2h7pPYwYSZTcERtdD0s9EjL4bK9CN
 TciP0ZZXWf+znDJ6Cup2Fs7HdPb4aEtcs0rD4/LsXd81mLK4bRw9WTNZ1UuVz7eSqYqbhiP0tMa
 UZoaqaXt/e/V7I0lUadE6YETzRP5sKu36vnW7N3AZAzGPx7GBDKa9t6p0CtgHq6sfij9DVotqML
 eE7pB1i0Zk9MMAPqJjUnj7mL4JSk8hKy+SyMZMxa3rQV/zx79f7IxbDatFpQ2V0PrRNUIctsJqi
 alXfgS6Yk8RQXcYFN7xHZUvjf4iRqmIDU+i8Kb8U5aVtaRfWUNsVUtdjwj6z935DKVuO/Pcb7Ws
 KSTWEMBvUL+O59Kljf8ODw8yCsr1F1YWjOJXsEysmz/iCKI4icQp+gi7BZJYj4PCC9poLKecl3A
 evgsECZtKSh8j2vtB/A==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=69727dd9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=hXMO4SuWbqAAnYZNQPcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: S0LNPslyCTyeqEuqT0LzFFUEabvD47HK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90260-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 711DD6D2BC
X-Rspamd-Action: no action

On 1/22/26 8:34 PM, Gabor Juhos wrote:
> The 'linux/soc/qcom/smd-rpm.h' header defines QCOM_RPM_SMD_KEY_RATE
> with the exact same value.
> 
>   $ git grep -nHE 'define[[:blank:]]+QCOM_RPM_SMD_KEY_RATE[[:blank:]]'
>   drivers/interconnect/qcom/smd-rpm.c:17:#define QCOM_RPM_SMD_KEY_RATE    0x007a484b
>   include/linux/soc/qcom/smd-rpm.h:52:#define QCOM_RPM_SMD_KEY_RATE                               0x007a484b
> 
> Drop the local define to avoid the duplication.
> 
> No functional changes intended. Compile tested only.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


