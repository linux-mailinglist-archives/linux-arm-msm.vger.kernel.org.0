Return-Path: <linux-arm-msm+bounces-53266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE4A7C66A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 00:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6608A189CA47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 22:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BD71F2C5B;
	Fri,  4 Apr 2025 22:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mByJMVpH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D50E1B4F3D
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743806495; cv=none; b=rj4IkfQwVprj8oGyWiS00EqDk+uOlOdLOFBddM/M4GLuLGQ6HCGt3CwlDvssJdHFxF+Cz7syhcOWUpONjCUunWFxPSJ8Ytsinh9iaWMnSOS52DQIsd/hrftcPpb1hlh577hpDb8Wkg3Lut3mERF5/bp+0/WzlXjvXPJVI+C+8rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743806495; c=relaxed/simple;
	bh=C1jJcqO0VzfBIweuTkp50Zzvbn4YAQo/jb+JxGVx7zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMpkcEs275tNNsnf4qno+ZIX02jZT6bYYhoy31B2gd4QEyRAa7uchu6HC+Q2emb3isvRW8W7o/caCqCH8MG5TeousyYhMosubvV6VaL70j/s5Aj0mFtBw7BLvMOTgJyaOr5P+P9sP9q9Mj+Pjh4kmuKC7SwjfTdMiND/Op5Lvy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mByJMVpH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEqGR023778
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 22:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piQgtNf2rTZiw67RNzh+cHjlQOmWMuGvTuyfOlzzNn8=; b=mByJMVpHm1AziRcO
	mJjDzyEpL4rgvpKHAt6vBP25QrvH6bsmu8rECBDdkNJxGDyVdrC5rf71LSpY+kke
	35UDQVwgrUxZRKiIaaM/79WuugDJU7EsgU0Fo/EDldOAcWbyXj2pnF+7dXX5uxY5
	RxHGI7TebMkr9ltNF0wqpqJpZhR87uoF5VBWKe1Ncv73w1k1PaFFpUAJjcBKd8c7
	S+JXjv127wdDa6G5LdIecP7Cxgw6vEkQ/hgzE1iWO88ZxXGWW7mkP8j36Y+0ivL5
	UUcgqFNf01RXUo3mF7XvqApTZdqK2tm+TcfafP/zEY83mlP9jWHMAI6MmXFFeg1S
	rIUhyw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d932su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 22:41:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-478f933cb4bso1033681cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 15:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806491; x=1744411291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=piQgtNf2rTZiw67RNzh+cHjlQOmWMuGvTuyfOlzzNn8=;
        b=encWIoDnD4kBS5OQu71Xvu8zFzS6hEZ9VSLlqT92+Kl4sOyW6zejla2ZvIqDEG8mU2
         u4vAQ9RmSlnqmiyh/RW0pKGvxCX8s8chkQIuP6YrtodJD+5mg9B4LjT37Msi4kzgQ81W
         VXC9O8rne4sATBPgnKG47oaFSKoXj8ONchLrONx/ne1eo2cRc1UvnkZLj0hKL27PoGyw
         55pULgs6hVfpwDZCqVEVPbH9ok/Uo/QGXjR/FUP6W2YL084K6ZMfelNVhnl+hbTk6Cyd
         3HAlECY06Oy6nPazOchKJbJRzpC5TYre7gDBlEdvW3mf2RFo+60InKUCYHafD8yOryKA
         gG4g==
X-Forwarded-Encrypted: i=1; AJvYcCW0Ce78WWsuCL7SaeJBTn0s3KUT7aPmbizYkxsUrqyxqZVmN9aySi2MFAFepT3qa1NSexb/7P2SAMksXoED@vger.kernel.org
X-Gm-Message-State: AOJu0YxprPbUeAVr5+byx6tTMKsbmvmDJxl++NN1GzKwQO2l223QMJk6
	2O169wl1N0UGe+LE+ew1+GVLV6XFInCnFPoDM35oBu1o85DHScLWbYIr4dX3iYyViOdbHjam2jo
	iWd1rkKVYg/ifcyiFnIj1BdYOH1QhLO52lrpssKWSjWBdS0w6iG+VMI/O6zKr3b96
X-Gm-Gg: ASbGnctmiS+Lx6JVMliNO494vzD9EWPfFR6+ds2+yVBI85fx64jpmjENP86trslQHqj
	smbz5oCVZFgm71Ej3PNdgMwiOcsZG6Zzykfvmf7dLsoK/LVLw1RPN36AO+lTRa1yH5aez1fJZxR
	bBLbkeyJ4C1HrcNV8ORNlS9fRfFCSzL/iqFl4dqRoeAhaw9UcOtjIpBYRpuEFpxlheUT4fRwcKH
	TnTPcHbR74M/hnglejDodOigUAPriWRIyw5AnnGSGhcSqY4+VBRG4uePUG+CtQTqpg5coKwxb6y
	i8TV1sd192Nsdmx8svyLGwGjPASnJzQQA/ucfBVrjwTyBynrTorTWq8Q3yCSmHGa4z75ag==
X-Received: by 2002:ac8:5ad4:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-479247dad29mr29115521cf.0.1743806491050;
        Fri, 04 Apr 2025 15:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHI5XiIGSHW5UhGuECaX+GXBYuJp9Q5bhUJpvXtV4Ud9etqNLuJk0EDiqT/rOOweKfNIUqDQ==
X-Received: by 2002:ac8:5ad4:0:b0:474:bc4a:edc8 with SMTP id d75a77b69052e-479247dad29mr29115391cf.0.1743806490645;
        Fri, 04 Apr 2025 15:41:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f088084eecsm2868990a12.57.2025.04.04.15.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 15:41:30 -0700 (PDT)
Message-ID: <84a41f23-21d2-42af-abc5-72147e964cb9@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 00:41:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/8] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
 <20250403120304.2345677-2-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403120304.2345677-2-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sOq1iGFko68UsQ8FHHL5YTnfjQQhByIH
X-Proofpoint-GUID: sOq1iGFko68UsQ8FHHL5YTnfjQQhByIH
X-Authority-Analysis: v=2.4 cv=CPUqXQrD c=1 sm=1 tr=0 ts=67f0601c cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EDSBdl3HVflM_WRIKtEA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxlogscore=731 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040156

On 4/3/25 2:02 PM, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> IPQ5332 security software running under trustzone requires metadata size.
> With new command support added in TrustZone that includes a size parameter,
> pass metadata size as well.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

