Return-Path: <linux-arm-msm+bounces-58230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E9EAB9FA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 17:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79DFE166E7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 15:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779D5156237;
	Fri, 16 May 2025 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UftFdbHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B736A32
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 15:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747408444; cv=none; b=Qu6ArvQbrMcE3Aa91m4o72G6FREkr5c/Nh+Y1tS7Ndjstr1fyy6AgJ5IPcEPoljEg888vebdwpVMxZraORr5xrdRnAJ0fOcVM6JTdDHFRjZ2enCbK2MFf4OtO2iweWsSY6ldBY688XeRB0xkIEPrGnX+v0AOCat9XnhD9dE8NIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747408444; c=relaxed/simple;
	bh=ji2MsarXRrFl7yeae/YtYv1fow4jjJzCAdklKRqtHLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuXCz974UZ2u5lZAn8JBH9oGNiiIBYzY61IsNp1IXVGWSeaTLBEjrGM7s0fKBePn61PL7iubKkIh4ZOZcxsvhHBWZwybFmukevsss26p3V5PjwI/xmo1wuhrWIW7jQL31bkIlSD9ILwHq/gRrtzhErTqsi2V7lfk7pipnnr8jGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UftFdbHh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GB0WrE014649
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 15:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLu3+hjcuIIAuWnKsxLgTgUWpF3MmcU4WCdhzBMUVNQ=; b=UftFdbHhwRRRmK2R
	RSge/Cz5SardokvD2dv2h7OEJs5RtaI5Lw7S4UheU7f6PGsbgehXUeeqZKjfGhUU
	FKzbGHJOW5B+NmWxKPwIep+BsUitqrno1pvww82d400k6evr9FhXsWd8jkAyIWIz
	ApaEEYreYINieATWQbV+z4ZWHyVlo+2D30ojN8UIf7yJP3yq4S3o8pVPe7OfeOEN
	28uveYgRIutobtekJUEvRbewVYaVFycqYo63SQwQE0AGTHTIqWIl7azD/AhtY8fp
	1fwoZq7mUhCdmj3jKgyshJVtDpLbBGkKqNWlqd3hA7eYdGscVWpcx3ch1qTvbDkq
	6aen7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpjg9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 15:14:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30abb33d1d2so4166466a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 08:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747408441; x=1748013241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLu3+hjcuIIAuWnKsxLgTgUWpF3MmcU4WCdhzBMUVNQ=;
        b=NGKvHP0p+w4xvzK/2slJKCQrdIKGyqx4Cb8am2B7XIY3y7nw5PnT+vWE1JhxcsIMup
         QDzEZxVVFxonPAN+E7G3rqkk/Lgr7NHZzHMToEC6m7KZsrPBOp4qJMQIozMfHL6F20Jg
         dekgzdJL5P1c4Y5vCZ/YBnkMT+7b5QTDeVsXP5Y9qYC4kY8LkBQz5/Zvf7Ddu89qFhyY
         HEvvtu5MURzAKs4I9vhaikUfth6Ln0YCREaUEAMzRd/BNms4N1qCS5s11JPDPZoLxfXg
         1GonHM5phIMr5YqLZ0jVDz9eNa/AeXMr4Z59AZI3vNon2HppmZRLnWZSxhqJG1QAiGSJ
         yHEA==
X-Forwarded-Encrypted: i=1; AJvYcCVEVcfbcT20tqNEn6OyWN+gNXopzhA9tvUfYBrbwQC2mc1PaoXwlIsXecxXKsI1kp8QWY3lHwffTe1QBD44@vger.kernel.org
X-Gm-Message-State: AOJu0YwlrwCxofFlU0Fgxi4NNnB+ops8K4PuoGqNvdiPt+5+15eRFcVe
	F8ODvLwrML40CheumlKwZ5WTPmaJBGVSsaJIKsgd2LNMChWjzv1uJV2GeB5Q31xNoZ49M2UajFl
	67xj9MAmiwfnvh7btuHq91aYJ6FlCbwH6xcm3RadULzFydmae5tvRESjdKS0k7vmKSM1lZbgU2K
	wv
