Return-Path: <linux-arm-msm+bounces-88530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 141AAD120CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DD283055E05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A90234CFB4;
	Mon, 12 Jan 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SX9BlSvD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcdTbA9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ABA34CFB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215033; cv=none; b=ZeO562WuTmOj3OYU0V5Tvx2T9IMwkQmFlYWlr0JnUqGHc6tLgGa2gL8VUjT9Y+MZx4UkKR+XBtFJIK1+BrGCgNNcAqNn40PcE2uNaqyyiVMGWpx7wo5UOfA036Z+RX8zrVP4Sy27XDn5Tqb78vMbuFHGw8KdQzU/UqbtuGSQO7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215033; c=relaxed/simple;
	bh=IsVLehBJVBM/orD1WBarWA8J7vougmiD8pCLYq7MD8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCBrB1dosHQppHnTkt8kDFUm4QqzlDTLnl6uEegbKIhZ2JJ1vZCojpzqC7j1G64R0eS0q++GvAWtT3fAPAm3CogmuVNRZ4UmF8JaSMVytSWLlY57C/8bwM+oN/UFEfRY66uA3GR0PaCBWW5bGHTFJsgsEXqJq+teKmr0O+g/hXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SX9BlSvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcdTbA9k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C84cWU1101915
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RaJg0AmfyURXApjJzRfjkDyyCkO5N/CSZAYcqWNPbf8=; b=SX9BlSvDmyGmmbbi
	39gOlE7axdnS8WqnXkubmeZ1g07CZeVW966BskNaNrs3o5vPH75ZrJCtfMj3PBHP
	4lU4Pb0faFo1OmsRtk/NLhyjvzoIHyYc8Q9k/gXIP880c1hWnlZ36SBq1G98jMDA
	kSk2efWtpcJt9VxnEUiho6lZwkEg982+2bCJV2gPfkzaZg1NYeijzVXpetSz2K0z
	0G9Sy3LHaqyimcxnsi0RfhA770vsqePei813bI+d9AgxYk3ZemqhewIRVdxsH9Kg
	xFQWvMQ8g2f/I3KxU9dvSNpg8qzCoZ8Xes5NJM8SJy/sVCpbTaqGXfN/d/2gQkaB
	BwmDUw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfvk17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:50:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ffb8ac2cebso10709771cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768215028; x=1768819828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaJg0AmfyURXApjJzRfjkDyyCkO5N/CSZAYcqWNPbf8=;
        b=XcdTbA9kRockjeqRi3+y5MlpaU3S2OYWfA/4tL10eBCWDsZa3TA3qTyl3fnDDOaVlV
         w9ULRdirg2RD2S4IM3boybajRAwpbWCqdxpixTO8Xm7RzTHiDauTR9LUWYKkcIMlazRB
         WohqWkqcQEI69w3t/DVMGjUSU9Ei4DX9eJOJuiQumAX4TljTcopieEq7gcWoYoEI1zXs
         UvfAAU3pXeV2/YzGcURz7lsO9SlK6XNDBiTNDx3vrCwV0tqjBBbDaTVcrhtLU3TQPFhH
         CoGJ4ql+wmWqnAdBKJV33OI8Ety3ExyAhjib2jCPQNDWJZ0AX+fO1rJdGNRTJayhEepa
         f42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215028; x=1768819828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaJg0AmfyURXApjJzRfjkDyyCkO5N/CSZAYcqWNPbf8=;
        b=O6mMQnSFmYOlbhjTl3r7QVLJumHqA5xc5gZZkyYzpVl5xa29FjLRrF/jyAXPJdcVku
         iBN8iYRm7UNcEiaWKKTSclD+/i5hZSxFF9UalacsgeQhO8Q8CJQ6f43HPzgOQ/yVDotj
         wNnWEoNBGyxdwgB3TX22Hwkw9RPmHZcGqu9zm3gYnjREE5YgfTANF69rl4qwbP2CBjvB
         yPbeAOrg6CaRIZe/1nE2ULTEju7N4uJI43oB5xF9UoIbcG/B4QGz4WfHrJlfucDnhJNR
         L/mgi1edfzRo+BDcxl2VUQulL+0ZyCmGWDrJlBeoWjUKOCE/97Q/R0n+b5suqsLggqDv
         obrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj5ikKjcKq5cCX3mpullc+1x4GPsUdJQaFEKUBa6JS/GFZsX32PIGJLnbca7qp85kWbnm9DzwLlpj9i0HG@vger.kernel.org
X-Gm-Message-State: AOJu0YwAEAFiOeTdv2bYn6yLRjYbQLxK1c94ADKwG042qlMap/CtOYGX
	5dvjQL0Zycje+CH6FnCKp4LGGIxPexr22y/3LLLGF8YNy8Zdt5oLrxTKiohfjeDTGIyuNFvbM/d
	L+IMF2zyS9qbWENfPbIix445+4LP/TULQOXc1auGmrbPyEvqUxyzvC7OWcOR44ntd/euQ
