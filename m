Return-Path: <linux-arm-msm+bounces-82082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EBEC63E22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DEBCD363809
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1765328274;
	Mon, 17 Nov 2025 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzsAtqBv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPzJDpRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB10219A8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379470; cv=none; b=cjTd18WAPTBG7Ecr7nURGl5a1UxDaxYY+B+nGWDx74eo00qC0WUpPUqiFw195GiADpAP/vuG7OVgWVUOE5hZbadk8pRq9RiViTUTxoZrdUE1IpQ7j0TTgdLy6NIa223ho8293FsFx0It/qTTsKT8RJbLIUJFLuIArJS+UUqBN+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379470; c=relaxed/simple;
	bh=9Hld+524ZoUz3kdvtJtXMTd4zPqtzlV/D+fYSvB1dRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5jilMzufbkxnQozSV77IBZ//QIBfGSv82Af04+HYj+SMT+YL+StaiOzjolmeGdgyGwahvte7rJDa9lx/eFcvGMm6d4SbXqO2kwRes1UWUjStBQMQV6ObDKXcni1BEuNKn8OYiv4LQ3g8iYy8gxgXmYFcKxArJdIRtHRS39s0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzsAtqBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPzJDpRP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAC8T23571621
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=; b=YzsAtqBv1oaoZD5a
	znqxGg38S5eXixMDyldcV1RdZ20nR45ubEuXXuEg3Si9Q7RVkf5NUG6z59g+o25v
	0uKuGSOyg5QNa9/nvRb7fW5yjHNRswxZAyhFK5duE8M8sftu1GgVjP9Z09LWHmoV
	369ZYRenEuK5zXBx2CH6l3pjCkkXavqIsdMpo1iw+ytT5df2ju0Q0+pkoLlUEuYm
	TEp4RjA5pxJN0yph3taKDgRQrjefFFQeaZ7LU7l9aTKcn2JS711XFg5RWCAfleTz
	8e7zL1UjdPQD/po5KHgp10PqeyM081oPNhlVgw4L7qAsunb9HxyImukT6Wh9x5DL
	wF8I7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbr79y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:37:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso3044481cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379468; x=1763984268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=FPzJDpRP8ZWtkysFzhCmrErsqZ7U77oWsLb3Fl++zgpgOzVnd6c94Qi2JmPjJDEnBv
         Rck6aUIu+loXkovQtpx/NEMyXRu/hyXpkAyDJ5KNKaqpG+RMkIoWliocBMRJCslRyqzQ
         xeQEvp294zDTg930x4igJ6LbrotYh3UhOxqc4Yb+HK9rNnjV8IbJqY/22V4QbZO8GPcz
         PsQbvOUKuMmlN+0DZo83NHbCukm7W15HnpF4VAatGgym9kmjUt7DEPOqeB4FVNP3Mc2s
         7vGY7LSap6F2OaD2lWx3y4sUDfoDfel0eB8lnjwjNkcSBv5TICIdrvlPkI1wYEnJ508e
         1S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379468; x=1763984268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=RATNajsezLWJSYduvIpw75kpAnQJ/R0viC4pTycZB0mUlnVv0d/HcQqNBTcc2Klvm5
         eznddCVgwjeV7dQjeIfhdzV8x2QGGaH6kZHehFPMZrlDA2sbngcTtz4SVJ4h8+aw7bqn
         xNqigiWgtN4d+i41Qff5W3E+lDqmHigncXKkf2ZXUXhQH2Qi9ZeizizYXcNotzRri0oz
         CSLRdcJnEtRbVUfkEZSfJ4P+3Myre4cDYgtM1D62fuktv0sYj79HSGWxMgonvmfb5JzB
         M3G8n4iB+XwqJrkH5MWatdzCEBOhyEtYee4lTtSobWG73T65LGTn5pOleK9egeUNiHCO
         gexQ==
