Return-Path: <linux-arm-msm+bounces-101799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHlUElFr0WllJQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:49:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCCF39C4EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 286E7300C024
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE8E339878;
	Sat,  4 Apr 2026 19:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bX/QQLy8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBXstwSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736CD2D3A6A
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332174; cv=none; b=G2JHXBgGZ1RApq5eZ2j8DxLWVa+DPwhRAowxJgETW39jftJaTMWASVU5X8dCHBGQvyzW66fjeO/BCHRMbyO2dyAynI6A6kYa6H+qksuXTBq3YxBQX3rJzlgI2LfG2RC1yKQ87a0krOFJFFpTa5lsas5vUGmb0b4jSnWsZHLusOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332174; c=relaxed/simple;
	bh=IAwlrnp+0DMg9LOro2kueInXnwTewW+7Q6mGsw8BvTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAlb/wseTrOIEKhnK00ltQXSFBxExmgpEOA/ZcT/EQC9Nm3dPKxGdebwXrHOlzg26JD1BfTRqYgUsSpK+Pa3TDQOx8W6mJKbZ2r/bi/Rog8W/SWgFwHbAni2N2GNMmqnyBaeEG/b3OigHG3jgBLPyKPHWGt9Y1wPjpStj/Zb+Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bX/QQLy8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBXstwSf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342pXHA2197590
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 19:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7T09d5XZe4Y1nUegx+MQrM0N
	rFbjMQW+OLp9Je1rAuQ=; b=bX/QQLy8orh9s7b5MgtZwPBJ0219VFM87PNf474C
	EsuiVWEyKzboYxYNli/OLISeXvPErLbpGMejZOng0xElq+dwLwkMV7Q7T5djRVrA
	31AAPlpWhMZQHlNQByPo9NBVFTc3BxXajE6GH64wXe3vsagLbubVn8PADnC/yXus
	BR0OsaiGsD+lGbevCgzY76Be5AVUUe72eQQ/k9GkIUKVHhOgFuYzewSABpMr/HEP
	B+3IrBI5APO3+c4YO5LEqQT5WZ+76cDHb/9mJMUtSSd9Se+WM7vbAA87EuI3q8nG
	qE3MyVQROto9tYMeH1ldw/hBWfUIr3UvJMA2IBlsMr1U2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7u9e2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 19:49:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d58bed44aso86535701cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 12:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775332172; x=1775936972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7T09d5XZe4Y1nUegx+MQrM0NrFbjMQW+OLp9Je1rAuQ=;
        b=VBXstwSfqnrlG9KFFo9Xm5AztH7tE/R9RksWV8xR5jajsuksIlqxzdH85w5d/lOQu8
         f5/jaa5G/yId2vE6Xk5EgDEPL1owb8OfmtLcTrEp5Qzhtd190qWnWH83E7oF4aSClruJ
         dS36ORE/rqHL4NduE4ov54Ry2qepQBPmsC9GD7DV3Ap9dieIQW3Bs7WONYMsBQmjhes1
         +1K/sIeK4ZVMVcwg3Hjr3q6ywanCHculQogaNhUW33MahuWuDhQv2aimdBgHlGI3cvYW
         YpeEUhNqvJDnoqNxe8mjWoNZQFemtayAY/NUhJSeLv8WTA+cwyhnOX8UgfzmBUS73K+n
         Fsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775332172; x=1775936972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7T09d5XZe4Y1nUegx+MQrM0NrFbjMQW+OLp9Je1rAuQ=;
        b=BXarOvW3poGFHoIhaj34NlUlhA6kLf3xU65ZHUdUX+pVT29kH6KxPNzg9ZtihjPRKr
         i44OZPRj/ZvfZHnOnJZIlQ4obbkNyxdvQ5b7l/jYTVKd5EwB/ucaDx/LFotEqay1/S5c
         2i54oFVs1vqd62x3pxZl6e/PVWc/Ml5M0pkBZbQsrIw7R+KbYgTQ8r6sRtCIrD8jE4GH
         q7pAq+Ud1gRS5Q00reCPACIZfNq/L5NoP0ONM1ErB30NvGw/iNAo0GwZ+tyGd/l9JCZL
         giPg778z0W3xqOZ+yquqELr0XlYRZr7457acsImgHvT+F91xRc3rPDQVGbqFcQzsKiyN
         jGDw==
