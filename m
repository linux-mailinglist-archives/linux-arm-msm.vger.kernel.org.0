Return-Path: <linux-arm-msm+bounces-52637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23FA73214
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A920188A1EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 12:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093392135BC;
	Thu, 27 Mar 2025 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6YSwswC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5DB1B960
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077440; cv=none; b=mZX2SKajTvNRzwuzaeKSGvotnW83hl42dRXpnxnouLqcDNl1xCDTHEy5XnFKnbxDsm6PIfUAOBJ1xgA37VS3e0ldTrpnCL4itCpEu4CAIjeByARM4PVGT3dK9ECKDTDhDfj1UuUD4IL9vlsVaBYhp4N5RcneZK5XwdXOX7naGxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077440; c=relaxed/simple;
	bh=QzAPxhXt0HlkANWcKnu4lkLD3TuSa6KfrV2FLU/JKiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7wKrdMOiyg47aK+9bVzOtg1rpWr3SqJrpXn2wNlawG726pOMdlV3sgizn3S3/vvlfh6IpgUHvx8fP0qMUH/nnru+gQtQT09A9cmRbJ84HySBanF+qFYNNKxlAzWyB/+t5vEmtW0eJ0IojB2jfDvqx0FR7ysHSCvFF2vZN8eawI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6YSwswC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jECf011621
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6EWAFArYwvzkFk/yEjG4XOoe
	Jfm7qgVUEY77C7aSLEE=; b=c6YSwswCYNti2vZRCxbqBFLrKWmuGe9vYVIvyM95
	ggwy/8jNjD/9NgdsN54FZZwrpqR6BNAps8wvo08EeEdk/LhzzHRbVjgHkOgOSkcQ
	cgC3glN83bZsRpsdVEvf9k8/sa9oLoJl17ozWspnMSeoUJGZ++aqHHVmNz8ccifJ
	utfTqdEEoUFzAbYjUCa/BCQfCPS0t92BylHAY6NsWlvPdiz+7zZ9FNxb5uDZjLpr
	2hdEr0yGQbqMv7UNFZd5h8V0XPf1U6Ty0U6M6FX/y76bMrVFVmF9vfHxxy0laP29
	YV//kJFJgNK3uFc4VD+xoURKiLuP8fWbDZDYfhXi7w9Vow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj4ud9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:10:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c3c8f8ab79so137486185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 05:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077429; x=1743682229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EWAFArYwvzkFk/yEjG4XOoeJfm7qgVUEY77C7aSLEE=;
        b=P4welUztKhC1vbJIU32ek+FJ8nIGXqC9eRvX4Je22ERZu82xwPxa9x/5twvWVSWL3f
         n5k0CRHQy9shNXa0IDcG5BlPJmgfvDDkky+UODiDVc/oXoc1oBh8jeeu7OSIcu0NGq6i
         gRkLf/oICX3TCTPAkqmNbT/beKlBCiv7i03zd6wgVPWOd99I4q6q1UaErNL32bixzggK
         1Sylz9WOcAN8e0fau/HQr4S72rxRlmfsnwcsGowqAfCnJPhzydYzNn8hY0KSGLhZTtz3
         ZMivSgEUfPJ6ZfRcccKH2mWtkyMZYf91XMcFCU8XjUAO57M+XLWuY8JF92TUO0lPXH3o
         T3rw==
X-Forwarded-Encrypted: i=1; AJvYcCXe0AbAFGQv8nspIGWvNbzRciu6937fL35oWGNLK/n4G68K69a4478CyXsgF4gqDlYfKfa6oex2rRb5WyDD@vger.kernel.org
X-Gm-Message-State: AOJu0YyIvw+0MjjpEgu/59eMguZE81+SHy4ZdEfJymUd1YKFCBz5+Rs7
	FmDknv/C0iGScod5rAiWBBWRqaceU4TMsZaRxYFfGspGTtMguRL2PRYRLTeF3OM6A2n86tquXy7
	sXNo4gpDrTLqYpyx6yRritsMiS7UhnwCHzQhCRJ0iFwwPnr+IrR2lLVFjG8XT+aQF
X-Gm-Gg: ASbGncuPiyC3qxqOpGNYdHkKp0tfXKKOkKbb3fscCxg3EnO6cJo0sLLICOnvPzOHl5K
	um8vTb0WP1NWnPaa1JtA9H03/BlzMhInL7mDmar9fdVNcAt+T8iXX2OiybIjfl8q0JjnrUTYzH1
	HC2hFkt1ZEFEZDNwcezVnOxJiUOBh8TysUDS9b3xNTmXQivj6vsreKD41awPwWFeW1kHw3me55G
	EyQjidKSvfMZuoLLFQApTyuY4+g2JCyTpEkTUcIkpPQfVMdluVVAnXvCE+6jPGY/LXmZoeSuE1H
	GsNOHeSR5D8b1ThGRMW2mblod8ZMGh33dYVwXIYEJy/y3MzBb8xwmqCZl07VWxRnUJYr4DCYppN
	0xdA=
X-Received: by 2002:a05:620a:25cf:b0:7c5:4caa:21af with SMTP id af79cd13be357-7c5eda818eemr550056385a.53.1743077429233;
        Thu, 27 Mar 2025 05:10:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEQDaxxY1c1JIWPv4Vpd7ya8lrOIR4YdlP6XXz7ASiHvYbTcShWybxOIgvCu8n6tJpJQuRsg==
X-Received: by 2002:a05:620a:25cf:b0:7c5:4caa:21af with SMTP id af79cd13be357-7c5eda818eemr550049585a.53.1743077428725;
        Thu, 27 Mar 2025 05:10:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e36sm24064021fa.93.2025.03.27.05.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:10:27 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:10:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Sayali Lokhande <quic_sayalil@quicinc.com>,
        Xin Liu <quic_liuxin@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 10/12] arm64: dts: qcom: msm8996-oneplus: Add SLPI
 VDD_PX
Message-ID: <unolvsafjyty4vgfygedyf6otd42nqigzikwoqwawbj7ks6bgq@shz5b3v6fchh>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
 <20250327-topic-more_dt_bindings_fixes-v2-10-b763d958545f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-10-b763d958545f@oss.qualcomm.com>
X-Proofpoint-GUID: IjMgPHS2LoMa8NwG3KK_wetqFY0HBBq8
X-Proofpoint-ORIG-GUID: IjMgPHS2LoMa8NwG3KK_wetqFY0HBBq8
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e5403e cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ApomA1EUvWpH6PII-98A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=689
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270084

On Thu, Mar 27, 2025 at 02:47:12AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The PX line powers some hardware related to sensors. Assume the board
> doesn't reinvent what MTP has established and hook up LVS2 @ 1.8V as
> such.
> 
> This fixes the 'is required' type of bindings validator errors.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 5 +++++
>  arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts        | 2 ++
>  arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts       | 2 ++
>  3 files changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

