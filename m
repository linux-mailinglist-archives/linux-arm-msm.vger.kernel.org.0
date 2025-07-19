Return-Path: <linux-arm-msm+bounces-65733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D3BB0AF43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 12:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E14AA45CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 10:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FBC230BC6;
	Sat, 19 Jul 2025 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hw1+m4VL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD978220F36
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752919844; cv=none; b=N54qBgIpyo1MaFE0tWN1+sCVzjfVNgKhEqdztngaUp9tH2Rc9s0UUQciAMSzals2Oc3mSnN5r7i9Q5OJi08lNISg5gVL26jVTe31E2tp7yxnioUH5eddKhf3+qO9Zo/Mp00IbGfuzYo681WO09Dqzp1dMGOUVlMk6LVR77xPROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752919844; c=relaxed/simple;
	bh=utSiTo4TMlu1YfqS+7TeWM6t3lr6x4U04C1TJbKXAXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TohCU6X3BoZ6GbSEbcROOo0MXwc48KGCBek+glcz9D9ORPy/jB8u2xhph8zu++PmHPs37VInkLbS7f/vl4LhDzkHvMBNMMIAkPwsW2Zf82tcMzaQMCtYjV6Ufr4DYLwQR3qs6IpWoR9HAcI3T5RM+3MztjmtrVAdVSO1cje938k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hw1+m4VL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J9WpPb013975
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 10:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TafuwAxxAyRiy+2/X0fzDvpZ
	2vsF3PkzwIbwp+jnjII=; b=hw1+m4VLVuD0e4CoSTymezjhl6AWgsWf1pNtk4AY
	U1K80C2wzZjo8noZRIfas6+lfQ637xNsXbRZeBocrsrllGTWV9Br0LAf1xBbVBUy
	PUE19KxYLcmWhk32a2Qc2Y53SertSD6D4BNMsjITJdApvVkJVsltCSpsGGqSWrB7
	3mdaEOIxattHgNuDICKPyX5znHcYDT/viO7bFQSOw90GDklQNT4UD4DdDJDz/9SI
	5vdjFmaq8nKyZGMSMKtcbPxMuD8JZKDj+2x6GJj3dCzxXxkWXdlltcDBy8OGVUIW
	khlDxvEAcDsUUjBQZriEMMncEeanG07+7oUnaEY3IVcsnw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044f8fp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 10:10:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab7464e3bfso29403911cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 03:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752919840; x=1753524640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TafuwAxxAyRiy+2/X0fzDvpZ2vsF3PkzwIbwp+jnjII=;
        b=iJrkXB90itvBp4KThYKYo5gWdC9D3PxVynbrgaYOFnmOdFyVtfUbV/BoKcKyUBPEFN
         emuXfsd/Ds0IUtUSh1rOEGZa6fILCARP/Nk2/ZDpzAhi1tqJV0hdGdYLUjvEV5EiGs1I
         +jyy5pEDtVIJPhoaxK8zAL8ex+BbPylp+dBg+Qyx7a0Ple3YASXsUpsCwT+lGpfM6VSJ
         rnCoEiVwiGofm4040SD5otzv5fhQEkL3L9bIpw3mXcAcnSZD+XWU5nIYODW666FYVyq2
         mPmPY+HmIuI5XXdyJarzMFCjp+pheTaKnojrcb5OKjSa5jdDZtD7pBUbYgR4mu41pLmD
         oiyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMvhlw2sbOoywEhf/ZVt3MIk8v4SNxY1p7W6t/o1nZev0YkxwTtY7So949oIx1mLy9sHmrfajMBjodWv35@vger.kernel.org
X-Gm-Message-State: AOJu0YxHyOQ99iKHUWpu6c+eH4qj9ymqteGswSgVUF5e1kfDfnbd5uZy
	msXIfevl5h80pBjiXiCurqnvxB2pl3BOc16PVlZ95GpaWp2LGHcwPE47/wPtM1R6p+DjLoQVYYH
	pwYJVJdVttA6vGkL/m643dTl5iKqCgT6SKE/VBg9FclbjGNqLax65Tio858oiUn0e+P+z
