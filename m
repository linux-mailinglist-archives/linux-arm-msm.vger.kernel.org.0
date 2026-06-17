Return-Path: <linux-arm-msm+bounces-113489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EPcLFd74MWoHtQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 03:31:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F5A695F3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 03:31:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZpvqCmxV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HZQCJ5KT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113489-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113489-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 516983024891
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 01:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDB2158DCF;
	Wed, 17 Jun 2026 01:31:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047A1280338
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 01:30:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781659860; cv=none; b=VQ+ZRqY5C5Ixpz3lOrsONNU2lZ5yDlRnc+2ITkM/AMvfO8XKc6JLBB4XVJk6RNaTCFiITolF7/SG5UZ8GSqYbo1dSyaZH2DTDnvIlCqaJbqb0xWu4NxFCyVlR9hk9rOcpNAe6x9ZTa08OOkYEtCj6qpJIds/xeDOT4ywkyhemx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781659860; c=relaxed/simple;
	bh=f3QMIYqJLV45dB3OOU5q66tRA/gy39q6iYmhKOD+IPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYXheYdwRMABE2Ee9NDxnoERklbn4Ua9cWRUqPMxaeNXDpESQF91W2D0t9/Ak1Rmgh66xsqiWunCgodvVLP1oKj+AwEo6ei8kmXR7O5xGg5QXBxLHQ/uddxWk86w774aDkkmUz+MDUGdTUUzZXKbVvm7e0OX5p9AOZYhDGt/Mqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpvqCmxV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZQCJ5KT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLT4fq274813
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 01:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFFy8N8tIeg6Ssx2D/z9+qb38nAO75a0/SRz3wzKEQg=; b=ZpvqCmxVyH3L+Cgw
	5EKtXn+S+jl/1y6uT0pA/26UNpa/d4wFil+KiVaije1Qb7WDLlhKoZaIZNlYxmj4
	S9jWXnnDMCk/YjA248gUtseDxZCXfUWUobqgniv9gKTsvScEc44D9ByFu5Q2MhNX
	bR+7d7h4rmeu2AA8LIh72IokzGW8gMCHW7sO8JiB2mkEpvz6ZOw6XftWujQGnpXu
	8gqflYLZ5kwtBomp/DOjdyu/TaXCgc86FFoWJTqTEgEh5J8VYQxLoRlZZa9XOpSK
	gLrTR9Kb7XzAVh3VNrSAV/sq40w6ISGZHdXCs6vyM1/OjXgAlWDrvK2Lu8/9IiSf
	MLaakg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemgnkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 01:30:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f424d5bso3632254b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 18:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781659853; x=1782264653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LFFy8N8tIeg6Ssx2D/z9+qb38nAO75a0/SRz3wzKEQg=;
        b=HZQCJ5KTqDBd6UeG5IgshXz+klL8GtoReKssMYBHQ8g1iNeHtE8+X5je6ZZQHy79AN
         bGplfB07Gn7WBcH73+d61xdX7MArjsAm9bzqWErlpJlC9sY84XsILEY0AKgRk8L1Mum5
         rwLYWeDx6CRs+JDCfBBzqWcqTwCii07CTRwDs8p9e/DMs3kvYl2RwKRKHdZxuc9spgFO
         /+jJCTSMzNTlc+ht99i0i5LuqkZU8CAfM24/6hgVTQpazpzb2+bAMSEQZ6zE/kEAHlzx
         FdnptUkl+TC10KK8y9djLew2ek/dYCc3AnfNDRmGGgl6pps7WMbCLCWvv2Zwt/tcdSbU
         87wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781659853; x=1782264653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFFy8N8tIeg6Ssx2D/z9+qb38nAO75a0/SRz3wzKEQg=;
        b=aFOt3WKHn53DixygbNNj+ZoC1LIZhY9LHUPI6WiZMT74LX/Fu4iikQkAlthykG5scI
         jMXmIgndQg0yTpHNAfj/oi3B68K9Gdh3u+/bk3RrRisVNM5ypHplQQXQhJEf0qYKbmA3
         9qzBX0ljyGNMGU7A38CNb8H8w9Q5/g7eyZorDLzYresr+wXH8+dK9tpKRYShhHtZTlXr
         7kLIPkTiTX0eeRc3K7ryRDgpQt3gvnBlREHXLMPp8dSirQM6TTfnyUNoo3xDk9Nl02+v
         +FW75rvQdhGUucbow4HWezTdLWWR+a6IyffN0zqeZD07+qmNVU2SHh7CpYbzBUzq1nId
         q+tA==
X-Forwarded-Encrypted: i=1; AFNElJ893/eIEdY5ccmOxEPV+RNNRXvXxouadpTzUYqUj2K8ZOIsVlC2nXU7Dpck3xgu7LTx7gTJbDy364600kRy@vger.kernel.org
X-Gm-Message-State: AOJu0YzCf5XvzMGzaNE+XiILjGHhk7Q/ocCFV2v1coCAe9QH2CcnhfJU
	sZe7Ug+3gjMXrlg0zIjxvGOf0ZVWKy5NPoboXgYbO+GeFWKybezo1HIWd4PdeWuoHEEi9nXhjbn
	cRxJMBCDnaLXifWB7ex4YIUYI/3aEGtQIe5o4x2YGRe2nrrMk0niNwsP/Dg1zWoszDhUt
