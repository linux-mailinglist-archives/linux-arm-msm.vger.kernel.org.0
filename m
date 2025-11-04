Return-Path: <linux-arm-msm+bounces-80294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E3C310B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 13:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 900EB4E32BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 12:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74ED326F2AC;
	Tue,  4 Nov 2025 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/4+2Buu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzplkmJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D01F131A
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762260457; cv=none; b=PNcoTERnlH/03aJtbW83yl7JVTpUM0MVgaRQ3iRuO7JHjZP5ecIdn22XbGXx5Hw7jVebQzKm0lBEEA4KbxiUAVNkD3N7kAdxQcx2/XfQvy+oYaVgQvnwwYxyI3CA1xZMKUdUDfRdlUStEAldcg2rRTetC57ucfxecQRSaRy2xoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762260457; c=relaxed/simple;
	bh=gTxs5rn49DdYb8Oa5KQlFCzJzQuiPSQL8X+NvSES2ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usR4kgypp5pZlTcmgv7XT/Fvx/2uTpNjgNouSRDhTKZ9WshtJYLaWCv9vcfMuN1utR9DHsgOmDYNAysS3nxQr0H10a5NYqB23RcDfGL+zk4ChNhVxbSccFXKpn3lpvYh3WS2lzKhcV1w0FajC1OU6/llwt+/Rl+GSr51rYws1SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/4+2Buu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzplkmJC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CfuKo2099083
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 12:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btCLUFG2JW2R6lSb/zI9bygKazt32LU1QnP6IaOo4lg=; b=M/4+2Buukf5mYu89
	WA05TNN2VSx7YL7TBTGKfpPHBA0dSJvcQ7YRGmm3HbkjYf0hWUxdeGH7ZXKMqZPN
	ml+wEwweBqeex3ao8Cq5D5Kebss6kBgv3Ydde9gOdNITp82yk2FepnmughxKUkLA
	L8C5GZNdJIYbKe9zCR/IzPPm+vhHErPMlW4+sFANg4Rec4n1vnR3//njyNDMB2Yq
	rAScset5mlmSSq3UK9yIbikkIP1xUioHby48GoXB0oGH14847f8zPc3KZtv0G1ja
	7cIZkv3IOMekJ6QMAYTU/YkDJtyMbNBUTemE/5bSmrSgfz6iQV95mF+3WtONIJKU
	c0cAgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a79jjseh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 12:47:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-883618130f5so215307385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 04:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762260454; x=1762865254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btCLUFG2JW2R6lSb/zI9bygKazt32LU1QnP6IaOo4lg=;
        b=PzplkmJCi6iE4uURukblF9Zf5YfG1wEhS2rIJvP/j2IdMo6FvTqUmXeCimgVKZZa76
         HgHlFfgZ+hNkCRM0jvOfLKQfRx4v5sQtkCFmyyjvdC6QbERZq/geuDkbyiF7nboTA9e0
         5+K1OccVRVJiu9NdarzyLyVuytOXO+QPGvblqveG57fGiAuMIFAZU9Oitp6O7kF9MCXY
         0gKjwZSIa5RfsDeVUjhAS/heatfjyvRS09sYjh4YIPhUw46H46I5gkC5Eo2AqJCaRSbx
         qlvkCqS6D+9K1bbv5UOdIAE5c9yRvRjFFmIlP9nouYI+cvyIJaTRhv0OOBnPVXlQ7cXk
         OQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762260454; x=1762865254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btCLUFG2JW2R6lSb/zI9bygKazt32LU1QnP6IaOo4lg=;
        b=pRY7YLoVumgfOShqul6d2Y+t2e2WfEECAtqxfH+V4GXUr+XAWTb6JMFTfpZ3lBDE9k
         wKKl/agDlboc1Y6NqLGjPH9vP3eLZqI8Acpx3ahvde6BDk7q54tfXdK/50GUzlj3nt9E
         U9wRPPHrRe2ZYiDW0wu95qbEPHnJzft4BVaP3szIY0MwMGRERNLMMDq6J/8Yj/s7RfN8
         9CGXSzfAE9ClnCqi8EBmV6AgR5TGo8hDlHHL5jbyFGBqLG8819ojwHpBqU/ebB2bJePy
         sFll3A5w5RIF/QHIewVzUyQ7j7RTJ0/lf/WbzW7Ovs3g8dsU3MIKlMsyQU7bknpJZEKr
         tADg==
