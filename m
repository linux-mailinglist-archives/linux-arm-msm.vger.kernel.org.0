Return-Path: <linux-arm-msm+bounces-49321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBDDA44394
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 15:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B41801882934
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 14:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237B721ABC6;
	Tue, 25 Feb 2025 14:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMBACx/6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A3F21ABBA
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 14:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494959; cv=none; b=Ri4+vKL7mLPKlPE5b9wsdWJxsUdNxL54IxEIWrGSuYGMDNtsJz0wouZ3XtFqeawqT5VyJm921M+Idb7feEYkHDrhGbMeeYUp6pa5ryYK44a6hItluoq4jWD142yfJ7lBssNSq2Qs+NrRVR0esTN8I56Be5T26Ky0mi43mSDRdNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494959; c=relaxed/simple;
	bh=jB2KNx2xiJKVw67d/M0TT8okvRHhKlz8iuO0X0oMk5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cngjt0RlNlzyYZl5wtAWLUSpt/je4jIME8yOfr30uH7IRt8JPv6yUQ3Mt4B9f12gk1FdydUX5BrtGZUqyPGsOpxT6KHVLlaQbvBDwawEGqH03TBXGfS9cusdoetkHcMLUA0Gy93ncXznpFZGOdK+0pm7uPqEIhEbMoTmMlgstso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eMBACx/6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8g3Xq031174
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 14:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdZblCZrtqr5nSTII/rdTDMLLzlyRaA57jSGq74yb+Y=; b=eMBACx/628VwpC7D
	9lZ9O1PFLSPuTVS+tc53m1rF4B52Mdcqsa73TtHeh14XTNF7xVuHNInbVxviXI5c
	nUMgSrt0e1IwjROayup08XZGHjpuDJLR6Yh0Qv9NThGeqizuXjGgKPWlfeNn6g/5
	kIknF1gyMCgHn/3QPf80VXMP/L+tv3OeZ1qWPsGChjgewvTkFFtB8g6FjwqOo4Eh
	7V76ZVlFLvCPgw/oZHcTgdfC9isHIjrt4/zVitJZrrpleyixZOwylqsORPiWFT44
	2VzO+9meT7BbaaCLA2x6PaW6W1LsRvNUnaGNJserjXFoleIcqIGHVNtm+SmYBbdN
	RpL8Mw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6nu17h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 14:49:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e67ac0f122so9988756d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 06:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494955; x=1741099755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdZblCZrtqr5nSTII/rdTDMLLzlyRaA57jSGq74yb+Y=;
        b=Vlko2v3fOEMCW62VCz4gQOmZp4Kzkb1YmvL7eOip/tWmRHYi/tfFAHLxR18lzmvt1t
         jeTo6KE4pnwKkrktQU52aki9xLCiCA9KjbbGLrhwCaH7ZMsyIHn8qlNhYr5ynXC8GjSe
         jzmsTvT1J2JyqXjraM3hv6iK83nS88OiQ6WMc5DEe8XuShN284iWQsH8UennwB2ITw4k
         J2HKxRBZg9hVy9iodQV3NevpRAJ9+foYPEA/BVmUekJWb+bmy8GcR+T7kb0vjIhrnLAG
         X+sFNSfb+j3yruT9pNxpliXocRCSYQ/3k9k/T701Oxp4gxzNbBMMLg51p0RmBCAI1PQL
         WSIw==
X-Forwarded-Encrypted: i=1; AJvYcCUNvcQTNe3Ux40dS5ykvj6ORcQVDAtYYeBHCiupL1Ub42tHX8C4spILYli4C+2cFS2jeIqC69bWjDc0FsbG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu62AgFCVe/9GLBirFKpSlyrYuXWW4t8Rd9uDn4uHVkL45F6xl
	PAMqYz4aoaghD7tjHpIbmy5Fs1GhaSetOiqIYi+sxym7cKUGZkSfHWXVQcugZ1qFSPDFtKTygeA
	cnjXIGDgvGpUcgeYmyzxcFTFruSUrRfYaX1qp3+oTqdXwDy3dlRj6gSmzsUd/y/NZ
X-Gm-Gg: ASbGncvQY4hGVYQcA4KThoaN4h3yT7jIo8l28g1h+CcWIHPweADxYyQUUmH9TdsbhJi
	BqhDVlkzAxxtN4pgAwREvmYbBg0YFW2eoiHN5ASxJxPhpgWaGAqZk22+0MDWsz7X8vFaNCQGkdL
	ZIlc4KjOfehorwVBOHyy43hC4GDNnaJOhZrr1Gkq8FLXPZtQmgTvAKHwos9m2QMVB9UC/MKhKNJ
	DsrUx7eKZ0FyzLI/2P5jcj2NQeTR0VMjtH4TGQNkfX2VuYDmT//sqx3OK/v1LOYaJhG49mXTw8T
	XekHk4Bk8OZ3j57gQ/NqwbRlE6LkU8uiugt9/sBQHipRjC7ZleuVKgepAm4BcaENx+Ysjg==
X-Received: by 2002:a05:6214:e64:b0:6e6:60f6:56dd with SMTP id 6a1803df08f44-6e6ae9b4a82mr78584556d6.7.1740494955185;
        Tue, 25 Feb 2025 06:49:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Q6ox4nvENUzBFA4fILrABEqSIsQiZXCOTgUYTSKSMgYH+75qvmwIn5Zxz7zObrGAIRpFQw==
X-Received: by 2002:a05:6214:e64:b0:6e6:60f6:56dd with SMTP id 6a1803df08f44-6e6ae9b4a82mr78584296d6.7.1740494954729;
        Tue, 25 Feb 2025 06:49:14 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2010df7sm153581666b.95.2025.02.25.06.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 06:49:14 -0800 (PST)
Message-ID: <051fdebf-baf0-4d67-b044-fdbb50d2f7fc@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 15:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB to
 usb-c-connectors
To: Stephen Boyd <swboyd@chromium.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Pin-yen Lin <treapking@chromium.org>
References: <20250221233120.3596158-1-swboyd@chromium.org>
 <20250221233120.3596158-3-swboyd@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250221233120.3596158-3-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x1KTettQAYWwc30s-iSDsY0UsEdCGNbm
X-Proofpoint-GUID: x1KTettQAYWwc30s-iSDsY0UsEdCGNbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=926 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250099

On 22.02.2025 12:31 AM, Stephen Boyd wrote:
> Fully describe the USB type-c on sc7180 Trogdor devices. Most Trogdor
> devices have two USB type-c ports (i.e. usb-c-connector nodes), but
> Quackingstick only has one. Also, clamshell devices such as Lazor have a
> USB webcam connected to the USB hub, while detachable devices such as
> Wormdingler don't have a webcam, or a USB type-a connector. Instead they
> have the pogo pins for the detachable keyboard.
> 
> Fully describing the topology like this will let us expose information
> about what devices are connected to which physical USB connector (type-A
> or type-C).
> 
> Cc: <cros-qcom-dts-watchers@chromium.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

This is quite a patch, but it seems to do what it promises..

Please add newlines between defined properties and subnodes

With that: 

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

