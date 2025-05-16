Return-Path: <linux-arm-msm+bounces-58184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7312FAB9826
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 10:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DC567A89FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 08:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD545202F87;
	Fri, 16 May 2025 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khpKJ/lq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6E22D7B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385689; cv=none; b=Bzq52IGipviNYOBkYYdoWFF7fGk9wnrCefumTKifQikSyXndm+KYtigWCr6/fl3JmK+QQFPiIvoJO7qmvS2vuwEyum9A5ek9WP6Fk1RHlzTprsIV1JCgpTqCgxPdpHyx40+DnyM5ivQt84WByd0oWh/QZx2S6p7NmqZllizRzn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385689; c=relaxed/simple;
	bh=v5W5Hv6EG33b3s8rj6s91pV8btXw4ms2yGlBx2oMrjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPTNeYz24yLAlfQHaOXms+KJhnWmuTUwme1w1D5QGoFiInzynKVMtIcemH+A4o4HULMaiQeuTW21PVdojkb2TC/aARJnfvpfMSfqckoaNaaWXQv7yaDncoeEb+CXQuEAmXdd0wCj/v89qH9W+Kmd8AzizRD03UWkFtz+vdnOaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khpKJ/lq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4N1id014202
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 08:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvrbpxQRygpuRSgHwmLJ2nLox+2T/uM2FR0o6x/entI=; b=khpKJ/lqxQRfvuOt
	ctGZbLkrQ6rPTzNfIdKM00mNtvRAi+i4u5ceeOMbg6JPU8HjoVmvWbT9J77oX13W
	SB4Dcv5ZPw6Lx09pNeQaO57soGBic+c39h1KF897vvEcbqQrklpuFhXRaZhj6xC0
	Rd3AAP3SZXYW73AGhGybR8JgwHbbttc7VSxt4lZzGinH2NApeVeb2PrXsU+gRgYE
	BsssfF9JtNm1NO0Rv0zVDxUUONYUrQZbu8UeVf5iSMSjpzfU9Ra8DwxsH0389Si1
	I7XhCUYAhfJ8flxRzx4q4IfOtEY2urCTwvY2tRR3pdKh1pBR/bZFsK8ExaK85LOu
	p6Q+5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9jrt02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 08:54:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476695e930bso3817441cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 01:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747385681; x=1747990481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvrbpxQRygpuRSgHwmLJ2nLox+2T/uM2FR0o6x/entI=;
        b=j59mMe98/yeB20NJ3stTVPWVNt7Oj1UnZ/tThtMdNQbqoBJjG04fv1FY6Z2OUa7IY/
         t/vMnz4R34aJJVltXO9tzPWnfM4yFSwEZBSyq1F3SEcGkN/BRBdBHQnDPsMSMib3fxVn
         ca0hG8OKFcRK8Uk9d8Pi58PEn6zruvRRK5gTeDpk28pTuA417OkLMttrr7V2OwWpuayk
         6uBRQjg6NXSA6HJUJ2f5x+TKI+476tzA0H2ED6on+l61qGH85CUKLrfgRkcAg1C3e9E/
         ppqXyMr8vg5vILmPPwkPqRwHgkuNxhvWCbjqlgdbKUNZSAo4TkwtewqO7AVLAqq4VXAo
         zrwg==
X-Forwarded-Encrypted: i=1; AJvYcCXtsX9FaGcNyWjB0Q6/rAqZIj4+UyueF5CEUzKIUy0t8vr+DriFHwvnj6SEfs2t3gaAoBtQu1fe5H/S0WKC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy34mpIB3EyBWU/D4SUPV/LlCO4EnbKFfeacFLU4BR1vEWsY5uA
	K28YmoQJ3+vfgg/Du9m+ZJRo5G01m/wet3OrG80fS4OqplnA67RFLrADMt2EmHIoS/ydzOm6HJt
	GrBXktKZk88EIaIRK3l4ZAQ5Tp3wgx1TNASjfcGjB/kjSvWBfkrYJPGYoPyIw11PITo9iEtWwD3
	Hn
