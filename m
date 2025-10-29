Return-Path: <linux-arm-msm+bounces-79395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF828C19625
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EE78401A07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15022324B0A;
	Wed, 29 Oct 2025 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PinC6bNn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpkTi/D1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D9A2F6586
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730430; cv=none; b=rrt1f+wb6KV+37yXhQ13BaCAsiJQqYnhe5H/T/RyKwIXNNQ3z04SoV/ufEZAtliQkEtBAQuUAYi5ac+bExoWUyJi2PyX0mMtm2R3FWFDEp9hCQtrXdoq9NwSUXqoPhk/78qzhkIX+tkJzfRACZQa6l2xMXb7Blav3ib3N8SiU/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730430; c=relaxed/simple;
	bh=rqXupnqpPNubcslAJqHJlXhLlIWio5DVNHXOUdm+UbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nP5lFrD2Flz3CWFrkDde6GP98O/ANhZwivCfNSR2OSl4SRmfJ0MLfQyLmOH+YHIChUsz7DxdJ94tPyloEaFmrRYX9NhEYY0HN5tzx36dvTW/FWFs1w83TFoqllS9mgux4Jj3LxKScq4TD8ByuVsNtsaxztvx/DYFvgoFfbG/QDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PinC6bNn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpkTi/D1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T93HFC4155554
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rqXupnqpPNubcslAJqHJlXhLlIWio5DVNHXOUdm+UbE=; b=PinC6bNn37EUuD2p
	S//9W4YLzXTry7snCkLcRnxkY+YC7H2ivdlp3twtdEBTsOdzomijrYOBTWcrX87g
	iSrGIcUYzdkmyV0N4v36GXGMDBbv5wq7EDX87Sr23ivdZxgSbU/WHuvWDTWP9w7A
	jcSC2OEqWeN7fbggrLV/wKxnMWBkVGVSQKaBHjSb1DGRM+XVKnhjvkkK7/By5Kwk
	BftrQs2y+ns9oq3ibom6qpQqyGb2yWbZ+L3tgYjsAiritaZ27kr5D72WyBtle0NJ
	FoSPxaXC/cBl7WjN7p/QX0Yw7lGdHj/DTzmZbye9oGB/g0ztNjYACvk9wtWOeX7v
	1Auaaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3fy0r3ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:33:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf5ea6669so8436591cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761730426; x=1762335226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqXupnqpPNubcslAJqHJlXhLlIWio5DVNHXOUdm+UbE=;
        b=YpkTi/D1o3TioCAykQZycwDUWwvWbEHCRAAqxe5qtokYDBM7mCtKJEnUepTBRy6X3v
         dOSBg194bAItN+dG2dWXZefw3bNBBMwLgYK/k/RcgDXpaYiU6L3+nnJSdI6tHAqXUes/
         cymqPlgpg23I6p9QbKnoasxeWniqHlir5Dfx2soex0uq6tOIig3PgQtc1LQFtBjkKi0R
         /f3twVRly+H4KNstMEkRlwiggcNFy9r2X9yqQcdz51eJ6igbFeq2M2gLU50Q31xcCf6A
         SgaovWV+6jV5orVa910Vdzss+sXpbTArliWUk1sMQSxl0CglRTdC54W/3CEocDq4dbn9
         78fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730426; x=1762335226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqXupnqpPNubcslAJqHJlXhLlIWio5DVNHXOUdm+UbE=;
        b=L1nNLWOvyeEqwLBgcUujVzyXq/rrm6TVzdpiOzLBpEz2/ONGaaUi52t77imjpByJB6
         hAHSXUmzrso9+Kj/H7Rl9AbhEBOzmBLvcSmew8ypR/cjkog32vDXVbs0SHsd9v7uSwOr
         gseM/v79GYWF92963xHEtdfitSEpe4eu6n86Y3nrlcW6+M4NvhZtIxzRBipmh9BmP500
         BUGu4tFhgveb1rGopNz3jB9CpRSIoi5fdNtO8aoLaPYlYqMoeMnBb5e1tvWxD8HfxrNY
         dpZ6zN+RIcdk7gj9Te4ZIHehPc/Mt149TcaC3NVYOJ0mwiHlcqoEP8ie8NYSZd2q2THn
         XEZw==
