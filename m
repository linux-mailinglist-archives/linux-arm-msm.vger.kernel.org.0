Return-Path: <linux-arm-msm+bounces-87706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A92CACF8B56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 15:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22256304D4AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 14:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759EFC8E6;
	Tue,  6 Jan 2026 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmNdD/gu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiBemit5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE905233722
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708712; cv=none; b=tsfzFIuQ2jrenYcfAyVVuE4Nz4CGg+dr6k+tZVN9wbSlj48D/De7BxMDXIhvDbxxiPR2P9cOvdmqR5cBjZ3WN1VDkxmKmGrDO/+z8JAcia/bIo653VMsju/W3Oh1AVrCC0bzXE6ZafGHpCTJoph/RGOkh+om6tRLh9chM7msWUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708712; c=relaxed/simple;
	bh=CrRAiIbO/vVnAvGROcns70SoLhi/4G0NRfHWFjMslls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJYlr7/epuDYp0X4kfM+hYORdbCe5PT+ODQXfMjWgy2KHKOb7U2U2k2SRWqoTV8N5Ai38zHKCuRtJGYZRLATKGyVhpiqpHSpPAVL4mrru412qHrYHJP2J8sRXwi1gIKRH/3oxqJ5adhYFtsgLCr9a1JVtqjAYXyNHvWRRN0S680=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmNdD/gu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiBemit5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606A09LL3073053
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 14:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C6oOMkFH1icyX+oG4Y2/26sOMMPItpGKJI0jnUs3F/U=; b=LmNdD/guSW5DSi4s
	1w3S3tW1ZHT8h4PRC2IQEMhcklzJJTm4Zm4VQJdjFtQsMzyuXsNNAWQib8pEWAaW
	VanOTmQyhxO38IdghxIGegGHgAKZbZY/CMwyRnEKjqmdkeSMhrMTPwKMp1dCMoDK
	HcbNudAz5aiexv/ZYsIJhXcZ7/QgBmjAS1vd5Y04cR1VmdnXHffVWJLwY4R6PVXa
	kK1uPA4eJumFcYDjzBsZsiRXd6IHgnM9p8aQjmcEIwlpruOn1cbu7tl4VMHJtwYm
	am7gC1weHxGvRQQHaCLmZusYVlOhH8QYMeRvI7rQd3V5Fawzdehx37cE45kVKKs2
	nabjRw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgrf7j22p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 14:11:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b99763210e5so1968846a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 06:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767708709; x=1768313509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6oOMkFH1icyX+oG4Y2/26sOMMPItpGKJI0jnUs3F/U=;
        b=GiBemit5UYXcqRaRBkccbuJdDVHWczrDRGsB8yu9i7cLtpPg4K9jzXXAsWARGgzEuk
         i65YLvUBjbZ+ix1r0OBB2tkzq+TAb/1m3AQnoCSBYxqOMWdXAZE23oSG8JLOZ6XTA/Lh
         oVIWT1Be5cZh5QXh3IQ7rI42iX0+Aj09zCgSwQNh21zD9SbVAJeOxIIb5JPn2dNlecP0
         I4pgtwA9ok3SmC98BkHmNfFKh4AeLrOq+T2pAuCTToLcWx1lufVERwAs4a5JLMRy2yM1
         wrYViovl5/dW6NGSM8KcokGSG12LK5JeuNZwvnOTeirdJKHozSmKvNeB38f/wHwPuFmV
         gVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767708709; x=1768313509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6oOMkFH1icyX+oG4Y2/26sOMMPItpGKJI0jnUs3F/U=;
        b=NMaQH+69zIaXitxhOil+OdlfvTrCgTI6MxTi+RQN+oF2PSYfxx5nnpZbXKwimmJErI
         IUmESLiyX7hasRX7IT/eLVj9aDVnrDPioxOhwa8je+rXtbrGF991yzKnvkoZpEIFnAoy
         P4lWoHsTXniuXWDj52EH2vM+JUWnzVxwk7aPjsMJBuJHV/4HyPXjZpWcz25UYyU9rXCW
         DPrKji2toeBvB2h2vq/hZDNWeLfIrE1y6mM+zFl142fguiy7WrvKaTja/2x3+JeVrhgU
         rO+YIYLfl09Hb6mkA4BJ6Y1vbaQdX7ZNoGXGJ7fGg1OsY+DkUkyuUyPkaav34Pt9GiuY
         XF4g==
