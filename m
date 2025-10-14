Return-Path: <linux-arm-msm+bounces-77120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D27BD85E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BA86192177A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BFF2E7651;
	Tue, 14 Oct 2025 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LScykKpt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852842E6CC4
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433248; cv=none; b=GlCiySlpPOhM9btJqd4RxpsOU2lAXWxyFzCGRtIgb1UyQf4SgaCwwsqKK8hiPBLooQ1bFvNcl0P+oAunfXPRTaN2ppEHe7EJ4w6foL2H4tPO1hMzDLEVXUi48rm2P5+mlj+gosPhmIBZZ8EQtDG5xbRMDuCJ2Bhrbj0XJa+Vu4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433248; c=relaxed/simple;
	bh=IEO5GJ8C1882uGhUZV4QiuHcocIcs0hflxYhOMUAtfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=daOCu8FEntaIR30bGk7pvHSbG9IXvbPcu+AAq5qN9PBUlAQ7FXHjPP1kz6K3BbCU6HVJcRJJy/zmNKPwp5TF3v7boC2Yzl/RTll01EcMs1D50I+wUheFvHSHZKMhDBS1FIWOsJ7ZIGpj0CZMKYpw8dnJo/Dw87ldte0rVlj2+F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LScykKpt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87LGH008575
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FZxoGMWjRHyp3BpafyTGdmS0MvS+yG7JvkclL1HE0Ys=; b=LScykKpty6Knmini
	6yKFH1hoM9+2LcSzxAtOsKXSYCs3j8VgHUutPfE+mZ1nGboSc+jESN0v02cUi7h2
	HY/YjjLEfvY1gooUBEtf26/kK2mBcs7v9trJ4ibJMJqJVQTTYXXgcviN5SBqv8e3
	ioQyF3pek2zGFhlnEXla/VCr9V4sTB5x3v93Qz2doPjdnSLcd6jrqzycg/MmTq4b
	Sdn9XQ8tu3mG81w0H3b/KXZ9YiI2zYObGKY6lFCPldByQCBpi9lf5Af7QEe4aWKA
	6BWHv9I9yBRudd9DoOCZkBDhR4uiwz6hSC5EBRVnSmlTCkjKLGJkZms1L9TDguU5
	i5O8Kg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt4phd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:14:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso14492242a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760433244; x=1761038044;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZxoGMWjRHyp3BpafyTGdmS0MvS+yG7JvkclL1HE0Ys=;
        b=vTKHGTDhc2WLWug6uIuNAqzRT2Gl6xqhxBediVY1a+1ARNC7Rw6qm3KqxhwBrMUK7r
         +rh2vtj3KNOyWQN+yPkkfxlySdy/wIRheFQveKTElxNIkFqRqGDIWbxZJzOEdVX3MrTY
         OOXn1x1TPF3/NRAx9yytu9EU3Mtl/NC89tFFHvKHI50JQSAqTMsQZAJtMVJeY6Vu2oEJ
         Hpo1zJyJ55oq6zSzliiTxDfzbLlY4LcpcCAFC09trNJkkdNgHJFwXG7vZs4Mif1AIEi9
         hkDsYhj3+3VYeUB4z5LvvQw3ckrVk4gMXoIZ8Pk9ulzW2h/qMuGaom7mWjXeQQ7rLUUf
         CeVg==
X-Forwarded-Encrypted: i=1; AJvYcCXtA1cBGbTiYtcyof5dDFGte6r1TeOrsOxN4ou/lXEz8SzPxUiIqjEuNPTmw1CJ43YJtDqBUEzpzX0aHxjR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6bJyBuJEShqzWCxfzNe2fuOjzwbMVzpOvu3FnqQc2DDXFQXh
	lXP4xvciIozwEdOzcTaYGY+YpvSWTotMbjHH+saCQfQmqbQu7OKFSCAZUZoTVB85B0hh1SPcMEu
	jdyVN52sAWtO/sEzL0KsO3OGxZtIztJg4IhKt29+QMQLicDAB88glzHcIIdRLGhDGhTFd
