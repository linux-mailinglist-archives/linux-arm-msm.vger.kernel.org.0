Return-Path: <linux-arm-msm+bounces-62441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0151FAE8226
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D2953BCD5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD33525F793;
	Wed, 25 Jun 2025 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDMG6c54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B19725E44B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852421; cv=none; b=Ja6NXH/AHm6QbnHvYFIhPrktmAv7spKNrlmUzw/m9tiwY2GBuRwIi8jF7EzKkwZXs/KPi9i53bU4ozlT3SMTP/bUX0/uHvXAwa8szdpuuwEBlObn/5ERHu6Bg8Yxy6etcQVgt3orq3hzIoCg/nlyrzB7Aqlf5BNeXHL3xIkLJCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852421; c=relaxed/simple;
	bh=ezwL7IcLfiC4kFJ13xzLLXbczixdUL2ogFCndH/LCe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWd796OT/k4PkFHJk8Pr83juuoacTRpJKsmFh0oxUZxVpRMSxKRIg+E6x3Rnwowfe1mGvinNdPs2D85AeGi+1/gAMNxikQwnhkhXszgu1FfBIzwM5VotDlDdgAAYh/yG8SRehew4ZGpy9mLou7kKqOKX7oVc3py8e04Y76vXWv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDMG6c54; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB1hVL027614
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rpBfYpc7ZN75R9+3JLe6Gu0HFFL2Fa2gNQa9RDt5RuE=; b=bDMG6c54h/+r11KF
	WL64B8Stv0lv57lzMZ9+KASTQZkp8Mw5QIbcEjicTzQ33N0CpuQFy5xI2nOrR3eS
	eW2K4fwWibREch7A1Zz/L3tU5wF9JytOqmQaReKAEeQw3Qyt6dIkjdjqr98c7dyf
	I2r03QflIOeqMYUCgZG3sI6AuBV4tibQn+/dUm7zzm/CN4uNjZ99pTQoryK1Il2r
	jR4r8jvh6imvG9ypQtOJGNkWHpIkuxndFhqw56Ldmv7RhdAPlF1i5TLC5zhFIcaL
	QRdHnYLC8WcccmJdQa1ueJyqVKOw11vPv9hN3AwvvIfGwoj9COHPm4nz4UwzD14x
	JxL7ow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqp7wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:53:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5f7413beso13218486d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852418; x=1751457218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpBfYpc7ZN75R9+3JLe6Gu0HFFL2Fa2gNQa9RDt5RuE=;
        b=XtgCBBw5AeUYOZi/sxpmwHO6KdEn5XgN+6qAapd7zCYY1/sk5xeV1ywEGWgMmYHlTu
         0eJrBRZhCvd/0s+95oEzrZxuHtxTAy7ABmlMmvBUUnLiakUR5g8Xf98dHrIw9wI1mbOh
         k3OgQemqXmRCwofJWcMphGvcu3HvhtNtaHIQO57ZED46ounpMn6LreZYBW5bKNili57F
         aioKBiB1WEzusHQ7few+HoT+VaIN87xOwRSzUn1vvB1b1B5C5wbqf/agXeetCFnvLEnP
         0XDcXPGt69sVc+QbDER/cI+trPspnpzRzz69OlwB5k2RCufVBKy2rqT6vVPE9GcOpR9M
         uOFw==
X-Forwarded-Encrypted: i=1; AJvYcCWvJv39+ez3trww9NKBmni7kx8m93SiHBRlCXfEZY5KWdnGvboER5mvAgG9PEM47e9SrcEUZrsABjVt1brA@vger.kernel.org
X-Gm-Message-State: AOJu0YyCYgQAmrZjxqWjVMjbn6G6ShLxIPgvUAqmq0ZH+ugWfLzoJUr3
	zIHCBgWR14tZku5tYZpJsiUpyELv3ihF+UYCIejtdShEIsoq0PzKYYR9vSxz43NqH9EJj44dGQ7
	Xuo9e2hPafH0zOxYXdDU5/KEKGmRBxC+20gHCpXA14HVaaZFx8lGUv8lC0nyVn60j5xf1
