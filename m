Return-Path: <linux-arm-msm+bounces-78399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A10BFD951
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BC2D1A05F79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030D02BE04F;
	Wed, 22 Oct 2025 17:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyuqzZcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F0D29B78D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154161; cv=none; b=dpHehd1yNOkYS/3V8zPRO5/w7QbPbF63mCUZeZrF2xrB5DWgNo9dWW2sREdThVEeboAoiykZlisqkoRLZQiEbXliHeftVHosB217mxBtpWDxpQkKHU8oCv9M69d5DGhze8XlBxkb+X7Cf0AMx0a5A2cdkXEZuOcs/983UFhN4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154161; c=relaxed/simple;
	bh=dyHSc0Hkf9JlF3396d47TnH/fkxgN2mhFcVau1LyB5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4KYqJ0yIkvQj2GWSe6x+rI2i64oMMWZWeE3aV1FAel/qQyyPg78KzywH7P/S4gLZKKVG1Oo1oGnNKpI5jRi9Acac/d6Lj3aRQijtOVoqjfqdBSUAqQoV7uXAySuGnmfScGRWOO56cNN2zAlX3NX4wjK14nXEM2bh0iAOwTPtA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyuqzZcl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAKSg2031065
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eyyrDYcjKGK47utngRF8H7m2HMSV90kJe50AtFvZfng=; b=nyuqzZclj/rzhlYp
	9CDYcsBf0gkB/79RfOhqhHwmoXl+sK4NKr6tPNnat7sLjhml+nCLYxVhgyaCtFu8
	HoV4sSioPH7UHAlaVUfRS6LFExuGVgKXHyM6isdv8S8kH9PpESGN+fan4RDNjnx0
	onYJKqd1OYHC8aGkV12DbP7dFqRxKPLI4eFTCY0LjzRm1KXCxbpt8ZVZyg0KcyA+
	I0WFYwKEVR9CQB0nEQdT7U5s1wzNfdWKyF4lz9Guakoe5c151DpJTa0Vyn4vBc3Q
	pOTDgo82yNVHXxuKwrZVf2pK1XRMco5RSMc4UgWO0O0fLP4UohT6LVktWK3JISvB
	XotrHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kdbcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:29:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87df3a8cab8so5479886d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154157; x=1761758957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyyrDYcjKGK47utngRF8H7m2HMSV90kJe50AtFvZfng=;
        b=CsFA1D8syCEbvZWJDQMS0cmC3o3din5Mf26X7oHqY5kpsZNKuEbjsnjbmjabMLckf+
         rs9UiKWhL3YpZ+7mxvRFMJzCqtRCeg2B4T3TjlxhThakhnNIKje/W0PnY7iqrI0UYMQ1
         v4qcuXwKdmi/AKuZXO3OaAqM4Rw2G5g2iYAN7O7vCS/HnjE/Cz9B5YUWI6cFVF4vPSF8
         udU5NHLwLulgX0aW5sSjUzpU3Ox32vRYS/dn6PfMuJWSczHKQobb23OoATGrZe1MjeKV
         koM4ZKuSBjWQg8qGB5uPVm/P7v20OMibdA79HInfEXhB9rVSBNqC1nHGlYzTA3IrNiw5
         0ebA==
X-Gm-Message-State: AOJu0YzeYs+uLls1k1hAFTL/tvk4f7aiGpl0z5+W1IHElc7mCeirt3eP
	NhLBeM31c6LI6RfkidLzxZJqC9YXq90NDpFyzuGUrzvIduos/t2guQKH22a6uSk5EEEf8v+wv+x
	EwN+GwiX9xgNvjKqTb6TPKbBPVzCmTEZHjiAsv0EH9ftH1cYmV/C90hQcLJ8EMpB9cZqm
