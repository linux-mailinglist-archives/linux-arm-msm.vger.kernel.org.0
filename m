Return-Path: <linux-arm-msm+bounces-40551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAF89E5B15
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE726161970
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDE921C180;
	Thu,  5 Dec 2024 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTrWLkPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F7F1B59A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733415257; cv=none; b=IbMRzreaBgVHEKRe/7NhlRXyxiiG6uGXTWvBxKxWlCLS3MI9Kx8MdaN5PpqqctGMEZIlXCZMNLfmINQ1EpQsFVaonXcSd/UtutxLpfrlKpYo7ze+Ab2hOYM8K4IUF0ATVVGRRXOJ+kVPTck3n5rgSKeiZ8juYdRgBqj97IupCjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733415257; c=relaxed/simple;
	bh=ZKhJq1G1m3Gl7Z0eYkGg5228J41LE41NQmhmVxlYvs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T48fDolak0yIb9pJGEMI6CjiU8CzbAgV2QrVvHizkk+BZTu6FoyyJX6mqVLq/cXY1vQTQ8cUX6Vr6cIRONyWZjGa2WliZPBEX2eaAvLRNGkpIx3iTqZ401a3MGx0MeASA9alLY1AyjOeUyvIyUJmXAz/jMe1Os/CR0bKYd1xnqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTrWLkPg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B58CJDd009954
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4bHhpGj4Iq/Q6Yy51YAdnpy2vhl7koPdty55UVbqnk=; b=hTrWLkPgl7Q7Kyhn
	nS2PioFKEwr8lscowNnp0SRIo6MpV4D8Oq2YeCTTMYx9AU26ShlXxfUyk+lO9zR3
	TI0TY+3E270sXnlEmJEB5dgBRtYjBQMNba9xSHg5ma3lYambwtmxmY6e1TzLIRcw
	5GzXGeqWrodsvWJCCukd4NnZf0LqhBrWxo7HQhBKewepqQ4MY2hbUPRreRoHqba9
	3Wfz1eyEO2rzaD6nzZbl5RFOxn6PlcN1WUTClH0QWM9CnmUMtdZS70+VYscbPS4H
	M4l2N2tfE6nOw3fcdlUO+9CrV+U+Jld+3gLOiB/XrLCgVSvElqTAupLXrK8+S34N
	UpNmEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v800acf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:14:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b66a3c352bso7404085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415254; x=1734020054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4bHhpGj4Iq/Q6Yy51YAdnpy2vhl7koPdty55UVbqnk=;
        b=C6uzfJemcZiJoC+VXK3e4RScXf55mIvg6Pr+46skJb04lKqJWkP9PPvQB/2LMMYYtR
         Mzntbeh1wWkwfUF1Y/ykErJFkg9SHm9YINdBJcOgL/eJgYbXS0th+52CdECo5gpps2iS
         UBi7LBRb7e6EFGdy1i3xJbd7nDtGD0OPw1A8CM4fnrOcM9nlHlJdWt/G/Z5+CGpIEksp
         EK+uksnkJ0AE+PwkjIiSMBkIeH1yj3BsgsmZ1rc5aWPAMMnKTPuHsGl2ntyW+bHlOob1
         lHepkTmrApX0gZuiA7CcB8KsQNh5Z9j04jpTSNc76cpTBY6HWqWOTSkQQxQpusuezWfO
         PXZQ==
X-Gm-Message-State: AOJu0Yz06JqC7zxKrb/J2ZYOfEl3ohhN/26wRc3whGgoTLCB+ineIU0w
	vkBcpdaImSS+kCf308Xa15BtCOQg8xA+LQYBuzDpTx+OYNH1AWQh5J5eyMLyrA/6zgyYxZNZrUQ
	1/O+yL1z2vDljLsT3zg5V1IBjAKHxgtoHSng24Nc7ewA8ULzMETK1lBPojxmVxCrG
X-Gm-Gg: ASbGncvEAEybCg325or7ejE1Cfd0W6vdM3zybQMhBR+4up5xxz1ev/CBdqH/V3hFDDd
	XGXL+JiB03hgVLp9xN9NHFqaWgFEI02BZ8dLbvNQEk7Pn/qA1+RaNzzWPDLGkR4kz8MgOBVnIak
	+4cAqdySuRC/3/nxwpWrEKMIyBnxejuOnd2Gur3AcqcJ3jf6SWoKsIZxZtIwlKyMK7+Jly7ofk+
	pjxLnEsfv1J9WnyBwlilPBodWnr5h8UBmOnHpcE0vq/4GxVP91h48b3Cy4EAaP9qk2z17YBqQab
	VGUyxrugjoeaMo+fDl0BKAufcoi7ZR4=
X-Received: by 2002:a05:620a:190e:b0:7b6:7133:b8a4 with SMTP id af79cd13be357-7b6a5da87c1mr511872285a.6.1733415253839;
        Thu, 05 Dec 2024 08:14:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeo8EnFlUDSRNwZoxgA8xXU7dReO+EiMtdKYMbSBAGgB52JxGgHU4GzGQnWeFhnhZ4jTPfpg==
X-Received: by 2002:a05:620a:190e:b0:7b6:7133:b8a4 with SMTP id af79cd13be357-7b6a5da87c1mr511870685a.6.1733415253525;
        Thu, 05 Dec 2024 08:14:13 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260a3660sm110733466b.167.2024.12.05.08.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:14:13 -0800 (PST)
Message-ID: <6d7204a5-a007-4637-8d42-0fad6ede6d4d@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:14:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: sm8750: Add pmic dtsi
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-5-4d5a8269950b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204-sm8750_master_dt-v3-5-4d5a8269950b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9F3bBbFnErVm1mBRzgGh3CNbxE9TB03o
X-Proofpoint-GUID: 9F3bBbFnErVm1mBRzgGh3CNbxE9TB03o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=780 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050117

On 5.12.2024 12:18 AM, Melody Olvera wrote:
> Add pmic dtsi file for SM8750 SoC describing the pmics and
> their thermal zones.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

