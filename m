Return-Path: <linux-arm-msm+bounces-54389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E764BA89A72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FFE5188E501
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD9E289343;
	Tue, 15 Apr 2025 10:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3Wt/W3w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6127B4EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713467; cv=none; b=Ju2d18gr0sdbHSBBkVlHvIRa8/27RKeqnaqn7D0zgvU5kEb7Tpn6aCAihhh4e7znbzkfUKs1mgy1TQNCWwTtUtpBTsrjQhTPPdE0GBmkyAmYWgkapByDF8LoqL1f34se4OQiUdxuhvyg7TfST24rbm3FpBF+i56HNSQ7PYu50HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713467; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVZefiKdc/2ResVjJ0uW22NDznekiqF8UUTY47rsFw/icNkHQsrM+HoY1INYpBO6WenceJha9O8rjFtjWpVlntW1MrUYFiSNOu7+U2XUoLFNSNweRAsUsi4HcOftT3pu4jouwP+67SW1Pb2AEBayEfiLSwp3bqW3B+8LJ3tuk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3Wt/W3w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tIsY031767
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=j3Wt/W3wYzYkHRh5
	nrDhqE0OWTMgtBaJz0WWwgDqyRRPCMyAZeHrzwjakd7bx1x7uU0t4sLEpZMdixHH
	KYxqjPubcThpSD0g9ut5DoFHCObpn8gHFmgoqa+BARO93MwlioFZDOwOF0qM3Sld
	sd77khtpwbO7FZciN5bEuuNE3Q0Xl2fa56mrfql9ttpUL+OizPq9eGcFTqOnbA+h
	wpIalOM9pFvfGoxNa32l7zF7Y3yXpjXpi58/aVsWMHfalMjiRFqkGEkmDEk4J2hJ
	gJ/XdSMyo8PmQlzi+xOXU+P6mkef1ShJtIjZ2Sa/2RkLQX2WDQ31133bdKYQJm04
	hgt1Fg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs17qte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:37:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f3766737so12261696d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713464; x=1745318264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=gbbFJgKti+TUXUiSjs97wzf7599TSL/Ac+Ar7hKaCX0tFPUsTGG2i3Yo7Nd0A7KI6s
         No3G0FpSt5a9J9H5XywLEQ9HroXM59Enov0WlKHxg6fvRv7sI89WwHVbMSzPVNDBkFun
         dN0cGo78qunlp0mEdqtpsS7USD7fupshLCb+KB1Ybn37QGOxsTEjAxEChlzAH1O6mzIB
         DKnoluWx3nyMV9q22lRJAvyIPHoGH0YWKMoxi98J3kMentj10BFsuxiOkdYDaD5mVk/h
         ZHXUCH3tcK6EpGFIOfbXKTAF+UDZAz/cwFII4KO/umN7hFMHjuTJUcrL+mZtKqHv8L9p
         Tl6w==
X-Gm-Message-State: AOJu0YwqopXYg8B8lKZGLpXUm+tiamwcFypxjdo4Plt0rfyneXGypiL+
	nl+Z+7hg74ZTyx72MJRgy3n+NSVtKE7GDsM8etaCAQT0IFBVwkOBRi0rLTfRhFq1xjgt8A5TcYc
	ET8X2bFnFchkTfp6sWyWja+h9E+mUIsgN+r0ZGygj0Nhxdb0GiXUOYKZkxYOfJ8Rs
X-Gm-Gg: ASbGnctggwBe7kdCgg6sPsI/EfjJxvPf1EkhNDgdlWqwca9hGwOV9SUXEsbesYupA5N
	hpVDFAv30N2Yigl/SiVqShLcpveNEEW5lD0aBoCRGWmpMpKQ9XQfKaV9BkotrB5iIDNdlX9Apt0
	zN4Vse55nxI/hH5ghRYPFXpLEP4AwUwE5ByMPiL7I7uWPCbSNYP4QdLKgHCM2JKHlqCLCg6IhAO
	Ob8xoZB9VEUf7QjipQuS10WNbygIoTxmnPyjVWZx6Spv9GZpw5Y9jX5yUJYgbK7KVwhnedgDZwV
	uMVBybCXZOcOXbnXUhVL/zcwhSryxkt8vE9HmqCIFPG+RykpZR564S1Zboe6jOqbqCM=
X-Received: by 2002:a05:620a:240c:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7c7af0ed2d7mr888668885a.3.1744713464047;
        Tue, 15 Apr 2025 03:37:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETb1FvwwiGOUs5q7VNpieaFxunkNcu1BA3secMuMUQsb/6SQ1PsqQAyfinlGBFUVWPIDzjTQ==
X-Received: by 2002:a05:620a:240c:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7c7af0ed2d7mr888667385a.3.1744713463705;
        Tue, 15 Apr 2025 03:37:43 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb312bsm1080609066b.15.2025.04.15.03.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:37:43 -0700 (PDT)
Message-ID: <ed47fc23-621e-4ffe-baad-7c57da1c305c@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:37:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] arm64: dts: qcom: msm8998: use correct size for
 VBIF regions
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
 <20250415-drm-msm-dts-fixes-v1-3-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-3-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fe36f8 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ipUonm9ADLnQpwTLHNBZDSoEWAK4vEUI
X-Proofpoint-ORIG-GUID: ipUonm9ADLnQpwTLHNBZDSoEWAK4vEUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=630 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150074

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

