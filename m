Return-Path: <linux-arm-msm+bounces-71599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E6B400AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2621B1B60661
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3762236FC;
	Tue,  2 Sep 2025 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiCg9BPE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031A223328
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816427; cv=none; b=PknDfkGslNyQi7xRTW9vCl2KpcB6F5D1cTuAxQTXxAJCQ9zfmaXllzMVZr1k9WjLmbOMZI+PKV0kD5KkY/l79ECUTGROOSHdrPTosoj+ztPxiu5i5YKOeLZRitBebXBjO/3/KFIVmWn7QQzE1UiST17dgOyu/0X+OYX3Uyve/ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816427; c=relaxed/simple;
	bh=kvqOVMR4o0pU7F93TYucrMso0qNifJEbmyq3RetMaR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iz4mpeq8Y6XCci5BOFF7/8fHhX/ZQuHgy7TFJWaL0QRoZdXNPRL3YzZfJcFPIIa9XRvsCkXSpINvhTDjWMYli4GQfO2Y6QCM1PCuBgsCMoNZNLcy4FDbvVNX3ZCdS3zMFg8/atBkkG4qg7nllIOl+kTzTHHR11PEWcxM0m06Yhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiCg9BPE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B0nbW016317
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePZTdmUf6KFfxyF2pqsIlm3pu0OeNHUO0L61l+SXJy0=; b=FiCg9BPEpK6x7I64
	7RRmIzepKSW/QHojczkj664kePHY5HOIvzZcEhp0VvJmYYpKFV1Xclh0BYfNH6zE
	1D3DyHLkHD/Ublrmy+LSVnoe+lNv0eBa39xBzrm88qQVKFz6XRivu/DeMg7xvsiW
	KQ3MRPDTn+kq+zTg1WmCEXBobGmCLN08gZdQWvpPRa4GGZmoLHrknQqMTQRbSriZ
	VAOw/LXH4NHLKD2+D0zSLWsRRBUHvLfPz7n1W4Xb9xtPV2AMlrwJcNzjt0gRX3aK
	WHIqh+o1hV1cOyXyGy+YFnNKd/gyC0/92DF/rKEemmICLN5Ln1uBaDHvCFgSVlvM
	/LjrlQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyys48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:33:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4e516e0e2cso634141a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816423; x=1757421223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePZTdmUf6KFfxyF2pqsIlm3pu0OeNHUO0L61l+SXJy0=;
        b=im3v9GGIUh7hJ96XbwRuSYSvssb/FIR6rIohVVLP9alNt7Gtw2rgLMOeMtm2Qj8Lqs
         P90qBJKOJn+S2URy5f/pKJ+l/O9uYmLikmE3iUnYA5SB2B5dzZu5po6fR4tUaqCJslpy
         thDZs1AbyjbcIlBOTcZkPSNAxnbUwwyvOr+wDbjPK84rTWMo8gs87tP9UvNq/ewMUqO0
         foubuuooYruM/EkuzeEyuL6WQT326WKlJEoVtncI8H9TEjdfDOuSx5SfUVkBx0Irxpls
         O0dvx4F4OyorsztOrhpl3aawS8XRQ78otXJT608ueczHkqFmrOuP0smpw/Lj47L/4OFg
         oXdg==
X-Forwarded-Encrypted: i=1; AJvYcCUG1CgRhvWUelWZ9LfYEe6/q8RybM/U0eakGUyv4ZKWVThRXK55Pk4SgZBJjlvoYA5u29wAy6mBe2gC5BFS@vger.kernel.org
X-Gm-Message-State: AOJu0YzkhjOwmHCB8xiLMJ3xevenMTrzwU7k9CNFblcH2vGxghdD2W4w
	9/6rO/EIxqr88hf302QZ6Uvbb8Ht2kR+z4pHcxHdHDZr5hayV4TSmwawslcPsfLBLDLZCPGs9rT
	8/4EjwAQ8XzAQMGkMXna2oKH4HqQ4lsQfcO+P2lIV3KNEgJFClKzAs5J1OsS99E/nrL5J
