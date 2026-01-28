Return-Path: <linux-arm-msm+bounces-91081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL6wKcyJemkE7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:12:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C942A96CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 23:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AA2A3020D4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 22:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB313342528;
	Wed, 28 Jan 2026 22:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvKXPnZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7UA3tkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B90314D0F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769638314; cv=none; b=PM4Iu+O6VVg5fgSR/zTlqdHKn4c7btTYpFZmc1VbZEAae3uWzcclCF1rsfGTRISXMh40r/kVO7jreewuLjvw2TnKWZObeDJ2KPgI8YRuCaJ8IEegnrgv+tNYSmksbCW52kivKgZH9hC4xoaeo72Eo/xlMAQyoRowy0tgfjwDbHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769638314; c=relaxed/simple;
	bh=RBmoRYYbsxJrcPKcqC3zbOYkp0S+JNtAXCzPWsFAQC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIm/BC10DcDHIXd2GWFLd727y1ybtf/uqrUSP0vQCZT1iC50v9hVwqJ3iYIvHvWShF7Fz2mgIRWzeqKgjQTU+LNZNdOShJorQkGcnudDH19fWsxIYOXb3lF+C80GsvU5uqPQ0dWZhfcTC9EEZwNlvQdiGqnubCo+qaWmYbuJ5Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvKXPnZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7UA3tkb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFcfQu3247337
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vv+RcW7zEBmP7GHWTrQgGnUM
	5dKMpwTV9rtFZAi3vwM=; b=GvKXPnZpYSOGTOxV8TcsPbIGjX/OA99XWpruEqEj
	n2SVDGRID8PVDsA8xEBg2Xp2UgXSgsZJuoBrdlp2mLpDUV7gtIPjcAmuhUdchoS/
	lo+e2F404kptbXN2mh9LEe5VOlfBTlWXrUEkf3dNCa1YY0yrSkZi1ahJzBoNZBom
	frkeGBv0931XsMm6wYIihlg1NrA+c/ZqXFQ+iJH4ZwUqzj/6144ZXUnafXJLZKEz
	oiMXXF29Os3LQou+R9yUAPTDaThTgg10QQZlJ1SyNnhalFc9pyR9x/RteCkKsw8C
	iRKJtUiHNBeU4Z7l/F8vZFcEDs2zmfoMDpTU04aLRDPHdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk35ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:11:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6deddd7f7so86561085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 14:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769638312; x=1770243112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vv+RcW7zEBmP7GHWTrQgGnUM5dKMpwTV9rtFZAi3vwM=;
        b=i7UA3tkb4BTpHynVjWB/t+JaptywR4JB9HGVkZKNp2iFKLr7/ksx4BZua+w+Xjbe2L
         Be7o1yYGsX6258D3qqaDabSl93JD87GfJAoEqaaNbu5TZem0DKyVQBusxKPdCD1PYwjo
         Z1b/+PkL36fXUdBDQBTZ1KaDPXgSjv2vunKpzHdMiA1Y/pN96xrU0XKIhEf4N+cIbsTI
         vKfthilcXPJ+PS4Whiu/WWpUFkI6p6C/ja7J8337FlrhEaGVbrFNaKk3Pjc3irtGLWTC
         Z0wnmSIxF0q3KTKscon/zCg4BDN0mdvx2mlw0ivH5uD8H/dRPehcY+Hr2me59R91sG27
         4cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769638312; x=1770243112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vv+RcW7zEBmP7GHWTrQgGnUM5dKMpwTV9rtFZAi3vwM=;
        b=QtllGt2WHqnfQ0iDiH+kEEA98DomRubhLZ1feHkek04Aushy2hb01l65xVcDLD4IeT
         Xdk594tMrnD00dWqQVuSaH0bFyeHAMYt40JFxL+R6iSG1wSRyYO0N7SeqEUYlnvAU+vE
         A4pu6Vg1QHY0I2sTk05jAZ5RdIXmyiT9M/ZGi0yoOEso2zpySGQw4aFNXnXrBR9eQ7IJ
         OW9YId7ZiEG+UpU0FxS3uIu8G6I8dCpdCSUFlwgxmuS5W8e+g8XkQ5iwlgSSR90pPUx7
         WlH/Bklm8ZUTHtqWwXi+RbH5T8a7wDE82rTTHOBC6T5iOim0VcavOzKd/m/qYNBX2isT
         jPlw==
