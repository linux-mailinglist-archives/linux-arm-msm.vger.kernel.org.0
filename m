Return-Path: <linux-arm-msm+bounces-71716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31033B4158A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7186F5638CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 06:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FAD1E2307;
	Wed,  3 Sep 2025 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGbLRnAf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776C72D3739
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882240; cv=none; b=DwMoaDoyrULEmT7ZlkjhIRUeFN7EwD1Da7ZZaIlpvkmpPQzH5L3S0IvxpohuGpwOyBRJj33A3vrWUPpaiooKfzExHvwvrL/aD15Q32ukVNJtQJ1F4vzTp3W/WmLaqND2WgIb4i/30lC2C/u94qxGkKTp+BrRxmIRxtQhhC694og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882240; c=relaxed/simple;
	bh=OZYvAJLqb8zNZnB+JiPiyr5fYxUP3/2uA4CPj714OP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGHGN5QjPbUyDEllF/uuM6UdXuEhSXXuK0adFwUXN9AC8L3tUDnJ4l3snrEQvFwkwpDWwe1pXhbvNrzy/gA1/JTakIbELpm7LH2uJWzg7mEeSZqeIzQ1fIGnjaLuFNgQt/KwB33V7K5uP3PdIlvBYiWxw7z1IYu6bySdKs1wgRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGbLRnAf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832RHGx012705
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 06:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9hHMK6M77PZdvE0eh4C0zvscADxksQZEgHG4rBgto8=; b=DGbLRnAfsMgDDMb7
	cqSsjfPGazPKIOo9K5tINfJGUMJvgbnopVApApJMkdJ80koFpDpIlH84DWjmc4+r
	vInlObQABHp3Nr2u9g/oBoElHnMDIRXX+SnEk/WBbPb9ewlUBAJNeKsE19WTThkp
	l3HwmJRzwscl/f5Rnk4m5Z/GtsCXCCtqAEjt93FrIMk5WdfHl6/9vj1CY2AzSvNB
	ucoz+KCPdizVzeaSy7adUGBrBKRrqMPD60AAOBjL+4p2GwpCFK2T7S0L1xwLM3LB
	KvS3A4K1y0r/+uqnfCtuy32RhkRxZpn5BAHRbF3Jxmz73GfOtSuNnnd3cdYaqSyr
	xAq5JQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk92acr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 06:50:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3278bb34a68so5731915a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 23:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882237; x=1757487037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9hHMK6M77PZdvE0eh4C0zvscADxksQZEgHG4rBgto8=;
        b=of3ufJgsBaWNJHeuyp2gwjRJKV2lIi07YP7Gh2L4uzi55DKbdm9DAeVKoHT8MMLJvL
         SN9bPWdUSW+kRwf1+6ie8bS/JbrTl77vPf1mzlph44gyJvAD+Ba2/9v81wcHM7qZnhVe
         VB1A1Jt5ORgsmbkIFI+onzYl5+4mLDs59msuL67wmeZW0TrHkuxUUTD509fcLAW+kmw0
         9UePJfPjC5nK+03zN8cx+YJlYPjQSC+ieehpq/lqf14YNXg8Q26YiYuu+l4x1cuouzKt
         J6IehgaYGIFfcqrtro5nTJ98jV/2UepTcJxk870OF+NjfDqpcCY9nrMnAxK18PA3Bt3C
         1/kg==
X-Forwarded-Encrypted: i=1; AJvYcCXGsueXk2DbbWMOyRJ4Lh/NObP08b3yhWVBmtr+zeVDZGityHpdw6n+cU28b2hKek6BOE37eYQfniLnyt/v@vger.kernel.org
X-Gm-Message-State: AOJu0YztoZXOKTSdTxJkkjhq9CJ5MPtUMd/91ubjkgLcpuMmRnXlAsD1
	qXITQWHtkhJMdwN8AYnCtK67OXjarH93PGZS/kKml8WJdfy/uFUh08su5daGUdgovLchwCTrI8M
	3MDAGK4rUMj2rUnpYeEC1tM7qL1/KFCNW7RgdXOaOxauCqnuIu9QJ+Y7R07G2po8qzLdF
