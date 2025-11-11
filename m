Return-Path: <linux-arm-msm+bounces-81205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F63C4D164
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 049D44EF38C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2A12E7657;
	Tue, 11 Nov 2025 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfu1Ayng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IR2JBGjl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35153491F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857070; cv=none; b=McH9CkngKGu0JLt/Fzn52V3e6CbJVDKig3Bjn4Y/3bZoQeX41comLlN/KPUKBM+jORmcPQPRO9qR2MNkWJbsB1haz/r+qA+S40nik7IkeH76IZQ48Ev63RFfwP31RbXHHFPfQ9dAeYklBNHgs81/U+l15s+fX/5STP7AM0d6lBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857070; c=relaxed/simple;
	bh=D/ks/HjJ2UmBeeXdNzT0qyT2BCDFWFNaVq/rqrdOsjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ja/Y+pQ1FsfIvngNzTmTMTaXjHG8KmhuDlljLKUhi6GvEVR5soC0YTZK2u3cNzgLPIaSuVtFvFOuUSpe0678LbQMVzPOlLl7I0UzX4l4JFmZpmkLd98jYlVuZ+1GseJz8udSBgX1Tt8Ppkdei2CbrRjgZprINIdM6+E+/ChZQrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfu1Ayng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IR2JBGjl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB71gsR410353
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HeIjk8zjDMvtq1Ei8/4B5m73Be/4tVAGo5hOoCO2INs=; b=kfu1AyngoTeYb9uT
	NJJ5mnNQ0m4jzxYcr2AcPYnq2RI2FyLVWi5uouZF48QzWX/XUZcpyozU2wYi5Lxk
	5qJQejfo5ntH1OkvSAvCSUTiwlwEpImmgnTY7/eaqEWeDy8m64H+W26OLLla9w+7
	x7HBGlQzgJqwhwI0ZOMnKznAiVZsrBNRiCeHINeZgrDOh2qIE8LXGw8GPeJZiuL9
	NJMwEojZ4GYZ0/0ZpcB3FUHkGlm+7w//Av7xL3k77Hd9i/enrlRBudxj+3tROWSh
	fB16r8+wf69n7cS9t5FfLsT0+XIPKh32/CqF/yN2HcaO8GUG+RWnlfqyf0L7wJbn
	//Z5Fw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abppu23wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:31:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ce25bea3eso4457165a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762857067; x=1763461867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeIjk8zjDMvtq1Ei8/4B5m73Be/4tVAGo5hOoCO2INs=;
        b=IR2JBGjlny9+N8ojx+6JmG1ZzrjJ8dxJxT6ENYhaVJKcaouCLTXQk5qThk0jfr87Ph
         pUFr5HiGU4TjFOG/r7mUSVYiImAc0s0/lk8x76pJESGDwhUphcVzHtzeuCf0pDm4GSxI
         sw7o1tNn9Q6zLYtH44Oj5we7/d+v68a5lJiMB326V3he+euxVJCZ8EP7KUoO2zaHyPLC
         A3nQw6BFflo3oGQ/nr7mYirpsamMUYrrwqNJ8GXlli66I647IBVSSl0gNVAiWb62p4Jm
         AM4EOCFg4XPq6313cY02UxeEUiZSpfofEWA6TN8lRIOq8ViDjoUD9RS2Nkm533vOQ5NP
         b8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857067; x=1763461867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeIjk8zjDMvtq1Ei8/4B5m73Be/4tVAGo5hOoCO2INs=;
        b=BAhRhQyzgLvSFB4C8kyCkSPJUSptJBfQxNgYdt5yM5LYaDkpcWVcr7De8tVyR01J1R
         89RyIHWpiCeQsItwx3Yz5KjuxYqRTx8QE9pNIbxGE7GDbxWKr9t3ukc27eUN1N3+zlN0
         smu/YULq8sF5++bbB5SDar9j0KaF+UsutSZrhD6bKE+2uO5BUJcIs/4OhRT4dg28hZQO
         UzxSNANQ32t0QVrdCkQQGeyIdX/wZQUxvxWzmsQJ6MQzD0tEu8NGKnw9/EqZLy0St2gE
         /oWSBmMVtuApPm5EJ6oUyJbehqV8E37VDv7gu0d0GfALduIrEaaOrC8P/Rtc/no2h8mj
         YGaw==
