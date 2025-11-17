Return-Path: <linux-arm-msm+bounces-82080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A8C63E1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DCEA3B3828
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF80732A3D7;
	Mon, 17 Nov 2025 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mON8yzvs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmCDZWgK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634F3277B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379435; cv=none; b=fai/oSRHBpPYn8j9bMTXrm/ZwNCBThOZydUBZgVQFCb7Vqj82UY3dxa+m3dDf3w4lFBCu6oaiW/pP6dhQZNkvT2Mycsn31XQbiE/QMPxFyWyXdqateIRSW+P0X5v8i4/jjxSt/CTjGPahLHTLlHK2G1vQVTn6YSilO3JiTdjFH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379435; c=relaxed/simple;
	bh=9Hld+524ZoUz3kdvtJtXMTd4zPqtzlV/D+fYSvB1dRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqXWwPiCWtcpdJxEzcrGQoFzD0vJFq7QErfTc0giTu5ct5Ng25Nqm+e4qwc0hWiQZMMTxEIM6EfCzSuwG3HxXfnSDeYcUuhttsYGWlH5843xu93chMgA3NFMVWN0ywl/1R0jMAexsyZcbn9ctKc84KEkgv1gWGzaOiy9PzqBz64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mON8yzvs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmCDZWgK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBPfjN2910588
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=; b=mON8yzvsFs2bCo2Z
	/grUKXQ8eb9qQnhnCmDYXRru8qMlXGD33aFFcYH5mUj3LK9jHGhcVArQ6I3TtKQ6
	h+ac2YbUkuaUSqZu/O083WCLi9f6LiZ7JwbgQB29CymhTMGudjA8z4P5j6MDKIy/
	lwFqc8ulqDvp1DMOvDQ5sRn7AJQ1jXpZEcAc2E0hVa/tVxxKjdmaPttpvn13co1m
	x7Vcg/LqM+hcKNsUeP6nlmM1+YmkKz6dAippklAhYl0bZt86NB95mYtU2iTeOctv
	DEPzL48sNUd7VRsIR93aVZLhZHHgZWw/OxpVmdsgIR4EkNkCzvyAI+X2D7NiOq56
	KiKn6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejgcch8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:37:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88057e35c5bso12777406d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379426; x=1763984226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=ZmCDZWgKdV/0fJtDSqt2SU+6LLQD8DrWsRG1wt7ytdeV8CIJ7Br7xgrZwkGokjR9YE
         p6ix6F0Y15+/Yasbr2wqsMI2qyevB6tNX9kW/As5uCDXT4szDmOMCuqPrUd4wreFFdLg
         XePUcLW/CR8ak4O3ybYj2ZEY0ENVOyf5zG8Oyp3/prCrkItV8HSKnb25akGT4mzSqKdi
         AbciFqzLi315AtGh5TMELlZbS75hJXpU2CjIIFtabmxG6FYhpEuKtwxkB6l3CkKSTpG2
         rqGQzjlENLbt/UwRyiI9XA5IbyPoaa6lmbb1xiYEZ8T/FGtUVzHf482J7WG9JCCTSHAG
         yM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379426; x=1763984226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=oQVM9I3e0WLQx1W++bGj9OzgnD8kg3jSFhHrWjbU939q+0k+9wJl20UjLNmeHtlwGb
         KjmjNw+OLn7qiy0yXaBpGEVonHJnhiaRqZEaIiHCWn55Ykndos/JECI7sKEmvl19Z2rD
         7cnKgTOhmBEzL2M7kVUqSSWiU0iRMIX/UyUFEYZCGqo8WO75g16ZkwdhowDZFvFcDpS0
         FGZ986x4DU6BCj4ZhZ+ssIpRAjCxgKh2zUxcXUluuLd7heCzO3ABKsPwKZE6KK6478OA
         OyCEylECp83W41sc8E1MvQLGuYfLLqCvErGy8XzwgIDvdmyO9LfBBkjQDCEkQGY5PVmO
         Relg==
