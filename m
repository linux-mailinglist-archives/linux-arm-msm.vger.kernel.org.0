Return-Path: <linux-arm-msm+bounces-86830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E92CE6A83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F106F300E14D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49B82BE65C;
	Mon, 29 Dec 2025 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2a218qy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjIY0qJB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9A329A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010533; cv=none; b=MgkMOUC4k4Aibwu3BR6IIovCpgDDSoE+HwAZb/H72nAVTHwcu5JaraGpcTyj6QY/aNGOZ2x5MfPzmBQOkE77MjlY8T5LaOG7bFGkdh6mAcVfSzMpNX7y3Aucc78eGqfBheRh6L8Stw4Spz9eNV/CFZOvJPE6EcjShgFGD8yujRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010533; c=relaxed/simple;
	bh=IC6ZmG+GThH7uqaKsQj9jsmeL2EgWXyWVKtAhUtc55k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxZiBtiFn6gNzitYVs8Y2d4qwR3eDMIc920Sgu7+vOtCw915xysR1e+GoaUJQ2aURB2mf+vOzMSA1ouW0OaWD25TT43p4oQA7H+YD0mz9wWPLdMh6X7XPfF15PhKtsGDNO5TZ5AcqnCi0WFZBiTibZwV0WjctziRyrXVhmfiIFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2a218qy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjIY0qJB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAAWmi3233565
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJCt4lPjw6KmIb+ngELMM2BDiXywmMuaIOQ6cPcLXAk=; b=F2a218qy0azcykWN
	+CMKY0piGxxBLYPyILE+dZLmhfgZ9MZxsh35nimDMjSbYZ4VhA6kDffMOnWtbCMM
	45NoMkBFciBHGXvL0iVLQx8nYYDgRrb68XtTdhpS7AWi1f4oTcW6PfRd50ht0aEQ
	aSRoCX3haFXNn1CSEFB46UIoUbUo0JqnjMSnXE4GJ3SUKFQXTLZf/+DnKuNvLMvm
	peCCVymBUHyl52A82TWYNmlgj3IonKI3B3nlzwfYUy425vG8ZDPiVqjdZdrZCa8S
	NVBSBqMxURnBONkoej2W937Zl5pXNI58C4G1FFJTfcfXrnzZsbDNDkaLeCBLHs68
	7Sq8FQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6c6uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:15:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee07f794fcso36059141cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767010530; x=1767615330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJCt4lPjw6KmIb+ngELMM2BDiXywmMuaIOQ6cPcLXAk=;
        b=PjIY0qJBiZXUJ0X3uCTNF05nti/bMaeDOXADgaEmUs9h2v5LTRbHcNeZJAiOwRwGcp
         qi5t1RlDK3udoqXYh3WXPONk8uh7lOwyT5R/nRjmEGC/EE/Arm2iRGvGjBCXYwBdv1SX
         flBLLganJ4k2crlt5U+4QE7zNrnsY0fKgrUs2/VFy6PEzSSukIB9DWPOVRjF7OJ7xCe6
         B/dxeJGnsdgDU7BcbDaGv/1P5CrgbcEfdqiyS8Co4p6xiFStsnROXTMEIoF6xJykJYJA
         I3chH6FbPv/AartDbPoRAK9OIRHgLbJdCWk6lyO2fU772VzbKBwEhVmcddv+74cqqs+1
         1Bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767010530; x=1767615330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJCt4lPjw6KmIb+ngELMM2BDiXywmMuaIOQ6cPcLXAk=;
        b=QdKnblDbGy6/Q28wF6l9yyCw+p6quYLt6JeQTR0A4h4nu91xAHrJCyBqeO4a7wMQGa
         /wwRIcHjkVSeYJmTOKIPuMM7OBZ97F3BXkhMELQ4LwCcy0/mxLMWhdo4cF07dV3eODoo
         m+kHFG+cPBmtVDccU7/SCXqndbx133lbBOt+l4Ey1b1CXyJb4GU83h25UH9XYFHqkI00
         DRQCcbprcR4mWnboVxBZkUyOa0Xt/Zkj/XCy+iDvsCV6Cu4LbAWb8Gu1ZMtYCU3W/WY1
         MWo03XXuaT8OBdP33JqQkx0MEbozkZGxAgbKcjObu8HTetEQMU17rhYIC+oNF6ln9IHI
         bIrA==
X-Gm-Message-State: AOJu0YwJxKzaWNnY+QCZSz7+7rcuNE123Xj4xzWF3lUdUyMmbl3OhGJ+
	HQ+UKt3d9NWKiNBm+yaWVYHE6Mbz8I3x0YVD7QXpgAnueDFWT6HZ76cxopkDF1oCQI3ELcf14Dq
	SXKwHGz87sXSPxUaJSB0+Wc125VcSp46CLPTc4UuPbuJ5QLJgpWkoW8gExVqytfW/s1gN
