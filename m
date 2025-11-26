Return-Path: <linux-arm-msm+bounces-83345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 013D0C879CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C426F4E03F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C94C26CE0A;
	Wed, 26 Nov 2025 00:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZs7G1i0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8m4dwpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8527825A62E
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764117787; cv=none; b=o7akNq5KIeJIGJieYcRMOOrbXZ9OsSHFrUcxHWMlKr7iwhTdAadFpR+U8nAp/JsXmbEOnmR6x79NGmFzMksi+2EWLMwt4uMGGEcxeOx23qz2e1FWVbM/RyR01QwwckzysXIHjmrYY5L0EkdMpxF83NGA+43/8za4X1FdkVjEVMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764117787; c=relaxed/simple;
	bh=bpVWw7/OynyWPOk7FDcFGO4r8jbElVFGNe0+MNWQILU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIJ3WCMHpFrqsbP1tzxAA/jwwwiP7l7VsEuRJTlJZgo7BgqsFSu5xQtsbvmB2NAffYDsvUj2n+PyI5MIbo5W1uvBfVyih4zCFFSyg2YXt/eBgQKMO38NK7k1dpdb1A39aWDR6N/dZ7RoKR4hdAKp8ZbW3hABBqOAIy4bwVkm40k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZs7G1i0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8m4dwpf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APN4K8V432488
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qy2M96A8lh9VMre3hbAFE80w
	QaeuvpNU7FsXvM6eX44=; b=JZs7G1i0YBRH4/T0xuW0LTTE8gSxxeJC+GSlqypT
	bZOCxxmieWIKbJStxfin5iam69MFT3682fyqJ2vXEcRdpsKhBcU9svUS8h29ycKn
	bQxKn2TdwtJ5CMp5PH7LVEIl8aQtrSQGmc9W3qZ0pwTpMOu1OuPZJWuaVX2s9j8E
	aPmp8smwvRc2j+DnegvITFvsiW0WBssxzGxgZ+m4SkxplEx3KygJiOkwTgXPSXD5
	GwTKfQ4hU/veme9iFZ4Ies3W0pVDqa76g7TZWg2LzQn3JvCcVTsr3c6QY3n/1pGD
	ZD6ukyIQUOKcCUDRoN9F+/lstY/lKWzuU6myoOVcRoUA4Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme8ywt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:43:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b244ef3ed4so1735701485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 16:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764117784; x=1764722584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qy2M96A8lh9VMre3hbAFE80wQaeuvpNU7FsXvM6eX44=;
        b=I8m4dwpfaHNNyLBh/B36PULSabryaWdc7FsVrq3dd3RVGCT5Yp3qg5cgc7Frmaqc1i
         sBiHYowi7RJc7h4W5fAuDTZmMdsLVG4G4xmXTw8bU44mUJuIWzqFewne6XpQhwLk5h47
         0SKsRebiKZ5U5P2dsxrmcZQ8J5/PPb5oL4IUFePoGXOX4BYkj9Y6ytoRqZ1ZyQI+y9zS
         v5o17ZXpouOvCHvLz+CFN25afzFL3cfzAiboZY5hjKgY/AzUR5p3WcrwXF49ZYmAPcM8
         1c0plD99/8EOY2l9PgnelGRK8r6OOjHVFDete1kcrMrnuELQhIpMK90rb1egtqYlXvPu
         NtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764117784; x=1764722584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy2M96A8lh9VMre3hbAFE80wQaeuvpNU7FsXvM6eX44=;
        b=uImq1zFXSOUNIWYpqBh0hkzvlJQrXnlRQgSd3PxPfyGFAGC/vv1kNTuoXjNFDtgyVX
         zJMHOiGMzN8RK4TVga/TJnwBZ5PRsWfCMdVVNZGM10hpoHRkYZa11za4QYcav85Kz9gj
         QsBRqJ8hFjKHquocxS7YiGKc6O1c09wz0mbi2jMQ4G7Ce1POyTa0u8DzPkGWeWlBJWq+
         gvNm89n62j1Ygq3XFA7oipRaW9HjKUBLOsDX8n+XBEEh1WcasDLqavn+hVdaTgTurg1t
         0oEOFDSMymNRw2/V4Z/T7n+UXHnPIjj61rfR2Ck2RfAwu2SPqEKiTX1vwjuDnY8YPjwT
         XrsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXgnE2SkFfdhGEECMqKJtMYT/PgkJQmSZktsZbBtg6kbhMV5U2ttBgow5auz4cMzCRqb5SCTfelUg9hK8P@vger.kernel.org
X-Gm-Message-State: AOJu0YwBAC6UJT7c/d+nLzK7cl4m77qjc1oGtzQ6exNFYBGlhJ2Fm81O
	d55fEGa2+SQBElNz4v0zhhv/PytqLLpfNtCNja9hBMfB/bj9OiJPgSbRl43/DyV+BJnehMtbCIB
	sykjed4qwC+7u9nbTZRrbFBLm7HBynO6+pDY8nGEpWZDJQiryfVHxr0TA5+pEh2C1+0TH
