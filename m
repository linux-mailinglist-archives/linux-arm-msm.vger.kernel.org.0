Return-Path: <linux-arm-msm+bounces-64056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2635AFCD5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F112A565BC4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C5B2DFA37;
	Tue,  8 Jul 2025 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJNiH6ms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA8B2DFA48
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984511; cv=none; b=CP0zevA5GGVzruYhZhkT+B5yNAqPro78b+uFeHUlozgIDI6qJnZ+oo+MYapRBAdX5QV9j0gtNyJo6RXcRnuOAt1zGOpLXdDSM6F2CuDWmQUC+xQvwDB0R0lA/fOOY3hPa+v8Dru2a2LETkw4koRuFNV9lA8TeW5dXFfEUtDv+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984511; c=relaxed/simple;
	bh=ugicuqbU1yS1yCvIzcXqiNr1oJADRuqRGHGqN3D/WO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPnc6ne99bBkWfoLewft0GKBGo/bbvj+uwsy8Zs14OZ+I4tghvc73AzAJIL6lwu8Fs3ivn3CzGlq6OdhFv9AfLubDo21ai9WmI75OfMQrlx1PAr+WTmgUqpiLIx4l/PwdZ4T7BObr4lp4lIo7Uu39MeSE/mmA6eI6DEjuyLyQzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJNiH6ms; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAPM8012161
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 14:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQuSWDFSA70+qgC1klmaXdIjk5aF+kYMGvQICocunPY=; b=VJNiH6msDsbeHFjP
	arrXtXidBm25fdeM4YcJHLNIyGmR7XnmoqRc9hBsAn7CkUhaTwCLwZ6aC+yoISAL
	wF1FjBMxUMZD7emboQbEXQntcoDRckVcu2NP0wpkYUATws3tLkXjioqoTsA8ifcD
	lHkVqDtktdh234urapuag2baC/pTgIQ9MB9JcNCbrnLVOx84YDkG0V9hROY7OKtD
	mH7Da0KcMpVaEz6tfVvBgL7xACd0KuRHqzSlyL958zJtQVtPG4T9RbVi1hCfKuoG
	UREriNUvwiEDVRdpzWGmTm4WhL0S2bFz5FZIrrfF8FDMm0W3lFrQeie51jlPSjSu
	a2MZPQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97p0wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 14:21:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6facde431b2so15472246d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 07:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984508; x=1752589308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQuSWDFSA70+qgC1klmaXdIjk5aF+kYMGvQICocunPY=;
        b=T132Z2Z2jssscmDvrtLXhVNLCxqZkkRGLQLfWXvDoU512gFQOPUsPmR16tMeWY1HFC
         8IqsOIhgs0qqiNZac3r7XXgkCppScZYDMcR8abT8kA7qJZ4qGJDIsfA5AoONVUQTzQFl
         qa+imQZpR2SXTTzHhE502eCyu67ltgh5BmhnW92UPoBACkZu74N1F+gL0fThsNqJnLv+
         82dTHzEB1JqH5n+BUSMTknDSmXs6Q0ntYPKlQ/y1oB/Kt9bzQCw6nOtQAV9D8FwRevPI
         jPNX224GPW9pqKfWQB/Uof3Gy5nzBU55flxORCY8iuoOLtH1ZNcai4d/42aRjE4ZO27x
         j1/g==
X-Gm-Message-State: AOJu0Yy/oivlY/YI37Z2aNGmieztKThMpJ8Q4Q2KkYJYVa2UnAFZL0ce
	E/aNhaMO2ZWAm3DnDzA7C+gjmiYxGCUWKbMWsmV1fgHDe5gKbo/8JfxMdrWxjGmfmqbFP3ZF0yS
	cTKaQWzkjIi/8i4ATv5ygoHkob5kGyKakTV+2vqC0YLxI/vD1ZdTMTpzZYf6sWZXDNTUy
X-Gm-Gg: ASbGncvmUA8sjNyi8vl/jINtTgWoArRWDkucCaDWG13IsDVNbokRS7aNai4tg79Q4YY
	xvtPXUFWE6C4hCM1Nypj8c444AzNgnmXFWQKeQSDf98017YlOME6xHsEKz1cItJaPdY/PmxRG2V
	MrCTyvVtErvPglyUhYscnfwcgHpYaQ/dslMW369dYKrNlvoBKLT7UJs6iTnSSKP6E8zwQInX85+
	7Dodbe1nnWBuSmJmxg33KecBmbWJBjTRNJ48vGqr3UqAqPh0t7qOoeN0tu+PhoyAJubVO1WhO2/
	U/OcZu2qz884m2drfVKZkz8DC+bkmgQ0f0zbeyKD4ofrdiJrA5DGItyq8x5aKS7MN/Xk0W1h/5U
	itQ8=
X-Received: by 2002:ac8:5813:0:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4a997874756mr89452171cf.10.1751984507342;
        Tue, 08 Jul 2025 07:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdN7Ey91h929pRUN3VOhjB4VPDzQq/iGbSnqJOc5DJSrf1PKUFAopp+cxtucXt0oKQalORIw==
X-Received: by 2002:ac8:5813:0:b0:4a5:aaeb:dce2 with SMTP id d75a77b69052e-4a997874756mr89452011cf.10.1751984506884;
        Tue, 08 Jul 2025 07:21:46 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e86fsm905004066b.147.2025.07.08.07.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:21:46 -0700 (PDT)
Message-ID: <ea030c64-61d9-44e4-b4de-eddd626dffd6@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 16:21:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: ipq5332: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
 <20250708-imem-v2-6-692eb92b228e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708-imem-v2-6-692eb92b228e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686d297d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=owAxAYLDMf__z6yt7SIA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEyMCBTYWx0ZWRfXwLNoxh++R2Cg
 K9PBuu0OgOC5UXf5qAfeRttdaD7H5JebLDj31jWyu8zrt+VDB9bVn0gLrqHzId6NF9+as/zRuJ1
 ysz6u6AX/grqJ1BTURiUnz0qleK8CrR2ywLAdPVLkqh7vzz3/CtfTDQYHF+tFWbwN+/6yJngS+5
 RthnjfAN7E9cp3QkiyfBG1y12k2RMl8jk1vFj7t2wP91AdZq8WJZWfY6oXF15VMkLCHjMAI9IBV
 XrVrr4fW/Lg2XDDVV9XgIwgq06dxxmspZ63n9u+dDiP4fHEtHJPsMJ+RI1oEOeMhhDrJZLLRtos
 OLOq3U4LcOhi+3A/asXrWrezCOexODly6bd/+GRH6Ez6kj9/0UXtkaoIy8w1oKHDFQictHW8q0J
 7FjaEw38SiiM6aLV8RNHFZ0GsKGcgYDeuj0SccmzQqzz+R/KyHm+wuwImR6kzt6CNF/49qmv
X-Proofpoint-GUID: MlWIF0NpkGh8TZNT35hHoPKB1OWPQZ5Z
X-Proofpoint-ORIG-GUID: MlWIF0NpkGh8TZNT35hHoPKB1OWPQZ5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=743 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080120

On 7/8/25 7:39 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 80KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