X-Gm-Gg: ASbGncvlTqLpTFhaZR7BMW+LQ2hDC/na6J6o6iWF30TXYTkHUcgNRKCWfJ62xJ3uVnU
	EinxOD7d+NjEdHQYGTOpkMfZOgVPRiNxukLx2cuFEA21Xjq3lIsroJFj971VZ61xwv4IExJaIW4
	V2uUriKauBSS7/O4pLumIVILMbcbtWVKatCw9Qjss8dDt8t1woeGmVyO8NA7fQUPrd8Rxn+wU8M
	ER6H8rrlThvSbQCk3MqWduois6AhhFCEDhMwrdiKDBBdEp3q+O7h7DllT5n7L/nBKHhiqon9bfs
	iKUt51UQdHHCNPo1U6CF/SnOM9+koKKpI33TWko2SLychyk+r9AMENWdL8iNkw==
X-Received: by 2002:a17:90a:e70f:b0:30c:5604:f646 with SMTP id 98e67ed59e1d1-30e8322584amr4814804a91.25.1747408440941;
        Fri, 16 May 2025 08:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9PI7SUtWE9rx7ZEEoLHR4WZhmKY8xH8K9phfkI6WzyFtFIQ7RTKmuVc4in7kjhjWVvfhq2w==
X-Received: by 2002:a05:6a00:391a:b0:740:a879:4f7b with SMTP id d2e1a72fcca58-742acd5115amr3981025b3a.18.1747408430066;
        Fri, 16 May 2025 08:13:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfa9dsm1702805b3a.10.2025.05.16.08.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 08:13:48 -0700 (PDT)
Message-ID: <fa6e5f45-a6d9-4f31-ab5a-7c47200a913c@oss.qualcomm.com>
Date: Fri, 16 May 2025 09:13:46 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: fix endianness of BHI vector table
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250515095517.1867846-1-alexander.wilhelm@westermo.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250515095517.1867846-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d2HkXPh3x0jPV-BN0U1a1UkdTcwAmGFE
X-Proofpoint-ORIG-GUID: d2HkXPh3x0jPV-BN0U1a1UkdTcwAmGFE
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6827563a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=mnqbBUabxhxt7vZsbGwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE0OCBTYWx0ZWRfX9YmS8HcFRAc3
 uMmeWE9F4gfhjaF937QAj7mXtwkhbKwtTzu9d7ODtM6Zv/H94cy7/D4+DEMjVpbL1qhvUsdF7cD
 RbkiXw27nm4Th9xQnBLy+9/XHlnpLr3GTNh3u1xeYyr6XFwJSSaxMOb4g/x5Mj7TBOuxm4oR65k
 b+VNL/nrmr9l/WkCxiFphcHh4CAxpqAWClPFjV7X4lLH8ThMiVikC0hyXFrd52sTmIP/IdE92I+
 dwuqIdS/9t+9GMSg8K/FpZbSw6sD9Ok9alvRVXqqTL5tK8urHQIZBk04bMtKNLTXTDY7tI9b6Oe
 EPeg8RPqry6+BuRVk7lophPWwiv0E/TE3jL3LoxtRco4jrUNIhIEeHkzIIbk/zeXBvIqAF7XMXy
 9tmZtGkxDEwL8b+49vSLgvY6bjwlge+hkTfme+aRoNEJV8zf3FEMSef1GpjnLtQr3BsZiKgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160148

On 5/15/2025 3:55 AM, Alexander Wilhelm wrote:
> On big endian platforms like PowerPC the DMA address and size are required
> to be swapped. Otherwise the MHI bus does not start properly. The following
> example shows the error messages by using qcn9274 wireless radio module
> with ath12k driver:
> 
>      ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>      ath12k_pci 0001:01:00.0: MSI vectors: 1
>      ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>      ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
>      ath12k_pci 0001:01:00.0: failed to start mhi: -110
>      ath12k_pci 0001:01:00.0: failed to power up :-110
>      ath12k_pci 0001:01:00.0: failed to create soc core: -110
>      ath12k_pci 0001:01:00.0: failed to init core: -110
>      ath12k_pci: probe of 0001:01:00.0 failed with error -110
> 

Fixes?

> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

