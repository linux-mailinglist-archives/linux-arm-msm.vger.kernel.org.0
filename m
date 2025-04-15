Return-Path: <linux-arm-msm+bounces-54405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84EA89B18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 857EB3BB96D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13521297A51;
	Tue, 15 Apr 2025 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGgV34N/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855F1297A4E
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714048; cv=none; b=vCrY34sBSaKwhPOcWJH4MWH/cWctHe1TeIroq3kNMqufEfrSwiP13mYFHJ6s7pgPeNOnvg2dsf1IWgjCYqlT3sHbHSwyMqdfEupOc0ZaUDz4aP+S0JPyytOA7+R/1yR55+N4ryF5yk4BZc4eWGhkENz2n2XCydd3Ki+7fvCO1Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714048; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUIIxVLusZ5agvr3VaoaSRLCzzdYpXo1WLFWUSxNZsAknwqhUP+NfqgD73FHYxo4aJHP+NGJLdA07RXmG58EmSUT8kfUoxiRrNi/xzuxaYGstoIx+Va3vt3nMwSwhHfMpxdmvuwaYq4rVXDR/TYVWw4+dmCKrX5qpxTF43HmyLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGgV34N/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tCH9022965
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=dGgV34N/vYBLV74h
	hk0HHYzfGp+JC0LAuNgIXRTjh1PlJ2RD+9IL8di/G9J3wF4KKhg2USYVIwmszIsp
	fJkkOzOTN9LKXpfdL0H7VdtVW6sTksB8UFHQKFXMfA4DOObf+Gr72H6WzHz+gQko
	bHfL/YCfBLyahWxilggcOOyX19k57Mt+XDSEvOFSyw2EviOsdPv94j7Te77G7QZJ
	Xb2RtaJQPoJc6ZZwfMUbiFgwS5/7NDhBLiudGP3Ip8V285QOSm4nKwrDN1a65bgM
	G4XwvmjrZU52Z+sZJVROXfEdCaRiwqoedHWeurx00lGUGMTyy1sNnpyEMzuzlgHp
	eF2m1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj97qff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:47:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5841ae28eso123692485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714045; x=1745318845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=QEe7JiCQ+fWwoMGu9+iAfRXYefXe5dXM3qLBIjAV2Jc3V4/5Qbst8kJIE06vFKFEdr
         rn/U/vUUg4KPVGS2t2+j3ig1ZKC4BIUp8LwJbRFOsMFOJjwxbJW8Fnwp2GuDRXXBWQwF
         dmSz+8rh5TKigXy0rI4uAxDjTIRsQF0ruGdGNstg0PmOapgP83+MytAazSilhetscip6
         OQfzLi9D7M8fqy60dn1vS2gYtXAFXlycND+WUyvxm+DZbDN5qYI9waLhmIvfafcPrs+y
         QVpJOp5by46MYXEFit9atdXPHxcmTXsCzgZJskHcAMzRYW088FNNNIJfMBYdO4h4RjAi
         lyZA==
X-Gm-Message-State: AOJu0YybNO/1xGxgMpZI+9nlDHKwx8TsTgZucEzyJIW1Rl0MWHRLZtoi
	rT5j1FB2mk/4NT5L+Qw/7+6N1SnU6I+Go+BPJhUW9g1m/76IB00FSxl+jQGoh/drzA0mnxgv/37
	An6dCd30OAyQcErlHdHyJGLFvgPSXMbmQVURzAa2ca1cC3et6A/JkrhVorF1VJAVV
X-Gm-Gg: ASbGncs1iWLs8htS6X+iNTfVUyBM9ZaCrexAJpVLpeA2zvwpWHxTWbuzaSG93/yeels
	mbGTJ3VNKRn1DX+X/2MLbBAvoly8L9XeNaGOaa1MznllqE5r/fpGRq12VBuwb8o8zhhxOD+PH2A
	9U96BxSNSQhGqyX6WyEZ6eSUFo+q9y2I717A6xfwAKNYEvMVRafIhqS5lYrb9nyDOn5dmtkKRZz
	Xd3HTtBWtrSKxqbBbJCZNWsX+M9AAfumXDrIfeB0+Yu8UNIbDqcKz9zReXe+UZKc7YfKw8YzS9a
	ddMGyfh3e0XGt2JyL3nCu5l5YgQT9AApZau4TT8Zbvx0GAViqE48c9AE2g1UvJC8NCY=
X-Received: by 2002:a05:620a:44c1:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7c7d07be091mr164597585a.0.1744714044782;
        Tue, 15 Apr 2025 03:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR14+Twk5cFwlwSft3fvWINdHta4kge806Sqok0D/JeIzhe8ayLHbUc1jtjfLT5FrSvApq5A==
X-Received: by 2002:a05:620a:44c1:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7c7d07be091mr164595485a.0.1744714044447;
        Tue, 15 Apr 2025 03:47:24 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb404asm1070349266b.87.2025.04.15.03.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:47:23 -0700 (PDT)
Message-ID: <049d8520-5c66-4846-adfc-cb93f122ffba@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] arm64: dts: qcom: sm8650: use correct size for VBIF
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
 <20250415-drm-msm-dts-fixes-v1-20-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-20-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VfehBkjLzsZtevxXpskaLQfKTbugIvWD
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe393d cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: VfehBkjLzsZtevxXpskaLQfKTbugIvWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=630
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150076

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

