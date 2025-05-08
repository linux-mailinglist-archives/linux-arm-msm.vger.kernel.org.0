Return-Path: <linux-arm-msm+bounces-57273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C460AAFD7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2B1A3B65E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C0A1DC988;
	Thu,  8 May 2025 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+dXzOUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC84272E58
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715302; cv=none; b=m2vxhz2NV/RXw2HW+UyqRynneDlolhE/bl6Ua0Z000MTu9bnHzG41i2U6tsodAp3G8YbtvmBpm3qmwo3aJMjjaYTldIY89qC7nLx7pt1MERaXvV6x0TJ0meqOl1xLYX+1vnzTLtVs3YZgnvbNRpYCYMsowSLRbHy1gfJkUP9k1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715302; c=relaxed/simple;
	bh=D2p2R6SzYbGr76htpl+9rp1P3w2GVsL1rfjfNsJkVgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQck7mHvDcTnKJOm/ZGmwOMQH7+RV/uU2hAB70Gq2G9smGJPQO1e/OV8/j+H3PQV9thGvihK/sBwCS/R6hCLp0+O1ceSvbN7ITorglITmUVgqIjri2P68Kf/qiV7OqhJYXKGxWhMnYPc146XI/PXpmrV8vqy6CoBAadPDU7wcfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+dXzOUs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5488lOAC019182
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 14:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5elXAs3RRDCKmWaP2KRsgdXB/dfARJXr/m9cSVmgAw=; b=G+dXzOUscmeCMPyV
	aS5Gw4GVjMT2u/lOQwRZ5oQnfO6cKt9uY3eyfBdm9y1q0CSqbeIgVmd4QMtAbbLo
	cjBRDbGa+pquGvlhZPoyCThWmTqf00mNGnUbN/d+kQ37MySdUB3sdlPQcS702TWE
	nfD5NWat7WO9v6rd33uDJs1IYmYc8kRdfbBxiLK6c4qAGRpRFhP2wtRE+w4rnbUv
	Y/Oe1940AxKs1weDGsi9P+AJg302FDkAVyZkE8yVRvWQs+VRS4vc8sP197n0HRB1
	4X4ZFPJ7gsw2nuXxyA18FesqQfkccfDgice8I5Srqftwymwy6Cl861Fs5cHP5Cgy
	SJNKzQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj122c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 14:41:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5841ae28eso24168985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 07:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715287; x=1747320087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5elXAs3RRDCKmWaP2KRsgdXB/dfARJXr/m9cSVmgAw=;
        b=dr/ouqzjWsKuRXPrDN69XEN+do0lDO77/1iKKoZ30bkZ+c6DunUQdzrcfTEn79uIaF
         HzmX9FJqK2k26HJ6b5pYS061mp3mEGnQjNp0tdo520El4IUdw6sE2SN1UmDAOTyVc4gE
         YL6d+F9AK3eM38u6VfzY4H4CkMElCY4nDS0aPvBUqVuWRkkDdvcnpqPO+bSh35QGvbPS
         R2lwpHLQxQmFlHZMFV5zD5F9qex43M/5wu42+BB8l+Z+FEIeX1PRdjG2zgOqOaKiAvUD
         NnrOaPx8d0YKcY9pU/wn4neEOFO10uT8mUGlsm8zoM20AmHoXYhs476p9goXWmgm2q+q
         yJ1A==
X-Forwarded-Encrypted: i=1; AJvYcCWgzBHSUDuY3LdvwcixJlM5pA13ncXPjwdT+g1GoCB2u4bS7P2MVIPP1e6dd3FXn6RFQwaXcmEkbyz6sKZR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9tq8eE+QtcsdGChXGhIrCU90PuNx48aiq/W+6bblqlddj1j18
	JE4UClPMjS7d1vsoqJuRuRQctECKvzMs3SLhEdOffxqTj1GusCL/iB8XYGvgG8hkD8LAMY7yNtH
	ALW5eh6tiyonTpQxCTkjLwEOJ/+WbXUh0s4RV/TIwa4oczUSKdtOR7Ygbf+zBuR13
X-Gm-Gg: ASbGncvber1+uo7dLV6zfQ5FKC8hch1S04f3VU4BDWYEubOlVxWnZVKpdXRM1I4G6sq
	23u/EpBXUk/xsDAZkcidRAh++YHOw5tOKa5LyWOR5n5oJiLAYlCaKw06P74mpzuZImiiNPSOqR2
	VXnN3qHIvVH76ScLObZ2jiFq9Q1nyXIdTVht3EGN2LMlw14grhkLTT8G8SalJuhcgrWGcdg2TT6
	VWRE3TToMGDXtZFPalmO8E7hrfVp8Szy/dEJliEXKQvsRPCmTbrVBQ3OE9RNVwEmfhsBLgbPqRS
	eODhw+SA4nlV7Q+zgDmxtSywHREQe43tT0hmJfKaM8KUB3FuWbOpcSaQ0hogLOZItfU=
X-Received: by 2002:a05:620a:25d2:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7caf73a3fa0mr345848885a.4.1746715287248;
        Thu, 08 May 2025 07:41:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvotDF/EgOTa/Kwtd8jpkit/1sMcKqDxmTcLL6op4C9NEVKeeD4uecRAKFVemZdy2mMST5Tg==
X-Received: by 2002:a05:620a:25d2:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7caf73a3fa0mr345845985a.4.1746715286890;
        Thu, 08 May 2025 07:41:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0238sm1098500366b.106.2025.05.08.07.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:41:26 -0700 (PDT)
Message-ID: <64893588-544f-4cb0-8c0b-7eef588468d5@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:41:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
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
        linux-kernel@vger.kernel.org
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681cc2a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=q_8UC9VRXJzehZv9TEEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNiBTYWx0ZWRfXwXpK6lJqWcAf
 e0GHKjHPLRzUntcSn4q1g8p/dIB/h0h8/nnUESiWqIfshFsn1M29ep7pEkSgs+ziZwLSW5avkWe
 Jfdrg0MJgzm4c+YB3wkmoyu64xF4VSZqMazNkf09/uadxS+3pUzEftvki/z7X8/K1Ty2LieQSwV
 451jkkWZpmpr9zCmyv/VlWqtJJAd7LrswANzIJU+oP14Jneria74X3dERDJzv3CKIMzCqvUwHFu
 dSmulamb4TE+YJBtqEq4LlDUSYKenfCP48CnJ872B2m9m2C2D5/PSvnGIzto3zsIOPOAvksVbM+
 /KmDv4vK1v+i/Own5XjsIFsQhFLL+aQZofRgFIxKe+7vZMpQV9PIbc3oC0B6uvKc6Cx+48X4Dak
 BEynGZpukRPCHTO8QKLwbKBX0bxnCdS0j1q2FrdMuI50KYGOl7F3k8lAmKNTyxgOyGxLCHlf
X-Proofpoint-GUID: Qq2wZN8vvLmlgDeaceJgLtpm2InjboKM
X-Proofpoint-ORIG-GUID: Qq2wZN8vvLmlgDeaceJgLtpm2InjboKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=885 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080126

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> Add a simple-mfd representing IMEM on QCS615 and define the PIL
> relocation info region as its child. The PIL region in IMEM is used to
> communicate load addresses of remoteproc to post mortem debug tools, so
> that these tools can collect ramdumps.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 53661e3a852e..fefdb0fd66f7 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3266,6 +3266,20 @@ sram@c3f0000 {
>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>  		};
>  
> +		sram@146aa000 {
> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x146aa000 0x0 0x1000>;

0x14680000 0x2c000

