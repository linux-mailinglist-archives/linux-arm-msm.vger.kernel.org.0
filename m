Return-Path: <linux-arm-msm+bounces-91355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABiKEmu6fWmoTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:16:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA92DC134A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0B76300EC91
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2872EDD69;
	Sat, 31 Jan 2026 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuA6+4Rq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbB3CrX/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A1227BA4
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847387; cv=none; b=InsLRclBfFuuOENwy1qPgSGvB6veXo+qQ20FVFOP6wSqzBEAhckvjHZk5jZjfSqRL8TNitST4R0yzlsgTuWUNnF/Bj0y4dPbGdaTiVfRAbMdKrmej6ijwItf5y2+RLicH5dg62uPoSiDh4tlc7nrVWVOk7YZU0da0HowyDKgxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847387; c=relaxed/simple;
	bh=MkAEtIwAd3Whf5y3uYKu6eei7F00jS4ZNUIVY09g7vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dl5mPR7ELo/wBZpIfyGnXTfA6VXILc6sXJczXkusWd7WJtGMGValKC0fGNSjhb3zh4yCH6rnvhWcvDAa4CAIJk/HZdxEI+bhE00C4qVU36CVyQwViVxgZuL1WyZgi+GSaoTmNoZO0gO3vKSoOk/7ycsYgZEkxPWHLyWCuu7rTBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuA6+4Rq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbB3CrX/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4U5L2448109
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6V0V1wIdAM67NqW2ut6Q5A4E
	FwYuFEvb6jNCa/BYPwU=; b=PuA6+4Rq2K0mS/Rj4loZx/pIq7S1kAGMGuAXImu8
	PK6VS7KEStxtEaodlAshxGWvhPoi/PdQogUWTRQvOK5+ITEtuTI2LI9sE+Rg8Kaj
	4gW+zlsxl9M/tfa/X6LDg0OWi5ysujAVTgDePXwumHGgYY22gQTSlqooV92zxqWB
	fZQTrISz06jfarjq+VWaZikeZwZuz7QPjD9CN8d5gQ7vbrFYdMMqWY4DUPuDp0U3
	pk/bFgK9uA+azPi+cnTx3bYlV/gXaWJZgAf4XGR9r0Ba/FHrl10QHVmS34U8MJnS
	baW5IR0Bto3v1Azpnx3MEXsnVaL4E8GRRBbLhbmJ7kNTQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0rfpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:16:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c711251ac5so749724985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 00:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769847384; x=1770452184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6V0V1wIdAM67NqW2ut6Q5A4EFwYuFEvb6jNCa/BYPwU=;
        b=RbB3CrX/vP4OuxUoL26WKr/adqHTSat24ngLJwjnkORty6SfmdI+P2Jn6FnYSO/JcM
         3QYWXA1YyJvARfmPOA2mCbRGu2XHPwktihEne4tqVe1YfMyUooSto6KcBK8kQ0J5OIdV
         MOVNfX934BgVL+6DEQ+YSXgBiuPsn4pDBOJwYe71J/9Ez3Yi5Zyvhd456XuOxehCOURh
         AvOH493iGeFCy+QY5/kLg7B8EsA5uB/gwdUVVCzxGLGRaAG8EGHCLouCjeW6d0TjwN29
         pVGNaZhkbtyWMX4byl3ODaQ+J+MhJtLE3grNg94/tuUS6bcj0eFfPUeR4VBntzeEnGUj
         zXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847384; x=1770452184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V0V1wIdAM67NqW2ut6Q5A4EFwYuFEvb6jNCa/BYPwU=;
        b=MzoPYKBXlea2i9/WCw3J2LfKQAUlL7ZhI9H4e35JaN+Sp2yTuBKjRtsnUo0+MxA9wA
         hhxxF/4Rqp/DD81rkW3rAppBX9ACKC7t+/Qycef9HmufK7OyzBdtqGBdHJJ7LxDP4pyM
         gtgCfzd0EK8oAoe2TH26qqI8DXq5u2YTGnaWw1TeqoUMG5nAMNPCyvGaXEXYJ5esmj6E
         C83nwVhmXNdUGQjvTSU0oQBwPhBCm3aEK4Qtyou4OpHz7Y+4zTAz0AeZzBMjL7CKdoQv
         CA4bZ9vrzcVf05yMs0ZT0jWar/uH8uRt0rpPefi9Z/MXXNjb7vtLLwgUAWTz5qfWbpjT
         m3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Akkteafews4XHQmBvXo4kTpFQbZxD0vQ0iQtgEpIc0VnxpJ7nbiK8BhrQkyr685BwbBADhh2JxvxbEqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwalvY4R/XXgfDHNN33aWAigKgvSPqPx5IJwwD8KRwtIks+X9DM
	3z0Vwq0sQUiEU7Am0FIcQAMlMaNUZhv0r61H38VVpiz7rkcMZiyiY229hMfq60K9vAwApDV33fu
	3bDXph0odz9DtwCZ1pZdYks9Zj1bpewZTU/0in7ZMxg7HtaJxGKYS+waWHtj6T1wEzUx7
