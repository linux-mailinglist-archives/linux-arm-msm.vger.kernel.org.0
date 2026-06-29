Return-Path: <linux-arm-msm+bounces-114945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NdbVHrBCQmrM2wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:02:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 367246D8961
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:02:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YZczeFDu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hse4wlWy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114945-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114945-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0DD6302166C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD853B7754;
	Mon, 29 Jun 2026 09:58:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0823B8BA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:58:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727083; cv=none; b=Cucn3DfSSI7Yrbn/uXFDNMr8N8WMnGHS4GI8OWWkbhww1aga5GiJBZUkT+iwzFeEbBMd3doExZCFu3aSqy5V5UtZKZjPEmBteWHwvagTptSgpcfToYoY2iARbkZ5thhlVcVc75SSKX2HAlodpAZjADrFS8i0+s300+fVN3XUEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727083; c=relaxed/simple;
	bh=UpL34rD2udLQoI4H2gQ3tdYpzMAgAxkkrihkmJ4E1dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5Sdnv20kt8+/9hmcPwOD6lznBMz/IJ8xxYXYYTshlTVg1d8G1kQRaMk2Hzk1byQgoURbJttSlCrMgzTdjOJOqEvobtHvJKoZqNG2IqUHOeB5l8QldiA6cmYx6SZG6y9jyNrIfxVxrSOU17VnBqTf2yFQljFC/lvluJtcd2Mn7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZczeFDu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hse4wlWy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aPch2368152
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpL34rD2udLQoI4H2gQ3tdYpzMAgAxkkrihkmJ4E1dg=; b=YZczeFDujSyatHif
	aKFVFLIpBfJwBk1uFUSgRgos0dushc5scUvc211du1/azEl4jT9VuikBTzYgmhb7
	IBJIwWIFXXtkBVYjq0F8GBXJ63KXLm66KaycEIbdRq2QCnCqjYnsDLlGebNQgzHr
	lvrZLWHe9B+wk+q5PcYrQJ2QXyefYO4C2koLqakORE1Jt3A8InX2n/BKFnRXE1A3
	upGhCkdp1SeCkyEwhF0L3JaJ3V1Zsp63vZRX7gw5wcUFB61yfLUiXm8+5lczO5ZX
	i7PZTviEcoHJ+GHiAdh37ytIcmJQ1flW+JkT3vsJv2dfBhCwsOg2eJ5/QDZFHShN
	TPj91Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgramj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:58:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30cb2bcbf7cso2696223eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727080; x=1783331880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpL34rD2udLQoI4H2gQ3tdYpzMAgAxkkrihkmJ4E1dg=;
        b=hse4wlWyLFJRjRMG4NtrtWfVg3Viy6VouG3/n558c3L7WAauBYlk+NEbTzVPMpUnLy
         X15/jkUtjc/xnMf0iYIpMsjoQ2OIbUIFntyfncUQMDNTZIohBrLm6J98syiZLmASIwDT
         NsbRFUHryrA89uF6nnnT1xzeL0O/WvybO2tc//GcD5u4N5b7QoS33D0TRWsHin9aCsz1
         +GdLzbzDb88ou+q334NLQHpRb6QgT3nYJd/Wf8/DPrLEe3H0XyPte/nVFV52eCaSLWuO
         9LPvD/9R3fPO/DmS2OYYEpdk2xjPxjhsSAQBOKZODtGDPL9O45O8aUm+KCnMLrIshMM1
         IBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727080; x=1783331880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpL34rD2udLQoI4H2gQ3tdYpzMAgAxkkrihkmJ4E1dg=;
        b=LcGfOC3CnKSxfzjdA14U0iJx7DwIil+waLz8N2cLTqm8wv4XA8h0KuZretnYUva/dA
         xG2T+2JAsImMVYrh0q7v2uYqvPrSSm6FT3AuppMw3HQfLbc5DB01We6cdF0sYe81BTJj
         UfIUByILmnLZeA4HaVCRGbjfoPZ3/k3ksgDtk3ZZ9woAPKNUbqypIqQ8nvQcKRu82f53
         358AmM099hI4BxnZqjGJdZ6GO8jToftIaXm9d09bCUpOHyjxROWB6g+3HsXq5DZSAAHS
         ya92eRB9f74T50hVcabNyHUxxKxUdiQRHGXJymdOBa4svrdaCvMsE1kRE++VS5dWyER4
         wtgA==
X-Forwarded-Encrypted: i=1; AHgh+RpQ92ZSlOIgUkzuIzrVa1EWD2yVE9qXVMeTpBcxdQOrh1/J3hDFmGhfDMANmpebTE49buEcL+X7Q+KSnDff@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9flo7Nnuf6kJOHxe4eSbmm23CZwt8tpAJ1Awp79I7ZRjF7IOt
	acg4uTR/DEZG2SPv1oocDUBIhDtiLscaWcsmS57cN+rIxroHSVD+k7JiIRkyXCiK17WMOjyF8bw
	+0hPoyOErSNoAPaHL5vx4bW/A4mXwGoDpu+MBSreAEW1VlJ5dHvVvKn+bYirws2ctx9Od
