Return-Path: <linux-arm-msm+bounces-62818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6088BAEBB74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32E741883ED8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7712676D9;
	Fri, 27 Jun 2025 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFhFY5Ug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368651C6FE8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037263; cv=none; b=JDz+FaYmzw1ZUPy/Tt4YUfT2Z4O2dHBUOWsWIdAdpYyK+VdGtBGQPLLD3sbRH7TTlqJPjEh/F2QVLf4B5epshreVWPUa0mr7WnQIZkXMFKsaNVQIpUd/SF5K6TNr/6pEoKVpW5LWPzwTt6A+MxIHJUAEnfmnmJvuJK7nH8Phe2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037263; c=relaxed/simple;
	bh=55A/Hin7oai8/MceYjyk8/dYJTGhYwWWg5y51ljPaLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvOUeL55ttHvgC9xjKDjYR7AfZm8Cj2/kAjCwceXFzDdyy0u6RpVKkhUiqKbCtPL4L14pCkQ+SL6uOK2g5xM9Qi8r5ck0F0NHZ1F3RMCOlMV26SQ6AnMwECUo06IxFEHjz2laDvfBAYwvR3STBWEP1s1j4X9RKlv7ju0IYtrwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFhFY5Ug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCsmnW009899
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6M5X4q5fSdw7OQCIrFZRNAHF8rjXm5Y3tv67PHp4y4=; b=LFhFY5UgnOfTIWl2
	wdlKdNkX+nxcGE9NLmss0yVp8+DLHZyKRknijmBZilSS6xbH2mbAQnDYBk2xMdZ5
	5O1TdWCZ9c8FQmSKLDU4PpUIvOGjDG5IaA7kz0MNAiNJkrkp3yqNNpxu/m3kTlXq
	ZWb0j1soWqBfiIiynWJlYyA4a9Rtw5sSW1980kRzh1Zsw5GCpYEjDls/YBW6WDDQ
	jCzP9d3RBVr07wzMBZWYa3kh24aELIgwOMuAZTTjNR5XqHiLVUxgZVahwKb/8wj3
	7ZiIcVL59RzpTqbtsrD04YHcIJUWl5Os5XIRF4oC0V9rqeRSSif7LAXTRsemIC7f
	CBsIIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fgys2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:14:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097083cc3so48469885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037260; x=1751642060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6M5X4q5fSdw7OQCIrFZRNAHF8rjXm5Y3tv67PHp4y4=;
        b=ldTtmlRI1Qp2g/IBo7I91F65152DwrkNIZTyhyzaqtBfIgQjUtsD4Mj3Tcr1P3vB54
         Uk91LIDQUry8xrWZXBUfF2tIkO5y7YdqsF1xso9IpV0dXYAbAv3eFA7nt0HNp+0JDFYF
         EjOLeNUDjzZ57jCl7a3j9pS7S6+MlCztGgwBkPhBwXTfRLyS1JRrOYSHlrxu5t+SiI4s
         8iRR/EsFGa/1KnHyLPJEKcblhH33bpdkMe46JyhhFIi4ZHkhglvxGn9P43GkOEOb0IBJ
         NTuvHYjwhnh1P5W93BL3NpQVSFDBr0Pzy08PmTnU8urbTooXL46d1SeD4mB+zGHQp+Oa
         YTQw==
X-Forwarded-Encrypted: i=1; AJvYcCXpZRK/xtzeNUnZh5MEbHw9UDQB2eZYXAQwIB9zfaTTay7MJjjIQJz74tKHZ/QPzNNB1JJ0Y9tofv26loAv@vger.kernel.org
X-Gm-Message-State: AOJu0YzMJ0hKN8svMtvosRyxCVCJXB9MkV/JiNb67EYSBZ7Z0sRCayRA
	2v1v30ZvqePUQJCHpou7QgcnE5c1VrP4E5iPcxSlRph18GIZO6P/Kog8cWc2e5CPmYHs63T4mFg
	G6SaN0R8v5fG4wWYFkOHwFjvAqdg6QXLx5eNA6wUv6fjyrNXMCmU1JLh/7riy50EkgJBO
