Return-Path: <linux-arm-msm+bounces-54396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB8A89AE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B245C188EB3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05D12918FB;
	Tue, 15 Apr 2025 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMeFbnt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3E828BABD
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713901; cv=none; b=sHXYzI6l8/FkYuh55dvbwYvGLaeiQ0JEJf4AuVGAAxR555k6G9meK+0zPaq24PfL2JUQs9nWNLa7xdHkJCwChGlc4ZGnBwn65XF93eaXvF6kxnHl3DxSrz7Mj/2nBWQ4Tp6mWArKO5wvJTzQaaPPEiaXQgBFM8SvZpEBMS8+xkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713901; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jli56diRf4Wg6ODiCJ26hg/ozs+C/GwMRzWa2B/FDIuTG6vSCpIDMq/Lr/CNGh3qnFTRQkHn16sQfHszFjCPE4vFXycfsRIw8v80PlyHzjG6u4qKvU5WZ5egKOy1jNTTV4mdpT5dQMkwLQJka1vRIKsm8AHYUZNRfbZlVo8Au6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMeFbnt3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tCjC025066
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=pMeFbnt32lnnj0vP
	H34ihe71wSeETvhoL3IsG7SWC0VRcO+5fg+sXG7qzo13DuqvEN2LBdTWer+D1jvp
	YnRdPpgvzcR/2mRN1KrhvN6SoyMo3DwwyyV+hM+DsPtOzDc2Kg1drj/PkITugJic
	LLAm0hFcpczoHJWWdaOCK/w9oOlEGE1mcCo9sQqddV/xHOPSK8mKZvzNOhF3ztkw
	S1C+6iHrimkFO+Msmdo8WsN4VNJKb0AlMgbXfIX7T6Z3s+sBFuK66YJL/6GRfXzc
	f78esr0GWYnDdEHrM0d2YWU+D89Z++Q4eSTUMTTL92LgcKo1qagHIIOgpbPiFby8
	OeQfqQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wfqp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:44:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso9630436d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713898; x=1745318698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=b1gCIu3ghsxkH+Ot3z+6mQZ15fTKfml+VhQjUfziuzFDpc9Wh3AyrkvPBa6uLW7Xt+
         xZyhr+EAGyviY0/GOgFCydFAq1CXXvjmvPPL67OeqcyJxpRnlKQV/eFcB88XNHNcPoZo
         kbEB1L8OX8b+8sd+92Q1ZZ5glKG/C52V2yPAH8SICJXAwZO0eM/+X2wqKhLDlbDvyhPw
         5K72aKQyJRivqVTPv/VqbvG5kLifD89jXu9odIHgN10kex+K4Ui6Slscip5bq9MRCwbW
         +3SIjAiglvfwVVPI6wxvfB3tmrazby8X+K8VHxKsnS+0rbZwntVxlsWQHf0yMIYPEnWn
         n7/w==
X-Gm-Message-State: AOJu0YzCkoXDXde+3J1ugGGYIR5NRXGIpAZ74SthBCIMCRg88NEUHIdV
	h/nBMnX6lR2syS7n/UlEk1B3tadRvxGIDExJ9CNWlyH1ArxPFntSJOB9Xuh0qYsA6MILF4O5BmC
	gKeuI4WhbYBIUiLuDQrBH3Va7pfwtT1Qa9d9deCUw6PoXBwx6u8BvIxjnPChtVH23
X-Gm-Gg: ASbGncsKfG36J/FStff4sMW5mx4Y1c4Fy9XLyOHCBv7nddPbX8uFAkQMjefqre3+pFh
	shen0hlwNcebMca0+SSpUsxpsvqggKGS2i5DsSghq2+tpnRZHg1d/sfIsVWruWn0umaHIA4yLZ8
	JJupl99Mg5/vu0OUh2lTfplQ0z3u1QbnQsipuGD4OA/qYPmpR/FKDoU2qjLAU0HAmNJUInxGxbA
	bD5I8kIpu0LZHWdq/SYmxc/9pJAnluNQE8fwriNy5KTp1m8wexwrrH88tdmbL1f1dgS4CjP6GE+
	cJHSNZcpzHP89BktlBlm6neL5T+Np2gaeTHnADCJI7UsPsgrHK7PSNwn1ICTtzZCfWo=
X-Received: by 2002:a05:6214:246b:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6f230d18871mr84861156d6.5.1744713898117;
        Tue, 15 Apr 2025 03:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWjE3rxosDAaBYHj/n49YNo/dkw+fdrl5yjfHpAwmGkIM1ZRIcw3C7w29LjvZy2ytndK/rjw==
X-Received: by 2002:a05:6214:246b:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6f230d18871mr84860996d6.5.1744713897734;
        Tue, 15 Apr 2025 03:44:57 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3553sm1073378566b.29.2025.04.15.03.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:44:57 -0700 (PDT)
Message-ID: <af4205e8-e325-4c97-8061-8a5c1bc4a37e@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:44:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] arm64: dts: qcom: sdm845: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-11-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-11-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fe38aa cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: mYElKwL57lthCusveSf_kP19mF3tNNoU
X-Proofpoint-GUID: mYElKwL57lthCusveSf_kP19mF3tNNoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=630 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