X-Gm-Gg: AY/fxX6BRgqxLbaQIP3EQYQrLATcit/rTh7jsDBmugRSAs3+TyTXCVqlEvWMG4C7f60
	hQ5/NA1+UrBGRIoK3imMmBPGZBp3CZ6Uxq6sZtzdCsUswoWBTJZUy1yHm4BWa961oC93hH6fzLl
	i/svAmrdOB97dxjp7L9P9rEAclQegSDBRpRlqiwGntuiVKjaAGl7g52nOIsWKn+LZJ04/1XuzuU
	5FLCU01mLVLWzT8YKMF8EaYlA0YZQGfhDKZQISaLtnJKObh/nwLEHnjT3gNAaxax8vO38Pfi5xa
	zx+JYxQZIbsaJwXX2uNPb1jKUs1n7mBZv0RkWhQzxbpMuI9q01uM4spz9PPiDFslPr2bYWQZnXk
	wyjFp2IKmOJGHVhI0qHVdd7oyH1CO9AHAJjGWAAelY90YrapElcr5WQ5kEnk83Ejz8xk=
X-Received: by 2002:ac8:5907:0:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4ffb48df384mr190727861cf.4.1768215028251;
        Mon, 12 Jan 2026 02:50:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5NQP3feSO4kjE1u0NdMpWXYwUnNSeO+Rz4n65pYElDW7btJLDWaGKEDRVsw9BtjzvawpqiA==
X-Received: by 2002:ac8:5907:0:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4ffb48df384mr190727721cf.4.1768215027873;
        Mon, 12 Jan 2026 02:50:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe60sm1893326866b.45.2026.01.12.02.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 02:50:27 -0800 (PST)
Message-ID: <2f0d6bd9-0786-4445-94d2-5189f6b44d01@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:50:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for ECS LIVA QC710
To: Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-6-val@packett.cool>
 <wyqml5ywfzwh3uulp4gzlfzx24kb2545w36pkpnz5g27xtnqoi@yywysi37tdor>
 <3dd54179-7a22-4596-a6ef-224530c4b2c6@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3dd54179-7a22-4596-a6ef-224530c4b2c6@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L3z5DwXmj4wdLjw21KYo8Z5cbnVS3gAd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NiBTYWx0ZWRfXzsQrHElj0ZGG
 o8bFrLNsVqMyOPCgcl4YZl5npRggQar2PIKFrIX9kEXaJ6yWnWOJ+Ke9om/gnPwViKKHuMZgMMT
 GhTbykiX/Wk9hoW/mZ3qIZZCRwMkE9iyP5unTGDwhTSaNsGGu2DC8IEBuM3O1g9Kav3uMbiuouQ
 jccpQKPisThfr9J+yj7Xc1mIfXw5pZOtTYyvJi5mHc0TeZj7PMrVE75c9hs2P4QdLcEn6ws5beE
 Oxe7xZPksqyB4QIKjIom0t9F92Hzv66EP2HtZr05JYEZSQ1MhmjAaLLr8DWIMGccfrxXVuckkPL
 xUR7jfh5LLzfu+AE1raiQE6lC0RyovHvvB37+/gRxxBM79Hxv59o3zC7fngnZze/0P08guVZCgj
 H8jKSFARIUnrnhyJtxt6KhCrr3++K1vJDszAkr8kg+NN/llLy4t06p+4flJ3I884QqqXqtIF/JJ
 /iCyEfavl/yuoj8fV1Q==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964d1f5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=4wxxkzZ3dqSFo71sv2EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: L3z5DwXmj4wdLjw21KYo8Z5cbnVS3gAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120086

On 1/12/26 1:31 AM, Val Packett wrote:
> [resent for the lists as plaintext, oops]
> 
> On 1/11/26 1:50 PM, Dmitry Baryshkov wrote:
> 
>> On Sun, Jan 11, 2026 at 05:35:12AM -0300, Val Packett wrote:
>>> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.
>>> [..]
>>> +&dpu_intf1_out {
>>> +    /delete-property/ remote-endpoint;
>> Why? It should not be necessary.
> 
> It seemed to be implicated in annoying EPROBE_DEFER issues.. But you're right, it wasn't this after all.
> 
>>> +
>>> +&pm6150_pon {
>>> +    status = "disabled";
>> Do you know, how is Power-On routed?
> I think it's handled by the EC. Keeping this enabled doesn't make power-off work, and doesn't make the power button deliver events either.
>>> +};

FYI I don't think a modern QC SoC can turn on without PON

What do you mean by "doesn't make power-off work"?

Konrad

