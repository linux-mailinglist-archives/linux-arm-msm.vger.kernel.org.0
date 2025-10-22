Return-Path: <linux-arm-msm+bounces-78380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E6CBFD737
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39AD7565EE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A8A21FF38;
	Wed, 22 Oct 2025 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmDIOatO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5334B183
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151304; cv=none; b=DXHN4QGCsVg6SgzMzaH1siwbjB/vawW42ZDIv1O2IxSNXqiQF3rNL1rs39H4HGloK7mryI6tf1C2JTeylqG/LUWQ5VKQ+LidbtsswkFo3hhDXihez+8k4+n9doPe8GWyFyi10cRRbw/QZjAndicLxsEBtzyf76G1hy+nnwq1A6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151304; c=relaxed/simple;
	bh=dyBHWW2GuAfwvJ2oHoKOOFUrERxAVPMXWvg5OMsJz5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvrbU3trxUROxjfJlfMS4nlSQJiInJNVlBwKfgHnzmmKtAv6yl4LGrYD3POOYONuqZRlyiyfSDKzoztjGc93Su1IP27V4tUS+7hAp96gmQbIc4q4DiYvugT2SE9cpNe1kCrZ3Yicfv4xPNzOxJSEZ2bS0sCsQSpdq1LdVdX6anw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmDIOatO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAgPa9027006
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wP06UGSoKxrw415mfswkrKuCr9sYpruJ9sx77F40TyM=; b=CmDIOatOmKcwXZuh
	WrSaev0C1+B3KYa/kmaT+FKkNAAzbkD3a4BWbIO6dOlJRfF1eQCOvfCPZf4hoQMm
	7FVcimSL6b7ZVdk8rwvh8NfWD0w/bLYEltxaXNSGDxqFJ00ZYI8oEq9UxC4xPjF7
	yzuO6e2E/PPMXCraDBWv6KAgkUXNfJhLgsRJwh7tfE6rMsyDNRG3RyfhWnO9ppSR
	8+zkieSwzgK0SPKQTYshEUqq2PnHrsIfuRx6QHXN26eqXz8wuT4ALODrmHfCiRX4
	tF29jLmB8zckz/YAblYVXncWUYrZhithAIM4bKR0Gtm4B+ekyedu+i/TuTxj5JWB
	UXWieA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pnmfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:41:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8934ae68aso5688951cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761151300; x=1761756100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wP06UGSoKxrw415mfswkrKuCr9sYpruJ9sx77F40TyM=;
        b=jLstE12d0RlQwhLPUK86rMe+raNk8/xahjxmQSNXrpGBy/cgNLY0PxJWFaouxF7Tyw
         KwOOS/bdzXonB8QqPljB6/UNoWMZOFXHu1nx670UB54WZWb6pTWWyzhhTxQs5YwlA/9q
         LcgYYHlad4NpwkdaR/D/O04rewjRHqmNuTBW8He3XLDvE0CIPB+1o/yVJ5LLLeuQ3ZOe
         UjlmImEnwKTuFXYZTdJCo8oHJXTPwlT1jh6YKE3bhz8YnMiB7mTtngq36RFruS7oFknw
         xITjgxgGHzR9yUeiF5ck+uSIUKpazsifiKsabmDAp2YkjrRuG694dHN4XssPhmYCKhb0
         ooEw==
X-Forwarded-Encrypted: i=1; AJvYcCWWsAu4GLCV9kL3iNT3qFHSLhbOHl7XTqUNX5KHBnnh11CUaMcEJwqJ50FtaMrhKwIRk60l5ZihVupD+P0y@vger.kernel.org
X-Gm-Message-State: AOJu0YzdLGeHz654GxT7cOzMEpeBUjRsuAYL5+zSFmzm0sh9T70jK97+
	zQi8CHl/VwtwRRphz47AzPnLqd1xGhjybmEJy+RgiqlUAD6qK+n2vfjZ2H+s4X2eR7H5CpWRJQN
	F7NIFabcV7WVD2O1Z28OlJ6nZgS+yXEo/b9Sr0eGos5dqQh8gJ6J670RnrC5Mslh3/P5p
X-Gm-Gg: ASbGncsmISs4m5Qqh5vqO+PNcC6VuJ3JT5e4bJGx7suhQRS30GCP+9gr6Yg/z6nIO3I
	LtuMQ3rADrlBF/60HvydoD9hUdSi1R4xR0a8GuKm3UV00Rp8OM7CURw7XP2sDhEgq+9nHNynQR8
	1T77WxH++rWrjTQH2fUCcG8me0JEUvQuJsPsh/dgZccJ73xdTBcnWH/zwicV5Q+kkYIrxcBjMiY
	XqK6ssFL7o4aOsnAYxpfuH7TWBQxe8uOgqnVNJv7qPQhjvI+JGomAGiazhLkbyJkNkM8w3jkCzM
	hPiWRkX4rIzOV+rjcLZgWKcGzSKnzfYNPn/IDgI9Py+noY/4zJGzRk+1fF9UjX11Cu32ABnJcBB
	TjHuNVWdNIKH8cO/6okhvA6YYxJ1TT+c6OP/qccn1EUUtmaAG3rcu1BEj
X-Received: by 2002:ac8:5e51:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4e89d1f94eamr180584891cf.2.1761151300446;
        Wed, 22 Oct 2025 09:41:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTPhl/gCybkXFKJAiRPLwUPk3R3ErdJqsxNwT2SQ3vNYaOe1tbdKrzeN0wa+yAMUA0I+7AGA==
X-Received: by 2002:ac8:5e51:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4e89d1f94eamr180584611cf.2.1761151299934;
        Wed, 22 Oct 2025 09:41:39 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6aaf93a32asm934824166b.51.2025.10.22.09.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:41:39 -0700 (PDT)
Message-ID: <e4cf1f77-af38-4f36-a590-dc662fcdb602@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:41:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arch: arm64: dts: qcom: sdm845-starqltechn: fix
 max77705 interrupts
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250926-starqltechn-correct_max77705_nodes-v5-0-c6ab35165534@gmail.com>
 <20250926-starqltechn-correct_max77705_nodes-v5-2-c6ab35165534@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926-starqltechn-correct_max77705_nodes-v5-2-c6ab35165534@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX+g8gFxHQeTQE
 bh/S49Qumm3mA1PzsbqlsePW6JzgW975U9ReDPPUPsxPGFcSqX39eppzOPMNlHLritqu+WAZtnc
 2ApC4EgKM+pXPzfyfA16KyY1uT0noLVWcX6sGxJDyybwHvmhsNjCePT3Ob/jw38yct0m3ThcPla
 13sJZti5lu7UwCjK6d6btGQlbT/WIR45YWuNSMBbmefO06AA7GfJWgGPBlpz9FC0ljaG6/itXJB
 OF8kZh/p8z2A2iryqkBv7fn6xzkKzSRt1WPidi4zEHgDpBwkMXzyRl9+4aqTguUsmcY8nBqE6sv
 dywSHZTFGoWYCwpK0/ckdEk20QaU7BKXEsnHTyXaRWmeMJLrkOhErztv7npeivmpaN5FsDFbrjZ
 pNPkFH25wCCMkS8Ju3cWhmZoow54wA==
X-Proofpoint-GUID: niArdPjSpmqmNuYfRcUuXvLEZxjiAbuq
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f90945 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=5u1LwdSNXLj5JZSvkjkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: niArdPjSpmqmNuYfRcUuXvLEZxjiAbuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 9/26/25 7:13 PM, Dzmitry Sankouski wrote:
> Since max77705 has a register, which indicates interrupt source, it acts
> as an interrupt controller.
> 
> Direct MAX77705's subdevices to use the IC's internal interrupt
> controller, instead of listening to every interrupt fired by the
> chip towards the host device.
> 
> Fixes: 7a88a931d095 ("arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad



