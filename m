Return-Path: <linux-arm-msm+bounces-110576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMYJIjhuHWrlagkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:34:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4AB61E5FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB4243009E11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964B1361675;
	Mon,  1 Jun 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGd946rT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG14OFk0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9AA346E6C
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313651; cv=none; b=ICDCxAvCIBzUkFfLNvTACvQheujh39UV1UMxDgopd0YwtjoEejiMEuqlwHwyeR2DxJvgC0TgmnmqYXw+UoIGWmAWiFtGcgJnjopn40hjRi3nrQoGv7dyX8DUwI4PLt18CCrIUL2IHmTyHpSfEAorMq9jbjz2kLCW3C0BPFfbov4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313651; c=relaxed/simple;
	bh=8KpuVWQ6jm1r2rEeu3LN8WRKYbIYv+jQSd/1TldiGw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFBlb29Ni6dTpcepfigpW8+xAURPUh3hi5D3P7vajuvpUeY55PNckA+TgPGQqRX058npFYzrwTj9v8nDpUXuOEIdpb5pbkERE9uTL9It0Tt9mE2njRaAncSfDWPpDltPhHww/jXgMIgahqF0QkW/Ok7KNc2TuzDChxMxK4bXXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGd946rT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG14OFk0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518ftxg146670
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Jjqk5PfzznUHaFXGq7GmW+t
	L6JCALGPf3ThF49riC8=; b=hGd946rT0wOrWOdrGu7/KB4ryxKyr6s5qWNbtP4x
	Z04IOx/+Oh4TjtDn3aZYFTYlaCTzOaae7GafFNzHfMf6tZnJiwUtH2/4dSmLFX86
	0SPejkUqvdOGp8/iVCCHrTtfN6H1UbrR3Ox+RhaEfXA9wZ0l320djF471iJX8sPd
	3l7IOf1pZB8KNb9d1+VaKc3XrsuHwpwX92ED3FX+toFbiNceIEFuMXHu+0zIezHd
	FRf4rsVm9teqDbQAmM1/h2I4Fe1Y5gr1pt01UuFOzXidaX6ZOWQU/pMxy7jW4NVx
	ofWkUvOgWHDm0pzvhe5HhdlgKqVYVkscAC3lY/jtHRCukg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6strnak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:34:09 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so2820200241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313649; x=1780918449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Jjqk5PfzznUHaFXGq7GmW+tL6JCALGPf3ThF49riC8=;
        b=CG14OFk0getzBzeKUnFjFOu8tT/BMejrhSAqw2YCM2BzWaXyHwY7Rb5TIlWG39GVid
         LQCHCP8BNsxDxg63jzcOm7NvLc60NxdQtkabs6kJYP8FVaqRsqF64uHAn9332KQ/sczK
         0NlAGj3DQdiTlDPVTyR20qDkFzZihhGtpQkUgTVnynQNNxOB1iiD5l/JALR8PhfP5bQb
         JPqsST2kQPUAceZJSLtz+SeygMF/+iwAi9qSBnuYi8G/3jrJGfRabIxfAIXLxrN9hFOi
         BUwkzJTzUstIhYviVE27Liipgjxx1lRu4LvNRo1y63xsrqWh1ZRYk6fnxhWTy3rwFDEY
         Snog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313649; x=1780918449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jjqk5PfzznUHaFXGq7GmW+tL6JCALGPf3ThF49riC8=;
        b=ZBu3lQIN1gGOl3W+N6SX7cTHDROnEP8NMbgVM2/Al4roOxvgHHYym+jZAjvpFPSfXH
         HfBDSYvcW8zmN2GNXc1u6qdVyNyLnagzD06dLuZNINW36uGziXgr6Iex8ZRuNO1m5dpB
         xZCP5vEncHZ604cgqAnBKTb54+Cf2BsqugfL9k4/osd8tI/qohhyLb+NycoSSNWqm6Tk
         oqQkpclxtifmgorBPx3noBUsaeE8iGonHcCuydzajkYFsw3sVgNjXXpVD/hR4bqQ4+B6
         m4eaUwtrfqxL2HxSEPt3DpDvxOwZeUNZGPXaTohxTjD7KA8DDJH8lxqy0HjfqTq87GTK
         jkMA==
