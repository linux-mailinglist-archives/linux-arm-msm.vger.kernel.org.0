Return-Path: <linux-arm-msm+bounces-75066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8184B9ED4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92F2D4C2B35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478DF2F532B;
	Thu, 25 Sep 2025 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8mKxqVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0792F5313
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797776; cv=none; b=nw9vzWpSG85bPcPaeYlEznoxkVqDPv1SObaxHS7ay8XbOlet4DaZK7OM/69L6WEon8zXRgXWwu+JVQuod1pMCKahuXRO3izgh67c5xzQ6cqs+vr1+GjUqMcszSGGjNcgOmUJaarR8sPi2G1elb8LlJJwMnHnpXRJ3cSv7wwrR+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797776; c=relaxed/simple;
	bh=I2bl8BGD/H/CX+NvF9/Yg+OntFs4E15hjJBJxZW8mtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1DbworZACi5sw6OK5/uAfbSjbNTfowWYyZ7pvYc/4STU+BBvuLR6W/vr8owDH6ePix5Qs7CS80ZA6rrY+9hCmYpY1P3lhiraxuEo0CzQApzefTxb/HLMmo45imUpj16M8Pd8QMNLXIrB+Qqs7WbF3uhT0e5mUWaVpcmFy8w0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8mKxqVW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PA6VtE029979
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tV0QaNscBMzvzZmNYQ2PtLUDDoPXdVBFyYeeoWv3d0A=; b=a8mKxqVWMpDLu3q2
	vy5yUqi/JfO3yBPyfBohcGa6/lQkuIWAM7rjZBM7NZMBbPIeTNU6G6a20r4X+ncw
	G4oV4fqFN/M8oejme2JyMJgB4ktNE7qRs0LLMkqn54i1TRLzZQRpKGwimTcyZhwy
	pHdbmG8FTe1lH3nMBsGyki2v6DWr/3XYOge8nmc8L7mTvN6Ybh/xF6hDLTILgjll
	2ealkRGYTCBXPkbPpHu0SakR2I+lwSbNwZpH4wy8zaxbSCKf0xL3dSFJhWOhUNb8
	eL/r3DQAiypDKK8mzoPAXOCAklM7IQ0pvouGQEuxBYfvMy2VHyh9OSZ5YAVuyWOY
	z3tBRg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fqps1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:56:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-798447d6dd6so2416106d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797773; x=1759402573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV0QaNscBMzvzZmNYQ2PtLUDDoPXdVBFyYeeoWv3d0A=;
        b=L6Vju2zFl1QxhN6Y/kEBmfXp20YS9/IchnfW/QmOviqfKdAAc26GHFfReg+DBUYnA5
         lnNreIW4yU7uXUQ4osuX5pnFGyENIicS7osgWEd9GNSTtUXBAz/1yO25U/xawd8mMH2h
         uwhaMi8aZRXe2uMKVvIAQBcryoXIF0YhWMSX2YZCDVRQ4iGD4vImI5Po5UR8NpkNT9kL
         HSWdgmMvcHbtA0+6uJVOAaXShXxYcTKvpd9a1WHBptSEnnDsXzBKDH8zwdoJ7ayaYCGx
         b5qpfAoMo2DcGnu5m9WkQ18Xmiv+LPGSMdonuBrmGn7ZYkX8fXJsyZo+s+jcxQRgRbAw
         a9qQ==
X-Gm-Message-State: AOJu0Yzfb1E8mcu/Te0UXbm15pLiKJLRCm6/D3e+Zm26u+TEbSaE6wGN
	GcFtiLvDCcXALWNR5OJq/jH2tKWH0gQzcmn9MGPvCCAT8zCVVU8ns7U2yoFOv6pxmMP3hFhMBmt
	Rg4pSCNw7wL/f7z5RNXb2TtECh0izUMhhZ0n5S2NIAC84ZsbmUBIgDlIr7gB2JK/7Ujb3
X-Gm-Gg: ASbGncu4yku4z7rEAJqV8dwJNpKR/AqS3lSeHaSRcxZBJ73JEKdl5lz3Uyedj1Bg/mj
	y5GcEcsZXR9JyK6LIuOCf75E3S3vkGvcCJq7naBBe7Nqm/vnfVghIi6k7mHTRc9fyl1YLC742Qm
	VJOUCLDFnDzPQZyUQhGvHjqDo62uQDK4GoqeRanFfikQ5SqgDmVquIkukXg0NSbY8W2VszQe+OW
	TlCkzK7tzbOFmkMqLWkkbiMeAX5FJMzwvAucSF8GBciGZMC02Gjz89XiEonnsR62Z94h7QUW0fP
	9j8t/hf6/5yc3XraHtMGUC4pNkFtUpuOMQ9iVUgDJBnb0nHXfoGU84T73EXx7VZR38qKE65qBsg
	xJQTL7CXKNhOXQ0GhPfqqwQ==
X-Received: by 2002:ac8:5d56:0:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4da482d67b4mr26783031cf.4.1758797772420;
        Thu, 25 Sep 2025 03:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqXUcPax237mPbdSTq35nVlSJQ6+FGxXdGzGfHOshUkR2/9tb/83bzcLQibplmsMiS5BCMxQ==
X-Received: by 2002:ac8:5d56:0:b0:4b5:f521:30f7 with SMTP id d75a77b69052e-4da482d67b4mr26782691cf.4.1758797771814;
        Thu, 25 Sep 2025 03:56:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d2eb6sm142800866b.13.2025.09.25.03.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:56:11 -0700 (PDT)
Message-ID: <1c8ae43d-ceba-499d-abe9-8014dab5087d@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:56:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] arm64: dts: qcom: kaanapali: Add support for PCIe0
 on Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-4-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-4-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iP1XQwdsU3xsXrT_8_iYiLP_nxL9t9sL
X-Proofpoint-GUID: iP1XQwdsU3xsXrT_8_iYiLP_nxL9t9sL
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d51fce cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=h3lg3G5xWeWm8zZk3TwA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX0jKn8XdXST9t
 uLYpPioFcx90+FEs3qFbM1CK7QmrW2fLIv5H+iBB3i71Muq62FdY8tcWdlsi78VhUCbIe1vXtvv
 dDTlF+coJAnk7HZbUuZCrzrt6M5K9tFH4vSciSAvcJbuoE/7o/kiW35VYNJySMbg0DgeFBiunVp
 V3k8vYdiM4jGZabbsyE3hA2Ic3kkAxEKzwup5ANFbdTfdQFUNZ1GpwX7439hyCeOhq/+viOJ3dD
 31OlyOhv8LOisuP87eMClov0Nf9WHgnHGerBj10HteAYOeu06UgLJXVasFHC6cUoG+LcTMsdy+0
 53G/FaoAloPkfqEa9h0S0ZrN+9N4+dSvsD4AEW8xm2X2whPRnFGK34UiAbTngTrdbwIUWHZfsDp
 B+utK/8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On 9/25/25 2:17 AM, Jingyi Wang wrote:
> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Describe PCIe0 controller and PHY. Also add required system resources like
> regulators, clocks, interrupts and registers configuration for PCIe0.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

[...]

> +
> +			pcieport0: pcie@0 {

"pcie0_port0:"

> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +				phys = <&pcie0_phy>;

how about:

device_type = "pci";
reg = <0x0 0x0 0x0 0x0 0x0>;
bus-range = <0x01 0xff>;

phys = <&pcie0_phy>;

#address-cells = <3>;
#size-cells = <2>;
ranges;

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