X-Gm-Gg: Acq92OGQ/fROmwlHX97jgSQCw9kyzkQ5mnkprmyjFpProNyMfx3JCKVRZQYtXkm/Q4W
	9FIW0Ig4qbjtS2FyFF3YHapFKRz9AyjeVW0lXVPQNX5b2fJS6b33xDx24j7nKoELCXkYBNIrli0
	snlYNk7TRKTstnDe47Z/jB+zfTIwY2x9ahAhBexxg9Niu4UKNdKig8e2SSNdb4I65KKUEdIc5uz
	f7AVdiUUoAIzaHHzNnauFtcZdSsa94PNPhFxP6zWT5QfHWdoe3vFpHL0eMxD3SYeIhJ6GB2+nId
	EUg6/mvdSfuFDF3+TJ4xEMr60zkA+Ui51PIS4nPoHF1xyAQFx/n+RLlptHTsMYaam2m3DON/6q2
	pFqr2B/9xSTIBUNnQHJvDVu8cU8ii88PzUJyTV+n/mt0pechUiKf1w2CEBeCwj4u+2iZPN6FjmG
	YT4xnSVhIoWG8mQA==
X-Received: by 2002:a05:6a00:2e07:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-84524540500mr1574731b3a.22.1781659853201;
        Tue, 16 Jun 2026 18:30:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e07:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-84524540500mr1574699b3a.22.1781659852720;
        Tue, 16 Jun 2026 18:30:52 -0700 (PDT)
Received: from [10.133.33.63] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c4c0sm12958951b3a.3.2026.06.16.18.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 18:30:52 -0700 (PDT)
Message-ID: <8a4e7f81-959c-4966-b90c-1ee4ceb9ec9c@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 09:30:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add PMIH0108 haptics device node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-4-d24e422de6b4@oss.qualcomm.com>
 <6b3155ea-b583-4f82-8313-7a057fd78066@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <6b3155ea-b583-4f82-8313-7a057fd78066@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDAxMSBTYWx0ZWRfX2yY+uBrxQt+Y
 2E0qH+v9v5oMTnwOEaNhr8GIOpi2nETaXsUN0vZd3En6TaQhm7dp8vuLBpYWEOjzUmyna0r31Gy
 /mygcKZBPvufPhvLPi9T6WoeshYdsbE=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a31f8cd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kLZ2Z8zhSb2u0Y7Hii4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: mfa3xgx0racMzM0Nku4Myj9DVQdHpIix
X-Proofpoint-ORIG-GUID: mfa3xgx0racMzM0Nku4Myj9DVQdHpIix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDAxMSBTYWx0ZWRfXw7Fd49CA5BA1
 CXFWPChZrm+fDUhaVRnq7wvE0aKuYcvg/il3XvfEY/v0gcjUh/+drbI/Mhvl9lErRFiAA7QbDnG
 aKQhdE0s1Aj0RWvutfyUr7KabN1JR0X9+gonDb070PjPgNjyvptWOyTZQnTJtRY/taFg2yFSICf
 n9gT37Hpx4ut7U/6ne3Ap53ArAdNWbgVePiKMe7tgxKy9hG/hUV8mbLWqU6rextazcmy//0SajF
 TgXfInMWOpAXoeS2931wVPF3mPQp046VbxSHaMgXJyuVWzAd1yvyA87spjJs5xuQ16EpCsR/N0f
 qG75KO0V++bslGLA9ydf28yHoM8WnpARHlCYSJ7iJUOg83xoO4pIHPIKewjMSc80/VdNQjlOvkN
 +AnIWgOfQ8UtlRrgISDQZlu15s9wKb7Q42tSha8Hq5TKDY7CmD/8bvU2kbk5+ZZZo31Xwtmbd/N
 2oSJ55GjpQ2p7utS5Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170011
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113489-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4F5A695F3F


On 6/16/2026 6:27 PM, Konrad Dybcio wrote:
> On 6/16/26 12:08 PM, Fenglin Wu wrote:
>> Add haptics device node in the PMIH0108 PMIC base dtsi files, and enable
>> it on several boards according to the LRA (Linear Resonant Actuator)
>> component mounted on each of them.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts       | 7 +++++++
>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts       | 7 +++++++
>>   arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 9 +++++++++
>>   arch/arm64/boot/dts/qcom/pmih0108.dtsi           | 9 +++++++++
>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts          | 7 +++++++
>>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts          | 7 +++++++
> One commit per board, please
>
>>   6 files changed, 46 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> index 07247dc98b70..7e3f59fc008e 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>> @@ -952,6 +952,13 @@ wifi@0 {
>>   	};
>>   };
>>   
>> +&pmih0108_e1_haptics {
>> +	status = "okay";
> 'status' should go last
>
>> +
>> +	qcom,lra-period-us = <6667>;
>> +	qcom,vmax-mv = <3600>;
> Do these properties depend on the physical characteristics on what's
> connected to the other end of the haptics driver?

Correct. They are basically the parameters of the LRA that's used on the 
board. You can find details of them in the binding document.

>
> Konrad

