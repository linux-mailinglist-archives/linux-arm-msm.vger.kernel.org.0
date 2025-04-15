Return-Path: <linux-arm-msm+bounces-54402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83074A89B02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93C6016A2CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C8B28A1DE;
	Tue, 15 Apr 2025 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNOyiD2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CAB28E61D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714004; cv=none; b=LJCmkfBeMy1oUD9yYXUXuqqQY7ahLiBgMHdhkFqxGKnatx5zTeU+jXUwKCQitfgFvVzU43s1uYJthhu/HgbccH620NNX3YXtrFs872G0nyojL4spSyLXU7jHyqKAQaoQYllaDLu0SgSf05bi5pW3hyhtAOx6bPZeaecZd6kEmm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714004; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tv4yscMbyPJMxZ1RylUEPdCiAU2oOaIXlu9BThNJESX0XF5x86Q+6/B3SOor/axrBLMJFFVoJs1n8AWEpgd2nzcfk6P7GIC1hdUK78KJsqXHhb2VC2NyxCnDeUhbh8dXjjFp3KImb/qM5vO2/3sSB9XTcP27wYrDgeVmDryXpKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNOyiD2h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tvej025669
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=iNOyiD2hcr2hg96M
	9ASFPpBDQw1ipz6v9Qr8PRWugoiyrQwaM/Iw0KISVqHDi50wO5FRkGIIEl9UrhI+
	FEathVDNtemddjQh/4ks73KvYMIZqrzTZoDroSuo29AC/vZK9dd0GMQ1kmgEWNe/
	LZoldtYNU7AYXGdZJnSAGOkQOlr2DN+Q1NTHtR8X3cocd7QFyWkNrwjp/Uj8gsjG
	qD+3CvES1g2eUYQ7j6/eNX+CjIyPdgcWC2icr8vMjQwBbheHc3Za8x6RiWHmGLt3
	ERXojj2KBLkInbU29qYssg+whx52WjXLxSSGfUXGkDAQzhkP/+XSWBu46sJp9wwH
	Es72zg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69qs4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:46:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ece59c3108so11945066d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714001; x=1745318801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=r2/nnM4toR1lZHRqvbMcLEcLKAX3yZqb1S6Rf7b1n82WesDxjudVvUF9WJ32+G0Jlj
         8w6XdJPfDmB5O0tx2Ahz4mysMgGN4XkryrbnSkgv4EIBvMtKqFYfxlU5dzxH3npX/++r
         uoZ8wDDvYkujFwd8HTnG0OTxoQ/QntKwEtkKvyX0SAPpdGdvsKQTSUvlUBkf2mtvJ0du
         H307NdIBRIhqbxIm4BEzvx4rw2gbwuL9bqsYGbKaEIaDgbluHcTBD3y5DJrOhu8iSnzd
         n08FM86Y2IOEzQguYwoYDnZ9+80n9yHu5bF/z91NLGhSuuxIiEDjW+OA4f9EBnh6vDxi
         4ZJQ==
X-Gm-Message-State: AOJu0YyQarZ7ar+zdITMlwSk/3ol9y6qgKNYRlVAxBNsoPZHvgmhR9F9
	RPrkCfyhIzsZxkqFgl9sKohVrh9mSQIveqa0Oha3OMVYHT+iVTH/q4y1CzN5VBvCQbUHnq4VIqz
	nU/oCUOAr5WNGOYIfKcg+lqmKFnkny0ldfkHcOq1R2V2EBbMCz0DczGQzQfJqJgl2
X-Gm-Gg: ASbGncsFqxBlqEpNBcHmAHCMRN7HhaDYApYFIpL/JeAsgcc/+8B5NzlP/1Zp+A1dhlQ
	CSQH65EBQcY/Z/UYwmD6mrgJWQy9TWIJq3Eb8u4EjdlGY54a+J1kYFmfq3m6umo2dyM1ceY9FD3
	eNpfbXoSgOmdkbYW3JeABVY52brk8zDgfMeAwqrX95K7XhaQg6Yigu26YJ5VjIjjwgmPnn8DNqo
	la9rEIypNH+td2/D1iHLmll28jygQb775GsjJ0WBaTV4HZhs8ftslK9g0lVx+vaqrwQg5qJok51
	g7Yjib5YOiqvXPffE1Mz7Y84MFK5RKn7R9VbrfjbTSINcRWXD0RwvhoUWoYoLtmVFu0=
X-Received: by 2002:a05:620a:f11:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7c7af1ce7femr829327285a.13.1744714000780;
        Tue, 15 Apr 2025 03:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpAmwVNPIZNpwFLppeLrZ6G4WDCaUdR1j/80hoWD/jnnrt5XLNcypB+fTpoqwlb3p2ynN2AA==
X-Received: by 2002:a05:620a:f11:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7c7af1ce7femr829326085a.13.1744714000450;
        Tue, 15 Apr 2025 03:46:40 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f505744sm6614359a12.57.2025.04.15.03.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:46:40 -0700 (PDT)
Message-ID: <99e9b4ec-b19b-4332-ba2f-6f932e4a646b@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:46:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] arm64: dts: qcom: sm8350: use correct size for VBIF
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
 <20250415-drm-msm-dts-fixes-v1-17-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-17-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n6gj-tJdHJxRpOdlYooeCOHMDEiylLOF
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fe3911 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: n6gj-tJdHJxRpOdlYooeCOHMDEiylLOF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=630 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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