X-Gm-Gg: ASbGncvTlG/nF6QyFlkuaI4l18hjwYDMx+QdoSyXqPTphLt8NnNvDjQS7K76gBGjtTr
	6YUz9pP+Ci3JLNIVSNelDN9pki3cV3dSPISYYiIoYm2t6ut+C8mlFIy6+NFdHJDriTkfQuMHpWT
	gal29dmEa7XdBQ8lOZEV0SN4zfIqXuEK4BlRLG60frRADMC46fvN4R2cFZdQ57eHtzjK9vidPaQ
	M4fKfOODME4hEQ4nfd8qUeBm0HzhBbUCM/0GjA4TkVVoy38qpJdroJEy9RTnH16Y/sYPw5OKbxj
	Y5egurhZ+RS1pxagz+VRqaG8+43XRY3NmlbOaPJy2wFMwiGyQ9Gin/HTVdGBR+HeLpFn
X-Received: by 2002:a17:903:2302:b0:24a:aca0:7cfd with SMTP id d9443c01a7336-24aaca081f9mr170262585ad.18.1756882236685;
        Tue, 02 Sep 2025 23:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyFdo9cEWjCOC0ZpT9gc5RWF3uY6Cc1QxsgEsFMAs1ei1aEnR+j4ANyXrofAMXnY7o6hOvdg==
X-Received: by 2002:a17:903:2302:b0:24a:aca0:7cfd with SMTP id d9443c01a7336-24aaca081f9mr170262325ad.18.1756882236220;
        Tue, 02 Sep 2025 23:50:36 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c8e94b34esm10185985ad.94.2025.09.02.23.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 23:50:35 -0700 (PDT)
Message-ID: <6b8d52f7-8c97-4aa1-9674-02aa13fba18c@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:20:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com>
 <484eccde-bcab-42f8-bf6f-b370fc777626@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <484eccde-bcab-42f8-bf6f-b370fc777626@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YeE6Ux_VGX7k1nrEX8_HmVHSEh8mvV-E
X-Proofpoint-ORIG-GUID: YeE6Ux_VGX7k1nrEX8_HmVHSEh8mvV-E
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b7e53d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=PZ7RaY4/qyhr7oYTfvPPhg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=W923pDGaHg0UEdA9CysA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX0k3Wye/AAj1m
 k8OILs6//W+4o61Feu7/kvh/oKT3JsXgQhfiECfzVzxt1dv0lSKMWpBiTMnn24maJiJNgo5NlGD
 G/yzBpqcLJALgZtgiySnstxGVPHZTexTUgG0hK0/9j1nZ61Qm1RMO6J5Wd5Yyta+1POZBmeydln
 7VMDFcOwX1a5XzH394SNAZcFQz65oTkST11jnVs0aat3n4HQm9a4leCCRaL5kt+nPvW5HMVX7ft
 1dKlms+9pehaSVfbUpfkHT/BQzwuNqlqQ52PONuA+7Rc/HUMf8Agc0t7Xu8uGBsdShDm5fRMqY3
 E/fJEaoGXa2t1PR43y8C59PI5nHR05QIl8x9Y0KfeWFcqj5V5EJ1kDZ6LuQYhpnvoNsgEQCfSen
 Et6sgDPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042



On 9/2/2025 5:27 PM, Konrad Dybcio wrote:
> On 8/29/25 12:15 PM, Taniya Das wrote:
>> Some clock branches require inverted logic for memory gating, where
>> disabling the memory involves setting a bit and enabling it involves
>> clearing the same bit. This behavior differs from the standard approach
>> memory branch clocks ops where enabling typically sets the bit.
>>
>> Introducing the mem_enable_invert to allow conditional handling of
>> these sequences of the inverted control logic for memory operations
>> required on those memory clock branches.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-branch.c | 14 +++++++++++---
>>  drivers/clk/qcom/clk-branch.h |  4 ++++
>>  2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
>> index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..90da1c94b4736f65c87aec92303d511c4aa9a173 100644
>> --- a/drivers/clk/qcom/clk-branch.c
>> +++ b/drivers/clk/qcom/clk-branch.c
>> @@ -142,8 +142,12 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>>  	u32 val;
>>  	int ret;
>>  
>> -	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> -			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
>> +	if (mem_br->mem_enable_invert)
>> +		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> +				  mem_br->mem_enable_mask, 0);
>> +	else
>> +		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
>> +				  mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
> 
> regmap_assign_bits() is your friend
> 

Thanks, Konrad, will use this API.

> Konrad

-- 
Thanks,
Taniya Das


