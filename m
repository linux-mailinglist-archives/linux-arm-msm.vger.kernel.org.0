Return-Path: <linux-arm-msm+bounces-82079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B1C63DDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C22664F0D22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB6B28640B;
	Mon, 17 Nov 2025 11:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RObhKYac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvxK3/q7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B1F280330
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379392; cv=none; b=YlG+PUrqt0DmA41hNlOUMCwKZQsrVLudfz4wwX40U32drKKZiqcCbJjbxA6CF9JMn8GhzIxaZtwDD57gKHdDB6H3LrAqTi9iqEPcs157HqpDoLFlYI3+mUTS63XCd9tBoRyhY/UTP39aMCBuO1ZdjKprRZm26Yfvtr8C6uS+IJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379392; c=relaxed/simple;
	bh=9Hld+524ZoUz3kdvtJtXMTd4zPqtzlV/D+fYSvB1dRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfa59rXjUMH3jh9i7VJa63G9jsL2VNwHYr3fey4iUH+5nsqOHQbYL/yPPa74r6V0ndcxBCtQa7j3YT4GDUSvY6yL0PPF5ea4yHB9LVFvSUZUkpJNNvdtJWqiZJyA8rlm2ZxNASyCC+WOfOOxmodJCMVZZfZT/tIkuBJwg+F41sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RObhKYac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvxK3/q7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAqEhb3921595
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=; b=RObhKYacEXoevVmz
	/AjtAlUZNtHgRee4tVyqHDJ8UBYWXyOaHcEhJVaI/Xbd8Ac3xh1TAI0cVsixB01B
	u0qXlecrHMCrxapYHQJA+wmaIhX7Gnv0kjcRccJ0AoJtYNk6zs4xNqmm8NwSDEb0
	NcBW8ZmW1k4ykLWEvahPkMIjM4m8Nyw909P1UKqfItKqln7ghdGCuDzoIMuAntrd
	QlighhUzRh9ELyC2haiaOYnojUyji+JaeSS3k6Q2CnX+GWug66nhHkdct7UoihtN
	QOTWIx7dwbY1Rb8hAtsgnaP0ywM/2SCLW9zEyssR1AOn5tBQ1rQIk7cD8xrkGQRb
	Z7a7uw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2ay83nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:36:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0440a771so1818701cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379389; x=1763984189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=bvxK3/q7VkZpcfFJ7UU1fmtU5xikUMTEDBdfYtUYO+XIz+gLKoMTDnnqsbDeveNglE
         /prk1LWaiHd3jr/gmft+ZGsc/zzFazJCRS2Ol5PFSG25jqVEjnG6OgBbepsTChihmFjw
         B6s3SKdLsUi9XqI7puiSbeJ8GYy1DRpG5xNKg9JE6nAAGGuIJZ4WsUrFnae7YwgZqzwF
         3cUiOklJj0BBc2H3u4uRSbQrGaRQMYfYEZI+i01qcQ7fjJs8GBrZ2w39lOPN+jqsNb5i
         5RM7bpT6M40kOOSNQqiUH5crCFT1fbL9Ix5NsRozURcz8uJAf3pTj5g4h3OE/tz3Qqyq
         amzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379389; x=1763984189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=PehoswK8ZEKcaUs9l4SImaGfD2aOBcFcpXR6CvsT0TpDA96rc56M1/+eJaXqXU3WcL
         rE3LlD+XXw3HjgAG+F8jHvD5lwMQMHcC0svBjCMv0ylSwPabo4ZsysmWQcMDp7NzA7iu
         5FRLHvQ2PrlFUDJhkXOnoqT0EJzmkL2G9qjAUsgw0XDEcw4MKnUTyTcjU7qprYF6eO0c
         BcpIdaI3cWaHHQK8yFRoPvN0Q6lO5HcWoIyy4UWgYuyybkSPB9dpeCtZFrcUlP5ku2ry
         jqY8hoeAEcZRNhJQGhHzqkEG7sNDVG2+As3MXCiwl+r901mhyKZTaiB9lbUjkQll7477
         x03w==
