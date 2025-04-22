Return-Path: <linux-arm-msm+bounces-54975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7319A97530
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 21:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 329A67A548B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 19:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E69297A64;
	Tue, 22 Apr 2025 19:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOk5D0rZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1C81DDA1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 19:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349255; cv=none; b=iropxmdlqPmuGfjgqkrV/I2d1LoUZbeORJtvMbnPKWLgLGSMVvQ2NGoKlFS6l6Zrk4kIYqB0KoxSQqKktbYYoYN8oGMcAI1XghcjnraLlF4yS4/dLSZSFu9G1aa4Zdioacv7aE8ov+iTfAjXNfbidGDbFose4RZ5U4pTl9C5vVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349255; c=relaxed/simple;
	bh=ktElfp4y9jLiB76b0Lw+Bu81gNc+EGDgrxca1gyyqYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2bx/8kARZg1xkOV0UEA7C5aj0jVJYnS+E4TWqCzQDW8QxEPNAwxg4xM5SL6BEKRaXcTEk5j5P7s/fGINxlZUD+oxNphwaAd5AY2WgebVh1WHze63K6AXHEMIrtd88U6aERNfgsYzpvoVaSo9TGEH/fEAQS3RvoJ9kcoq5Bkxis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOk5D0rZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MI6m13024848
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 19:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDfBUzxdqcOodqK0x53+9B7Qwb91WQYtR62iZ46QXiI=; b=AOk5D0rZ8GXmkTGS
	OTj0/lfCOFxNMK6SvsP0kJMxehSGUc0NnT0KYybKGvV4ScuIejqCb4j8mPlBS2rI
	Aox8SXAC9p90WKSmW2geLKOFac/HW5/ox5X6ckOHiVskWuIqgcI1AZ/4GQF1fEWd
	PpoSYprpXpZPeNMzlS99PlhMZsi57RvZXde9En5AZ2JhkMe/XJ0bRgtf2l1vZ+iA
	S0nKczjlkspJohAj8QiANmAmkwPAWvSQD0ZV3+EivpDpvtv4BbftgRIT/K7Ke8Ns
	B0Hi9LNG2zx3RgFSTgV+jm5sjWZGKS787lg//pP8C1MvrYY8qfMK/i6YcLMpO1SB
	yx7UXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426rp3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 19:14:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c547ab8273so44448885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 12:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349250; x=1745954050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDfBUzxdqcOodqK0x53+9B7Qwb91WQYtR62iZ46QXiI=;
        b=JKqGiBisscfY6aLnvWSaG6UlB1znwhdJCqHzFSUDvFtIEbJyx1jIj9Ij9dxcpuxnYn
         MLlqNGBoUGW7pIin2cCD5LNkVA9QYHK4B/l+YrpCrPe04rdHEt5qtadwJ+awogepKf5m
         uaVvCbSP/PsG5jrknO/SulpRwahSy8zcJ1i/S1B9o8Czjm1pLQtaJu+LwnNNu0SCCLk4
         d8sU7g0JJZ6cl0oNITTPJOGYYTr9x4s0Cr7D+ROs6eSn5zUZAMFvOR7xn07jBQvVBA+Q
         WYP0l3C2tHqfdJmP9jmt2vbDYgamFJotQgkf1eK7rXX8TGE/bynkTR9YR6UnKgXmPeVn
         I3Bw==
X-Gm-Message-State: AOJu0Ywb6yZog5r8ftNfIBZbrc05TFrSRcs8681CM6xxtEO1+gx7hPbe
	/vP+54qAzWFBD71ESKN/vo5SMRSLNiabzs5JgCCZ80qT2M2wVcm8Xh0FAXZcz01OGPIHKk15IBH
	FomAsEZqyIiCjRfpaMHeJteXbkVLLAyDtjZwRxGJdZkXxWSrXDDTMQ/RkRz/5wgAX
X-Gm-Gg: ASbGnctT7tUuld29d+8R1KpZyCh+fjAbp65CGYU6GknYo4wiMC6v7zmfeZCQrIAbOIG
	av0T09Md/9VFf+BD8VsHT1c5QQbeEpmpfZvX/DaH2S9bQUOAl61sfBorefob5HK512QeYJXUzdc
	Lc6eUdfGUwggXOhSh2G75Ir8suzQoxPnyVtS7k4a/Kw7Jk7rZgK5yJARFBlspotU+EvvyvA0vTM
	vzDbplIE4u/24CZ5l9EtlPImzVWwhgP06ElAc/elswMnx8d+R1PnH5oEnDfz+RcZvzpEMfyVQtj
	6c3JuMnuJPdB7OdD/Co+SGSlxKsuzhfdilyS03YNbI4aP6KxHxVpDtWIHk4eHr/4T2g=
X-Received: by 2002:a05:620a:4095:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c94d29ade9mr27751585a.8.1745349250430;
        Tue, 22 Apr 2025 12:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7HiqvOyIsraSAjIugd3xjXilpVZSiFuqvb5lB5h6IcYI3MvuV9H6EVgiP8btR3FsQ1k8Z9g==
X-Received: by 2002:a05:620a:4095:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c94d29ade9mr27749785a.8.1745349250048;
        Tue, 22 Apr 2025 12:14:10 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625596138sm6572178a12.45.2025.04.22.12.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 12:14:09 -0700 (PDT)
Message-ID: <1f36d303-fcfc-4aed-8d8d-01a3c4dae57e@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 21:14:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8953: Add interconnects
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
 <20250420-msm8953-interconnect-v2-2-828715dcb674@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250420-msm8953-interconnect-v2-2-828715dcb674@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KvPs0GRgU-G9s2qzAuVZUQ4lUgopl8HI
X-Proofpoint-GUID: KvPs0GRgU-G9s2qzAuVZUQ4lUgopl8HI
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6807ea83 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=Dw-YgVe96UOjDrfUO-cA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_09,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=987 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220144

On 4/20/25 5:12 PM, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the nodes for the bimc, pcnoc, snoc and snoc_mm. And wire up the
> interconnects where applicable.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: Prepare patch for upstream submission]
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