X-Gm-Gg: ASbGncufh9jHZNXgUQhFy95z2M1eVK/fDj8gst+TE2FzQ5XjtcxgPBQvbNQ9Q+5Lkw0
	k5aetMbYUR4yn4QOMb54B+k+EQuPi0Nk9GY6EHmfppE9Fg+q+7HS3xYiCiNKMDoR8iOpFiSa2Us
	R3jtkK/+he+rwSinlB9juNdSE3BpJG2YsW/2ofm2KyIK3ynIzzjdGlBH1aRGSrAsh9DItjITlfA
	4TnVWbkLFW+RdV2Czt3HAFO7BBNopAolscRoJYXcGxaGfXlRIdNZinRnUe6Kbs5yJcZQ9k1CtBL
	XJhoKAJlyHihAz0shN5QSyCfYk4EEBnlRIPUNtxqY1UneIMvAodkAprgaypnDsni3LDpJEPfbO9
	Cxt8=
X-Received: by 2002:a05:620a:2887:b0:7d4:4353:880 with SMTP id af79cd13be357-7d44396f846mr211883185a.6.1751037260211;
        Fri, 27 Jun 2025 08:14:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6WBdJrvigCf2nGDYvaDd8CpQNSHPmJZBKggbxVz8mgd8mo0k8HFU87PzhkUBjRaat2QHU0g==
X-Received: by 2002:a05:620a:2887:b0:7d4:4353:880 with SMTP id af79cd13be357-7d44396f846mr211881785a.6.1751037259826;
        Fri, 27 Jun 2025 08:14:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca2095sm138790866b.162.2025.06.27.08.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:14:19 -0700 (PDT)
Message-ID: <29eced87-08c6-471c-971a-7a7882388dde@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:14:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250625043626.2743155-1-quic_gkohli@quicinc.com>
 <20250625043626.2743155-3-quic_gkohli@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625043626.2743155-3-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNCBTYWx0ZWRfXwym7DXXmZdJY
 Bq+Dz4NbGbu7gopbuaAJe466ww44bmzdUY82NTW/QSo1MyIsr5FLpQR4KEFY66+u4JN0MuSsj5B
 xlhfrOczY0eoc8pIOANMc/behlsQhG+7J+ZNQJ2c5yXdN1wf7U7Z8Ws3oEuqVY8xEOUokk4daf0
 cd1Hl5ivQFMUtJdkxrqAA/rtHGJxBOyvkVIArESLqwAPx9B4fd4u280FFYOFkFLj3CAl/2grdca
 Md+IBMFgMP6JCipgg4FQN0VvINw4KeMGz/0UKmF3vx9KzhUTDPgaqc8uF5vr7glIvWDfp0fBSAN
 gchtSJXZkl19rfsJw2x9YY3KOhrqwQS/ZrLnU7XSzmK1jD6HEJr8GgUBl4XQvH/khebXCLLnk2a
 nH/UlUOK43AnVF71o+T3kmbELIciAvNLbm0NaD4IYp9OxADzQgzXWTpZxrc2CPY9Ro/3upHl
X-Proofpoint-ORIG-GUID: 9Z6Od9xm44V1JwzXFwfm42F-JFrkvYw5
X-Proofpoint-GUID: 9Z6Od9xm44V1JwzXFwfm42F-JFrkvYw5
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685eb54d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=GSS0VzHe2Y3C4L18hMQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=875
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270124

On 6/25/25 6:36 AM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 205 +++++++++++++++++++++++++++
>  1 file changed, 205 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index bb8b6c3ebd03..c20e98f8399f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3692,6 +3692,17 @@ usb_2_dwc3: usb@a800000 {
>  				maximum-speed = "high-speed";
>  			};
>  		};
> +
> +		tsens0: thermal-sensor@c222000 {

@c263000 (first reg entry)


> +			compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
> +			reg = <0x0 0x0c263000 0x0 0x1ff>,

size = 0x1000

> +				<0x0 0x0c222000 0x0 0x8>;

size = 0x1000 as well

Konrad

