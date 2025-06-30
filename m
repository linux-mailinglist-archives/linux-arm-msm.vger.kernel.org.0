Return-Path: <linux-arm-msm+bounces-63115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB723AEE6C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A7B917EA4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 18:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3241F1E5B62;
	Mon, 30 Jun 2025 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2x6xhRI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907191C7013
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751308283; cv=none; b=ImQ32Y+BeE8boGB5dsvcRQ/j2XwdTa5q3T5SQAQGoaSlZoydUB6q4GtIj0l3+ea6aaTkRgLxNBDiWmKGve2W7JESe4PNlCcymv3W+sg6Q0xWzp/RAwXe/RzmZkpG4JYuS5sYnZKvs1gLJbICXTDx7z9j88jFPbqhUOxFOgkKdwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751308283; c=relaxed/simple;
	bh=FLtyhUbuA2aQOuNKgKE+ET2SDkrsNcWeb+kVrzNOdsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMvFpH2uklXLNjNm7DIjZ7pVRLctJ3boYXHdvbGk87GUoq8iVB4r+1bKMDlpx05w5xFzK4RddTS0BFkg9LDb1kmxo4f1iFyoMOSG5auslPq9JouJ8dkoOIAB9Tx9bRR8yU1TUmP40NekMzCk9hDMPZTadnqkhZTn6JdJbb/qiC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2x6xhRI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFCsQn032109
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzGsMAPEQiSZ6GBpzbnmC6RxIkkEvbmXR+O46b196/I=; b=o2x6xhRIr9wXcPLq
	qOEp9gzGF1n0nfI0DpQB0m1wx1HRns6vbL1qQ9Giq45ujOZ3SOuJERKB+32CryCI
	oRP5FTEGtsqGIpT/qeiXoV1XQl0CNRFWf36h2TpwG2IaSmVB9CWr7+s/YDpPSAq6
	uR29rfcpJXiXbEqpVYrFhO6vAaQjF3SJ/GD/Uw3a1F7bZiw10eqdC84AAFv6MHst
	b7hMpjHBb51/RfEsn4MDsrRM7L4o60c4QzT0SBHegYD8llp8yG/PNcbsIJ8lQYD4
	2tvZpZxiXm6NMIIB3yNXO4We6EMP7qZaTDDy3NZHqcPqhZQ/3qSBSg9bL7pRzJRE
	9JfNlQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k5yy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 18:31:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74858256d38so2301373b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 11:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751308280; x=1751913080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzGsMAPEQiSZ6GBpzbnmC6RxIkkEvbmXR+O46b196/I=;
        b=ZgxjAqSkpOjvvEmLDdYoKtbDKwdTIVzfxSOMQhMk159y3kgi6A+Q+D1znFZL3JHV52
         t4yDVtlE/zfUwy6ad5UtnJe0Zs0MyurP/ydT/c5IJFSUizqW9LhVR4NrqCEFF0NHBi7W
         3JOi5ihx3KtKvhkdG6W3VuwXu7YY1Bcc8cl3c5gQsx5bXZ1aK6cZvq4wxKY69dHA8P2e
         P5JS5NzwG+pjNR5tZsqY9ASyzZnF8NZ2r7CcyQ3QltAm6ffQkkFtZM1zbIHEnvtTvXkJ
         XQL23G7L53uuf4x/3iK9Xwp9/HPNpCaA641rAIfVhEHt4+94/Te2Uycqi3LrB52w06il
         PQZA==
X-Gm-Message-State: AOJu0YzrcCa5fHvISP2yycX2bWe7QzEcaIcJMXmcCEKP8UQmwsUC3XoQ
	XDYD9C8aTsauTOUmNpv5J/AfUjoLh9bnUps5OAiWVV39yq0B5fFsAsrK+LRwXQhoHSpgRejOvcN
	LVKBzRoyRwBdmfQWQxWF0AF0wtIOh9bELjwAz6zphdK9jgla2AsWrVTyzmTddViBdg89F
