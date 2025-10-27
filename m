Return-Path: <linux-arm-msm+bounces-78851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999BC0C4C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 953DC34B054
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 08:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE602E7F11;
	Mon, 27 Oct 2025 08:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWLQY8qL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE6A2E7BCA
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761553661; cv=none; b=US/Mmx0Ve0W61cBVi55c9g+wOpLjmgQN3EaDcFwVWU9ViPRJsmcyvidFh3mt+005BGPduDhHJMYY7vFjcHKPjEItjYf6n7GrdH7bOMWrP+uI2Iy7yoMIf2HNTzUYOJWhjYSxvYcwQ9IxU3Y0SRZYYEpvfj+reDNxG3s0EXDOGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761553661; c=relaxed/simple;
	bh=SD7mFn3Azck8G6ddO0hF8piSL6ovIEwmDhL2dXByvlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q++0EssER3o8FupldwH/tcGoIM1JxcTamTi6Jrzzv0dYRLy8ZZXNfRy6oABOLmAKY1k/e1dHIFg14AYZJhuiDQZ5ffOPd1QSHJWf/DbUs0Yb08k7zg1E/m9G6BHXjMHDbvx0/aTtFRgb0jZynAkldl64vd4r8gRTwTidtWFuCOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWLQY8qL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QMpWSv1001321
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fYQEo6dIiW98w97foyLVsGnKPCs4nvCityw2Go+JiO4=; b=nWLQY8qLLmuxGDnr
	JIHJrWvauWSgETYrqhPtZC9vlMFGI6Hj8lrQI/7dtlO60JPNh+ijJsR/e1ulqhiz
	uqOPzMCisa6glDP4LDE6CXa5TJV3S/dDgbbtv9n08XHmMxnCVXtMU8NfGLPHhu+t
	fZwDw3zJwb5rxLIW/RQGGn8m+12C5wIqhdP12V9i1m+hklhlc+FL1bWSZLgl7BxH
	4fcrkhERtG7O0dXUoBZstWZMZCGDNo4OtONZedvYnMLo4SYaq85ZParz+dhTB9zR
	aoOk78+nK/wM0pWBYCYJiru/L6TemfQxBMD0JMmnOiCsqrEZWW2lGLQ0uzMkx0nw
	spg2Gg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g3ub7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:27:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c103b902dso11528996d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761553658; x=1762158458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYQEo6dIiW98w97foyLVsGnKPCs4nvCityw2Go+JiO4=;
        b=M9gI7Kp7JY9rL0Gvx6eVA39C9bZsy1+5019M2bSFMGME3sDWUWPpiZgcx2Y42anR9Q
         XAyeM9KjSVdk/WHWllDVXCXOXQzzyqVocqGJgEX9kK3E7kFskOqzNdUgfPVV2QCMgasC
         +wtxB9kdA/0qb9GVxwTivE9Hv6arF5YhBqRZAds7VZrQvM//7q9ui6YQ3oIOlyhgYF2h
         CQnWWj4GqNtMP70EiplXiTWTLQmF+iq5XaJ4g4b5ttMKC/2m6e31KxTnOsSAk8g+NdP9
         XTMuI/7d4+TUYzPqWQ8ZxT8pX/LNx0VI24uYyoW6JJU680/iegloe9egVcJMIUFAEs0F
         GAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVna4bt1nqy0wyv+L/BzN+bzyOQPzAk0kBJfIKnlcSpfwCA12zQe57LCxvGXDLWb+U2c0Q6hVDHas87sweB@vger.kernel.org
X-Gm-Message-State: AOJu0YzHsSdYDN2FZpW/MM05bWzlL9Ae6TRBMgLaPKgGntcbPvnnatW7
	W+vlA+3O9Ny+/7CIBdcU/QG0tk+34mZPkP/L49HJs2MWBMfG9Lfn5cKGhepAlLzhfH2AoHSgIjc
	htXm1++2sgPdT+humYFWd5MK63otwyYdqgEIlYg2ui5VaOIfQxZ9YTmL6q3mEaet6UGdZdPsFw1
	wF
