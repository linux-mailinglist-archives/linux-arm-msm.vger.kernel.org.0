Return-Path: <linux-arm-msm+bounces-54216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3414A87D66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E1EE16D3CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36452676D1;
	Mon, 14 Apr 2025 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeUMbZlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE1C265CBF
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626002; cv=none; b=p65/nXpGiX9KfH389wySfDkYgZvZ9d6CmkWBxttTu4r4zGtk0zqf864Eb/KvE/5wbntvjH5wbiyByC9z3oqPao3Jv3zPBvpiCwVJvmUeLyw3YpRkqeqwKeq4XIenIm7eAEar3x1ouPbNMgMKpYwApOEec0rjwjQ0KkVf4uXRMpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626002; c=relaxed/simple;
	bh=6LdMwrsc0vig5nRzjKOOFed8q87TxEDlzdFs0pRtqVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eh7Bi+L40MJW/cbHUevdzfbVQOP3pXlrhjQ6GJ/cI92ZH2hEdZ75E7FUdeoJULEhIN/Y1LRjVax3TRxNDUsy0wV3SGRMexa+NGcjMxudeV9KadC6fruPVMP5TdlBnCrsmtjYWOASPUP0wLpKjp6TJbq3ESPKNDp2p76A+IIgwHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeUMbZlQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99roD016334
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DLAhpetcd11dpwWTT9KAow1P
	FzBjgslBEESFhVk8JwA=; b=aeUMbZlQouwDEG+T28DbeQ9Th4P97Djhacs9CMnX
	NnzlDGF6mEDd5sVPiOcQeMxtQnEe9bCLWfOh5YNzS4xZ8g9hlMtRWQWWyRqAoXmo
	rDNbZxFNTDfGpdFHG8zHWf+XrrAeMdSEgU77E3N7YG9P2PpREjcfLVw0RAW9kjhc
	NKJNIbgq9TZuikih9pfxyyh9yJVYnn8MIy8cen5uz/xR8zamwa1b2kYD/c9KapIl
	Ho8xHCimOBvX2igIl+vK+q3XGzpqAmSsstxOin34Wz5qXIcIT5sgiD4xoiJzfxf3
	9i8BfkscW8fOTj4u6Zo7D3vDcFEiqyUXu9Fe50+UKao4fg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjc6ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 10:19:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so678930085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 03:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625997; x=1745230797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLAhpetcd11dpwWTT9KAow1PFzBjgslBEESFhVk8JwA=;
        b=TmP2C9yaHaMzGoWyo5rXryE+awkrFvWyuoqv2OMh5uC84PUv1N01pZqWJIVEL/XVdr
         nTJ1TpzLBFwSkFSU7qqgWuDlvapQoYz/rxZZ6K2W4bnSOEI6vBxxWxRTBCh4a+LofDhZ
         XqTGLDLKasYxv0WBEVPgEHCEKZqgCDzvIiWtAW+e+eE4zNov61qHu4pSKSAIOqybQo9m
         Pn1dlPmBACnwMbZ07m954NElM7DeRimKHqGvVrX2phPoNhqBaSPXQyUjyZXeovGDXa8M
         8weUdjDEaeCtxEKWLD7CDi+9WL+gSG017NN3rc44y7slTTt6+cEBd+VcPiPy/MLSkCNq
         fXmA==
X-Forwarded-Encrypted: i=1; AJvYcCUrxZn8ZsbodE9gcRh7oSYKmKRDAZwuYv9/T4sNsIjMDfznervxeA//H2M1iDCHHh3CFjztZHJK2B1/cT0q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5ihNL3fWL8TdzGAK+YeUO8GgIWDG1izHE9GqJMUXe8E/t3WJu
	x7HNhr/+uY/x2h66sRiArSbNdSL0sgOuWD23rUOFCFJMxHS2fHP6AKchI29eWBIq0Y8i5ZZ2izH
	7+7p/JOT/3FKAiVXoM/bRLkbvVbww0fKu8N3wqbBGcQuplOGaajKrWBcpzxFskU9w