X-Forwarded-Encrypted: i=1; AJvYcCVITfUiiAk+voojbuRIcd1B3lk1PQUHITYde+v5gw+Y1lExmLvusC4XbgET5v9DfcLACkAyn+VndhuwBiDm@vger.kernel.org
X-Gm-Message-State: AOJu0YzAvmzSbx5EgRDFdvo76Veclk7FMeToJcl5YXTUG09llDx7nIQI
	fK/NrEuJMmuV27u+WVU9YMuKp2G3b4l1fuMW1Ro8dR2BAMkbRPo4n/xKuKVR9VtzUJI4tjdBG8q
	wTpKhWkLfpB7//KtcWEI53eqjM3pp7IlGUxrrvZ/sXCXz7En7OoJhMJjTKbz3RxKHTgrP
X-Gm-Gg: AeBDieutjP/nHhQ9AuaJDFL3AxztCgah+YFM3ZoeiXv19KkzfCESQ4nM1y6S62tqMET
	XNSZMfCEpVRXy0swjz4CBsMRiDAHhKRTh++0c6sC1n6owzNCY7n2oaXUgmoolKw0Ztp0v88B+p2
	4Oqs71HCOOWVmQsI+gBEHG49Gd7Kk7el9RdTifr+im4cT0XtosX+9rCX4+gEFrZ5RQateDu/auT
	iVTEeEANCSnRJ4BUrajzcyhc17fWmEuEaHLCFGE5B1irU3EBY0cmB1X64SP/9SmYvsFNDnLKLqI
	idlRL0IQ0OyJPXIZZdw1iGNi3NSVUetoAXbKt5vWhh7EwsFGXtfQQa9suAhcy8uNT1PZXrpIhPm
	LjToomLGiOnLRDTZ4ECnxXuthJ8gy8QJj3nlsPjZUUuQEwBFxvUz5LU8DOyrDdThPooya3TnEGo
	+fzyaXWdRTuSvBiskIju3vrf38ReqMsLb+pYI=
X-Received: by 2002:a05:622a:288:b0:50d:71fe:85aa with SMTP id d75a77b69052e-50d71fe8a92mr75779861cf.16.1775332171823;
        Sat, 04 Apr 2026 12:49:31 -0700 (PDT)
X-Received: by 2002:a05:622a:288:b0:50d:71fe:85aa with SMTP id d75a77b69052e-50d71fe8a92mr75779541cf.16.1775332171332;
        Sat, 04 Apr 2026 12:49:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c97cd008sm1972571e87.27.2026.04.04.12.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:49:30 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:49:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: glymur: Fix USB simple_bus_reg
 warnings
Message-ID: <gqisopxxvaqkkxsh4r3pwi2p2gzlmxrlcds6l3lsmnweeom2kz@iibps66i6e3q>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
 <20260404-dts-qcom-w-1-fixes-v1-3-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-3-b8a9e6806e0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4OCBTYWx0ZWRfX+txYa0LPL5Qo
 4TL6lqzPvz+yTb7VT1AWraZ2ah0AxnSQqH8s5K5PCptqoosEOsgqIXVAT93lEnnAHGytysxkN2m
 QtrFGZg+Lm3xGR45C7zjn21wstXIrh+ZZFuUObh2H2psm5QWkmDTaPsGEw/ggWLOwRzIG03Xvy2
 Hlg9FAAJXzothhZ9Fz29J7gmEiScofeegkRRN2zNLpvnW1Gf6g/U1tU2EgyUnaS5E8pDajajCNl
 5UpkS/NQiZ2V91f4QKfnJPiSFCGm7C0MDSI4mk3Sh1A7kZnPo1t69ccy7zsWmCkjOqKIJ6S5xfy
 HALl+BhJianbA6cviJoASXdRb3J6X2KmebcgZGgsOJqHXD9vx8TUp92YJO8HCu0MpMzM+NtVBKN
 jVAfpBtDtEQEDoQ0ROWftK7hzJDSXck2sp24jOcwTv6lNZcnuS7jSTCjh1Fnouj7zmCfqRJMIb6
 ZEn72Wxrbzi4QWwlNgg==
X-Proofpoint-GUID: mAtTsmYqd88GIn14uHrJcj7NaT_Z3ywa
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d16b4c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ZI9eA8xiAYmwxBboHLoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: mAtTsmYqd88GIn14uHrJcj7NaT_Z3ywa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040188
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101799-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:dkim,1e00000:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FCCF39C4EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 11:51:02AM +0200, Krzysztof Kozlowski wrote:
> Correct the unit address of USB nodes in Qualcomm IPQ5424 SoC DTSI to
> fix W=1 DTC warnings:
> 
>   ipq5424.dtsi:642.22-693.5: Warning (simple_bus_reg): /soc@0/usb2@1e00000: simple-bus unit address format error, expected "1ef8800"
>   ipq5424.dtsi:733.22-786.5: Warning (simple_bus_reg): /soc@0/usb3@8a00000: simple-bus unit address format error, expected "8af8800"
> 
> Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

