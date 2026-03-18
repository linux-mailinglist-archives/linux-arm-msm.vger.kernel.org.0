Return-Path: <linux-arm-msm+bounces-98431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCvqAv6IumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:14:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F222BA9EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5DA633006006
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758532135D7;
	Wed, 18 Mar 2026 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuRBGbaI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ResH2Tvu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442403815D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832400; cv=none; b=fL2VjBnJReMuLl+mdClmJI4vHEQWohfALQlNzAtNZQHOxVoVODmePHa5qDTxc0iuh/6VNp3/sY9EP/TSuwe9R8dsCL+/siPjtLZ4b2Ba4uoShLRTDsBurXqRJyIePkVTMiGjbqAIYFeQGVURQVcOpXLXUQJL0SwKP0mSKZe4tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832400; c=relaxed/simple;
	bh=vniTYVjk/lzZ9hdPrn6kzokgKnGsY7+iAT5Q9uCWLn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbhHIQpGUOPvd/M1WG4bYQqAq4CPHGiQvxAG1rckLLRcePF0GOd3a2p4wDzk5MF4/oHnfjpq85goeVo1aLbQz2AMr8OXi/5pln2zenSRmR659RxhaIeCJ6p/ylzTjQfS9EMoM7PMW56X1zTAF8eMRNJJ4NVUaQgRIA3ULuXYz5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuRBGbaI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ResH2Tvu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8lnkc084709
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlHGWJ9DXNUnp7Csb9vXzwae0R72YcscErEfyQ5F/AQ=; b=YuRBGbaI0pNl7hzg
	hpLaQ0zcnCpwRWhnid/DmfJfnc9GBB8KoGB+C6XG2fTDfEZXaCdhXK1syKNBxzDL
	8QnMRlKRLiCX7roHxcst7Q76sAzybiWaqWALrrNZaDiEB4Ulnw/qqHK/u7LHE4eJ
	BBKLVP9fkk+dYU4hBwbgrLJ5sSFjRd3SThdCbbNnNtCvwW974ieTS7m0B/Ps99dC
	vtCYXAvQ6qr9R6GpfNAyWAD08qzwUhYM1G1mceYgysZWyEl1ayDhF+l3R+vlGR1M
	tkeA1gzoqClM8TzRR1FGCaNZa98IVsv+BwyXVGzki48SE34tBE8VobkDp/lgZxVd
	GkaxUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqesy63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:13:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50925fed647so6111531cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832398; x=1774437198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlHGWJ9DXNUnp7Csb9vXzwae0R72YcscErEfyQ5F/AQ=;
        b=ResH2Tvu7pMHv/Apzdn+RJiNnogl/z3fpXt2+gaGFcP5St2EO6sKzFsGiDz0VMgbGg
         UESpIqVXa8FN4gwhdg/CFAT5/sNtqdBYgaRsH0oH5iqpPHw/2HJdNWwUfk6skkU+Uz99
         SBa+DMDfvgal2i9WoNLpxEEA21F2QlYH64VjHPz3TTHXqawj0Bqh+Rjt0Ais86+IU1sw
         5mf2jzCKzMwnKNFj5ylCgUwntlOtyVygfFh3fhFey31KitG4DKAVvy3JX/DkpXurpFic
         kZtH+SShDrIJO4kolJFhcFQ93UXLP97Evkcst4/qoPn1FKTK55ykREbQtEjMsJ7zjXnb
         rNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832398; x=1774437198;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlHGWJ9DXNUnp7Csb9vXzwae0R72YcscErEfyQ5F/AQ=;
        b=ingQs5Tcq+wcq4XkxxH+0qMRX6zEeOXzB/UAMkqLENCrX3vXQD0weMaKb3UjskT7KD
         xKwd1E1h7egJVJmRod4LL3SFINbL/IZUtDk7ooeQOPqIM2/HsQ+shOv0m9UtUhC5bJhc
         VvOqSlQbC2dKxrzpTOQ95nvLx+fGLtSmPo8Zeyo/xmLSbVuDpNCFq1cOs/P11BrrvQ6/
         Ho+nUuYaeA21Gklnv10gaz9vYMYu5CDaSe7Gi9P1BiKIB5d5bT/QQ5eN7hjRSAfry+lg
         ltbppsSKumKDIkzMHjnLDGFHqBaxRfGmjlneVnNuNTdkFJlXPPklD0MKOXX103Z957FA
         qvRA==