X-Gm-Gg: ASbGncvvoOP9g/mEkypbKZuqf6eSiRL6bNNL2hFGyMbOivVwZKhbk17QHuEFHh8Vso6
	8MjDUR19BQEs8HC4ZFcIRAFFUclAQN5Z2sO1UwetFrN9IwlYchVR977HgLFPMt/ur398JHrBwaH
	+UZQv4f8ZbcVr6o/Ku9M78EVb8H+UAN7ZqzAKi89xxOY36GdrEIMZH5zuuHe+4al+8G8CnK28QK
	RAYotpZiBQI28fiXf4Esrr80D+PIQOvzD4p2MsHQFEKBboXI1/ByqXk9AceqjqQ+gS5D4L0zt/e
	HLdjMRy0qNApOxqbwCooL1+bg/HkhrKLuK53DUvQXNoPK6JsXVvhSc9BdZoYU4pW8mCZPidqoQk
	oOwlNhs35n5PUB9pWsFIi0BtLwmSME9X4S0n+FpbMaX7v4JyatdBJ
X-Received: by 2002:a05:6214:194c:b0:702:d3c8:5e1e with SMTP id 6a1803df08f44-704f66ed6c9mr162269856d6.0.1752919840447;
        Sat, 19 Jul 2025 03:10:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgjU49TfyfGJdjzjVGo9vGtcZ/GmenE/HIfg0nrHe2DmMSEvyBaNgStXQurxKK8QsOHT7hXg==
X-Received: by 2002:a05:6214:194c:b0:702:d3c8:5e1e with SMTP id 6a1803df08f44-704f66ed6c9mr162269446d6.0.1752919839979;
        Sat, 19 Jul 2025 03:10:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aac93fsm660086e87.73.2025.07.19.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 03:10:39 -0700 (PDT)
Date: Sat, 19 Jul 2025 13:10:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Disable USB SS bus instances
 in park mode
Message-ID: <px4wsemq2jvt4si33xquy3wzv7fdi6ywp66gutn6wcfdipwyr7@3ofcjfwfoxys>
References: <20250708-topic-2290_usb-v1-1-661e70a63339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-topic-2290_usb-v1-1-661e70a63339@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CDyJUrmLoXoaMb93HOHH0i-Wou9LkMgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDEwMCBTYWx0ZWRfX2gzb1gTarutH
 Mgdm9GkCT5xfIgtxm+BHyJjS940sQHbAeZP5eNCxtKm7/9cmYi/HyYFg8KQ/dXIj2iCS+5onWuR
 IzQe9Qi/MhdBtq0F+OxL8C17TiBQp+vcuZUDfxLCheLFm5HMhZ9G/tyhbS6vC/HvbF343L4jeT/
 wnDHObnrnj/+1PiRTUqd1T1NS3DCt++UZ47tjhB66kikpdJx+shWCOnR9O+6he4MoIUmIPT62vz
 7IYrYKhYRpLChuLu9V55msmz4LKevPi94cdzSa/V3tNZVZVkAzpy1OBTZQEbXxwOBh4Ih5BOtS7
 ov5P9UBXV4M3x4RNvhAQLcpaey65e462MggHcvoBtlbJ2tgLlAPDqqOgEIU3SJPwXsH1qsHNE9i
 0HUnHEa4F2YNvSgo8lQ6ON+bYh5VQRzIh6kr2s/MoamQ4x552pb9pJV7BLGWR6VpZfYBiREM
X-Proofpoint-GUID: CDyJUrmLoXoaMb93HOHH0i-Wou9LkMgE
X-Authority-Analysis: v=2.4 cv=YtcPR5YX c=1 sm=1 tr=0 ts=687b6f21 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=esWAiSMzqJ-acQ4o4ZkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190100

On Tue, Jul 08, 2025 at 12:28:42PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 2290 was found in the field to also require this quirk, as long &
> high-bandwidth workloads (e.g. USB ethernet) are consistently able to
> crash the controller otherwise.
> 
> The same change has been made for a number of SoCs in [1], but QCM2290
> somehow escaped the list (even though the very closely related SM6115
> was there).
> 
> Upon a controller crash, the log would read:
> 
> xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
> xhci-hcd.12.auto: xHCI host controller not responding, assume dead
> xhci-hcd.12.auto: HC died; cleaning up
> 
> Add snps,parkmode-disable-ss-quirk to the DWC3 instance in order to
> prevent the aforementioned breakage.
> 
> [1] https://lore.kernel.org/all/20240704152848.3380602-1-quic_kriskura@quicinc.com/
> 
> Cc: stable@vger.kernel.org
> Reported-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Fixes: a64a0192b70c ("arm64: dts: qcom: Add initial QCM2290 device tree")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

