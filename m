Return-Path: <linux-arm-msm+bounces-74577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C99AAB9962B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 12:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70C041B24473
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 10:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC5D2DC773;
	Wed, 24 Sep 2025 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ik7+eRtf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE512DC76B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758708797; cv=none; b=A9r81iksKY5mA+WfX00m4cRwd95JrqRrZzPWmZvnMP4C2IFHmS8L5LMsLS0oCGgazXbQRlnlmyL8r0NVvK6BwPn2/yVds6fO8mBMLBPGNqinZuAYr9ZXmlFuU1xLTTmUwMtiR3IJAZIt6FK7eGPeMCChXp3v/SqvzMnS2A323tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758708797; c=relaxed/simple;
	bh=RHKw7hwZP6Z9wppb8gbhEeW4NZ05XGx/+pJlAcbcLC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLscTS/3cL18p2S+vaIm5w3EY7j7WAx/waaTfYxxTgLf50nrWvWRzvqHv6toT0JwysCk/4eQ14/cenFQGNidW+kel8vPae7C0t7b58javC1rafcOsvxkFUGnJlLzDwexUqbUbFaUEk6poFDDd7yprHwmOy481GkcO2mTD2oW/pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ik7+eRtf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iIdG019926
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RHKw7hwZP6Z9wppb8gbhEeW4NZ05XGx/+pJlAcbcLC0=; b=Ik7+eRtffwR2dGrd
	hJVkbe63YQXTXWhUHgWYOrzbfBsqaG3v2PnBonrdAv/K21tPYCBTNkNIYs1BTFEe
	Dil8JJGHNNc+p/3yUKIU9+qMgOTMw10Q/iWmy5xVECttrXIir4JSuv4W+0hulbw1
	bufd908OnVKBLJviHm/yWqkpEnjxw0N2ZhgiV004JXDT3lp5rf34n7FigEgEKSJB
	7RGwQUQTcOK4adV4n0eUE8PgwUpwBzjOv0dBuYsnFLNOcJfc5CIRoVe4BypY58wW
	uFsnzk9+oSk9qbQEcDkOcunCYjQiRP/8JdnIFzPj9sl0LPTI80BFjDpGCw83QSqe
	xRNjfA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdw3fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:13:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4cad9f8f93dso8285531cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 03:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758708790; x=1759313590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHKw7hwZP6Z9wppb8gbhEeW4NZ05XGx/+pJlAcbcLC0=;
        b=WLkLUYrwimxLYufVVL1BsnYdYxHDZ702SonMN/LKHzpMjAtatY/yuOkVNjLM+OzLvU
         tUOVE/ZVthu+rUCVCJY/1KsZJxhas2ToHiBUHttlAw7f8HCe5fyDqgHHVdNlVcBFR05L
         pAUTAbvqggR8L+3vyk8qv8TfsEXSzaBKhO3hmS3VhU1039w1dmRl//zNQG4Id0BUlgTP
         qmB4U0d6NMriaVkHj5s1+deUC46Nd0CZ77hoWrqdaREKr9JaByWLIUlzhl3ZMBBrWl9v
         1EUwnu+vIo9GItxCXYFZf4hrZlrqut63DpvUhnwbEiVb0jUfEomI4OZIyCc4sjo1UbNb
         az0w==
X-Gm-Message-State: AOJu0Yxs6mEkXEObM6IRfEFD2FGUKisJ75KmlRTnnkMPrhx1gHWH7aEd
	abXxpCnS/iofgm9nU6HvXu4hPxjLpAT6kbsffpF3VVt95MyMc9HrAlwwhNfKZwiBzIB/mBZDqCB
	dHNg5mGEnzwic/MmxxGY8cIHQEyKrvtgWmskKCVCpgpQHXpB+++YmGOVZcCn5TZyV5HwP
X-Gm-Gg: ASbGncu8RxjVbI+8DxVjJw0jRrfOuTyk4YvfZEKnuk+4gXfVf+2bSE7ulzpDOCiw9ty
	a7K6L5Q9FJWSlNZpHIYn8c5RdfZjPrIgkK5c6u9Nkr7I1Uxh8z8KNvS5iMMLIueR9s1D4Wwt/oM
	oX+muEvJhNTHhL7aovbKsYBXsERQdbeKNBHoj+/Tj1RDR6BL3zb0Fs+J79c+hS4UY6mg4OjKRKC
	OIK+cbw/j7y+82usXTR1iIpQO1b5mR8B6xqjvi4pFTgqWx6j1P5xeFS6jfmnM7vNCv31+jLB+yc
	jGH5wOS5UdZOGUiYeLDfqKUjnYyTFG86DLm9sQNx5boG68npeN2mlGu8tqa/5hG8kdA8cbfmNX9
	up6JYRPEz7RtlcHoa0w91JQ==
X-Received: by 2002:a05:622a:311:b0:4b5:e9b6:c9f with SMTP id d75a77b69052e-4d36707e56emr45779921cf.2.1758708789897;
        Wed, 24 Sep 2025 03:13:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxNbIitUioSByGSWKh6lMxGWBmIBLxO74ISC6F3r77DignRoR0BJnLESfJ919H1NZIvhRzAA==
X-Received: by 2002:a05:622a:311:b0:4b5:e9b6:c9f with SMTP id d75a77b69052e-4d36707e56emr45779681cf.2.1758708789442;
        Wed, 24 Sep 2025 03:13:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd1102d7asm1538328866b.76.2025.09.24.03.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:13:08 -0700 (PDT)
Message-ID: <eec9a046-2742-4b7f-86ac-ef11dae19aee@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 12:13:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] arm64: dts: qcom: add refgen regulators where
 applicable
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _yqt0_DLRIaBtH3IX5w_Ji6AO-NShSNc
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d3c437 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=G1tMXRxE98s01vP6SloA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: _yqt0_DLRIaBtH3IX5w_Ji6AO-NShSNc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX48OVYNvRCU4b
 SG3XQLdxfBDAZIiNET9gH8haHGwWzBMKQbWmz660zbROAFvYVtPibExjXPQ5hHaAgzHTmsWFphV
 ok9m3gyfvlmkfGO9+2Cz9mCZSPYjvXd/4i2xoF15w+FfCqq/IkCAYqGwcJuObKb/6WojypyGfH7
 TqMp6N+QWnhtn9r5rbc8l4k22U8AmfhKJ78xbh8dYY2Cm+i9CRNJuom6QKzC10fSv1RB8rVOo+P
 2JjnVtSUGo59BX/B3erm5WfFtmSW4qjzRNCR7EFk84ctRbMOX0ORo0ww68E0+uVMTNsrCpOvuHB
 DD9xFtayhY1h6KGiXg5YGneO1XK2kGriWCxZ/zeZuWXDGwg7v/B21130cS/XfGLmOTXFowyPjsw
 4KReWlP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

On 9/21/25 9:09 AM, Dmitry Baryshkov wrote:
> On several Qualcomm platforms the DSI internally is using the refgen
> regulator. Document the regulator for the SDM670, Lemans and QCS8300
> platforms. Add corresponding device nodes and link them as a supply to
> the DSI node.

It's likely that all PHY-ish hardware uses REFGEN, so please make
extra sure your patches won't kill DP/USB/camera

Konrad