X-Gm-Gg: ASbGncuLzoReP5jvCO66RNY0FnHZ9lNZikMJg/BwB1wKn8xM8YaW3dUk+o+RCK94Sdp
	ZT7N1Rurn3LGCYVUHMSVa41nkmocPrWQVA2KKJMacinleaS7/nuiD9uTi5nd0A2tCfuc09oRkz3
	AYeJshkNfFHqKyeFyr/dpn0nL8fFLjb9T4R7JfvPYHxbpUg+zJYAtbCI7yq6pJu6OJHeAxxbynl
	i/cwqPFD5ew1eoldKMa9bxUfJnSga8dcZyE1lIHjRRo5K888fy1r7OpJTsS74EpFKI/YqGRptEO
	QMk55DVR3VLt5EWyBKBBsfeQ0ACw2iunSJQJrLyo7D4D3WESW3p4qpqonYVi5RVhthw5CVIGrsc
	=
X-Received: by 2002:a05:620a:248c:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7c7a76b97aamr2245096385a.21.1744625996844;
        Mon, 14 Apr 2025 03:19:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz2lvRi5xYBSv5aHzaBCPJf25Htmry2/RAX+OhA7qGrMdkO/NDzUDOvpcFZ+lr31+ZTFkX+g==
X-Received: by 2002:a05:620a:248c:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7c7a76b97aamr2245092985a.21.1744625996372;
        Mon, 14 Apr 2025 03:19:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238b1esm1064763e87.91.2025.04.14.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:19:54 -0700 (PDT)
Date: Mon, 14 Apr 2025 13:19:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, amitk@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Enable TSENS support for QCS615
 SoC
Message-ID: <wkvfxmwta6xvia2drxsit67w4fwihuds55i6lhqoa3wykdih6d@23us2i6olk3c>
References: <cover.1744292503.git.quic_gkohli@quicinc.com>
 <76e0ce0e312f691abae7ce0fd422f73306166926.1744292503.git.quic_gkohli@quicinc.com>
 <7f893243-572b-4e23-8f2b-ae364d154107@oss.qualcomm.com>
 <46cd600e-b388-4225-a839-a6af76524efe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46cd600e-b388-4225-a839-a6af76524efe@quicinc.com>
X-Proofpoint-GUID: v-BBCdaMxg5qZktL4xhm-yRW3USBnjmU
X-Proofpoint-ORIG-GUID: v-BBCdaMxg5qZktL4xhm-yRW3USBnjmU
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fce14e cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=5yKBnrlMSY8RUHeF2GIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=719 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140074

On Mon, Apr 14, 2025 at 01:58:12PM +0530, Gaurav Kohli wrote:
> thanks for review!
> 
> On 4/12/2025 5:13 AM, Konrad Dybcio wrote:
> > On 4/10/25 4:00 PM, Gaurav Kohli wrote:
> > > Add TSENS and thermal devicetree node for QCS615 SoC.
> > > 
> > > Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> > > ---
> > 
> > > +		cpuss-0-thermal {
> > > +			thermal-sensors = <&tsens0 1>;
> > > +
> > > +			trips {
> > > +
> > > +				trip-point0 {
> > > +					temperature = <115000>;
> > > +					hysteresis = <5000>;
> > > +					type = "passive";
> > > +				};
> > > +
> > > +				trip-point1 {
> > > +					temperature = <118000>;
> > > +					hysteresis = <5000>;
> > > +					type = "passive";
> > > +				};
> > 
> > Please drop the passive trip point for the *CPU* tzones, see
> > 
> 
> we are using trip-point 0 for cpu idle injection mitigation which i will add
> in subsequent patches, if you are fine i will add cpu idle injection cooling
> map in this series only ?

I'd second Konrad here. Please drop them now and add them in the patch
adding CPUidle injection cooling. Otherwise they are a perfect target
for anybody to clean them away.

> > commit 06eadce936971dd11279e53b6dfb151804137836
> > ("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU")
> > 
> > and add a single critical point instead, see
> > 
> As critical shutdown is already supported by hardware, so we are not
> defining here.

What about letting Linux to know about it and perform a slightly
graceful shutdown?

> > commit 03f2b8eed73418269a158ccebad5d8d8f2f6daa1
> > ("arm64: dts: qcom: x1e80100: Apply consistent critical thermal shutdown")
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry

