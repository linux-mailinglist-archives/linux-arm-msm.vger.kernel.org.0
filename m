Return-Path: <linux-arm-msm+bounces-82179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C3C67458
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 05:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A85A44E309C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 04:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207F229E10C;
	Tue, 18 Nov 2025 04:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgypgRjX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJvd4CAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AED244687
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440489; cv=none; b=ZIYWvMiJ/65W5cEKXpP1Bs1W90BxIjQKHZfrvxviDC6cnnTewTj/TvO05uko67BIMkzMc69C6SvCNyoDIZExMcyNh+2DuQ/5bMPuXkq8CUPKDyIl9k92yBFS7zupvalJ51goYpWDDUMkeP0skE8SXa8Z7gMvYXW/2H0njszppkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440489; c=relaxed/simple;
	bh=eFPmGiNcQ+eKpI3pIVJZQEIPer6AtMRNpKmkQqg1LpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh0heJtWTy+JWa0I+ZrtCGPRrIffvj6A2nrWH82pGd7cbVUdORPlDPg6odQ0JpVsPssy77DdTh7P92KgN3GZurONymJn6t0xeI5s6EDwLfRpkkXYorDn4rZKtWeXhOdPSEtmzxE3KLCJcTeC8B5L5qHoRO5kP0+VpxtyphuqFg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgypgRjX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJvd4CAj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI2x8A3375641
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96sL93DbfW75iRtuX3LpfQmBg7hrqKggau4HYAGX3mU=; b=pgypgRjXry5mXmY7
	5MVNibDYj3m4BrQLGxkOPBO6eZS7VItsFhexohNW/ua0U/aabmmZ6P4HjSOpzlZj
	Wlg+T+A9tLyDXUuwdBhoQFBKQF3PKy+XPYaeet580IT4kO9IekrHSnxejO0PQPzA
	HfB182To5jOaEozE+WmK4HLDx9tf2WqjBnCMzXHtrEffLbfjo1ugh5ak4yqmuxIv
	4QZsNaENV69ogsemYAG7rSkaaEChG4pZIi16F7YR1KSy/rg+lcdrzB9QrrNMNX/r
	KbdTaPSzxLVVZr6OQDrdO7mHWekf4h/aV3AHlVTScBo5IzRerhzzPQtmIyzDk6pg
	v2KUZw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76nhsd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:34:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88050708ac2so52570666d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 20:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763440486; x=1764045286; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=96sL93DbfW75iRtuX3LpfQmBg7hrqKggau4HYAGX3mU=;
        b=kJvd4CAjm3Y1/x58S4xNtoEEfN8Z+GMyZZydEg5qFK4Hhx9MmWq2JJ0QU1Hjq13i3S
         JdfrOj8nXUhJBqhQnd28xvE0tcxAl89Ni4M6m2LkZ50B3TXlUp/ebduJTUVji30/MMWt
         PiDR+UTtRluo813eURCZJPVbcaWANKKuUpWB94ZypNyecJnGu/HryAz1V4sJKsCDMokR
         YONWr0ssacF/MfQue8u8Mqng+mJlWXqgsSCIEplFJguUlPQp+rN4LO9ngRcFuHZNbVsc
         fUo2BRg5MMq5/RlxZnXFC+GjzOex31K62ikggQdANI2t21Q5f+5Ty8O/DdjDQ/dxN9tZ
         zgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763440486; x=1764045286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96sL93DbfW75iRtuX3LpfQmBg7hrqKggau4HYAGX3mU=;
        b=DogIp+3HYOGmdixUEGKJB9EnEVP0f8Sn9Jg9eUnYgdKqqkUYVELLS5bcLk8QzF/PGq
         iPWEve/sm9T7CuGW3zx3ancph5PAr/LJgdBZWvXfAWApOKZ2NDGc70E9UXgrVpjw6Lo2
         0o98in5YaYtQUaqo9DT5O7vZsB893dkFUvLSWnFW5oDSnG917JXY7+XjmIObJjKVsC2q
         eGX3So8oID4JDE03KArN5F9hRtyECPpf0tQ8ZGHXOtizBtKWP4gFdJesOJw1r0DxrFjH
         n3JR+3L/PWrxFau3yRTeVU3asM2irejwmBHRE7wo9vdHS6HzigT4BYHmneVFuXvCR3qm
         b/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Te568aYOGl0TkJqtPkso3XaALDNO3dxJjjOT/p3byldTf6tSKOqgRfd6b+BYmVPHPNBik3VmhtFiW/fc@vger.kernel.org
