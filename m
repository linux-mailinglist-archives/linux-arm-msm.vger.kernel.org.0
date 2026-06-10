Return-Path: <linux-arm-msm+bounces-112368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yz68C9ooKWoFRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:05:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9FB6679EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:05:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SpN2yX1z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LQHRRvfV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112368-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112368-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7D6832FD23C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9DC3A1D05;
	Wed, 10 Jun 2026 08:55:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EA03B14D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:55:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081739; cv=none; b=uvQup+yx8CBQgYxqnMCG8Ohg6B6EhLGO1AMTc5c7LUQH4UN6gCh8pqX6gMkR554R3qNo5znQXEIPF2wGHo4yK6WmP4vZwzd+E6safWDquuz52xhc4Nxp/ZfcUnZBr7jviY0o9/0wiMR1OJbPuxchMbY1cHa2ZH2Qemd0LTG1Uo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081739; c=relaxed/simple;
	bh=hNijcgnkYPKA/7wrNZ59fyYQzhIfXIxHB80FcnuTr9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5b+rbsVmoWtknE2xBDkdHGBXgIaxMC5DL9qzkkCwhypbrpalG2QdWDSCM63c9vHswigAJv/TIrgCMjwFTOaOiLHz8IWkYv+6s9W+n5GvxH/LUsiILeUGPT77i9wuTtMEP+vBvhEsPBHHhXHJys9za1d4LmRUEHfhDfUDN7dMzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpN2yX1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQHRRvfV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hsG23151721
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyYyxpnmdWgua+0JKg4PJ65ICvAFQSBiyXY6KNTh/ro=; b=SpN2yX1z/z1L1wf6
	bUOtXfSSnjkphH+T0UHY7+r4KkyO6OX0EZ/EjIzNP54WdymfFjQbhhpeGsDgTPR4
	iXQEh1yVoKjUnS4ngOXQHECyh0+F1KusGKDma/B4YGdFeJCA4alS9/RpT4VeUPpX
	VMbRr0IZAtP4QDBxB+YZDy1Kh26xJ1iU6eX+ExRDbdQhaUnp3ceZoRxvONcUElh4
	YfZGNGEZ6PtUoXquvxsRStP4zXtWt2nPyUbmz8rBDbgQ6+MGNbLnSETbeHCeak/r
	2am4Ewf0wMNNe3SDXIDK3IHXhRTqXQBmacJzxuxjDzpPtMKBWPQxjLYzL4kd7Weh
	jGBTVQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesm66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:55:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517bdeceb54so7989861cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081736; x=1781686536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lyYyxpnmdWgua+0JKg4PJ65ICvAFQSBiyXY6KNTh/ro=;
        b=LQHRRvfVIYXsQzLoUBp5XQMc+JeD4AnFM/+afq8GwuGWvLDCuuuAj0HGdxKde9t7oR
         KsUTtcv1fqA681ivIlWPn3XYLKuMxxpQc9iYQCtIPvIqqJz/zSnSwtuNLIbTs84vRgxW
         QTXqUPKVndBoiEOUlPu+eN6E7E7HZVrmtMsB7lRtAZhNVMKG9eKFyphgaauIOVU4Ib6T
         B2vQRToLq3IDtfTJMwC/WbsF6TvM6OirwrTNV5rkfWMLa9oS1x9tqhdeygawgxS0J5aT
         99y+glNb+je6tx4jPon3LBXfVzZn8NdKcv4ghbDW2RDDVl2N0zXpFwhRAlnLN1/5DqPM
         mneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081736; x=1781686536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyYyxpnmdWgua+0JKg4PJ65ICvAFQSBiyXY6KNTh/ro=;
        b=szK7Uh5XyWTEsT1h0MBcb7Drgupl01v0G2BuBBbRhe1Nnmg1uf+R34dbhluuB35U1j
         2zceSaisAGVib2VB6NKTjcsbTRj/EEsWF+wAD3SeT7kGXYlkbKPLijhZ2bmmR6dWvIye
         i1phuhUb+GpMaWFCwRcyMaL3q38CER1l2gkmILk1caqTI71+y3boH+jFXLhkoxmrwXUF
         g+9jqYcMGd2tLcd4iYLi9iUgLEZviG0CVVGC4bjkodH9lMEUjQCA1HN0X82yIJpcAdhZ
         9Y4fmfKKaxH8w3zFePSZangix7UcW7TiE9qD2omHIi42H6BsOCdV69Os/44WlkwPQM6n
         AQ4A==
X-Gm-Message-State: AOJu0YzGmV1JSnLRJYYaodTjg4/E/75Ustflfq+xpzMhPEyJagoF8j7U
	e61F5L9wEeGVGW8BMa2rmdAnwKo2hUuGzXQuwgJGORsKHQk92bgw/98Ydo783UGRyKCDhzHTtVC
	UPMaxcR3IHVvLE7rJWPW7pybg5BnqEAusR9ImKJ/fNhAoTJXaT6+N+81MTn86JTUH7SjEMS7tdv
	SI
