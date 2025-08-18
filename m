Return-Path: <linux-arm-msm+bounces-69474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0033EB2990B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 07:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05D9F16B26E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 05:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875532505AA;
	Mon, 18 Aug 2025 05:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WpZ5N/9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C1B2451F3
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496081; cv=none; b=Swfw1DQISe0c2LNdVddp2LdpvjWq+s3pKtzCNzUPK+Is94fvGks1CauI+nBFJiPt8v4jhLGtd4094yO+WpMLcd/+0RRJkWoNeQtAAOd6oOuNzIRTtLq0FqQiIcSB5vUd+lpnOi4wkp7hMRrvkXq37wOOxzkWHEIu8QCw1r36n9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496081; c=relaxed/simple;
	bh=6RL9+Xn5aegTJY0wjfAGUb6Cr92tP/PpJ2hnpOZOiWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=coAAnSqua3hktuXZB9ClN37LMtUvzameQU/ekCS3Y13+qy5LRh3zpAhxXs05PNnk1hX/gBRjQGdQBL/Q4v+v0lhUdL5aANTg4VTXjx6BWQvgjVgdQ2AIyRqos6dxGXXGarQnEdr9TqgvX9a/h5ocjXorRgpdx3eGyh7FT+MzaHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpZ5N/9l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HNDSjJ027180
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeidIzr/dKJkWw7XetUW6GunyrwIPKaUXOvs0jevNFA=; b=WpZ5N/9lLxtvIiLL
	tvCtZGO6DxuJNKFjeGBEAEw53dQ6VjgKlknokGx5ZCc71GJ9wmZpYK1RnmMpbP/i
	EcUpg1j9CxTzngUGbVkEDfQJF9ZTWTbKa9KG5ZWPSk9S0LObhKUnnZj3OCFiI0SP
	fMwh8HxIDR70+9MuKs6TAdz6ouni790VfwOO5zeVKWSu4EwI21u23JV49aZwgUCZ
	9a1ZWtIf7oCeO0OCgSwxh4sjaUOs+BMT3fwbQtmZDn1JA47odMnL1yhcMtPZgovo
	ON7pLqDlAajFnRvPgta8UhmjASThtb5c/rs5YPpaomcdwcM8xxK7NrbGSAOBE5Gm
	ccyr0w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ubegx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:47:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445805d386so39098935ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 22:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755496077; x=1756100877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UeidIzr/dKJkWw7XetUW6GunyrwIPKaUXOvs0jevNFA=;
        b=DxmCr8HIdWbQg7qq0Txowz5p+ggJA/7Zs0Ipi3AJK8a8PQur/0KLhtKiYC0Rqh2ffp
         QpDO0MRvJEdL9/ZhsvVrcqdn1l8VsI0rpKfgg4dzlfTyPY+lFg+zYQPTftCnoGlP8hLu
         xfJjeUmobCEepnCccg7rQw36w1ofDChc0fFMPwVIm/F1HQTxHENgRdN53vxxo/2uksiC
         KcJ5i1XgwM+E/wjzYJnFiqwFi14JkJf437kXCB74LYRc4RX8sAtAkardM1iF8m2MOfmM
         HImzZSkCvqPbFTCTeFhMptT59RJUbbZ99S2DQiKvm+0MAioyNgybQA1YbxNv+Y/MaWg5
         hmQw==
X-Forwarded-Encrypted: i=1; AJvYcCX3VjOyuF5xdjwh90VXzrt9obVdeWSVmb0FmnlUndaSYe/4AI7QKiWSTgu/mp1P5R1FZ7JwQ51XiA20OvhV@vger.kernel.org
X-Gm-Message-State: AOJu0YwXz8LBQNGunYUwmz8U+9QEOP9vJVEbDwJ4bb2nl4OwkK+5KYlb
	BAMNU+3jKPNKyLUC6mFVZ5mLi83RsPbYtktX7o+JEotf9/KSLpfeDiAwNorjdUlmR1Q6Xa1+Vos
	ttGtLf4TcJ3n4+0ROmzuohdCf8VQaJi2gZ8FYZPJ5FcORujG4Z0F49r+4YzClyGhsuIhL
