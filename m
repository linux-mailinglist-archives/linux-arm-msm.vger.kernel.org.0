Return-Path: <linux-arm-msm+bounces-75126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9FB9F9EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 839D71C22A42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E7426E6FE;
	Thu, 25 Sep 2025 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eucOK8fH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7EE271A94
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807675; cv=none; b=V2TzR/2zBKJUFsIS4uTFgZFaMl64kJq8SAFFUPpMDWD+niYZQqk9bMio5hRM0KjcRi5jml/kc5P2b5h7T1/fHJMq1KS6dht7hj7mHGNcx7jFcSitQ44PUHWPV8zxclP1n83PxZBjURKaTuFU0IT8IEtvQhU++Zm1kD5LTixlXH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807675; c=relaxed/simple;
	bh=k24TsHdSWeGcrDakZ5ZxZ4u26blxOVBlucfWSid3ZFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGHhsDLDSB7EOpj/+1+UZvz+OkO/RBs+Id4sdS7f1OhlYXuEgRJbU+TbGUBiVSi9YDK0zXTjJUsOK9Z2OcLIRHxa4HGcSjOAA+5q+cUng9MOepsG6hQ2BWXqyxYFadE0qODrP8w83rAXM9PdCiUyohSypr8HZYh6T3/QaWXkd24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eucOK8fH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9JnZA025358
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxuB5kT9QhvZV6VcXA7vRyRC6QPVlvbL5ixfpltHdps=; b=eucOK8fHI7HhgVa8
	3u5MMOZiHNnfVdURqAECjRHKZ7ExeVIJWHEeuEgxep4LuXhlBlpEnBR/EzmvXHos
	G+toHPzHRkAvSTEjqOR6LPGI7lyX9jRU+xkyzGAWPpjft6e/IrBrSAm0ITnqYaKq
	LPatB8rXP17OlhaP2ZtlEMZOn8bOnNE5ge5Z5LAz489BTMA60jD55IayqazRGlYQ
	pExZvl6BgHnu6QWVPnuvmj2S79PuMxVKuEWAm+xAKn/ROSbKzXsqLU7f0hFpCrJL
	myLZ+lrmcge1zbiBij+sJh8YKadcHFkKoMs5HsIrCuNkSTK93Zv9dF4YJXwWUY3j
	lpV/dQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyf0kgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:41:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27c62320f16so12386515ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807671; x=1759412471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxuB5kT9QhvZV6VcXA7vRyRC6QPVlvbL5ixfpltHdps=;
        b=bSy6kVZVXGE0CLLGVdXLRPnn7U0E/TocKwfOJAEv4pwzp094wx4UtZMF0Ba4xpB6D8
         NdRQBHKSpkrdovKjgmDgpCJrBh7XU1mxCVS/QdINdEw+cemfLVBCf72iSqRU64AUd/bD
         NvysKsocxngtrIqP9zgz+cXau7Uks8+h6eOWDDeUMLFvCB5GfnN4i/8fLpLBSiRGI4AR
         dL4jp61UqJ0Aup6Eq2hfQPYVLBdarxH1j0lb5vWhmD+uhBfP3vnUWWX3RV4CpHSkLfqz
         hvEExI9iMJahx8coFEVQNh44PVxl7rXKuYeWjhUYfZ3f59hmE/4gZDOPnYJbf14cAKP8
         22Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVlobXKQ9h169CH7z2/p+ANvyAfEFCbIQ/NZ/GorpcwpD/M9CMO+2IfAgxK13kPRnWEQXiSgGYfiL+M2hXU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4TBKYf9AhrGMEtq2Cp8aXghquegOcLBn9G32fd5Sfb71F1jTP
	hhuWXDSmBsoeYxNops7T+VxiHd3Iw6KORePn6jB/bubgPgmTsRoRE63eeEmTrG678/S9GswZRSH
	ftxbiI3imKUaEPyCSN2tzn31246qVCS+1Z113iHZtkIZN3T+VQpBzW9xfC8S7SgW0lXW3
