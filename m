Return-Path: <linux-arm-msm+bounces-87685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECA4CF867B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 14:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03E0D30504DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA0632E692;
	Tue,  6 Jan 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRS+iD20";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h71rAJM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0808D32862A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767704417; cv=none; b=s+SGsWo6tDpYfGV9xhjbaWrhTo83EVe9cFTADl1ciBLHpObC7IxwN8yBHQbS0mCJuzIlh7Xm6DfYb/tGpfKd+XaZFvPyftvP8DY7G/qh4MfnyoIv5scdJy+ii7vRXean6WHQYAx/kNB6JSya+qKCm38uZqUvGuKWF7ekDsN+MOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767704417; c=relaxed/simple;
	bh=0om2bX45QNGjgdqYVBRYqDITF50Dzz/TKfhxXmJQ3ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XF7skkqO+FKSbCLmnpXcwGPO46KH1Hb5GynbQSJbcvpJtziOywaQ8ZGRvJjV+7pSgSX7Jb3NrE0ldqXM8AJRhwCIlZX1c8HKy1cv637IOUKPhlIfQQQgzToHZYwY4Ur3+atTgDlL2Ky4TkbdqokOTyBs8+wgJ6dMmczak3QvnFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRS+iD20; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h71rAJM/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AYjNa3052752
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 13:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	huXgOWlwMM/3UBQ256PZnVk2f03NpWBmmvrJXgXD0Ak=; b=TRS+iD206qbp/Mkt
	9OdYG4UisDFYd5ntCFRwFJ4HZaVAhjc73UvHfPF2sV+0KWWDWhvhgyWgDcwdyrFi
	npyzzP2A3ZGUZCfZ7K73l9nknH5H270HR0PikxT3sSj89UrAvmch17byE5+eJrWo
	K6dU/LjC/EhbcKwUXp+Vpr6Z+JuEqJ5aSm1NPdKL5zRJatwEuFbF1324Dxvi8gBK
	RQEoWDurhc0bIm7C1OWOg2KSqyOyHSPF/BfrqeiRpS2Z/9vTBcQktf6a2m+kSeTs
	KFjsgT8XqSNzHrMx3zERwRSrsV8iU/X0YHJzuvfFjOQAPZvmo+Kh/zDGTM10ymWg
	ZxVtVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9t255-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 13:00:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0bae9acd4so8854455ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767704414; x=1768309214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huXgOWlwMM/3UBQ256PZnVk2f03NpWBmmvrJXgXD0Ak=;
        b=h71rAJM/T7CFkoJI+dDbKkr6PXcLHd+AvYLUsCOPqJcURfyc9oTob1ZsslozVrHXwP
         OE3tysRKdQGWXhfMYBWjEYQJNkiQ0LXzPk15xYfik372Ov5d7wBjA2pEgvq5Af9NDJKN
         OJSLIHcG1VX9m+rZo+6QMdDUnVIEv68kFMt30CZ7Kssq02Y6lna0UrwTpuGP+s+lzpEG
         baEVbxzCHjFXsSAqpuL8tgNuyEjmcLx9q/IS+HY63zJwMyqq6feVW4y1i4tNuRBPIv5M
         /t2RcK8MFQRIG7ZG1nsUbkICVUrq8J4h8sL5Wd8JcmXY06tiT9Ky3K0B9+0Z/NDqQTkA
         ILuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767704414; x=1768309214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huXgOWlwMM/3UBQ256PZnVk2f03NpWBmmvrJXgXD0Ak=;
        b=nwsHkc/4EzyDenMqzv5kTbw1PjMEkukEFoJYQZ5Dy3LEZ4Br5eMhSrOu+2TtehG+N1
         IIl07vebwbpi0+3NKHfdPu1j09aF+b5MZqb5Kxl9KSMP35ddx7x4xcZsKbU8MM2igtVy
         njQmNw+BLghAo6oNmEop7dne4BR6l6jkM17ifVQWc3HW2jfT+mu6gl8b52ZpIKKThWYI
         tPwtWULPxtAXzeOFYsAUIQ27DcJp/mshSqGV0gD5roC/IT0ME4qI/keY6qLwMFA/UXFo
         UoGpGon+fjqTr0ZcWwHyuUdB5DzCNfmgavBkaNpjxCsHe/drcuP7sFaqWGj39520wRGI
         380Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGPcp6oBUoz24Xgs63VYUzMaQkNaUO8maiHemolZIdDxZrGoXdWW3L4usK03PET9gza4UE2hGAHBRzZ24T@vger.kernel.org
X-Gm-Message-State: AOJu0YzSlMKICOwS30CRzoIda9yM+ZUmmsd0TE8lQDNUtKvDHWHs+sFo
	1TVaUYHbWpW+eI+rsfwfu4dSV2glQwJxQthVEHEwV5cB2hBZP8q02ZLnOwMAXRnOCFdW6u18fnn
	t6NZIfQQNUPw8c/5IvlVVBiWuu+66xTFbJXwsrffQE0ex03xhyaNlfLqYW7ku9+E8fqTy
