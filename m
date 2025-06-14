Return-Path: <linux-arm-msm+bounces-61292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8270DAD9F09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 20:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E6551896D89
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 18:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6662E62BC;
	Sat, 14 Jun 2025 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LB9SfVIH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD57B1DDA0C
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749926168; cv=none; b=uYC/ec8L4gxWGT6kDw3iPmRyxWSmjpzRh002uiP9ya56ApJPfnhpDuoJDpdRuV8Skce+EJFbIp++M1/Kfz/o7XGiRIn2SxbuKlCaAdy9Z4ZlInTnk+lup8FlJdyn+owCjdV0WbuzLZ3CXAyryM32PdmzLDFLQSVnsqXjpCTQB+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749926168; c=relaxed/simple;
	bh=9zhqtvH20PGTQFl/hJ3B+6N3YFln0ELk3qsUhL0t/JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlUgwXppK8dFxENbHsm7AAUn9Rk2EwWsQ5/Gkm2Bbbk8x4QkmtnaMQriHxClxcDGvXgvaQOvUz2HWn6NxrtdQTE5seUyoHWMPLvgAzdrdLXh31TT2jVsjKk6C0Ll91M9CoTJNMAgmeHcu/fJYDZ+ISWg0SzrFpwUuCzwVITzbwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LB9SfVIH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EDd2nN012737
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fr3V+vnTlTkucnr/sMeFG9g9yGVUJcjlGidQWTV9CK4=; b=LB9SfVIHQjCfUJff
	ZXNcuH+jp9A8oVaghTkr/F7Hf9V11zJG2b/PBlIsKZD9J5W5Q4Cn14uriNm46/G9
	WRaXAUrlwDwLLd4ryuQKpgeC8Uoxq4KYO4WeKlL9ilYSPjYwSQ6wDG1vwS0XfFVD
	vwPlpLYdQgf9u8pGa2wvF9bWI/nuJIwul9OlMGthZbmsDwnFA9gkPprtVJcVjlvy
	0NIPOV+sf2x8Q33zQJ5cXmaWM0hlf0MS++oHKqo3r3eDXS/6dxfx8AsQ6T6LEpj1
	pb2xeZAG++Ofa4Yb0/VD0t8c3RSJoIroJ4/e+97G+ehse2unQsMWNW1XB7+udOET
	nMJ0fA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hf8w3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 18:36:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0a9d20c2eso100122385a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 11:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749926163; x=1750530963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr3V+vnTlTkucnr/sMeFG9g9yGVUJcjlGidQWTV9CK4=;
        b=DfsUGLj9PlgWJyBZ16+yKeKt6Rnim0+YmLnF5EBb+GEzGGNiGmAAgxWlhvJv8NwMqO
         uT1RBuT8TWI+sXAxlkZCiwjxQaRorhiKHqfJyn8wlxA95Og7/JCN+zlhKFjK+wAw/fm7
         vJ8LMUM9ZFInQqdSo2TfsyLZAqgzizoLbkqGbAkXDHsu55vtkQ4CpcvSfJnUVLmuL1Zj
         zW5lqFIqH6bN02YnuYchRe08dyZEHgeERExkfph+utUAq4PKrGhvcDZ0xN7xrLElJPX1
         TWJGmlH6Eh5QvkFj7GkIPYsUaGC5w6DJpo2Gs89U0Tb83woFvb3f7Lxy9AugK4Nw9p/v
         eg8Q==
X-Gm-Message-State: AOJu0YwUV4IGx1CanfTwLbRKJDayE/R+9RBf2COM/kcfqAODHVSPSBwx
	jPxc76Zi7J4gRHPMlZsPzIZDvS+peicz4G2nzu/dMuyJaJDLd9sDg8jFuk5zyiDmOwtWzXdV3Ca
	IR2AudH1JNysRkox7vbVPF6pAP+j8jSaZEqXGfOy14rPNnwZtzFrPG2DT7uozs4i0zQK6
