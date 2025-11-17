Return-Path: <linux-arm-msm+bounces-82077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B6C63DAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59DA24EFD44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2298329394;
	Mon, 17 Nov 2025 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DT470DVB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSkBwN2M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EEB219A8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379345; cv=none; b=d5OsQPm6KRN92sC6YN9XWmt3k59u6wJVpiLzpU3ZsKlzoyZyESXdEkmUsqeXNH3cRGTJkyNt4heqHE5tME1mg4j0wIqiGesekHyFw6xMWiTkTeN9Jr517kDR/yE1K9KfOhcey4YzkIlJo76fUX7OV0feQbiaVBzDIiXf5omIFfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379345; c=relaxed/simple;
	bh=9Hld+524ZoUz3kdvtJtXMTd4zPqtzlV/D+fYSvB1dRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIdhbk4nCXgLIyLMiUCVr6kvLH3fdA53jKSata105+R/ex1ja3MV+dS8W9ErSyZuWaIgB71L1UPK6A80T2VANoKoAW/U+0IiKTxzDxq3fwNXpDP0SF7i6E4jC6A6AUUOAvZSUFDSoBDHrXqvKZN0PqDV9X58/09uaRMLvtZFMG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DT470DVB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSkBwN2M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB6Oan4108388
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=; b=DT470DVBH+DjqImB
	XTwLRYfd04yXj13N1mqwKclsXAkO8O1mB3bqio0hGy+YkYDjzE6g7KCy6FPO4n7S
	D/Uet+GC1v+qMKp62JAXa8pZzOaO9WzxYVZO/43jcNMoJGYP1VsFcWLL4GtbU9L7
	SJLc5nphZRU7YAzc9qOGF3+MGVEaxQ8YeTGNzx4TFR31h8tVBpn9kDIcqEYOjph9
	bA36fsIiQafWT48RkWoiuzHZnhElqbm0WA4lFgRPTCkdktJncef8J6BpyOAdLmRz
	a7l52CY9OKMhwcbt7kbgA6enExvBSqcKZijO5zNUSk9B8rW3uDUcKPXtH6JfHqdY
	LzVRbQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp82c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 11:35:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so8733371cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 03:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763379342; x=1763984142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=eSkBwN2Mf1bD/6wiAwkhalA9DsBRUclB56YrV8+5khVEPHLq193NHkv0FJynipqkZ/
         9al8m9D5BtZq1UJ+K8iPWslYFmq8ysMqye4z2ce58vD6AcWPAaR3l0O5jx6Skw8GxKpC
         utTFC1e7Um6QXQ/yWfmJd1BUePDhg3xF5jfMjmPwCj+v3k3+C1Vpk2E7VEqZUvjbUudq
         x4fZ2cxctNyo1Ck6eh96kmBWr4BzHnf4sd2FUBvBS1SWExPe+sB03RxSWOuT2Lb1OnV3
         DTTPoXNPszl7Eucdw7a1eUN1c3KfMEfLHYQBgVeilkECc4GH0rWZPvndrhyDhroXpBgC
         csJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379342; x=1763984142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMuRMiCnSoBiIpbIDCq9iNOMKtC6JjEqhRKezv3RM58=;
        b=f1wIPVt0hRZ5xjs5wSmb//9+VWICPjp/93o0qXX88TdiRdUuVw5s6Xs4kxsr9TKM4M
         brXxE1WcFnjL8GxD7VkYY6gadD1hBlgULZQmqE6bhNq0AoSXnPnQMrmKMScRYGH+ryEf
         ISySgs6mlV5dLGlrv9MALRWcVg+5qH2bM/S/VqnNkJ9LOkiPm3QTlY746+BPd0/MXgK0
         uxVsqFsc85XC/9J3M0hAurQDzTk2ApuyRDVsrl3FZc8CkIdFZ6lltdUUc4rGhK9ic5AL
         fZqEH8FdPHyPSScDaV4OUD1jp18agNkZDDfDJ204sakyDDp2gYPkxNa7Pzxf1bt86tGz
         rxXg==