X-Gm-Message-State: AOJu0YwpGv1jmqagCwQS1cM675p4+4cnTCR7FDBT5fTxc5LcxEha7kM0
	Eug3XwPTh1A6iL1tQPcIxgDRUzGh6YugUX0G0MhPSWP0AKm8bwO7EJ70fzJhKzAhib/RND5A8Xu
	/ynCGH50Uz4q5eF+o1POXEVdawLSsBJIPFFnRC19n2QbsoSQEPC2UpJAagrBz2LGTzD6A
X-Gm-Gg: ATEYQzxnNf4cRrQ7zPpjMtcel64W755WR/dpEVY2eKzA9sCO8Gsi6l1B9VzJIPDhs56
	7owanFD1Un3CuREOBj+sv0aUl8zJH1WGy6hzSbO//fn6+fLQqIupnRFJWdBFcUwa+LjECvxONIZ
	eYlj35unKx09peY1S6txOX5bXeXVocoaD3BJkzLo6q0P8em0Xwre6urTTPrK4inWsdBFieY6XUr
	aOkD/DW7Z+/KFGkxsBpE2HS/lb7zmb1a+T7Yd08lsYeimBzU+6A2gP4U7/Z6Wyb/8XnUWG2oHtP
	zO8hGiaOBZnRKVercAFbxQstiu+y/2FuDC7L5XaP/+iqV6tU8fABB4eRVOfYHMUKRV9gH7BwKq3
	4BPw7KBe7N7/NKmoK29rzE3TjpGzVJJcMnARBSqR3C3zT2zfj
X-Received: by 2002:a05:622a:1991:b0:509:1924:3f6f with SMTP id d75a77b69052e-50b148fa5f0mr30838171cf.63.1773832397654;
        Wed, 18 Mar 2026 04:13:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1991:b0:509:1924:3f6f with SMTP id d75a77b69052e-50b148fa5f0mr30837961cf.63.1773832397238;
        Wed, 18 Mar 2026 04:13:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bbcd78sm16655685e9.26.2026.03.18.04.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:13:16 -0700 (PDT)
Message-ID: <d2975a1a-04bb-4026-a0cd-34571f99ae02@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:13:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-eliza: Add Eliza display clock
 controller support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
 <20260318-clk-qcom-dispcc-eliza-v2-2-8c05581168d1@oss.qualcomm.com>
 <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <1a00582d-66d6-4325-aafd-156cfacee8cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NSBTYWx0ZWRfX7MaZPCelww/G
 6X7Rhx17sY6V+fVEUCsTfQ+4ZAanbvJtdEXt4vgSYVJYIyu/SNYhCWA+LLPIn7HhR+8/6z91yDy
 kmO+gU0nEnd1zpEx5BdwUuW7f5a495R3/IeiiEACw8RDScKYpMIsJmMHSxKKMvwNfOywoBJABUV
 3rzRjruM30VdAFnCxFNTlhgkIbOmdOzPq168TLNHliRfYC2yOcZZmNxibU98Fy9evj0CmddgxC3
 nNz8nfBxqgV/xQeDjayGFkgF2qDgoY6xXgV0Hb9OG12Lkkoce86PHteqnyBVc2ozzEPqi7cPXfV
 hFKAmAfwYbp4BZfPETthIi74PavvHZmvhp2b8AbnSheQ9hpdWrpbMNxtGtOQJUjwbhLehq/8X23
 qXOm/K9FwQo3ZNL+04tacLYF8B30+yRgPoIYhii+CDP+MfcJdoRLaJGLCdCHJh6UawEzblzFcNr
 IEMcp0Az2S8kBkQVgXg==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69ba88ce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TBfkzzlTsJg2ki747AwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: HtDY53iWD1wu64hcW67DSG5ZtjF1c6G9
X-Proofpoint-GUID: HtDY53iWD1wu64hcW67DSG5ZtjF1c6G9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98431-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12F222BA9EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/03/2026 11:48, Konrad Dybcio wrote:
> On 3/18/26 11:39 AM, Krzysztof Kozlowski wrote:
>> Add a driver for the display clock controller on Qualcomm Eliza SoC,
>> which is copied from SM8750 driver plus changes:
>>
>> 1. Additional DT_HDMI_PHY_PLL_CLK clock input,
>> 2. Eight new HDMI clocks,
>> 3. Different PLLs (lucid and pongo).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023-2024, Linaro Ltd.
>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
> 
> -> Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

That's the copyright I found in the downstream code I used in few places
here (with modifications) and I am not touching them. I also don't care
about these and I am surprised this keeps popping in community review...

This was in original v1 and you did not object there.

Best regards,
Krzysztof