X-Gm-Gg: AY/fxX5NRF5VgpbmEq6q2llwJBOXxEvmDjAV7QNrrtrLOGU+bgzjvMrNy8Zo18o0SGl
	JuyCWGXexlr4Eg0IelyVarMSTGKAQ3uhIy3/hcqz+xqKcrGGazrn+zNKZkr/2TCnzj7aQAuDEX0
	/r5JxPP6sXJ01g7nPXBlanctTCGgqX2Sk81b0qm5OGfq/rKyIEeGGkZpe2q/XIhIa8pu6Pa7RxU
	kTUV4RKBfnWzo2mxgkXrSP4xw5PtcT4NiyAq8Gep9gmlOIeamu/RhT3j1c6nWrXIRYde+ahjS5v
	t2F3uePpbJZJdBAH1xE+n9qetvtkS2IZnJUVRAwhsRUDlWEcELbuzpLM0QFI+bo3Q0XtsSNqmqr
	tcVxyV0TjzxoNWlhJ0pqgD5LNXu53dGYbFGXw61lRpFWiItzfQXE=
X-Received: by 2002:a17:903:1a08:b0:2a0:8f6f:1a0d with SMTP id d9443c01a7336-2a3e2d4a754mr28039995ad.61.1767704411955;
        Tue, 06 Jan 2026 05:00:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEj1eTxDDzV+0Q9BC5FCCAwWShTr88gsLB31ddtNM4i8U1yoesSaOsi/0lEA1kMP18LZTgfqA==
X-Received: by 2002:a17:903:1a08:b0:2a0:8f6f:1a0d with SMTP id d9443c01a7336-2a3e2d4a754mr28039695ad.61.1767704411315;
        Tue, 06 Jan 2026 05:00:11 -0800 (PST)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8803sm22780885ad.71.2026.01.06.05.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 05:00:10 -0800 (PST)
Message-ID: <e396bef2-e5bf-4e6d-98f4-37977d5d93ec@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 18:30:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for
 x1e80100 SoC
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260105144643.669344-4-pradeep.pragallapati@oss.qualcomm.com>
 <7gi7sh5psh5v4y5mrbgln6j2cjeu5mogdw2n3a6znjtqyjcyuk@kxpe566v57p3>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <7gi7sh5psh5v4y5mrbgln6j2cjeu5mogdw2n3a6znjtqyjcyuk@kxpe566v57p3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uuH67BHCJigGG9jaf0vHvo8h3-gL9Kly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExMiBTYWx0ZWRfX3AQwVE3xJz2x
 d7CfMVErDWTO6TSxsTbvYGzqzWaKidBmOyX83S5+Xp0f8X4k2B7B4nwFru4wXJT+3tjfMCCrUh0
 +iNhkFwyWKLfUp0tresBFqEDWtSZDRTjPIclDEU3enXeSb2UxsfhoPIx/nUjp6nSyOwvW1pUKmc
 ikFAyr8CdRKo+ZXJSU8zjxGGjfDS3b3xh12bBBXDJREogyrKqBVRxTMXS6lDXg0Bxr8tWIEgAIV
 xbZCZdiavfpozkfACS2Xk3SUmqyrNNv9wo1hJufYGS3Dg7WIkj97e6mpALVztSHbrj0mwlY1s9M
 M8IMcO6YfXlFKEk3eJt8oJqHqYVRSkt1mjTQzuZp5UuYQQJtbktVrRmfoKY0hHgEKQzIFd4fLwN
 LOhcsHbK8ZJpXspOVaxhIIlGfx9HOcGvPmnEDdHS+DH+UYFpi5CnSF4+v+kHiFyckqvbWEl4HIg
 PzU5iYKKSWQx4zmzAUw==
X-Proofpoint-GUID: uuH67BHCJigGG9jaf0vHvo8h3-gL9Kly
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695d075e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CRlJY8YO9k0lXNWMlzEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060112



On 1/6/2026 1:36 PM, Manivannan Sadhasivam wrote:
> On Mon, Jan 05, 2026 at 08:16:42PM +0530, Pradeep P V K wrote:
>> Add UFS host controller and PHY nodes for x1e80100 SoC.
>>
> 
> Minor nits below. With those fixed,
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 123 +++++++++++++++++++++++++++-
>>   1 file changed, 120 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index f7d71793bc77..33899fa06aa4 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -835,9 +835,9 @@ gcc: clock-controller@100000 {
>>   				 <0>,
>>   				 <0>,
>>   				 <0>,
>> -				 <0>,
>> -				 <0>,
>> -				 <0>;
>> +				 <&ufs_mem_phy 0>,
>> +				 <&ufs_mem_phy 1>,
>> +				 <&ufs_mem_phy 2>;
>>   
>>   			power-domains = <&rpmhpd RPMHPD_CX>;
>>   			#clock-cells = <1>;
>> @@ -3848,6 +3848,123 @@ pcie4_phy: phy@1c0e000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		ufs_mem_phy: phy@1d80000 {
>> +			compatible = "qcom,x1e80100-qmp-ufs-phy",
>> +				     "qcom,sm8550-qmp-ufs-phy";
>> +			reg = <0x0 0x01d80000 0x0 0x2000>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
>> +
>> +			clock-names = "ref",
>> +				      "ref_aux",
>> +				      "qref";
>> +			resets = <&ufs_mem_hc 0>;
>> +			reset-names = "ufsphy";
>> +
>> +			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>> +		ufs_mem_hc: ufs@1d84000 {
> 
> ufshc@
ok, i will update in the next patchset.
> 
>> +			compatible = "qcom,x1e80100-ufshc",
>> +				     "qcom,sm8550-ufshc",
>> +				     "qcom,ufshc",
>> +				     "jedec,ufs-2.0";
> 
> Drop jedec compatible as Qcom UFS controller cannot fallback to generic ufshc
> driver.
"jedec,ufs-2.0" was set to const in dt-bindings, dropping now will lead 
to dtbs_check failures. is it ok, if i continue with it ?
> 
> - Mani
> 


