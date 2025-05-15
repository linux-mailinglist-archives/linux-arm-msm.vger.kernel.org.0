Return-Path: <linux-arm-msm+bounces-58038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96338AB800A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 10:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48477189AC0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 08:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE922A1C9;
	Thu, 15 May 2025 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuWRxLW2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77F22EAE5
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296953; cv=none; b=EGvrTYFzDCPbAZsF5pTFx8LVTf4Leg6AiybxdR7GnJIPyrmJEP5UCml+/TZJpMfg30Y6Fm0+/Cw8/2s7KHYoqke530OSDjiSu4ecAmdmWuvO6Dr5llkHRUsjAB22TWpz+1lfkKBb4+KTbU4z4MhQw7e0Io/jSxOCELFO6UWvs6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296953; c=relaxed/simple;
	bh=YguwcBlMb/cTSmCCq/EoI5Id+MZ8xvwtVXilmmMs0bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3RfoWMiIOBjJAUTzCUoRZJC4M7iX0PaRnuVquNK0bkieAAMiFuTiY5dNXHUzFadzXJ9jB4MhfIse57GzUWAi5GdTuHM2m/B/Rwa2SrIg+pt4FGrulo3re+MZqVlF3YIliR3na0/Qnvu2HCdjAztFscJUj/cH9wmcQkd1JhTvtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuWRxLW2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKnNwi030324
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tl/mMjkoUz1Nl6G9vAUnnEVh
	02OPHA5TxAyZYAgrbto=; b=IuWRxLW2nefh+E1zUKc6+FBDAdTcBwuH96SJOK1k
	qSlycviI6EuaG6SzMWDy1daxq8kKhiXBcwxKWK2NR4FpIEPYGZLOtx0V/z5yDGqV
	rj8NI0X38uAu25AAKTnnIKoLfqoa//sNbG+0/S5w2o9FB09YR0Drmp+xr3PJOBfx
	owwOW88lVDP8l/mJQrhQmGUpkz5PgCgf5lCrFO8tGVcCRnldVUXGEJ+AV05rcxpr
	LFRmKSOe3mYpJeSTMkxZskMLtIMRB1NL+Ahw2DdVsGgo3PVG2QDIPBpDAxJqMqqj
	YSYNme50D0BJvWQDDV94hbpvWdFlmAtzaB9TGyNlfIb0dQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnwf51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:15:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so106276885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 01:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296950; x=1747901750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tl/mMjkoUz1Nl6G9vAUnnEVh02OPHA5TxAyZYAgrbto=;
        b=PGaeKdry/mxTFg+GyGdSmuaLJjry3b2JWwIQgmb+45SxSCW7Ujxg92AsrLUSu1z+Uf
         mFpMHH6yzXDQKQ6HrUDWecwN0jqVuMp+Yn9EHyvjDNzGOrLeStoWm1Mrz2k+6F9JjX27
         kqCf1Ur9vr7fYlJ5oIg/3mbH/kaqbtdPjlYmXHIEOF7yR5ZE7wP9//ETBffybWQ/62PI
         PoFXwyH2baDBL9x9VjQQnErKPOCGWfh7wN13e5v0fBNFMEjsxvv0tG/K3sYTiLALewNG
         P9DM4jP0Q+F+C8LcVIiIXuxizcWmc9AICBKCHEj482ya2DYp5MlRccO3A6ttJ5n9v3kZ
         20ng==
X-Forwarded-Encrypted: i=1; AJvYcCUqtvbs/AQOYZ8ND+uOJ2S5iaLvmca+NiT1YibPRtI+SjCM4OLjJpul4mSxEuPXaP3j7zEPUE3L97dbsFap@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/aogHLWQjK/fhOQz9AN3WtzyqjLFEWaFOUVWG5V313TosbW5d
	GmMVNLwFSXcrrBIBBGeHJfHKEpFsR8dnFcrx1UviNeebRwsLR2zRUkK/t595akyqDPUpA2WBlti
	4zULfmbg2PsMPIGBHXXf3tlpeUsts2ZrC5XY5JwlnPFzndoyNSds+eWClL5GZDP+l
X-Gm-Gg: ASbGncsqPa4/vsPzfVBAhEQjlOc+z6gEUzCjKGt5X/EultzmoTvUvq6FQb03GeWCBS6
	rjim1jCF3OzM2VYdae57J9sF5aZOnZy8G5NsTtYym7HwdWYhM9FJ61i2gCtddYjLhm2nKZIxkIP
	B2TlatQZ3GPD35Mbkt+XqbUTsZy2Jegjyk+Bbe78sVTGQ9DQm5Q/ekOp8EK763m7lTApoPaXOpL
	tDnxDPYTfwLfYfQagOSV9jlkjm85V+IDfUKfs1KpxxUQQT58XErhKGe0V/Yr+yb9B+Kueotycin
	w5ogXUVhPVtqlVNBg+xpVd4m29oJWFDpCvaG135Vzf8QZpEgFyNtCU42AAY78l0DN0UclMX36+g
	=