X-Gm-Gg: AY/fxX6E5Trre+8YU1IRmzNDFCEC1aW6l+xVL33QDVKpUkZZ4UTbjhSTsH9t9df3Ixs
	DHleNOZNK4GnL4PXptbDAPG7XZ7B+z6r+9u9g7TwZveJ/nrTvPaAv2xjBtGJaqOfHiMB9M56WuR
	SCXMuB8kUVSrnis7ekoDspEChLAnzjjENoO72XKgMkzlpbDXARDkJ4yKZRrrqnYiuhXo577plfF
	HoGhkyo+mQJ5/HS1p1+Uhkocw3S8ZWIGBwVCBchHT0ftRE994JmPifRc8x1QhuU7v38K78ZAaI8
	6/KoCFfN1SPuv+fC2NtgSwjqDjT9TykgOck6Xz4rvNhf5Suspnt+IKGoSaKaOb2sV4XK0uZvueL
	q1h8y/VZpm+cpKIqCa5isNI1qU3m851csWiJtRDk94Azaf7HeB9Mw1h5nkUW7UJwikg==
X-Received: by 2002:ac8:7c49:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f4abddcae9mr337101541cf.8.1767010530335;
        Mon, 29 Dec 2025 04:15:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0CRP5YKUbuz4LklS5fWci45SfW7k+U5Srf1XjxAOKfl5vUeEtjpXgFXb/++nvYwG74VA0lA==
X-Received: by 2002:ac8:7c49:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f4abddcae9mr337101111cf.8.1767010529850;
        Mon, 29 Dec 2025 04:15:29 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a614b7sm3353313766b.1.2025.12.29.04.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:15:29 -0800 (PST)
Message-ID: <986facd7-92e7-4d29-a196-d49cd9f3d35f@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:15:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for hamoa
 SoC
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251229060642.2807165-4-pradeep.pragallapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251229060642.2807165-4-pradeep.pragallapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=695270e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_zFdHPcPyFEXsBemdwwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: za9IlrFii1ESpantFQRSHyS21U0hoOtk
X-Proofpoint-GUID: za9IlrFii1ESpantFQRSHyS21U0hoOtk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExMyBTYWx0ZWRfX4L7FpDCvAWoR
 QZxPXbstwD2oDy7NE34he6LWx78U42eF2qJ7YC2scnbS9c0hHW6xDHAO/+JVcdKaW2L2bZQQolh
 TJ161swLus7L87kEGKZEgyN7SIHy8QsmmwCR2B+4kqKL8wagZorILNjCSm7Pz587ErBEy7A6cL5
 BqPdvaQ4HUvaiw5pkeKAbLMfUJqRiWHCU2YmpXWyl4O5Y4Kz7rdcSZMFTOxLSJuKBcDhMMHwtSh
 +3vjoiiGgd7n5TkNYQv823NT4TAsmmOo7Rkok1ssVN7nDjOhBQbDTyqi2z/ZrCLADCW7xf7MRIs
 Sxs7/tuVIv6CWIYGXEXZwjVjR/T6BEV6IFnfdJ9mCEot50OsaVbEpPEAMLREb1oecc3/M+ZV+VG
 i7AJ1l78tm3jY7iKs6t1GDI+1rXgc/ZIXRIuLwBPIfxrvyHyWz1qTO/7h+Zjo0CAYz/Wr/Qv+FY
 Z93aAvFdjP1HGe4tDTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290113

On 12/29/25 7:06 AM, Pradeep P V K wrote:
> Add UFS host controller and PHY nodes for hamoa SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 119 +++++++++++++++++++++++++++-
>  1 file changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index bb7c14d473c9..340b907657be 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -834,7 +834,10 @@ gcc: clock-controller@100000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <0>;
> +				 <0>,
> +				 <&ufs_mem_phy 0>,
> +				 <&ufs_mem_phy 1>,
> +				 <&ufs_mem_phy 2>;

This patch cannot be applied as-is (needs GCC bindings changes first)
which you didn't mention in the cover letter.

If it were picked up, we'd get DTB valdation errors.

>  
>  			power-domains = <&rpmhpd RPMHPD_CX>;
>  			#clock-cells = <1>;
> @@ -3845,6 +3848,120 @@ pcie4_phy: phy@1c0e000 {
>  			status = "disabled";
>  		};
>  
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,hamoa-qmp-ufs-phy", "qcom,sm8550-qmp-ufs-phy";
> +			reg = <0x0 0x1d80000 0x0 0x2000>;

Please pad the address part to 8 hex digits, so 0x1d80000 -> 0x01d80000

[...]

> +		ufs_mem_hc: ufs@1d84000 {
> +			compatible = "qcom,hamoa-ufshc", "qcom,sm8550-ufshc", "qcom,ufshc",
> +				     "jedec,ufs-2.0";

1 a line would be neater, perhaps in the node above too

> +			reg = <0x0 0x1d84000 0x0 0x3000>;

Similar case as before

lgtm otherwise

Konrad

