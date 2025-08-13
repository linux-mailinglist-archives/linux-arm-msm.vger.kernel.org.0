Return-Path: <linux-arm-msm+bounces-68880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D623B23F18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40FE66E2D69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19032247293;
	Wed, 13 Aug 2025 03:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1CrhF2/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FBF2BD5B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 03:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755056348; cv=none; b=VxwcfMr8IZqqYYdxgY8AFbHPRl2fpx6wBGO6H55JxCEla6peou9qd+M8VFHSTwQiPiReeP+2FtVUefpJ+omW/UrQQeQhAquAK7aH2KK9AIsKmIXXtrACcNRlzgg1yxmyOCmiKMmMWepcPTG27rLoOJgmD8jmUGoxc3TDhtvWP48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755056348; c=relaxed/simple;
	bh=frlVhelmwCmI3FqNV6bRhotoX2pNLqbCYY9VDbY5LIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nov0XJDE2d6JRmhfRHcXsc7HSFpKHeH5zwFBdeUO0MQPoJpw5SnymZBp3bvA3fgGXdQ/bEmbrrwpVddu2GBg4ZmzcZcnSmAPpTXLgUMccqKYB8ygOetzH72Ft1uTfR22K0+YVCaYG45nLNGOiZ4PE1hBwZ1NmyjN3KAdwVVlUVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1CrhF2/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3d5Ih017356
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 03:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kPk2QHiPe8RX6UEDtLds9t18fcrz/o5b6wJ1xFIzlzU=; b=b1CrhF2/X9+nRAGy
	jxH3iSNiY82vvBMXrCIZwU5tQKZUIWVDE4vvEpzR6f56/ESdSKueLgUHOZARE436
	gSXra5kfjgyPwP547q/TavfYCAG3nrjznbntndN9wzLKBctTNWhkjZkegaBWyFUl
	SwSPcPSDPoK3KbCpXuzrbJeG+PlROXLpsLjwSsGiK6TC+6uoKkjoM8Q/lQhLLQ06
	4MKt/x+cohTvfivExPkWyy4rJFEjyeFhnNuaNAOGjKREzKDGEBmivvupzL9WNTIA
	s751HkCVMyfbHS08CQz5rkF7Oome+KgBh6wISISYnVkMaos3JvY7E6xQSJl1eLED
	A+9M/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hma82d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 03:39:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so5322324a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 20:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755056341; x=1755661141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPk2QHiPe8RX6UEDtLds9t18fcrz/o5b6wJ1xFIzlzU=;
        b=V09yfP5sWjtTBT11uG3TGnxHhlc6DNuhoMU2vN4MTALRGGFZ+CmsN5RCWdjcb09dgd
         jxaH/9JDWahNGdAkdRlomzZlJstBHd5LIXLMgNeHAbnXqZBSOHzXNQXp1gQcy0maDiD/
         QIi2Kgd5JetVsHw25K00EnXjnyaoluY5P3RUPOHZqcUNQboV3ZQL0NuqEjiA4SeYXy7t
         Talj8bvEdw1+mZdHPNXvdUl4VbLGJmmDXMiMFQo4o1BlTi5QKW7XK8YqoUVmN9H+Ona+
         gvgXQuZ3Q+pHe7sbhFQVzPu2bhpaGUYcTvvs97k64OlgmDQS1UfLRDwLQuZm+mRTFZIS
         Lv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4EQKaE7mRccfuORL6ykzd2e34Wmqu8f6LIsl+13vx0iH87ijnOlLIv+L7CU0G17VisvVVU3hOnezK6/47@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4LAPms1Ue9kg78j242fb4VJmNvp6xokuJkrwGz3zuGIMvmgOx
	J0Do0kg8y7vDNoFsVTjMM+oCilsFB6FCTeKcTo+fM+h6OCo0CQAWo/qJVkVQ0PdFulf5h2CKFEz
	TNcpTkeOTHkNIWicsFCWqE3dZC93ddIbpkxQQoF1zhAuPNtjDm9KV/9vG5zpgSFECZmre