X-Gm-Gg: ASbGnctl2HXDocliXahiICtTufohSjZoQo2Sm4LzQQNnob5ly8QeYbIEHj1tC9RLzjq
	KpgiRn9d5bWnM8XqHF0Awr20jMWmuhNH5HCIhIjeCzc2GRNNvh6sL2lCHFlJ1KVSPDEMuws5qZs
	8Sijok1laxP6KG3D5L7IB/pAz+G62kDkhfQNjUTY4iHiPT4ti6ALTakNYVRgp2deOL/vwTtPEPZ
	vklLEW5CHdvpyVF0oF+p4waE1nc3Ppmv6n+vj+6hJq6uqYqj3S4ECKHPQc6D8N9yYI/mbcf9KqV
	SaFHgygmDf0D1g6hAG7SmAoXgmRcRAury15QUApvrIeLOj424z/XrxmFKTLB6QiUqpK5Loo9nqN
	BQEI=
X-Received: by 2002:a05:6214:4b11:b0:6fd:7ed:91cc with SMTP id 6a1803df08f44-6fd5efb09c5mr13510026d6.8.1750852417892;
        Wed, 25 Jun 2025 04:53:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtUNbNDweMw/wcVZohRow5GcDNe3gsLWCuGoCCIVx8Lg72/lWkLkSlgE1EDQVopkmENdTUdA==
X-Received: by 2002:a05:6214:4b11:b0:6fd:7ed:91cc with SMTP id 6a1803df08f44-6fd5efb09c5mr13509766d6.8.1750852417479;
        Wed, 25 Jun 2025 04:53:37 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0c4d1b611sm90591666b.43.2025.06.25.04.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:53:36 -0700 (PDT)
Message-ID: <c5d7f0b4-f167-47e9-b2dd-5e7004ba43c1@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 13:53:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010
 by default
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
        abel.vesa@linaro.org, bryan.odonoghue@linaro.org,
        jens.glathe@oldschoolsolutions.biz
References: <20250624225056.1056974-1-alex.vinarskis@gmail.com>
 <20250624225056.1056974-2-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624225056.1056974-2-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rWKNxz9TZ6ecncLdxOxKHUPEkbQMk3rn
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685be342 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=xaO6kdGjeppNSHvH4OsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: rWKNxz9TZ6ecncLdxOxKHUPEkbQMk3rn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4OCBTYWx0ZWRfX4O7o4X3L6EWx
 cvTVhRy2k7brKvwrNLiBNzhA3hAPw2SCifw99TgHZDS5FWMEK/N3y5A2FXR4ZpTl+pUNSz3FYw+
 HAgFOfNdt8AjcD+jftzrr2PUBDdkzLxZ8bx07H1z7dypBhDFnABK9Nos5Ha9R+Q4D02vPQ3aD0z
 SLh3iQMYtulaxhQaRdxGVpNGHeO/s8sskZRWzN5Dp2WkYeraWOlGL4UqB9+UDSgAsfZEFcbKxDe
 Zjtr2yZnZrgvnqnn/wkO7vKFzVZd0JUspn2Jcp2pc1FvQFJuYc/YPZ+06NFUf+WR+YddnQ9/hLH
 tUjvDJLdDEEe4kFOEy8sxbUbf9nku6VnU0sAKMKLqpv5/KVrLkbcp7AFEW94LyDCfhniBR+WrMG
 CPbDU6n9guI5tDrBIXyPsoSjNST0VqyrzMHLIRny5K+l8G9XZt/+IwIJGQPiXjstLNNyc4YG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=738 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250088

On 6/25/25 12:41 AM, Aleksandrs Vinarskis wrote:
> pm8010 is a camera specific PMIC, and may not be present on some
> devices. These may instead use a dedicated vreg for this purpose (Dell
> XPS 9345, Dell Inspiron..) or use USB webcam instead of a MIPI one
> alltogether (Lenovo Thinbook 16, Lenovo Yoga..).
> 
> Disable pm8010 by default, let platforms that actually have one onboard
> enable it instead.
> 
> This fixes dmesg errors of PMIC failing to probe, and on Dell XPS 9345
> fixes the issue of power button not working as power off/suspend (only
> long press cuts the power).
> 
> Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

