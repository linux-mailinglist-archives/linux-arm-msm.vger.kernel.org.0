Return-Path: <linux-arm-msm+bounces-80640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11896C3C7A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 17:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE213B9483
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 16:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B793351FC9;
	Thu,  6 Nov 2025 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ydg14ijM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ejb1xGIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20AD286D73
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446435; cv=none; b=MdOEKjkhoKh8nvWV1+Kb049/uh2qC6QRbJb8fVdI/RSYA00odP3R+7yGr6berxONTGtJl69fr+ei8M3tVUxoFbvcWvakanqAMYpY71nXiCsvwlh1nYQt2sOJSA1/oXfT/FQ1bZGdl9DFWMUKLB/EGAOF/Ir01k8tYo78+6UVT8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446435; c=relaxed/simple;
	bh=hUjqN3UmpFYq00xIpLfCIerEemZqaq/567W5oV6EEVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZXHeFRbkfGziAfwxqJ6C7h4sdQh4dErwfzwJ+APUu5Zsf1kHmywsF5KQl79cV0/8f4r6Jh5GWuUdq1col2QBp8YzDHe1qUg5+lp0un28NP1wIZtBDLlKDu41zHh38fvnrq/2C/KztLK/e8UmJX9o89o8QaslX9wXwEAi0GPFOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ydg14ijM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ejb1xGIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68jeM43383378
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 16:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1VaDp85O3a0ogLuE5Bn7wN2ygZpImA+jz5Nmrdl9jCU=; b=Ydg14ijMuPUiIsko
	KC0mTT/xNVdWJ/OhNSO6upps3QnhpE17KxJKkJPyLNFL6/ytVAi7nhO4r9gHGIFo
	KvqwWFLvmZejvzdzRN/9Xpbc0hSMMm6ew0JXQ8xSedWzN8ivlhyHTT0PSZmRSQf3
	5Rdzm2k1yRcMkF9iTBIzVOOsYAg3Ibmr8pO0yTW4fGAfnFXmlU+ABaY7iGcyawB/
	MnFHAcnSAuoa+oIZJCWMhQ+umGjHLkdPraT7dggXQpI7Gb4s3ndAIML7QKd5m2A3
	qXR1QsDoIxKSGKyAZ1t0kZ9SejzNTMVQTOwQdYmp0C5pLsh/ox8VKwpmQUnZiiMW
	VCguMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8reusbnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 16:27:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed73c9e3aaso1024371cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 08:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762446431; x=1763051231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1VaDp85O3a0ogLuE5Bn7wN2ygZpImA+jz5Nmrdl9jCU=;
        b=Ejb1xGIRw9EUqjDct6EqiD5aAyP5DSBylSdhVnXiILZzRRJjZnV0buXoljxeUF+5Ln
         +8cwndAdd/7PUlPqfArWaycPb2eDyrSpSTqhHBL/5S6cqPDfR3gDBRTCWkOQB0vj0epO
         xLBVNgM9wa3FteIUgv9abSu0zMvUES/n9h279a19n83gXtmMQ7J4NRK4/2eZwqaKQQjo
         6DoWyosGjMcR0/tln13WpWNzjOoeuMZHvavsnWjrbbYY9vsEb7MuYnu8obnkZE3uO9jL
         U4RQSTH1w1wYrDf/aKdhUpsxGlG1UEi1wlu+hc0PBep0FnL+0TpspwLu353PHKw2CvJA
         nPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446431; x=1763051231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1VaDp85O3a0ogLuE5Bn7wN2ygZpImA+jz5Nmrdl9jCU=;
        b=jQI0pQUS3cCCZoZwPUXSAjW8AuLUYDgR6j+mQ8gLDhXMhgTBCmNu6ikgXjEwo+1xkO
         gRnZoHuf3w0gborPdlLF0Ig2+Et+k6fbc4E8VDxCztdw+XmOU+mBZ6x112pqnQRDB9kC
         e0MEEGPp696U4u1beNacp+hTCcb1xv0se2qDvM9j8l2qgjuYEBIw+zRIXLCHW4RTOcYP
         9e3F1UbzZOTkMl16hmzG+5y8VWb2Pia1yw6iWOzxgTzAvl6EJmWERd+XE7KTQQanLs++
         uHFcBOg5aXsG/33vDDfbe4VXnsLbicYu0/2EwLyPwF1XFX4MDHlEzeGHcTsjJAlO8ovV
         DHkA==