X-Forwarded-Encrypted: i=1; AJvYcCVqTN7fowAi4Z7XLeApXJL41hA4t7RfKxz5GqXN9kOiJY7PdhbySx0NOrGAv7kbeiaRYrfpiOHgzi+bzrP0@vger.kernel.org
X-Gm-Message-State: AOJu0YyzKD9aWNkD5wzzt88x/strT75tvtduV6tTIsVezi0RshHjUbb7
	IIIJuMFc2Z5ekMFSfvtznMm7xj2bsQ+qTPA1iWy+KAxJKXXqwknLqy1SN1oYGQzF1QAn06f7sfj
	RmdibSqjANxN4rHui51jSm8dtBxxd8RH44PyngvjdWrEQTvFdJPLruRJeP+neSXh3qz+f
X-Gm-Gg: AZuq6aJUDF0+l0d9hNgjHvdKGfmhJDAcYfvCLvgN+3Hh/IxHiZBiduT79k0Nb+n6vV/
	yFnnd7HMdYoWEN4imTjTYrW2vVkTRGa2Rld28AuY14zKRtktiAEiCA31ExLyREEp3y3UyPEei8U
	UlVfbgbK31IBfO4Pqy96JGzKCcYNWtsq65LeW0x2L2y+n8FVRb52/LANCBpcOFjOzPENAv3xvYM
	K39bM74y9xZf3AoIBbEhTmGHZgiViqd3x3G7eWIuJL3ySfZcJycnQ8MJS5HYLr/Ko0urIhpoE/q
	8AfQhJq7i8rqBLWEvIrkR7BQm8qqxpycfSD48ec9/XmpXtMvBm+g12m3kRg0iv9xZPjw9Y3JBgn
	6hcWwooT1MwtFpiypwx1NkxC7kiE1cN9ycjOr262nqCSiv5PtmnBMiRNIwNANJqpFsQ87v9Rqzw
	YbtGMggm6xW8xc0q/u2leaEnk=
X-Received: by 2002:a05:620a:3901:b0:8c0:dc64:bbad with SMTP id af79cd13be357-8c70b8fb77dmr942004885a.73.1769638311722;
        Wed, 28 Jan 2026 14:11:51 -0800 (PST)
X-Received: by 2002:a05:620a:3901:b0:8c0:dc64:bbad with SMTP id af79cd13be357-8c70b8fb77dmr942001785a.73.1769638311316;
        Wed, 28 Jan 2026 14:11:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fa70bcsm6727231fa.38.2026.01.28.14.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:11:49 -0800 (PST)
Date: Thu, 29 Jan 2026 00:11:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: talos: Mark usb controllers are
 wakeup capable devices
Message-ID: <loepp6hg3uwjxkt2fidsgdmmztkb3ldpus6ezsa4ff6js4tor4@qcdli33lao4x>
References: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
 <20260128062720.437712-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128062720.437712-3-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE4MyBTYWx0ZWRfX6oqPBibbajxo
 HkSEsmFtlxASbsKPjO347uwZvL1dx3DlBFDGF/08mXj/J8M8EZtTiGOLv+7x1k7c4AncoA/F1rL
 wkjuAdxsWjWAOHqrMdEBFi1N1TSoNoETNpj9rgf0PHoNOFsRHjl0A88LFBN1rscayDge1sPdqYS
 Y3DASx+WRjR0GfmUOTpbQ14ZS9ixYdE4H8hELLODN1VDn5bqUXVw13yjaFKnW8jiuZ2Eo14Uvdk
 skM+J4iO1VkARiHGLQgq4ZUewMNOgG1qsuIwqMUv81fBxQspXGTedp2YQTn3Chyr6a37ZCnXmkB
 AO6ey/U5p4ItuPFa6WMOqAFw0rIzcjWng/pBpxh9l6CIMSKT7d2/NPXP9tWQge9NQzjcJG/c5mp
 GxdITvGHpAtbfUQ0K7H6LF0qlM0k0jwl2YATsv009yO1IhVOykKiNt0GH58pMUr8veba0AOfoEy
 Imc2sr6Ku1d9cA09P6g==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=697a89a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mEmNf9i5v23K5ui24Q4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: UrfnJs7BD1CHhNlDsOc_sgSEjaL9l9DW
X-Proofpoint-ORIG-GUID: UrfnJs7BD1CHhNlDsOc_sgSEjaL9l9DW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280183
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91081-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C942A96CE
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:57:20AM +0530, Krishna Kurapati wrote:
> USB controllers on talos are wakeup capable. Hence add wakeup-source
> property to both controller nodes.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

