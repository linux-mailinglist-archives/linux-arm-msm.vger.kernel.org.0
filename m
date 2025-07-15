Return-Path: <linux-arm-msm+bounces-64974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DC0B05595
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D425D1738B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53812D375C;
	Tue, 15 Jul 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NK23MFNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354212D3230
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569824; cv=none; b=GAA37+E/rPbwLPdYsSjiPId1G64JrqemnuEW/dTSHptEuPHZe3BBjGBwbHllzoI/NBc44IIpaK9YKs+BWUs4HRJB+bNT6wQWW9eUz9W469Appb56NvCjFxwhEfLZD6QMlUuPy6T7uotoJVPdf8PuYTAHv+0KIVTNcCYtXeAY4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569824; c=relaxed/simple;
	bh=KNhNv8iL1vW/f8y+mhCAJJMrpgumlNJWf31iX1TRgS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2Z0RC8mQUQweMEAeIvsXeeeX7fdH9rG25CVndpoUB9SaoVRBv8mrIR7MN33+u0PWlVVSU07prrLVEUW06Pg6MiPkMKTKc6YRaUa31Q7fTF3XAHRcezAHiAQLVfRfsNwuMo1qMbRyveWoHpfPoVIp1zUCO9sUPaRAgiGM9w7YYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NK23MFNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8DYVl004347
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ir21lKeD+kOQr7Em6XEQjan8Fha+E8C4JGKluz1QbQ=; b=NK23MFNStuBsOBSl
	Xh/xvsLx9AQjGrFXD53eJdCu5zef9aRIgbuPnjQ0WoD3jj/1oFsfe/SgNokCNCHQ
	WnwNEwFykOKplX4po92s1PHsd1HBWRQGtCNSBeaufHNLZiq2ly9RHuVtwXr3Grfh
	pjRPEbh5TLFWmxprHJ0kzfRFdLGFonhr1L0jANJGTov04tX6u20RIrPbBwn2vjjV
	j2bSWV2PxnK5Gk8zAboavkh+JT/jJlUPTwwAxuytCnDAfXBsG5ocZf6bTiWjZqpY
	d4RZWmImUqNR6vOtcOq506EAOW/T7nFdkZcqg//wFAiKmfroRpKV6UP1iSEUSeo7
	4uDfCw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxayjpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:57:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6facde431b2so13249476d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 01:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752569821; x=1753174621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ir21lKeD+kOQr7Em6XEQjan8Fha+E8C4JGKluz1QbQ=;
        b=RABVEZR5RnoN82ZordAZ49kmWVtD6oPba2EGSejU8VsO+xITtmc4gX4ZRtN9jfhw4C
         wNAyWiqLOjWpQOSy2ppHeMY/OZO2HnHc4teLLrHKdMB7Ls9WjhMMyYH6UuABTXzvDCaI
         rJGu/xhobHw7FmxAgIYR0GzbBFRyFQP4zEioXXg1qSRD+SB6gEc6dgCTSFH8KjaXSX6O
         smqb99ID6NeA8C/vts/449jMumq+NTRR53k249FI3ETiEgmWvfu/qqaNYKiHc+lHGlfS
         wBwFzTGRfSOT5zcrt0ODwI5sILezs82avTiTxxUp3Xv78Nd6EHoGcY9D17MZEZVkn/dg
         C1wg==
X-Forwarded-Encrypted: i=1; AJvYcCWW5lvoaXfOWSwzfmzdgZ7pFz8fAz00TEZFF9Uy18LPjwni1ns7fDnJG2yKgZh0rG9adzhT3AtsSkOemHUa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaz3SxQma5ZuMx9eiv6R/GTRFUQ6I3UkpbUVrUTnfyCl8wGZG3
	sS+dOzV7cM1Gph8w545QRtTIrGr7VMwXLslBcEALcfjKNZWVtE5mOqOILxBVb2YAEEH76kLYB+c
	xg8YuIL7sg4ZjCuJ8Gno0Bhz2OzYnhjfgK6uC4IYgY1QTZFWqf/H1otWYs9I7MVU/Jdkb
X-Gm-Gg: ASbGncvX3UDPmeUn6WvxpFRo9SuwZGTiC704CApPzc4TG6nfcdhbwlora2rYRirzIeE
	JAhi+lDTosQeQyltz2Lz7PxlfhzLQgMXIUgwMJNGiUkL3M/7SBhzygSdTKFO+m605iatc6kpLPF
	tF8iHW4oO1f7yRs0JWB5ml/b8QA6YVnoyAxxtvnU8PjT3GcU68GuOTjQVwAThJIarpRwp4CgQXF
	xep/D1F1o90oHu+r38z9IJ0KDy3tWmuckJMbRfXx8mp/kt3XcQVD1fByWDIWSvI0NKEwC0iv22t
	MqEMeCV1MpTRtMURUHKr2p1e/fokb2Sb2bLuvV9P9QiZAJQISH13To2+og1Hkb1l95fMbGtAqLs
	93AAMYFYlqNLI9xSDK5rq
X-Received: by 2002:a05:622a:60a:b0:48a:80e5:72be with SMTP id d75a77b69052e-4ab86eb948fmr4403821cf.2.1752569821043;
        Tue, 15 Jul 2025 01:57:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECkT4UhGrfWPMRKyPC4KgJcc4XfSCXn+YJKNfJmaD2D4nOlGaLwwKXRfhVvXE2pLYC810o/g==
X-Received: by 2002:a05:622a:60a:b0:48a:80e5:72be with SMTP id d75a77b69052e-4ab86eb948fmr4403631cf.2.1752569820407;
        Tue, 15 Jul 2025 01:57:00 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91bd0sm969967166b.33.2025.07.15.01.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 01:56:59 -0700 (PDT)
Message-ID: <d073cedd-838d-426c-b134-8e5dee939813@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 10:56:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: sm8450-qrd: add pmic glink node
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, neil.armstrong@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250715052739.3831549-1-krishna.kurapati@oss.qualcomm.com>
 <20250715052739.3831549-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715052739.3831549-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KZPRZYn01Ssu8SScSlbNFR_oUwpbGwJ3
X-Proofpoint-ORIG-GUID: KZPRZYn01Ssu8SScSlbNFR_oUwpbGwJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3OSBTYWx0ZWRfX6smD9asw1Ljb
 m7fq8/TZ5QJiLiQa1TwctgQ6q7tF1k0M9J3v1WA0C1C8PEMIgjJoL3Sv2rF87nnga0vS7L7WUR7
 DqwlGWx4VnsTvfy1pE/RSqNSMbGvfWXbdTJgaXJWyQTFWxMVg86wR53sh5yNoCnk4ndFwjHmsXW
 1uXyT8VxtdKch7Gtyv53MYzp9z3n2eoe8QEzvi5jhQJhi9IMuSLOuQIC5z/Y1kQMaP59pYsGpXH
 w3Uk+Yi2W/iUKa+UOUUmeICGjrcrogzgHvizeFVUSXSbEuBFAfz69E1CDFioiTMip19s7s7cjrQ
 Ouz5Mf4O1jtbrqGJ5AhKP5/62Okbq1+BrKHkkLn+TO3WjxXgkiZf31QRNLEoaWQ4cB3/Xv+DTa6
 cogKDrq4UzxvUU00WQaK6Sv13ilgF8kCoh9rmJTz6xiTP9Eykb6sxwhqyvQGBCKGnPwy62z5
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687617de cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Ipc7ZzALqdnyyRpRyTMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=795
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150079

On 7/15/25 7:27 AM, Krishna Kurapati wrote:
> Add the pmic glink node linked with the DWC3 USB controller
> switched to OTG mode and tagged with usb-role-switch.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