X-Gm-Gg: ASbGncuFdYF2CHtjRXf366FhCVKPy8Qmg0EkBzDDNqmLIRI+RW1TnLXORHwjC+5plTP
	WMnzPT1PalGnzHRFP1KQq7zZy5GRU2D9O333fsi7yxCT/apwmNHwFPwICdzvmYSbNRBgn9d6W4w
	wBXv9NK+9toMfg+v8uZoI75R/a0qn1c77Nncyq9H7jbq1KstFZ2glVxj3j29wJyzW3ESB/3+LQw
	Iep18LJTEX/dW9rvLPsHfQJkETNxy/uwCAYYTjacSfhrimFy74KamhfCINNVqLESZQvXq8ZP23n
	y2pNTBD3TGfqbDRk1/4W3QOaS6Rqlcrf1ZVo4RFMIJ5gtdIc4bxhu8otzLI52gkOZptgUlXg
X-Received: by 2002:a05:6a00:b4b:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-74af6eab8cbmr20654060b3a.7.1751308279648;
        Mon, 30 Jun 2025 11:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxSWLjq9AlGyMrnNBvFpeMkF/I30ekWwyE03Ri1IMvjryC0GFnAJl7hAfryAjdbrXswhyw2A==
X-Received: by 2002:a05:6a00:b4b:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-74af6eab8cbmr20654021b3a.7.1751308279188;
        Mon, 30 Jun 2025 11:31:19 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56e8789sm9539234b3a.144.2025.06.30.11.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 11:31:18 -0700 (PDT)
Message-ID: <4396deb6-049a-4649-afbc-fd20986b118a@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 12:31:16 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end in
 _driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Agustin Vega-Frias <agustinv@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <563db91f-3080-4a45-ba0d-04f415ed90d9@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <563db91f-3080-4a45-ba0d-04f415ed90d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6862d7f8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=IpJZQVW2AAAA:8 a=p1q8K86rv7LwV1BeAAYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE1MSBTYWx0ZWRfX3Wh6yhjxqSG8
 OasuSa1br7Z1cQKdQM64i3Vl/cqtAuFHHIKInXJRXY0Y3QYy0AtKCcnzYhifclCwSXxVwC1wJS8
 v79zLUQUwiICmwyVzQ4ISAVfGKKJbh+6rQNyUuQFFGs44eOu9EwHPHvZ8AR8NIph2YnYLRPQWoa
 yCm2cz/sgEgSMG9MN3LFTHgFn4v/7oNXYY550LN3Ynkzps/83G5N6ak8tlvDwigwR+PVBm3bVxo
 jxbaxXZb8BCOCuzdVEH90g9y+ZMWKyKz5oW/LQK4fX9JdpAJ+jjM8X+GhyBeDOQPEJw+gpQcmXZ
 2XO5Cy7Z7m/hKua2RIpSo7tg5xslSwglI68wkKOqJo8TM/VssGZ5ox+2+a664PI+Dfgw/LoGAkQ
 1TzCrr+oEWjvTC776cFV2oeLV/NtS7kxiTYi+/pQ4fsWBcCclI1gBTFUusa1cTXnpLjVCtb6
X-Proofpoint-ORIG-GUID: LoET03qLTg78Cvz5AE1waXOw7PqbMF1j
X-Proofpoint-GUID: LoET03qLTg78Cvz5AE1waXOw7PqbMF1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300151

On 6/30/2025 11:25 AM, Konrad Dybcio wrote:
> 
> 
> On 30-Jun-25 19:23, Uwe Kleine-König wrote:
>> The modpost section mismatch checks are more lax for objects that have a
>> name that ends in "_probe". This is not justified here though, so rename
>> the driver struct according to the usual naming choice.
>>
>> Note that this change indeed results in modpost identifying a section
>> mismatch in this driver. This is not a false positive and should be
>> fixed by either converting the driver to use platform_driver_probe() or
>> by dropping __init from the .probe() callback. This problem was
>> introduced in commit f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner
>> driver").
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>> ---
>> Hello,
>>
>> I don't know if platform_driver_probe() works here, it might happen that
>> the driver is probed before the matching device appears. As I don't have
>> a machine with such a device I won't create a patch fixing the issue,
>> but if you have questions don't hesitate to ask.
>>
>> Please consider this patch as a bug report and better only apply it when
>> the issue is addressed to not result in build regressions.
> 
> +Jeff is probably the last person on Earth that officially has one

We are talking about QDF2400 here?

-Jeff


