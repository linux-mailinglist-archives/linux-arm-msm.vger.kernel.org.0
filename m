Return-Path: <linux-arm-msm+bounces-91462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGSXFIJ7gGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:25:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E3BCAD9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CC60302FF6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36B8356A08;
	Mon,  2 Feb 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1VZ/D5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNg4Afj9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D912E7199
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027152; cv=none; b=ah151oMfX6hPiGCJezp9zOlAJFu4K0gx+2HshX1Zh5izMxRj+kCQ+0FV2bGAYNh3Ho1bDylhSAEoIn/MfEhyuHm2CgksJKSXqsoq1OqIPrJgVvQY4RDqSR0OdeiquhaBPGrFtWKE6Owxv/rf0rtmS+wbkBBaS/Qkwn/kl8ijZeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027152; c=relaxed/simple;
	bh=iFMbqwctJwHkJZqPrzS51Pz2muts4JJsycPay0HzPyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHKDqZzvGohFRwzsvtTU1JUslfs6LLIfLF/QCWA8OsMisq0iwfmvd5xboNmhLMvObkvoqnrZ8Omjq9dfVmltRJ4rleT3evq21SdSOsDnMOpjyu9DnhGC5P+RSlXWm6KaxfXZHG0l/DJ2zj3l8mNT8YaYZMsvxLBa6H9leycBom8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1VZ/D5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNg4Afj9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61271pOq523179
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tHS6Wu5wR7F9TxmgaA02/LdYSXLSsQ7GX/XD1ERtU48=; b=Y1VZ/D5e6wIoYfpM
	UTB2YvYYdbFnZwPc9SBGl/VicNsY1Wkoiq7JVtc1WzShEc6FTVcs3B32tysDzyGq
	Jo2yLNeVamNumrbzAbl8mWvWWG4RdI6k2S0nV7vFv0hKLhrPmHbhSJNVAd7j5Pgn
	JJMWvUeuWr+j+Gn+Dk6TU8yHN8JKURUveU//CohN/s9vOkLKNeRE60gu8plXADZf
	NlOcsupYC/VuZ7LFolJlKbJicgyqZdy2Z7+1iNl3lMtRbR7g7EioBUYAusIRuFJE
	qvTPXzeWzsQHNI07Qvch5kB8TjgHYDlm2iGRz1Ya6H0Y4qzwcrAboKSb4+yKiVuX
	nj96tA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnw23q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:12:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a182d4e1so72002385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027149; x=1770631949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tHS6Wu5wR7F9TxmgaA02/LdYSXLSsQ7GX/XD1ERtU48=;
        b=YNg4Afj9DURD0ScxsbhTW0Mo/Vg2gVkNkbSZKdBu1wR0mU+YF5lB01JdmrrrSRg9S6
         5ycBxocXe4YK8zc1tAM8X/yRVniJBfTmHVNAnl1riwr6CX5hYO3llCwlPXKWRvw9IUwF
         qHXp9q2Tei8/Pbo2H0t8Xw2mA8vJ7hcot+hbPv6kGZglvvNEfU/eSZiRivW3yYfsvOqW
         8lNHTpaW59/53BTCck6XjVgOGgYdrqXNFNo1ro1r4rSFLIu134lLATffnYS07rFWbGpo
         3MGhoyxNN4BF5VM5BGeouzsym1lbAtpCLM70CtRYYBnCX5PpRNmWTku6pRJTi38Ah7ux
         AMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027149; x=1770631949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHS6Wu5wR7F9TxmgaA02/LdYSXLSsQ7GX/XD1ERtU48=;
        b=gcKcL+adBNn/qmPs4mU/fEEZfHZ6hed58x9sEX12F60rGTP5RX2wO8DeHZNTfBFxj5
         sV+UkCS2VwRu1THK4nnQE60t2dh7y3OtGZP/E4cEtxY0wNGpk20DtTSc6I5VkqqM72Uq
         QIW1jZ9Nc7ftZPDzv4dKbfr/p1nCyJgCl2ZiJ5n/fMbfCjKOL+ztleZo6sSiVkpRIQ3C
         xruN0+f4aZngueCPqIGAd1IPtzhjLIUT7Sv/Qpjs7VeKa/xWA/dAYDkg6NDB6s75TvaS
         IBGuZ6wcgb4OqSlTAlDyaQd9QHtruIUlY75NjrTS35M2RlIAf59scl53ZFo6OU0cLEkv
         qGhw==