X-Gm-Gg: ASbGncsfRF10QHX0LhDSbPd06yRJg57FgmAbv5/dC5JNI+MuVCvyFm/CGh0/s/+a445
	iMH7KxJK7zlVpr8MYlQ1igOnOVqiIdZTiDaSGxGvtYZdCeymggNYQCxTqjzmJgPMn3xv7V1cIvU
	OLRECgxZuuvUAT+KQvc9VV7ZCt0f6iC0iDBeYtEcdQLEp+PZ8mdfBl5bmeR/bK6S2/qaNcuvSMn
	00Ij1x1kmJ+UFoN66mn3vON/y6u/r8JzyP0IlUFZgPdwpMO3K3+zPj9P7w9CZlyq7MqPZ6I1amD
	Ql0pYe4W3HylaYKlbysMNjhOxjHbMUZuTqAxYFpxg6jVv8DK6afn4y4oWUnMFNci8g==
X-Received: by 2002:ac8:7656:0:b0:473:88e7:e434 with SMTP id d75a77b69052e-494ae421a73mr10063301cf.14.1747385681523;
        Fri, 16 May 2025 01:54:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN6TMEprtqTIgIm9y8KSJgwK28VEXNDOCDzXjdEPd9k8rvmTwL9YSHZZ+WWoKFUrPTxZDFcg==
X-Received: by 2002:ac8:7656:0:b0:473:88e7:e434 with SMTP id d75a77b69052e-494ae421a73mr10063151cf.14.1747385681005;
        Fri, 16 May 2025 01:54:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e3ca0sm1091649a12.42.2025.05.16.01.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 01:54:40 -0700 (PDT)
Message-ID: <b74a28d1-2dc2-46b7-848c-a62cdde27779@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:54:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: qcs615: Add mproc node for
 SEMP2P
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Deng <quic_chunkaid@quicinc.com>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-3-ad12ceeafdd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-3-ad12ceeafdd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EpR-w6CzFf8NLkWDyq0HRCUu4DUEwAOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA4MyBTYWx0ZWRfXw8GXLK2kxaAt
 3qMGDOq7f5E7x6VBFBQsNG4Jw/RZcVfsWS9by1wP2pvM1RioI0TQ3XI4Ndo/PcYzOp2pknf+6eX
 2lmXEbnKV0iS9Eg7zteJs9bsJh6z03NdCUHFdbZn7/EOA65zmGztpz2DetsNIyDwWvYsoV9Mvm9
 5pA+5+WS4Mab7u0YEgxFbkBROj2yV2fpu+yLWqL08qk5Qj/3l3DzyRBzXF+tUfOI80dZ4xg0Kt8
 EvPoFgsgfK+LzD+6Bt7InGUB2CEMzem+KmSRvl+9YpkqG8sRXmJ+wq65W2UK5zufc6Fs81PMB5U
 97818HeR2JvAxogoCEalAvF6RlFZ+bwl/8o6xyXUkPxXQ3X2IIeWbCycl2YRqAqpLx0CADlTZTH
 canQJZfSECfGKAITFllkmRlHD2rUPjbVsrT9o6oD59YClejscz2gol6dRjxbMZRq4rP4FhsI
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=6826fd56 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fxdFZpXxXALc2YyWw2UA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EpR-w6CzFf8NLkWDyq0HRCUu4DUEwAOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=746 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160083

On 5/16/25 5:27 AM, Lijuan Gao wrote:
> From: Kyle Deng <quic_chunkaid@quicinc.com>
> 
> The Shared Memory Point to Point (SMP2P) protocol facilitates
> communication of a single 32-bit value between two processors.
> Add these two nodes for remoteproc enablement on QCS615 SoC.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

