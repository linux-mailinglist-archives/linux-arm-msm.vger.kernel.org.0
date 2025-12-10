Return-Path: <linux-arm-msm+bounces-84889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F88CB269B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 09:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10DA43019BAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 08:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28A11F3FE9;
	Wed, 10 Dec 2025 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEsdP+jE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzX0v2zT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674A5188A3A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355445; cv=none; b=Qt6Bi27UxVGTi3x+06AQ/dyOUOd1PZxIfKCKIvfI7Jcs6flhN9GsMy6HBnUP1xuCq8SwdxrOXmRBjwvBSh3CiyHWBqQedyj8HWPCEHrSO7A65HIUMYwkZYIHs2cMJNtW5w+r9EoUnP7jwkT5ERBTpyDHVZip98LTuXRroOVsU4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355445; c=relaxed/simple;
	bh=XKrfeJIFVVOYf3N80h3s/vQUVmhL6FOdxFJRJEuUWq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M25HhHjGlm8f56QHkJPC/KTTUx7O88Vjsn1Rfx/vHM8Gh9nclawF25emcWGjWsMUwZP3kOB1QSKr9nPbrIjEz8w7F/dZcaUFCgdECIzVZPsyOz2g3sTWBvV+Rfh3A+9TY5kdEg5Gt0Q/U8UqWGl1jxwJbOkzZgGqggML1gRI74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEsdP+jE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzX0v2zT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6EDJs1780657
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BaVrsxaWW/xE3ijm84e8O1hc
	kueX7M+RVS9RTEowbKE=; b=OEsdP+jEmVLOtgYQJdWiV0cdwhOLghB6WILlPtow
	iz9n9w35272+wXQpuGJ3cTvvnf+04iCTYno6/qbGTynUKrc5AAAOcWbDe8w08Qmb
	Xak+veMGTdahnIprG7Nsa2E7paaOw/SzkbTrykCbWQGBImrXFXiGHbtlBylT4aNK
	AbKg7auT7DV0tEigcaABid1or0GK82GYwcn+ZJwW5zkbeJoU1hox8r2P6tQSiK3u
	JMju5s8IWO7fWZIPBO2ON0lzwEh1q/8FfSyWWAIg9acjTrBS+vady3NjVlKcrB9U
	MG1MN/rsxDKgymkJwQHJbPgRQwZlw8VukXHUm9USYcTdmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axrhmaf16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:30:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f183e4cc7bso65868631cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765355442; x=1765960242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BaVrsxaWW/xE3ijm84e8O1hckueX7M+RVS9RTEowbKE=;
        b=MzX0v2zT9/EizLLwQL3PsvW9hc/ZEoj9JZDSy2V0KIRYc49EReD5PqQCjVqtwhglQW
         X/h0Qsv/iyeOWJh5Y9E3kuHtnOQeIf21TboMz29AUpLVBa3jBa6oasN2PPijFIdh9d/Q
         wkLBonzEUb6RJRu0g7wuNKSM+YUF/pb9PehV4BgF1CaqHbF2961iGEvVaNj7rqll8dum
         PyuwhMc58ZyrAUAJF4fLBbGypjbh/MhLRxWWOcUguZ2dV5invPIh2iNWBDP6iTOufOBV
         fyA7wfpQu60b50nXTHTZyRbGU6kGKUSFH/TVQDPutrSFbZAJC5LD4gwjNJF+1//AcrEx
         kSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355442; x=1765960242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaVrsxaWW/xE3ijm84e8O1hckueX7M+RVS9RTEowbKE=;
        b=gfgpoNJdjEpC/Kk78EAIj36BsaCSKKXVIbFH+HbVlN2kKn3xRSlacfZxfF1Z9uqkmA
         CvicgNUqQX1FrJWnSONEBfeeL5+beoHLMt/S0cnLaWWqSTba6CB4vlWpt4Ym99m/h6qo
         HbxnU6YgBiXzJ8UMRjsKq/LgiOjkgss3nLFat9qR4KB75UuD6JEexRHxDon0IBXEqmA7
         aX0jYn3k3Wnk44DMXpFeKtLz6THfpw2pxEL+cIGoVgmF39AUxAQu9vZE9pd+pYk7Yu18
         BBic8XwnUtHqdk5yfotFi9uUwUS62QeRCKCa7TGKN3vyo08Jiyt8xUw/IlfI15jFGdTh
         BJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIy5ssgf1IffaIJMByUrwrYqdLmvnrJW9g1GBTNezrnTdYApTKSsLGnvHMaKgaJRP9Xuj4Ed1rteJWkHxt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0+d1+XOC77ZvoeLLe7qm0KZ1329HQrdVVV8hmoTTWpxVm1zG
	jRfY9QeyAjyQdmM6uEQ8+aaL0LdvDCXSKqcSTP9BXsE4LpNDcnhgsaquaRKZwwAn00P2rea0Yoc
	4+gd6bCeQs1QzdeeKD5+q0RBw6+gCTkLZECgBhFZlheoqrdEtngHZTF5qo/48eXGqYija
