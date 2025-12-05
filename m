Return-Path: <linux-arm-msm+bounces-84487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09938CA7D5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3C9C3010F30
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BA231352A;
	Fri,  5 Dec 2025 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvquVuCs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MxVHUDIA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3082E92BA
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764942637; cv=none; b=ejhxWE2fJd5fMIFmcJbixglOqgM27HrjnLJiEahgszV+JrXWDypZWixbBhRJetKXV8BqeLjdgOon3/kMq/yjNS+R8AjtcYL2acGTFnL7+EB6gsdCX90iweFXTrCDWOdjC4x1WD993nbZ3Y5o9tkkRbKDKUijS6tvDGrL9uks/rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764942637; c=relaxed/simple;
	bh=4CZcpYXXlG2+62cC/J8MMsnK+3yQsIoU6uqKqHUZp1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3UV/dn+w2ghv8Qsdna0dyw9/C5Ji0QSQJXj4dIED0EZs6QboGjdEa6S6Gq6VDNp9piXTcE6c1LNXSswn2NNobjoE7VKFkn3ptATD96scaxoRvcVcXLvmuAJPKklB/TmiyiaSnun0S9JDHGfVtwJgRFcKd98TDHFAlxWQMQOKqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvquVuCs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MxVHUDIA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5AOhle3572449
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 13:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5p88FGBRRHUrwtsPtwBgMJBiZaTek1nnXqBGbzR/+4=; b=GvquVuCsK1vpdH53
	Puy/KC+rk3FqmvhsS+OANi48d5cBYUdq1L5BIkGFmupmXS0LIX2dX/JYT1xshlbq
	oSzltLddTpqPXqYHlSKQ/QQdpG5N/tX7FPR5+QLvt9QaiDJ0wDICsbkBwaKDCBrX
	E89qdyzgspfAMLmyXYYLvH1cK0RUiwAtrqLCXV3NZt6rLZdoiTo4gWyQ1KbIXGJb
	d93+ZHJskcaAjfSKxI3AZf91kU59me/uDmpfTTmNyTp4PVOrasvdDdwMRynFMh2k
	Bi8IbdzDbKWImbIM3y1AH8OJjtqTqof5tsQ9qocCSFT7SbYJ0w1TeHGSJW0uOSZs
	wL32tA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm58gfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 13:50:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ede0bd2154so5363501cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 05:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764942632; x=1765547432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5p88FGBRRHUrwtsPtwBgMJBiZaTek1nnXqBGbzR/+4=;
        b=MxVHUDIAOr++NOxtCUAwabd+QgCtkGTxV3g47Uwk0Fvo6EaZzzeunSlJ5ARSbe88Qq
         l+bVyb0mFlkU+YYAtTFg6J15kOjQDl1vYSKdLGEYH52PWu93Ge4y1zEjP/5JFkkAcMoE
         cYpvdswPjkf0PD19NOHi7bT+wG0e74jLRNZxDZj9Fxnha+D0dnWazC0vglcX6Gf/69iB
         TYV/FS5GMqQKmY0e9wWmqSD6sCkeiM77V2j5M1gzQdqhlzI+G0YI+TgFxy07MbUvgpJM
         HIW7X/sdSDwF8trEW2u6ea3t8MgaOE5lLfI6pbjYbv1gt79OdJFomPEzqDh+vZG/5sUq
         3XzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764942632; x=1765547432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5p88FGBRRHUrwtsPtwBgMJBiZaTek1nnXqBGbzR/+4=;
        b=RFOfBXL85F2owgNWBMDWziPnHT77oSkWTgeFDuDigqE0YhpqYlcdPpbHtnbnHI4WEK
         6HAs6gI7F6Ri3uPm2EpiF+ghjdw1mZgdNfw+P0YvfeoHwEW2mNBUpSrd6Bnbux8nyusF
         VqD2rszYXqx0NktRojbnV62Mqbar3xqQFLx/qQXjdUDYS9SPwvFrfpj/Hr2hEDhbtMMi
         v8vj49C2WZ0j9GpwU4ePoiBwjFYRd41fo/3LFJ0V1fg86XiTcdY1kqvIbLKU3Ops02Xc
         RYb8/Rv9VsPdLDzDQrsnqh30X3QGA3GSCMH2NHJ6ma83Q9dfCgff0LEv5G8ssnhlQ+cD
         VyXg==
X-Gm-Message-State: AOJu0YzHGeZbylmRNyLUaCCE8yxssYQKLnA2doO6A3DWaMEG00iDn6ku
	5IRS3FGWGZ3unoJhYEDfjAAEG1CgLH7QAPEY1Y2Ga3IvBMaFqe+qdUQscLEdDk9zGSCTwSrLWel
	s8VCa511JCugzM/KlTfjv5G9hohPQ3uouIfbN3XuPeiO3tvPd0MxKH3o5N6SfRDWmY3g0