X-Forwarded-Encrypted: i=1; AJvYcCXerDMKFzv6X5TogfDJptdONfgzn37kobKE92rMI31zn8WTxSSkYq3RTN+hyvC0Q3FHejWjL8JG8Nm6z1GS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6NT4VOcrL6U43MYu41Jcnelgob28WUjMT9OdFryv8k3XBXh4
	mJSU6/O8/ovyCd8uyLar5wQTbxNetkLe8pOUrM6+MKqA3Og4sgVO5Eman8dnqadu1z9FV8Qw1DZ
	mtHIXKoouTRi2oFSaEqRtECeC585nYBlcQY80wneLyglAPm0yJFw6/3saX4rg2eNkPdjO
X-Gm-Gg: ASbGnctskU6XbjoBV386J3pmxzPSCGnkOwpCqEUOY1wktNWgFvfUoZMp4NgJmK14eUH
	6fj96Ge0MU2X02z+5ViOQDZuVD3Urk5x0uudFoeRd7BfCruRvqOehjx1Xi8kTwNITi5GFxQCGBw
	00YB5jOPA3NDq1Epb8bHTFJLNC3mXc9P+i+JlpA/03W8icpxHVpl70doJDvOqWTgCKGleIs5CYI
	QZBErFYTGHrP0o3zDv8+9N+ZuwAMRx86OEIkXF4K9DT2RGyZzOaDCXra1W7OUSJDlbcWHhtPpEs
	M6/JYmpYkpaDtA/U9cnkHdHcQrCxpROdru9cn6ldeWUeGC2c9jjGmCIhJ3OvLmEPbaquzvfFGVo
	ZACNWgTI43OLW/TDu1+p0HjEPFaLjcJyAAAophn3oEgN+choFZwexoItX
X-Received: by 2002:ac8:5751:0:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4ed81554e98mr31936911cf.9.1762446431041;
        Thu, 06 Nov 2025 08:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGch4/nmENfqzYvd9p/t3ol3PAJQJYH7BPeMAhJloDyKCtlTa4jeKX7kLqaIJ92wnHC029zUw==
X-Received: by 2002:ac8:5751:0:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4ed81554e98mr31936541cf.9.1762446430436;
        Thu, 06 Nov 2025 08:27:10 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f8575eesm2131956a12.22.2025.11.06.08.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 08:27:09 -0800 (PST)
Message-ID: <17ba4580-bd78-4bdb-8e19-b326aadd3010@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 17:27:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcm2290: add uart2 node
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org
Cc: linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, mm.facchin@arduino.cc,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20251106153119.266840-1-r.mereu@arduino.cc>
 <20251106153119.266840-5-r.mereu@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106153119.266840-5-r.mereu@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEzMSBTYWx0ZWRfXxRMe/OcxFJTC
 kCHOb9exQLSDWbYHjAPSVcRwOudiwvIoBVwwdSPu8vOiQLDgRflTn3sLocd480hfg+BuBkSaQHb
 2EH7jl6hKo11WQrvWfkAvihX2jYPZ24Wda5gOEdSCNmUq9hIcBGc5+Hze1IwUBwqz5aNwjXkItb
 zhwCIJMlYmCSZd8UcgfSMn2jyYm/Svz0q//EbQ5ZtgjTC9Dt4jJ1xkTMK8Syz7kfSufwY7vY0mw
 tPd5I7zISjRMezP3kMGthahLjtCBpd5dsIq9JPLkMfo4YICfGCKXAM3nfcdEfcnNLHyqLNqNskH
 w3e24/z9sYU3vCulTOAw4WwzBfYOr0ZY0UIC6dob5GG29LKIBkpp2wNjjQTxCZfwtDzysSOhXDl
 5B9//TfWANqhKvlUSAu1EYLrRAQRNw==
X-Proofpoint-ORIG-GUID: 9sy9WdQ1alw7zh3MHxIVaPZXjBWNyzYN
X-Authority-Analysis: v=2.4 cv=RrDI7SmK c=1 sm=1 tr=0 ts=690ccc5f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=D7qGd7DG7pF3fn8uCYwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9sy9WdQ1alw7zh3MHxIVaPZXjBWNyzYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060131

On 11/6/25 4:31 PM, Riccardo Mereu wrote:
> uart2 is used in Arduino UnoQ as an interface between microprocessor and
> microcontroller.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

