Return-Path: <linux-arm-msm+bounces-63523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E92FEAF7390
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFCE01C48906
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE7721D3F8;
	Thu,  3 Jul 2025 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICjvnVjY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B0E2E4242
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544980; cv=none; b=HWPahSHo53aCYhraFqDHiz60bZPaLO03fDsAZFGHR4TV4X9UD3ibjXaL+JS+JuKLI3YZnRrcZeDl/CJvgBJys3q0Zz+AJ5wYt1wk0Xl1YQroFv84RhU72NSridIdh1OVF9jfDw/KUV2Gk4oShxNTrUr9FszrK42H7azWMYPdB5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544980; c=relaxed/simple;
	bh=wqz04Db6LoZ9YrCmc82vhkASDZs0DPlOdRoUbKw44cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTH7xQaX+IhThiLJBgT+1FWhSrlR+ShhNeJqg9rJYnPOUgcKlbLE3z7Hg4EyAzaXLxPfM/ZKxRq+gRRLTX7uot0ndkgP/I2Z7VAu3kylFNxk6B4+LhCrxAoQeL9ds4CSNNUgLf6BuvZaCT3KnGLExtklGW0qBx5IqvqovXJE0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICjvnVjY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563B481C024889
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 12:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkKzD5qOAqZJdTLWvOv7/OBA1XDD5p0ax7HN7SWd3zA=; b=ICjvnVjY3rSvxC8H
	Rs3oOg97hLP4jbDcnW3srMrXJhYLCnNFqdph63UBFw9+gHvVoKmQGbaGNlFTluMg
	CGr03xkjJ5VMFrzoeAT6k7P8OAQSV+I7YFvJq2jJERMCpGrbC6g7DM+WRvfEa9FA
	Sr/cE8OdD/9H5q3awv2RBv0HyWaVdbG/lxKRkyjkzKHwu9GQUqIa5rjBt954qZ2C
	PBsq9xKgJYmga65O1ouiAZPrCX8unTLBILn7J+soMoyQgNSxa4OviYq/ehZZelWJ
	ZZpBI/mYiJGOGTPGSySVdr+OKG22UY6xyS1RQKT7PlQdAvR1zUbVpYm3/C/dZ66R
	Aqfmpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802866t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 12:16:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097083cc3so202933285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 05:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544977; x=1752149777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkKzD5qOAqZJdTLWvOv7/OBA1XDD5p0ax7HN7SWd3zA=;
        b=SpLGagL2o6EMam7Tr/boo2vFmDbrbRJHO6FPI/1GrdDBCmF2ILDJ7FIsim26phTON5
         VNA9y5ep7XS3ZqUKgmnaSOcuHaSPgIQziF3D2sb2x66OhEGRXGnbuX3dzEdmmX2oNzHU
         eAdGmN4dtok50MMXDD5sqlCbmIfosTrbF2dleMAPF/mVwacYDmGmaYE1QnDcdMWGqS8e
         zfnPbX4fE/PfsQb3e6aFdlR9xrk/pNwWWZ+wCUHZNlEGR3IQulRBJrJbWYJLOM0+83o8
         vIXJsFKYg85+1fALkSdEFhQeLJEZPQjBWxuBDjiwiNy2abiQbOFkhEa+8hkRZI7Sj4Gn
         1Zbw==
X-Forwarded-Encrypted: i=1; AJvYcCXI2lx+s8TNKrnQkp3insazWRDab5G9R7sDYdZrmNibImuHTG+mLWMAfSeYqp91DI0U/w/5A5eM6t8BmSDq@vger.kernel.org
X-Gm-Message-State: AOJu0YzliX0wSh1ACBdBCwFRGB9vGG9dOcTABpEmAS1Q/owdMDL1nYNN
	4Cq2FK2gm4NyQrekMaIs+zK1wrHx29GFg9g3KB/wMACQux68PR0o568RxMjCzvmeDB/0Y1IlsIW
	rCBq31oE6iTQY0T2Jilni2ZSWhiT2OcechvlmrcNa+BYzfMSIE6awVKYCW9SFTl3H9vfY
X-Gm-Gg: ASbGncsEBZ9OachXyvPVtnG6OXvjd1/L65NMf4uQ0pOEeDcIWQT5lzh3NhTvgTxdY+0
	2tUhqiXeEfjW32noYUMpks4yHTbXWhy1H3IMXK1rmGFdLzEiwOQXZRqeJ76jtGEdE3OmQUqNjr/
	+q3IeBBFVVMKtycF4KfD0xA0OkUvPCBfOO391KB4DmJ1QJ6ECKWkBiX4JvtXTK4ws/5rr43XkTn
	rgHf0Elk44o/eaawmOSNZ9/qPLAXVVTElHfYLC7phXL32lDx/Z9sRtYIDnfH3xuHNt+cCl9zq2U
	BhzWakGRJh9l6FCU4be86LpVZTElkfnrXyVnqwkJeCWO1lhWGoAPdLZIq/PbsgnML1bIttaG7tn
	U3keH9ixI
X-Received: by 2002:a05:620a:4553:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d5d3edaafemr103808985a.2.1751544976970;
        Thu, 03 Jul 2025 05:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUrtibPHvr8N2yWud8azUvDMAXwVyMTTd9CkJd3HPkF5mfJT5kEni5VZ3YyZtkHv1BLI2AFQ==
X-Received: by 2002:a05:620a:4553:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d5d3edaafemr103806385a.2.1751544976513;
        Thu, 03 Jul 2025 05:16:16 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3d0351285sm179677866b.23.2025.07.03.05.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:16:11 -0700 (PDT)
Message-ID: <185e2398-e804-46c6-ba94-44c42cce684c@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] arm64: dts: qcom: qcm6490-idp: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
 <20250625082927.31038-10-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625082927.31038-10-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PrXZEOEUx_hgxEM0A-bEvZAuChlHAI0t
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68667491 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=m2XL-mgSGVCMsbPKemYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PrXZEOEUx_hgxEM0A-bEvZAuChlHAI0t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMiBTYWx0ZWRfX/Nns9DAiaiwv
 kg0EZZ0dlMDqy0cBSy36bTLiVa6nhk4xmgVqOf6x6IkXwcNNK8KPBQELOqweY3g3/AJJMq50ijg
 C26U8l9S72jaTAYE9zfnpmyjcXoV1Fb2rOXff6tF899Xh5ryVf88IRuDA6OryCL/WqciB7kIRQt
 R77cDBAs79Ys5pxAgE/1sEE+HtkVyCkCUZvJ3gVgImM2AA04GEFNnJ6PqGWOMTo+6Qewp9h+RyW
 4wHffxWOhhcjiDdoXXujKQEzmAhRb92Y7jeEpoab29fKAxh3IVa2n7dUpVuMf5gDex1qYzZJct3
 ALM68IiBOvIt/KZODyTtd+FwHMMldhLtgNEJYi9PiD1jYUK+Bi5ktLvyIoTncOc4tlSGwGCSeWl
 Hst6dta3eXZhGifAZWPh6fN1HojGY9fqjCaDAyuIW+F/kkOd5Rdz0C18p518uVwCurSSXDfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=834 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030102



On 25-Jun-25 10:29, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers,
> digital on-board mics along with wcd9370 headset playabck and record.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

