Return-Path: <linux-arm-msm+bounces-56772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D890CAA9142
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 12:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FB59167CF8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 10:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCF61FBC94;
	Mon,  5 May 2025 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3PUSukw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A194437C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441323; cv=none; b=DBzYmE+xlZOe5EiJYgLap+zeA8nAP32Pi+LPu6ftCLjgTslEsCiQaSNFIo4LA959UQkQyhwZQS+8h+8e4u8BebOqgqR++O5/UIS16fFQnLxa3xXebguV0xIQrAePwGiKbtetF9xUflyykod44TFg5fJrIYUb/qZOG7iTqjs5QwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441323; c=relaxed/simple;
	bh=DaC2vDdqmokz9Jt/U40zeutsPirki/qadpEpK5UZga8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tK7+MfSJok+aAslD5u2mfg4I7hXKhy4aP8mtCVlo4HACgcvGmnU8N+8ZL/SKwuxpjloSfsp7+NZbhq+ot1JiWBTzlZPuaF/OTmU0DLRdTGq+JXYx8JHwMbvF9WoqGkPyhs1+fVwmn9gH+oqrH1Pn1f0SZ3p8vgfv9Iyd2mso3BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3PUSukw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Muguj030901
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 10:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mzndjCg+e2OPuoc9rAF/IaDWFAfTk+vHxfMSSvYANmI=; b=g3PUSukwQcumUQ4W
	hpzGmBY1y8ZIOFAs1AI7ul4kpiFVp9AusLV6bWWe06IKm0C948aSuV2Gh82W2dV/
	PyZJOc25/WBfqwSAp0DtZDZV6jm3e/D1pKWFUQKyRediGofam3Vaxzuf0kuJPmnB
	Lz9y1kEmtzmDhpORXn+HFWtXmrAeFf5KrkKcJV9qYbaVYDCwn5SaDdhxjWdQ1QFq
	uEJXKnO2b3I/mOFa57Gcv3dNXzo/5NwkpA4VHCmjGf8dyMdJhvsYGA7i0J/RG1x4
	YXCrkAiYF0aOQdJhNkn+nd34jmD89CrrVwbTdVGvArsBqb1y3B2MSJebe06a0e/5
	GQV7MQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3ruu7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 10:35:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7375e2642b4so2866242b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 03:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746441320; x=1747046120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzndjCg+e2OPuoc9rAF/IaDWFAfTk+vHxfMSSvYANmI=;
        b=gBR10YXvn7NKO6GjqMltBcQwgrRpB2vGhTysXPWE/JSlfxT9rOu7nBGnUAtEDPPeRr
         ysJtZgrPReINE7xaA93I39QfoQqP2IoKWHMOHt4C0QnYEb71+HTXldYJvvCxeDzy2Ry4
         qTKJ1J1umXMCOsY0tbBGMNuiENvu0bivHrsjOS8xyEtYxxnpw/LwE03Wz3Tyxjh8Z7fb
         EAM81g72C4r6AP2RASG0doKYJAE1gnB6nPGSle1rOa790gCdYYX5ojghskfUEZHBgnhA
         EmDwWBH35z40euBiHYm4DaZrfv6xnFcu/+vA6j0XjzVIJPno7b9GU41LTxkIeeWlXaVb
         0sfw==
X-Gm-Message-State: AOJu0YxGCmLlkysLT8oPtKI7m7LuT45xU0f95u+x3j6+4z4KcUyTAngN
	8Fj5MGwK9QdowvAMcUqWx+de3ri5AlRRze0X/ZjDrnL7BxFCynJf/zRqB/m26DaYXJ83xwf1s7k
	lmggYnkFEDZmg/swi2Vbag0GwgmPKlNICIn5UbqsYEYvyIUpoaaIzTSzJRbmC2Jy9
