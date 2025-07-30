Return-Path: <linux-arm-msm+bounces-67112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 603EFB15E15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75C2B3A439F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C534627F16C;
	Wed, 30 Jul 2025 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2lhwnMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F5422156D
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753871137; cv=none; b=e2ifbRgEo0kPJs5jbG+4JuBan/frPNM/nwkBpoX70zy2emxtKB6nn2HQZPV2H4KesYvuP4RWdbbkyO7HsGaIycNQRHLQhz5P0ChwvhT+cue0BirSlOymriQKR+cxXPlH05EGSDaYDGPMwFL/81e+Sb646xl0Fa207/v25fVBy2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753871137; c=relaxed/simple;
	bh=hfgO/8yLce5wklzCy0SXQn/TWgh4OLbtWWSwWhKoY+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cbRhjWOYeH0zdtr1I3KGPwiwbeRGP8XfUgRlMaZUMHOnx2sppNJO/V8Vcp7QMTinGykmib1Cf9453hfvRiDHdj0lq0Rv2hqLVL3GAJNuVWK4rz+woDa0p+TBipkx9rgO6SulVnmANa148daYGHil2ys4vH4CtLNa09k2uBf+/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2lhwnMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6WTH7012781
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VU19aOSOm56x7/zn9FprtBwoPEraQQ7b/Aj6oWD3uuU=; b=S2lhwnMDthYf3/EN
	Hl7XfU9ZkRuv2ao8FYOqGVW913VXGcItCUnpfYKFW0PxM96Z+t/h6NAT6guwdsB5
	O+q1oCOsYcuVJSioQEHzFE24jaw9O/k2P1WpKKhh9lYRQ1B+EDz4GeuJl+FF0nH8
	r0vKNZEtWq1uMBPzIx7Xu9Sx85jkLwcC7g+ypMkea5KnnfjuSEhlG9m3mD/Zmk2N
	rqME75PTgjBSMCsPNXp1885TdEi63yO7O7bmuXHXSvmajpDbE/T2YX2v7PWHxcQI
	ogchR9HfBo/f9uvqImgkLaMwW4+yZiMAtOWQaKFzCr5+0H4sa8FpL9awKjs8AyGr
	ZDSxUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda39gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:25:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ae762426d8so4608251cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 03:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753871134; x=1754475934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VU19aOSOm56x7/zn9FprtBwoPEraQQ7b/Aj6oWD3uuU=;
        b=vOI6tYAmlFGzCiGpFaLeuLZlaR8H6glPjIMfPg6zL23ENQCKjDX2ieE2o44e8q/uQh
         yPbJUugT6L2IUMM4lA++zUMYL5ZzlQzEiByGwsnO3xkXrjVcZDgJfcEAUsHE++VQ9ntb
         2b1Q1BQJ4oCC6nphZBSSVb5YBVfMbx4Y+BjC9eAt7ij5PYDBGuQWHK2BXcYIn3xNUnee
         SSvZMK2E7qc5PGNLPT0Zgxsh2RQ/x5ROtO5FBpB4A2v5vNVds/tyob+22BmVHKRB5Q7W
         6yoCz1HwcTOvSCjD23UxTbwBdJF9H/s4TX/tluY5DNEanBNe/6jC7+VGYnSjOt9k2yTO
         VBjQ==
X-Gm-Message-State: AOJu0Yw4E13zo/SzltOgXVrZtE3dW4568H/Cd5NWzLfMvsef4b/CDHpk
	f4lmOznrlSDFkidYId3R1bYHpguoUddtnGbXVrA+WdJF1WKRFCjD4CJn9TQnQYdQaJDx4iCymar
	s4i5qpK+wczUv/L4KO97ohVAHxFnfkd+CA3802kR4rBeviF3/cKYOI+7FGuxHJcuRMQgW
X-Gm-Gg: ASbGncsAXZTJm4BaAqllHFuBRZGzT6L6I7yEo5sEiJR80qfSpDjmbfodC4rPOr/wUkT
	cylCyqW41AaItiCu3gKiFimPzkVjEJ1RD5f2/jRg7O2u/xLW8x1ZoBn3QEnkC1viowb8xI6POk+
	kWFt6Zo60qqsgHMZLSSd4f3/j7XZel36J6J94aWUIXMS2VCdxFxy++iMcWl4l0T0MHpnIu6SoQ9
	ub6dVrWv7RdZTAfEa1DHUpDgF6flNeJ0VYKn3vnPZXQPqT59U2DabYDKO3wUQ6GumQJZAwfmFVA
	OhdH3Z7xBltWtS7lh0N+aut0KLJ3hmHg9hsEqjOf1LWCD/N80QY4JthMYIU4XrEXkUrblL8G2Ed
	u334u1SB9oD4/DYaw6Q==
X-Received: by 2002:ac8:7f8f:0:b0:494:b722:141a with SMTP id d75a77b69052e-4aedbc28da7mr22576441cf.13.1753871134219;
        Wed, 30 Jul 2025 03:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2MoFWPpyzdfwxYmpNHy2wlZZRbH85Mua0jLB3ZlgUxjY101B5fuxUH7O7k5j3qpTqRTcx6g==
X-Received: by 2002:ac8:7f8f:0:b0:494:b722:141a with SMTP id d75a77b69052e-4aedbc28da7mr22576281cf.13.1753871133823;
        Wed, 30 Jul 2025 03:25:33 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615923e13d3sm514484a12.49.2025.07.30.03.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 03:25:33 -0700 (PDT)
Message-ID: <f3aeacf5-f178-4e61-b34a-60353f89daae@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 12:25:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
 <20250730-dts_qcs8300-v4-1-5e2dd12ddf6d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730-dts_qcs8300-v4-1-5e2dd12ddf6d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UJYvgiloUtUmrQ4n570LrmPawWb30EPl
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6889f31f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ggSMAipNaOlLgWN-UjYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UJYvgiloUtUmrQ4n570LrmPawWb30EPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA3MiBTYWx0ZWRfX/t4XQI3EDJlQ
 9c4GmBk3b29OrYzCFT4U1uT4lXxRnE0tZUQry6I/gYcA8URKRsc2Es8hfPbAMW2RLTs4lgCrUaY
 f9tJcTAusjjnP1apsgigMzDNKnVsAsquqgoNNXJT2+WJGWQoMhK2x7v5r9Rwi3Yl6L/OuUN+Fd7
 XVyMrERl/Yf2spJ4boVBsBnLoZ9fq/30zraKspYrF21ToM07th+LNKsWScAQyGOM+7nmJ2zRxB8
 eGVd3d96LjMdxcR7F92N8KhPjFLDtjLQLxBCfhc0Ir42uhlDQFvrs3j/LRQed7Hn5LtDTyEj4DH
 T+XEJOePi6uam2ULsBS1S1NEpCQA2S2OCuYZ3xyR4P/FSBdGKyAPhd4qTkxQCsLrBexUHP0ZrjZ
 3NFTFEM+jpzDD3MLxJhR5xVDzTB7KlPbOLt9Yj2sgvnWdUMOAPQqpHRn1xPBberJwcc0Yvvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=901 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300072

On 7/30/25 11:49 AM, Yongxing Mou wrote:
> Add devicetree changes to enable MDSS display-subsystem,
> display-controller(DPU), DisplayPort controller and eDP PHY for
> Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

[...]

> +
> +				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <19200000>;

is this necessary?

> +
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;

interrupts-extended, file-wide

Konrad

