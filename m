Return-Path: <linux-arm-msm+bounces-94523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDt2KDH3oWnJxwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:57:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDD21BD266
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D615300C81E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92666472765;
	Fri, 27 Feb 2026 19:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7HKZk30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IL6+YJpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8DD46AEEC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772222243; cv=none; b=Vt2ngj6UXcALKhyH+scjRo8btCqTQ4I+MH5sByQInLKxRJBoaantIDobxAbiQyHxMqEOcf2wusUUBwF9lWBbcCTqhD87sy8N6Rqi8dpUCTu8wz0kuCkytpXm+D6TY26uPc1uXFUyfb51RCa+17I5qC5/Z5rEOIteTjJobMkmiZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772222243; c=relaxed/simple;
	bh=rviP88Zzb9GJpCThzN42QhstcBR/Eo8Pw4VLDv6HiRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQrPayFHl/R4AByyi47cwOoW48Hjkrsirs6T9u7NS5+Ytl0aT/obTK1kXPcr8BGQKZ6mofPix2moMyAZdCSExpaCiI2QM8jLg3Mv8NlSjOzp45Y805ODhjulzyrP4Xjg1GhWfeBw+dW5AQeR+XFzHsycAY7rfQxSHTgY1tzw158=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7HKZk30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IL6+YJpc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RIlt4u1712896
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Un7kijNT6K0Dbstvjj5TzNKdzaWNPIT7vVSHXdyR/1M=; b=N7HKZk306T1YTwMI
	tvb4YopuNm8y5MpteB4USGF2yea9bte1xjrTyCbfUyppZGWO63ihAdK4eJ2qT8Jh
	ZvmH/bSYB1b9A4bBfWAZvM77jz0Ed+9KUnwghfoSDI+lidXOqWEtYfTHVhRCoEdv
	HX6kjxMAaQsZHZ8FyrNNidzWpn2NAEC8g4BNFxg5rvA/v8qhzyURhtkboNG2L39Q
	h5v6nzcP9RViFPZNrqTLKgrAtULUXAsOMv3sNhrlhjb4meTvPkL4ejFTE1yMYieS
	M/M7Jvqqb5X1IJ99+leqYJcGjb6iUgyU5xiz9JhOulN8LWBy75QqLn8y2gTotIjj
	lclm3w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckgv5g72s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 19:57:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so249744185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772222232; x=1772827032; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Un7kijNT6K0Dbstvjj5TzNKdzaWNPIT7vVSHXdyR/1M=;
        b=IL6+YJpcPyH1Xi9zvfY/iDZOzLtmiuWwAjv/jFqANzeZrBQ62YgCoIFp780RqWhnQw
         5NDiLIxLuGyCi3cSk08CkNP+xSlu+s8BXxcvHC5DZTOY3SZqIj4z0tcTc8JZIfLch0Hg
         hnGFm8HZVWSOi+7CHCdVb1KhbxYM9mRIzoSKRtwmWUi5OVVzf5y3k4PuMe+Dka6OCCAf
         6Zf4CUMvFlnR8XOA0XuYCptUdqVyDDwQo6ly7h9sN0YfkZALdr1on+tiy+poR9+x4iUc
         GOT2Q8EUIf6+CfiRk7yH/+b9vkxu1NJaKzzdQEbRbai3KDD8nQXOMFCJeeD7iihmx2/Q
         XmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222232; x=1772827032;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Un7kijNT6K0Dbstvjj5TzNKdzaWNPIT7vVSHXdyR/1M=;
        b=pFi21mQEUIt4x6O1yZm1G/Ido12pA+c4JD3XhAcXzpT44suiFftC0e825TbKcDqFU8
         a9+fhnJ+FRInR+GASHegnI04d1mGNZ6YrxF1YJmIMN1mf+XgDeugFcIBt2/Z0UrIiTUL
         5U4mQWBEKBvx+XUb4QmwekZpPHPn/L+dcWhGtOEpfhdO4dm7MfAncfyB2fahYAcr7iP/
         OgaSb6FY3d1YxWPCqAx6ch+93owAXz3bfhNP7ZJgedxHnuLfI6vRTMWtIp9hX6dDprq5
         3US2/ptWP2pQXLeF0QcrNXh6yuBdgtbMXFzWlSOpRv1oyr/mow/8qfZEVRQOH1nP6dlu
         Paqw==
