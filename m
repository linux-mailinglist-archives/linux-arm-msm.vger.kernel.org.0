Return-Path: <linux-arm-msm+bounces-83714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4727C91779
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 076533ABF84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCE72FE57C;
	Fri, 28 Nov 2025 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDt9q0hK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFMXBQxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A92FBE13
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764322501; cv=none; b=DKA61IOXlcxgu0uBuwD6vo89uPOsnmXnF2Xe+5pk/B3NObnUGInxuWOsb8U+oeG0svCg1i8yabBp+lJiIc0mPITAiSCOW57e/i8ssiJj9lHZPRK8iOpl9nGozIkb/nZsPzvlPHMYjkVtVuzRuXFhpmRPrMUk44xfVS4q5sOJ+x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764322501; c=relaxed/simple;
	bh=h3ZNBDf0epiuOlk/2CQIviFQoMVthoNjNOFLW4wWEXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgVvQkFzY4s26+ItWfidSqIO66azmxlaNQjkKlZ1RxcWY2pwdIwSwtJpH0xa90EXIzHWKNCbp4XsFfL2MR9iJMBySnMhst8uQ8VPc9iTjs9mbUlWIOYYmdaRp3dDRN/NzGPRFYH8XPQ/eF0ewyaHqnsE0iZbHy7h8su2XnbNGoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDt9q0hK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFMXBQxI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8rmSU3989822
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sKL+m3WOutgYF13OONGJXl0HxSvrXVv5l4hpsD9KEx0=; b=gDt9q0hK1gN6/swW
	eetI/8Fk15z9ktxRhKMA/ETH9nnfIaHmBoR46zLo/LloStTBs7jwkvGS1TY+Vphd
	WkFS/2qEEJtK2dczmtGxS58r4YShru+XkPEggwg2hmAz/Bgkzut7OTFO4ufuiAwg
	gEowtz9SvSLZwEnXUprkpRIXB75sMqC9jqJFHnDUr9GGlX5fWPeojo522UZfVw9N
	UFe1JN0h05WxadZD+b25fYffV8iHJIx7m/ZoF67sXc3Gi9oKZp7jcjVHGVa2MAzb
	1XgWBrstHeIhaeHj17CohCEk9gWdnWk/TvxJRIu2RU7ixbMfZSvL/ve0wGeKtEpp
	SoWvbw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq8mm84fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:34:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956a694b47so22666155ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 01:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764322498; x=1764927298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKL+m3WOutgYF13OONGJXl0HxSvrXVv5l4hpsD9KEx0=;
        b=CFMXBQxIX5RYiggtQJV7thQ6CzGlsS+fteRyuOTqNCWVdSKrDIcKBwTWCimtayagw6
         hs4j4pXaSXCe9mlKQE9a6y9n56NzGeCSrNEqJTrE4D1wdz13mp/Ehv1/PHaKkdUvZVys
         B4aYP5k5jumQUSxgrV5vWrK4zgYMzxNABVs+Y/BRxBHtUSHptNvdM03yy3ldQx2tCsHb
         lkPCJmm4a6w+GfTKxb1u/8PNqwNtT9/OxuxIVFmFJajxL/sbWssIEJ/6FGQ5BOEQ/5v7
         Y3VUx9AGHqjkpr9uxqjuL3lSrYeNGpQ965QmaodFTc10MDNP/sxCnrbvD5avyJdCYhNc
         Q9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764322498; x=1764927298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKL+m3WOutgYF13OONGJXl0HxSvrXVv5l4hpsD9KEx0=;
        b=SeqgbnXuyrAcQjmwacJfDsmbtCE75sBt/kSfTZSUwQrZ7+j6XG/I+w5y5cD/J3idtr
         DIBtebllLXNnFMhVQQPVgDtuRd5hIJ3TQoqe1+r7CRDcDV/9CPDwqBdNvgTXX2KYyhyc
         ouj4kHE0UIJeZATEnplPxqz+Szu6m49hGVOXQ2XaKfbC9wtni7WvurkTz7SGuK4nl5P7
         XWsVgSRTxMCx+jlt9HYGvTce02k0ki/biSM4P7tQP/eeLXkhjenLSa5g+7lEA4NmvNlN
         dlHUM2l5UQyGt2WDu/0mDnMj2HLrxHNYTZ6HuiOOEmgoAJLmziJC0AHo27rxy+JB3g/O
         l0kA==
