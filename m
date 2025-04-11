Return-Path: <linux-arm-msm+bounces-53991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35FA85B53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246FF9C7F30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F18238C29;
	Fri, 11 Apr 2025 11:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ci17F/Bw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E285238C18
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369720; cv=none; b=IZUiq8V9AjBW6Wug9/2KSw53VWWgMmLpGwtm0kvHtmHr1PSYk9rf8d2o4cfcfPuTdTFeJS7XUFEiSHr4yr/TvOFAYQqlIMPLpxtU2cS6ATTEXGBzM2ci9fDTIm2FEHzf5VTlEFIvd4GE9NxpU6xVq4CZ2CRJ58wS7jFVjeeEB0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369720; c=relaxed/simple;
	bh=jUMLJ1eCvjknua9RRmRhB2m3mbtVGyEUSu411bXGwYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XS9bx1HDHwQANVSGxlPdSipYMMdN6sTPg/+HsZsSw3gvETll9GC77YvE4sMQdg0sz/mxk9dI6IDHziBEpuey8CxKD4226jzxq4orQRG5+Xhs/Kdc+wR0tHQ2bAoKIteZxr4wMCfNmZPYbf+p83oUc5KvtQzGFH3NhEKlIX3kAtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ci17F/Bw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5Z4Oq032024
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 11:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o79Kq++JkZecfr1axtLkeLEVdcWYqekrcVToRZ72dP4=; b=Ci17F/BwT1aKdOvv
	wq6EajrQHGkgpJ7FvWMcLg8GakqxkYzGyw9715c3DXRH+TugoPLGcvpzEkHpesOG
	0Fw+7LeHbZend0HtcHLBmrXaYsVFcy+xwk+AW7+lGnWlOEaSR7DsybrgnHbL3rcl
	ftwYQGfkTm3n8+Q+V628a0XsiaZP2MmWCJt/tEn7VB4ky4eQ+R9U+F7VxsAxN0DU
	sMMkOK5XSYOpuGZb/guZlS9dRZ00DGpG4zvpnBORtQxBUNa7F0FGEMZOyXbmKCG2
	T8FAmkJu1IzIOUP62qpmlSm5wcfRAKTJAW0Z15ygsMyJtiBNV2tjF6yPUQWjffsS
	KQhXvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmj3k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 11:08:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso45755485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 04:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369717; x=1744974517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o79Kq++JkZecfr1axtLkeLEVdcWYqekrcVToRZ72dP4=;
        b=qjb1CHzIL/9gZ+LSnD4QG2Q2rkGqNCEpLokoR7dMhxT+1t3UP09LOY8OkA0Ex4kqo0
         s1IAO1FKMZfLGXyg7SLcdO0yxM5H4Q5ke8hAl0AqEye4Mn7S21fpZZh6Qeb6Ofjopt/1
         dVEU4aWeH0mO90Z9mcBtioAbMAU/X9rW2qoK7z0TQHSL23qguMhSino9RFYgV76JYqyO
         z0/9BJVx4/ijYI2vx47i2TU3vOTXm9+sGCsjJDUHs+oA43PeOKreZ4YTCLchLiu2KdKh
         1a96wduJ2rbv9nChuM9qxF29qfaaCaz0w7EmI+ChlzlckimjKuwAMcp5WWGEYK5SQZzu
         zaIw==
X-Forwarded-Encrypted: i=1; AJvYcCWfajljej/gwz3rGD+AvNUVD8YdAGYDXEw37NZeMrJbhJYWNL2mOBNLvLQW6P1DtlwSlV09YqxYJsVLTwLx@vger.kernel.org
X-Gm-Message-State: AOJu0YyEpHd4XquKKKIvdURM0E1FNkIijnETgtfAfYV5pM8GOjuwnYdE
	+aW3x6invyVvuhRFMrnKucdR4k4lNgx4nBU9Eo+rq4F0NdyayPaMm7jYdTxEkSWaSBNp5k/aHiy
	iKlpEYaFHGPdfgqaRXXfLWIiax/rc7ALceFBjQO4aCOxK6aKj4Vz93JLz0haLqhti
X-Gm-Gg: ASbGncu6Aq0r0PceLoiPyWpbn+g1HA8kyX0Mk5qJ9E778IEOcMXyvCeFdI3k5FSpM4A
	pZAVlylaNbjnnq/nfIFJOWapLBbcFGa/gCSh6weBG8IRfkDM9lcj4LfGjOCNrRU3k0gZxzSPtKm
	nEMcVyPgvhl0x4wRZjgOfjeFUbjztjRG6orAYo74QMgn0PA/Vg555jBBxELcroZ6Yg1uw/1+wfn
	pz5gWzaz7wh1Hgg+XRIuWkCrA0lBMP99WpJzttt2Etds4a3jV5L98KzYHvEQgKYsNp3MZOQZt+B
	fuNfykNmpjC1LuF+GEkpZaNMiqbSg3IPfUh7cPnPpbXKspOKs+0+bDw00nl7ZO2/LA==
X-Received: by 2002:a05:620a:270f:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7c7b1aea28emr58808985a.12.1744369717351;
        Fri, 11 Apr 2025 04:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjdXPyj+Dlz7MJrd4wV5Jmd512Lms/G0laHJzFzKIthM1oQjkGEBydvrhqVbYRgd7fDl+WIA==
X-Received: by 2002:a05:620a:270f:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7c7b1aea28emr58807385a.12.1744369716971;
        Fri, 11 Apr 2025 04:08:36 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee55388sm802149a12.3.2025.04.11.04.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:08:36 -0700 (PDT)
Message-ID: <608c57f8-4f28-4e68-9c14-07b280126d9f@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 13:08:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/4] arm64: dts: qcom: ipq9574: Add MHI to pcie nodes
To: Varadarajan Narayanan <quic_varada@quicinc.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250317100029.881286-1-quic_varada@quicinc.com>
 <20250317100029.881286-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317100029.881286-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wgQ6bLoBZPfX-mfMLqRqN9vC8RPRa8pM
X-Proofpoint-ORIG-GUID: wgQ6bLoBZPfX-mfMLqRqN9vC8RPRa8pM
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f8f836 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=87Z6qAKMJr3GWNWwxrsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=762 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110070

On 3/17/25 11:00 AM, Varadarajan Narayanan wrote:
> Append the MHI range to the pcie nodes. Append the MHI register range to
> IPQ9574. This is an optional range used by the dwc controller driver to
> print debug stats via the debugfs file 'link_transition_count'.
> 
> Convert reg-names to vertical list.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