X-Gm-Gg: ASbGncslidYt8u4+DjIKOgQ+UWgAyY5xVwFFrMNFmrLACKSsef1SvasC3vjxFB3MWQo
	khjn4GiL17dbv2LYh/xJOxtFqcXFZ0m/mh/Cc+c2WH4RXEtN4wNp93dZ8q+u3OX9qNaJkVBaBZI
	+MNtaV2x4WUl/YtrYvIxjQ4Ilq3YVOAVlBUUEjzBaKnDDJ8ggyh6Q2I439G9HLb6zK/fTrEYgRT
	8eeSaaFNoPT3FFgDc7fBceTCjUQtyeRSRMSaGp+kPuDoD20TTFaiuV/1m5fHJPRfyZEndKAgWe5
	B7VZSvlz6+1U1EQ6m03eQBzr9sCh4xY3le5VDqqmyeLEHmsk/HeQ9LUYHbul6flKtmoN
X-Received: by 2002:a05:6a00:807:b0:737:6589:81e5 with SMTP id d2e1a72fcca58-77232745936mr10198815b3a.2.1756816423279;
        Tue, 02 Sep 2025 05:33:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0JLLCl24/XxHtW1P90wzr3zdEuQgG78e3OMvXqmWWovPD7etmcGpFWIC0dv3MhgBiZkmg1A==
X-Received: by 2002:a05:6a00:807:b0:737:6589:81e5 with SMTP id d2e1a72fcca58-77232745936mr10198784b3a.2.1756816422782;
        Tue, 02 Sep 2025 05:33:42 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725f0c4008sm5258376b3a.35.2025.09.02.05.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:33:42 -0700 (PDT)
Message-ID: <31fdcbd6-2cb1-4117-8201-f49c749dd357@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 18:03:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Monaco EVK initial board
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Arun Khannna <quic_arkhanna@quicinc.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
References: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
 <20250826181506.3698370-3-umang.chheda@oss.qualcomm.com>
 <20250829-clever-analytic-pudu-96cda0@kuoka>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20250829-clever-analytic-pudu-96cda0@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tf5yrsF479wmWvjkoJ9bR0IsrRmPiUjg
X-Proofpoint-ORIG-GUID: Tf5yrsF479wmWvjkoJ9bR0IsrRmPiUjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX0vJQvHrqO9gO
 BXwcYuXEU45oloEtUF/bUJmBH8VukC5hgKnUJj8R9Yp47YzfSHcKZFSmMvpGmRsF9rHhyPdXIiV
 6iSOkkL9LwpjXQIZmO4mS3vEGKf/YFsVwxF8IqhJHmFtwiZ+bngJhODplpZDuZEpAaM9gjad11C
 5zACnwVbehA1Sh4XtvstBbA9sZT7g2c14snTa5cznIoyxEde8hlNGdMPCdApM2irIRPxhurFy0u
 T9QpUJOKejNZn9BAN1JgHTzLMQ40UzkNEehg6GMblKyUenZ3GOuATlMe7fQkOQr7QnAzfhpkvl/
 2Q2g/zc36qkBHuMiNT7mvYeNY/+CgZ58cay8Hb6Ji3TDeR6LSPkxCAxPxAsDNIvc1rejTx5blNv
 xaNnLMU2
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6e428 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=UXIAUNObAAAA:8 a=Xc56VXtM65tYru8N8fYA:9
 a=QEXdDO2ut3YA:10 a=bFq2RbqkfqsA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027



On 8/29/2025 1:29 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 26, 2025 at 11:45:06PM +0530, Umang Chheda wrote:
>> +&i2c1 {
>> +	pinctrl-0 = <&qup_i2c1_default>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +
>> +	eeprom0: eeprom@50 {
>> +		compatible = "atmel,24c256";
>> +		reg = <0x50>;
>> +		pagesize = <64>;
>> +
>> +		nvmem-layout {
>> +			compatible = "fixed-layout";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			mac_addr0: mac-addr@0 {
>> +				reg = <0x0 0x6>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c15 {
>> +	pinctrl-0 = <&qup_i2c15_default>;
>> +	pinctrl-names = "default";
>> +
>> +	status = "okay";
>> +
>> +	expander0: pca953x@38 {
> 
> Same problem as in all other recent qcom boards.
> 
> I heard that some teams in qcom have weekly meetings and discuss what
> did they learn from upstream review.
> 
> Please organize/join such meetings.
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
> 

Ack, will take care of this in subsequent patches.

> Best regards,
> Krzysztof
> 