X-Gm-Message-State: AOJu0YzasOfJDDxiq1mKn2iRkiBkQmTF+WtamoZVUahLuqVWn8dok8m6
	5vwAD0hUuDBjLJDmeqmWy/YBj0SVZr8DjVmbFgaUZL9MOmOQ5Zp5t0RVzZUKJ3mUNjJQALjIU5h
	UPyy/8ltELomJF6/jvRKm1/gjZVpIe9C9Jab7s9XTh6KePP3Y0GaG8r2+X6VATQY7fKSt
X-Gm-Gg: ASbGnct2+4i+reVDtFH9imOPUsS9i2Z5kCi0mXtY99AQ5FW5u1yaTcr0XX/2h/Y4MkD
	7hYD6i9cZq0mMVrGwHKdMV8zGXa9JQ6vjbDfCgaXP8Aei+JFB8khmqTHLQNW2qyY5BmyEOgxe0n
	ccstsP+K7eiowFWVpRau58Bl3r+djzDgcVWGIx8abYv8r1dK3rEmDybdHbePIiJ36Y8En3ZwPM0
	i8X+QaWtVqzK92uiZaeBHe0OiY3zsTyWFVCPOkBggS+Pz97wwTCK4y82arfzTHizZopPIl0PiG+
	ON39khRZkYluPMJQT5WbaU3eI6GburCpILTJpIziJfcoSZj8rc5D1Yzf+zV86fNhsp+5VVNoYZ0
	J8jzfjPolJkp664VpoMSMWOJL8DJCS6PpyTtPVMbC/Gvzix0uSpqR0okkaPDBOCO0RHPtyRWoxh
	uLAdV1+ycbwFc+
X-Received: by 2002:ad4:4eed:0:b0:882:3f45:c828 with SMTP id 6a1803df08f44-8829267b3f0mr236988186d6.36.1763440485963;
        Mon, 17 Nov 2025 20:34:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCf3qbFNFO5bHbuNUf8/Vtg4In8NKMDI2VdMnoM8rjfEpd0ZJkeFt972jCERyiubWFLdo2Xg==
X-Received: by 2002:ad4:4eed:0:b0:882:3f45:c828 with SMTP id 6a1803df08f44-8829267b3f0mr236987786d6.36.1763440485531;
        Mon, 17 Nov 2025 20:34:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040595csm3649383e87.94.2025.11.17.20.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:34:44 -0800 (PST)
