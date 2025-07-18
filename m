Return-Path: <linux-arm-msm+bounces-65618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC2B09F58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 11:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B113CA42661
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 09:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A469D298261;
	Fri, 18 Jul 2025 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMa3nh+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7911514E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830602; cv=none; b=PC7EC54SEZugWN2aL6Fhvl8VHxB3JtG16LXuVOlMInzY/3nKV1d7VGqtNmzZG9AMskbaWUv5DzFf1q83veyzpylAsUfLuT/vR36IyZfIhqiImxQT7st7faw4ugG2KiZbBohtiAJPjmgkLjQuFRVVr2mD40RF7h9IhM9GKPplO2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830602; c=relaxed/simple;
	bh=RcdS4qXRNHqoIFtflPy8p6xxpU4RVnQO+PYcwJzQfzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtX9gK7UGauOootCWpdWBSrt2i5R0l9uamhGunKOsWm9ZjjNFZwx13pU1LwUHu9a0iNfV5U379LUblOUGPYard/eIgICPEjhZO+SAN56DNQ8gdUKwDuLufbPuQFPudUjvprwzBGVEenCY1ycNJlLAPsP9AT0eaZ1TkubLQogMGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMa3nh+j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8TpkT015642
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9tbdwW74cZEyqwu7Rui55/J0rnn4mTkIqlUTKDRA+4=; b=MMa3nh+jnbnhJj/n
	qLQLWRiB8S65cc2Ewc0lGtk7lveJn4/SBE3pbMdBizMtCXuUyixMc1OkNBN49KTg
	nZ2nREVccb8OVDQpqgK9wlOQzuN3Nf2BvQ0TRg0R2Rn2mBmRxSIcxhMhGzpisIjt
	nB7dKqeET01QFmvtrzYIznq9zZ9/ZCDczjvrnHLO++e8lONjZZP2sFNykCgKnMma
	Ixi2/NtSYvZAnKU14/XT7d6a7oQB+YWRG7OsJ+QTB8LVZC6euEmaZlwiWK1GiWc+
	mwLdpRPLgROVQm59wwns/lyozmb5pEi94KDrerDGy5uFiHm8xmxM5cuqN8dz7swz
	iY3WEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyww30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:23:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a9bcdc73c0so5179601cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 02:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830599; x=1753435399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9tbdwW74cZEyqwu7Rui55/J0rnn4mTkIqlUTKDRA+4=;
        b=dZCaoFNwInVcAKNpPi1WI8GZBKbROUiCTfc1T2iQBwUW6k5Foe+GGzd2OdXS4i2y5D
         vqQas+y6CwRzHP4hRVl5WyU+sbeiZEag59KoJuU7+Vm0dPPxBfoHIkUHh4MbJbITO5mC
         Y1vNkgimJzBWYkMgQMQ79+8YKnKtZ92345kw3E/wZMHwuWBlamBCJ0SDdlB/45zXlv9l
         K07NiZOoY1iN5qcB1qfT3UO9vPLuA1a0yDLpsSnxmrbZoHCkSbun6NiKPu7UkeDmppnT
         csQh6ik7HD1icV1wHD84rFhkjPQZMgSJx6giOEzcCKhjul2VYkBa3MQC5qbKurrPqVbx
         CpOg==
X-Forwarded-Encrypted: i=1; AJvYcCV48ixJ8bwvVjk70SBsSjAgweVcoTz6M9yC3SH//N6kwSeXeh+KWAsg4plYc9tY5ivr0nCSKlS8ZcTfFK6q@vger.kernel.org
X-Gm-Message-State: AOJu0YwlEM7+kgknPMQwNlKg955UmPtz2JS4mYx0AlIq42ggwbEWIjRP
	nuiUR6YGhrXFU19Qzj5IUs3bPAt5+JbmVmUDcRXOu7epdS396MBPalmwCGjW7MUW56fNTA1QU+/
	PmRYfAUycgq9FHGMibtgw164B5G4W/5vdpi/nfIL5JNXObk1Jt1k/vnJtbZ1aXwamYKIE
