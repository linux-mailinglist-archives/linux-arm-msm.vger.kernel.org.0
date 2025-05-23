Return-Path: <linux-arm-msm+bounces-59240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 393CDAC28B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECFC14E7405
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FC929713D;
	Fri, 23 May 2025 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbvQhJ5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F3E29711A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021637; cv=none; b=Vp29qcSxJ/2Ek0gndKcu5hJs8NoKv7nL/Fqo1ih2slFxTzxvaBRSlYZIO/LEsoYPACEeB7OJvgPetki4dOmQPN4XPIdzUCaKcGxG/ANh6GT0VqhO04o2m9r36WTYSKmJ02lx/54a4a6oJfzb22j2NdyvMCiKMtp2tK4f3nVNQLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021637; c=relaxed/simple;
	bh=2RlVhozH5dawX/I+r5zIRSPNYv7UDsuUM6ArHl/PNOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ek+jmlAVQDsES4CyZBS/mp+xyI04h1sD2ih4v3pto8S9Hx5YZKCtSmJt1Jd+vcBIXHrmzwuOprUDciUtoZgDNLVYzRGYUjxvtHyf6MHtFVGDQCQCRekBlx11TLJqHpcgPJdkt7RCun2Z0SJ1oad9iJrjaTTGuprcWdqyQxmmsRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbvQhJ5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCls0o011349
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kiSRIkgOu3g9AgMrN3TaM7xC
	3THECdyyCZ7VxqqOb+g=; b=gbvQhJ5MAAhFS9CRHs3cyX0xUmURParltkHnk8AK
	GW7ibCyHcsWp115P5/xaQUZ917iFQlEWwSoBMKNNAxwgFoAIbG8gULJ4WvnF85rd
	MAG6MZRoXH1JS6XH9qdPBEr5NJlFoBFGHcBBqWrOXOxbqQpwYWEC6f1RMQvHeudq
	bVpKOoRvhDbZ3GX8s1Mdewn6wtvy7iX+Too7XombGg3bBDKE0QkIB9blGZmayGXy
	ds7VUWjViYXE+5z4kWjiraXHS1PJn7dbzsJc8ikayw6I4hVGMlHLBtyD2lDWUa3f
	t4d99VQN78NTQcx/TnMsmMehyGcwmWi0NVI4ww8KOqksVA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0twkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:33:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8b2f0ab27so1252316d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021633; x=1748626433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiSRIkgOu3g9AgMrN3TaM7xC3THECdyyCZ7VxqqOb+g=;
        b=KMpTNbzNHph3sLVsE45w3tp3II8kenZxSy+JGYDXaS/WLY9VtvzXvnPNUpiNFbfytA
         mbeAH1fOV5lB305hSyZ4xgGmOq6ZUgLIbP8poZ2AD8xoQ8VSQsUZVbiUn1e8j2++drT6
         I1SAKMRGxn4mufihlbFeYjgP/+4iOjf8OTZCxQEC4jczLX5/XocJj6RVF28W+iuGmi64
         ZXLEwd83nSVx2DoTaBME7+AIFtKpXIRd7sVTRj6KTERiDD4LLspT+nF8A727VgLx7PQE
         qhVT8TZ9aSr5I9V8vyojQI1TGlkyTc8FiZNoQMP12URMygZYa/3AkK+IsoBY8fFNRTol
         Bq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNfjJnxUC9rhSY9/2zsNwLSge+x+DRM4eAV6MW3KB1cIHuGH6dGqMn4POo5n0YCZhrH2xk3y8IXv1K6h7D@vger.kernel.org
X-Gm-Message-State: AOJu0Yyby1Ew5GiXUOrBIxcwthodjoZIrtKqR+JXHY3QygrhY+dOlhJE
	/bggzt5OIwavzc152o6QqsSScpUpIkS9txD/NbIAM/nHM1tuYemujH47KMXTWHzHqQBFqN3wFff
	s+yA6outn/Hg6CbSN06WSlGmClJM03Ioe1qs8BLBT/nddqzKFSawZEWhzjj2naGBdWP6T
X-Gm-Gg: ASbGncthTrp1fKrYuYzVGYhIfx/AAm/XqQE+JkzH/0vHiXZqy1s68ua0nXBt9KarW50
	zmk31xHLd5DWVw2fUXfOf/itXyTwNLlOtRTAA7z2r9/nTs2Eu4mfsi1xaF0Jo3/V2zdcSIMF18x
	/LLWyMA6swBkisacHQwhsr/OLixfdWzLKQBMoxSmLWB5hcwygWvDMzYKQdpMuONf3+YEC0/7wAy
	erZElbFEI/VCsK0W18mbLGAba1g6EKnlvkzO784kIa0Q/rHCl9pcgwpEiPx+2FiTyOi9SQAkzd4
	EMuBTYMyJCxv9VIANW4meJJmzyCzEzELVL5KhTtTQ8pYRWT3OF8/xwzNwVfY3EdUYHBTOnfLIvg
	=
X-Received: by 2002:a05:6214:f68:b0:6e6:61f1:458a with SMTP id 6a1803df08f44-6fa9d0165b5mr4778416d6.14.1748021633600;
        Fri, 23 May 2025 10:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxh1sSV6c7A/2F1u+LXZKB8FKA56Qvmh0fYeMayA+t8rfgshkjB6FLyJjY1gq1eY4aWuJmwg==
X-Received: by 2002:a05:6214:f68:b0:6e6:61f1:458a with SMTP id 6a1803df08f44-6fa9d0165b5mr4778056d6.14.1748021633068;
        Fri, 23 May 2025 10:33:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f864sm3925122e87.250.2025.05.23.10.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:33:52 -0700 (PDT)
Date: Fri, 23 May 2025 20:33:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 05/10] arm64: dts: qcom: sc7280: Explicitly describe the
 IPA IMEM slice
Message-ID: <k7ananxlhqln3f2cjetesjx5kbwkqka5ikbwzvvwpx2y42ave7@35imbrz55ok7>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-5-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-5-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-GUID: CY-LaGecymq6NQddh56H76EF09R74J1y
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=6830b182 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=bJ3CpmIcVIv4Nmd2ic4A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: CY-LaGecymq6NQddh56H76EF09R74J1y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfX7n8X7Bqs9hXl
 MEuy/KcpOX19LYHzhrAXvX1ViKzJXAuBVJSbMK7A5B3VkEKW1A4MLZBZvWAx66FxHauKxKrPPKX
 TClSRWbPv6HNDBP3eMpF+rqY9+/h4oPNNriSq+gwRtSuI9nNbxLkgwQbv6mKJIKy6UWqXVO7r4A
 vn2gA9ZGS99yxd1PV316ji42J+tyxqe+ux3OJV15o9cafu/YTXdNuy3SOkjNoJiyS1OKgtvgqGh
 sIRO+3hgVApHzLJ5dZK5If8Grg1L6CH8EOhHBmCEfHmhKou7DN2dZalzv6Hk2ANstF7pl5I3CbS
 23hVLLPFLYH0kvx8tie/cYruseCGx4h13vWTTpg6hR5mAM4b1R3RAM93tRUXoYf6NOtXp6v8JB8
 8jXpBORc2Jwzfis0UyyAGlLiel6f2b14RkZZuFnISuBuZP3UXMqwiXVDNqv4kZVGPp+Q4vSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=703 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:20AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry

