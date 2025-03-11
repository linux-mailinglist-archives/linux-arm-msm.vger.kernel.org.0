Return-Path: <linux-arm-msm+bounces-50932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C64A5BCA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 10:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D25787A9294
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47045225A34;
	Tue, 11 Mar 2025 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqbfHnBv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A035C1CD205
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686545; cv=none; b=kta4n8PK/mPk1EmPVePOItTkYIurrS+Bs5mLsW/F6t8vX1H7JS5/w8XHEE3K2uCrMcRF0Z4aMOlIy71CGXoiwF9rpRwy3PmCkitr3iO9mRd9J9hIzUa7Vk/sjy9VYCWeN+sbO1doA1SZkKyaQC3uItQrwb4Z48JpS+21fwSBjv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686545; c=relaxed/simple;
	bh=43h0eHGARvknv1pTfOp5TQ4caL7mFrHowAOiH8OPbc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zoq1VLSHPkhIO78Hh8+buhRtcu7Y7ZKvwPUPmYXvVxmXFszQtIR62nvdLZGkhnZhEGX3oF25ses9JftcigShTqf0ZgSGSPYwVsnXyq5588hUQWbL63dKoJeesGnk3SPlY86LArgK0+QU1DXq+GV1Fka65GhdvwPynclM0hg3XTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqbfHnBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7oAkm024899
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rACPdSRNkmLMa1e1/sG0V0Fc6/zQY9hUNWp6hfkkYkc=; b=iqbfHnBvvs3iKmg3
	5W3K/kuvep5q3Srax8A+jcHFh0yuFAdBS/jm4SZg34dyfDbPEHxId1f8IshI/7lG
	rWTPwSCMZdCFEAu+/8FYDDJiFjqpcdfAYVl3/sRHaB2bNDeo6ddPYpw2A+73Q1sG
	UDUIGlMNwLsqg4dyqLg+Woss3dMJ8GAaaBKSBFq9nvOGXa05HV1DN+JDeBBlIeGW
	wdpcYjNKrffIBJXoesNFXTaKRiUqbuL6HUm3aEC3bYNqQZhtUyC8Dik3pFNFRXRB
	FaHM48cbXs25xCsLiQQSg3cQ0Q6f1kAqlxjMD4pz7NwyjgVfLcT9ZChzb/0UXfs3
	UEazuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah4t0b87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 09:49:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso30436785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 02:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686540; x=1742291340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rACPdSRNkmLMa1e1/sG0V0Fc6/zQY9hUNWp6hfkkYkc=;
        b=weogyzbNoNtdAks1y20S4HXgIaJn83Q8HDnK3x0Bc/uSyW81Xynmdsyq+VB79TFjRD
         mBh7uRPn+Ocua81xqBV5omdvW4y3//K5R/aCCZqfeEGASaQ4VzLDhyLWhryxDYl/5zsu
         u2XgeIg2nhxr3dXNPS0R8wXQnrhrr8Pj/n0xemTZOcmkL5oOU7Pz5pZlV4m69wNs3r5X
         VOaE7RvQoSMae4nWFmcNkyf2trCZqC74NNHi0c3buyqY11P8/fCbQux5XDV5IeJwzoqE
         XRvo8XlRRQaQo30y3ocHS5HlyvwUQBia0Fe6DmB+IAQSJ28I+7HBNejhf/9QQerIG6UO
         OKbg==
X-Forwarded-Encrypted: i=1; AJvYcCXP13HEQAeW63dhKKV/hFG0O+EV2TvKt2GPf13s9FNeDrUUDQit4GwwxBVYh5yMEqymzXg53/pOqvc7+M6f@vger.kernel.org
X-Gm-Message-State: AOJu0YzZfZHrXIKTcc59ficrBvO3D2mugayYPKCt9VVgqfrN5Xvm08pa
	B6m0tKy/AtMrxxjsZu1wneWan7a4PDNiixsWE/ez1Btntvw6Yg4v0z4fSxwhy24oGG6DqtU6nx0
	dhSM6rOKATt/I6NmQkKYKOC9WfVlJxGFVgFJ9kFiTQoJHr2peE3byCGfGWA4jFu9C