X-Gm-Message-State: AOJu0Yz1JRzgyJG94dxzz8INRdR8Zg0JuAjhzRpnk1BoRyKApXD+wh1p
	wFsbONfVq9WL1TX/4phGMSFgT2iI1EDPOOChlIrFMBVPc6NAqElHygUuM/8PYktmEgEI812eOAf
	a4w+GfMukYNuvlNBol1TzFKJW5FCsrtocux0W4NY3tEqh99EYbW9989HHU/IFooJ6DHUEXrqL8U
	N5
X-Gm-Gg: ASbGnctnkuyLNCX11hmro5OQmnH5iFuMtVy0GPpLAsGc3/+/yLVnWAs8USIHk+VxANC
	nlY2X9G/8+TK+NpwZcfDiHGfWiNC9Et7CNkGivLeYROTQipnmMnrenQqEE4EIdkYObrDlYNWucC
	zp8UMbbjWeATYQ67l/IIA/+49Sr3YqJwY+u+1hk06OV7w8GFLTgZnGaejsums5z4YxpEHXOe9E/
	TqRsMgQ5CtsJ+D4xLfTGV6/4dDcMCQkEJN4DrVLiF0h50W2i2GZkFfj795vXcT3NkPMA1HhPDi1
	SVNDp2SeVYHDlEmBnKW3SgrS5bG/LRU8w+onM6lWSk38GcXPAkg/QzGlT3RYdhqaLBUzxD/3+2I
	YNBxBRzv44UpVMLUijZZTNRGlvgQJpxfSfwfpdSJBs3rr+PZCSPxo5Gju
X-Received: by 2002:a05:622a:1789:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ee1fbeada5mr28913171cf.5.1763379425871;
        Mon, 17 Nov 2025 03:37:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZW51j8I8F9Cq66OnIMlVtr2m+8IiBP2EUKOzvwZyUnc772GEm6LiaBMyeoZHoKwJ1hjaoCQ==
X-Received: by 2002:a05:622a:1789:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4ee1fbeada5mr28913031cf.5.1763379425487;
        Mon, 17 Nov 2025 03:37:05 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81275sm1057017866b.13.2025.11.17.03.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:37:05 -0800 (PST)
Message-ID: <93d21242-a761-4bb5-ae76-6b9b18baab69@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:37:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] soc: qcom: rpm_master_stats: Use __cleanup() for
 device_node pointers
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-5-5f107071d171@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-5-5f107071d171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yO3EJjXFzW1bwQNorJCDLOs7tqqsqUNM
X-Proofpoint-GUID: yO3EJjXFzW1bwQNorJCDLOs7tqqsqUNM
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=691b08e3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00rvZbY-6gurv9TMER0A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5OCBTYWx0ZWRfX9eMGMXBEEmhf
 y06drACbVGSb3m9Wf9qBQxnFaMbIv0rniXx6w+R60CWIUnNe4uSvjGmd9xHiu5zdYSJerq9BQe2
 /S5WRJvlyxIra3YXTdG8NiZfbzKPkOjNjMkXwsF77WkE2DK5DWTj8RXRA825aQ9Ytlxbv7TxcOV
 /bK9UG5FruZGyWF6ymlQjE1vT0okQuwkqQgv8EQv0SQth8tRW0xEmZImT/8CtV2oI90Vi2nLqS8
 0Jhsx2quWyE4c701xBlZIh3BqR8CNkf5gnqK1kuKx4AzpOx/Hm5qUnkOIyvkaBUX1hvfmxs/waf
 bIxfsXsHK2D0Mh4QDTYXTmeXgGZi3IuTnySWUCB4AChZzMIyUPxdDal2kXpY7Nc9hyJQ1NaromB
 TJNIgnjjL2ohqeKmZ9mySEabHWl3MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170098

On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
> Apply the __cleanup() attribute to device_node pointers to simplify
> resource management and remove explicit of_node_put() calls.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