X-Gm-Gg: AZuq6aLaMw+kkFSmzP4tnZJygvYmgBFFuQYTcTro58PggZJIRF17OamDdrzQr7Q5Lxt
	QJON7WaIU6la4NUKNGlKg8BJCwt3zqDJEftbnBKXe5Q40ixlOEZrY7ZDwwkLxV9eqh8YcIXHbpA
	X8wsJTV6hzt74jV7G5ohyulMFK5TH9KsKq2un4NgxS0VrYD02F/+IjTX5kR/JJBdb8rNAmUwgSg
	Vw/Lnu8kukerPQuIJOY3dbYrCUqFwLq576iLl6B0CWNlXu0XiEFYOAM2AxGONrXzbwWU1hXsRjm
	IVmZhVpngJ67h2zHR0fMkyGm5NHpYMjqQucTQ3oMZa0MRlW9A6s3qjBqKRjjhHPGDpkHoTG/PUG
	wItHyvpoKbycm+9NY3cZ/T6/icR2Qvcspe+ID57Kg90Pt/3Se7iiOObryAL//Ht+2idOfH7TfuQ
	0a0NOFKbZ5ajFq08quTOQBVV0=
X-Received: by 2002:a05:620a:3195:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8c9eb25f5c8mr706281585a.25.1769847384376;
        Sat, 31 Jan 2026 00:16:24 -0800 (PST)
X-Received: by 2002:a05:620a:3195:b0:8c5:2e1b:7913 with SMTP id af79cd13be357-8c9eb25f5c8mr706277985a.25.1769847383921;
        Sat, 31 Jan 2026 00:16:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c8225bsm17946601fa.18.2026.01.31.00.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:16:23 -0800 (PST)
Date: Sat, 31 Jan 2026 10:16:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Message-ID: <iy72jfigw4kk7bp7d2lqgie4jf7ulphmtglznm4bohslno6vmt@b45v3razslbn>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2OCBTYWx0ZWRfX1pS9nXOGrJt6
 3Sq3JjjxBgv0qYuaNZnziFTsnREFEysa+S575igC0HYfk7V5RoghrE6wKrrC4+xEQPBNH9slcNR
 BO/ebRI0ZZII9YLizLZO7MZiV2Cd0o6fecWpzlZF5n1hde4ZklxyaiOI1igvlGmBwLPAiGRVbYM
 zuNz9hgevEgtXNLe13fPNMfSG7BA8YqUwpf1RxhGHOt+ehm91AJfNju6r09P5P/LNIVPYOeGNe4
 LF+4gqaWNBo3xuqYcG9yZchdpfMmwX4IXDqDVNIehjHc/Abjv9TyhLrdHwAPs12WZLE87gTqOAC
 CyzZuqVawVE3TDiX4Syt76fl7KiAbPkuNpbrsRDcRHFuwCI7cJ2ZcgsVn5xs1sy9/Nn7hKayyeL
 gIxpjGJL8hw932Tp+6vRQ3FFmNAqyIJd91Tyh/+HoOXiSjjnJKbGlWI2BdBDVsGtwUTc77SGKwL
 WpknRqz+9A7M2D7GCKw==
X-Proofpoint-ORIG-GUID: nxDiTYUREnfQe0nc0k53CvWN5DT4JqXi
X-Proofpoint-GUID: nxDiTYUREnfQe0nc0k53CvWN5DT4JqXi
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=697dba59 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=o4o9nyK-Q1O9M6IKefoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91355-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA92DC134A
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 04:14:31PM +0530, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 112KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v6:
> 	- move to mmio-sram and drop the Konrad's R-b tag
> Changes in v5:
> 	- No changes
> Changes in v4:
> 	- No changes
> Changes in v3:
> 	- Picked up the R-b tag
> Changes in v2:
> 	- Describe the entire IMEM region in the node
> 	- Explicitly call out that initial 4K only accessible by all
> 	  masters in the commit message
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