X-Gm-Gg: ASbGncsFZgIYx8zz9j8/vABWSMYVXxoUFOf24M2Q1VENkT0DslFCyTxqRC3lrgiU0ud
	SmEpkbMQvyc66ZHxYkin67Rwsv424SFDs52/qERgYESBieK9UudEyljwxitjDKKjHwOEwcyOfCG
	/eHZK6rrkFCrkPE2QTXQAHMeSF0xuMjVPihoyWQiR2Hni2yzgwlpjhAvfsyyzq9Q9+tE8jn8+7N
	Sx0fmJSmF12hC6XtWhY9XooJUHGokddbCPlRsooL18+Qd8IpesMWAMwmIuAaxtoWMYe07mhm4HB
	SzeUj6BYAEn3U9i3F1tqS3amVdRAKiONGpJmYhU0IfQmBLzfsyFHUNbYNcoMhRFE+Ni77fGDJf7
	zMNU5F0gyFQ3QTcCUJQns/5kCkwmX0pMLxqEngOHht8KymW2QruH1h4/8
X-Received: by 2002:a05:6214:19c6:b0:87d:f8d3:2456 with SMTP id 6a1803df08f44-87df8d324a4mr156569926d6.2.1761553657637;
        Mon, 27 Oct 2025 01:27:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw4iXYcaTwz3Rp3bM1QNtADojUTF4L8DQ6lROhsJhLze0SnEaWSmqFqR5f8Qej1VLUJuyOjw==
X-Received: by 2002:a05:6214:19c6:b0:87d:f8d3:2456 with SMTP id 6a1803df08f44-87df8d324a4mr156569726d6.2.1761553657204;
        Mon, 27 Oct 2025 01:27:37 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853fb3bdsm695248266b.52.2025.10.27.01.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 01:27:36 -0700 (PDT)
Message-ID: <b622f606-e9c7-40b5-b05d-4f011a98faa5@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:27:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce: Provide dev_err_probe() status on DMA
 failure
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251024-qce-dma-err-probe-v1-1-03de2477bb5c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024-qce-dma-err-probe-v1-1-03de2477bb5c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D-Bqvykg_Sbdb6TO-hcBRdMdr69N51Z9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA3NyBTYWx0ZWRfXwU7EQo1bBTF1
 7ta+2Yj5+pCq8/eNU6nEi9XxlFiazeX5xp8IkhZ9HeyEpXlL6TKCfc8abXbDupkd+aXY29hPsY3
 pO7cMb9AZM2Et0Fbw6iNreP+dfEcP5izlxeekZZZtIpePIzWpj/2rxc4c6Im5mNCjRKVjmPQbmC
 v8oIK8XW/V39HAM8VO0wh0oeaADqMGNPH3wzHehL0IL8czVHkNzsE+aMVLykuRueZKueZj1B8YU
 IFx21x9d2kIEQVgfUTVcrqaLcSPIxG/P/pUQJEBSgsb4hrtECRgubRQ2JBf1cLZbJ8zsaAR8t4F
 K6KaeVvsyupsiXJqRF5yFw6z1qVasPVx7j30yGScYDfzgL5QwuuMyWx2bVwXFgjHTaPuXJGBRQ3
 Gb8fYYJegvSdBoVAyZ4R+0zWV8cJWw==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff2cfa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=25NbGeS3ZlacgUnTFUcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: D-Bqvykg_Sbdb6TO-hcBRdMdr69N51Z9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270077

On 10/24/25 11:35 PM, Bjorn Andersson wrote:
> On multiple occasions the qce device have shown up in devices_deferred,
> without the explanation that this came from the failure to acquire the
> DMA channels from the associated BAM.
> 
> Use dev_err_probe() to associate this context with the failure to faster
> pinpoint the culprit when this happens in the future.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

