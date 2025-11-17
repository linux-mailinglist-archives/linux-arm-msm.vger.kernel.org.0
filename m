Return-Path: <linux-arm-msm+bounces-82148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6220BC6596F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CA0FA366D1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178C2305063;
	Mon, 17 Nov 2025 17:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrSLYx0G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4h3fwvV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A5429DB88
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400760; cv=none; b=nP+w4OnNB3I2H2T3BattQ+zbjMhIB8TetOKVskPP1dbUdNm+UCny2Curcvpwl0XUpUhlBvJqW9oyxip/zDU2Ls+6uey6sEyPsmHCVv2J4BKHDPhgQ+nWJQS9ksOGwhPGeInLfLWBlnwwgGlb8lCmuxyd8BksYJmj+ZicHltM/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400760; c=relaxed/simple;
	bh=ENanSwtYZcoz8KYaIM85EFldyWqROkPS8OsAy3dMyd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gh7Okk8k1N4VvyaH9WbZzJll3utScA8RajgSvaJRPx2eJ8m28AJBG2Xp897QwJ00MR9cQ1gfC/rLroWWZVPnDiBN78CJ4RLtMb1f3df7xDMBXDF/DpFPLxNLkTGIgEgWfSYE+l/GJm3qR9hHzm5KKES1Xs8T15pvuhCGHQZRDA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrSLYx0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4h3fwvV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2oUL3671218
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJcNO/Q/v2pybd2I7RyIKugmxZnvv3/dh37NRc7/cwo=; b=TrSLYx0Ga+KpNPf1
	FUKKoOpEOFXo0rO4XqEVQAU02qA5IPUnJ2rshDb0EPE5Mk5ciPfyopHojxV9X3ET
	oPw9sajmsKAuDz/WvRwhOXg/e0e2lX8dGXbp8eARj9FouR7sNag9kxcwSj3ikSuW
	FM6NNQ9jlOHmXxbzZMgFVbBd+A2MXFt7dhVckg7XPTAIPYXQFeynCYMIQ7W3utDJ
	/QBRrpIvH+7gZIiwr0O7VnSAhYSYiIP3uog5/yU6IP5jX3tOslAt0gkCFsyn1lEY
	zEPTQvwWLQA3w6QvNka3pGNOU9Tu9uxnrvyJ2O9pU27P/oFZbJsJOxCbXLrt3Tcp
	9WP76A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2g594pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 17:32:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6466f2baso141054931cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763400758; x=1764005558; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aJcNO/Q/v2pybd2I7RyIKugmxZnvv3/dh37NRc7/cwo=;
        b=O4h3fwvVb2Aq5lZtP3qFudxOJKy3L761g+nceyjRtlG0/Qo1eepPkEwZrFN9aOILg2
         JuH2drmo9QlqFSK/i6WgKlvbSwa5hZLGZwts4SDDk+GSJKJspjldxuQkjzH74lK4AjxC
         NMQ0U/8U2HOPouz02UOCdV41xKBoQbvbhfklMZ4Y++pApbTMDJWZAWEjQ/WtfGLhBJtI
         3hBZexiNUWm4Q0tIU0wnj32+CcQiUAQI3b2Dit3u38NAdRCOHb8F50sORVCfna/cNTn9
         pNMqR08YFrgtPwTj+Ukx3fJTelQuynJ9+NQkXzKqSU0PCW6hPom7wA2RaTv84Knrs+cY
         A6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400758; x=1764005558;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJcNO/Q/v2pybd2I7RyIKugmxZnvv3/dh37NRc7/cwo=;
        b=DTXRpHqWGVLWvq2Jvz70QX2/HG6gsdXbg9jmSlLfKsJfjZpW2nSX+9jy4D2ss2+VIY
         a78ANOiG94PpTkb4LUhGRkiVdKpyZt74b0HQGjQv/FV2PK5qUI5IVOnmiI0GLD59RKqY
         Ed3dPdsZW0Vw/KZYCz77+0HijkVxjb2PuiMifJDGyq0Y5VsLpK4bvSVcvKKJIfW4NQOZ
         T2OB4TPTs5IjJ7Ut4ltYoWb1ijsz0It5qJEBdN9Z9iqyUcDxRPYG9rdxGGdeIt3+fDY4
         wynLKw2kYHEyrfjr8/bRNiFE33dkgCKj8DmvgNQqNA+pq+gKt/HWAiz2Rn8kmPIelXxw
         8OYA==
