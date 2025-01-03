Return-Path: <linux-arm-msm+bounces-43885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DFDA0096A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D299A3A3EE1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC9A1FA156;
	Fri,  3 Jan 2025 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnRMaVB8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CBE1D318B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735908163; cv=none; b=AcNWIpJB1+DEM/rp6A3brtD5Z14eeBs4xXb/NtUcHtJ5Y236XYiSovgo96T2A71G6NCxD4pZvgpkiymADFGhmOG0dmFGgrdE99iuZ3xbg27M9slWaMpAmOmrtisN2d7WE8cX8HqFl8wza+lM6eiesldLIEBn2U9iQ+hqic5cGro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735908163; c=relaxed/simple;
	bh=6z2Cj9z11DNrLUU7p25gMTU2IDw5wEC3O9INArUUsuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdKuK0t0hYP8Lr+h0ZCfyWIIOjpj4YkeBOeVQ+MPbLVsGQaNjJRyCeVGuNFftlE33kV7vsd9YJJ7yP0ynB71YqjcgbBEph1WenINq5guXiX+6FTyG2w0Zs5EMOTFTLLnq0G4INy9ukT+NysnmaIiPGS+ilKeSt34Y4t/hpr0z30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnRMaVB8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503CAVYQ010371
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 12:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZARMRNqfJJBSi0ZuqSgSannpryoCZUFZtAwwKozzXI=; b=nnRMaVB8anTGzIqz
	Z/SV7YYBtvPCSwx+azpasLMav06W23ogMLE8zV0C4njs/pYmJ48Ker3/HAmLb/JG
	q5u5uOfXelWitjaizImhNyKYHrSGBkP2yf/5M/B4VCAGsv80cJTZXeqdyULd2wZK
	vzfR4OHtp6JkfgRU03rsKxHwZQEINku3b/ZTo2PFxOg2a3SbrZlIdT/3g+k8s81u
	owpnsWZDssYTJkB0Jm8oRLvxa7pofQHY9p4DcdWNhEud219evO6s67WppPX5D8kC
	X5+uox+vguhsiTdYQeT/f8MCMnIQSR3rTfMYLua1ovIaWQeLf0veDi5OXhieXpQv
	YGrRqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xfnfr1u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 12:42:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467bb3eea80so7751521cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:42:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735908160; x=1736512960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZARMRNqfJJBSi0ZuqSgSannpryoCZUFZtAwwKozzXI=;
        b=RrYVPd2Hczf72E/RxmYPv/bSDS4Nd7FlBY107sXFfJpLcLE+M15vmyfSy7TjT382OC
         YfLa+LE3vdp1Ul1wZt54NjPZrS0Qbsp+bx4igFiTU69llrxaF+GEjyAFHTNplnwQ7nXz
         Dcceq+PlwPJIhi5FgbHTx1R2DmbE8s50Iq8HtK4Hi3peJS08qy2VrUhOC4PCtuUW8vhl
         SndrRNVieUUR6CAuzU6WaKxlUSG3Zcd4qKwl05094WhKhe06pe+BkJQ+oxqJBG6L3oBz
         gS4bBy+ZCyy70jrwm86rzXibWeov3y5b3ItxdhEVtCuXZgKBPkj2TyXSyfR3kIW7p1bC
         gxfQ==
X-Gm-Message-State: AOJu0Yz9dw2nXrqT4QBUzeih5CBAikCRZOMl2jO8dfMQdDf0R8tFt+wu
	/FT9kV5pcL4Cbv/VBm7js4SeoQ91UsiZ7xXHfN2zerbD0+Hkzrsk82aPo+TiVHAOAcWF0squlYu
	ldL7YCuh2y8hafoVIb1MzC3TDb6TRy5xt14NKEUQ/HySIzJSY3SwUvflc5Hk2PMXJ
X-Gm-Gg: ASbGncvabX/4riJa0v5miZkuxFVtAVXSEzrZgkOHsV+kybWcFfposd53c41AU63iooX
	sBwQ3KnwXqttQuy4VAmIFo9V7b/8QAZaYMcQF5PmYEJ4IRqAl0mgYKGA+z3jRGogV6ZHTuFF7LN
	hluaUQj84LNY1XHUkb2C7NFOHaCwUAAF21shfHU1381XAE4Y6xzuwJI/Yih7iWyOV/tlwaohM2y
	+OWC1kl/iXHKgrkoBqO9I2iFdjRPaY1egbnHgWecxmlpnh1uga/TQ3XWSR7WvIM3ULVYyGSzCnN
	zjnOmeDoO9fd4hoN5TWE7YzR7bpXt13GZQ0=
X-Received: by 2002:a05:622a:1183:b0:460:900d:6052 with SMTP id d75a77b69052e-46a4a9a34c7mr310086121cf.14.1735908159807;
        Fri, 03 Jan 2025 04:42:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcALt0LJyqknH0pa/OzeBKOkJJU1g2a9f/TCjCM+WwWX2eXlLse+id4suQvcMJE43uhj1+Eg==
X-Received: by 2002:a05:622a:1183:b0:460:900d:6052 with SMTP id d75a77b69052e-46a4a9a34c7mr310085941cf.14.1735908159459;
        Fri, 03 Jan 2025 04:42:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedaf9sm20087153a12.56.2025.01.03.04.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:42:38 -0800 (PST)
Message-ID: <78979ab6-0ce6-47c4-abe2-d4d2d9d50480@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:42:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: x1e80100: Add OPPs up to Turbo
 L3 for GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-6-3ba73660e9ca@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241231-gpu-acd-v3-6-3ba73660e9ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WulEEGHi9c_qXfKxf3scU5TtarJBerqW
X-Proofpoint-ORIG-GUID: WulEEGHi9c_qXfKxf3scU5TtarJBerqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=745 spamscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030112

On 30.12.2024 10:11 PM, Akhil P Oommen wrote:
> Now that we have ACD support for GPU, add additional OPPs up to
> Turbo L3 which are supported across all existing SKUs.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

