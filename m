Return-Path: <linux-arm-msm+bounces-79705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 972DAC20FB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D30CA3ADCDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 15:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B78E3644B6;
	Thu, 30 Oct 2025 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ST+wZAia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgAGnnub"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00949157480
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838858; cv=none; b=hYt90WA91Jgg+WY8DVKmtDvm7y7RNIgaf6igANZW6esg5dx8WeHOOScMwMuKyI/u19at3Kh/fWgzi7UAOQbmhTJv5+OrNM2TKaeYht/QL0JQ3EG7EVKPPZSWMZdj+2nMHwC8WmH3zWoPsZPzv0KRLxqvPOMXKvn03QY66Q3Nmkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838858; c=relaxed/simple;
	bh=zI/RLSvBNI8VbpRZC1Y1Nz5b4HLt4o2/2dF/l/BAamg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EOJc0VOQ7Ku+HUIHCDjWgIyDBOLecu2L14zcFQHsZg4Vw0WChiBddjD46mdC1TfH1mkbOi7biayYMfopRTKxrWEi5m/JgYA+LMRyB0MMGyTeqsNN8hloehaIbeHin/Axk7rkHMn6hNJVvdIu85NrAZ15l+mlWg+NFyal/ltsufA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ST+wZAia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgAGnnub; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFY75n1598398
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 15:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iu/DT9P54EI5MUozyWp4JD5DwnJiMwa+YhfcAZOr+js=; b=ST+wZAiagZWMOXbQ
	xQjur+EWFNOrrfksXxRNcKBbecq2apQ0gLGdeB9CknpzI1EjW8xMaWgvZzEA1/4x
	jOOD3S0Gd1kCBaMFs1fhQV2+ESoTSxRNrcGjwEVCgBSsXnTDdQcl+pfHWVn2elBQ
	QF6tizb36gcJeub542GLm8GXLS/wj+E0CiepWLDn0T1tFLg2oVBF2nGlXCGO2o1L
	KrkJmvC2cQbhL4g/x8BQq3jJ46UJ28rogNmiMb5rUwJbItEtM7d0IDH5lj+G9Dcw
	zg9NqeShnqQE11Q+/s+b6ka/euK+xCDHy7hyaioNH+484zS94Ax4fMPTCXYiqq0N
	ZD3gKg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ta7tykn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 15:40:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3407734d9a2so274251a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761838855; x=1762443655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iu/DT9P54EI5MUozyWp4JD5DwnJiMwa+YhfcAZOr+js=;
        b=XgAGnnubv8Otag0/ZoamfALP2EXfMToV2nBndeNW4zRq+vLf/hL/2PoDvHu1RJXMFy
         jskt58yA/b+xEwd2Db4PdAg0r7FUns+Lw0wnuNghIbm1gE/MeryqY9jXVyjIJV+YgdY4
         XoLAGl6999i6XrdhGlr9WlRCS1uRJB5PfGzk3ertEzGLi5a1jidzCN7fDV+P/cDXvvkt
         2AQi79I7tXgdfW32UKh14IkhYR4pDgRZn6cw9C/SxnDBt4pPUzfG/fJlhX/90pYTGcNm
         DuksMBO/hjkyz2Lf9RUs4EeMarUw4RWtd3lZ4sG9HThXO9vEc+LogGfstzT49OgQCtWe
         cvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761838855; x=1762443655;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iu/DT9P54EI5MUozyWp4JD5DwnJiMwa+YhfcAZOr+js=;
        b=TVqG9cjuuNG9+9KwFnTj0pwWBkwmdroTYeK+uFn/g+pJwpdEEwRlRgl6LR+m+2BJxT
         lX28GP8HFEQywPjd11Sle3Lcr5k+zYnWUfd6lPxtuCNsf7Ex6wWiqZZeIq9G3pnLXdNv
         LN26umKEl5lSh5VasC3B6IC612ZPzs+GB94jIDvoJ3fVtvR+rrBck0oFu3lXKWxsY9DB
         ZcuMrC2S9QJiYp9hXwAik8mCJDF5y318l3n0H9JKjNKSpH7bLcWVcXQqub4SAmQ3VRqe
         st5QdguQpYeIJFUIKpIeqaMnQv2dGg1x1K29DkvBrnQL2BTG1/46swDXIbSkImtIh1Zd
         Q4Iw==
X-Gm-Message-State: AOJu0YzHeAiJyWVjyT0x9WcAIjJkQ6oUUKrZX5HUKYz0k70ruL5lxgsv
	VK2jGRW+ouLXkgIUgCsFiHxUqVyKhVtzyTG+Vd/dmq6rXV/bajpeOuIlx8V5pUJEo0FT2W30djC
	WVjhOrZl4fTHBq34fLt3IY8zfGyBGMPS8cjPm/8ollACloZ46PvEHd5T86OTe+PtVFIct
X-Gm-Gg: ASbGncvMdZJ771I5g+7kcwL/5ORof1vLMMXv12S8/JVM63FPP4NGioHPfeL2KbB3v6U
	qXGjqPiAul1ovuRnh7j/Dqt/DPxN/C2zhTpe8T9dNS/U7SX2tGoGzwvRyvK8zzk2X3Z4MZz+YaK
	E3vlPZBX92/w5n+tshSggk67zufVkGe/YZggr9iG1Vq1LnGBnHfwAXwbRPFkwJ5eF/TYrk15G1y
	weY8L2Jikx79BGA7LSmIuhZBfwNRgiOnw/bv3UJRNRd61/wkrDbxbBozDKyOJagUv4zlaJIJ85i
	OYh4Ekfgwg8T4Nf2oxqxoBFeRErdkgkgETJ9qT8KWuIsMJRX9QX6L6uu9GeUNpaftQ+cSMwmYHV
	iL6/7CaeJPiLAlX1NOnwvzZS4ry8=