X-Gm-Gg: ASbGncsB5PdwbCHggqzRLgllyNXUh7nbBmtKbbPinRIfoEgzzvvpddvUya6MJCS9gj0
	5itMImw17+tcs20vUvh/+FadiB95lELfsxyiYGTao0e3IIDU/Bma9ShoGooKtZq/T9RQti20KO+
	ZqKh423C9RDAY+KRAF4Dogi6qxsGhzd70iF6iISADcO8ub0bmCpaxMJQzkKhOUHubt3HiGzvev5
	Sb/SEKl6dNi3hnoQtsJXtuZH2+GotQQQuuJnTkw7PNFjzfnAPSpwKxrnRhPbIdJGhCKFXcZ9uuT
	BmVCiMHhRlVsy8vdzS5SIZsvD7FxtgeHRmVIk4HRr/UnA94aWnCR65AL2IO0zbg3s+Kojw==
X-Received: by 2002:a05:6214:5298:b0:6e8:ef41:a0eb with SMTP id 6a1803df08f44-6ea3a6ab16cmr14275736d6.11.1741686540320;
        Tue, 11 Mar 2025 02:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRkM5w4WJD3Nr9ntbEIn7Wwi9dnArODouwKFMmnpnNNkFao0uXEHwZKLKOV5etn/T2WBM7HA==
X-Received: by 2002:a05:6214:5298:b0:6e8:ef41:a0eb with SMTP id 6a1803df08f44-6ea3a6ab16cmr14275466d6.11.1741686539894;
        Tue, 11 Mar 2025 02:48:59 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2a6c9a537sm257191266b.71.2025.03.11.02.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 02:48:59 -0700 (PDT)
Message-ID: <ccb736ac-d629-4fd4-ba02-a42e4d4daaa2@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 10:48:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: qcs615: enable pcie
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org
Cc: quic_qianyu@quicinc.com, quic_krichai@quicinc.com, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250310065613.151598-1-quic_ziyuzhan@quicinc.com>
 <20250310065613.151598-3-quic_ziyuzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250310065613.151598-3-quic_ziyuzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1MVTT7CacCHJaee6_VW0BnMWBrzoB1Zb
X-Authority-Analysis: v=2.4 cv=fZ9Xy1QF c=1 sm=1 tr=0 ts=67d0070d cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=6X6hr80gjlHG-dsRnmcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1MVTT7CacCHJaee6_VW0BnMWBrzoB1Zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110066

On 3/10/25 7:56 AM, Ziyue Zhang wrote:
> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> Add configurations in devicetree for PCIe0, including registers, clocks,
> interrupts and phy setting sequence.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 142 +++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index f4abfad474ea..282072084435 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -1001,6 +1001,148 @@ mmss_noc: interconnect@1740000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +	pcie: pcie@1c08000 {

Please set your tab size to 8

> +		device_type = "pci";
> +		compatible = "qcom,pcie-sm8550", "qcom,qcs615-pcie";

This is saying "this device is a SM8550 PCIe controller, which is
compatible with QCS615's PCIe controller - should be the other way
around.. Or according to the bindings you added in patch 1, this
should just be "qcom,qcs615-pcie"

> +		reg = <0x0 0x01c08000 0x0 0x3000>,
> +		      <0x0 0x40000000 0x0 0xf1d>,
> +		      <0x0 0x40000f20 0x0 0xa8>,
> +		      <0x0 0x40001000 0x0 0x1000>,
> +		      <0x0 0x40100000 0x0 0x100000>,
> +		      <0x0 0x01c0b000 0x0 0x1000>;

[...]

> +		phys = <&pcie_phy>;
> +		phy-names = "pciephy";
> +
> +		operating-points-v2 = <&pcie_opp_table>;
> +
> +		status = "disabled";
> +		pcie_opp_table: opp-table {

Please add a newline before the subnode

Konrad