X-Gm-Gg: ASbGncsbP94BI6GRw1k8W16tl3S9rBQjgyz6u5YeLR4e0vfEjGlSEnVijKYKbaFylBM
	sPiIdxSnjn9twuLJj2Xer3LqBojj+jZ2mWf6wlnZs9TGDIt4R5gbBetEWAjjUvxznQdmkCI2aVX
	LfArYXBXmQgUgSajGAWSDrd4hDYFJvmvOf9OuPJo3mPDYYWsOAWDQdk4xqc3FQ1iHGBrDzg2iko
	l3zSCUAV17eX7j+2DvAp3bQy5XJXdCOQ4ogniAG3t1y4XE/RKz/Lk+e+M1B1c8znr4+pft49uCK
	eLQV2VAb0/NDDviCOuOzrAVrxhDf08urSNs7fFTr6d8cqBLbBx+WxZ9bOpDjQHrzBRKflCErUYR
	VaQE=
X-Received: by 2002:a05:622a:316:b0:47a:ecc3:296c with SMTP id d75a77b69052e-4a73c394653mr23248801cf.0.1749926163467;
        Sat, 14 Jun 2025 11:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB04Fgqt4Kek4mgzb5bvMAWqJLI+/i0iRXx7obd5FsMMu74P3dH5pzCOJqmQmFoouzm+D9ug==
X-Received: by 2002:a05:622a:316:b0:47a:ecc3:296c with SMTP id d75a77b69052e-4a73c394653mr23248681cf.0.1749926163112;
        Sat, 14 Jun 2025 11:36:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe531sm346355766b.108.2025.06.14.11.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:36:02 -0700 (PDT)
Message-ID: <f1284637-7650-498a-b850-b5140c47e4e0@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:36:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
 <20250614-msm8960-sdcard-v1-5-ccce629428b6@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-5-ccce629428b6@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NiBTYWx0ZWRfXzFjGmAkHPhDP
 3kWk1k5fJB4dHyoOy+wlYsswzqPydNhfm5RsxsAIAKAylUjRRL7IHKFvJw1KArhlEdcW57VxbHH
 ioOD+9BWdbVW7YS5XyEYEv9+AxMT+XZK1wZG4YLPHo4roqGMqvxz6xXw/2i2BVoUVy1FDH/dONq
 gPcLgjnSrKp7eqaPJL2/+v2b8LbdfijpRAnqknDOtqw9QAzsVkwAVIH/m3NXMvSyKwrrl+CdO9Z
 rlI2tMLcJYRj0OcxpdeBcxnxdM4Jd+X5N+8BxuW9BFvWpCMvcRvhVvxj9Zsc4kEAeyWd5fYNxx1
 DsJcIO6kSjEZBRjKaMuvGjEpAhbm+9Io6vCInyCRMJmTmoV2dVVSprBNyRozQ4LnFOGCORYsdcb
 YvUtUHczlH53IQAZyDYdvUufCDUqPRfqX12m5IKlH5tnxtfLH6lZz4jSFCw2uPwK3tTPduwx
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=684dc114 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wxLWbCv9AAAA:8 a=BdDXOLcz4J6SvvgUVR8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: mNgo5ewa6YK4_tTMtGUyAK9fG322JhB2
X-Proofpoint-ORIG-GUID: mNgo5ewa6YK4_tTMtGUyAK9fG322JhB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140156

On 6/13/25 7:51 PM, Antony Kurniawan Soemardi wrote:
> Add initial device tree support for the Sony Xperia SP (codename:
> sony-huashan), a smartphone based on the Qualcomm MSM8960T SoC.
> 
> There are two variants of the Xperia SP, one without LTE and one with
> LTE. This device tree should work for both variants, though it has only
> been tested on the non-LTE variant.

IIUC (and that's a 10yo range memory), SP had some eyebrow-rising boot
flow (some partitions were non-standard?) - could you please add a
paragraph about it in the commit message if that's the case, and maybe
include a short how-to on booting the thing?

> 
> The following are currently supported:
> - Serial console support via gsbi8
> - GPIO keys for volume up/down buttons
> - PM8921 keypad with camera focus/capture keys
> - eMMC (sdcc1) and micro SD card (sdcc3) support
> - USB OTG support
> 
> Other hardware features are not yet implemented.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

As for the code.. I don't really have comments other than please
keep a \n before 'status', other things seem rather in order.. If
the dt checker doesn't complain, I don't see any logical wrongs

Konrad