X-Gm-Gg: ASbGncvPtAOeT79wBZF3i5UKhdqGN1VJqBxEaX4lS032nSYi/X7oifQDR/zKaLVjQ/g
	NPn642Nx7U1f+RbyTEyz13k1Mw4f3+T5KMvCS4gMqtQ7N9Ry+bmvgVgf19QfRIN0OlG5Blka8zj
	2AAQPrVqNTIbnupCS2gt9qT6P1MJ+KksQsR7U1zlyAGA2656CXjX8k7owI7rGMY/VL+Qx2kYs4v
	NRmzwWu6LY+6av5sYu45BHGUNxkOTRvL5vPsP7P1Dvl2IFLJbIcmi/lq61izUul5tFKLAPFe8Sg
	wOSUZAJbsTSsBcDaAT8XPK6Sx2ZiHmhuN87Tj0MACZfC7BQYjGTEDcqlyYJUppV+n3X7wnrGGA=
	=
X-Received: by 2002:a17:902:ef02:b0:244:6b77:5b10 with SMTP id d9443c01a7336-2446d89d221mr126078955ad.36.1755496077038;
        Sun, 17 Aug 2025 22:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER4IOalNWar66B22rHJVMIAjJY1v2hPIOrJvCuOPmIDSJbaYtKfcaHS83aej4K/R2Bxeoqgw==
X-Received: by 2002:a17:902:ef02:b0:244:6b77:5b10 with SMTP id d9443c01a7336-2446d89d221mr126078695ad.36.1755496076565;
        Sun, 17 Aug 2025 22:47:56 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5a9b9esm69293305ad.167.2025.08.17.22.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 22:47:56 -0700 (PDT)
Message-ID: <bb1b095f-4198-495d-a82d-1d1d7b7367d1@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 11:17:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] bus: mhi: host: Add support to read MHI
 capabilities
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-3-3faa8fe92b05@qti.qualcomm.com>
 <ttjbjmixxbzatcfthaucuy3j4hosu4azpizes6ptxjnkzsawa5@5axodfdyjff2>
 <5625ffa1-f952-4646-a17a-fbbfffcdba2a@oss.qualcomm.com>
 <4c68074e-5809-bc4c-185a-88ddcb81f31b@linux.intel.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <4c68074e-5809-bc4c-185a-88ddcb81f31b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a2be8e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=BTqdaEJVcAPEW8WuxcAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J0Wk6z1qaGRenn4E9HqFUnxPxSxQ97RG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX3Arqxc/lqloE
 bNMIgkFx976cTR7S3E4cqtBZGhLorpm4a4LV7V5rpA7YkhrUQCHUYBlPJ+zvUUX+udNYdj7I3P7
 m9Yj/jSW2dOpxijcC55x4vs1cbeN0XABZrl5FMizvmTEHkH1BFtMySNj3hhddMzH+yvkZYDD8qZ
 +PMpT4cRED3fU/OXGJN5J74+uv+DWyiz582gUV36aGpcGGlEpLZClFqjMqS2t2jpBePLZ8fjKyp
 /KxoXjpRBOs04ExhG93qrgbASjtVcge67BIBamotybFLOVqzJNA/vqUy5dO4Pu2PrjUzly1p36n
 KDx4OQILDfv8LfFW7D4Oaf5iYXjjLvuioYaEhEx25PYj3X+EKHAxICAoc9E5ksZrgYVA0Em0Zax
 lqdqNdU4
X-Proofpoint-GUID: J0Wk6z1qaGRenn4E9HqFUnxPxSxQ97RG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031



