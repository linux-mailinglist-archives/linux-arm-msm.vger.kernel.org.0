Return-Path: <linux-arm-msm+bounces-78295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA141BFAFA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E725407524
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DF627E1D7;
	Wed, 22 Oct 2025 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRRREcwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E691607A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123024; cv=none; b=PD4D5HF4upFcNes+4B5+Pzd4nQXeIFBulPi8kyLk9LiINnGWIzgSTn5j7jSrP28AZTn4SEC7/XD9U3dO8JX9lACJGKKuYXDddE8Vziu0cOJqShcEeNibLyBectUX75tiFTY4+7uELJfQSyMmcBLnLCu1xO/ShJykhRp58pYLpb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123024; c=relaxed/simple;
	bh=JDm9N+ZZYfrAMtYqK4bg2YFnElswdFezxf3RSSNeCGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPxsbtxSL7q1J3DFj7Nha0vxL2A4es/ybfIWy68kI+zW0kVh2XqqM6WYcOXG08ebNNQaWzBIQjK8rRuYvw0BMxK/Mi9Fh1cPP6G03MF0a3BpXQOSYVg0w9MDukHMAop677Ysc6f/QnWfxU0CjlCTXz8WOGhGP+GexXozlaXj2Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRRREcwC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2X0vw025019
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TbaujdcrH9oIG7aCXpiE2nPE
	Oe67QDofbGAPoiaMp6w=; b=dRRREcwCY+vhWsr3Zsnn8PNPiod3OhjZVNNcJUiU
	ABEL/kVxcGm4CVbcthK9YQax3K4DBGA753brgCtgx2JPA+X7BS2J+zbJikeL/rWM
	RJgK6/4Rgo+YC3mw6grYmYzN5+mIqJNAiH1rhIHpNlTRLjw+aoIcNixsLz35kYaA
	+f9FKV+ANZN8y2Ti4S+n7ttsC/oy/xa7r/jHo5AoT9aA9td2votv89qqDc2AVbPL
	e7ACKmVzHCCEyInrH5McD5WemCjQgeFpfa26RQagy67pi2+DSi5G8Atu7SpVJmTo
	YtXADFp9QvyRGisTIMilRTyS1YdadzDIi7tX7a8oByBywA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws6bx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:50:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso22548241cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 01:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761123021; x=1761727821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbaujdcrH9oIG7aCXpiE2nPEOe67QDofbGAPoiaMp6w=;
        b=XFJIwT6NiGa+uwIqik5E3YaUFvYBj7fhXMxt+TeLRwb+2cgrVier/skqTq2LEBU/qi
         vsS0/rZrvmDdjwdNSucb4U/FMkGczJye9W+Hk3xcFa1Ty5Lw7fXJ4jEQxn1VnZBE4JRI
         Yh1guUt0GFy7DpY9Pdv/a1Mud6Mu5cj92EdNxmaQLKxXcay7kOzkmtAnDj70CDdQXHLs
         CwAamYoDbvXQZvA/JAJ1Jy/PLJiTi8+OTMlcgT9nrYlKUD7wpeIi9wgUWYqV1hNH2xLW
         EGhbLbeIa48ZlkWDOxMAQC9xV7290w7Eigt9mNMQe4I0ZVkwDr8hDv06+seYqKWjUbK1
         pW7w==
X-Forwarded-Encrypted: i=1; AJvYcCVAFv31fA+Cd+ZbhRJ79RufYYVMA6Asz5njnwXb/WVro7v+oVbgsvWcRAaf5JLSlbdgNFKmAnorFjUf/12P@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi1XaASMHDEveD97drd3kU2f7YbJASr71YQoKM0WdjdIPeQ9Bf
	bqlRZaHVK9Bb6uKVUT9/cgUAReAUtkxX0JMnH2O1SV9cnxpuUfEdiuMv77HYJuhOHKfiMR+BxbA
	9gbIvEIdrvFvV1rWIbJSYD2a5KiDZ9Hs0LZwPzSW9zs/j1/DZGIvObmgGrSQ5yj4KyEPq
