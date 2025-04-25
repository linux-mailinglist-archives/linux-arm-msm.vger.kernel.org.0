Return-Path: <linux-arm-msm+bounces-55786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AE7A9D51D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 00:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4120D189924F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 22:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489542253B7;
	Fri, 25 Apr 2025 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vzn1l9mD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB61322A801
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618872; cv=none; b=UqIZ+CPpCz2VHKpQ7LOAQW6jFDgol0ry4assk4ofRreQip1GyitxSk/2wOnZLOuIIcUG3rFGMWxSmM0dsOqYw7iAw1u7nE0tQybuHTkhcvD+9bVMTVAfUC5I8j3j3SpTUiDBdhVOSl09L3Iu/Km36Iz4e5skiIGCjHkHKfvcnxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618872; c=relaxed/simple;
	bh=p8LsTibyND0DnwADf4r0Tn1HLyKKco2rjPXuinHa8Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+Z4fZYWF8dbj3dmpudVq/yM8RYkscr9qb4Yy/UIpooOYlq/VIEE9TY58fmm5VFpf+P+x+8osIpuu0nQ9pVfS5lT/Cygq/AVKWU7vkGQWUB49MN0V/ZQpz83TWuC6e0t+1wKUtQ9ZV+FDTC49CoaVhxieL7HxKNXYvMFaI7CVLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vzn1l9mD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJveH024825
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 22:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZjLbgaMb2gzy5ZMtFsZdJBbr
	vlVa10LTxyp/cNI2n9E=; b=Vzn1l9mDKY+0FAfDxIg3twqn7JmS3avVlqcqJWg9
	AK/Ar3aVJim+tqUtLvJywrnvfSvbjnTz9oh99WOf/c8bE3Nf+e5M0Ziz1vh5xe61
	c/XqcwPu/wXhmoV6Q1AmbWuxLD377C7plqoSrONFNuqMck0aT/cUpUI6xF81nHgM
	MJovibB/qP4rOr8dLatizUQiKBBi2/Fw/EZ543+WKhBAz+WNdxifpINmb13MY2B/
	Lfg2sgjryklc7FJ4hh0bx6rk1aVDuCVDMUSH3IEblDpgOzs2pHS0osRTWPk2ksjN
	48zWV+Vsj0Wjy9UW6pof2lCWSzb/sFSqEmtz3k2ADCdtPQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t913-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 22:07:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c9e1f207so45173956d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 15:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745618868; x=1746223668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjLbgaMb2gzy5ZMtFsZdJBbrvlVa10LTxyp/cNI2n9E=;
        b=GVM7vFHETMrVsY39T0SxuYqO+7yoS/hnnqe9CbLVRdyAsYHb51cZnXAfAzvHQxyGaA
         POujtGnN6fFe2B4Pu1XU1Suon3PKTNFSNLhpIkxhHBbo9QZ2ppTggQVpZ3mcFpailnrZ
         RyarQp9NGUqbo3yCLetiV/eaYQf4XB0tCx/Lhb4y167Y+iUo/jqKy//I26gB+5TmZKQm
         bEgjwR4fHo/onib/ZisJyg57YzEFe4US3uS7sBVsZKCBFywkIp40pyKyYWO1EiO8EbMM
         +eIeqXoBaG+SNUCu7OsrjL3YA1f9fhEttIUQe00tneZ2cwOsjZg5/EPfD6vlDGBH5GqA
         8bLA==
X-Forwarded-Encrypted: i=1; AJvYcCWvXGxzdS8vyZSSj35MfG5mq90NVj8yaSJJpJzsUU0gUxIDIgWodJ5QmirBezLTpuisQIcxotcu8IOr43/J@vger.kernel.org
X-Gm-Message-State: AOJu0YwJgffN4xbcmlSFuOBG1vTwS5KziBgehsSbtTGtayn1TM9166Tg
	D0Yc4iKS2iCEnNI85pk8vpWEOg6GCfJClbltzWnrKCDB24DYhBt4G/9O5ltLeeAkkMVMAWCdjxw
	Rb73mAuSKOL9zWlt99YE++uAIBgZUZYOYwvPw40y1Hf1yWsS0dOdggz3+Y5G45E0A
