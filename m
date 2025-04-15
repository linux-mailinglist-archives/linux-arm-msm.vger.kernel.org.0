Return-Path: <linux-arm-msm+bounces-54394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 618EAA89A8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C0D73A9E91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1617728BA92;
	Tue, 15 Apr 2025 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLkBCV1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145A1E0E0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713784; cv=none; b=LmPEJgdmUkpUnRXgrpkTIcd7czf0mFe2expXicGQuDNn/PV7frFxuWiQ1wLbc1HS2gWaQu/gqwBfFzayAEnerk4r96yLBiLyf6fbO6p4OmCmBJ9KZRjNR+Vvv/+citOiQGPVeOXeEUCo6yIg0q/z5xVI/OM4xUyv2UtVXXxL/+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713784; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+2QuL/yNPNhgLseCv8kN8T8nb4cKWtB42cKQ75y1X9dgMYjOc0iuObEJhZUTkiOMfxS8kxQnpKj+ao0DWDfmLHLUhUeQDxclhOmPflVdqwt2bekGGgzVRvA0oMVAdDyFCzutZfBrhil2LQAoQdS+aJJpmtDIys9yEPJIHaWSLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLkBCV1F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tXLt002474
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=RLkBCV1Fp6cGjJ9U
	GlzbAlhqKuQQrDaiRctaxMdzItFD+AjKd2BLsSCnKxozMMztzVo/uBntR9KwGMxH
	mu6jUe4Io2iYg0ZU8tQ6FhYyMKBVCWb7YzBFu0T0dGhcAchM5tH8/EbHAbizxxMx
	dYAEYgafUSuaNOdvON12op3FrweWLLq+FuTK/iBHGYNxtNnTstIE/4aQoLabru9r
	ebzOkanpw3N0ZL0/w0VxkRbJ+OUCbDzcHxHXSYkXw3Enk9XC2bPtci3+t2g3THed
	sakPmeMd+0ZSTXEtz1gkyDhwrRNdx7nWD8L4ho/yGMbTp/3wmDl6ElX0WQy6Ww9l
	+XsDOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vftt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:43:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so66606185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713780; x=1745318580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=pZmZYahxXrI29SxuBWk76TeAWvzRDkP67orTh6qOBBOKF03mJ5lVXsqvkZxLl+5I21
         F9D4ovzVk5xZBAENWcwlMnJhBSwYhgs5o6puI4agjYcKyY560N9g5EYYKnjEIxd2sfUA
         OAx3pOza4bhi3+2NzLMmpLY6kMu+5rof4Irctl7yBPhnknmFTbwcxlPiPCllcZoFX1fY
         znqt+tTLVQHyh1J+ynn0MIfVeXMo22OOUbQW9zZd9a1F+w7Y+gsiuAPWUlUEnxcDBhPK
         ON5QFsk88pj1WbwqZHN7QcEhBNMMVQakZdu8KpsFcFspbWNHcD0mPRSeadXx8s4FnhL6
         SiMA==
X-Gm-Message-State: AOJu0YzczxyA2G8DrKNGw9XfitfjDt9n2yzeItwOnTbxPrPpeb5yNE+e
	96iHeB19kkcEw7JQtAuv/j77n/AqAwisUWt/dht7kW1PZiWlNyfT8bDrddpM/dXsb3rLdwY9+uT
	s+4mjZoWJY8u3GYlZvOD+tIdZ6khDceeTHIwFGA7mS6bcVO1ZZUrP0MItRfxudk0y
X-Gm-Gg: ASbGncuzaOdmaoti6uZByv4VqpC/rcQ54HkNXbcF7BxhU6ZhSnzmlvVsqlxce2wISg3
	VZ2BkUx+IMI83wBbaWk0V6+TZUBllWy2DOVO2w9FuP9W4hqE2s7HODqSvH9ofaMu+4dBsWYYCBu
	QsPwhqR/iBP57t0Nwlgr3lmnJvs2uT6M1n9sqJtqZ70aKPlVReQDPffKF0zvm8kAnbZvdRvi5gW
	U1KOWJD2SIadBsPJNSEZiNXNZMlkeaIqJjoC0s2PluZDqaqmDMNz76sH9HMry/i5MICW19fCwxY
	S4+yjt9iQGcrV432G1kCJM/UDJ3nTtT83VHTqVSUzS2/mkYRtH7REoGqCtcL+oopZtc=
X-Received: by 2002:a05:620a:248e:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c7af0e4097mr892428485a.8.1744713780377;
        Tue, 15 Apr 2025 03:43:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6rVIBI9h7lSQR79zu3PtxYcJG0tdPKZIc3OfX95srz5PTLQqSUSgpYMRtImnsYa+av4dTyA==
X-Received: by 2002:a05:620a:248e:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c7af0e4097mr892427785a.8.1744713780104;
        Tue, 15 Apr 2025 03:43:00 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee5500dsm6352574a12.4.2025.04.15.03.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:42:59 -0700 (PDT)
Message-ID: <ec35c580-1d90-424c-bac8-4284901090a0@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/20] arm64: dts: qcom: sc8180x: use correct size for
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
 <20250415-drm-msm-dts-fixes-v1-8-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-8-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KjS2z2xVNUtsWxGOpYqPgaC1lH9ahAtm
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe3835 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KjS2z2xVNUtsWxGOpYqPgaC1lH9ahAtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=630 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
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