X-Forwarded-Encrypted: i=1; AJvYcCUe9L6MmMXwgdSrto3SoM7OGvuU8+tItr7rlfHc8FdfuXBsQ1lSY8AmOBevaCAydkhU0d8psrfQfERLQfmT@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ9khoFbZN6AOy1HO/zj+dZ9LuhB9uRGvmzN/tdHJo1rQNvblF
	7s7SiLXv5ZVWWL01W8uojzpn4qOYJoQzHZS0Re2m7s7eh9sJf1P411E2fiwlLfZTbp6rBQ2veGB
	FQr8wjSajiV20EBtRc4hogWPjbXTDQJQ1/MfldA5YrQkgi4lI0t9kAHG6bgNqAkKW797O
X-Gm-Gg: ATEYQzwq+PLGesXtkJM3cwpKQKe1ctHu762I8y3W25WLt0Z/ruKtZi1fMe6CvOBaai4
	9JxZJbtolVTvlz5Q21GwR6Z5aNYUMIZAmvLoUjc2YLfOxypPRfFLfwgJ7PcT9kdIjVYypHoyHfh
	nIgufds601h+uEsHdlPInOXSDlEVV3iNEBOii5Nxr7vOafVdw1PjE/3lVvQ4UEmZZ0jzSWBaFrv
	RCrftSHijV8/iHHjqFzB1no1Py8sHkiOJL3npFD2clIinxYSqdIIR2nNRdwozXnR7uPUBfK7TRe
	OWv0ARWoHJhAVyqXGSma3bFzPMC6r0CkScDSJg39D23WbytRd+16/XTO5lgOGsTtxFyGXF35qWG
	ylPMteLVb/rJVbLrAPCQQpEj8jC6cv0optRvKmY6cm6DuA+xyC8xMHUMFtMGD9joCFGkZa3eKyy
	yk0mxSXi//6gpeFQhAcVtDVbWD31oPdIyWs8k=
X-Received: by 2002:a05:620a:1981:b0:8c5:2ce6:dae with SMTP id af79cd13be357-8cbc8e98436mr530635185a.29.1772222232357;
        Fri, 27 Feb 2026 11:57:12 -0800 (PST)
X-Received: by 2002:a05:620a:1981:b0:8c5:2ce6:dae with SMTP id af79cd13be357-8cbc8e98436mr530632585a.29.1772222231818;
        Fri, 27 Feb 2026 11:57:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b356sm15695341fa.2.2026.02.27.11.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:57:11 -0800 (PST)