X-Forwarded-Encrypted: i=1; AJvYcCXv0ds6H6EIjZwWhttMUj6UJqvY+K7dyTZvCyUbG+XoVV8hVVlSZmf5ttnX3Q3tLCo8VrcP71y5ldcJJprw@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYZpAuzqtS7kOqgzQ0UeoCKaYNKlDagJCZqaMogU0whpWvJKU
	9Yh4f6h54uEhs5U5uuTI8yt1mXjng6B4hU/rE6exjGZyKY+hg5T20+OqFt/n7EYsPZIXb+bF8va
	8C8wLGRsA94CuRgfFm0Pk4nXghLnhJ/qp/FMo43uvWnJ1Znpk2ELkP9o8FdbAJch7u/cz
X-Gm-Gg: ASbGncv1th+FsEYQGo6zkuBAoB94tH67q1bROFQwTGVbJiKU0nbvxOfo+mf3ssJ+/2u
	0crUkjjf1xo7qPd1jL8QkKagVfTYXJD5hSvlkqLpr7TDyem+XEjEyKrL2dQOPwzmLQSGelB7F1M
	3+HQcCR9Yj+tcZlC3hnpt5+MgXzEbG+TNYC5YiGXsypcy5hMwqohZ/Y12qU+EsG13e+q71eZR6P
	HmiOWssJqbxmgyO3gvH4YUb1bwLY2W2/X5BrVSeUEsz/aqzPqtqwuzlXYSHb05OSc+/Soeg/2xV
	aD7aOqAto/2l58vlf/i7c82wRbFS9lDP9e53FXDvP5OTtrZTFdAdNRT8j9OLw+qIqbZV4tg0t1/
	IBi1KpPjYiwxFmhk5RhvAQjcceAGF
X-Received: by 2002:a17:903:40cf:b0:294:cc1d:e2b6 with SMTP id d9443c01a7336-297e56f995fmr165404195ad.59.1762857066526;
        Tue, 11 Nov 2025 02:31:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEewwTQbqnUSdI6gBxX6IS/CzZ1xkFA7zvK6fqr4+b+3SthTOX4KV5cdskV3QmORTNpTCngvQ==
X-Received: by 2002:a17:903:40cf:b0:294:cc1d:e2b6 with SMTP id d9443c01a7336-297e56f995fmr165403695ad.59.1762857065992;
        Tue, 11 Nov 2025 02:31:05 -0800 (PST)
Received: from [10.218.50.9] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5e5bdsm175441995ad.39.2025.11.11.02.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 02:31:05 -0800 (PST)
Message-ID: <e8cbc5e1-4159-4d22-b7d7-5b9b6887dae1@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 16:00:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-4-a774a587af6f@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-4-a774a587af6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TNVIilla c=1 sm=1 tr=0 ts=6913106b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qUnW8hDDCxEGPathPCkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 8_NE804kibg7IunwamT2ceqbwBixpCNL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4MiBTYWx0ZWRfXwz+iaDfKPUCp
 /ljTO5fTUChsOndYfH9E/0nAp5xB+URGyYLY+xw9KvXmr+64bL1bOhZnzErkwNNVtfQU47WxFp8
 PS8m/ZL9/DmLI5HOagWqXTcV3DrXvJNJK8vLXGK9a9UymUa77Dgj3ZUsZQNYzLE/G3wBHsiB/4v
 FxP4OJXrm8BMLuAyOSlYPisunI7/nB05UWPgwshgvyxDGK0gBjRxBhrIXrndURPhwxDiyjY9fJh
 UwjkWFSWBaLyQ6TZaOuOfg4ab919P3xnww49KadNHEYa87746ezIRY0H/kBwAjHRF85Z0Wu9Hq2
 ORAYjScEYknqw4cQnt+5Mks8ydh0XF7kQlWDtk/TLC+JrytYkXOET1OL32zEGR/taUy8edBI0aq
 nutAXHTYU+lZ2AsDnaUtdmadaNiC3g==
X-Proofpoint-GUID: 8_NE804kibg7IunwamT2ceqbwBixpCNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110082



On 10/30/2025 4:39 PM, Taniya Das wrote:
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh

