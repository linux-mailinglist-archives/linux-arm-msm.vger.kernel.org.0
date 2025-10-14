Return-Path: <linux-arm-msm+bounces-77140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45ABD894B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581E618A2ED5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941652EBDD0;
	Tue, 14 Oct 2025 09:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNOVm7Nn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B112E8DF6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435584; cv=none; b=jtEDgy3EDL+3D6zd5DbJsM5F0TXFry9AElrOZXG0KDpocqfy1Bu0bJbWOo9C+GN9+pP/cK+z8z3LIkS4psxqqZrq558BI9XSo8pGyIHwdyscTofkeKpknnAGi6kEIct4ninsYYCtMD3vvICSOwYgvdW+NH67ElB2MOCMOwhlpmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435584; c=relaxed/simple;
	bh=gUfKWkkU/Gl5PN2qM9TecVGml7FKvbb6D1xfgGMKKXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfEMgTb7/YieTcaM0lgKb9PIRiAx8eWc2O5aw0uSd15xtQd/uH4naghChI+rCaDlZQuXLV+OsB8usLbKZ6tEDlZmH7C5zwb06IFdvVZMrcLH5UTSYXjNm7tza+yp+d0fMDnh7bEnflpwSxgCSUCU8qnz/WvhoGWuOAGMlP6xtpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNOVm7Nn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87KHv016377
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0bffc/XzD9MvQE2h6D3BwBGaZfZTTXTRLHrFoBclpY=; b=HNOVm7NnkRJjzTul
	4m27bq5RnHkIE3pKfuThw6zYZRcYVwqQJ4GLjTZ2Vp7Km/aUk7yILUKO3HKu9+qI
	u0cfEd2rMsLDqe2JzDWL7AVj9HtcYNfQ2VBGAQXvVckTmyn37lKPPKEfy03646At
	0Mc2Z4WC03US4WqVvLrAUKMLsAG8zZ/5cYEn8t9e/95ZWXFlxhi4v0gKmYUI3sD5
	mVhFvSwg17f3htGliHI27DkfXtPkzQjWL7TO786c3ZfsHkQ0RbazZPMW2o7k6lw8
	XILciNaxVBqsFMNLYQlvfjbMdgxQZR+xsRmAUrB0boAsouwPJUFz+zFGv5swGZC9
	Bo604A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd902f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:53:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8649a8dbff8so226589985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760435579; x=1761040379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0bffc/XzD9MvQE2h6D3BwBGaZfZTTXTRLHrFoBclpY=;
        b=unGr0Avuc3R61IjwW5fXQPXTySPUAn7Vqc/mYIyYtMdVfDWIZHmTJ6z08iK7l6VW6O
         90FE8RyTLspGZC4h50Z/gqCJidRSIIs7EE+Q/1xBwdtxhuAn/IKESBB29C20FPbjZ0wK
         5KUp0LPFgti0PlOYVQt5pGi55MsVZq+rFeg4ShHrj3Tv1I4dYRFWKIjpGUe4v8LvPVtO
         fR+V9+yP+Ny+ksY0BnIqsTGJlllEq/v87MtzMGUPwpiS12P/DlHy04n+Za+OoM36O8wK
         /nk23IiyiMS1Gj6wwBg2Nc+Zc66V/5RGkoG7PkOkiQMYKsAlZy36VfeOmilozrnoJcD4
         /8bA==
X-Gm-Message-State: AOJu0YzvnnHF2IMJdXH97eYqsq80aVeCNUF8VS38idM+f96lJ4twDyrt
	4y7fkY/rjJAD9jMxF6ISaARBL1d8w78OpeEuEeRXIf2kqmRbZ42hx/vNFc+iiwvAKSeolLIYmSe
	FY2+TyjfPOrJiuhhRcPlBXgVZ8EPAvDhcIHYklJlqRfV7ztmOFLD0S5lXq5kjkJsRRpKA
X-Gm-Gg: ASbGncu0QgsxP1RYwzso2QCtc725EZjdcYfyfImBQzfy3IzvQkAsBABYck39eX08uqD
	9hujPpYwSy0aZ93ucC8tCrmGzmW1/AAbVahJ4bExnfd9WdfSb1IbyuXjnjaleZ3N4iT1d3ciiEh
	XboG/A93gIxt0bXjzLScSlLCw6MTps5p+/Wjs4m+vxTxJA+i79oq2q5u3D7f3FHYB2VrQONGfx8
	hdSehRkX4u5oLfH5ysKQwmNx4cp0jMRCSwyblv68x5kFUbCSDMcnJ1qm2jOMkx9i6bIZBQW5ZPR
	jfjmkQgdFWqud6CYmvBCF/xrxeOltB7fVlyS1x4DHSfoIXI9Y42BhyBUYUC+yzLOqdoEjrOSiMS
	H6N+Mp4E07Y+WpNf39TAMlg==
X-Received: by 2002:a05:620a:7012:b0:862:bd48:923e with SMTP id af79cd13be357-88352d9a2c4mr2163600685a.4.1760435578890;
        Tue, 14 Oct 2025 02:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnUhF01Zofq6EjRpw5993//+lfD9xui8peDVWDyOkLe4ZPEIW0HfK9WyJ8gfgXNrAo6KOw/g==
X-Received: by 2002:a05:620a:7012:b0:862:bd48:923e with SMTP id af79cd13be357-88352d9a2c4mr2163596985a.4.1760435578438;
        Tue, 14 Oct 2025 02:52:58 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d65ccfe0sm1114443466b.25.2025.10.14.02.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:52:57 -0700 (PDT)
Message-ID: <509e9902-2f74-484f-b5ca-e1605a221004@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:52:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
To: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tK_poEkXf9qWADJ4eCoVhOoxJ4JbZebr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7qMr6Ox5S5Gq
 ry0DyIM4kUddpH6+6BFK/+5Z0SZJzcTjhguvGslv5Y9Lhpnea5jISbWmszbTrL1XC/krKu7q3c5
 BDRv54xON7U8QxutW/NDsj/cfPggXirBpn601m5Jdw1fjSaQYEck025wcnGvUoevqUMrYCe4r19
 8KyaRUcSZo2/3xOjIvMtx5Ct3JwATQPGMh32dkK0DmBZSDiw4UkAFiq9Zla2AhfHt6MpFCT/HJE
 9K4NDizSPtFUnPyAbQk7QnQWnBojHcBMXfzO80zCbMM4pqnj5A3iUQhm18Cf7yM8QyNP1y0cmld
 XRXQDJFQEy6P/i/aaxHaPnow03XhSYH65p2ZnF5kWknSoskxM6Z7m+t8wHW4werdIMcpjdk27y6
 KYgf3fJmctfc1tkzwK9TwqV4tjyNgA==
X-Proofpoint-GUID: tK_poEkXf9qWADJ4eCoVhOoxJ4JbZebr
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ee1d7c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-JAsjFMKCY2WfoXnbYkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/14/25 11:42 AM, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include lane mapping and PHY supply settings
> to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

subject: "qcom:" -> "qcom: qcs615-ride:"

[...]

> +&mdss_dp0_out {
> +	data-lanes = <3 2 0 1>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;

No 8100?

Konrad