Date: Fri, 27 Feb 2026 21:57:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pushpendra Singh <pussin@qti.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: Re: [PATCH v3] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
Message-ID: <u4f2jr6zvtbupwcqaudxgzpq4j34q5rnehnvhhx54leixiff4g@6agozy7m2tg6>
References: <20260227111051.1789439-1-pussin@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227111051.1789439-1-pussin@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RPq+3oi+ c=1 sm=1 tr=0 ts=69a1f719 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EFb9KgLWMoh66PABcjIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fEz7qmmJn8mPrOCGURTNuoEWZMfAedOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NCBTYWx0ZWRfX/Ra36lq66RmB
 e4uiKeXkme5TZSNCwQBNauNKLZX6StHpytwcdQ1oWvmq20+ssb+XAnCqOv5x8EYnj4S8ZKz67R3
 6l2R/+SB5N4eCaazUI3EXPHwAYDhFfM+Nmqe5z0r2N9+S8eTgK8zbN0XZemnW4tC0gvAH4sYUas
 WW+toLkUXtaNP5oIUhfKTByKG2KPgEGbHHLzclaaIKDw/GsuqeOIqprTRPlj32Zds5Ons4bhjV1
 8ahXLd3NM2mLqqHdNtMA4PbesKALoLvgDCUkvOUCkGB75SwwPyDXLNPpLqvXaY/zYDZF1+gSpog
 Ar/dpvvnq0z/qgVZVUjOfZy8omlQpzMWEeu89K2daH03vf9eFNBzi9D0Vu1CtEGz0UO+qWUFcu0
 Xjou4fBYHeHhJ5xZ8/iuIL/4/SroqvkYYZRx7BpKJ7BHtNbqN7O5vUsUrtboJhMotww18YJfEoX
 E5etm0tPt/FMGUWIAmw==
X-Proofpoint-GUID: fEz7qmmJn8mPrOCGURTNuoEWZMfAedOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270174
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94523-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DDD21BD266
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 04:40:51PM +0530, Pushpendra Singh wrote:
> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> 
> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
> vote after 3 sample windows instead of waiting for 16. The previous
> 16‑window delay (~64 ms) is too long at higher FPS workloads,
> causing delayed decision making and measurable power regression.
> 
> Empirical tuning showed that lower values (e.g., 2) made bwmon behavior
> jittery, while higher values (4–6) were stable but less responsive and
> reduced power savings. A value of 3 provided the best balance: responsive
> enough for timely power reduction while maintaining stable bwmon
> operation.

Can you please justify this somehow? Numbers? Just the intuition?

> 
> Significant power savings were observed across multiple use cases when
> reducing the threshold from 16 to 3:
> 
> USECASE			zone1_thres_count=16     zone1_thres_count=3
> 4K video playback	   236.15 mA                  203.15 mA
> Sleep			    7mA			        6.9mA
> Display (idle display)	  71.95mA			67.11mA
> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Pushpendra Singh <pussin@qti.qualcomm.com>
> ---
> Chages in v3:
> - Update commit message
> - Link to v2: https://lore.kernel.org/lkml/d72182bc-f8d4-4314-b2f1-c9242618eb67@quicinc.com/
> 
> Changes in v2:
> - Update commit message
> - Link to v1: https://lore.kernel.org/lkml/463eb7c8-00fc-4441-91d1-6e48f6b052c8@quicinc.com
> ---
>  drivers/soc/qcom/icc-bwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
> index 597f9025e422..e46975da7dba 100644
> --- a/drivers/soc/qcom/icc-bwmon.c
> +++ b/drivers/soc/qcom/icc-bwmon.c
> @@ -830,7 +830,7 @@ static const struct icc_bwmon_data msm8998_bwmon_data = {
>  static const struct icc_bwmon_data sdm845_cpu_bwmon_data = {
>  	.sample_ms = 4,
>  	.count_unit_kb = 64,
> -	.zone1_thres_count = 16,
> +	.zone1_thres_count = 3,
>  	.zone3_thres_count = 1,
>  	.quirks = BWMON_HAS_GLOBAL_IRQ,
>  	.regmap_fields = sdm845_cpu_bwmon_reg_fields,
> @@ -849,7 +849,7 @@ static const struct icc_bwmon_data sdm845_llcc_bwmon_data = {
>  static const struct icc_bwmon_data sc7280_llcc_bwmon_data = {
>  	.sample_ms = 4,
>  	.count_unit_kb = 64,
> -	.zone1_thres_count = 16,
> +	.zone1_thres_count = 3,
>  	.zone3_thres_count = 1,
>  	.quirks = BWMON_NEEDS_FORCE_CLEAR,
>  	.regmap_fields = sdm845_llcc_bwmon_reg_fields,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