X-Gm-Gg: ASbGnctbfn9tZ7mzznZZd8OfmFx7QySp6swMq+SAktvG/GmB57izG9Bgh2dark0Laa1
	h4194UogdUfo+qcZWZnTVtxOB0vpI73+k24OG9c4JKe6FDpyaBsuce5b0rilfV1rAC0jOhPaudl
	ehiJUS/rnTdLntCFfMBJdgKcSv4t1q1hzV1m3uHGmzC+6mRuqK78l+zmRaoW1TMbPhNqm5gxf2F
	hVvmHNKXHflxFO34naWoYZHn5HKiehFCqVJ1K5MpZD8vjlv1r97XoRh2BEQKWWLq4+iwmdq5mbn
	i4Sa4MmnOKRKw9ZoYJ0qdX4jYoih1nGuvZiOgYhjKePvVKdG7Heu438GjOW5bpfUmDDCffYUzBv
	qKXxFCowWkMi6UxvN4TBwNVBKZFRI5q07pm9PlIaa5t8dcwngXztHy2cDeM80GNRmCRcOsyDGqN
	GYDGIA+Na7WPmPxEkiT/LDm14=
X-Received: by 2002:a05:620a:4409:b0:8a1:ac72:e3db with SMTP id af79cd13be357-8b33d48394bmr2022355385a.72.1764117783670;
        Tue, 25 Nov 2025 16:43:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEFjd/YjiG1JQBTrJawicWskwexI3xdbFSrP7Gp0E1UbGnlmMPWV2ZcK1AsIjtnnEn6wyEBA==
X-Received: by 2002:a05:620a:4409:b0:8a1:ac72:e3db with SMTP id af79cd13be357-8b33d48394bmr2022352285a.72.1764117783165;
        Tue, 25 Nov 2025 16:43:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75627sm5451693e87.5.2025.11.25.16.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 16:43:01 -0800 (PST)
Date: Wed, 26 Nov 2025 02:42:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=69264d18 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kOBCTNg5yw7rtN7J0wwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMyBTYWx0ZWRfXy2ik0rRUj4LW
 QtobeKk4Lqse18Wb6vdMdL9BoDVNqBJRUfrO58yMfuWwdq2ewDXT3ScCjnPc+7gnTWwvxwe3MXp
 hdodbqly6/d1Fea3/ts1ujjYcvobiMyTNlJA3sStiFB4Vx4jcH6B7SDHxW24eOd6wCaFQUNmgk1
 mY1MAA0XukHG3rW8IIFZV2S7yotmVcf5wUyGaf2pA3sL8EzeRKiQE0n16g9qWYijIbN9c1HW/zg
 LocbRHDoyPD5//mHbeblWOaUO93tJ4K3B2xvlZuaI94Hwm+TU+ttH9rI9gwQ90WXE1TJ5RT/XV4
 FnyCG3/F2045PdtDB9HFcs67zJc/7rvWXtN9TK6s0l0S1uZL7vgw479SCY7nNTS7xbPI3uKzrtj
 7qzWAKkLDFtt7pP69Qd8E//29JZfNA==
X-Proofpoint-GUID: F2KOhIUwPIfgSZ-3KF_RikbI36R_XpkY
X-Proofpoint-ORIG-GUID: F2KOhIUwPIfgSZ-3KF_RikbI36R_XpkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260003

On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> > From: Jie Zhang <quic_jiezh@quicinc.com>
> > 
> > Add gpu and rgmu nodes for qcs615 chipset.
> > 
> > Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +			gpu_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-845000000 {
> > +					opp-hz = /bits/ 64 <845000000>;
> > +					required-opps = <&rpmhpd_opp_turbo>;
> > +					opp-peak-kBps = <7050000>;
> > +				};
> 
> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> or mobile parts specifically?

msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
here.

> 
> [...]
> 
> > +
> > +				opp-745000000 {
> > +					opp-hz = /bits/ 64 <745000000>;
> > +					required-opps = <&rpmhpd_opp_nom_l1>;
> > +					opp-peak-kBps = <6075000>;
> > +				};
> > +
> > +				opp-650000000 {
> > +					opp-hz = /bits/ 64 <650000000>;
> > +					required-opps = <&rpmhpd_opp_nom>;
> > +					opp-peak-kBps = <5287500>;
> > +				};
> 
> Here the freq map says 700 MHz
> 
> > +				opp-500000000 {
> > +					opp-hz = /bits/ 64 <500000000>;
> > +					required-opps = <&rpmhpd_opp_svs_l1>;
> > +					opp-peak-kBps = <3975000>;
> > +				};
> 
> 550
> 
> Konrad

-- 
With best wishes
Dmitry