X-Forwarded-Encrypted: i=1; AJvYcCV9aJO14qywFjuadPwh8TdPbgzZoibZdTZUfuhBlWT31C98JT55SY3zqw1AEtwv8bYc4NGAmugjrd4KvrJc@vger.kernel.org
X-Gm-Message-State: AOJu0YyIQkVhmDX8ZAhwSUJeLQ1HdoXjeeUTjxvmAc0Kw+jq4V1OmHJB
	LUV+VjWwlPwNvME61E1NLoqQ5/+0066KFdfbD/LKoaD+Nolt15v4mVU3orlCpBUNi4P8EQx9hkL
	0LtWWtUWym6c5cCD8SxXzho3kI7lRA0L9/WdMAWcu02xOn/ZZs0eMNHottmBZZOSFTR1w
X-Gm-Gg: ASbGncsO9qQTLaTp5rtcxUc1+EcOOcpI6V8fpUf1wKn2WYthyQctEq2A7Gi5wJAlogp
	TetIHc3SIeZLsFu3/RtLhrF/KI/0l9JcYyGG2vEK5Woo02xUUiq7a9xW1M8l3hHUqfIozNGLpo6
	yU5Vy8TesZwQrUC8rG3IMYQ2egl+xPiNHBh7KCSNs/ULoaiRq9T8o7mczhJK4CYf0/EcsI5MND1
	Twlgberocf06LtAdxwHQMTcl5KbCIRjIpePno9VBvavAHeTKZ9xQdGabEMkqbhzgWNmwyaLVaRh
	Xxi4LgStGTE9eNuHLnsMyLoYdlPxtzCZtL9zcBzbBh5MxSyzelmq8veaqeR1miBStRv1Ec0ob9G
	eqQXd68z/ImDKECCn15oJ9OQ6YId0+1H9W9Fg+W/J/q9KW61+Y9JviLcw2kmVz5uUvc/qwjuYbj
	oREq6PsCJiBqDE
X-Received: by 2002:a05:622a:2d6:b0:4ed:ca4a:f51f with SMTP id d75a77b69052e-4edf2173db2mr191443871cf.72.1763400757178;
        Mon, 17 Nov 2025 09:32:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT/nR1VfS9lJVDvioCNcCcSmGfxHYtTTdwQ+tY5rNTdR+7q11s8KtgeREig25AF+lCS2bBbA==
X-Received: by 2002:a05:622a:2d6:b0:4ed:ca4a:f51f with SMTP id d75a77b69052e-4edf2173db2mr191442671cf.72.1763400756007;
        Mon, 17 Nov 2025 09:32:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b30c4sm3315205e87.31.2025.11.17.09.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:32:35 -0800 (PST)
Date: Mon, 17 Nov 2025 19:32:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] clk: qcom: gcc-msm8917: Add missing MDSS reset
Message-ID: <qwonj5w45jb5bmbwwqt2f7msgjzrwllvuxwbtyl4uiwnuvphxh@bgeasw6koh35>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
 <20251117-mdss-resets-msm8917-msm8937-v2-2-a7e9bbdaac96@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-2-a7e9bbdaac96@mainlining.org>
X-Authority-Analysis: v=2.4 cv=F7Vat6hN c=1 sm=1 tr=0 ts=691b5c36 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=wV13qoKRaYsQ4mHf_eYA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: MnbnqqoEzRIKCwGoEaVs-kQP5gk59eK1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0OSBTYWx0ZWRfX6mQZCMBnRVon
 vCZp9X88dJV3q7qyxt7/gllFEqBOnl8t/gHiMdKcLmGnoXI4/6A19oLrmkot26Sy8T/X59sUgYG
 tjo4Fj80BsHyIafNNfOb0w22vHbG4cZD8X8jepqyFtdLp37VVwrevV2/JvCPiiTtjHPOg+ri6dr
 r8GFXOEBevYXM3Tp33/EYqX3LnlHInDWEBs+h/xIc07T2dhY7Cnrk9UR6plUACP/SGExqW6WQ/C
 GzrXqE6CKJtQj17b2+JVQx86Pp3oGL8qWLYb/LRvxBSWToyvdV/AiO0lM6AGC0w2G9AmMPSmLaU
 wgjZzda08wMyqP69ZTIFxF6p/BfzFFs2YfTkJVkXWbabufOdpUge8DvcogK28i1+9GZOJ91b3vF
 Qp0mPc8SxX8wEb2ne0kQ2TMZF9oXaw==
X-Proofpoint-ORIG-GUID: MnbnqqoEzRIKCwGoEaVs-kQP5gk59eK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170149

On Mon, Nov 17, 2025 at 06:17:53PM +0100, Barnabás Czémán wrote:
> Add missing MDSS reset can be found on MSM8917 and MSM8937.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/clk/qcom/gcc-msm8917.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