Date: Tue, 18 Nov 2025 06:34:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <j2fwz5vgzydi4dvtzegmwz25rukazf2clk5ga7ikvv5umm2jcw@edgrznbv24hq>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-4-a774a587af6f@oss.qualcomm.com>
 <swma6lyjfmyhl5ookdzvpjn5qresgsze5wptg45jfgj7ub6a4t@bdgfstw6gzoq>
 <380aa79f-f334-44db-9527-85247f9735af@oss.qualcomm.com>
 <2jfvrt4r7ddagh2ztbad7qnjpcvulcrtr3ekul6i26qg6zcd44@dxfhl3265okx>
 <cdbfe200-314b-4185-bb58-d528ed317610@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdbfe200-314b-4185-bb58-d528ed317610@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzMyBTYWx0ZWRfX9BFuWQhcid3u
 JnWFAkyflRcEdjlzzI1zYqb9Z8fqQI4p8pV9+ijTcaHJAG2Q6RA/F57jCt8K5OmAL22NksEfByO
 UFKMN5DQpH0TrxZ4/wb5gD4COh3eurrdL3r+NwadPd3fXEh9LKrhBNLW+EzE9YYKkRuYt1vof+O
 TH0Ebmos4VkS/2t0Diyz8BZ4gfyNzbLlSWXWZzDKunZYxMR6phc4qKuHg5/rUIPkBaAQiuqheEm
 bZy6pXXgWysNm1z2jqViCOc2hNoz/MTyvOZ3PPdHwhYmSHl1cdQyhSFYmsQhTCyU8/n/P8PG0Vs
 djaY3RvnHoVZtQ9pdRWMB8+ZC2H627aOhNSND40r+Hjv3Q6+9c3MLLSmo7RAHmoUDf9Qw45ShKP
 UFkEU6jiVORcs4toeekPx5MxIWIFtQ==
X-Proofpoint-GUID: Dn8TPlx52xns9okyjTH1HdLn14hCUhdV
X-Proofpoint-ORIG-GUID: Dn8TPlx52xns9okyjTH1HdLn14hCUhdV
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691bf766 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=R_MjEz8UllVMvTsHhMkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180033

On Mon, Nov 17, 2025 at 01:28:46PM +0530, Taniya Das wrote:
> 
> 
> On 11/14/2025 4:38 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 14, 2025 at 02:13:49PM +0530, Taniya Das wrote:
> >>
> >>
> >> On 11/11/2025 4:16 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Oct 30, 2025 at 04:39:07PM +0530, Taniya Das wrote:
> >>>> Add the RPMH clocks present in Kaanapali SoC.
> >>>>
> >>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/clk/qcom/clk-rpmh.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 42 insertions(+)
> >>>>
> >>>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> >>>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..fd0fe312a7f2830a27e6effc0c0bd905d9d5ebed 100644
> >>>> --- a/drivers/clk/qcom/clk-rpmh.c
> >>>> +++ b/drivers/clk/qcom/clk-rpmh.c
> >>>> @@ -395,6 +395,19 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
> >>>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
> >>>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
> >>>>  
> >>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2_e0, "C6A_E0", 2);
> >>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2_e0, "C7A_E0", 2);
> >>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2_e0, "C8A_E0", 2);
> >>>> +
> >>>> +DEFINE_CLK_RPMH_VRM(rf_clk1, _a_e0, "C1A_E0", 1);
> >>>> +DEFINE_CLK_RPMH_VRM(rf_clk2, _a_e0, "C2A_E0", 1);
> >>>
> >>> What is the difference between these clocks and clk[3458] defined few
> >>> lines above? Why are they named differently? If the other name is
> >>> incorrect, please fix it.
> >>>
> >>
> >> Dmitry, my intention was to make a clear distinction between the ‘rf’
> >> clocks and the ‘ln’ clocks. Since there could be overlap in the
> >> numbering, I added prefixes for clarity. I should have applied the same
> >> approach to clk[3458] as well. I will add the fix-up for the same.
> > 
> > Why do we need to distinguish between them here? The resources in CMD-DB
> > don't have such a difference. You'll select whether the clock is RF or
> > LN when describing the platform data.
> > 
> 
> It is more for readibility and maintain a direct mapping with the PMIC
> clock grid. This way we can immediately identify the clock type without
> cross-referencing desc as the clock mapping here would indicate the type
> of clock. Yes, the CMD-DB name does not reflect anything with the names
> here. Please do let me know your suggestion.

I'd prefer if variables reflect CMD-DB resource names rather than the
actual clock usage. In the end, platform data does exactly that - it
maps usage to CMD-DB resources.

Also, if we follow your proposal, we will end up with ln_bb_clk and
rf_clk referencing exactly the same resource, causing possible
confusion.


-- 
With best wishes
Dmitry

