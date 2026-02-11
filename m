Return-Path: <linux-arm-msm+bounces-92539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDBMEvPgi2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:52:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7E1208D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CC7F304A8AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 01:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106A82C15BB;
	Wed, 11 Feb 2026 01:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxj4Kw3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSog8Rxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4B2C11DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770774767; cv=none; b=efysGKkZAsO8dN2mYI9dI/i+Lmds+Z/4kdo3rnNawssRnAfP55M+Bsu3cupJlzQORAoJRekCEI9EuYYyG6dKair2v6FUjj9X/DMw9mVwqe36lyyugrL9QV+1Xx92SR95uWSkg3CIU0iOt6+IIlCnD2rbs3S5uNArf2HZRPaVAGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770774767; c=relaxed/simple;
	bh=fdAKuYmS3VYQy/QrunS0rpFps8lsoaDNeeiFrltpLVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tp10CZHdApMKjfZW6X5VckHVmZbV7zR/euzKWrQMJ8Pul4pJYP7LgA22+kX0YNu/6fFupkL4FZzhfuVTOsxIgK25jg/OncBF9ifG3i0ZQhfcFNyrXUF15KMNtlUjGg+eoxWpC7ASb5v9k4BcNF1WtpEjQy4wtGSDwRDv/mKr6tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxj4Kw3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSog8Rxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B0ZUX04006704
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+3TobhK+3vpoVqMM/YkshGNF
	bN1rdnZkJIapT3bAbNw=; b=lxj4Kw3nETYAZSVJmuk5bsMBTITJvK+o/rBm2nsw
	/GLioOpOPe1mBZtgi6370ziOyLzUzokrarwqiCbVf1L7Lt243MyXh9Ryfxq1Y+N6
	GAagiz++nYYeZ7a46XdmaYwTbZNBK8XsbV5XaLj0QrAA64tT3k/i2MUza4qMTmNC
	PocE+qBjCxjMV5KD6XGN1aeZH+wENy5ME7S5V3ZHntICi6LT6f55yJAgHHgOgPPf
	Vx2Iujp5qq31qiICj/4DfnGf46Pet0IVbkOu7aQchukk1MIfnCjKEwlbSExAEVV3
	ww4FlpE2hOwjfGY+C1KLxNrk7AKEMfdCdvVw6pLKGC7XrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8fbwr5dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:52:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70fadd9a3so1815268285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 17:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770774765; x=1771379565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+3TobhK+3vpoVqMM/YkshGNFbN1rdnZkJIapT3bAbNw=;
        b=HSog8RxjCWh7sZrQToGUKurRdIHUfEVex9dGZeLU0OVv5n1AYwDe1H5UoLPiNwr6kQ
         eXL70iVEXLuWplovW6gSAEHa2Yax94zk78hGlBkmcIVC1WtTJariZCDXaAPFEj3sxl+Y
         Cxr/V+bZCbimyj5reCMi9IVVgLg8PLA+nHr+Zr47SWHIrbKmbYyj+p5+zufbGwWUQvxt
         aEKXijDiyR0qP0VRDjfvHBHC+y6eGV4sFPW2cVz88zBhH+3xN0ASpUYqPHdXUXpLIew2
         uS9zDecBqUEDXkpG2OknV/XSGfLqKSA61+LwSWgIv/e2VEiYrfwjKhgoywOcKkjo8ZQr
         +jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770774765; x=1771379565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3TobhK+3vpoVqMM/YkshGNFbN1rdnZkJIapT3bAbNw=;
        b=nPVUHgltsZNvmQtHu3h8U+TWzXtkWouP5tKBo7GgfuAxGVDrNSjyYIvsNDk5jERrVA
         6P395MvZ7Wgnttwqj9dvZZoCO/nmdHHIaK5a99MTEokrHdkjpoAXkYbLHaZ4ZtzRtShN
         p51xHROy9IilSLkwqZamJuBEOoyLVnov5D5k34AJXnr7lUq+nsdSkXhBJNh2i+o+6Wg0
         hfBoUXEf24Epja/Rm0Q2P5e1t0R57ST/u/zAuqRF2yQQYEyTXQtr4LiHxcJkA8SbwlBQ
         D8NHlgpJ/Et4AzxVwznAcQY9F5icf7OztMEj7y223zN/5ME7dff2GDgHtBy2R2nZUCd/
         T7cw==