X-Gm-Message-State: AOJu0Yzll+c6C5J9FFkeq6bIFI2zjWiaQHMumbcNwlkQwPBys+7qhMAg
	gNNEJLfaYKV7rlNdIFeD+4s7ipfrbiAi1vYgxcEzUDVwszMwpmf20+i+2WxbXCMmV7plOyvjI1H
	BgvPechNeGzaikkQs18yjAWfESPWulaBsFw5R+f2jc8Gzjkm8UJnhoIpqQo3HujLMihih
X-Gm-Gg: ASbGncuhqTL8XpQWU92cKFFm5Tfs/+aOx74dV4FZeRDmioO4GhiJX81HKWo2RPS1Cyr
	RezckeXDLh+fQzgmZhnfFzNucFDY/71UCX3zmH2gBYs1rhNo+qKjMxltX47vj/WhOAkc8bfOSdB
	9UoMHT+xsi8Mfj15o9sOnwKMNQX7hS5DIWFt+XCtQ1/+CyrLCi/nMbeTWvvZSyfeGQ+NhCBv4rJ
	RFAhAful1smEAUSnxeGrrS+/0z2MKvllUiw7KVSDe7mwhXTddrw8sOvSOz93AztHNGfGIEEagUg
	LRrBsHcNK6if9E0oOzbgkh5WMiZIqgapespp4z9FxrF7OfZ7AbgfORkZr72tvTJvNxBIAVRQwzG
	+NhPSQRaXCKgYQSf1Nk+zKzXtdFJ1cjNWfPIv0bt1lgESmfuEKuE2NLtM
X-Received: by 2002:a05:622a:1889:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed30d4af53mr132226961cf.2.1762260454014;
        Tue, 04 Nov 2025 04:47:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAViUaNmyoIrrrtJRAsJFTDtaonsJt68AYLkIMFNWARiJlxrMxIPqTiGU7C28cF/+f/XRsAw==
X-Received: by 2002:a05:622a:1889:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed30d4af53mr132226561cf.2.1762260453333;
        Tue, 04 Nov 2025 04:47:33 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723f6e26e7sm203838566b.41.2025.11.04.04.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:47:32 -0800 (PST)
Message-ID: <25b7abfe-1881-41e5-914b-ee16ce63ed3e@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 13:47:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
 <20251104-enable-etr-and-ctcu-for-hamoa-v1-2-af552cfb902c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-enable-etr-and-ctcu-for-hamoa-v1-2-af552cfb902c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gcelqt-Qg3jxpUzYN9uVOo1KQLIofAoE
X-Proofpoint-ORIG-GUID: gcelqt-Qg3jxpUzYN9uVOo1KQLIofAoE
X-Authority-Analysis: v=2.4 cv=TuPrRTXh c=1 sm=1 tr=0 ts=6909f5e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GSohi4rL9rV8qtWeFt4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwNiBTYWx0ZWRfXxF95+KeTqhee
 sBqOexxOJUEaMuYe7N9oTaL1ry47bpt8v7Yr2rmo2Rei78mV2SXBUOQGRsu4/y1jHBbGGYAEjUh
 xIyfAIJWg3J0ItjdBtzBY7EEWIiOlnL5gcn2ovbrrBzDXI/Cd5ZaVJbkPGBLUlYRk5OCpa6Xghd
 kPBafmmHBMQpqSPrFtsol8popsxvAeaLY8gQxMkAP+9z4KbDoFfFzGCk4ZWnNUTRPo9qzC6qQUQ
 SfEfVPr5yVCgOQ/aci8l8z9eEXztzgHMAKXDu+75GgUMRrWsO8APYSc0zCTzhJBVj2g+FRjq8n5
 H92yvvdl3lZoCYoqWE5a+BJJUTkVFIwU/Y9WrjairZJeeE8hnhp+tSK8OD+iH3ISjDOClbmPDxk
 pIvR9o1zuZgpDpuNCE8m+Rc4Nq6pNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040106

On 11/4/25 9:10 AM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device.
> 
> The CTCU serves as the control unit for the ETR device, managing its
> behavior to determine how trace data is collected.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 159 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a17900eacb20..ca4a473614ee 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6713,6 +6713,35 @@ data-pins {
>  			};
>  		};
>  
> +		ctcu@10001000 {
> +			compatible = "qcom,hamoa-ctcu","qcom,sa8775p-ctcu";

Missing space between after the comma

no issues otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