On 7/9/2025 5:50 PM, Ilpo Järvinen wrote:
> On Wed, 9 Jul 2025, Krishna Chaitanya Chundru wrote:
>> On 7/8/2025 10:06 PM, Manivannan Sadhasivam wrote:
>>> On Mon, Jun 09, 2025 at 04:21:24PM GMT, Krishna Chaitanya Chundru wrote:
>>>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>>
>>>> As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
>>>> located after the ERDB array. The location of this group of registers is
>>>> indicated by the MISCOFF register. Each capability has a capability ID to
>>>> determine which functionality is supported and each capability will point
>>>> to the next capability supported.
>>>>
>>>> Add a basic function to read those capabilities offsets.
>>>>
>>>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>> Signed-off-by: Krishna Chaitanya Chundru
>>>> <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    drivers/bus/mhi/common.h    | 13 +++++++++++++
>>>>    drivers/bus/mhi/host/init.c | 34 ++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 47 insertions(+)
>>>>
>>>> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
>>>> index
>>>> dda340aaed95a5573a2ec776ca712e11a1ed0b52..58f27c6ba63e3e6fa28ca48d6d1065684ed6e1dd
>>>> 100644
>>>> --- a/drivers/bus/mhi/common.h
>>>> +++ b/drivers/bus/mhi/common.h
>>>> @@ -16,6 +16,7 @@
>>>>    #define MHICFG				0x10
>>>>    #define CHDBOFF				0x18
>>>>    #define ERDBOFF				0x20
>>>> +#define MISCOFF				0x24
>>>>    #define BHIOFF				0x28
>>>>    #define BHIEOFF				0x2c
>>>>    #define DEBUGOFF			0x30
>>>> @@ -113,6 +114,9 @@
>>>>    #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
>>>>    #define MHISTATUS_SYSERR_MASK		BIT(2)
>>>>    #define MHISTATUS_READY_MASK		BIT(0)
>>>> +#define MISC_CAP_MASK			GENMASK(31, 0)
>>>> +#define CAP_CAPID_MASK			GENMASK(31, 24)
>>>> +#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
>>>>      /* Command Ring Element macros */
>>>>    /* No operation command */
>>>> @@ -204,6 +208,15 @@
>>>>    #define MHI_RSCTRE_DATA_DWORD1
>>>> cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
>>>>    							       MHI_PKT_TYPE_COALESCING))
>>>>    +enum mhi_capability_type {
>>>> +	MHI_CAP_ID_INTX = 0x1,
>>>> +	MHI_CAP_ID_TIME_SYNC = 0x2,
>>>> +	MHI_CAP_ID_BW_SCALE = 0x3,
>>>> +	MHI_CAP_ID_TSC_TIME_SYNC = 0x4,
>>>> +	MHI_CAP_ID_MAX_TRB_LEN = 0x5,
>>>> +	MHI_CAP_ID_MAX,
>>>> +};
>>>> +
>>>>    enum mhi_pkt_type {
>>>>    	MHI_PKT_TYPE_INVALID = 0x0,
>>>>    	MHI_PKT_TYPE_NOOP_CMD = 0x1,
>>>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>>>> index
>>>> 13e7a55f54ff45b83b3f18b97e2cdd83d4836fe3..9102ce13a2059f599b46d25ef631f643142642be
>>>> 100644
>>>> --- a/drivers/bus/mhi/host/init.c
>>>> +++ b/drivers/bus/mhi/host/init.c
>>>> @@ -467,6 +467,40 @@ int mhi_init_dev_ctxt(struct mhi_controller
>>>> *mhi_cntrl)
>>>>    	return ret;
>>>>    }
>>>>    +static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32
>>>> capability, u32 *offset)
>>>> +{
>>>> +	u32 val, cur_cap, next_offset;
>>>> +	int ret;
>>>> +
>>>> +	/* Get the first supported capability offset */
>>>> +	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
>>>> MISC_CAP_MASK, offset);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	*offset = (__force u32)le32_to_cpu(*offset);
>>>
>>> Why do you need __force attribute? What does it suppress? Is it because the
>>> pointer is not le32?
>>>
>> yes to suppress warnings.
> 
> I'm pretty sure sparce with endianness checking won't be happy with that
> construct as you pass u32 where le32_to_cpu() expects __le32. Have you
> checked this with sparse? (It might not check endianness with default args.)
> 
>>>> +	do {
>>>> +		if (*offset >= mhi_cntrl->reg_len)
>>>> +			return -ENXIO;
>>>> +
>>>> +		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		val = (__force u32)le32_to_cpu(val);
>>>> +		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
>>>> +		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
>>>> +		if (cur_cap >= MHI_CAP_ID_MAX)
>>>> +			return -ENXIO;
>>>> +
>>>> +		if (cur_cap == capability)
>>>> +			return 0;
>>>> +
>>>> +		*offset = next_offset;
>>>> +	} while (next_offset);
>>>> +
>>>> +	return -ENXIO;
>>>> +}
> 
> There's a generalization of capability search in Hans Zhang's series,
> can it be used here too?
I Checked this option, the mhi capabilities will not fit in to the
series mentioned for not matching the mask for cap ID, size etc. mhi
capability are similar to PCI, but they vary between mask of cap ID, 
size of the space etc. so going with current approach only.

- Krishna Chaitanya.
> 
> 