X-Gm-Gg: ASbGncvSsxAfwFkOzEHVzUlIA8P9SqIL27zHju2BUS95fufRmETKP+7kC3EWJbiEEgq
	rfMIuTu84VzF8q4qW3CZ4MmZAVBK55EUSRK+zbLXedYHLvQpTdZ7ZfSanXRcAnCtZPnBJmg+Snf
	ZCKXr16xD+x/Mq2v5yRPLhj+IKGmuKdGH25vkEdc7S5pDapCuhWLPIcPu+OsUwtP/MB+w3+lzxF
	eQUyO1usMqWsTWTll5pRzln72mhh63v0AIj/FzRgF3zwlKH48ujtemxHnhySldbDJH+i4yNpZ9C
	+pORaX9Q7kIc1mAEkqol4xrjUnSh2XyG6Z491kySu/1DioQdaykZA0YGkG4kPJbzLOsfJTk=
X-Received: by 2002:a05:6a20:3d84:b0:240:50d:4285 with SMTP id adf61e73a8af0-240a8b9cfa5mr2979703637.38.1755056341267;
        Tue, 12 Aug 2025 20:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7Dd5mSG7zW09Ug10gS3SwTUD5Aiujc5HgrqnSUnyzFaDo3SkczONNSwK3UtDk1yxa8/vXZQ==
X-Received: by 2002:a05:6a20:3d84:b0:240:50d:4285 with SMTP id adf61e73a8af0-240a8b9cfa5mr2979665637.38.1755056340853;
        Tue, 12 Aug 2025 20:39:00 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b428e6244a5sm12413901a12.23.2025.08.12.20.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 20:39:00 -0700 (PDT)
Message-ID: <a0420827-cdd3-4442-83aa-d7f5072a28d4@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 09:08:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/5] arm64: dts: qcom: lemans: add GDSP
 fastrpc-compute-cb nodes
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250813030638.1075-1-quic_lxu5@quicinc.com>
 <20250813030638.1075-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250813030638.1075-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX19T6aFcjD5Oq
 k+vsU79ceZjR+bMW3WuypkJYQ8+xDibuF2WdRZnX0amHdruNYgKVqglhYszv9qvtKqftNk0+uuR
 aPG4wntxOPxNYnkaalqjAnipYem1a1cASwEXaCCIpdhp4R3+Ie8uuCrUiWF7/SYOXV5hmrlNs4B
 jISkapqIb9Ag+D+tJ9KuXiNRyZPzra4PZESYbjxA3irLoiiZgkdWWGOEQ8hqoGNp2ereOnfIY+p
 Tx1213UosxNA8tCANjTbpv2+XtMCk/BdzskyDLtm5l73OvC7sX/pFQi2B4waIL0v/0dpuqGAhd7
 f8UqivfZkXHt40mz6SyGUkSBqWNCoFeY0fU9Oq8u+Af/epzIkUMj1hpKpAcDjY06ZsNh6G4tqes
 Ce7if21L
X-Proofpoint-GUID: qJLFpILMi3Nd-teIvnhn_CZA42YzFvvr
X-Proofpoint-ORIG-GUID: qJLFpILMi3Nd-teIvnhn_CZA42YzFvvr
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689c08d9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=2Ucg9gNHWiGhv-ArepgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119



On 8/13/2025 8:36 AM, Ling Xu wrote:
> Add GDSP0 and GDSP1 fastrpc compute-cb nodes for lemans SoC.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 58 ++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 322abd0294be..a4c79194cee9 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -6092,6 +6092,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  
>  				label = "gpdsp0";
>  				qcom,remote-pid = <17>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "gdsp0";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x38a1 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x38a2 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x38a3 0x0>;
> +						dma-coherent;
> +					};
> +				};
>  			};
>  		};
>  
> @@ -6135,6 +6164,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  
>  				label = "gpdsp1";
>  				qcom,remote-pid = <18>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "gdsp1";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x38c1 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x38c2 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x38c3 0x0>;
> +						dma-coherent;
> +					};
> +				};
>  			};
>  		};

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

>  