X-Gm-Gg: Acq92OFPQhuTBjGY87nbGnlGc0g+EFz1kR6B1aVqGtn0kJxJUoKfpFnTJj3bMlLAOrW
	K6DBRBdeYVT548bnsQrhm95SyiS+UWAU+Q1O1PV3G2ru0w+mN3UxHIE1TN7R/2TDv+QPnlIdusq
	cjR4WP3E8glC1p3kWQkexIX/o20eNZjRwQ3G21nbvas5JNWaBqsPcOuJ1VNeJoYhM7WUQHc+3Qe
	UlDafyJMFlKduJ2Q9uz7TZ0WCVGkZISOScyDAMnyOyPyZuDCc/oBWd5ugK0bVBnz/8ufYjoG9YW
	hyhU/6fkPn4Yvixxt4DFPQ7VtzMHDTGsl3rRN4VucbK0RjPS3xRn/g+GUgGbWO3I1Eg2tORFKSn
	8KO8EAmJd2Oy566QLZAEamPFw6ThqaVbo1ShnUDz5LK1nIRhkn5l8agh5
X-Received: by 2002:a05:622a:2612:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517ca3313e8mr60735171cf.2.1781081735751;
        Wed, 10 Jun 2026 01:55:35 -0700 (PDT)
X-Received: by 2002:a05:622a:2612:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-517ca3313e8mr60734891cf.2.1781081735237;
        Wed, 10 Jun 2026 01:55:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176e1b5sm1154737366b.8.2026.06.10.01.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:55:34 -0700 (PDT)
Message-ID: <39183dc1-5fb1-4dc6-a17b-e5aa48138602@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:55:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
 <cca7e305-bdf0-4ddb-b299-aa25a183e229@oss.qualcomm.com>
 <9ab1340d-72bb-48df-8784-a584a37b5c76@oss.qualcomm.com>
 <91117dd7-91e1-4c1a-934e-1b6717698377@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <91117dd7-91e1-4c1a-934e-1b6717698377@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K_x63y4vt0pQsOr3Rg2tvZEKz0NIrqB1
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a292688 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=3wsk7ZOv9uQ9785ZvD8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: K_x63y4vt0pQsOr3Rg2tvZEKz0NIrqB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX7gUamTgl3e+i
 SRRNIQ1uOUFbgFEypfNDtotYNf78GY/HNfjPi40aGlg1z2Fl6CxFrztQM9CKnuanBYRVp/u9P5v
 G+4bsNBPEqJYsy31hqhjVW2Sj9YyA77C1BNWiQE86H0vvFOSpqlILbh/7YeJHGRyZUx9/9wf/33
 4vMu2v6nQC65Hlut8aBNEvDd7jFE3ZeCnVyWfG4iZErHAdksf0W0pTFSYNlymUNA57sobPojEwi
 2N0I6EOLF6RVEFTuqV/ifzctK5MdPd38a7aXrE3rQY2bWSULJh9wCiCHvkgM9LvtKIUo/IgGAWs
 5FLPml5oPMQxV85N0IW5UgXsZC0Vt7txl17nzKJqLz3ep6zSj2l9P+ERLHLxVR0uO0HTe7JXzbP
 FP7ORKDOvPftpXinuBmKOg6tOjVOH0rZhHBFUX8k9+/4rA9nYZr3O3ntjJ3NXb0qiDdfkAyLVb4
 2GV+hSnUhx+3uQRG10g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112368-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jie.luo@oss.qualcomm.com,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:george.moussalem@outlook.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,outlook.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,outlook.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C9FB6679EA

On 6/10/26 5:10 AM, Jie Luo wrote:
> 
> 
> On 6/10/2026 12:59 AM, Kathiravan Thirumoorthy wrote:
>>
>> On 6/9/2026 8:42 PM, Konrad Dybcio wrote:
>>> On 5/21/26 9:55 AM, George Moussalem via B4 Relay wrote:
>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>
>>>> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
>>>>
>>>> The CMN PLL driver did not account for the ref clock divider which is 2
>>>> for IPQ5018. Therefore, the computed rate was twice the actual output.
>>>>
>>>> With the driver now accounting for the CMN PLL reference clock
>>>> divider (commit: 88c543fff756), set the correct reference clock rate.
>>>>
>>>> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
>>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>>> ---
>>>> Changes in v2:
>>>> - Removed line break in commit message between Fixes and SOB tags
>>>> - Link to v1: https://patch.msgid.link/20260519-ipq5018-cmn-pll-rate-
>>>> fix-v1-1-3c83a173c27f@outlook.com
>>>> ---
>>> I have no reference for this, but I trust you.. maybe +Kathiravan
>>> could double-check
>>
>> Thanks Konrad. As per the HW doc and the commit 88c543fff756 ("clk:
>> qcom: cmnpll: Account for reference clock divider"), default ref clock
>> divider is 1 in IPQ5018.
>>
>> @Jie, Can you help here?
>>
> 
> Hello Konrad, Kathiravan,
> As confirmed on the IPQ5018 RDP board, the ref clock divider is set to 2.

Thanks

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