X-Gm-Message-State: AOJu0YzDmHhs4EDQybLaIoQP19Y+cdTIA17ezAaP3npGcPSw4ZVzxoJ+
	0yJwnNzAcVxdR22gQZ+TQArSApbrJn7s1HX/rPUnGNSiYXyWF7dtQWCnfL33SgFjHQQ7Vu1wr75
	bmvGbr217TgXMHFy9d1karh2rxObMr5wvvsk9jrnf7YVA95vJ3M+7F+FejaThRI4W8DMI
X-Gm-Gg: ASbGnct3SpsSaWZXKt53uleX63kvKXMEKSM6YU2MzxqkvRFVyq7NA5O9fQGhuMoga34
	pGycL4Y1LIfRU/r10UDWG/2cGGAGv+RxbpreWa5QdJAQ1Vk2BUFiWShXOiHOjoDkCDf7hhFwwz5
	ytQKCepQJlyn+ttYk0fB30FfkDt7XdFLDH38yGQb+NLgKFhy0qcUgGWFcZwGLRuAIPrDR+xUB3e
	AQ6/30S1oAyulz7QArOjyeFTZlVvjy5f8G0eoBLFt+ejb/clEwhf96w7+Ol1UQ6bowzU6DVUVjj
	ZH83xtnUvVztY4yGyxNXoqKm0xHEns/q0mZRZq9x+kBdLto20uPCVypByhnNNGl58WQZTuKfsSh
	5GLZhnwEx69Vwif7jewv+50OT6XXLA1g4HLQRssyEP777w0N1SvbbtnUq
X-Received: by 2002:a05:622a:10a:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4edf2087991mr113426301cf.7.1763379467673;
        Mon, 17 Nov 2025 03:37:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOldFCAkYigB5bIYcg6yy1qXcWmz8eY1K5iVJL/gw8EWNzugcnNxNhynUwApFxxKMAS+hbCw==
X-Received: by 2002:a05:622a:10a:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4edf2087991mr113426101cf.7.1763379467241;
        Mon, 17 Nov 2025 03:37:47 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81172sm1051575666b.15.2025.11.17.03.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:37:46 -0800 (PST)
Message-ID: <906273d9-fae2-463b-8e15-b735ee86d6a7@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:37:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] soc: qcom: smp2p: Use __cleanup() for device_node
 pointers
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-7-5f107071d171@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-7-5f107071d171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GHMVyUhVkqEFb37zlVoo3hOxDtEqLHsP
X-Proofpoint-ORIG-GUID: GHMVyUhVkqEFb37zlVoo3hOxDtEqLHsP
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b090c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00rvZbY-6gurv9TMER0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5OCBTYWx0ZWRfXzw/uLnyckU9x
 t5AmzMuEFScqX8U2raOFZKoVKyW5TTNqb8zehZaguiX+odnxCVa5eJGEBSmCJTPcu6mymgyn71z
 qfPes0HLUX+lIiuIsGZh62L0rEcIr9ahRYbjZef7L5Z1KUg9F4DtuG6HSpOtc0jOzkMpWzRBWAM
 uDcQcqdne9Ry5MDUHJX0dsvNt1yUOictb+AMRBG+ybDnu9MgylKK2geiK002EJMUeyIIpE8OLRw
 bQkoQzD8F7Q9pAEhpW65YrBKxMw3UR02BZIolYb7z1vMfg8F0cDBpNoCgG84cJxCmDPyCpvH1Wq
 5ZCb/e0X0dDDFdxxZf9ecwOcaa6MKZM2vEjfrxH4LywvWq5tv2byQk/rluIbD7BCHvP/Lzqc7fi
 A1dIottb3+9j5bRYRgT1el1y+hmZdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170098

On 11/17/25 5:51 AM, Kathiravan Thirumoorthy wrote:
> Apply the __cleanup() attribute to device_node pointers to simplify
> resource management and remove explicit of_node_put() calls.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