X-Gm-Message-State: AOJu0YzclYiT8X4rFbG+zn8GiEFsglQ7ri4B//tlUpbrb++pveq+gCau
	cjXUNxb2zzBI2hIFZ8whql5t43RM+Qj/KPkH8O70A0rVey8DId4XNRTVy6NoHsFbeQrJTTOVGHg
	aWzTP3BXFUbW2mjJZtRPYgaYCZIhgipVuqGus5jE2o104KcaKwC6YFM7IG1AeQMdcIfWa
X-Gm-Gg: ASbGncvzwdMEJnSavH1VlqTxY6sriRlB0BQTT7thSjwg61Yf1HwBaiAv9FoOSy2wu/R
	g6oJZd+T02D9IvTeIR3HfgwzTdaz893Xyla4np/ZdBOX8z3hMTrvewJQg6fO+dMZ/sHMefVXsMn
	6L37/OEnbe8wixqIbKedgRTtiIWaVEsULjGbtlq95itBSHE3Cr1yucQsIu9QQ5GKU99J4AXmMQP
	o45hzx2r0pnxz7ZYH+OYmzxd1wTOXyFvInuxu4PkMtL1SaqQt193WsgsWSTm1VlRRwga3XQUl9f
	oHEeL4WJa+nsM/Bxkk3Dlwi6gT9y6QHNt3eaHjegprgCV042nmqDBCuTQMabK3liQ1EVYsTi5Qv
	KkoN3bIMLvxbvn6NoQfnlpo2dHoIAV+68QCy3YyS3MKrmggfUyhYBOwQO
X-Received: by 2002:ac8:7f84:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4edf35ed6c1mr103025361cf.4.1763379388766;
        Mon, 17 Nov 2025 03:36:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIrGFAQMIbxoPiAQ6ikE/WOIFY770bIQFKdCxtyRon3/xZAF/MeobEEc+D4v9aPVoIMQ7Rfg==
X-Received: by 2002:ac8:7f84:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4edf35ed6c1mr103025231cf.4.1763379388409;
        Mon, 17 Nov 2025 03:36:28 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad456bsm1076965766b.21.2025.11.17.03.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:36:27 -0800 (PST)
Message-ID: <2c3c4d22-7643-476a-9acb-b458cc9af2e7@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:36:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] soc: qcom: rpm-proc: Use __cleanup() for
 device_node pointers
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-4-5f107071d171@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-4-5f107071d171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dL2rWeZb c=1 sm=1 tr=0 ts=691b08bd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00rvZbY-6gurv9TMER0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 6wfDYaKTR1FFaHcqcygTiiBu5LiEcn6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5OCBTYWx0ZWRfX/V8RIsnWAf8F
 VABEbY5mE22iqCq2Nq06LeDsylQ/c5/jKlJ6GENKhrG0zj9tkRmVJrOidhKkWAy3ef5qvUgLMK1
 Cwr8ovG9XhyffvKrMVlxoUEQwxdTIVxKSySDv6ApG5EZF/rfjt9N3f3Wh227oywpbEqv58I/ixr
 Na4UEvjH8sBiM0lu6ElP5/YbI/G/BstD9y6mrCrpgwcFsROxGFHMY9xZoal5u/eCvOMoXsvU0BG
 AxMAsPUzvg85GUdI9/IKrJ3ntIQAfKXHN42G/nNrX5wGktZeEt+zSzalkU1NxYTEO8A9jE9qv/H
 7S3Ud3qBEzgAl10jPHiGQ73exj1iG3OrFNCifHI8mIlhrWpXLIWcwel+hI8mbpuvXOcAuOSsBvc
 986OWWr1DsE0ipP04NLCjwDqDFQ3Nw==
X-Proofpoint-ORIG-GUID: 6wfDYaKTR1FFaHcqcygTiiBu5LiEcn6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
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