X-Gm-Gg: ASbGncvCVtG7lyRl09xfRfu66FIhYBYww/RtcjmjkrhK2T2L1GtIrLoo/UFUjhFK3ru
	C3jjWI2YDcWuNXXF+Wfp9Ngv/ezmmCz2U0PpzJzTgWbqA8iIfAmPUvVlq+LjyScO4l0gzto78nz
	baK38sMUxpoHCO8dPEMEuv028x2hCwsGeZappjzJGliZxpp9fHpkiiVA5h74N0hjmfvJXcDZjgS
	OFPIYaflGr/UlQ64owlpsuCidsdj8hQeCoJklnmqoPr/Yz+Jd9tLwg7HOq1mETt0QPPdcQedOF5
	/bVEnAhhzMKLZe99pp1Nz+wT9KCZqKu128Dx1rJ0FvUpJglZF8djKIZBH0vMn23bhPSRsdLB2j3
	JHrR8M0hccavpExQQhTfpsGmSPSmxbhRzSQI4Fbku4pCh1bIT4CfzbepBw91OLixPq3Bx8XzAYi
	HAE+7wlW8W5lk=
X-Received: by 2002:a05:622a:310:b0:4d9:dea6:4ff0 with SMTP id d75a77b69052e-4e89d3d5924mr282823621cf.56.1761123021176;
        Wed, 22 Oct 2025 01:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTgZJr+cT8SYLBmVZl/Y7kdrpKwF6g2UFgH1obyMySI0IqzuVaSJtc+hYHspSX6Jc8FSJs+Q==
X-Received: by 2002:a05:622a:310:b0:4d9:dea6:4ff0 with SMTP id d75a77b69052e-4e89d3d5924mr282823311cf.56.1761123020589;
        Wed, 22 Oct 2025 01:50:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a950cb2bsm35458961fa.27.2025.10.22.01.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 01:50:19 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:50:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: firmware: qcom,scm: Document SCM on
 Kaanapali SOC
Message-ID: <jqunb52dy2kyygpolf5ct72j3uktln47qppuhfczazowykatt5@3bg2c6umqw52>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-3-3cd3f390f3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-knp-soc-binding-v2-3-3cd3f390f3e2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfXyMr7z5EX5FcK
 nK2SMYj5eejey3lgDoO3kkDaLm29CiJjZIgMp/7O5+FXR75uFgtb5WZdHyJD8qIU3k7d2TpYZ9D
 BcbBTlwq4dV0Oj0wr3VHIuMCo7w+G3tdPLvz02ZKsc2X4FmWbdaZF7aRDGAqOyg9bFIXSvQ0svP
 lQWLHs66L3KcYuPdy78qlQ9Oo/tV5uegc6uM73G0ZPSZ/Q787czT9Okgwt99D0lL74cX9c3uoc3
 G78YexuY9lL7cdASEFzIv+0+CwAf4zq7cXSd0rnM76oM2njy1fF09cVYEcAQYI/PYaI7JEagMmx
 aToMHs8DEAY+cVZ3Kj8r7nNozUcM2nbmjUG3fMB4KysTSs6ubX8ngQZGynYiRLpgw+3wwGFygYS
 QYvhIjMUFebBTA7HaNd43YtpBju3ng==
X-Proofpoint-GUID: W2gfOtox0zQFC0ZRtzFE4jlLsdSpHpBE
X-Proofpoint-ORIG-GUID: W2gfOtox0zQFC0ZRtzFE4jlLsdSpHpBE
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f89ace cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BJkMSRMYZAcFcGSszd4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

On Wed, Oct 22, 2025 at 12:28:43AM -0700, Jingyi Wang wrote:
> Document scm compatible for the Qualcomm Kaanapali SoC.

SCM, not scm

> 
> Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

-- 
With best wishes
Dmitry