X-Gm-Gg: ASbGncuOoXIAORPY++KheLEYS8FcTQNfKN/5Qd5bbKGTTUpVE7WdqyiZinPes4Z35p4
	vfmmT7DQbDA4fxqsog0idkJ9Eo2j+EdfJgAfwUHi0Am1Fm1q+bClTQUP4n4qAXnwaYhE9sXV0Wh
	igVkIZxMqp/q0zI+r8Heuk9fZRHX9X5tNwMl9dAKNget4YV0l/PNXnMs3fJxT3AvKDiRCeszkmw
	oWnqKsJqY2cyljnwdlj4hegljVxudYfRlVeXFs0GkQuI5AVcK9y3dBGu7XaTOIHz300HDLwCAKx
	dOhsfUU11dVhgp6Ly/4mdc9poAENXViv5gNT70zwKn2Vqdt6nhOORolVQLXdV5B/n+NutDFxQht
	0h6oMMifqZ0rYwKAMqGlt
X-Received: by 2002:a05:620a:27d2:b0:7e2:1609:a19a with SMTP id af79cd13be357-7e342aeef45mr582360785a.8.1752830599193;
        Fri, 18 Jul 2025 02:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp5OpRRRlubBf4j3XB9hMRhuiSC9XEu5aCviHEU07bToJoCBMGtr/bqJyK9a710HZLckzjkg==
X-Received: by 2002:a05:620a:27d2:b0:7e2:1609:a19a with SMTP id af79cd13be357-7e342aeef45mr582357585a.8.1752830598696;
        Fri, 18 Jul 2025 02:23:18 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d9941sm87211666b.56.2025.07.18.02.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 02:23:17 -0700 (PDT)
Message-ID: <17ea4f08-daf0-406c-8760-23a23417ec1f@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:23:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov
 <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iw1aPmoJx77WHDrE8RuAU-AMS4AQUk4G
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a1288 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=biz6BXDC6RXR6m6nPMoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MyBTYWx0ZWRfX4uyjl/mkKW7O
 30vB6ti+I7RwlcGoAmupjbskziRehhnLL+q7nrsqpayWrA+CsMap1fnrD/+9FwlnR8jkAc5Bro3
 jOXG6Azl4UAgIU9aoEQGVqpLFxk3KbNBj5+VpyX66M9tucpcfXQHMbZxhnt3K2BwqHmEj6snXgn
 lHe48QOz43UYmWUsRkTfVLKN3qiUsLYCnckH8Gjm01WDBq6u4WbLfLfdyQ58Hvy4T4S+EkvKxXs
 13E9f8McYp2NxTzclK+JpyMO0+WGMTTjpJTT+urHodeFKpRYMQwN462M+Kbx8pC5M0LEUjXoTzz
 9bjY4jLv3jLY88fIclqQcX1RN/wVaTzvxXreqZpENQo9zC9h/isFCYfInEBQlD02i9eN21B7UgF
 JuG0OFEuqWSQ7GlY5KK9xcOep+sB/QBGU1ZcLNUO7NEiT3hYlz/4E4VSLFviOkH4xmyMyBPF
X-Proofpoint-GUID: iw1aPmoJx77WHDrE8RuAU-AMS4AQUk4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=575
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180073

On 7/18/25 1:28 AM, Jessica Zhang wrote:
> The following chipsets support 2 total pixel streams:
>   - sa8775p (on mdss_dp1)
>   - sc8180x
>   - sc8280xp (mdss_dp0-2 only)
>   - sm8150
>   - sm8350

I think 8250 can do 2 streams too, no?

sdm845/sm7150 also have the clocks for it FWIW, but that doesn't
necessarily mean they're consumed

Konrad

