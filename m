Return-Path: <linux-arm-msm+bounces-90168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKgrJFMBcmmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:52:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACB965882
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 071FC6AB490
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC41423A93;
	Thu, 22 Jan 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bw0MO6Wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W009jBe8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C906E421A05
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078477; cv=none; b=k5A2YzXvk0H1UbayKaMOCnLjOBvTTpNH6bFwClOYxXuiMYn06bilYNsmHotNgKn41c6DjgOKh60hWilt7hEqj2O3sjhvDkVu4sCPJxJTAqpfTYkoFuY2XOGcx1r+k5p+FlWsnDDvm2E52YtumfWRyV3NM2QHEhQ3Elxz5GGb63w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078477; c=relaxed/simple;
	bh=IntO+n+LQ20XKrd7RLzJRXf0jmoh3bP1QP5pFAbUkEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMxjuxkYhEMhdQkC1IdzHafrJ10r5mQXC6rlmC+n/79MET27SMZ2oP7Ios/rziNnfz3WvhpdLVWkyYTm3mezUJ4bmfjbcX8hc0jMGGAHS5L60bDOnrcMuQTuJ77PT0ocfDU6Um5JMx9U6VkkJAjkx/R+FVKI0AFrj2T8tXl/M2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bw0MO6Wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W009jBe8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M840qP2282653
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QtMlomMObWsD4s66Z22CbpafYL/6GzxzV3tYzPqCmO0=; b=Bw0MO6WvzjvO9D/4
	jVTTtC5iHer6dT4gSKxeM56FBu1ON3gsx0P/7Mxy9yiqfjqBthqTRx1lEDI+28Zw
	Zutxan5a5cwAoJ7dmWXtRxSciSx89IGxkgbrd6lzUT7lC4j4kwoDdSoOk3ykzjX+
	etSDik/ZpEq0ppRgoUc7rtV6PaPCLpMURj6Qwp2Rxd9p9/jbmOUne+xNRfBbiH4l
	8k45hCv6vCk0/lXkoO/ZIMandDFlDxQbmMG9MjSI5PEHjEgOwsjutcf6B77fNYKg
	cIKui0CWf4vrg6xj2f2xygB2BiroOBjAxeSMexHxn1JLDdbWlYhYLHCfwKLF5J7o
	ytCeXA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fasyt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:41:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5f5409de680so76285137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078471; x=1769683271; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QtMlomMObWsD4s66Z22CbpafYL/6GzxzV3tYzPqCmO0=;
        b=W009jBe8QrK8i0tkWShnZf5wPzeZicI7ZqSTjWg/YRdBHYu/ku0XpvWyXbtulGscDh
         sycWYNjKBd1GaVp5+6WhmoaSoDr+yM1lz1RdinZnEblXT1CPQKYeTW2ZRbFhwon+AoRX
         O/LU2UY7FIRBzevvxjpn97Uli7F+6Olatg+fPR2yCYRHitVzzsD6kSVxpyFlF2no8+8I
         qwUVEW+QyWbdeGlErYdzssjfLljnSXlKRancJTD60msJ4jZnxwJ9dRIElobKg/07OS+D
         qA6Iv628Yt1E+3tWJUQGLhlsAikqTYN+Ff8Ws/HBUkctTJFeh0FtCe/i1l6Y7Uhz2Ftp
         +tcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078471; x=1769683271;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtMlomMObWsD4s66Z22CbpafYL/6GzxzV3tYzPqCmO0=;
        b=VqkBZ1hyXREG1EWpD4bxEo2w7ctfBTSJVvUgOHGfw0vNc+iUuvoZjWjRcHgRdfg24v
         C7UvJTuXTWIWdHX5ath2ldWCQq+vBSdXyO38KKsZAMlP0Lyq8cf68g7KbOL9nXzYY2kp
         P3jeCoQb+gp2kIDOxdm8RKxhY/PeZzSwToyUG+/uemQR9FWDaiR85Srt6nB0dBbLAv7c
         WLFpVOjG9gp9gIdQo5RWPzKBFluAvlmg6+Wwp+jLBTDevRTPFnMXI8dUsWXrHzKqPOmV
         GAxjeUI9q/PN2kP13tdvBTGt4MBmvC4VN3v6Aasm9QgpugmEA/Z1lBhwLbJhHyymWD6l
         T+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWIW6KpVOCZDVIhsAKR29loXT9YigPvdNC/p9nlZQvfjEzn0h+NWeBpHqCCo19AcsEo+cYjFPD9fPEGosTy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XuHApGQwfRZ0VGOZaC2xNmfeVz2lKJ63VTXTgZ12s5dSzKTP
	cMOgj0B6ROqIooQu+rxA11yn0zgDIu+dkNZusfzkYc3eczrziEmdoH3Epe0L8hDR3Kbv7Z9KPGN
	2K3lpyw8b+FDN6XjbqdCzTf8UgMyDdQiYZsXUdGSyzQ9fQDP2o79/NypoquJc7oA3xJlZTbO+Yu
	FcJmuBMA==
X-Gm-Gg: AZuq6aLvJIOrUyemwJ4jsCtO13mG2wCRmZwSWo6ce3ks8KIKy/v5iBD/AarqV9m6+x0
	uP7opMsKa2SIlsHAUjz3q8m4UXTbZfck8g+wEX/0+O6oMD7fBcD0m2MQtyQ67ydomLylcmQLUp1
	LSLU9ST0B7/uFZlUIXwM8FOw7rxVnYSPVcfBy96FbLR4AHjt43ComJ6Ae5VovMFP2ZzcyBRm5H5
	830HdHW6ov+f69x9+MDrxO3wYxJfSNaK9eYa6DfIUYmuxkuFd02Nq5s+04joUKgNkGRe1r5IZ6P
	WxAYB7Z8MaLVgTY9lHp0hXdeQ52d2xzHJI5xCzVqgWt3/4BgxlbAp0vkuSdAXRl5KLlyvjY4Aew
	cZLK10KPCv6dsJQZaoTufAixqJ4WeloYJR3bSuIrxAA0UfOiM/zUv4mtWn3slpmhEm2AgZGti3s
	Q0e+4kwBVfek1b8b1W5iTBa/s=