X-Forwarded-Encrypted: i=1; AJvYcCWddOaB0yNFGh/R0SiRGqL+FiQEU+9QMIAmelKW5jxy7OWm4o/HudKwheeDiDEngldYwIGHaGBrCpEogXsY@vger.kernel.org
X-Gm-Message-State: AOJu0YyPKpc6qPyA1H8b1aVfSgEj/gofE5tFUXVldjfY9bstyXmJsYkK
	8Gqxh29ff7qyAK8VFM67ZrDSub1/OOW8jhTdeEbgV8GIDBUmmKAs/bRIj/8F++RpONSndh2ooj+
	lTRI9iQQAcRMp1f642aoupOURx8p1Duev6XNauK7trxxOb49N/YZ3wb/k5RFlrA+zFPRm
X-Gm-Gg: ASbGncsYVfnvaQ6QNVZOlMGCDadtS2HgCu4O6WoELkjs8ImyISywdZQ4D9b/2MpQZtZ
	91dRTTBImZxIAtLudnSFrZdRwyQtSYxRCvTQXnUXGw7RFV/pqhBQkOCEkUqz6YUt1BPIf5hBEwy
	UDy9gSLxkVfvIvyrppt0Ggel8MyAmWb6BrSvSRuZLfOYVZjUaxLERonyO7zxF8fbkYiwirpasDG
	Gg0rjuwtLQA7jVwopSWescyFRtd5yGJMrXjT8WDUZI9QSy++sPleu6kZq96cvdtb5+q/sz8LjOZ
	Ft+IZNTMKhDlkg/6rxArV8quxUxa63PIGS/VylN6LY7sntWbGGHU8DM8JQJhlkyhsbqOcRK5lfJ
	K/H+Qj6n351cAeLud19tGMXYKXipncBelMQ8RPA==
X-Received: by 2002:a17:902:d548:b0:298:1013:9d11 with SMTP id d9443c01a7336-29bab1b50b2mr123968065ad.43.1764322498114;
        Fri, 28 Nov 2025 01:34:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExaWYSm30clO8JFqmCnuOkXZeeuYL49hJYAy90FwY7+VOOyFl1pNAhMDGXVuh1Rp1ko+AYEQ==
X-Received: by 2002:a17:902:d548:b0:298:1013:9d11 with SMTP id d9443c01a7336-29bab1b50b2mr123967805ad.43.1764322497516;
        Fri, 28 Nov 2025 01:34:57 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4142f4sm41220365ad.10.2025.11.28.01.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 01:34:57 -0800 (PST)
Message-ID: <215aef75-682d-4cdb-a6b6-c2de805c4a69@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 15:04:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
To: kernel test robot <lkp@intel.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f@oss.qualcomm.com>
 <202511280306.L2l4tAmD-lkp@intel.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <202511280306.L2l4tAmD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8Pdtf2koodiDQhIvJfH3GypUeJAv4j8m
X-Proofpoint-GUID: 8Pdtf2koodiDQhIvJfH3GypUeJAv4j8m
X-Authority-Analysis: v=2.4 cv=Cvqys34D c=1 sm=1 tr=0 ts=69296cc3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=YF6W2t5QWlGAmZuWSUoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2OSBTYWx0ZWRfX1aB2LJt3cM6z
 Kca1XL+Te0ZlRHavSirITrFrtXvJKZ+DqeHg3SDpbU4DT7smT2T4gDNiS+kScOKvZlwHC2aOHH3
 damlcgPb2KiLndbNPJzDbMWxwbP0FrTGoagI0Aq2PLDUBWvK7iiGBlbTBrQnaRV/Z1OzfmnLTkd
 GESE4+MC1Dcu2bfCN9xirLzeG/Ie/QxNWertZDh89BXKwXVZMK8QEeDPfD6o+csX5WAQf28Jga3
 SpCv8VqmkofsjF2D4JZl85h6+COl4yuXUolB3QK65BhYWV0xRDJEl61HdH9ctGfVAIo/aSuv4K4
 3bb6STupJvadbDVmHpHBD/XBVtSjPNj7IbsmfKW4epG5Evtnw/d3R+hTe4AvnGB6mrELR1/9t+G
 Cu1flGODt3zqO3Z7EmOIFOC9ZbwL4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280069