X-Gm-Gg: ASbGncvwAmNmaTb6oFRjn6NdOLnwvCo9sssJ20wNFxeKfEguX7Z+hBBkbupwJMwyUzA
	99cV0xmhqIChAHm8iNqSXYBveXoRXdTfc9zX8TJNUocxIdBO1ZvQUXayiiBbzllz/3fj9x2mNZ1
	LC7yelcokeQDlklWdoCRjliVj5uhXBTVoBsoq7u/54xRIVyVu2X5A/L2glL6rhTRBrJNp1lzVVS
	g8FYUjEUeTb5tiqSHTnvJd5xJr0WvZOSnrGfl1pnp6YaAIKwBXOvNEh7oOLP4W4VwH7eBFxwSnZ
	ZMRE85oVCxXl7notZy4OOXcpSowdUd6P58UqcvtcN141xd7WZMHv
X-Received: by 2002:a05:6a20:7d9b:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-20cde85d355mr16144503637.14.1746441320570;
        Mon, 05 May 2025 03:35:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP03PciZv8s1ToFZ5GwS61QgMF+GczmQXsLG40quiJUaX2iw5O5dKsziticwj7Edr0uWka/A==
X-Received: by 2002:a05:6a20:7d9b:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-20cde85d355mr16144478637.14.1746441320214;
        Mon, 05 May 2025 03:35:20 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a225sm6379719b3a.23.2025.05.05.03.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 03:35:19 -0700 (PDT)
Message-ID: <15f4021a-821b-4a5d-8873-8eb8f59484e2@oss.qualcomm.com>
Date: Mon, 5 May 2025 16:05:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: fix MSI base vector interrupt
 number
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan
 <quic_viswanat@quicinc.com>,
        stable@vger.kernel.org
References: <20250505-msi-vector-v1-1-559b0e224b2d@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250505-msi-vector-v1-1-559b0e224b2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gQuoFWi2JLUWImjH6rqz_d0AR8zqWKFy
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68189469 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rSoPyq_vb_VxFnRLzkQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gQuoFWi2JLUWImjH6rqz_d0AR8zqWKFy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEwMCBTYWx0ZWRfX0pCYMzG9EQbl
 3P/PYx4Ke8nIGS7OGEQ2GxAWNDkve2u2F5E6DrkJdSb5kKYFBuMI/IX5L0wsYh5//Oi0u62/eFO
 N0wnO2h696e/dzTUp2izgp7qKKMxUaxZBfUaIF98J4xl3mUXEMJuAYx/8t+jVbSGoEBqmczaF1e
 zFNoZbktai/KZdmiOGrIir0tbDy5jvslHg0Taho2+gY69ztCp5irbFOVa8KTSKPODmFzyF4WEB/
 PDjPaiXoYRI6o1sTqxhsfkWA/ziYvrsbYbuWm4WvBBRTUNONGEswZLeuRUZH0t4XNryODX7OKE9
 HG0rBexR4FQhBgIIQ0Iw6lryXcLs+v5PTXA3fDhR+VIJlmqaW9TtQDtDV2UQxfUmNbi2FGLGmiT
 vhtMZwRVr7CYZhL9F4v921zTUoXUOc9wyzylG3oBu4SpYp4pTBCV4SxLF0bSvF9WlNILPOXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=756
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050100


On 5/5/2025 3:29 PM, Kathiravan Thirumoorthy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>
> As per the hardware design, MSI interrupt starts from 704. Fix the same.


Please ignore this patch. There has been some confusion.


>
> Cc: stable@vger.kernel.org
> Fixes: 1a91d2a6021e ("arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support")
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 5d6ed2172b1bb0a57c593f121f387ec917f42419..7a2e5c89b26ad8010f158be6f052b307e8a32fb5 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -371,7 +371,7 @@ intc: interrupt-controller@f200000 {
>   			#redistributor-regions = <1>;
>   			redistributor-stride = <0x0 0x20000>;
>   			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> -			mbi-ranges = <672 128>;
> +			mbi-ranges = <704 128>;
>   			msi-controller;
>   		};
>   
>
> ---
> base-commit: 407f60a151df3c44397e5afc0111eb9b026c38d3
> change-id: 20250505-msi-vector-f0dcd22233d9
>
> Best regards,

