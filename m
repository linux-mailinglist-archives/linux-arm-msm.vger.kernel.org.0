Return-Path: <linux-arm-msm+bounces-67801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4779BB1B8CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 18:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7CBE3A28CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 16:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79ACC277011;
	Tue,  5 Aug 2025 16:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCAT0AcO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8EF1552FD
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754412713; cv=none; b=rvRI0btPx2KXmO+we4niSR2IL/Ot0+l1be3BHy9gV1zHTSVkZGOXHJyXDhpKZ2gp3GfluApiNsvoe7V/LReDjWhn80kUea3Lk8h6074/CggX9RFPv76a6Kzy99uDLxdLlUkfDT4Uf2YeuFGEHd2rzJ0DRCBK2v+dVR/SO0ZZcFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754412713; c=relaxed/simple;
	bh=9HuhvcVgcVWA8vrm4ARyM9LsZ5rPP/+FsBZiP8MsXi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKxpnDLLNjdKy0goMTv9L0EbED1hXavblEJWwEkPLjVbUOGqPseSiInpU6rYbP8xl0PagRl5DEdmdIM2Hvp9dFuhFRXGd3xutSwKjDpQzDyx1zS0nYrZa3hO3fvB51J/B2jP3kIE3WkMW6HaeA+Ddo9rbRzE7RiPHcST+GSjXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCAT0AcO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5758SMHH028782
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 16:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrW1DzUyVVmeukVpqBYLRBGHiHi6hAxmrlXRAz69Tg4=; b=pCAT0AcO0mia2Krn
	I5LdhZKGCdJhYIpHxXpH//mQqwhzDd1SuRsAm8+r3L0kU2A5sPIwaREWyg7O5+vE
	V6VO/yX6j8x0dL36xOKSon9f4dMuXYroUovwSc+te9rqlDfDn37q/JRjU4TIrTEo
	KVvLFYopbObI5IjIab/JM2vz+V9gI93DFVKhbgENPjfcRgEXuhcbvrfZl47NrenQ
	zvLa5DZ5PHEpG/ICyvleB85odDupRjAQXwNRnRlfsjHGz8rE8myWwj0tNa63fmiU
	EJwU0iCYpHOb7XgaQZiUD8Bfp5VDSAJPU8GMm4JZyLV4t++AjTOvZC1qzJcUPbDb
	/EXP+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899pah6k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 16:51:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e806e4ef1fso28052985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 09:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754412709; x=1755017509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrW1DzUyVVmeukVpqBYLRBGHiHi6hAxmrlXRAz69Tg4=;
        b=PvVLflF050q5be0MTTTrpCxA2HQiihv8n9BigQ2mkLDHbV4mDDzgG1nBQDpqe0rQ4p
         RLTkbp3vAHQmeFH/7Yan51N493eUFOaVtkbBCxSq7tpoa7a+6Rc6guKn3wiviuDmH/2H
         VZInofygOelmqQHgnk+cr2V1Y6nIzNmfVukVX5HWI+CsBpx9NQxvzLxXK8NHNXo8e1IF
         RJPvDTTLynRywSN7WZxUJvA7jg9scA3aXrWOrZHB+x2Cn54eeYC9kfyCIqWcBoC5caVi
         vf784lCnBzifXkR/RFXaPITNFLeHIMM4jXTGFJhO30FLPaK+lPvU457wxqnOsWyd30Hz
         EaSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlpe71/RosUuUTmW7BnYxBL0GgyuME40n7c8ytw9g17ClRnpQ6Ci/tdcvItmS1/GZbDhEQnvLsu7Rl7bvG@vger.kernel.org
X-Gm-Message-State: AOJu0YwYVDW5aGVLoJWne8OdGHt3lG4KPc1JOhQRToDR+AtKbGg8j35u
	S96LHecDT3K+806RBxlMali30/vtlvQmOx5NpECmieAteCQhQ6Ds9s/7FtJThZ/V250LD/EEulD
	6RYv8Y7n6P4Ij2DN4ljGOB1SqiVs7or+JWyFB6yMZFxHiUSN0vFr2b1FDyTwtp9GAkjcV
