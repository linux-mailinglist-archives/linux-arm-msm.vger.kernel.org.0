Return-Path: <linux-arm-msm+bounces-38111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E199CFE6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 12:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50891F21401
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 11:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5FF199FD0;
	Sat, 16 Nov 2024 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7EnHEOv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1475A190499
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Nov 2024 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731756001; cv=none; b=LF8Fzb/m1+ua4GB46Cf8233qBEHFsUvNpHWTbgbAqyK/mQqb60PVLDCupDq2297b1aT3oG7lbbdWgylDWyJ7sh3TzGRsCH04QnapTvIPrx1aj+fICKnfwjVqLZe+xY0y2tfCmxUB+vmKVymYP/MJqRzQT0+fZLObvihTWwP/+ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731756001; c=relaxed/simple;
	bh=J6kfy9ry4YBbCS1oLGeGeLUUisvy404awHC2dh+6QTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdNKCcB+NzyjrD2bOLYlmBqJtXK5tool0GaqMV2s3YimM0PBbaLYRWx9OeHw7dE7QNnaDF4A6ut0MtMTWX5FsnNn0elYO3aGniml7K7KTFt4bpvcyNPL/crdgFndIWYBL56j6lVuW8HRd47A8op2Q8K9Tezv14cfJAsGWKpXFo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7EnHEOv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AG5JZYB006100
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Nov 2024 11:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oq/B/suR0M71LPCQPb6fxgoh4cWfYRvCoyxYOV+0IY8=; b=B7EnHEOvrFowOXEK
	k5oH1i/wQQ9QmFUaHW88uNiLPFO5EUGaxdhYxlTfch05PLvUxLJe26TkYg9JZ9CN
	IfCxrIeJd/IK3BgMG2Wpdilvviebk/DVV3LBP7fHCCjslCEblsJ9qjfyiyQM6x8y
	Sfe9Kt0on8oTqIrWnax4VbBaU66EIoGJr7TPtpGIgPf6MGKcDNxTpyqp08p7b678
	X6zuUvXOLUCpZoDAEDjXPt8Z2ryn/4oSUe6mNGMhw96nZG6fxvR3tYg346fB57WM
	7pAWQ7rS7T4YIHRgSvw4Ki3EoixgYeSG1r5C3f+ldI54/drbZCYyzRfqR+vrOJmq
	U5ZjtA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xks6gp2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Nov 2024 11:19:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d405b0129dso2745216d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Nov 2024 03:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731755994; x=1732360794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oq/B/suR0M71LPCQPb6fxgoh4cWfYRvCoyxYOV+0IY8=;
        b=TtBYKzxRYJ15iFM1xJsY54VRNIYR1VfoZ8dbkvM/PRgZjDreTAlLMDCe+foVrGKWEy
         zu+sV3v88rNsVhBkzn/3cxmX30pPirQ8XWT/bHA5Jx9ybbL9VpkXSb2jDQVGYfHf7Cb+
         5gR7Sy2Jc4jitpXH4Rbs66vItsNsDTMWQVZE+2Hw/UttQIg7577UCeef3vrjhLvdNiWf
         mJW3Kuk3Kl0jXUaN/ySYxEW4TYbTHa0h2oOOL1KXTrD8hKbuiPvsV73HyRUiSPOvnLDJ
         3wlCmTcqMkzaEW7U4a/vtTiIGoY35syeu3wW9m3bpZ1cTsEdvvjF+xLO6TsTp3W+wZPI
         SPDg==
X-Gm-Message-State: AOJu0Yzrkyzs5uKtlcE378h6FL+9PmlwCuubJU5cpFkPK/9Yg8XVjec+
	LL2YaIlM8XHTP+mklX9SS2hjcG/InlDjCUJBXEopiEtP3y4jwB33cZXNMXGWOrckoN09iB8iJNu
	HHsQZ4mo4BF8Minn5N5+LoPSgmoSr+GyvgdMECcTP9PTgXGYEFbYungtfW2Tnu5oS
X-Received: by 2002:a05:620a:458e:b0:7b3:5cd2:783 with SMTP id af79cd13be357-7b3622aa78cmr314672485a.5.1731755993617;
        Sat, 16 Nov 2024 03:19:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR6XSRrca8UmpUuqRAeeQAihbCAS0Ja2wPQnLIo2nWzdYWymh1Oq227aZVjpMhi2PHlj2Jcg==
X-Received: by 2002:a05:620a:458e:b0:7b3:5cd2:783 with SMTP id af79cd13be357-7b3622aa78cmr314671285a.5.1731755993178;
        Sat, 16 Nov 2024 03:19:53 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd771sm294251066b.121.2024.11.16.03.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 03:19:52 -0800 (PST)
Message-ID: <5648484f-38f2-4c75-b8a3-7a0148dc940b@oss.qualcomm.com>
Date: Sat, 16 Nov 2024 12:19:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com, kernel@quicinc.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20241116-presets-v1-0-878a837a4fee@quicinc.com>
 <20241116-presets-v1-1-878a837a4fee@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241116-presets-v1-1-878a837a4fee@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w8mStMB2fxZr5nU1ayNRbm8p1uu3n_vx
X-Proofpoint-GUID: w8mStMB2fxZr5nU1ayNRbm8p1uu3n_vx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=892 adultscore=0 clxscore=1015
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411160096

On 16.11.2024 2:37 AM, Krishna chaitanya chundru wrote:
> Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
> rates used in lane equalization procedure.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a36076e3c56b..6a2074297030 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2993,6 +2993,10 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			phys = <&pcie6a_phy>;
>  			phy-names = "pciephy";
>  
> +			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;

If we make all of these presets u8 arrays, we can use the:

property = [0xff 0xff 0xff 0xff];

syntax

Konrad

