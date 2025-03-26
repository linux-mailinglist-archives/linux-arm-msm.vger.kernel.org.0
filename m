Return-Path: <linux-arm-msm+bounces-52552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F95A71D93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 795BB18949C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 17:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700FA23E331;
	Wed, 26 Mar 2025 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="grGTLyC0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAA723DE85
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010953; cv=none; b=EySPNz8ShOybepk2+hmEafo0IR0/Z2eXpw/2Jz96ZWbTdRpO/z3O13NP0RTBP7JDOHTuS6n47aFnBr5RPTr+FEXQR9zjg0/uwbSGFodcneDS4Rs/y9P0fg7xdjW5zwswNVgKh1aiOKoXNi3a6e4z1f2UYZLpY/Bk8xA9rgf2Row=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010953; c=relaxed/simple;
	bh=aFjsTMfca5IU3YP6U2fVRo6AndB/ugWP204WHOqB9M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTUdSOhXRFvBQQfT301Z2BkhDM2SV08qkQXiyJdCdHIS+9H1dVr03nFGpEJGUG3mcnWw4x3XdfYRx8A4gGMcXyDsmq6SO5/3KLQquGfYtM5Wjj9ENtxHFmf1zLSwvSEPmIdI6AxIzkD4Icp8cplCtvCxtcWLMqH6H2y8zjGjcpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=grGTLyC0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFIqXf024593
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=myZwmvZPrAeG+l7acbCfyap8
	0nQy1q8mZtpuFo8Rdks=; b=grGTLyC0AANgKhPacqGib/tSQM652j07bcRqHfTP
	20BjqZoUyiXIXjzbq+HmfN0KunrQP+e3Kj6qasRZPNxnYGuqm3bZ7N0yr0xaQ40K
	5+DXahuU9x6bKXwq0e+vsQIq8nM/50Q070O1itkZ62rHX+4/TMdrArei3vV1QP3t
	hE5dfOtiFt6zlZBwz120IgsRwB5yz4B9lZz/LkZ1OrAzVLmN7JkSU6QQRoLzpFCV
	Rzzwo/TiAG2JqSX30kMdehkxpQ6NVXgJLnL93Co0WPnfzgRE2AC99iWhg8AXuCn1
	Znbl+pW0D8JxpxNWmCt+SXnXKEH6fq/r7plP4zm7Idgxfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd35t9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:42:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7bb849aa5fbso26388285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 10:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743010950; x=1743615750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myZwmvZPrAeG+l7acbCfyap80nQy1q8mZtpuFo8Rdks=;
        b=OieDruWJuXCkcisbL2Eyajp8A+DsogYgWdsv5u2qhfZmOAZSdrf5JUfmYTX+UK68GW
         feu6TVuxm4Y+iBy0hXAQKgYv+TkqjVVPmty1BXB5gLt1YVNDS80mkYf95YZaUpQunwcL
         aflMOXLEntdctQL006u0qAqINKp0w9ZsNcFwYz3n0tl+WfZGHVKuI5G/4ZUQCGZ+x/pC
         ce1XOhE8jS7Gbn6MYJxwUK5pGiga3Rzv1GCam2UZlAVierSKPzsAtd3k+d/7lQbevl0H
         6AlCF2b+/qmjkrGzMEvQzjZIxN5FgVaZQuaUTSfwlYM32H5AOjExGeM8c5z1BVENZ56y
         upsg==
X-Forwarded-Encrypted: i=1; AJvYcCVJyC0De98I0UeRtBmK42T31fLugAzobWkoFlsL3487iljuaHzm49GCE1hJ5WDBH9JCrW3ZAlWtNonR1eGg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3LdpE2ZLDPEObZ9NH8n26M6dvh3TGEKMdYiDlprFzVs2Actfz
	xDAzDo6YPQqUUoSHSUEwMoFpC+zxgDdaT6BnGAQPpmP+coDbOsQw8Tz2szoLw870dONwcBY2kik
	LkZ6DhK9Idro30FxBO4JkcTW6pVGpQHF24xLuKbOki85I0IUlxjDuFFU46YPUWYmk
X-Gm-Gg: ASbGncv0hCJ2j3zohF0Styu5vqHIYnaoM4gwmFKyfi2sLvSXYaVqLZ/h9OwHAjcs0Xe
	8UcsGB1fFZCyrw67+2qQhF+8jm6jeQI2lQOZfkjmqkMwlBfqGHHOaDHPC6lE3LYCVVvIum2XhA4
	ccEE5SE8O4KDlzSebh9JGGisvbmqS3eSqXH4x7XOluaO3NHURA0UjZd56lIRgEc+BOiY1b1Za5Z
	pGCGVGlvMNVCvpNPm+2xnjA7J4IBX0ZomfMk2iHCXl4PkTX7hB1mxoP+rSt5sfcsJWUFMAkzGpT
	c6pP9E3Ayhw0utd/qchbM6ZmGmLSDYqDaLl6v4/rIZcvfsrzei56Ka7J8cG5xmqataqI2TFXaYx
	YbEM=
X-Received: by 2002:a05:620a:c41:b0:7c3:d2e9:b6cd with SMTP id af79cd13be357-7c5ed9f8dc5mr79793385a.17.1743010949660;
        Wed, 26 Mar 2025 10:42:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvii7HWXKe1P+y9LGHMhEiVCa6FiUA/xJWI8tk3P1ye9ifZ11F0d7MLCzDK91pvv19DJfuxw==
X-Received: by 2002:a05:620a:c41:b0:7c3:d2e9:b6cd with SMTP id af79cd13be357-7c5ed9f8dc5mr79788685a.17.1743010949160;
        Wed, 26 Mar 2025 10:42:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c52bsm1909937e87.74.2025.03.26.10.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:42:27 -0700 (PDT)
Date: Wed, 26 Mar 2025 19:42:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: Re: [PATCH V10 7/7] arm64: dts: qcom: sa8775p: Add CPU OPP tables to
 scale DDR/L3
Message-ID: <xyqax25jrm3hsairpv7ovqe6zkzaab757zq44o4dgcnsdco3go@ktsgnry6h6za>
References: <20250324183203.30127-1-quic_rlaggysh@quicinc.com>
 <20250324183203.30127-8-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324183203.30127-8-quic_rlaggysh@quicinc.com>
X-Proofpoint-GUID: ce9WJOgt7acly_v8R8AVIMJ8NGtkKGXF
X-Proofpoint-ORIG-GUID: ce9WJOgt7acly_v8R8AVIMJ8NGtkKGXF
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e43c87 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EoR1dSiHd60cPyH60U0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=909 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260109

On Mon, Mar 24, 2025 at 06:32:03PM +0000, Raviteja Laggyshetty wrote:
> From: Jagadeesh Kona <quic_jkona@quicinc.com>
> 
> Add OPP tables required to scale DDR and L3 per freq-domain
> on SA8775P platform.
> 
> If a single OPP table is used for both CPU domains, then
> _allocate_opp_table() won't be invoked for CPU4 but instead
> CPU4 will be added as device under the CPU0 OPP table. Due
> to this, dev_pm_opp_of_find_icc_paths() won't be invoked for
> CPU4 device and hence CPU4 won't be able to independently scale
> it's interconnects. Both CPU0 and CPU4 devices will scale the
> same ICC path which can lead to one device overwriting the BW
> vote placed by other device. Hence CPU0 and CPU4 require separate
> OPP tables to allow independent scaling of DDR and L3 frequencies
> for each CPU domain, with the final DDR and L3 frequencies being
> an aggregate of both.
> 
> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 210 ++++++++++++++++++++++++++
>  1 file changed, 210 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

