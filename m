Return-Path: <linux-arm-msm+bounces-93485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9yNsOio5mGmFDQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:36:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E36166DD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8DF830041FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF5033E346;
	Fri, 20 Feb 2026 10:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKQQHNmD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gF3xLkvh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7169533DEF9
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771583782; cv=none; b=dtwWOHKR1TdccKd/UkVBcp6eE3ssG9njq59yUYjStGXn1yfZ+Q5GA+KsdaeSOC055PhPepCBMvPL42mHNSNgbmLNgomXHDanr1o/BS7ygmkme/UQN9/tEVzuELrhcTcaZopvPB59zi9AEAxeyrDvcbXogAvIiuwFp1Mh1v9wdDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771583782; c=relaxed/simple;
	bh=G5at7ibjN0g14PaG2FatNt8F41ngH9k8/i1n0QqS/zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a0PLblgVn9aBp+/toipLZvA5kbDrc9dhypWPnzsdicsV2g13Lt5aVPgvt13W62RcWP6VsZZPJ8YWzkBUknaru9wwBigm9x4PINr0+GrnPZ/+7FlH7Tsap+9S1QueLmJ2xeU+Lv+y9mu6rjLT7D6NxZUL6JL3xNW0b8q/lchHeq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKQQHNmD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gF3xLkvh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5SiKO2381179
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	73hsc16MmRU/mTVMGpbbBTJJ3KemmpyZ4ao7J6lqNsg=; b=RKQQHNmDXinPsObc
	wzVKb4XY4P2Qyj2ukBVebHrLACA6MGsrpO5mQa+F6/XY8N9FGONoHO2yrn/yFvaE
	uoexgLkrwuo0rJ7nJzHjWsuFX/b233GLbvFXbae0RK96LKQ7poprIq22ecY+H3kI
	Dvpihf/UJX8OWR+DArsVEVjg5qtz2k7vRAsk9xXSrGn2cVluNaGomNJUStYIQRtC
	vnhMH5Q1MjJqUPTbXZr7kXrx7xS5ZCGezCT6btHl5mRHJ4TimQFCrPCi79NPxor+
	fLhmsB4SX66X8lAKvpmFXD+aaI71ZcwrQyGq/54kJzd+DXD07uPJ7C/z4KJmc5RX
	vGoqzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cechh9d2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:36:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb38346fdbso185141185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 02:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771583780; x=1772188580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73hsc16MmRU/mTVMGpbbBTJJ3KemmpyZ4ao7J6lqNsg=;
        b=gF3xLkvhUM6ppVEpUWUvydHoJii3B6YPIP9DG24kdUCadoCOJORjKFlut5Rg4B1hqw
         1YsVumG1ACmvIXPM4WZT2ZP2WdSWwIR4uQuB5ujhfkDDe45n75A3Umc86rzDM+YlTGNx
         UAwDUPAQUtq0a+fq4Zp4D4Iz69FgIbchHtsOzuC5aQjlwgy4r8uTUVpi8tkgZuy25Gz5
         npUHb8VzKmeFHAPfTtHQQPORCgFd/F53luhD/sGjWUflbtMl7tNDf2Gyv1/hcDjjLO4q
         FHuiE9IlvxIaLROwZC95ejf18s2vstLgXte3LjdvLZ89ZWY4T25opQOkdFPYL42r97h/
         1OYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771583780; x=1772188580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73hsc16MmRU/mTVMGpbbBTJJ3KemmpyZ4ao7J6lqNsg=;
        b=hdNqP+ensRqcaS2hH5LS9yG5iWhc4jt+m00eNYo2jHWF7Qs24zfwNy0eXB9nFZLJ3K
         n8tjjHOEnZYOOZJfHwQNkNEkJg7McVfzqWRNxK3q/cRkNaepT1TdkDBXd+k0dp/Jt8zs
         umEdOh2pYB5Vxg0x6qDO3fZejdcZ9FCXQuC8phrcU/iV8iUVQhNQ7jzwKawsqcXtXt0e
         4y5hfi/7BqtLhYZy/vWoAr50qqpvz6I0E9KBa8f4RG2nuXD9DodXDH21oB27tNGn82YX
         FCgtHWmBIE6YbJVdzT24zszNKkeZ4BcTNRelHE9LJPdrvKLiFVsYVYEyiDR00kGuGZWw
         vPvg==
X-Forwarded-Encrypted: i=1; AJvYcCUvUglMSf/RpWgcR+DSBL+jHOZWjsqQrx4KlEsmotAND0gy8eJ5pSp4+vd8KcjyMW0FWEuCI/AB9dNIrLeb@vger.kernel.org
X-Gm-Message-State: AOJu0YwxyVPuPvP1ubk5BU2IZ+n0Vn7kz25P20CCIWHpHxkW0CqPeG5C
	Y5r1heA9f+QJIvpIOZOAuSV7Y/TF3T4meYw/xNfeQeTmt4bvz+d4ZS+eBzrUSKC+7bh37J/RJ07
	UkiCOPogGGJkq4Z8zBLluzRqhd++l0gT14zt9kByRm3rm/DiXOlnyQ6UouaRi7NFeB/ea