X-Gm-Gg: ASbGncvaGSuaIuSxclu5b8tOrC1u1J8M2l0DZoqLg4D4dcFhD2BlVl0osbCgYLfB+VU
	c4RFMbxUI7AWBE4SpMyNVRLbtht9QfxXDHTsS5w9jtSnb3lZQx0PZhiJQ50p1cOYz0T9sQj8pLp
	6rmUop54z/Ai+WOfVx8j6evt/RqjJe4/K2aEt4ozuI7sOze+ZK9tUR02hs6s5CFxnTIubr8cdIq
	DjHepO8Ddf89CcnF3HggMlPo8dn7C4dNxSPMVASVQuC8vjEKDsg6ALI91qTagzQZ/FEVXYN4N1i
	a7Zvuv0vUzNeR5pu4qQfnzxR07fluFcLgcaJl+v5/T31j83bQvPoG45iPccpXeUBfT+JExQ1Wnu
	GYK4UH2VLZV7CMWQ1JtPvSjHWA848h+s9sgXF18aWzpdNnItBNUhAMez3
X-Received: by 2002:a05:622a:148b:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ea11710be3mr66600481cf.7.1761154157204;
        Wed, 22 Oct 2025 10:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJw8MHnQwZbTuwNgN0otjEnj4HLV0d9qerQIspFAPXfhpawKwe+bMV3LTIHDxza9e5f9p0Ig==
X-Received: by 2002:a05:622a:148b:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ea11710be3mr66600041cf.7.1761154156496;
        Wed, 22 Oct 2025 10:29:16 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25d4sm1382273266b.9.2025.10.22.10.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:29:16 -0700 (PDT)
Message-ID: <c1d09672-e8a4-473a-88dd-fc91e81aea52@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:29:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add cam
 actuator
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
 <20251009-ak7377-driver-v1-3-29e4f6e16ed3@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251009-ak7377-driver-v1-3-29e4f6e16ed3@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sNyWIAoMevJH-uB40c5J7tOV6D1LBP8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXxIsQ4p7om9+u
 RrR6FntRJlWma5DPBGnby+WRFb7LUqyeUDyDY4Xb1LpdFzXGyNSeo60vLiBfXz0A3O1m+Ouo4Wx
 3em8d7ee0iB9BfibPyuXcd92spzWMQGRUMxmkuOmfgMhRt9aXJ6MbJa6lH2DvwEawpSUJFNYT8z
 3PKu03acyT0UtgPktovLbLJnH6TuZHVgN8XZB8VqT2YF+0yPfXsj2eQ+BKNv20hxpR93NbLpbAW
 js8dEdr9EAWVAOPwGZYpOhdkC3YcNd2lFBboSQ78M2GNfrNdQZw2SZDxyxYzYBDDQwKn0AyItth
 Kbd1y9Lk3JoA4nJGsKIjIYdvuiiT5ZYyBNtJzknZRzZ+ax0YQwPDzQD/o82Ew/yaarxctQft2AQ
 h9jCRo3syKrQBiA3MU9xHn3PtNK7BA==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9146e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=AbxdTx203xjBR5gTc4sA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: sNyWIAoMevJH-uB40c5J7tOV6D1LBP8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/9/25 2:23 PM, Griffin Kroah-Hartman wrote:
> Add a node for Asahi Kasei AK7377 actuator, used for focus of the main
> back camera sensor.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index e115b6a52b299ef663ccfb614785f8f89091f39d..49654f0f914fbe18080d2f55bb6877c8ab7baf0e 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -616,6 +616,13 @@ &cci0 {
>  };
>  
>  &cci0_i2c0 {
> +	camera_imx800_ak7377: actuator@c {
> +		compatible = "asahi-kasei,ak7377";
> +		reg = <0x0c>;
> +		vdd-supply = <&vreg_l7p>;
> +		vio-supply = <&vreg_l7p>;

The dt-bindings suggest vdd is 2.8 V and vio is 1.8 V (at least
on AK7375, although this isn't stated explicitly..)

L7P on FP5 is 2.7 V (default) - 3.0 V (which you should probably
tighten to the actual operating value), please double-check this

Konrad