X-Gm-Message-State: AOJu0Yxoeohqyk4Gd01qGGNBK7zaySt5PbQsVPC4J9aBs+eD6xS6EKN6
	zoPeONX2wG7wIR7sHGu/aAwUGxUp9d/9c8PbifWGSyKHNf1tIg5JnqHwWaUn4ovKRRrMMNKAdpx
	H6Fi6GhoemSRe/rsT5hJJQbIyF5HJd2FpGOecmOZAPCitbLg0/VAOcHcpnwFx435FY6Lo
X-Gm-Gg: ASbGncvOjhWOy9QZ8MfAWni8f0p/UenQB5HIWReVWPVj8zVjEefLJ1iJCtgHut7riPL
	oMr4NrR7BZR5OREsJtOQoUdN98arJcdd3A/gZE+Smm4QlaCBVNIW6213LdPydHlJ3SYlhpnvqSu
	hU+tzF6BDCyIcvtDZ4GhpKhH7wcz/F71f8o0pkxVcYIC6UqKliD12XOSdMfsNvvEvc0qYlym+qP
	McndqQEKe5ZzgRjJ08O73jerSqJnoCFVXnf5ofPsdgZCPNM7c0fD5TI73Zkretvbd4VthQTPLQ/
	ZzkFuorRs3iZL2DakcjLtK+/b20IgxZYyzx3oFie/4nQNavPQfHjLXRcrY1UQu7e6J8gSKZfNth
	+6/Myxrgspj1SSj3qJsatOHttMCqEcvdfrBWDsLsOEcsEPwWsElEn06LC
X-Received: by 2002:a05:622a:5:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee2580a67bmr15089451cf.2.1763379341862;
        Mon, 17 Nov 2025 03:35:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFawXlTQOhczvHdEp6aQpaOy8IIOiyHw5d2OzGAMju7h5phLa2B0Q0rDOSvRqqeUm13AVwQNQ==
X-Received: by 2002:a05:622a:5:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee2580a67bmr15089321cf.2.1763379341466;
        Mon, 17 Nov 2025 03:35:41 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b739911c14dsm299334466b.27.2025.11.17.03.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:35:40 -0800 (PST)
Message-ID: <3d9792c6-b6c3-4004-a0a8-0d91309ebbb3@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:35:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] soc: qcom: gsbi: Use __cleanup() for device_node
 pointers
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
 <20251117-cleanup_node_put-v1-2-5f107071d171@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-2-5f107071d171@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q_4eQrshRXrOGYLwLwcOZxwStLvhAkfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5OCBTYWx0ZWRfX7Q8D/4GnWjE6
 ujYOtE+X7HTc7959f3Tj7TBHACwp1Q7JYsdI++3QPayvkwRZI6g7Ft6r1GZDy4tm2mOJOxn+gxG
 lNLWSL1ntf1SdVuriJJL1PQQe9U4SU7ESTWqYqXeK/KgqrrYB8Nwxdsz3CvVMebmwXl0qMsJymt
 PQjkagiUR3pUSZ0BsisyiuN+Vk2Wem1fuN4x2RmkpUYPviAp/qC1HkmXf1ZTmTQULmToyScaPpM
 S86NTBmCl3aitpVdxqNboMGOAiubIaKpdt8sh6XVsdnygqrtRW44gLng8Ye1HZIKPcKvOYO2+DV
 XnMA1PU7RTVMFWwDg3TFgLOR2ngQnmcf49+UAe/hGUDo4GhHvnMc4eWvBgT/qAKJlt6UQrMZNd0
 R3TRy8fxgUtGOPXpIJYfEEixfxEmBw==
X-Proofpoint-ORIG-GUID: Q_4eQrshRXrOGYLwLwcOZxwStLvhAkfA
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b088f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=00rvZbY-6gurv9TMER0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
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