X-Gm-Gg: ASbGncv1VMQuFOjO1MOjuD2ZBGePPXt/LZDyuVk4eJHWkOVD10MrRqBF+FrJoYqv8tj
	Ads7AT4fg+X5KQkpuxVYbGrte9zT6dp/OMw2beCEbL7gu9q3CbYrxZ2JXc8Az05NzjnVZ77U04Z
	/Tc9Vtlw/o+yJ16OZQlHIWRyPoFhWY0ZiYqXlr/YMz7x7nNMbtx6lQdn00fzw+DWEqp7q9nQ5/f
	bCBA0Dr7Vqbh0JZ3MDbrFxG4q1D98a8GPAyD/mUpdH1HEgSLP/qsWySOMp5wxmChAeZTPiwi6AM
	XC0j5wlMLumB+Oq62iQg4eI+NJ8WqnTwgV++8ZGEyQcktiDtoeXeErsummwMRmLT/103
X-Received: by 2002:a17:903:8c8:b0:269:9446:8e45 with SMTP id d9443c01a7336-27ed4a7ebaemr37331075ad.34.1758807670477;
        Thu, 25 Sep 2025 06:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc0Iz3ZnWQ7KLTGI1sXvRmOPwr9wL6X2M5C7upUNaBrMM/aDz21PI8yG4UpXaXxAe3VMbrYg==
X-Received: by 2002:a17:903:8c8:b0:269:9446:8e45 with SMTP id d9443c01a7336-27ed4a7ebaemr37330445ad.34.1758807669493;
        Thu, 25 Sep 2025 06:41:09 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3df7sm26066295ad.1.2025.09.25.06.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 06:41:09 -0700 (PDT)
Message-ID: <9066c8b1-bf25-4ce1-a0ee-16e9ab44dcad@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 19:10:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-glymur: Update the halt check flags for
 pipe clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: szABSg1XG59xqyf5dOCB7WcH0yg5Fk0U
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d54677 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=5wqTxrHxgjUWVXd7k2kF3w==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=encx6hSPGTGxlSLovxUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX/aQAY3Oj7WYP
 S0kCKCt8BizLxJcUW1fvTGSk7qTUNDqFOvtflzaLo4g3aOfBvGNX/9ZmvYVpiar90okwVJOoVhY
 sD2s4DcInNxubO+LhxRGKYrAAX2qOugHSP1iOMlRdwwrFbtiokqpXu7iXXEwoAILaeKqst6sSLA
 boWfaSQ7D+NXm2ipWbVLVoxSWvD0iTJAu60HGHvfP+o/fVFmXRImRNvz+EMC0YxEbr8nKUZ0cWt
 boOOvSXE+6Dd0lu/9SPFfKe5yiMU53PH6oUt89LwI/KyDDJurW/Ptz4/Du7zjEdd88BMs4HH54t
 BbAuJxuX4QwOHZYajMEA85t8M0epaJhT/dwZ+2IJPCY+Kam1c2L0KBXFe6GwC3w0FtC9nE7r4T3
 E1zfD5Pz
X-Proofpoint-ORIG-GUID: szABSg1XG59xqyf5dOCB7WcH0yg5Fk0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004



On 9/25/2025 3:49 PM, Taniya Das wrote:
> The pipe clocks for PCIE and USB are externally sourced and they should
> not be polled by the clock driver. Update the halt_check flags to 'SKIP'
> to disable polling for these clocks.
> 
> This helps avoid the clock status stuck at 'off' warnings, which are
> benign, since all consumers of the PHYs must initialize a given instance
> before performing any operations.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update the commit text to add the SoC name "glymur" [Konrad]
> - Update the commit subject to add more details [Konrad]
> - Add RB [Konrad]
> - Fix a typo [Markus Elfring]
> - Link to v1: https://lore.kernel.org/r/20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com
> ---
>  drivers/clk/qcom/gcc-glymur.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