X-Gm-Message-State: AOJu0YxEYbKnih3X05/gaqQj39TdNgjRq77M2zohXphryhBXG3hiAO4p
	DBe2ZKKyyaOYAP9TcWWEGSm6B4vFdBdAtTM71WeMf6LjK4TkMjSY7DzoyL29XVSufzt02+yrjBu
	JXUH1aVluSh8Y7c6+KdSqifh+yA6Qcgu5cEMqtpd7+tXkYYFbcxNefAKatKDBUv2zENBu
X-Gm-Gg: ASbGncuVT/XsGmhTZGT9X8Wsn9qLI2URjz7mwMwBeHvGdPkCEh4PjPHfn4+nyccBGv0
	kWhXsbSbM25sMx8ds7q27tdiyBlRqo3iCCfTzBg1E6oIPy4PHZnWaMPVvMLAFiRTyqfsEfZAfdt
	ePePuA5hHzPMjGUn0OjB+vKCOmPR/brRGXNVG/rIqevE4SgSFPvo1BYfA42Ub1tqy3S7CSzz1UT
	pSnoq3MxgfAGBnl5i2SPWSpsX3aavOXJEtYtE0IgL4INkRrKLEmgTpwGoFRIih/b5IBjF4n10q9
	VbPbgsvtuOgUPtmK/4wa8rsqEhpIODj3LozE1p9TmMJNa2PlDkgIKwOp3fb7Oja1wfLPkAN+C0R
	SxYFFF/ToRS8bxTmHvf2WR+XYsdVf6w+zy2NGi+aItW4X4qh7RDIHOlj3
X-Received: by 2002:a05:622a:19a3:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ed15b933ecmr18549811cf.4.1761730426530;
        Wed, 29 Oct 2025 02:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjF9pxhXH4RVBPpZWHVrJvDG4x6sCWKd/Yfxw34hVbqnGHssbUIThuvcIHqmaZakQ2H9J9+A==
X-Received: by 2002:a05:622a:19a3:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ed15b933ecmr18549691cf.4.1761730426118;
        Wed, 29 Oct 2025 02:33:46 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548ed8fsm1380815366b.73.2025.10.29.02.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:33:45 -0700 (PDT)
Message-ID: <c83079bd-ebd2-49fc-ab62-1fba08276cc4@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:33:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: cleanup GPU's zap-shader node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VJLQXtPX c=1 sm=1 tr=0 ts=6901df7b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kI9A-tbFYqiMmyZ8wAIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: HFyXMBd53UzkhF2vCmIGitfZ6tG5gZL0
X-Proofpoint-ORIG-GUID: HFyXMBd53UzkhF2vCmIGitfZ6tG5gZL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MSBTYWx0ZWRfXy6PZlDqk4IWd
 vwYgJJzSgNwxffUYK5rueAywOBOWhMjYghWDeW3nL0qQ7pAexv5766KoSpyOBNURdlZSdQjUp5K
 Ij3Ul8fErn6ZOaED381+eEA+Xrk/zuGaFYgXc8uM6B3Uqk6KUy0ay6sdGvJ/+IySnASmzqWQT9V
 S0pm1gWOGrzUW4GBEczYgir97eEsO8+/JqFZJj0/WDyBTqHX4vbgOZpVFPlo6yY/CcF8iDd3/rt
 XKS80gewkZj4bxnREUgF41t7+cVr3n35a7LLBCrW7gvoJOXiZ/Y0pf78HVsZmAZXPAXvm/LJTdh
 sgWheR87zJuqVIxr0nfRgfOkIcoFhaKKq0hNh5OZ/22eQEUqdlo39NnFwK+yFrST9zmJQj5u+sp
 e0YhKz9N1PiDjBLJDt1Mkb7jo2C8WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290071

On 10/28/25 9:59 PM, Dmitry Baryshkov wrote:
> Historically all devices manually defined GPU zap-shader node in their
> board DT files. This practice is frowned upon. Add the zap-shader node
> on all platforms, define a label for it and use the label in order to
> patch the node with the firmware name.

I'm not sure this is much of an improvement, since at the end of the
series, boards still have a &gpu { zap-shader {} } section, with the
inner one not being referred to through a label, which reduces
duplication in the single LoC used to assign memory-region, but
doesn't e.g. prevent typos in the zap-shader node name

Konrad