X-Forwarded-Encrypted: i=1; AJvYcCXu1J4Iow+bU4+UsryQtB3MNBLexUeRzd5Dj6IRjS2gTkFoIcl7zCvZNajoRqEHvWkZ932xAKQ46nHvK4by@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr1NHAxfh9B2FVBf9woOh9bQT2dMSUyItunOsfblZmrB88sHw8
	zYPP6wt9uRqAI9KyHZrQXZ6RhzZX3mcMpWooG+aaN++ehJHywWmW2ItYxE5ADj0a/E/lNc5Wy4Z
	n9QgmoK9joDDbpwiu3l+7tbG4TMb9JVMzSp//8wf2ym5HBTb/qsdL8Q+Ezjcip1kijMCI
X-Gm-Gg: AY/fxX6/jtITjl1KDQoYElHhgWBRR+wmqcSRUv6nyz+RuJgKW4HTSmrDaPxgM8D6m2B
	azOSiKVhzlQTPnP7T6bMtLGUJQgnUW839EQBxY0yZKxBJOWmS4NZxL4QHFZAg8fPNm0bGOuDzMM
	vR+G6W6YosXiM7H+sO7iOSuinuuhXu0MBesxQO2IM3ymtHf2Jt5gXW/xywM5nP6eJcUSfwcGyuk
	U5dWF9KxeNsIc3V/c/6q/Sy7BfbmBMkUOE6HStbhA/j6SMWFLI7+ZIXyj3w6EpbDGxgjk3g9Ph5
	Ctscby98jztFwwYsLs3md16gYhkm65FiFmnXTq/XbauVJ7J5GaJDX/6O5esCByzAx8+ryrug9IX
	20VITyWyvGFuqDkBv1PccBpKbp3t3Q8PYyTe32u418dOq1t+FHks=
X-Received: by 2002:a05:6a20:9193:b0:366:14af:9bb8 with SMTP id adf61e73a8af0-389823e669bmr2747144637.66.1767708709183;
        Tue, 06 Jan 2026 06:11:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkNJzHueZJopbOADbo0HQYswpQnnoxRAE8m7ARtjucQr/D5znXt4T4E4ZptoObFHwYrocHNw==
X-Received: by 2002:a05:6a20:9193:b0:366:14af:9bb8 with SMTP id adf61e73a8af0-389823e669bmr2747114637.66.1767708708558;
        Tue, 06 Jan 2026 06:11:48 -0800 (PST)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc9e7e8afsm2568498a12.29.2026.01.06.06.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:11:48 -0800 (PST)
Message-ID: <01468d87-0e2f-4328-89d7-d1fa6952d355@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 19:41:41 +0530
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
 <e396bef2-e5bf-4e6d-98f4-37977d5d93ec@oss.qualcomm.com>
 <dbkrbec6t2agwk2swe7olz6zkhyphpbcl7dpmlwie4esvbbvro@s7ybpmaod3d5>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <dbkrbec6t2agwk2swe7olz6zkhyphpbcl7dpmlwie4esvbbvro@s7ybpmaod3d5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9c8bVLjBig8Wkgs5Wh4m5iUN_1mLwIhA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyMyBTYWx0ZWRfXy+bxzr1qvxKv
 DbA/FBgD8iFcCMMXw+VrkPB3MlJKNtgao+lRYq2/LipVgJLokQQIJaRxTfmkZJOERLjn/h2CFAv
 kRewhG/rANITpiGd7SaQHDwD3sphRufctnM78DWdPAOhyDa+EvBjyalzOmnYBHX18bBARqRfIJf
 RzDtE6Yo0A0iUwjdedLoohynb8c6NcojsKGd4I866Z8ep6vTYeRcq7STZk9t+vuWONT2/BS6Oh9
 9Ww+RHPaPeNTZ8SiHhd2fx2cJrh9W8aGl3oap55fqRJtsNTjw25tnOLaE106Ot7116Og+fXk9Fr
 Qny9EpndvKd6gr2sH3VcNbD3WKAlS5nlUkM8s9erOzXT3JnVnWBnRfSJMvdGKmGdmq5coEUk02Y
 J/MBCafp3luQ4ePsrsdNQ6OomipaVuOq9J7UqoFuhtQNEzy82/uTS48Sdtc6bXqFMg2KILLjJy6
 nagFXX6tpBFdK/DQY7A==