X-Gm-Gg: ASbGncv2Gr3+vPxhKIpYqzam9XTXS3AsXb2tG2nopCWRcYeRZPNvnAGd+ASoPoVVh0g
	pu/+DN698WXfCs05YCpumI5CClVAzyFvcal5dgqNG+/XRxr6DaszXHw6KBcOcqD4gAA1reIkFKs
	L+2W/AbJ48UGE1rZbwBnGzwmd5+iauwny54d6naMLdLuh7WqeuwjLvK1MlCDVVuWD8lGjhmEYl6
	TXfq/V0BlLuYH9pe0KMio2GlhS68kcbTr/B2CPQMNtPMHN3S6R24fsquM23Xx7GVj9cWkx1+Atk
	iOopt0TO2NOllt2nJ8mECB8zholR2CtImf5o4wXuFoBoGPbY/XK7MHfCkTWa+pvccxNX1JA114Q
	=
X-Received: by 2002:a05:6214:2a49:b0:6e8:fbb7:6760 with SMTP id 6a1803df08f44-6f4d1eeb835mr17558126d6.1.1745618868587;
        Fri, 25 Apr 2025 15:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB3bD18bsnXWBak264Z+N0Kc0M6IK9OC9a86IJ2/ODHBkGasimg2aVWzSSJDDpU5COODxriQ==
X-Received: by 2002:a05:6214:2a49:b0:6e8:fbb7:6760 with SMTP id 6a1803df08f44-6f4d1eeb835mr17557966d6.1.1745618868268;
        Fri, 25 Apr 2025 15:07:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7f1asm753379e87.237.2025.04.25.15.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 15:07:47 -0700 (PDT)
Date: Sat, 26 Apr 2025 01:07:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
Message-ID: <57leox2rgsdbcrgqrghyq7h5te545by33hmkscjdj3ttedo6yk@4nwwtecdw77w>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
 <921afe20-42b1-4999-b5c4-035669dc831e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <921afe20-42b1-4999-b5c4-035669dc831e@linaro.org>
X-Proofpoint-ORIG-GUID: RgPRw0Sg2oU4QNi1LwYIL19zZtUjrDCd
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680c07b5 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8
 a=3GFBqLPdguNaL9GZ_X0A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RgPRw0Sg2oU4QNi1LwYIL19zZtUjrDCd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1NyBTYWx0ZWRfX4P4f4GUmi/ke wz5Rt3quusyn2lf75zErq2mymw0kGR0yzflwX/XvjkXrUm16ATrzDpMoqwiVqqgosd+MI6b861G O6ilBAsRQDdIMM0Ed6YvW8415u8u3Xk3WHhYiq3myVS+PnGhqzn/9yD1XJlBUh3a3Kc/kTmdoog
 sgE9MvUgpTLqLoLoH+ONhMY1pVnkUudZ7UB3CTIsqITolrbfyrJ/otDWWoDVhJEhVilBWCwd1SM OMuRmF6nis5NeT2yhcLLXirWwEnZSAgymQN6RfvpRA2MnhxJA2IlzXZID6gmcmBwS9Er3IWdl7m /uzmoHhQAviSspCJ1nZE5UB/klhElyJbYEY5KKG8GcF9ZJBa86TeIT+hSODPwVmTxmYL41fXUFK
 W2G055rpicE4z5tXbBuMelhx85vUSW4k697F51UvJBakkRekMBZld7zVVr6MGunqSKKBdYTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250157

On Fri, Apr 25, 2025 at 09:54:47PM +0200, Krzysztof Kozlowski wrote:
> On 25/04/2025 21:34, Dmitry Baryshkov wrote:
> > On Thu, Apr 24, 2025 at 03:04:24PM +0200, Krzysztof Kozlowski wrote:
> >> DTS is ready and I consider it ready for review, but still RFC because:
> >> 1. Display has unresolved issues which might result in change in
> >>    bindings (clock parents),
> >> 2. I did not test it since some time on my board...
> >> 3. Just want to share it fast to unblock any dependent work.
> >>
> >> DTS build dependencies - as in b4 deps, so:
> >> https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com/
> >> https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org/
> >> https://lore.kernel.org/r/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/
> >>
> >> Bindings:
> >> 1. Panel: https://github.com/krzk/linux/tree/b4/sm8750-display-panel
> >> 2. MDSS: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/
> >>
> >> Patchset based on next-20250424.
> > 
> > If the DisplayPort works on this platform, I'd kindly ask to send
> > separate DP+DPU only series (both driver and arm64/dts). It would make
> > it much easier (at least for me) to land the series, while you and
> > Qualcomm engineers are working on the DSI issues.
> DP has also issues - link training failures,

Some of the platforms have DP lanes inverted between DP and PHY. See
patches posted for QCS615. Might it be that it is the case for SM8750
too?

> although it feels as
> different one, because DSI issue Jessica narrowed to DSI PHY PLL VCO
> rate and I have a working display (just don't know how to actually solve
> this).
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

