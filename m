Return-Path: <linux-arm-msm+bounces-52979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E1A77FCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 18:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E4C77A2DC3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 16:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466B1207E17;
	Tue,  1 Apr 2025 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuYESY4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD153205ADA
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523519; cv=none; b=uQwq86W9xcfv3/heFN+wnRMohQcvXtNr9ru+RVP64wpu2y3DucFgRJtKfwsorrLvHy44pkJac1pkIlXeXvzRYs/TQbUfAVLRKW1vDXWK1IpFQlnDpYWVgxQx0x0zcxMIexctMSE3SJNXaLdVuw71oHw7S98xn5gufn83Mh3BN9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523519; c=relaxed/simple;
	bh=FjnK+VEJGfvJo2g6Farn5qlcut5gatkOJIBcUkNGPt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQhcq/gedF2nBXvgjn4pHFV4zo8CrbThCp83rHTKkZImkcuiui0O/sAVX4EVzzauIcQ0fV4eUxQf/XjnxNF8ivpG64xaH70fRCfQ4iI16HjaDxOMnNMLl4loiWnSa2O4gDyldbbaNU003lmUIDSOgmQaGr8XjQTH4qSmwoASLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuYESY4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531FXeF7008422
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 16:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IA7B/oT79HtilXDgO/qFvO0UXqMPEVdc96N5gfIs+dU=; b=BuYESY4UeUswyQ9l
	yzKGjTCNJNUJtf2adScTPKZkkPChjemJKc+J02JpFkaQ3IEZ4fYX7Z/kTercoNfC
	B5wzIsfwpmf24rY/32JbZmZ/dx4LH3KaqQY1ELnoPD9Qr/5I0YUWLbNTCx8DYGSG
	j5KmYsC2VXeVxMMQ49pNf92vW3ljOL9T/BAwADo2A2Wqt0Q1g5gPT0KzkV9VVFvd
	M0oiOmjTFQ7DdrSKy/2VxL73ShWip+vcwDoMM+YmS/ozgIwsPZKyaxoGm75m5V/2
	AVOFXxzm/hEsQWfk43pXGF4PKDRgJSWFTgyYrbmpjcUX8IWP+vCiY0Um79BGrgQB
	etnKgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xnk0wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 16:05:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c547ab8273so29144185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 09:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523515; x=1744128315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IA7B/oT79HtilXDgO/qFvO0UXqMPEVdc96N5gfIs+dU=;
        b=abS5wLR9nP4qqBRJ4w8iuuL0iknKJPmKq4RRu968Na92EfajN5mYjA1JFSe4N4Bm96
         tVwBfi/MmqpX4hhaQP3z+b9OKVw/ZUl/ZnNZIfYpzx1R/1o7VZ6Y0Jooc8ZPkPHNLXNm
         pkr21TTH3E8F/nY4+D+QFWf06EGPTaTW31Qm77/OLcBlgkZFt+CPhVMvOrubPGuL7Fhw
         suhGPIKYgoVuyVcwR9mGz/E/zyUJLlZLInNSAMwM1L3V2tUn96YV++2Yfi6p1ml+0raM
         3oPcK3dy/+9XM6rmzFdmyQeRz7dmY6dZOUsFaMRYbE6lS8RC85/8tU3cZl6BsTE52MnN
         EuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyyTP6lLGs+tYNuSAiawpD8IW+596TMef3dHHamv1HfsJI8wm8egmZz2x1dxbLLlJwWL7HPLB4NLTc+z4q@vger.kernel.org
X-Gm-Message-State: AOJu0Yxknn7wHCaTIw/x1GZPP6bKVHEYb+i+zyOcNaspNkHGNK15N1B3
	5OpPEL3j181m59b21WfPqHiHaZJiwUUzSRwgID8cW6gdn6y3VPIAoCqgHdFFDaJRFP8mNVcMqDM
	jsojGCaKY7N7YEoVRnryCq3LtKLufQFGCm1m26K22bpMi3nUJBgCUXn2hcHNNexKojjsYuuxD
X-Gm-Gg: ASbGncsyb65XybNOo+OslGAsGXkLGOGyueeWJHchqsFlip1Jj/DQCFLJw+qVkFum+1A
	gi+jfYYDjrKs7b7tuA2hu3epaevERsuyPOn+qQ0Z/wGt+5IUkAwzU91WIEYOJpQHG0K43EHaoIi
	fFtvfyxDmCueBRbBOcDFuNtP7ej3ZJVgdOqZnVvvQ39ssCnGzuyOIr4oDknS6vEwD3U6fEGPq8b
	MrV1dc/d9fZpWBdtFnOhRZj+REXhqodHXCtCTVWpNKkTUemaJD1m4Za571pRsAU0KByQpCQjVtV
	1Q/Kv4TH1IVhNLUiFP+ddTyA1jRdISbZkMAhn34VimG0n4kI9Ptd+rY091IXkYdDufkfzA==
X-Received: by 2002:a05:620a:bcb:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c75cb073f4mr153743685a.8.1743523515530;
        Tue, 01 Apr 2025 09:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEscuFyFWFsirTv68brZWR1bZi8v2Jm9WWhZ+Cb63yKIJveWTii0me3gZoTfLF/2PEkywgG9A==
X-Received: by 2002:a05:620a:bcb:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c75cb073f4mr153742285a.8.1743523515228;
        Tue, 01 Apr 2025 09:05:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196f55f9sm789484066b.177.2025.04.01.09.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:05:14 -0700 (PDT)
Message-ID: <4c27d6b9-781b-4106-8165-97c9750cf99f@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 18:05:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] arm64: dts: qcom: qcs6490-rb3gen2: Modify WSA and
 VA macro clock nodes for audioreach solution
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-4-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317054151.6095-4-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8cJWigg4EWYdHDx3zH1HjJ5Ru1okgSXu
X-Proofpoint-ORIG-GUID: 8cJWigg4EWYdHDx3zH1HjJ5Ru1okgSXu
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67ec0ebc cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=jFJkBKkQciev3rdfaj8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=867 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010099

On 3/17/25 6:41 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Modify and enable WSA, VA and lpass_tlmm clock properties.
> For audioreach solution mclk, npl and fsgen clocks
> are enabled through the q6prm clock driver.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Instead, put the inverse changes in sc7280-chrome-common.dtsi please

Konrad