X-Received: by 2002:a17:90b:2801:b0:32d:d5f1:fe7f with SMTP id 98e67ed59e1d1-34082fdebadmr240609a91.15.1761838854593;
        Thu, 30 Oct 2025 08:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8AQOF6TDmFZ/cImP4Ek3IuT+FobmtIVRhHPEFhsFiu27FW5BoBV6gTPFEZc2H7Qy5yjSPug==
X-Received: by 2002:a17:90b:2801:b0:32d:d5f1:fe7f with SMTP id 98e67ed59e1d1-34082fdebadmr240558a91.15.1761838853993;
        Thu, 30 Oct 2025 08:40:53 -0700 (PDT)
Received: from [192.168.29.77] ([49.37.154.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128e41a2esm17038834a12.22.2025.10.30.08.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 08:40:53 -0700 (PDT)
Subject: Re: [PATCH v2] soc: qcom: ice: Add HWKM v1 support for wrapped keys
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251028175623.1054084-1-neeraj.soni@oss.qualcomm.com>
 <75fd82c8-3e19-467f-bb8a-eed197b63068@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <76dbc148-84e0-0376-ada7-49dd5db19327@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 21:10:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <75fd82c8-3e19-467f-bb8a-eed197b63068@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaVsXBot c=1 sm=1 tr=0 ts=69038707 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=szWhtyoANJDeXNtt7Uge2g==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ANZi6w3B44dLpad_MsYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: LbqYM6bEft0EVYKOzBbWckgV8qf2AiyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEyOCBTYWx0ZWRfX3K+JsuzeLm/k
 W9Rm1+NnQybW1txM8IMr26rUbPDdI8wJ61X1av43M1BzeAq7R9a/YdhjyKMCiVuRDBtRY+pHReE
 HixOF6BBQZLuSRZmYHv86u3ytVTrVGConhzqz0DWdZH2K0I8yOgXrNL7zu9lnZ/gVb8e0kJAj6u
 CDFI7Om1sPMqtWpGhbpB5agt1Du68ny85163KnGSHfXhI9EWYVMOqRBL39a8fcDLCLf4It6YIKx
 z9CYOtaXvNy2nWi0GSWTGibzi/6zpgRvrEvOjahYpHsWENpth4qQe273EVfBomLCLYjhw5vEF2A
 //YGNdhCx5RDN2X6iti4zhOqxcbun1uE2pIrqqVdoIai9QGGW6W3HUeBj8aJwW/rdrYNxbdApFx
 KaCLmrKsk7uw02OUQL7OYDlWOuVoyA==
X-Proofpoint-GUID: LbqYM6bEft0EVYKOzBbWckgV8qf2AiyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300128

Hi Konrad,

On 10/30/2025 3:51 PM, Konrad Dybcio wrote:
> On 10/28/25 6:56 PM, Neeraj Soni wrote:
>> HWKM v1 and v2 differ slightly in wrapped key size and the bit fields for
>> certain status registers and operating mode (legacy or standard).
>>
>> Add support to select HWKM version based on the major and minor revisions.
>> Use this HWKM version to select wrapped key size and to configure the bit
>> fields in registers for operating modes and hardware status.
>>
>> Support for SCM calls for wrapped keys is being added in the TrustZone for
>> few SoCs with HWKM v1. Existing check of qcom_scm_has_wrapped_key_support()
>> API ensures that HWKM is used only if these SCM calls are supported in
>> TrustZone for that SoC.
>>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	/* HWKM version v2 is present from ICE 3.2.1 onwards while version v1
>> +	 * is present only in ICE 3.2.0. Earlier ICE version don't have HWKM.
>> +	 */
>> +	if (major > 3 ||
>> +	   (major == 3 && (minor >= 3 || (minor == 2 && step >= 1))))
>> +		ice->hwkm_version = QCOM_ICE_HWKM_V2;
>> +	else if ((major == 3) && (minor == 2))
>> +		ice->hwkm_version = QCOM_ICE_HWKM_V1;
>> +	else
>> +		ice->hwkm_version = 0;
>> +
>>  	dev_info(dev, "Found QC Inline Crypto Engine (ICE) v%d.%d.%d\n",
>>  		 major, minor, step);
>>  
>> +	if (!ice->hwkm_version)
>> +		dev_info(dev, "QC Hardware Key Manager (HWKM) not supported\n");
> 
> This isn't an error condition (ICE vers 3.0.0..<3.2.0 simply don't have it),
> so I think it's fair not to print this possibly somewhat concerning message
Okay i will remove it in next revision.
> 
> [...]
> 
>>  static unsigned int translate_hwkm_slot(struct qcom_ice *ice, unsigned int slot)
>>  {
>> -	return slot * 2;
>> +	/* The slot offset depends upon HWKM version */
> 
> This comment doesn't provide any additional context (e.g. what is the
> underlying reason for V2 requiring a wider stride) - please provide
> some or remove it, as otherwise it reiterates the single LoC below
Okay i think it is better to remove it. I will do so in next revision.
> 
> Looks good otherwise
Thanks.
> 
> Konrad
> 
Regards
Neeraj

