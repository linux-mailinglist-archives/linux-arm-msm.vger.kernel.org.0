Return-Path: <linux-arm-msm+bounces-52982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBE6A780AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 18:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C61A4188691F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 16:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F9C20D500;
	Tue,  1 Apr 2025 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a70nKcpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35D020D4E1
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525636; cv=none; b=o6Ud6qrMa+GGeRPqpC2bhJzl7c13z2xlnGWVmV3FzVmxZDBfub0F2DatPsPuahazUCHsxFm5iK+XYkIIqNxZl8au64/w4aev4Uvy6METhsXsmJz+PEnlz0QzHpfR7OWK8JpNygphGY6giVmVi+i7/KnFCWuob2BaJj3ilEQpEZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525636; c=relaxed/simple;
	bh=UHpWWs+DyipNZHEV2Nkr4YRS5WpwRh+UNqWpXhbSsXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDUIkoOVggAhvYuACl6W9y2K1A3c/ZRaE9NkP+guQs/o9rrGImHe2qHWZ3nW6rsRPAYb89zHq+v/DOxHnFRvYrFkqCQm1+B2siizd6ok5PyQbVwUNW5i2hS9tvYUIjrqvQ6M4ZIV1Ys3CrD/mT2X2GsD98YdFCJQw17+M21N+W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a70nKcpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531BKJvZ002313
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 16:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/379CuoW3tzmnDJsyDy/0ujjjwBPjP0Zru4t6cZwrYI=; b=a70nKcpyHh8Ft3MK
	dAD1X5izfpBIhtoGopYSOCahmi0n/Sq6Nkx0hsZlFYduFuTaETSouFmSZjc1AZRl
	V8xXi1mMY+bsO86eCY+XYoKBOwdmMXaWGW7XRGrDRAZV8ud2Sfemshdks444K2vo
	TpKaeqxWM5f1Yuo49+LWgWJr/MbdgaSYD9UCDNGB2y5GQlFel6gOn3skxSyAvo60
	ruOzjxomi9pBdxTKhTpduCIXfzjl7FsG1KjkjeZ93YqL0QF+1d8umK/JpQSLrHIE
	6k7uwa3BW7PJyaWjbJ62qeWSvkfjx2cLZTkh57ej9u+8lWJw6urK+hHaUyy5SUs7
	4R52yA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5brk6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 16:40:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c547ab8273so29714085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 09:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525633; x=1744130433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/379CuoW3tzmnDJsyDy/0ujjjwBPjP0Zru4t6cZwrYI=;
        b=dqBBjc7ExMGFSfZFggFXvYdMi2OObzDCkKpqjWT91UW7szwBmJUn0J9WxB7XZkWG5l
         AkXjREU0QG6VLPABytLG8lAgxZCN7TgRyKD+wYmvmIUZc4jbwEf8TbV2n6nbs9FbxmTA
         OMMqxL0bD9RvkJcopgHTr9RYot0fbBnB5NibhuPL74RGNJMxJIFLkCAjgsX18kK7mqXq
         oSpb31rc03fxrxoRHGWA6dQAKJfo48M5tfjn1KoSRj8ECLIxb8CSHO3+zEvlp3femHHo
         Xo/WE6EZFQ17IGmYsmab/QqXaNukSd+dhEyTdCsFE751m2rF3liUjvHuO85yds1sw4rm
         jKSw==
X-Gm-Message-State: AOJu0YxXzfRhQuxE1eEPyN62yWPkNmIVQlMP0U+bkxA0uGh2RuIBhp+H
	kHFtAn5uLAD3STEYLHS/SyIbdoX64CEK2i44kup66+Aax9c9gZ8AdFQWX1oNIwbPl4/2QG3Rhl7
	fh0CoVDM0e5uLCOpzxaICZNz1Xlps/Lyc4BXHc6CnwELyX3vDb50HdiP1xOfKE5rC
X-Gm-Gg: ASbGncujYCZEDwbie/AuszvU7VXPzmU/WvkuNY7GTx9ankpihTuTJL54qxOC/kUGtb+
	T/XKLPwDZ+GeL54mqrIe1vv3RhfJ4T0oeKl6oFKANYZOkd+b9tDc34zYQC1P8yWEOJixF7JPQO3
	YpNtA6JgKNyMpEkQ207M4GtK0gwDpCP/JwRwiyF69Z400YHDr5eDLXxHRnpIieZd2W0BCKCvB+h
	C9wYS//Zv6oE5pjaLNR7/2VUKlwC95eWqau+zc8AAFfKsVOS+JkW5I2zShFofjGfn9bzkxNm9SK
	zHXiJvYFCNBgV0vZGUaZhRBUMmOV2nkxI+zoTDAL/Bskv9mRWSwFZBLlh8Q3t7NS8Bd0dg==
X-Received: by 2002:a05:620a:2806:b0:7c5:8f40:3316 with SMTP id af79cd13be357-7c75c904636mr166846285a.6.1743525632707;
        Tue, 01 Apr 2025 09:40:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKdu3svWPD4gijx0TLoynI97bgyGfAj18omhMqo9yqcZrBylhTXjcw7OpbvttjPcNFzPQb6Q==
X-Received: by 2002:a05:620a:2806:b0:7c5:8f40:3316 with SMTP id af79cd13be357-7c75c904636mr166844285a.6.1743525632324;
        Tue, 01 Apr 2025 09:40:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7192ea05fsm784381966b.86.2025.04.01.09.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:40:31 -0700 (PDT)
Message-ID: <25bd3c63-5231-437d-8e81-9e2198dfa0d3@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 18:40:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615: add QCrypto nodes
To: Abhinaba Rakshit <quic_arakshit@quicinc.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250318-enable-qce-for-qcs615-v2-0-c5e05fe22572@quicinc.com>
 <20250318-enable-qce-for-qcs615-v2-2-c5e05fe22572@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250318-enable-qce-for-qcs615-v2-2-c5e05fe22572@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: faeTP8WYhhpisuiv-eqhoQixpKRRLSsi
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67ec1702 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rugxzkDQvrqM6iDmQMkA:9 a=QEXdDO2ut3YA:10
 a=cf2_AmsjeD8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: faeTP8WYhhpisuiv-eqhoQixpKRRLSsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=719 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010102

On 3/18/25 10:43 AM, Abhinaba Rakshit wrote:
> Add the QCE and Crypto BAM DMA nodes.
> 
> Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

