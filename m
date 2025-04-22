Return-Path: <linux-arm-msm+bounces-54993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A9A977AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 22:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CC7717824E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 20:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132012DA0F4;
	Tue, 22 Apr 2025 20:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qy8JDyu8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D372DA90B
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 20:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353942; cv=none; b=dVmTOml6QCeBxMBSwccNNhgDslI76Y27u4BDXBDlEYqOV6Zf57og5V9vgAMCBO8FUpNOMUAoPhyStZEmkTQT46Ul5ijsqE7reVE0D5hg3Qsiq6iTtKZ8LXF3nVi3Ji8acta0t3TD+MRv1IgkWYlYT8bIjpGtcdPFzQ9cyxGY7sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353942; c=relaxed/simple;
	bh=e947s7vj9DgAZEwGThYJOnOY/ENq4ZjIinQ423qwLiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YISZV48vpnzvMfjYgW6MfH/9Ih/QXRx5TX55JpF2MKmK9EId6llzbguVMVurt3GSatrCpILAdWOxZKnMXu1ABGxIIubtg0LcwOAlTIHBEs1ynit0evAUdRoLqvygLLAYyt9CPL80jExsYlF5kHtR7Dld7PPficu7G/UR12nqUY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qy8JDyu8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MI6nRI024924
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 20:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p7fC+usINhtdyGIUDTo2++4styKlE/llRnmMJX05WkI=; b=Qy8JDyu80CYbPvtw
	GTGMzbXhTYQ+iSI4pRiVEcKB5djT6MIQWevPIX3khy68lBuQdpkq20po16TYgh8g
	wt/8+kR/B42urhicgpy9Ae9GTIcQjYZAHp0YitZLbdurIYslgpky++CRAVLjoGDF
	3Rb4fJrQ0DhzPHB+EBUKHpuIsVqp5kvm8HpSiUeof0De4KF3mxTg28WhfHvja7PR
	1TchLNtVxskBaQXCbwcrSuFBheeOtTvwNlKfeBZXDnOcyV32nuebMQwnkvCsuGbs
	apgyMQ/YVoeoq3komUzxBik2karBl6D30K+jwxPAilXHCD/CP/6U8ccryr0ru8u1
	v5cqPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426rukr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 20:32:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5530c2e01so44651885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 13:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745353932; x=1745958732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p7fC+usINhtdyGIUDTo2++4styKlE/llRnmMJX05WkI=;
        b=UoUeSpxTkz4HEgw0zJLYq3WSeumwg/7/9fqIB0FbLVKYoQXMhnrNIsN/kDS4zP8azH
         UhKQ229DcxuWlD71mfAu5GC2hRjeW5ey/LgA6vOqHCNFPLbLipamogIS36Rc5UxVjjeg
         YZ+jrzHeGF88Sv2AvWFq4ha86/U2ALl7HvNH6UqIK+h2JTLYlRA6pkneTWD++ocWwXFM
         vF42RgrTJ5KhMWkE3wvl8S8uKK1nWZgxy8mWLpMoQ1EtewswTifZIiwoYaBEfU22LL2w
         +N5eSU/AdqR7S1gZKj4dD/YH919QqR7548IpMrb6LjMJ9IHL5AIrAlrVO9U6v6rn+Aew
         VJDQ==
X-Gm-Message-State: AOJu0YxHx0T9RybyZc2GtI+Nk2KuJ0Yq3ZqCmdEhHu0Rnib9lAnAl+Fb
	+sOZjt1LMFXRtHuRAPbzbWiQfijdzO46Glf3sU6Jd3nyuwI0DrdZUVTdyn0SKAyxvfLVvgf30kl
	9E4lXINusQsOWCXoXDhGxcxJxgWCzWYMHATlEHMlvXU4rcM4WovLvbAXv+mz2b5cB
X-Gm-Gg: ASbGnctYWWP1yIQy7uE72rYCt2JSzoRXzBIDaI/am0bJzpHIQ61M2xvoCMDuDLvJiqY
	qdh7VcY61EO1Ux8hk/Nudh/Mq5NX1QlfsMJYmfAikliuXLD+8IP0Wplf7uKJ2oZSIJPfVPgiypc
	g+NQm2XQ4xAnB2t1vfMmVJjM9Z+dE6MtPeOMp9w0m9Zw4ZpZw4PrptI7Xc0IPuegDLaO/P5Wdqu
	d1ppy12stOHaigbOVlq10HZU8wR1pCdiZr//KBejDnlQxoSf6agheM7DTrEtd0s4o3KHONoVqTG
	Fyk1HOIPZnnPQ4KSAn+0l0NOOLxWoi3yYhVaJF1KNWG9NhA5UtwQoX/JtVSIPNm4iAY=
X-Received: by 2002:a05:620a:19a0:b0:7c0:add8:1736 with SMTP id af79cd13be357-7c94d33c7d9mr38790385a.13.1745353932583;
        Tue, 22 Apr 2025 13:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECPN+gnhFLHpQ4DwkU2Hs6fRx+RAoCulz+9BV0umNnTLhXBZYmVSHmE2UV/CVMqwsUJthtKw==
X-Received: by 2002:a05:620a:19a0:b0:7c0:add8:1736 with SMTP id af79cd13be357-7c94d33c7d9mr38788685a.13.1745353932207;
        Tue, 22 Apr 2025 13:32:12 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625834185sm6311589a12.61.2025.04.22.13.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 13:32:11 -0700 (PDT)
Message-ID: <e9f3ebdc-78e1-4e95-92a8-5ab97d6ede0c@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 22:32:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix PCIe 3rd controller DBI
 size
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250422-x1e80100-dts-fix-pcie3-dbi-size-v1-1-c197701fd7e4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250422-x1e80100-dts-fix-pcie3-dbi-size-v1-1-c197701fd7e4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y1tyrrs39cpTNoif1EcJdEneE7hyxFnI
X-Proofpoint-GUID: y1tyrrs39cpTNoif1EcJdEneE7hyxFnI
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6807fccd cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=63VBIPp7KmuLgbtEyNwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_10,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=747 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220154

On 4/22/25 1:03 PM, Abel Vesa wrote:
> According to documentation, the DBI range size is 0xf20. So fix it.
> 
> Cc: stable@vger.kernel.org # 6.14
> Fixes: f8af195beeb0 ("arm64: dts: qcom: x1e80100: Add support for PCIe3 on x1e80100")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