X-Proofpoint-GUID: 9c8bVLjBig8Wkgs5Wh4m5iUN_1mLwIhA
X-Authority-Analysis: v=2.4 cv=FK0WBuos c=1 sm=1 tr=0 ts=695d1825 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i9k5oBss9a2rpNCq0dQA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060123



On 1/6/2026 7:22 PM, Manivannan Sadhasivam wrote:
> On Tue, Jan 06, 2026 at 06:30:05PM +0530, Pradeep Pragallapati wrote:
>>
>>
>> On 1/6/2026 1:36 PM, Manivannan Sadhasivam wrote:
>>> On Mon, Jan 05, 2026 at 08:16:42PM +0530, Pradeep P V K wrote:
>>>> Add UFS host controller and PHY nodes for x1e80100 SoC.
>>>>
>>>
>>> Minor nits below. With those fixed,
>>>
>>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/hamoa.dtsi | 123 +++++++++++++++++++++++++++-
>>>>    1 file changed, 120 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>> index f7d71793bc77..33899fa06aa4 100644
>>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>> @@ -835,9 +835,9 @@ gcc: clock-controller@100000 {
>>>>    				 <0>,
>>>>    				 <0>,
>>>>    				 <0>,
>>>> -				 <0>,
>>>> -				 <0>,
>>>> -				 <0>;
>>>> +				 <&ufs_mem_phy 0>,
>>>> +				 <&ufs_mem_phy 1>,
>>>> +				 <&ufs_mem_phy 2>;
>>>>    			power-domains = <&rpmhpd RPMHPD_CX>;
>>>>    			#clock-cells = <1>;
>>>> @@ -3848,6 +3848,123 @@ pcie4_phy: phy@1c0e000 {
>>>>    			status = "disabled";
>>>>    		};
>>>> +		ufs_mem_phy: phy@1d80000 {
>>>> +			compatible = "qcom,x1e80100-qmp-ufs-phy",
>>>> +				     "qcom,sm8550-qmp-ufs-phy";
>>>> +			reg = <0x0 0x01d80000 0x0 0x2000>;
>>>> +
>>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>>>> +				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
>>>> +
>>>> +			clock-names = "ref",
>>>> +				      "ref_aux",
>>>> +				      "qref";
>>>> +			resets = <&ufs_mem_hc 0>;
>>>> +			reset-names = "ufsphy";
>>>> +
>>>> +			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
>>>> +
>>>> +			#clock-cells = <1>;
>>>> +			#phy-cells = <0>;
>>>> +
>>>> +			status = "disabled";
>>>> +		};
>>>> +
>>>> +		ufs_mem_hc: ufs@1d84000 {
>>>
>>> ufshc@
>> ok, i will update in the next patchset.
>>>
>>>> +			compatible = "qcom,x1e80100-ufshc",
>>>> +				     "qcom,sm8550-ufshc",
>>>> +				     "qcom,ufshc",
>>>> +				     "jedec,ufs-2.0";
>>>
>>> Drop jedec compatible as Qcom UFS controller cannot fallback to generic ufshc
>>> driver.
>> "jedec,ufs-2.0" was set to const in dt-bindings, dropping now will lead to
>> dtbs_check failures. is it ok, if i continue with it ?
> 
> I was implying that you need to drop it from both binding and dts. It was
> incorrect from the start anyway, so there is no ABI breakage. But make sure you
> justify it in the description.
> 
sure, i will update in my next patchset.

> - Mani
> 


