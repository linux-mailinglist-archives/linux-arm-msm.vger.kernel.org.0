Return-Path: <linux-arm-msm+bounces-56477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9335AA6F9B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 905FB1BC4C38
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 10:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6681423C4FA;
	Fri,  2 May 2025 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1Gai6KP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAE623C4E4
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746181801; cv=none; b=fy3dG1tL32C77QHlyInOx+d1cAOGQ9qhsNfYCQs3dPTNTbRMjKQJRlhFXEVkSPkFAR8V3bNaXt6lpsGrFfYRqbFl6U+4t/adl4ZnaSiESt0yZ5GzX57dxUvYwz/F7LfOYhM7A8supblNEpaxyRv40/PpuvBcnzIovpwLyUTtwFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746181801; c=relaxed/simple;
	bh=i7lDDRucUlwhNKwX/fbh3u9h2y2t42fMvoTgrZxh8fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EifgVQg7gYXQKKBDF7CZULJFGTo/ki000jK4N71dA5V05kRT5Cki/5FzEguuyITCvlCJXfXEbIsJjF0HI+JgF8CIbwJsUW7/jcCQFiHuQ2jazq7vTymKSI6V4CIdrM3fhmaHIwUWPF7Vp9x86m/rOfmGuT5hXOFVB8TeZP26GKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1Gai6KP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NLrc010409
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 10:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Dn7fvn/GQzMSROH7cCLUoBJLbxJJYWAddOeCioJDak=; b=l1Gai6KPbjpr7o5J
	Hr3ZMqRKavmSUhCNa2QUgclx25l+PA+ZDkUUwmSv/bpX6CkpPUdOCmNuFbM3jLYC
	nqpoJL86ruqNcxZs3JGPm9deAxexS9Xuy/SV9HuXQWQiG5uKQyWKapWrxJ9QFpPy
	ZDY+c8jG6YBlQf0eAiKPYzR1BuKr+MIF3yr+uJWajlMla4WlMMXx5H8FrpB60d/o
	DMn/q2rqb0V274gBVqH+aO3DM+MeXx7sxSUBkBlErL/wDKT3NrcPbwxWaMJZ3IsL
	UpbjTuMX519ima7NKU+H61fuSuCDhSqyCV4AWspkRQWHx0ClM5WPYbBCYscuTzKO
	4DtUhQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubr1bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 10:29:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f3c21043so4478396d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 03:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746181798; x=1746786598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Dn7fvn/GQzMSROH7cCLUoBJLbxJJYWAddOeCioJDak=;
        b=k8hftNkkc0hZlQ5v/UD9bfQ8JvRKn70I1gMdLA6t3jaUAmr1RyEPPO8x0/t197bt03
         HuHg+x+tRzzDBxrKuKZ24wew2+Az2LeRABEWpW6ZQQp2/moTut7Tu72U/ia3XWogURXx
         KuaKY/vnGZhhf6++OYiiY9/wpCU/AqAa3EVP1U+Y1pWZtm9ByAUsCKvSK1of2atLXwyh
         Ak1V+8jWH8QNI420tXlGfKWCPCcdEZqdD95HhSOnloDHVnJdsrYmww4nOihuYDII31Mu
         P6IIrrmAyPuriUtWapyNdgW3yUmsNrMEIeXY84XxjIzWeYV3I79EpBFvrq8ajdU5CzVs
         6g9Q==
X-Gm-Message-State: AOJu0YyB7uwGSz4QX3AKXydZkkjW/W2kVMAOeKd5Nkch2prCzGcdWIHL
	LXLwiHvIJON9y7QtCtcM3fcxUwqOHrppjgeuYmFO55rgP2NQXleVwe7LVNF5tz2beRv3QZ06sdp
	CBDUVjMdqGjgEglOajJqrdyfaQBHq/3weGAyL+5qAQmrnmTH8P4dDKAxA+7ijo7qH
X-Gm-Gg: ASbGncv5fyL+7KDI0wlpzIT2iUdb8v2Q9dsm4Cl2zJRJNGuXAkaOS/cW7obOewJjJVG
	46KoLPDMeGfsWCi9yZ1uH5uEwjLn0ziq9XB6dCeBBBa0C5KapSeKLXON5W+IrOfMIkY16ZLhyC1
	y3ir/k+6IwapAW/HsJ5KsHwN88xGxOezBvtY2BIDcWL7q+YA0aYOc7SeRA++bi95ebRwr38Tg77
	s0XnCL+yXgdrV0Q7o3Egl3XIZp+UAet4Hex0XVq5bhN+QzurSgUIBxzVUsMZF/LLGpKwRiGHL6K
	XfHvSXJAPc2fLTK6IhM+AogRjNaAqBilBGj5KarHRJedmem7KxqcYDm3kPcEx0wsAlI=
X-Received: by 2002:ac8:7f8f:0:b0:472:15be:54ad with SMTP id d75a77b69052e-48c32ebec71mr11930191cf.14.1746181797951;
        Fri, 02 May 2025 03:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExpZCizKsiNGnAZGjO17fHH8yFM+oPe1mErUD+l8Dx92sb7vZcW1igq+h+lNhd+1RWdEMubQ==
X-Received: by 2002:ac8:7f8f:0:b0:472:15be:54ad with SMTP id d75a77b69052e-48c32ebec71mr11930041cf.14.1746181797657;
        Fri, 02 May 2025 03:29:57 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914731dsm29461266b.28.2025.05.02.03.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 03:29:57 -0700 (PDT)
Message-ID: <1435b068-3bb9-4285-8399-81fc278152c4@oss.qualcomm.com>
Date: Fri, 2 May 2025 12:29:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: ipq5018: mark XO clock as critical
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-2-27902c1c4071@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-2-27902c1c4071@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 70yCn1s5MqgurZaEIG8FKUd3keDnj8A_
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68149ea6 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=N5ds6sLAiLYF8mbRe1EA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4MiBTYWx0ZWRfX6iASQ4FS8VIM BZRrRPD38nYGcJRLfVO5ZYR1tPV/el74HL9xp9vtQVaGGPumTdmYQuM13PluoSeW+rEvlorLlKE W9fsHZ73K1VBYTVrE232hH1OWLp6J4gJaCGYE18+qTF309us18KTlxzbiXT7sdhXubFII0+9KAF
 7M3lPlbA7fjp0wQksheS+aqbhMmzYq174bIptCk7oMpNsbKCmszS9Rt0o8RdhcUHX1aeXJ/ow1I QJY1iqUzg/gDRVtG7Ph6wlTnIOs1+xCkyPTfjA2S6mCom4fXJFC3CeYnr38Qvgs6zsspJHlxbha T/6GMKrLMhk3fJfgSQxN/1Bnt9PlQqIX616oOqW6BRCm2DwW0VNZiMHNBy2w/5MfzzIwPV0bJSt
 qH7mcgi9xt+ha24LrOaUP9DwxKl6b8lPZ7yEVsxMlO8sLnAgcuS3Gtz3tpoEDXief4nJM83x
X-Proofpoint-ORIG-GUID: 70yCn1s5MqgurZaEIG8FKUd3keDnj8A_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020082

On 5/2/25 12:15 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO clock must not be disabled, so let's add the CLK_IS_CRITICAL
> flag to avoid the kernel trying to disable the XO clock (when parenting
> it under the CMN PLL reference clock), else the kernel will panic and
> the following message will appear in the kernel logs:

Remove the struct definition for this clock (and the assignment in
blah_blah_clks[]) and replace it with:

qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */

Konrad