X-Forwarded-Encrypted: i=1; AJvYcCWigF+mCTzocy/o7/YdTm2NScNdY783qIJgCXvGsLzUBQQWbQcYSUt7V8EqsCgeuZahhWRxuymQ4v4nBkKe@vger.kernel.org
X-Gm-Message-State: AOJu0YxBPxe63JjKRjsknwc5H3i66rWzeRld+XHs8QnfRlhlN+n5Oev1
	jzjC9f+qNbrt3JFvqqXW3r5hPvw2LTwSRSSlU6vF4T2oVr65Fd0ZASvAeba3pNHYrM/A/jbdYuy
	lsl/wDpfnV+pZ+C97cYA2E9FY8sOiee32hA8zXy/Ih4ugm4vgyePorVPJ3pXETVKsxPB5HgilCd
	pJ
X-Gm-Gg: AZuq6aKCKOrYVuLky/6gvn1jOPTt/E6QvlhpuXUedUKjdC6hrpZ10N0Al4nFZegk6Wy
	xSbtbLnV/zz3+xoax7XIcUKjb1QAAVMvSZRz8oCxz52rGjU9c42p0//MumHYFEZ1ckpLaA51MJB
	N/FB791YY3XLZ7SQsYY9+RYGyTNvDYIHU1B2gTVForuo5063lUuCd+GRTfE9EHTL9T49v41keDx
	jwhZZ/YZxpgtfB6XC1p3AMDWd59yY57tXtV/2Q2QZpkHXkgSUCHhwad2BFkWMPxbIAAGOVRbydo
	sp8VJXujHspIMLfk3FIfOfz6WC3gJbsw1mugkW2KdOB+99rF6UYsldukbbC/+MpRURwUtNvIcLv
	5N2K2wnFWlWWUgQ41ViYG9/Vu3P5ojO0pAXpzOBPyQRt1oBFkR24n0DxtSf8yv+BVyko=
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1079659385a.6.1770027149599;
        Mon, 02 Feb 2026 02:12:29 -0800 (PST)
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1079657285a.6.1770027149193;
        Mon, 02 Feb 2026 02:12:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e0901c150sm528620466b.69.2026.02.02.02.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:12:28 -0800 (PST)
Message-ID: <472d7db3-db34-4966-aa17-588e1153ba12@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:12:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Input: aw86938 - add driver for Awinic AW86938
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
 <20260128-aw86938-driver-v2-2-b51ee086aaf5@fairphone.com>
 <aX6whqw7XyaKMd9m@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aX6whqw7XyaKMd9m@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=6980788e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Tsre1VS37Hk-rMnNNKQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: cMianhGSkWIvNaQVFYTkM0At5w34wrcH
X-Proofpoint-ORIG-GUID: cMianhGSkWIvNaQVFYTkM0At5w34wrcH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXxqVI+MDLbHIL
 RW93M9TCnpJ3xyPpRRw9FqqV15O+z5nUlZgD0RODnAsrL2/pv0pjTUWhy9zVMZqaImvHOmWanHn
 fI4x/A0rDGPvIUqsWH3LvDA+NxuawQg0ZEPvXQZVsPJnZ34N45mWVSvQNQ/RC3VJrBflQtC0LXw
 WGATNm4711gJ1QPAZHIa4hu4M7mERgbRmoZ7K8FHENROcVyfVvO2awp5mK8CyHWHuLJSVjmsQtX
 IfKyGF/43FPT+hHGi+6CkDw3Qj/mUdAc01NJ++IX1V+kf8q1rNCEfcSKctWRDS6qB3T3UwPX7iA
 FC36gjCJJOxnhWHZEs8BsmCBUa+C6mZOjEazxsBy4fcxgOXoiz1e83ROW7uuu4Wnh8/qY8JyhfB
 SyoGUPbmQvo8+AKiIrmYp3tBSIT7dj95wSoZlU4KzgRperzN3OffrlvGKJ3kYMUCtVJo8hQwDg7
 O0ffS8iiVvxO1e9I+6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91462-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71E3BCAD9F
X-Rspamd-Action: no action

On 2/1/26 2:49 AM, Dmitry Torokhov wrote:
> Hi Griffin,
> 
> On Wed, Jan 28, 2026 at 04:51:14PM +0100, Griffin Kroah-Hartman wrote:
>> @@ -717,9 +746,19 @@ static int aw86927_detect(struct aw86927_data *haptics)
>>  
>>  	chip_id = be16_to_cpu(read_buf);
>>  
>> -	if (chip_id != AW86927_CHIPID) {
>> -		dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
>> -		return -ENODEV;
>> +	switch (haptics->model) {
>> +	case AW86927:
>> +		if (chip_id != AW86927_CHIPID) {
>> +			dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
>> +			return -ENODEV;
>> +		}
> 
> If we are able to query chip ID why do we need to have separate
> compatibles? I would define chip data structure with differences between
> variants and assign and use it instead of having separate compatible.

dt-bindings guidelines explicitly call for this, a chipid comparison
then works as a safety net

Konrad