X-Forwarded-Encrypted: i=1; AJvYcCWi5gma3nGkbXPItOPayzEVu20xyLpw0pgbviy+5eMu/JQ/suDZMC9Z5zoljUJZLCZYrRzBIWbaWqJA+yyK@vger.kernel.org
X-Gm-Message-State: AOJu0YxcoCaScI/xM97I+v40qB+zJSL1RsvTCJB8a2sPiZBBk3cuB+z8
	rR9EY+h8Q2noCVabDC2X4PoFjc4XMrD0Ubr2oafLcfsaTqRT7OEOfN67ambOHSmaY1fwwRGz61U
	QgKBfghVi9iskdeh3vvMjJ6woRtiaxMffRTWsHGpSY3/nT/m0oBiA3Gb9Md3Eh5aoTesc
X-Gm-Gg: AZuq6aLjo7+kp/4sTP+PS2RCwdPyckFn5VD8CkfQvTStuCsUnlh/EO8DwY+S6WaLWIB
	g7sl/ORgtYzcuNpauYm/Ss1ujIaR3ftAO9RxUwXA5SF1tSCt7hIHSB9jk3+GxTe6UjQ3cM6e6qG
	JgV9ub7dPeGXJFb93zwUmF06ddDVuyz36yWAJSvSQ2zdsYyL1PbRpXMvPoaY7aV4VARjtrUjIXB
	OMyVLJ8wX/sFRRRTX5Ca5iGbKhdkXE07r+yI+udAVeK7mPY2wFwNz0KVIOOBKL240zLwrTdN7+7
	Zgjmy2xxCkmGEAIYQFM+kSKODYXdL4qA3pEKRbhc+TBubDbEGpNzPG148Q7QGsBpPZA4pHo5HqX
	ooR6MIxCzBAUdKYsM8Y+PN0YuZokpjXKPzCBkTGwgmwye0XbY3PJAaEBtkv+elFNDw2tZKqiCaz
	hLcBKmZs5CPd896ej9wF/R4eccJ8sYUe1e9qU=
X-Received: by 2002:a05:620a:2a16:b0:8ca:2cf9:81a0 with SMTP id af79cd13be357-8cb2803f23amr187100285a.51.1770774765244;
        Tue, 10 Feb 2026 17:52:45 -0800 (PST)
X-Received: by 2002:a05:620a:2a16:b0:8ca:2cf9:81a0 with SMTP id af79cd13be357-8cb2803f23amr187098185a.51.1770774764676;
        Tue, 10 Feb 2026 17:52:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870692b818sm520411fa.45.2026.02.10.17.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 17:52:42 -0800 (PST)
Date: Wed, 11 Feb 2026 03:52:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Enable the tertiary
 USB controller
Message-ID: <d3e47ewvgtmhhvrcl76xpxuobhaltbjbghd7ysahu7lijcqc5e@iyak4kcr7ga7>
References: <20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com>
 <20260210155329.3044455-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210155329.3044455-3-swati.agarwal@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GM4F0+NK c=1 sm=1 tr=0 ts=698be0ed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=U3EUIoqi7yMjyQG2jewA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Lg-q21psr99ZpQQg8VWmlFLorVVDfvir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxNCBTYWx0ZWRfXy8Ex9GpjgNsA
 9lCPugMGLygSPBP7sfYU5Jgyv5zpNz3WW4EaFfWdk5TSL2cd+KXidpL21bLm5+lFJA+JpJkOKEK
 BCPTfhZ355aNumdL7Pp9jruryradspemS/go3QQG2vrm/x19y2P5t0NOwEyI6vJhFP6jI8JWWlD
 msEqcvG6uL6RpZu8kZdty0BuVk92Wp4JE8M3rbRRiwJJ4W81c1gzDwmaCU5LNl3w8drhEU1fSg0
 wiL36Lmt9fUc4RfQfhuKjcsgakOjPjDwbYtFqbjghl8g4k3tq3RW9IkV8oMHXsF9eBuVgrr+Hnz
 QinPwwLCjqO//MVqsQCKR4m5Tcdg8btEr4upIWms5aKMznNZWo4vcrFqi0XF2DSNdfdDV3N4Xnh
 6vAr7d82USRW8wYkN5OVKHAOAJgD6ehQXTqT4pbl25noE2T6PNp2S2PSHLxPXsl2CJxvz7GhTcS
 agntFOqrUFvx2TQkNqw==
X-Proofpoint-ORIG-GUID: Lg-q21psr99ZpQQg8VWmlFLorVVDfvir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92539-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4A7E1208D6
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 09:23:29PM +0530, Swati Agarwal wrote:
> Enable the tertiary usb controller connected to micro usb port in OTG mode
> on Monaco EVK platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 53 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi    |  7 ++++

Two separate patches, please.

>  2 files changed, 60 insertions(+)
> 

-- 
With best wishes
Dmitry

