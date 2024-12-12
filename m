Return-Path: <linux-arm-msm+bounces-41837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6659EFBDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8192A1891755
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972DF1B0F3D;
	Thu, 12 Dec 2024 18:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2wP3XjL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9CF1AD9ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029680; cv=none; b=uevGPklTB59JfWFfsux5El/Upp1TBvx2jXlx/CprN0HgDrTiXHRkAio8Dt+dPFXPvobBToxj683b08cUTostQeY6IzoUzGk/Bnn8Ujf6R0PPUt0/DyWLoih44R3yvvbkuFpXBmHcIhch6A2d7WbO+M6YV5OOMeCXI3MJjmyUi78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029680; c=relaxed/simple;
	bh=RmXyiVL2gB4+cgIVwfgUVwfRgDhLYp0nJxmaXMtvid0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZxgOfavmpvhxX6/ylkLHflNhOsYq/2UN0DifM6Vo70M8KqeGiGfx4jWXmxUEg5hdqyWDuLYxoyv1aYvBFpMXrxxDSmv1wIltH5ZQI0rxUabmHL8GObAQC9Rz9nDR2vdz4/KbFrNAhMb7rtTVKrgrGTyTB/cqRM0vuIFCcqbJWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2wP3XjL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCDEiTv000539
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzMpNq0v4Z6hfHUf0We/9rKNd/zRTNyQt85n0NuDHVE=; b=J2wP3XjLZj7GtWKU
	OaL+yvEUY1IpgwnLyug1qZtFXCsKEIfwaaPpcZSX1Em/xx4gStCzSlviNekHRS5p
	LZl0j17h+lBhBM9Orszj2NpWk/b76BTfdl3uXURO4Mvh20QYU3lrQJkIlZp0PeTF
	IykCoQ3T9ZDh7vSaCK7/1HNVGuPOG61kowQRznyRSQhf27LkTeXTK80ktmPS61UC
	Y+tcqvXTg3H7pnoyGQI2US1K9ASDa4TQfEf+Q5YXlMTIZvXLs9ftjm9Yb//T0HDG
	rroGKrmk8wfzrcxk8zVChWNK6f4IEqeenxVyal2ah6zPXyMJSjnEGZoP+LrPodDn
	E/Z6+A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes2f06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:54:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4678aa83043so2358821cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029677; x=1734634477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzMpNq0v4Z6hfHUf0We/9rKNd/zRTNyQt85n0NuDHVE=;
        b=qADHcsrWmtdZjmGR3dA6x701MGWyh24fPpl9EO0jDw6WYzDfoimdlSIgpF6I5LD3wB
         maZiqwh7Z+3BsWVGFpqw3a3rLDgsp09uCOOiPiqq/cznBjJfXB0ZGRU0EEct+nd0oEJH
         SJiSI4nCO143cmQPXoVBwAP51sPGfjYFPtPr35y4RGx7QUBwUhaZHk4nKzSy3Lo1MoC3
         qyFN8B6oXPcO9BMg/cqdJAj+YmGuIPa+6bka1o4yJwnsq/z85ph82kMvbXRwtuSS+/1r
         xnSQkxXN6oSAlNQiuU9geIVk0Slyhwbpk6pxiuOXQShuq0Sujar/NBbCaWgcX4VkQlaS
         i6ow==
X-Gm-Message-State: AOJu0Yz3PAqP6IMpIRRrxrtuMSg8kZmH8KIrV/ZBnRU7ykclVe5oyKTU
	so93f+6zL9ukQyN0lgFQBN6q1nOH6gCP++c7q8kEAVc5yEsz0JBJRBvr0/nV9mhLLLVNGN+j4T5
	SUhq2f9JRV5EXLSDJZsB332rHCDlOQXzIVbYKtyvuGuiNMlh9KmmGB3VHsTuJkZwD
X-Gm-Gg: ASbGncu6UY925tKm7UGi5loklnYLQNsjlP8dzwMBI2Sf/M82DB1VAFpwLke95/KGs37
	hZrpbAmf9zj3rWDMn7KLBgHsRmnrZrWQ+xZ18dZ91tIayNzBF9yCwmtPt2FT2Nrdkx3mMQsF3fo
	VyMNApnbHIoUZks9xYyg4F84+y2ybV8qPLJOwTPGd+pib9J/PvMufYhB6VCulHP3lEyVIurQRFZ
	rYn0ay1wnApkgQqeZm1qZN9VA65O2jER7VplXxyrY/JrMqAPuwTVI3jpF6Mfk9NyUZ0W7xAiT6E
	LxONwLJrywbAwqkcWEiURLQIn7riOVQV7Gpfcw==
X-Received: by 2002:a05:622a:13d2:b0:467:825e:133b with SMTP id d75a77b69052e-467a16855e0mr9628691cf.13.1734029676916;
        Thu, 12 Dec 2024 10:54:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI6VguhI+v9cKhgNt6yZ71Pr372DR8LUkozPpPnorzMrgM6BVciw0/SqysoC+t7mA7t7ldZw==
X-Received: by 2002:a05:622a:13d2:b0:467:825e:133b with SMTP id d75a77b69052e-467a16855e0mr9628481cf.13.1734029676567;
        Thu, 12 Dec 2024 10:54:36 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6a263efc1sm424052366b.68.2024.12.12.10.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:54:36 -0800 (PST)
Message-ID: <46f8e038-110b-4213-a9c0-4670ba8fb6bd@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:54:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/19] arm64: dts: qcom: x1e80100: Fix ADSP memory base
 and length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
 <20241209-dts-qcom-cdsp-mpss-base-address-v2-13-d85a3bd5cced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-13-d85a3bd5cced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MKmOw6GLy-wsCrnNLnfHfZfRW3sjsL7v
X-Proofpoint-ORIG-GUID: MKmOw6GLy-wsCrnNLnfHfZfRW3sjsL7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=891 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120136

On 9.12.2024 12:02 PM, Krzysztof Kozlowski wrote:
> The address space in ADSP PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB): 0x0680_0000 with length of 0x10000.
> 
> 0x3000_0000, value used so far, is the main region of CDSP and was
> simply copied from other/older DTS.
> 
> Correct the base address and length, which also moves the node to
> different place to keep things sorted by unit address.  The diff looks
> big, but only the unit address and "reg" property were changed.  This
> should have no functional impact on Linux users, because PAS loader does
> not use this address space at all.
> 
> Fixes: 5f2a9cd4b104 ("arm64: dts: qcom: x1e80100: Add ADSP/CDSP remoteproc nodes")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

