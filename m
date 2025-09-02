Return-Path: <linux-arm-msm+bounces-71588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF1B40029
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E3DF3A6370
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB32F3002AF;
	Tue,  2 Sep 2025 12:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeyr4qBs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5AE2FFDD6
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815101; cv=none; b=H+eo0T5vqM2dWKxHZsnjc3qL7RnQ2BRS93uIILYZKw5KNT9zpdaOrurH+hdyQmrqy9gbo1Frfqf7+VtYLor9Ld3SPmxVxKgUuxXkfDmWVL3/rshSItbBYeZW1vx/1BA5PHp7/0PR2++8n7IZCWrVhk9N+Svxg9tJAKrHRtg2T/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815101; c=relaxed/simple;
	bh=VKPh/ct5Q5m08hxDCp/EDthmOiS6ucPULO1VHGN1G3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rNtFIowbJOA5Vpe8ZCZZIPoKylXOhpqHQUe07hsxbGYy6BNUg+rmYaUP2blxZyME53yO0X9fqeqgUaQ9xCCL41LX/xhbjNDrF0JYtmjSO8ujwZNwU2uIfC4QJWgl1Rk4+BufUZlmgwqoboVEWRqyZqjsYOzoEAEdgA/1U8+o+lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeyr4qBs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BLLLH015457
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9+3e9dP2WaVs0y05qgMULMfCunUKyox0pXutflnw2s=; b=eeyr4qBskZ6+frZT
	07ReQadFBKOtqTEhsmyQ9kul7fEYeJO+8J+mQQrnwuO9rQRVpNFrYaAe64uu/GEo
	6/5vGMmjfknMejSA6PujLNvCS6EFRzRGKZqestEKJJa/sn9048M+hHwnRTOFHwAy
	E6Er00oehkoLqYqQ7+xhusvQpk9CZjTw2AxrXLBpj7XC57NlJtCG3EUpc+wzZGWl
	UvM1H/10mMCF6qEEBcDTql2UJQtV8v4MUJ0si0QCTMQcphEJy8Egtbsj8tmbJyh0
	ZGoavm0dRVgWfvUM70fAqplEaWxM/mMs1p5punMdgb1qB9AIRCyAf0tLumVPfaFP
	sw1wtQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyyq6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:11:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b32eddd8a6so5584131cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815098; x=1757419898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9+3e9dP2WaVs0y05qgMULMfCunUKyox0pXutflnw2s=;
        b=W6wkjWVS9V8Xwm1mz07YJEHK//0ahUbH2GXBatKyvctNMVaJH12IX7g9ovcvaRSeLf
         LY8A+9ZzHiT84OcVrkyIdTIyF2MRWyCFzEV93h4KlLNVNDEqQ+SxEqKBRqP7vY/qxMtx
         LweCHsbuOpbIuw78JasLjhP7yqr6Bb1SdIwMBqy/N8rHPwRUMMiW7cT2TTAhRls7/dtL
         RsPckPlCc/2yzN9mSeuPr8tTK4/gVPEmv7oWA2PozNmAhOfPGl1jwswP79+fN+WBTRii
         lpj+sxBpYEVFG5766CAdcgFoZZFNJwS+dwonQNLEAiXKGgkUq8d8ZOxrFZVKK+LSXx7w
         Lk2A==
X-Gm-Message-State: AOJu0YwmDYis6aiURnAqHMfujlV40Bix+XOj3inJmo+vXw/37T64nUld
	Yok/g0k6SVONd3LQ/e8OrveJPEVKZBD0RjdbBZ6Ar2tOI//CpmCxuxP1LoZ8r5KiY5gHfjxuWyl
	cAAwuNc9XF3rIOBMvdwbmYqJztAfq8V41PSTkSohvWzfVk0R34f5dGV2ktuzodm1pIipz
X-Gm-Gg: ASbGncs4rqKX0b1an4WglM8Vcb6OfoSjAnFOA6Orb5LOzBl5sESR4NpQLmK2mDTnla2
	RGXdrvjmhLhtDQrOeoP0nPEAP9KrEJJQLn06Uu1cmgkdzSO1MZqiV9L166EdgvkkNfAnnb7Pwk0
	8CyAW6r3AZIkSHy+CgtBwrUGEDv5kuJpOgdeXtkrfFdssGr+TiGIh9vB+Fz/d6C0pHEuDrUQ5Ao
	aR/iHJBDSBG8dZguQGE2gBbJpBbf31qKHEwjCBIdP1F/MGl194a+fqD+603BXV4RSO5s/sSgqL2
	+Rc+5kfvyv9lXuSd7n1mgp9S6WOC5XsTFSCGj2Wh2gyzXh3M4KbPTjHny/XOHUPk4gQmcWi3ie7
	t+reDaaCYfbESngQZhjdu8Q==
X-Received: by 2002:ac8:5710:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b313ea00camr114042721cf.7.1756815097995;
        Tue, 02 Sep 2025 05:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwW4G4jjkaUKtXkdS+GHMSUK5ZRdAh64PysqQIkVPG7KSVbGILFSKErYbYiYkdMuTYCelzhw==
X-Received: by 2002:ac8:5710:0:b0:4ab:723e:fba7 with SMTP id d75a77b69052e-4b313ea00camr114042341cf.7.1756815097447;
        Tue, 02 Sep 2025 05:11:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-affc2fac683sm873825266b.83.2025.09.02.05.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:11:36 -0700 (PDT)
Message-ID: <84c48543-815c-44fe-9334-ec1f688e9639@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:11:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] clk: qcom: gcc-ipq5424: Add gpll0_out_aux clock
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-5-cb913b205bcb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-5-cb913b205bcb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v1xcKd0_AbyehBX5uqEdRYKtlSyoQHA9
X-Proofpoint-ORIG-GUID: v1xcKd0_AbyehBX5uqEdRYKtlSyoQHA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX+saFnsFwXv78
 ivvgeG/NsjFgqaxqTs9weRpSj3Jjiqnt/rSzH9DP0wF5PF6kWvTjvVgG5wmttPq40/f8wKEsnyO
 CsYOXr3jrdW3bChVn2355jGPz9w9t9mRfTTdvrn8vxNGI2E1IG240Gql5aY2d35babAG1v6TWQf
 BhEWs3pSk8VG/hHgTavTdtG6t6ehXtWTw9Ipu8J0oODAyhM6YzI6uh6Qdvu7s4Bbx7DTAYVbUsE
 bcF035jGronPFbkru6qM28+T9Bslui/pu0qpV20Y5/j4f+lfRqdL0Qi2JZTypYZOJk+mQnnTKZs
 /aiIdmGgjZ5iDjCEkuHddZs/dmPBpJRPQ8mCXTCLN85+IDD+Whsur5tAdm8op+zY2vrZZZObT0c
 bWLHoo9/
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6defa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=xy1T5CxqftMPibTtt60A:9 a=QEXdDO2ut3YA:10 a=jh1YyD438LUA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 8/28/25 12:32 PM, Luo Jie wrote:
> The clock gpll0_out_aux acts as the parent clock for some of the NSS
> (Network Subsystem) clocks.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

