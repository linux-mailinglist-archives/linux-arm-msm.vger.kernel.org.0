Return-Path: <linux-arm-msm+bounces-73665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 935A1B59315
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F03B1BC199D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E972F83B0;
	Tue, 16 Sep 2025 10:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6vRsUeg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90242F7AD5
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017567; cv=none; b=ATN9OIKEvsjzqphjUilDSZX5ecfHspI7SityUcnoHFvdVTASfYLFa3OK+LYiiJMjQDrLUgG1YUnD1WdrxBdkhZ8V8RwMFnUlgfYHgTRgJvSJowa4cQgTwuULQPs5EFmdIKrqK/yazvwo0mJR4fUW+NiPGkoyKdRuJSCeudOafKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017567; c=relaxed/simple;
	bh=AtHohfo1uYmez4a7xefZJq7bmucvJIdrFfYHyRkhDc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unlYc8orYDXTbdUy9dPd+CeNqQS09wXK/LgjnqrvskKdcpaoUCX9oQ6zjm6oc9M6HLuAZi5bIvv3F5pRL0YiklBOfub7WbfHOidgBlCsqaVY4Z9iot2P6wI6Mhh62GP8+NkLXthkIYWbJAPiEpZXoXUr0+huP6bJSANsButQBLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6vRsUeg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3phQw010528
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UnKmxb3bowAmBuwA8psXvvWC
	ZxosmynthXekfg5oy5Q=; b=f6vRsUegm+ni5xrEt2LIXttgytT1FqE7qOMF4bo+
	wAWldIgj+YfZoMBsLrl55Y9rzWcAV/bZvX5NqGFJJSPGaDxJDvedEzeTwHD3MJfy
	+SUJSoWpSxJklqpAL1QzwOGmsSUBKVdIM8l15ga+dl/+PyxawM4pcWJ8pDB3Sg88
	RpcHy2gITDcNK/a0faKWNp4b/ExWzTq0vAeP+dSibTnc2u75q1aZJPBf9V6VDP3i
	L2DFOXjGETKjmoU3tTaJQ+EaMkZCvyu0mGkl3Fj70ft4G6E7uhxQqQG+f97ZMNVt
	MN3zljgkFprjXtP+5+HKiJZ43Z8JCxBecXVx3FzprfhjkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snr986-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:12:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b345aff439so136272771cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017563; x=1758622363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnKmxb3bowAmBuwA8psXvvWCZxosmynthXekfg5oy5Q=;
        b=WoGI36+nfEddnYsZSq4BxOt/0IRVcR4p8eaoVppBHfiUbFErHbvQnbVvQfW+/2FFZM
         y3pgBCins57sUuD/ToCbRvoiYiQWsRGbjUvKSE9GnTNq0i8e8uPsirUlgU4l2EB+w2+y
         cuRJQiYlTFt+7vWS3f+XmqXUqd+W6LvtaOSWFKj2PA387JEpQ1V476nQa7VIOc7NiQqO
         KmmgxHIEKcFMd4CqUZuMqEn7j31E6BvgGuR3YdDdWcfzETgz/6btkbJ3hDOWX8R6KN6D
         2j1TRdHrwtlfcCMuwE4DXrXSoYQMy+Pwb49v/TeRbXGa+8EGUI4QzsOCfJcWT1HJzyMf
         H4hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCzaknlXO9snHTN0hoF7JhBaWvlF34S0nAifyvW8uo62l9B6SDN8dMKL0Kwus8djCX0PZgY03O61YvGwOs@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQ/brBZbLWP8ItrmNcidihrQF9OUMQBwj9cIaK5ifhqSWBLQh
	+/vDogP/qPxfRN7MrSXlt608i+yS9nhEpN7kJZB3vb6oJXa3BBOtFScfIk2H6jQE44i6xZ1ko3c
	RSlT+4HI8no7li4BCzV76smy2FNmbEY3p3vIy4VYFQkOAjaUrWnQhEmno2JfFaQgCdkN8
X-Gm-Gg: ASbGncuvSwG92ZFeTphRxwmOkx/MDMzcxX14Faa9Iwx56AK7SAI80DMBfCfwJ0mME7O
	4jSVJWx033H+5JTYHxCDZ05l0KcN18SnrwJ3BOA5NfcPzWgNmtYqDUoZ5JhPIdi4ZSrJYdNcF15
	1m8ypg7ptBNC6hovzlmMRxY7FAAMlPElP6tNMdwV3HKb2DpOhI8MjOW81wtHkL2PY2E0V4ofmjy
	FYQJSXB2RxjIZ/rzFC/SaX3sK6oavpSsWlniSmxjk/f0W0hsokdxUIx7Ilm3q+cijPBTL5ibPFW
	nu+cr3BWXM0S0FByOgjiHwHGDt56ERbk8iQzJZ8ahCH+Kp2d7t750Eiq7U+tsqFoMnrDTUzaEgN
	H1v4dvkXeYeFrme7qHkPT7dC7jwQAVhvYGbYAYW4GDvTf/eeJfgeg
X-Received: by 2002:ac8:7dcf:0:b0:4b5:dbe5:c1d with SMTP id d75a77b69052e-4b77d14578dmr166397101cf.47.1758017563512;
        Tue, 16 Sep 2025 03:12:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv3BVKVgwYazriyARNdmB0+Wn/2rbEY/SZPripe+2AZyCtP+Z0BiSNaYMhH9+jhFc4c+rejw==
X-Received: by 2002:ac8:7dcf:0:b0:4b5:dbe5:c1d with SMTP id d75a77b69052e-4b77d14578dmr166396781cf.47.1758017562961;
        Tue, 16 Sep 2025 03:12:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65a3464bsm4215173e87.139.2025.09.16.03.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:12:42 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:12:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Flatten usb controller nodes
Message-ID: <afkttq6trccdicf2i2npkzglrfr7bm7hv66och7bfvqt6mr3mz@nneluflok4lf>
References: <20250913182318.3547789-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913182318.3547789-1-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c9381c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vazWjAwb6okXRwvW2FgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: kwby_uu2_-7PhKGyMxNmVPxBhap5pE2-
X-Proofpoint-GUID: kwby_uu2_-7PhKGyMxNmVPxBhap5pE2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX3uhpcyoSZy7x
 mnmsMpNI4pBLPbuZs3RdO1MuIVHJS+Nmqa/FcYRxiCCH149x4Ti0W29GrAABBv5VcdQvTpfDM6J
 KL2OnHDo8Kg87VRN2kCY/0nnXC0ahtlQU6/pE/xkGXAcqXVEvggl8XJzNRp/KCIRYdTNwrq6qoM
 l2sHEMLslwuGtMpYb41Nvli62ltiruGRzcFxicVRRYZwM/+nUWc2QR4B+zjlxsLusYRIRuuB4/b
 VK6tI0s/ZX5mSf337kTo7J/ekOUhaWuD8xpJaGfXr+Vhvu5KIwd9LQUbupsTI4HlVQ9puUxTszB
 X8JMj/PYdwwT88wnm8X7BbwUG1LPM2CqALDUFoPLnpSVMWf5HOuDkttVs/Ot3nvXmX8FYjUZkLU
 c6NnVnhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040

On Sat, Sep 13, 2025 at 11:53:18PM +0530, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach. Enumeration of ADB has been tested on EVK
> Platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts   |  6 +-
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 10 +--
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 85 ++++++++++-------------
>  3 files changed, 40 insertions(+), 61 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