X-Received: by 2002:a05:620a:3915:b0:7c5:49d6:733a with SMTP id af79cd13be357-7cd287eb63fmr1027725785a.21.1747296949566;
        Thu, 15 May 2025 01:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK1kllNTjDC9K4sQ/7b/5JoLiAF4ZMkxAje2l2fuWXy42reJEZ5kgLog1bNJBJTjhzAlXyrw==
X-Received: by 2002:a05:620a:3915:b0:7c5:49d6:733a with SMTP id af79cd13be357-7cd287eb63fmr1027719585a.21.1747296949004;
        Thu, 15 May 2025 01:15:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64ccb9csm2551299e87.234.2025.05.15.01.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:15:48 -0700 (PDT)
Date: Thu, 15 May 2025 11:15:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, quic_srichara@quicinc.com,
        vignesh.viswanathan@oss.qualcomm.com
Subject: Re: [PATCH V5 4/6] arm64: dts: qcom: ipq5332: add nodes to bringup q6
Message-ID: <wzij5uhbc6yqxnqhgfrni64gds33chsuiac3no73otdkihft4c@wgvrfio26sze>
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-5-gokul.sriram.p@oss.qualcomm.com>
 <242f6059-a32f-4ee2-a794-8a29b6449e96@oss.qualcomm.com>
 <7d4f174f-18e6-402f-9a29-c4c461d0db0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d4f174f-18e6-402f-9a29-c4c461d0db0b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: m6AP3Gh9Y7eJeHVED2mJF9Bsh-NG5DPu
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6825a2b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Rh4vyNp77t38Oup4XtEA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA3OSBTYWx0ZWRfX2vq4r3icDTmh
 30HIKTD49XZNLNCS9EyJzXwls1Y1cZGi2vAqbJbggtJbe5TlkRmNkQQsLvNUh5TiVqC1iBnIRvP
 ibLqIuTC/dPOsgg5vAng6ZehkLDx3NMfmDa1IaOJSN0TmJiOrHHQfpgasm7HU7Jo1/A/XPu3r2A
 iWRskK2N2C4/YcFdhPEl3eaeWhhzD8q38ncBu809jtvYFtd7acR9m7tWg5cYm8Df2nUmTGxceiz
 br4cZep+HL/wJtgbkjdy9j4b8xrk39u+xibi3kG3JrsBDXsfxalJfCrwHR93diPs/U3Cg+AILvX
 b4eRPyVXH3Gz5XbNF3e2UWHMoD+zmKjsJG8di1zKynE3pcKmc1ewdSnf0fSjPz6bcEAoUlt9s7T
 ZCcTszh/KUySrL4G8RgpTpMO0ZCwSsf5gbqNal0LTVM6++c5M+3mcI/ZVEVqYWNTuLB6KiWo
X-Proofpoint-GUID: m6AP3Gh9Y7eJeHVED2mJF9Bsh-NG5DPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_03,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=941 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150079

On Thu, May 15, 2025 at 09:46:50AM +0530, Gokul Sriram P wrote:
> 
> On 4/26/2025 1:53 AM, Konrad Dybcio wrote:
> > On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> >> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> >>
> >> Enable nodes required for q6 remoteproc bring up.
> >>
> >> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> >> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> >> ---
> >> changes since v3:
> >>         - added necessary padding for 8digt hex address in dts 
> >>         - fixed firmware-name to use .mbn format
> >>
> >>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
> >>  1 file changed, 63 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> >> index 69dda757925d..fc120fd8b274 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> >> @@ -2,7 +2,7 @@
> >>  /*
> >>   * IPQ5332 device tree source
> >>   *
> >> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> >>   */
> >>  
> >>  #include <dt-bindings/clock/qcom,apss-ipq.h>
> >> @@ -146,6 +146,11 @@ smem@4a800000 {
> >>  
> >>  			hwlocks = <&tcsr_mutex 3>;
> >>  		};
> >> +
> >> +		q6_region: wcss@4a900000 {
> >> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
> >> +			no-map;
> >> +		};
> >>  	};
> >>  
> >>  	soc@0 {
> >> @@ -545,6 +550,39 @@ frame@b128000 {
> >>  				status = "disabled";
> >>  			};
> >>  		};
> >> +
> >> +		q6v5_wcss: remoteproc@d100000 {
> >> +			compatible = "qcom,ipq5332-wcss-sec-pil";
> >> +			reg = <0x0d100000 0x4040>;
> > This is 0x10_000-long
> >
> >> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
> > Is the firmware OEM signed?
> >
> No. This isn't OEM signed. userPD firmwares will only be OEM signed.

Indeed, it contains only Qualcomm / QTI signature, OEM signature is not
present.

-- 
With best wishes
Dmitry