X-Gm-Gg: ASbGncubRCNdMHxZtmF+Z3pA0Ac/XuFTltjQe4qS8DS2ECoE51aerPnWFVemDgOc08n
	dfPTx0ry/zeJERxbwWBxmxXKs/TQKfX8QuOo+bKRX6VvbYP7g8rBqXAIQm13aAPx/es5kPfihE6
	Wo6P7MsBvddSBxRt/ubXchUAnmS9LFWW33BMWUA4YD73G3t1eHWjlXMyqN4cuI/0ytwojmw1zgn
	r4iCZwCri9k+msQQDjLFtZizHBerV4VYln7c/Wn2lYyGU02faoy5AELXlEIitzs7OaFdqOCTDIG
	9Duybq0JNFLY7Uhhy7nOxmMqc4phct3C7ZywCRac7ozWtC0u+1upwfadAipKJA0S4P0L514w7yA
	qQ8YLYY1p2ln7+ZxHbIDIFUIK/mdwflgKeBHeS32begC7jrzqlwaykMIOgmIif1Omtg==
X-Received: by 2002:ac8:5a13:0:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4f01b3ae1dbmr90396711cf.10.1764942632407;
        Fri, 05 Dec 2025 05:50:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7+9p8L0qbtODh5+8acMl8B1/dPeo8CKcgfhrw8pmakuGMd5xrf43LdX+oGknLnUZeK7ZZqw==
X-Received: by 2002:ac8:5a13:0:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4f01b3ae1dbmr90396381cf.10.1764942631945;
        Fri, 05 Dec 2025 05:50:31 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b368dcf8sm3857364a12.19.2025.12.05.05.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:50:28 -0800 (PST)
Message-ID: <6f085aee-e1a3-4171-822e-1ad4f963515a@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:50:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
To: David Heidelberg <david@ixit.cz>, longnoserob@gmail.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251205-slpi-v2-0-dfe0b106cf1a@gmail.com>
 <20251205-slpi-v2-1-dfe0b106cf1a@gmail.com>
 <2bd146fc-06a7-4f62-b542-fe24cb9150fe@oss.qualcomm.com>
 <5b1ad72d-bd85-4950-8148-266296a05db1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b1ad72d-bd85-4950-8148-266296a05db1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: v0Yit0IOKp007FMsHHstpss1s5pR3dkc
X-Proofpoint-ORIG-GUID: v0Yit0IOKp007FMsHHstpss1s5pR3dkc
X-Authority-Analysis: v=2.4 cv=XeOEDY55 c=1 sm=1 tr=0 ts=6932e329 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=230YQcnhf1KWoVgRm34A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OSBTYWx0ZWRfX/l+KoWAvq3Wo
 If1iBhKsFChQNT+mq5swObs3rtP7uLOmhkpkUe/0LViVELwkxWrebJcVyqTHAE45lqim2o9IWRS
 znPOceG7VPeXeZzXN9XpiakAGsfIzKnr5IJz38Hu8Pf1YmtkFOvzxhktGgXY6E6YPrzU+Ay9M4w
 tkdDJHeehCdW4nnCoXGzixJZbanVZ7qUpIpg1hmYu8HciCRoIjXZQSW/mVbuEf5g8YwGAZgp/wa
 KOTRwOOrWewBsc1vzWoYSuvuuAebu6QIrqXSW6rxExiE5SrR50mcSQ7YSjOZKdSQWPdlgw03riO
 lNU3Wa+iH8vmNOiUzqT6HfKxfYX8XVEKQlXAelJ+0AiAE2Xts8MmuuZ3alDkdf/lFC2cSNNvpFH
 OQFeU7wK86eQCsbflPNJTy0/tVgP7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050099

On 12/5/25 2:45 PM, David Heidelberg wrote:
> On 05/12/2025 14:27, Konrad Dybcio wrote:
> 
> [...]
> 
>>> @@ -637,3 +643,4 @@ &wifi {
>>>       vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>>>       vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
>>>   };
>>> +
>>>
>>
>> Stray hunk?
> 
> I think your comment goes into the category of "extreme nitpicks".
> 
> Here as usual I guess there are three options:
>  - another revision because of newline
>  - maintainer merge it with it and nothing happens
>  - while merge, maintainer remove the line

$ LC_ALL=C b4 shazam 5b1ad72d-bd85-4950-8148-266296a05db1@ixit.cz -P 1

Grabbing thread from lore.kernel.org/all/5b1ad72d-bd85-4950-8148-266296a05db1@ixit.cz/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 6 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  [PATCH v2 1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
  ---
  ✗ No key: openpgp/longnoserob@gmail.com
---
Total patches: 1 (cherrypicked: 1)
---
 Base: using specified base-commit 6987d58a9cbc5bd57c983baa514474a86c945d56
Applying: arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
/<snip path>/.git/rebase-apply/patch:26: new blank line at EOF.
+
warning: 1 line adds whitespace errors.


It works best when both submitters and maintainers check their work..

Konrad

