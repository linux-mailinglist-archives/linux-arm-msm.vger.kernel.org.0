Return-Path: <linux-arm-msm+bounces-59206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD326AC214B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77EA916FBA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99782288E3;
	Fri, 23 May 2025 10:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtQOc04z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA92222596
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996959; cv=none; b=YNMeWG7Xz78tZfh7ZFaed4c3Vnk8LQcY5OoDFHW8Bh+z5q9RvFDXRMgG7tJqOr0+DgPIyyURTMCkaE9dX7enURNpa/awDa6eGZF6QAxMYI9+RbTuN45iViVm3+p515giOadfOKHe20F4fi1fw8kbH63NpAlfYGsql084VQuRGX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996959; c=relaxed/simple;
	bh=Aub7nJftHukwBbwiYgLc+aHj347EHiUJZNm3GCykWa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qz3ReNpB709mptUZoiRQ4kQbj5tP2+acO3ZbEHssSjfVHs8rvQzyBNman2eUAEert4bNuGLOgmK3o0luOGQ6qtR4iymlkGTc5TjleRtItjRTz69CAiMRheRCV0hmIAJ1zZRyJAERpR81ULdICQxMqDgE9L8iI+UNRn0BgkqMphM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtQOc04z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N5S2gG016524
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FRSaRuNm72osxO4JsuapvVqs3dp/fnl7OJ+B9n0bvko=; b=YtQOc04zXKASao4W
	BSKOthmHdyYLvR6rqQId4kH7quBqm/KPMSJrnjUEznR4AkpNYztHTd2um4xwdEq8
	tT1nxcI10rgfIlsASLzVnYUkjNww9cyfFs7KicPb1aisBuFO5IT7g6DdTLi7bBpn
	hGbDYVns2Bkq3aBmMGbZnkbxuVwIb7RJG+Cs8q6jYjXx8FBJCEfIFl33f3gG+JH/
	jxk+s4GUM3rBJ+YsIVa/qXJz7OTgL9z5Vki6FGLGdlvHMYkBV2szOA2pxfWNJSNW
	1JOnSAdUupGERZw6lnA8p2s0IRLRC+YFGYHNDgTdirytzI1OxNur6aaEOZi9hyR1
	O8OjBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa1sbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:42:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so242325985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 03:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747996956; x=1748601756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRSaRuNm72osxO4JsuapvVqs3dp/fnl7OJ+B9n0bvko=;
        b=BylDj0jbr3qBRqaEE84vg56Zccr17ufx5YEsiFpUUhFnzm7mXpYwLKaJ66FtcCvA+i
         s3YLQBnUlyQyLUUlFq/GEoqwdUXylyANAcV/Jt3SRtBk5SaIt+kEEkdomB88pbU8XKWF
         CqLKv33BkSoVPU1w5Xee0ISQklIHOTYWjdyEm2J6pSPCG5A3+qI/CtA5UfF/GgqaHwft
         oyC2Q/iX/EjOmIvwzdLPm/hnTQtBDWGiWc/JS6yK5FKaI+5JTcxunhIAITR/nh6EJuIb
         DZHoC4DEnNF+Z4funC0bNv8KvpLITfI+D8SP0pRxVUl1qZCYQRL6kLLJRD1L1nPwAnH1
         JDtQ==
X-Gm-Message-State: AOJu0Yy7zHUoxErBYJoU3tmccM0P6QnxrvWwFydx9meinhbPg6fgSnTf
	66wy+3ZrXwuRArneAbNTzs6S+K5kt0dQZEpXxOcGOAO10zF/0hyRlD9CMjY/h1dVoC0xgFh1nPl
	HhveSXv61K5Ff5CfGEQr2IbnGCfSI+J0AaWHgVIRqlzyAjb7ie/K0yTFYBrcORfr0xzqq
X-Gm-Gg: ASbGncv0DW6tdnhPqOBFT1+qd+WgImyFBIh+qSeWidphVOGOXX2rg4G4ejOO3xVVD1P
	LS0bVHRmYTGYe074JJg+NoUTXINViEozUYCOXZaU5m3DQru0CL9rNP/3tcvMioSBW5HotWVhowV
	Wybp5ZIti7XC+1MWKPVd/jnNotF1/IdoDSBg6tSv8IHfsuEriE8Uexs+eh+heo6e14K/3G8yhvo
	h+kX5LW0Fp4FZDhShPZ8byazXLNlmV38G720fSvlW8pnry6lSQhhv/bMVx38BMtJE+y6oNKIeVq
	cPoC27NaANYFngkl5DLtIYlpq3lGY1nCzANSXbaVhVRRIJCDtOgNOETbtlIVdmZxJw==
X-Received: by 2002:ac8:5dd0:0:b0:472:e32:3fa7 with SMTP id d75a77b69052e-49e31aaa483mr13085211cf.15.1747996956189;
        Fri, 23 May 2025 03:42:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHagPFlynAk3FNNsBGniFLQSLGKrz+h8ngLRBYab799rOtOx9i60SREqYxm56Hb6M/zcQ0pgA==
X-Received: by 2002:ac8:5dd0:0:b0:472:e32:3fa7 with SMTP id d75a77b69052e-49e31aaa483mr13085031cf.15.1747996955724;
        Fri, 23 May 2025 03:42:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d49889asm1224027666b.141.2025.05.23.03.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:42:35 -0700 (PDT)
Message-ID: <b8b43344-0b8a-4e76-a8b9-1a1e2b354f4b@oss.qualcomm.com>
Date: Fri, 23 May 2025 12:42:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: enable camcc clock
 controller by default
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250523092313.2625421-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250523092313.2625421-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6830511c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=QrxyFXYMqUdT4-5Nm-QA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YTWTWxp7Qo1iJIgShhbaBqB0UDWXPkQ2
X-Proofpoint-GUID: YTWTWxp7Qo1iJIgShhbaBqB0UDWXPkQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NSBTYWx0ZWRfX6ljBA3173m56
 gFmCDaalgg7uWupuP4+9NicEEiKjimbEH4DHkhcMA9aB03GMVrcKGl/rnBQyZyZfPyZ4sT3Zw6Y
 7W/SJFlMQKEBhYViiTOjEI246n+D4TsbFRryCwX/1ZB0iNkrGZ0bgpOoO2NrO5CQffLjKu0aY1g
 CVmsy94XNtuVkveGqIZiepmvN8AZ7vURr7uLARGv9i+zXzPfIRJaaEzSn7uqRFFoNxqbMIei5Db
 H+cNtVdC9QgsnWpIWQz+t+10WEyX3ySj5t+p0kISvgLmxgEpJpWuSzxmJkUSx5x+RB0OoWRZk+h
 zWgSSTYZiLn27TG3+r8+MXB6GbQ00MdOWjBKLWQ7tAP0qdmei08mOuRxjKTMameVmYL/c0pJvHq
 ab5eC3rIS4cdHW2qNDAp1Awr8FXs8OeN+Dp0H9B9vQnnJlzHrsJyUVYEt/vi+PzpI5TE0uWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=976 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230095

On 5/23/25 11:23 AM, Vladimir Zapolskiy wrote:
> Enable camera clock controller on all Qualcomm SM8250 derived boards
> by default due to the established agreement of having all clock
> controllers enabled.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

No reason for it to be 2 patches but redoing it would be clearly
wasted time

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