On 11/28/2025 12:59 AM, kernel test robot wrote:
> Hi Taniya,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Taniya-Das/clk-qcom-clk-rpmh-Update-the-clock-suffix-for-Glymur/20251126-021404
> base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
> patch link:    https://lore.kernel.org/r/20251125-glymur_rpmhcc_fix-v1-1-60081b3cce7f%40oss.qualcomm.com
> patch subject: [PATCH] clk: qcom: clk-rpmh: Update the clock suffix for Glymur
> config: arm64-randconfig-003-20251127 (https://download.01.org/0day-ci/archive/20251128/202511280306.L2l4tAmD-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280306.L2l4tAmD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511280306.L2l4tAmD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/clk/qcom/clk-rpmh.c:891:21: error: 'clk_rpmh_clk3_a' undeclared here (not in a function); did you mean 'clk_rpmh_clk3_a2'?
>      891 |  [RPMH_RF_CLK3]  = &clk_rpmh_clk3_a.hw,
>          |                     ^~~~~~~~~~~~~~~
>          |                     clk_rpmh_clk3_a2
>>> drivers/clk/qcom/clk-rpmh.c:892:22: error: 'clk_rpmh_clk3_a_ao' undeclared here (not in a function); did you mean 'clk_rpmh_clk3_a2_ao'?
>      892 |  [RPMH_RF_CLK3_A] = &clk_rpmh_clk3_a_ao.hw,
>          |                      ^~~~~~~~~~~~~~~~~~
>          |                      clk_rpmh_clk3_a2_ao
>>> drivers/clk/qcom/clk-rpmh.c:893:21: error: 'clk_rpmh_clk4_a' undeclared here (not in a function); did you mean 'clk_rpmh_clk4_a2'?
>      893 |  [RPMH_RF_CLK4]  = &clk_rpmh_clk4_a.hw,
>          |                     ^~~~~~~~~~~~~~~
>          |                     clk_rpmh_clk4_a2
>>> drivers/clk/qcom/clk-rpmh.c:894:22: error: 'clk_rpmh_clk4_a_ao' undeclared here (not in a function); did you mean 'clk_rpmh_clk4_a2_ao'?
>      894 |  [RPMH_RF_CLK4_A] = &clk_rpmh_clk4_a_ao.hw,
>          |                      ^~~~~~~~~~~~~~~~~~
>          |                      clk_rpmh_clk4_a2_ao
>>> drivers/clk/qcom/clk-rpmh.c:895:21: error: 'clk_rpmh_clk5_a' undeclared here (not in a function); did you mean 'clk_rpmh_clk5_a2'?
>      895 |  [RPMH_RF_CLK5]  = &clk_rpmh_clk5_a.hw,
>          |                     ^~~~~~~~~~~~~~~
>          |                     clk_rpmh_clk5_a2
>>> drivers/clk/qcom/clk-rpmh.c:896:22: error: 'clk_rpmh_clk5_a_ao' undeclared here (not in a function); did you mean 'clk_rpmh_clk5_a2_ao'?
>      896 |  [RPMH_RF_CLK5_A] = &clk_rpmh_clk5_a_ao.hw,
>          |                      ^~~~~~~~~~~~~~~~~~
>          |                      clk_rpmh_clk5_a2_ao
> 
> 
> vim +891 drivers/clk/qcom/clk-rpmh.c
> 
> c035a9e265dd80 Taniya Das 2024-12-04  887  
> ebcb9db98bdab8 Taniya Das 2025-08-25  888  static struct clk_hw *glymur_rpmh_clocks[] = {
> ebcb9db98bdab8 Taniya Das 2025-08-25  889  	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25  890  	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @891  	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @892  	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @893  	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @894  	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @895  	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25 @896  	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
> ebcb9db98bdab8 Taniya Das 2025-08-25  897  };
> ebcb9db98bdab8 Taniya Das 2025-08-25  898  
> 




It is fixed in
https://lore.kernel.org/lkml/20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com/
and it is pulled in the series:
https://lore.kernel.org/lkml/20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com/

-- 
Thanks,
Taniya Das