X-Gm-Gg: ASbGncvqby0Xg7xtmym5WLYk701WlAEym3vHSpGuhcPWr+lDYeWhdP/1IV9WuT+TBEY
	WLDf/m1Q1E3vQKY6ljushdW0sb34+oDDRrRL+Fz1ESjnD0p7p5GLjfffGkMO/YuufvvsvPkzQeE
	+2zzQ7H/jgcRpy/YpJz6mGDhAcD1zUCi4BaU9IsEZj3djUsLs6bmaeBQMlDQZnU24jRL9ukM4hE
	bOiBUFFdJmYHQecIO+agzCq1uIXGWRgoKJNWpv5t4EHTdzIXgI+gIkUCS40KQg7XVOEPWW7Hfws
	BjT0HUCIjkJXiucD2+SGEwVCUTAqYnSziYNbCxnumYmY3tQ3u99Rjzd6ofSU1qenDexb8l2/42a
	zCFMVyuNIhrWZpo5PVA==
X-Received: by 2002:a05:620a:198b:b0:7e8:c4f:614b with SMTP id af79cd13be357-7e80c4f6500mr234284785a.7.1754412709487;
        Tue, 05 Aug 2025 09:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsRfnZFgHHEyQmRgmvW0pHpImAXIwU7QUOWWa17SPxgdAKAosD77jO4lD+OvVYYq1NIsK+5A==
X-Received: by 2002:a05:620a:198b:b0:7e8:c4f:614b with SMTP id af79cd13be357-7e80c4f6500mr234281985a.7.1754412709002;
        Tue, 05 Aug 2025 09:51:49 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076aecsm933342866b.9.2025.08.05.09.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 09:51:48 -0700 (PDT)
Message-ID: <5590fdab-0fa3-4ac0-bcbf-d2cb41be16dc@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 18:51:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Add adsp fastrpc
 nodes/support
To: Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org, quic_ekangupt@quicinc.com,
        krzysztof.kozlowski@linaro.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250805162041.47412-1-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250805162041.47412-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDExNiBTYWx0ZWRfX7L2KBwjAFwc+
 X9XewGfiP/lUAer8hnG2b9Qnydm8NSKhuLmmlo0qWwmNC3g+RSzbzvG/BwVvPY8Fn8dtHokGd33
 jEZnQhdU42vVX/AVxvF1b1gYj3EyX0IsXouIBFsaFeR4Zz7n/LfiB4Sz6zJ3EBKmjbGBxE+6RA/
 5IesjiPgDFgiXLN6QTrMGXDYayFv0nqeoGwGXOPcqLWZcMC8Kq403ug/n04865F2y3K82m2WwCh
 A0/c61Vnh5T7RP2dhUMW480/FGog9Hg9FP7LCIV4hPjdt2ba9cyZ2XgGkOc0JSpVe1yTjkt93MJ
 E3Sb/5B4UNtqDevPMxB3wistVTayPv4sSQAsNLjdTWXAFrB7cD7OrhPb7FE6HrWtIYNxG7dzwJp
 4t5GdyReHJKZtX2NN8AawxMgxk6WKa0cejHSkBCoab/1muFKvHsys9aPmHsqtsL7m4Q/Af4J
X-Proofpoint-GUID: T2uTpQ-uKYZnztXNXsTsy3pgBE8GCdqw
X-Authority-Analysis: v=2.4 cv=N88pF39B c=1 sm=1 tr=0 ts=689236a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=i5LmXQDNGShexaeZTkYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: T2uTpQ-uKYZnztXNXsTsy3pgBE8GCdqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050116

On 8/5/25 6:20 PM, Alexey Klimov wrote:
> While at this, also add required memory region for adsp fastrpc.
> 
> Tested on sm8750-mtp device with adsprpdcd.
> 
> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> 
> v2:
> - removed qcom,non-secure-domain flag as requested by Srini.
> 
> Prev version: https://lore.kernel.org/linux-arm-msm/20250502011539.739937-1-alexey.klimov@linaro.org/
> 
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 69 ++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 4643705021c6..cc74fb2e27de 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>  			reg = <0x0 0xff800000 0x0 0x800000>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

perhaps size=<0x1 0x0> (1<<32) is what we really want, unless the hw/sw
is allergic to accessing the very last byte in the 32-bit space

Konrad

