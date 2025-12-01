Return-Path: <linux-arm-msm+bounces-83974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C895C978F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7FA63A6296
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228463101AB;
	Mon,  1 Dec 2025 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAYc4YUg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dq+45n4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974432F60D5
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594754; cv=none; b=ZHuF6Sg4kyJDZaJYRzGyGBpRtecDmDAyJapyVqUiQEcL6CJm3jGaf+nwWkm5PA1LL2NStl+D918POA3gpRWZkSj8vNlYMvRo6Woy+bHrcfWfIpdQfZTZF4rMvjpT6m840cBhtli7wdtrwELoir6bTwCfRckxLz2ENFb09mDpZaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594754; c=relaxed/simple;
	bh=qZT99A4wGvygQo/mbpD9bqNrj3QS2VTse6d5hqYvHDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMX1K/gLmR3pKN01doodWa11VNji1V0qmqFViV1lCQmkY/MTlIUCAxHDa7fF0PmBCks9Ow8ScsjcW1w9dbwz4HmUERJSg+BFCyZUygBUxiLL6Gb/y1pBWsjdJosvpHYKXUnz6c3VlAPRxvGIgRAwADGA/fbchExv0ouxn0yWL1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAYc4YUg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq+45n4B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B16ihXw3689189
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMHOAXmr3YmGIq7eETPhJdWo+t2yPZRgpbTAHeL+27U=; b=hAYc4YUgF/bj3x6U
	hj+ilkCdw2PWkCSWt7b6gk99b47qrHZaaUJ3FKLpmsAM1e4rP1Z+8lMx1YM0f6Cn
	BmnvnNVgs9/LpWVJir6z22WU8FEaW5V8Is9xNS1RXcYgJe6pszxuX7MicWm+1FeO
	RIJcO0U653OYaYYMZCprfHv/jXQD9w1BeBKzLaNmJIDV66zeDXXK5lVAUEP2+kwj
	dPOmMQdzygov++pE6zTTK6exAXrmp1wu47UXlLKUK8jrt1fs68fkqMMlgpNgeDtd
	FMMEbyF32LsW0+hMd53GZ461rF0u90h1UzbgNKMtukKiq0EMPuN2zBgO+rTMaSgi
	r/DgjQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as61414w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:12:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9371fb8589fso21029241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764594751; x=1765199551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMHOAXmr3YmGIq7eETPhJdWo+t2yPZRgpbTAHeL+27U=;
        b=Dq+45n4B9ZKCP+F6C9Uf8HTWe2kMdkMdF+s88ZOj9qdymPhudlgtx6LPtlwVR93bLA
         yFp7fNKjJPZliGGI/DUuXsZO67B3qko9SwRPIWb4kLC4+0Dvbhsu8BzEDk7BFLkFuZvA
         /rjyn+KmvRXrZRHMzA6xcpShO/RMLK7vl2uHV/AN/73NDX/942xS0hMDW383yVC9EkOT
         K765KSCjjP1XEb1ZQqYnqZPhWHqqG0vLEluz5inZS1Gaop5rlrwb6jmG+uiTZhtFRl8w
         Uht+0q5fzrg3/JsfIEhUfd1nEO+pxzI8uHpW2rOR2hJHVXAOtoH1CFv788AhJAZsxy68
         89vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594751; x=1765199551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMHOAXmr3YmGIq7eETPhJdWo+t2yPZRgpbTAHeL+27U=;
        b=wQ62S8eXHjOedPruCC0L+1mxTl3ZxvESfMSK/UHJy/gcUpNCb+SYkIjaQ0jR/JZdn+
         +WqGbty64eT9YuxySmeFz+eByng41IKTSQjaszZdcrJ63VWwnDv8Ji6I4y/c/TKBQIRh
         h0t9af246r3MkCUdLELxhRCq9aj9AP7gzPQWVfyme6AkXd/t8ekZ8irzqpZWtzgkIV96
         IJ7YDzFrzbFZaTxXXYi6p4T5+GTeKwuhSzjnH8qtn8tc1OJnKer4ITmzN8U7I3Yvy5Lx
         ns6FLr/zt7AVgs9Nam5AXR/6UZdapd040WSeFP287CjNp3tn+w71/WUpIBLZZyqxmA6e
         Sxdw==
