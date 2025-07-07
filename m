Return-Path: <linux-arm-msm+bounces-63896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1523FAFAE8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 10:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CD6917FA1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB92128A3F8;
	Mon,  7 Jul 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4QqyX4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC8A289E0D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876672; cv=none; b=E+qvDQ0rQaLX4WFImTte/onxWqLRdYmn2/TAeZ6E69ZYNCNoMi9w77bW2Jm41COUviKZfNMI983bDMRuPe4hAiW3xZO3dxHr6hQbbSeRZee0xfAKLOP3iLirKXEgO9wnuNPyFoi4V7wDbq3L6z/04tN62xzzzLaHOB3fN5GwpYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876672; c=relaxed/simple;
	bh=08f1MgkJS/MdrAG/JH0e1/2zkyJyP2K7GUuU9LnySrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pMNQejjAw5EU1ha/Mdwh4jly8HHZwqLVlfCrK3QXiKnRRp8eDoOYPLcBG+MbeEu6ZTg1/Pp51jcjsVRc7unrDQzvUEqVTYSlWmUcgG5L6KPvSAFyyC7903GWaF7VNIKEoCKxuOFJxZ34G0My/z7hS4B5Kg4WmlYaVwlJNXa/IxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4QqyX4Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566KVcSF014531
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 08:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbM0Na9BGNYEY76leSiVEoIRTJwjEgEbW28UaU8pTrc=; b=i4QqyX4ZhQI6uWob
	/5qiPClMeuKoOkZlPichiL69OnNlj8hk6lULpnkN1J1VZo1mjErOEnbqc2wFahFt
	iNUSOt/kxErcAiLvl4mgN5oKSfJX90zPTo9Zip6pBuQw3WIkMPVFl//ZiksqlZNB
	/uT/Cs77uHam+gIKPG1kHUJNsG8knQoteP1R1iI6tCQYzqgxMICwn1jjvdt0BSb6
	OTUuuu7l4/uW1/SZz1zIFAIRDs/XY+HERQgR/F2aySgwXUdIChbHCwiXtP9msLUM
	3jDEWjhEIrf6hA8nXLQO7IuMBeUe2plDJRrw7nuSyrAKUtBWjBgLAqi0nv/9NvOU
	8MtIjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkb20s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 08:24:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso49559285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 01:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876669; x=1752481469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbM0Na9BGNYEY76leSiVEoIRTJwjEgEbW28UaU8pTrc=;
        b=meuekmEMKlB6LN+mriYJEU8Y5MWxH7LlnjXNILVKXIGbe1D6A1JWBDzqR92EkDNLpR
         rR/S/JobbMcEXXdo1vzZPqqACv59g1cthyWmsq1plzMK1MSLLB3s1S5QYhi4Sv3R/ybw
         dNIrQvPWXShnDAuovs5UoNWDFjWNLv8kdKNaAPyPGsik/HKW8qmZhmiMgggqbG2oopcy
         CDgha2hDqEuMsrJ2VzzfEwjhPCmkIpI/zeUSPPPcXa4k2kGtiPtByfa42/5I8j+qCE3b
         SKj7miZ86GMrc2KXoeLGEq3eJWrIlHFyqzZverA5xNWIs5PkFhrxpNShQuO/tF2SKhUd
         31/g==
X-Gm-Message-State: AOJu0YwImrlKVkqPiq/0J9NrU7VsvEfyyS8dg4LRrDgUmcPuUxd0mcVg
	xtOlq5iqS6/nDXplSdfmXXQ++htXiHP049SUm1q9HlS0MkFtgVORjnuBD7G4pGSheWw43Bt6H2J
	7/3wMtyZKOVQeQK5iKfwTrRYiAPSd4p5LwM9c5SHV98ILFmX1kyddLq2zuH40spb9mcVQ
X-Gm-Gg: ASbGncuhgXpRSJKsj1hKS7rtN6NiIu6k1v6/N6Qp+SPmSqqvHULIfgJ0SbaTJ6hglVC
	aJxqLLyKCRlEYs8f4uS4g9/kGZQU/cF+R+ieAY7Zo53lo2XWgtH0cQIFXoAc16meuyDvtGeDFJg
	l3jnxUgVkT08nbI/dXK7XwflUPbgwjxbgug67DVZ5y2/RSjoyjh6YuxkBuiVsoxUSrhcsh/1gIV
	kvnOkIE+H1J7vmUIEsSVSpnf93RuMgXKplnOetUJ0OOmsWlTHKWY2ZtqPkl9KZKTKJF+cVv0sps
	7HLFQvMQEzpzpLXdmw+gUV4FejIT2ARurHGK8fO2QzdJQrSoa5FWNtcprOd/gFIIyuATVTV0332
	rPoU=
X-Received: by 2002:a05:622a:8356:b0:4a9:a2d2:5cd6 with SMTP id d75a77b69052e-4a9a2d2634cmr41323311cf.6.1751876669219;
        Mon, 07 Jul 2025 01:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAhUSYigL5oM1altpor3qk4P5f5OHAvNg9UYt6fOM60gyonRu+BrBPx55Xo/pckv1Ovocl8w==
X-Received: by 2002:a05:622a:8356:b0:4a9:a2d2:5cd6 with SMTP id d75a77b69052e-4a9a2d2634cmr41323171cf.6.1751876668843;
        Mon, 07 Jul 2025 01:24:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e8c31sm668150966b.18.2025.07.07.01.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 01:24:28 -0700 (PDT)
Message-ID: <17aa8f1f-f293-4ba8-a947-08d9b3618f5b@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:24:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8180x: modernize MDSS device
 definition
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
 <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NyBTYWx0ZWRfX2EYZgTdOxC0+
 IlWfnHeul4pjdT8xnBHvSOemTK+KJfEFb7iwgk5CYgklylX4S5KGdhy2WsnfHOBFWZTcxbqkC36
 AC8xVlIRpSX04kydmXhRi4XYuMG0qg548x8SJHB8tmS5GbY6p864gcLFpttsLjWBgA+BAFVXQzh
 5ZpSCKvD8TvH78Jms+lGAYEyTvkjp+dl8iD1KN7UeW02A3rQoXBV7X5aY3yFxO8QlgugEireq2Z
 sRThzX9/4kysbLFWxYFPjG3ma7oOjeYXdkRVklpRSzPzqrLrsQZpTNpcI5RaWL8yde1NhjvigYd
 B8ehtcxKmUbRlNAZnZTBFBEgGsQzWp16rSOfa2rp/Z4RvCmoihV2ZxbFdfP2M17Cff08tKOEYhY
 0RcM20aaGmcAEX6G13SU5XIMheYv2SqqXwl53lB7Ib6URMynPUTVZwudpkvGgUgW/3ZKufrY
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686b843e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UvoLlU4ym182rRgf1HoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: DALzcfOChx59VWD6NsjNqazxyyLpXF_g
X-Proofpoint-GUID: DALzcfOChx59VWD6NsjNqazxyyLpXF_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=909 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070047

On 7/4/25 6:31 PM, Dmitry Baryshkov wrote:
> Follow the lead of other platforms and update DT description of the MDSS
> device:
> 
> - Use generic node names (dislpay-subsystem, display-controller, phy)
>   instead of the platform-specific ones (mdss, mdp, dsi-phy)
> - Add platform-specific compatible string to DSI controllers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