X-Gm-Gg: ASbGncsTsMnXRxgZeC3NC9vVflq0eowVkBm9RE/z+jILOQl9jOXq+XdQYMBKqNnMsKS
	TTwXyMbP/IS6k4AhuFsRjgxCDOcwH8u7CRx0Bsnrz3/wfodnaKkAtS6LitNSUN4h7YsDdGoBZqn
	rCi0YeynLAgCLHlTk178ZuYE/7Gk2DZuu0BlBgF0mfr5MU444924iYs1uuk1wcWZmDS7H8Z3iMN
	cd095msAGyyuEexmsw6UiXiVotSYh58CILXXl5i8pnZaOzyPkwD7p6WTSpxT3KnPXfs3f+GcWHT
	pzJS25i0VT6qNwlV4+lZF3nXFkiZM5UWDYK1lAarHLw4UMsQxesk1FPyzyvgdqoNxRDEHjS9/WQ
	WPQ6f2sY85n2e8o28m7Eit1CcyRqCiDq39CCAtSlEVEBDf1oQFQj5ItgnAS2HRfRaGQ+3C+moa8
	QX7unvrE4o62t6tFKFFuFWP7w=
X-Received: by 2002:a05:622a:a30a:b0:4ee:1806:97f7 with SMTP id d75a77b69052e-4f1b1a7db1dmr15168651cf.47.1765355442539;
        Wed, 10 Dec 2025 00:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtqikgbD78OR/TCirFrEnhCsQjS6VLCnfWR6a+KQxIbEmUhDluyiIUFEvvL7QnBCmP9kh7zQ==
X-Received: by 2002:a05:622a:a30a:b0:4ee:1806:97f7 with SMTP id d75a77b69052e-4f1b1a7db1dmr15168321cf.47.1765355441988;
        Wed, 10 Dec 2025 00:30:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2acsm6186915e87.61.2025.12.10.00.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:30:41 -0800 (PST)
Date: Wed, 10 Dec 2025 10:30:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display
 device nodes
Message-ID: <cndguco6ijb666ugbqpbffyhbbgs2nyno3qujuevz5dnpegir3@ygkh7vctnzuj>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
X-Authority-Analysis: v=2.4 cv=d7X4CBjE c=1 sm=1 tr=0 ts=69392fb3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Dm6QUQfMve3NhQMXUkAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MyBTYWx0ZWRfX8CyHB2j6ujru
 Lt9RsuKRJ4HxJAJiBzm/kxueLC7ekBOXCCXmBUeZfM33GFvqALVq6Cps9zUJtYvRjrGtjMeSWL2
 53YR/M3tAaiNpGaST33IEOZgxzORRhDLv1wm5u4jOF4GNW7VzPCZnTrumYKWZWmQaRMzYdSC0Nr
 nOD7BeLJ42U9HyMG7cBFGzGJXqpXg6WHtHI/jtbVEa5gY1tNaU13x28Qui46MUYzdUGZamkxMOM
 7XZnIKsYSRR1jFyNfpp69NkKwmvDDLMs1K6YMcoHE3T69rcM8qxN0IWwjjQcm9xVX99AacYa8k9
 UeortkcXorsDp7oq9UTB8SiQAQYc0/r0G/xuMQ+IHegqBEl+2aXgBD7QCsHgsp3MaAWXffMxOLC
 CAMEwBK6lef24XIC5GJ7s2bui7glcg==
X-Proofpoint-GUID: 70zawruAZp3m__6YExpkk0IojEVSRaSO
X-Proofpoint-ORIG-GUID: 70zawruAZp3m__6YExpkk0IojEVSRaSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100073

On Tue, Nov 25, 2025 at 04:26:21PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 338 ++++++++++++++++++++++++++-
>  1 file changed, 336 insertions(+), 2 deletions(-)
> 
> +
> +				mdss1_dp_opp_table: opp-table {

Why do we need two instances of the table?

> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +				mdss1_dp1_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +		};
> +

-- 
With best wishes
Dmitry