X-Gm-Gg: AZuq6aJadsKQVABWsgYEMnZo1+OkdP7OU72dHtqQgOx2M6P87ixmRkMvaQ+YBqYaBvh
	UF6jRYyvlopcFI01yg7iQdZMbWNFM3beJ8ywu/Fn6Cqs4myU/C8+8VZEwpSBMfOD+aol8wDSe0T
	OQ5yTTdKIPE5Af/zJDCM9iuddf7IgrnE6eDUsIIPzRpDK4MlsQWliLdEDw0LiCbDdyRxA3Nth+5
	xQF6LKh1lQGkhqwwUn9pNaP/uaRJgxpgbEB2AHfu4daRnlJR58h+S94psGTHJsKjrR9FQap380P
	Gw+qWX7L0rUEqWJdiwCK3iv5xSeQQE3QfGbzP/cJJnVWM5Cfd83bS7N3/wJ6GqaabiOolayNYKr
	AK8Wc/+RusXemwYiaHbZrS4A7/Fu+ScIluotwGqZh1yJBSyrZQGqws5UKMAPupi3cZYT3okujK0
	4nFjI=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr2416019985a.1.1771583779849;
        Fri, 20 Feb 2026 02:36:19 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr2416017585a.1.1771583779333;
        Fri, 20 Feb 2026 02:36:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad2a9d1asm4594244a12.15.2026.02.20.02.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 02:36:17 -0800 (PST)
Message-ID: <be05578a-d90e-42ce-a1de-4f670fce03d0@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:36:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
 <62d53cdd-b71b-48f8-88d5-65407d3a80c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62d53cdd-b71b-48f8-88d5-65407d3a80c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dNxYxDjAlk6Wb-xocU2vQJpgMXKFA4wq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA5MiBTYWx0ZWRfX5g5BFR7iXCku
 cyocj3GvuZcU0e1TIiGddx6ED0N+g5y8UjnR3WewSNOKarp8fHEPk3QE8yRLKpr4CZ7p5wMX9LH
 +ejgArwk/8RAlKmNYyy3knDYq+d97TSKuVBA0wP8LdQ3TKm+c61wwNbUR+SY0FxoDhmChd1ATAr
 1kgBLc9F/9Vpb109UAPpqAvcdWx+F9LYvT3cBBQXNQylPp+ahf70Sr/tuVstkdHRct63ueZC6Qj
 UXcNAk2z74/cqImdYcCFByD21tpsB7Gj/IYMlt+McwGSmI6Rb2wwLDP0pWQMRnvbbrsPeAqYNVq
 llKE/8SEnFLcB8VNnlXPQu9IdcDHgm/pUIHkUAkOPAUXC2GpTekgLyIvCUi+jOgq4KHK8ZrOGMy
 /I4tp0QcEo+Nk0OPWEvNFFDpfRLGXqGEQUsJADhJTzorC90spHcZUY0Mjw8SCDw3oi+U+cqi/RP
 MOthkQoxAzfoEfXacUw==
X-Proofpoint-ORIG-GUID: dNxYxDjAlk6Wb-xocU2vQJpgMXKFA4wq
X-Authority-Analysis: v=2.4 cv=KYzfcAYD c=1 sm=1 tr=0 ts=69983924 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=UqCG9HQmAAAA:8 a=HV0a73jl2iU2vqZvWrUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[outlook.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-93485-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,outlook.com:email,cd00000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81E36166DD0
X-Rspamd-Action: no action

On 2/19/26 8:42 PM, Jeff Johnson wrote:
> On 1/13/2026 1:20 AM, Varadarajan Narayanan wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Enable nodes required for q6 remoteproc bring up.
> 
> I just recently became aware of this series, and have some questions...
> 
>> +		q6v5_wcss: remoteproc@cd00000 {
>> +			compatible = "qcom,ipq5018-wcss-sec-pil";
>> +			reg = <0x0cd00000 0x10000>;
>> +			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
> 
> This file does not currently exist in linux-firmware.
> Instead there is q6_fw.mdt with associated .b* files.
> 
> How do we transition from .mdt to .mbn given that distros update their version
> of linux-firmware independently from kernel updates? Will we need to have both
> the .mdt and .mbn files present for some period of time? Are there associated
> changes which no longer attempt to load the .mdt files?

Since there are no in-kernel users for this one (the ipq8074 WCSS driver
requests that but no DT is wired up), I would say we should promptly move to
MBN..

> I ask because I've been told the ath11k/ath12k drivers will also need to
> transition their firmware loading from m3_fw.mdt to m3_fw.mbn, and I'm not
> sure how to make that transition.

I can't see any m3_fw.mdt in the tree or l-f, unless the m3.bin qualifies

Konrad