X-Gm-Gg: AfdE7cn7Tbf6Ycws0P/0CSx/MVWNfvXB0bizUv2XYBKeS9YhvivEAp9sYIVxiOBmUaT
	TLiXmQ7H54FP7ezerA+3c5HD/vrmaXl4hZEu1Sv6lJHLbNeNSJTfMelvYke7AMgwYe0RPtiv4Dz
	OAVy2OVEPhqJOWXJgKXC8WiU6vXYllADYaIszrMS5jNSdf4fOtT6dRnB+z60c+iRID0yyPXBNot
	vK99YzvZDnq20CWtqeVPc6tyKzzeGqlgjOwQS5oGYqiggrdscb/qAqUkZBLjqWlIqSGbgOsaMxR
	KAkZ3nnlLmVMTdJwsaGEEDOHTdQQaQAGicMLR0h9f5iCmU8+bRaOOFdlibviL2WHlvvrRxyqZvs
	BDUWaY7o6v1oQCUla2z2lKkVWyDW+wGYpQljI+ek=
X-Received: by 2002:a05:7300:e6c6:b0:2be:833c:149d with SMTP id 5a478bee46e88-30c84d46fcfmr15329698eec.28.1782727079708;
        Mon, 29 Jun 2026 02:57:59 -0700 (PDT)
X-Received: by 2002:a05:7300:e6c6:b0:2be:833c:149d with SMTP id 5a478bee46e88-30c84d46fcfmr15329679eec.28.1782727079117;
        Mon, 29 Jun 2026 02:57:59 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ae5sm51878668eec.16.2026.06.29.02.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:57:58 -0700 (PDT)
Message-ID: <239c93dc-99e7-4b63-a3ae-77770bf9df38@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:27:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
 <pqhrgjj56nbfsfkzqttlivbxpdsfzn3ifmh5s6fczeiudlr36t@ts26c3u27k6n>
 <e8563334-e53e-4010-b7f5-9d61ef55bea3@oss.qualcomm.com>
 <CAO9ioeXUJhTgYWvqz4xAf_yV3n0uOvcLT8ZMYPG7wo7tq4HabQ@mail.gmail.com>
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <CAO9ioeXUJhTgYWvqz4xAf_yV3n0uOvcLT8ZMYPG7wo7tq4HabQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vfQ4KzrpcvZRxfL6yZCB34wR-ZibKt5Q
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a4241a8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Hj43y7qRzeoofFXst5QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX1K0W/sGeH8FJ
 IxvnVmIHc7Z5/aEqkpBwQ9sPV5aK9f3clQ0/XQwucmocVd9nPGmDMe+z4mYdNLMEg3rSmpV69iK
 xlKS7Y3CY2+GpVrXdMIMoEHJzoC2dIo=
X-Proofpoint-GUID: vfQ4KzrpcvZRxfL6yZCB34wR-ZibKt5Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX+D0bH6O0uEMt
 qLehGi1yPNV3AIAsKgG3GA/YbV6cqt+fMoio0QZ4iI0YDoznu822Jy35NcACrezCkY93txGCjJ8
 SqwlauKpMiutFqFPid9MZxBFxlI3gm68KfN+yuUwxdqRys0tQp09TLt3ubId4ZsKSRitx+nHr9J
 sgwrZEM7c+Jot+a9urFOMlXLvw2q6rJ1tSFYMYTyRP8f+7sMlV11HagzsIdhvGu8yvv3Bd19a9w
 PXCeO2QL868UJs1xTJPP1mCEVT5jCaHUjAtIbThxr5N011SHuHIpDcJerhXiQ8dWvRrK5mtv6D9
 HVHBI9H7czO7Y7qzJHCEOIAgXOZwJyuGF5A4C1Zl9PZPPBnYCx4E6nhHwacOLUDkqfPcNbR+hYV
 ANnc+HCkmBrOgmJJYrjVN2PB/EohGFiDzOyI3/zmGUAEGIvWfpbgw/YVWb2DM56ZHBMRDm5vnBy
 WG/j+TjD7HdEyaRAuvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114945-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 367246D8961


On 6/29/2026 1:45 PM, Dmitry Baryshkov wrote:
> On Mon, 29 Jun 2026 at 10:22, Nabige Aala <nabige.aala@oss.qualcomm.com> wrote:
>> Hi Dmitry,
>>
>> The patches were developed by different team members based on their respective platforms. I have consolidated the patches across all platforms (CQM, CQS, and IQS) and shared them as a single bundle to facilitate easier review for the maintainers.
> You didn't answer the question though. 'What is missing?'. You didn't
> add the Signed-off-by. Does it state that you don't know if you can
> distribute the patch?

I can distribute the patch and I will add my Signed-off-by in next revision.

Thanks,

> See https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
>
>> On 6/28/2026 6:00 PM, Dmitry Baryshkov wrote:
>>
>> On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
>>
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
>> board and add the DLC0697 MIPI DSI display panel node.
>> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
>> for DSI PHY PLL stability.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Oh, and I nearly forgot. You are resending a patch written by somebody
>> else. What is missing here and why?
>>
>