X-Received: by 2002:a05:6102:4429:b0:5de:93bb:c53f with SMTP id ada2fe7eead31-5f1a551fe82mr5844944137.25.1769078471463;
        Thu, 22 Jan 2026 02:41:11 -0800 (PST)
X-Received: by 2002:a05:6102:4429:b0:5de:93bb:c53f with SMTP id ada2fe7eead31-5f1a551fe82mr5844940137.25.1769078470974;
        Thu, 22 Jan 2026 02:41:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de2ccd753sm35539e87.48.2026.01.22.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:10 -0800 (PST)
Date: Thu, 22 Jan 2026 12:41:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <nzqipun5kaibld2aolihfc475ceip4s5cpnzhhs2fcvmydsaih@6snt7gtjtetl>
References: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v5-3-8ba76c354e9a@oss.qualcomm.com>
 <pmkxaslxodh2cnxbxy6wnyalb4zl64xek5l4cfhtw3k3ywatfk@hyzhbh7wzzji>
 <d3ec2d98-eb43-4de8-a356-006f0df43c54@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3ec2d98-eb43-4de8-a356-006f0df43c54@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=6971fec8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7RkqI6dVIrQz0gYFTEUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX59RvrYbLQCLD
 ViynZjwKyTzzO+aQZ4t6I65gurOr4lse1eYzDW6ArYgT7bMFQBvEgCd4cx5dhS+c1Z6MTS2Lbs7
 AchBsr50NUf4t2VaXNz7h+KmzxdOO7Khkng1+6FtLiFelnqOxqgIRRHVU6LgrUV1CqLzaM4l2/A
 fN6kKYwxroZgDFbaRa1qw5k3MaiL0iePz65ppmhy+qp9z/lOzJenhXX9dZfEP6sIpM4/VviJHmk
 V8lGIpQIlvFrNd6O0S002xjDlG6ECJiQeaRxAAzUmFORb7U7Gv2UNdMccP3PfcE7UC0V1F8+fn+
 VT5KfDPRoUcnNvEECjZ5bUH0CprBV5JQ671tL0Ik+YIJ3sAQP/+UL4GKUkd4pdgs8s8AIoOvJv+
 BiA9e87Iw3WOFtrGaMDFTN4tZjp4rk2K9YLFmRh6f7XMDpkKtwJ4o0MGkSKhF0TmF8122HsCUxe
 GU2q0GZJvzUXOrrnZtw==
X-Proofpoint-ORIG-GUID: cvKf413tX7tPTDd9ZV2M0Wq4FebSMDCh
X-Proofpoint-GUID: cvKf413tX7tPTDd9ZV2M0Wq4FebSMDCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90168-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1ACB965882
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:15:17PM +0530, Pankaj Patil wrote:
> On 1/22/2026 6:52 AM, Dmitry Baryshkov wrote:
> > On Thu, Jan 22, 2026 at 12:05:13AM +0530, Pankaj Patil wrote:
> >> Introduce the base device tree support for Glymur – Qualcomm's
> >> next-generation compute SoC. The new glymur.dtsi describes the core SoC
> >> components, including:
> >>
> >> - CPUs and CPU topology
> >> - Interrupt controller and TLMM
> >> - GCC,DISPCC and RPMHCC clock controllers
> >> - Reserved memory and interconnects
> >> - APPS and PCIe SMMU and firmware SCM
> >> - Watchdog, RPMHPD, APPS RSC and SRAM
> >> - PSCI and PMU nodes
> >> - QUPv3 serial engines
> >> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
> >> - PDP0 mailbox, IPCC and AOSS
> >> - Display clock controller
> >> - SPMI PMIC arbiter with SPMI0/1/2 buses
> >> - SMP2P nodes
> >> - TSENS and thermal zones (8 instances, 92 sensors)
> >>
> >> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
> >> PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
> >>
> >> Enabled PCIe controllers and associated PHY to support boot to
> >> shell with nvme storage,
> >> List of PCIe instances enabled:
> >>
> >> - PCIe3b
> >> - PCIe4
> >> - PCIe5
> >> - PCIe6
> >>
> >> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >> Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> >> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> >> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> >> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> >> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> >> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/glymur.dtsi         | 6122 ++++++++++++++++++++++++++
> >>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |  107 +
> >>  arch/arm64/boot/dts/qcom/pmh0101.dtsi        |   45 +
> >>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |   83 +
> >>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi |   83 +
> >>  arch/arm64/boot/dts/qcom/pmk8850.dtsi        |   70 +
> >>  arch/arm64/boot/dts/qcom/smb2370.dtsi        |   45 +
> >>  7 files changed, 6555 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> new file mode 100644
> >> index 000000000000..c0ecc64202c7
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >> +
> >> +		pmh0101-thermal {
> > 
> > Why do we have PMIC thermal zones as a part of SoC DTSI?
> 
> There were comments on v3 about moving them to out of board dts,
> https://lore.kernel.org/all/aUko20ORsgrlZrIn@linaro.org/
> glymur-pmics.dtsi was dropped in v4, the changes were moved to glymur.dtsi

Anyway, the PMICS (nor their thermal zones) are not a part of the SoC.
As such, they don't belong to glymur.dtsi.

-- 
With best wishes
Dmitry