X-Forwarded-Encrypted: i=1; AFNElJ+JI5qPTcSgfVS7Or5pzQZc1IRp1zOuy5MPNzWG8ofKwizhWPmnJj1sEvzj4E71KljegFzjMsOWYoAe/XG/@vger.kernel.org
X-Gm-Message-State: AOJu0YxduQVRchtaPdu0d/V6aiifDaKvjl7Ie2cCZkTMIRh1Gx659bVX
	bMdeDGPklqtF01ACR493l8T9xSHxlp00+aKd/DY4Y2Z7QSeDSRxRoWhPUBKs6G0qQxTrzIwqVdf
	g0JHpqAT/WdjSsbolPBW+0ATkk3A2g3ExptHcYjtXedrm7XlTNjZ21y+Pio+yZ8VbekUp
X-Gm-Gg: Acq92OFmyp04Wf9dDQMxdyxORzg5TonNXCMF0YqgNlTAHhruvI2P1q6Qb/cUb/XNWw3
	OQNeln8gbjhFQ05uxgjYmj8b7UFy6/bvV9lbGGdSr6JxwsQ5UFb/TeXleoA4I6ef7TueH1SIjIj
	JWKEMVVl2b+PEuQhnlPTPD+eLZgntX5pix89/1JPV3bO74ZY5nT8ERN27M6Cv7r1vohTXLkFKnU
	e61gCaElJj9LfBapc8cL6sN6u+8ptJgAepitRaL6lauIavgtfvmnokugeSCrOaSF7h8e6GIL/lL
	92S890ZQF2uRWhQUEheZHUeJHblaPwhFCzlBwGcdjpqduh25iiuM5zDZwe8qogR9s+MZvgKEbKJ
	fU581BtUMMeX2jRnKK3mxc9ER7IEW73vAM8bJfOnsZ5ii4IwDo1VCy/XwqII9ys9qGgx+k9xC00
	IWAWX2pmYFj3/ti/cY06rJyxlI4JIfQWROp7ZdMleRbj+6pQ==
X-Received: by 2002:a05:6102:2d07:b0:631:8665:3510 with SMTP id ada2fe7eead31-6c68cd84c2dmr4027195137.31.1780313648822;
        Mon, 01 Jun 2026 04:34:08 -0700 (PDT)
X-Received: by 2002:a05:6102:2d07:b0:631:8665:3510 with SMTP id ada2fe7eead31-6c68cd84c2dmr4027178137.31.1780313648408;
        Mon, 01 Jun 2026 04:34:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659c91febsm20928961fa.15.2026.06.01.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:34:07 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:34:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Message-ID: <4t3vit6et5coeiqhv2kw76qyxki2qfktf2wiczt4gzohri7rg2@eolb7eajunj7>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-3-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-3-fec6ac8dba02@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfX7C335Ub1tO0k
 XqOU5LBL+lttppNHSoPAISLUkKHl8PqzTIL4v6PrJw0r9ClHe0K6SrqsVb8ImT0sVtqzEorZtR2
 8RMfGyOetJlpINjRmfDO17iMZnYxLxhStRfLKEbTq4HJahfZt+NbHQFrleqOn+tHEjDb0oTDmk1
 rozOgR9+dYRXa+JMLGfEmCnKFhpVgcZoLPrFxgibwgJhXaEwPopGASYgZbIqbXSg1eYsnMFOslB
 2r3CSBPSLiTqDCwhqaEz+CbE1i1y7mTy0w9zJ7odnx9gEY5Uc2MMaqFNzIOe4DnRVGDRs7yzKFP
 9jciRahqrhYGaCAAXAX9WofVz3dw+RFmIzkvKMugX3PLvxjKhicKC61FbgkGCYfaGlSu6TUP5mc
 VAEXs29fSXQ2S2J4WVE8gDksoN2mHVOqnRi+srHi3hBvvtHikg2A4zFvKDfk9n6utnEIRZdRLYJ
 FJGqECQkrk+4YR3rbTw==
X-Proofpoint-ORIG-GUID: UNQpvTrfngV-3z-i_vplokLSItaUs-h2
X-Authority-Analysis: v=2.4 cv=HrNG3UTS c=1 sm=1 tr=0 ts=6a1d6e31 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Pn3paz4bqnjGj1Rei2QA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: UNQpvTrfngV-3z-i_vplokLSItaUs-h2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010116
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110576-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,smankusors.com:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E4AB61E5FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 03:51:16PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The msm8960 RPM resource table is missing the QDSS clock entry (resource
> ID 209) that is present in the android-msm-mako-3.4 downstream kernel.
> Add it so that RPM clock initialization succeeds.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/mfd/qcom_rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