X-Gm-Gg: ASbGncu/hy3sJp8LGjHwt4h8W5vRTRMH1i4L7L/bUS8vLHqsGPjyHDzAU6XXlTP0THT
	7IMMXfHdLi2fyLDOP2QgeOJnPazF9CFQKbKwAoWSh0nQwBkBpivDL8ZJo543z5LpC8vBh8GplSU
	lxSD2lxJfYwniYJPnp8JJmO7gLXa3JJUl0csAjkbKo0U9NstDPjDWqa6TMnG7dpwhG0KF9ScNL1
	BTgsTQCffNkBtUtBmrPnu6parzaVUSKUNMGonlO0AWrjQWYrohQm2DOK6YLDsNXxmMpSyA9IrGU
	TY0buZ9FiFNhpY+5Q7krI0S48wNBxZbIfhyeaBjIlXLeP/isUYMtA9IILu5T0geHrHBAKD3Z
X-Received: by 2002:a17:90b:1b11:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-33b51149231mr36293139a91.7.1760433243889;
        Tue, 14 Oct 2025 02:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxl1mdYLPfjFXnyezI4s6jG6hmqyysfKVlYnjTAiWTUfifmOTrtuiwT49TasynB4ClpC7Zcw==
X-Received: by 2002:a17:90b:1b11:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-33b51149231mr36293102a91.7.1760433243386;
        Tue, 14 Oct 2025 02:14:03 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67c6040d23sm5097761a12.38.2025.10.14.02.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:14:02 -0700 (PDT)
Message-ID: <3802fe42-0c94-8c10-7b6c-6c3adf863ef9@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 14:43:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 7/8] media: iris: move common register definitions to the
 header
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-7-def050ba5e1f@oss.qualcomm.com>
 <b7eba4b5-1189-7506-4767-0ef3234fc6f2@oss.qualcomm.com>
 <dzorzudzpjipvlkwik3uylomwi2dy5ticxromzegzgi2jhibot@reqv5ul5ifuc>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <dzorzudzpjipvlkwik3uylomwi2dy5ticxromzegzgi2jhibot@reqv5ul5ifuc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gFSgYkFxQ-kPOiInBWaKRPsew_EQfZVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX6Bi9k3lOd+vW
 yo2N5KWjXyIvxRMBK8hjoZMpwIcjYwoN4B+XoNAuin6v1r2ohJ6h3syFx9DO6F1qALHa2YEQAuN
 AaIW1ANT37x+M0SCT72REVJcvF0TeICNa/V52d1xAyfQDpAGGOkNk9uS/W3bo1tv3btxH6FP6Vw
 NWaiy/JUq/x+TJni9vUOPjVbLt2EPr5VP2oClIC9+SMSnv3CAKFoe4BrDQWNy6+geh55v0qLMnj
 dFjQHbPgnNCV6opb8nPpGnnE4XsE3+t4gB+teqTh8gifBnLIGHoiLdTxP506EUXNmrqO/p7DJ2y
 zfEEV3lNIwcJ3/5szXhOadGo3KkhvZWXeMi9ITpAo6j/SoaikyAN4yVdyDIMlCz0qeYU+J/zfOW
 JsoQmYfY0L7CJD8FM0ywZVZbj/F3MQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ee145d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5uaAGIl7Ed98QgTpS4IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: gFSgYkFxQ-kPOiInBWaKRPsew_EQfZVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022


On 10/9/2025 8:18 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 09, 2025 at 11:40:25AM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 10/8/2025 10:03 AM, Dmitry Baryshkov wrote:
>>> Simplify adding new platforms by moving common registers definitions
>>> from VPU 3.x and "common" file to the header with other register
>>> defines.
>>>
>>
>> Similar to
>> https://lore.kernel.org/all/20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com/
>> ?
> 
> Yes, but moving more registers. I can rebase on top of that series if it
> lands first. Or I can just pick that patch into the series, to remove
> the dependency. What would be yours / Bryan's preference?
> 

My vote would be to rebase this one on top of earlier one.

Regards,
Vikash

