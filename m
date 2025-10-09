Return-Path: <linux-arm-msm+bounces-76700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6322BC99CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73AF23B7160
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61832EAB85;
	Thu,  9 Oct 2025 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZM2f7S7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6071F936
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021277; cv=none; b=L4B/KHUAhLdjaG1v3L6lFGVCUI/AdxAMgAoEUJLNfXAHYOcJMgeKP0dV07TMPcVQEqEM8I/3jjnJ4VLXxeu6RTpNCZ50Dk4ZS7sguiTb6NuXLz2MCVOZlnd1Pp+0eAgSPjUuDotM9TLrAde3M2LbAkX1EOrN6z4UaCAqwm7HmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021277; c=relaxed/simple;
	bh=JebSc/8bvcUimgMsNd/lWd6nM62WGBHCTAHCfkSxQWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYIHHIISrxnpbvO5138tRmv6wuM3dpu2wPlzAmtx/vAn13OZBAPPZSDT96O65CfRJu5oQFQgdYI79NitEudC820DmWx8cswSHBtapDHhbldKA6CrxSseZX6IghXCcOdsKz71AB5DFnzWTJbMKqdXqQNLOdGv6oIqhjrCSWBPdEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZM2f7S7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EVrLS012246
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	keuwE60fL3CMGjPR1k/+ByDPG5LTHeSrV5RbukXg+LE=; b=SZM2f7S7PIqjbWJ9
	+9J8GwCkD1+bfzo2VJrkjNyx7Ezihft6ecbEG8trPG6arcDuw7BNYQxO27S284OS
	gjZ13Fyd1GmPsKgRm0mdZ1SOkJEDF82dhQ72fELRXjdR8uqfI/j4a5qCnb13WyLH
	ghb0Oag1ARok/vHkoCwfVVFTF85QuoixMONNjR53JXfateJqdslvT4w9i7Z0W/uk
	Ms3iEfoCLvA+9zTbn0r0TBfuM1GxuR4eyVsa21F2DvK+luw95VfEnyHK/a4z7OPU
	waYNpKqvKZl8jajCxZQ5Kr956BcH9JKdkEmEX/7LOgp4Mi1flYrqP3SkQOePmgcc
	JFwNBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kk8kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:47:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-853f011da26so52640485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021274; x=1760626074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keuwE60fL3CMGjPR1k/+ByDPG5LTHeSrV5RbukXg+LE=;
        b=Yz0djx6vKK13CKC8rXSxkO89S24/3itzhd1kxYV9NktRzpp8U9dEh05kefmK5jiz1Q
         TPM/4ZHvlprgZVUc7r3WHes89UF6SuXNPwiqUMbdiF3pkONwqRnVH7IGWAC479vQLSQf
         65793dVB4Uo5IVNfMdOJYk1yzASsj52vkSOCl6zOsQjqkxl7v3tus1M/pCOISlMDB0ca
         YLvWfUY1UJqXQElqRvdzdVRgAcKBn805q1uqhBSI/qsXCGZtpSBfoBu7/7spvcKvTqns
         xq1+C3TZ2Zl0lfefFKtAvSsOhYj2saPVdIJ3qTmBpupCr9AoVZd53j/Ix8W3jHsf4uq2
         BNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzWSUIvP6xj7+92hTcrdoU7iQvGLjYHMlF+xxOliEhEuMv7teBPM2sAcWzJ0KXTBXLjwgCwHhwpOJgUBXs@vger.kernel.org
X-Gm-Message-State: AOJu0YxVKhLKYbvahZdc/GI9mSjQn/ypNizFnYF09Vv4uUC2a5cjE4qV
	twhHrpxJk0WqYOA7DBAM6eY49T3TpUMe4bYinOTg+Rri+I9+I/eCKu3Y+Y8lMi+quhafMqWf3y1
	TicxlZHRbn8I8ciKkvey0Ap12IdXAe3LhUxj2UHvssSQTyyCPoxuX8XuIHN1MKXcTXqSR
X-Gm-Gg: ASbGncudEOYWwpOO1GsUjv/Ym8rpwkod1/rITCHYNGCwl0T93UVngtoH4MyhCl97Scu
	LpFgFKAmYKvsW1kdij07dwsx828FQvxPfDT5QhNnk+eSO1+Pr2NSuwa9O7uVsxIv8cyrCQa6n0z
	xi2bbc2VVT+4+mRUoKnnn9SiBegWOo9ILE4uAsiM0oopgY8KVdblzftJmycMk6gSnME8waZzXd2
	z2CAX+ch+DjyBFwr8VuDsJer6hq/4623n2q4W2u8KM7ppeTaUA51w/+CtUGdrEnjJre0sX0CWam
	Yr5E6OFE9biATXNqsIorDJ86LpAyoLZWpjT+IT+8WtA/8n1kyQBpOqKNShSJm49LHkTCeSEy7QC
	8dR5GS/2oSnlclY848cP+NhNbCbo=
X-Received: by 2002:a05:622a:6788:b0:4e6:fa1b:3c74 with SMTP id d75a77b69052e-4e6fa1b3dc0mr21483811cf.4.1760021274124;
        Thu, 09 Oct 2025 07:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHucPuwt48acjEjaqleOEWnw/8ACTq2+92kgGJ2zdigPQCuo5wdaNFzwbwUde+dJsC4Wv8fgA==
X-Received: by 2002:a05:622a:6788:b0:4e6:fa1b:3c74 with SMTP id d75a77b69052e-4e6fa1b3dc0mr21483571cf.4.1760021273550;
        Thu, 09 Oct 2025 07:47:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7c47fsm1928735666b.37.2025.10.09.07.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:47:53 -0700 (PDT)
Message-ID: <d597ca50-c52a-46f5-b884-17ab8fa780c1@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 16:47:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW
 cam actuator
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
 <20251009-dw9800-driver-v2-4-3c33ccd1d741@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009-dw9800-driver-v2-4-3c33ccd1d741@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e7cb1b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: POzrJBqn2T4KHiLa6xI2TJguQadG2DLh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX7zr87p5TPtDw
 Eqh2OpWqahRhBchC7DPgxh75+csSuPQ5EXlYVByaRo2QXZfmPkd0YexoBLfUfAML968S8xFF9Ia
 hQG/NzNEIGn9LwdYuSWX+dSaq7nz/wFRQseJEPySm4tdlNSxcn523yYtENVi6XYPXn4GKHbdpfs
 1OH0WUU/UxNUhd6v2uz+tkeYlC+61R6P++rarbNKuqU/v+4f4B0iDEtg0C2v/6cE13UghYOjTMQ
 ZTZkOFUZ6ET+vLmus7F3syw8oi/h4/PNV6s78vrMeIje/VFFHzdvqHjp6nNDTEhoCIOJc1o2vba
 oiEI+ZsQ1z23pu6/otw29cIk0lQJDZZ7IwYuw0nV1sBm+6NvOIitOS9ZCmSO4cYZ2yPjlCxI2TA
 966o5hO39pyFXfdfD/+b8IN9EyoEAg==
X-Proofpoint-ORIG-GUID: POzrJBqn2T4KHiLa6xI2TJguQadG2DLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 4:35 PM, Griffin Kroah-Hartman wrote:
> Add a node for the Dongwoon DW9800K actuator, used for focus of the
> ultra-wide camera sensor.
> 
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