X-Forwarded-Encrypted: i=1; AJvYcCW9OmI57yxewk5sWaLm3uc9yDKsjvdsjcqLm/e4fTyNhpInh/L9OxAnHdSVYNaikjqEBGtQfedA0TVOsf05@vger.kernel.org
X-Gm-Message-State: AOJu0YytxivwkwC4MoT3voZywI1Rp1yXNsOcRL5c0XxOSsI2FGThqiIV
	wJRdAk2B29J9adfsKKfyGKaLwdNz4r+McQg41YTo+g7YnNvP0QUYO5pNggchNBXH8qSmXperh9+
	JCSEcoL9+MSADuZr9VESC606aZCxOb5ojaTfR7A9Gz7usw0YttaHLEpOHdmKMBBLPNnoP
X-Gm-Gg: ASbGncti9dMAhsFsvhhs6XGu5Hq5IGrvILSP2h6+bKLz9Y41sHfqMm+NOmp6XALatxD
	hQx3OGX2haMk+tVvs+6HDE6ScpuX82u9N/c6jxVHp4OSjs8yO7HWs3z2pGjR/2xdjcgAQFepYAP
	XCqo1pv2HD2KZcNqlQ/vn7T6w10qV7cTmQWJ9c24q7BKYaBTBauRUT258/ldsndvbL1mdJKXJFo
	HqCr/nZW571uYf2ZCAsSwbBmjz0KCPlMuTSAXSAifC9rdVJ2Fy6YpLtt9MZKMbAfzI6I8Et/K2u
	MtqE5AeV3f1J3ldJgoaE481XDZ/9uihgkstR4Lz7oN0hptN21MdzJCNZmK6HFrLPiTgOeNanPlq
	0Q7iC/C7hhOlWQRGmE5wLToSXrg8cNSHcLJcCWdNcg1oHq+30atAufNJkxv4VSewfm38=
X-Received: by 2002:a05:6123:590:10b0:559:5755:f461 with SMTP id 71dfb90a1353d-55e40639171mr287819e0c.3.1764594750631;
        Mon, 01 Dec 2025 05:12:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpxK0t6iN/wrOGuP/7z+DJWA4RkBD04fhs3p+FuEi2WWZRfG+MzisolUnEIWJCAWxf2Z44zg==
X-Received: by 2002:a05:6123:590:10b0:559:5755:f461 with SMTP id 71dfb90a1353d-55e40639171mr287799e0c.3.1764594750234;
        Mon, 01 Dec 2025 05:12:30 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6ea41sm12434761a12.7.2025.12.01.05.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:12:29 -0800 (PST)
Message-ID: <af230b94-b56f-45d1-b8e7-f2b9d396a30b@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:12:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
 <20251126-gcc_kaanapali-v3-v4-2-0fe73d6898e9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-2-0fe73d6898e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J/KnLQnS c=1 sm=1 tr=0 ts=692d943f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Q8HXKsudzEDKmgny2zkA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: AvrIDoXhFZ9H1x7CPHrCaZwdUQzxfzxf
X-Proofpoint-ORIG-GUID: AvrIDoXhFZ9H1x7CPHrCaZwdUQzxfzxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwNyBTYWx0ZWRfXyqY6LWoc3H2N
 mRMyFkf5+6ayRMRljwVd5Azc9+DD0s0HwvetA8ADw71T+3icND3mxNhnt6ljVTU0x8yicMgLkdV
 rVGP8Kmr/RkxWJ0buwpofZKReuy1d6ZSQpgzPzlHdyrOAPDE5oG1a5pyi8XrVjTred8hRJMyqKT
 Q8AIfCP5FXenwjz+65S3THqCjI/iPvfYH8wos/wJgtjbXig3ApCXc5MiePManUyaH1eZ9PstCvT
 c87XqKD1P0P1JqY6o80hU/1jbUEid3BSmw6ycAGUosXIjE9BXNjhz1xQtt88v725FLbIQIJg5VL
 ZLqWI7SLZQishTWmW06Yj/vhrOB51NB8deiYVVPQVOvZeS3HYZCTjjyg5xdgGSK4TBRrlhVMM1P
 wX/yNLro4CkrJXKKLdiCjHTWmDY7WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010107

On 11/26/25 10:57 AM, Taniya Das wrote:
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

