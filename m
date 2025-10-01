Return-Path: <linux-arm-msm+bounces-75641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2A4BAF9C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C468A7AC1B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E7828136C;
	Wed,  1 Oct 2025 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPeC22l3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9972327B35D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307206; cv=none; b=OWhCZcQk+O/F1YrgnNpPSMtbbDvbAS4r9adMHzlLURLyqZQfamFRLmE7Gisj9R5R8ZJETt7ZrfIi8DIaCmpwZvKmo8QLWAm6F1zVTAUjarHyLdwuBvuRfa9T5yvFJkKCndz01ayk1BB7zl6RAobISsqz5T/PpyYrfZEgLsIl60M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307206; c=relaxed/simple;
	bh=YO6u26nFzlPOkPOOXGthr8BF1ZfQylY9VojhkWegnB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZY9gShhnS5oLjmT0AIPFbIaUEVljLm56kjOpra3WCdi2H8lxR2pAxJ+U7GEu2y0wclnFfIvZAzo+cmUEgdTgvHSJR1rPPxL8ZQEd9Wfed+rI81wWv2vHS/D9fsF0NZqpTSeu9Rlwbcjc3uwoluX2FRlPg68f9tf3x1OMYxFzbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPeC22l3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917Kp4S021334
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlCMGBeTBT6Wlu0Hvmm3aAKB1BK/Vj2tfJ0fRSaoa2U=; b=cPeC22l37gZgPeGa
	oPnbj1Yq4shDQsFs+3DjmuycIEK94gGCXqcYbBluNgA/dyKETdYShxoWUoxbpNSF
	3zO9XsXzrWaaqF0l/kn/7ppPuwOmT4r2OCHXPr/NyqIHhsReMbrAiaiY3ydKhv22
	/V4Wd99EEOBBf+bkXVyvVeIwBTa1PwXoSXFejBsLfjVvWwGDfnsK0rVAPxmB80lK
	SCaMhFzhuDKtL6PLr2D2DusSi91vTIVwQU581Tf2R39h5QdDqBg8EUjzA/szmxFa
	dG1yl7jxnGQNyfLFCAsldjaJ6FtVoEXV7px3yfdJYCaaDxyL33W4w0v/q7pWmVvo
	h41Vjg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu18586-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:26:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4deb3bf6b2dso14909601cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307202; x=1759912002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlCMGBeTBT6Wlu0Hvmm3aAKB1BK/Vj2tfJ0fRSaoa2U=;
        b=dWrgPlEzdVe33PwHWGV6pKZR+B7AZgQbu/2UXNCb/IEvKXywUggxU32IbC92CQGVji
         VhrpehQenHGFcglBK1LBQuF/JySEBLh+DwU73/IQodBP5kuhNz0HCG1FY4do9FzqF3B6
         HaE9Tbjd8+C5yM3bAvtTr+BmnQJD8DRLQ1l5zPFT81G1GnblDZrWdHDNb5ewestIAp5K
         YYP9lg3EleKbvVCGOWIA7plEh/tlqxrrzWcsNY/8LSs/zdfyBIM0i+JLyHDyZLR8YUXT
         gqK3kW3YpaGEYtzhuNExT4z9uxTnN1rvpSs84faH9pz8vQuyu/OvvmQbz5qVOTb/Iqi4
         sQkg==
X-Forwarded-Encrypted: i=1; AJvYcCV60LSvQOwLF6aTAETar7omKIos4iWuyeyNh7LmsmTbjlw0O3d6zBqG5J6PQCz+R7oYP5Xx1ojjxQWcxnaQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv3pz6xXa9WOY/km3B9K8lnJwcXBvdpckFuC7LvbwgJVZWZBRG
	rDtNKLlQl34LlWDk/SgOOoqz5TW2As4ufGrcSOwe0u38J146lGFYJ0n92N4H7Iocz7gXHwLMkuj
	lkd3rUiEBnq1iiMJVPTwD8MtNd0BWPNEucBLvPr6MXQWFO7EYx+OmbLVIZvPfkEFwQtpU
X-Gm-Gg: ASbGncv1eLTYrNXicpYm9g1PBDQzpmpl/9tJUh8NRA+KoaY/wtwPffzD+V01bM7KKK3
	MCXWGUczMjuvdqJdIiOTeAoQCcHrMFibEDz2ydItYvABweImRalaRjymXgljyBiLws2755/hJjC
	zzXBuAAkppr4OdaATL2LzglvI6BrLX+RUKvyNvQn9vkrGfBQdsSf5uDOrD+3sKW6Kt8P5DlxT/W
	qW4auWFJS8x8n3JEp1jXcB77e0BCxz3pwV6zeD5FAd/3WtO2YQJu2Yw6NGbclpvNuCzWtgtxsGS
	BOozdJHEzbdShBIM3ZWNBJ3vftkjmFWSoVwmyEBUV81x00EKSPGCI+9TrE2dykbnSwI2ok5B1lv
	LyOgBFRPg9czy5KJErGmGjpAHJMg=
X-Received: by 2002:ac8:5842:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4e41c5460bemr23012061cf.4.1759307202147;
        Wed, 01 Oct 2025 01:26:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqJd90oNLdMpoZhb4jGAg5bwDcTi/Jv7Qcxlk9kT5t8J+o925AOCw315gte5BBxsiD/DLshA==
X-Received: by 2002:ac8:5842:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4e41c5460bemr23011991cf.4.1759307201702;
        Wed, 01 Oct 2025 01:26:41 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3df8c7aef1sm652456866b.11.2025.10.01.01.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:26:41 -0700 (PDT)
Message-ID: <687b4b99-287f-46f3-af07-76b49cf573c9@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:26:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: qcm6490-shift-otter: Remove thermal
 zone polling delays
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-2-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-2-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68dce5c3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=Q9X1YL7jsAXwpJAzmCoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TQZWkJv5rNK5-PaLMsrg:22
X-Proofpoint-ORIG-GUID: P5QYcTqbLVvMXANFZOe9pYlnMM7LIAHv
X-Proofpoint-GUID: P5QYcTqbLVvMXANFZOe9pYlnMM7LIAHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfXyW78dbTmdhrw
 9S1GEldDjmKZeSRS582v48so9klqJnZSOUvxoicxprGegQbsMEDVMh/LGUGnuZ0kK1LPGMwUX4V
 EZSkoPaaiWFQJhH9TBZDDZaEC8TiDsrwOxEEa1OaXpKTxege8RF9cksKhHrRnjnqbAYMe/TqdXq
 xzsJw8dVbRdP6X5zh+CsdMVYjJegkY9x245HIFBtR0/eJ3/IHRpauVqvFdrQdXs0xdFBiDt6vRN
 bcyXGn+BV8uVw6qTrGc3ULpaifQO07wFr3Kr0+uMmUF+fFnXaLvz4j5sP+JTUTPe9O+wd3OBz5H
 BsCzwzd5FP+8cyLioY/8TI8YZe9eb5dIcDEsP9Bmjt2oGCnvVO9VYFPXA16plhOrFeenkfZlIeS
 t7qctR/vouYYCiOGeYSQ5+ksDbSLpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> As with all other devices in commit 7747a49db7e5 ("arm64: dts: qcom:
> sc7280-*: Remove thermal zone polling delays"), apply the same change to
> this device.

Your passive delays are <0> too (which has been the default value if
absent for a while) - IIRC you don't need either if you just want
userland temperature reporting, but you may need/want it if you hook
up any cooling devices

Konrad

