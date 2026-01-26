Return-Path: <linux-arm-msm+bounces-90546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHPoOA5Yd2lneQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:03:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 961D387F7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 914A9300E26F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1AE32937A;
	Mon, 26 Jan 2026 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gX8WV5RG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFaVGo0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69D733375D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429004; cv=none; b=LZRl4K6iiTHkgMnlJ/J/nhhPuUUg/4klLvipapTQmD3haIkULgc6R1jxCbz4ovco0WMnwmZ4H+zjNDLuZHukYXCErVP9p/R+dfVbONrv0VVrbIMxDnAAQxanse7yPL6FkmK4394EuNap4Kj3FZEWUpVSm6rGVHyko2l4zpmosZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429004; c=relaxed/simple;
	bh=iE0GU7YnLqFi8xDvXzSY9Cp5vaNB0HC5I5ucHNAgl0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcK07XCnW4ceOnzjKj2d3XL3dCk6gRnFLGgcPlbtcvqQPYtMjuUwkdVPuSq56GYW5VMAxBA6PySdFAb/fCkSesA3foROoCiEBxw4C/QNj1O39MTR3ac/tviuX8FQMJy72W/VGTyQ4K4JbN43rqgjT/r+HzEBpBsD6+lM521Vp7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gX8WV5RG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFaVGo0Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q41AUL1362540
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/VC2SGb90A1gRmexI3njtHhH
	8IpVN9uAtpSh6axfDvU=; b=gX8WV5RGGggX+miADQKAhzI4Sgs5lUmnFNGaZY6T
	M2bMV5rC2y2Czn8N0BNEQTwbSg2WCMR0HJF6WJPVo9LSJQVMQxhKWpIXB0SguXXr
	9M3dLwOJxRhZU/3jrL9W7/9IylYCn3kTzQiwy/J7TF1PXRPSDCELNB5eo4aH734J
	pSIlNT3MhsMZgbNn5GalxsW0Pre7YKrAFnAZFB1bnzY5sdTPPJ3Iw0lFwWOY+qG2
	mdlvVV88rfBg93akBdBo0zl7UHoyDtjau8PcDL8P9DJUt81UrDPr18IUibPqlc3l
	rZfNLfPofJb62KrACJlEjE8EcqdMivhEo9BToP+zDSMnHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v3132e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:03:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52bb3ac7bso977142785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769429002; x=1770033802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/VC2SGb90A1gRmexI3njtHhH8IpVN9uAtpSh6axfDvU=;
        b=SFaVGo0Y1ncyqQkMU5NbX4m2fCopS9A/zNrBa5Ibgq4FQO9QxGEYqlyUmKj2r6h/0Y
         bAmszkhiae+j7judMlV0tNspMC3KUOugckTgjxkyJTyb7ubLqF65JFX2gVBZjXPFk67h
         n5cfuzcVdq43v7BxtgZIOJaYCLIMcPrVqr6wpyt7K4MptqVdLVOWv3Rv08/utfUAChQY
         qhFgNE6vqOs27p6f9PoHGdYHOKOXrvMcGyG3Lwg+H9CtA5zAv80hJCdMisFzyCRJarfp
         nhu0I3IsDkUflKlY30bxrTaxVQwmO5/+w7fl53D24zGgyFdUPXSTLP6hpdZC27xa0Yvr
         WHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769429002; x=1770033802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VC2SGb90A1gRmexI3njtHhH8IpVN9uAtpSh6axfDvU=;
        b=r6y5bLGg5VhieTPB3CQIn9rgMRgWuCgxFC+eEuhONOekp9cQV4asw1nOGa0XWgJw7m
         FMMgYNHGKHzmHPCkvFODTO7d/VA4MvQ/BmI3xAinhYLKdQrdRsSFxDwh88Si+auILK/a
         ZT+s7OTjYgB0ztUzZUeJdU1b5C7zpsYFrzZHcuZjLM8NTa0jVFm6R8OlzALr4K1DRE6t
         TF1kFvWXjnYeC+kgzyJReby+GkGaNLXQUg2qhYJ3VDrzmNf1qj5q/CLCFA/FYYrk/HVf
         peKZ0zEU9SPTaH7IfZRYefByY2TPN5hHOR5mHOcxwQI7tLK8kRPaYybiWIjComCn1bH7
         xWsA==
X-Forwarded-Encrypted: i=1; AJvYcCUe0f3nAbQHchfJ3LyJdPJtixVBoP3+0FijW8Whra82oTccKGq0IlMKoQQWeHF82ozjmAUINEa2cfsL37iW@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4EC2OVM2R4iIkdCmZn8wF8C9qZli5IR/wBJdehxiLVTUhLJ4
	2pXX7RR2jRGXVcVbDWXgSbAFWDMQvGxeTXJ+SmH7gP9CXYSmppS3PGG2vwrXp2gzd01XqS9s/c4
	uSm10mv8PdNcn35N9d11IJRieB50TVkZP5Ia462WmHkI5NdIGmgXuWgJyItT45A8vTz2U
X-Gm-Gg: AZuq6aL8ZXP610VN4yKrp4o825LubfHaek81XRh48f6lRn/C1U63vTeXek7IutrjezG
	THx5IviAygFtO5hJkId0BCNPI/OiakCA1bbF93qiv9ghgVh2/YdHR5ytAe/GsiV8YobLAOTtHxz
	cca9Pv8+I3NrTOW+Rq+6RcpYQfk4OrV7Gc3UFx4MH9ZJpI1WFLxdG/gXsZZBOrVydZ8SUQejWS0
	DCa748EuRz9yLXNp6BjS2KN4vnUbSl6DfZi7Zpdm+bQzvvssasRT4wRknZJWcG+ebatRl7zqNf3
	DEXcrDTO1A1fkDFaDzhjzN4TxJFzV6EP548hx9m/9DcKMYrX7iOuTKsvxCb2fCbBeCKax39+WZD
	nRYBUlpIRHMH3yAsLGEltOIOe
X-Received: by 2002:a05:620a:1aaa:b0:8b2:7608:1ee0 with SMTP id af79cd13be357-8c6f96dadf7mr500264285a.71.1769429001651;
        Mon, 26 Jan 2026 04:03:21 -0800 (PST)
X-Received: by 2002:a05:620a:1aaa:b0:8b2:7608:1ee0 with SMTP id af79cd13be357-8c6f96dadf7mr500257585a.71.1769429001155;
        Mon, 26 Jan 2026 04:03:21 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db8da59sm103399715e9.5.2026.01.26.04.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:03:20 -0800 (PST)
Date: Mon, 26 Jan 2026 14:03:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v2 5/6] phy: qcom: qmp-usb-legacy: Prevent unnecessary PM
 runtime suspend at boot
Message-ID: <3uls7yafyfzxd3pl6el2f3r6jdwzjrw2anuto2op4zgcxerq4c@gxl5yj56jvbb>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-6-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121142827.2583-6-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwMyBTYWx0ZWRfXzgxyHZaO2uKn
 2i90pkUL5rtZla1+V5ruj+Yudlzvsn5VzgfZ+9/qZwJp4cR7EFXeqCsa4EQ6vhW9zCZ1x+vrIVv
 iPFR2RKQkiZwa7vwNm8/6th7w+ZjR2UmbAOpm1LZ7kuJ7DOg+DsDAeQsjt4MrO2o8/ZnM4ZSRJg
 gboxNQwafIaIg/95Zu9vyCgc2zwaNelZQDdzkSY2OFHjaUkTojc8sM7AHnoA/HkcpfGl4sR+/Ue
 qPK0pJ0DF2j4ZQZrcfkQBbXTBMqJkDlSd4qmlB7u8z7aRAYPruuS5HCoCG+vn60eE7FHmnnRrEG
 04SRh+7MJUzA3PKLaYAnMrrRvC93s8hTaH6ApShqeYo7A2abM14/Hux/2soWuNcQTGiPGlWoYdw
 LvXT2W2AvR+JA0bppxuWF1gEE4ex9zqeYjjpPG7ySMKZHM9D6ekNplBf15waUzsNR6oy7i7GSdL
 GnPezkbx3skSyYXizbw==
X-Proofpoint-GUID: R4XNhcxKb97xp7TNUq7nF1HhLD9ZNI4i
X-Proofpoint-ORIG-GUID: R4XNhcxKb97xp7TNUq7nF1HhLD9ZNI4i
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=6977580a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=I_ukrOqQsWpVYGr8uL4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90546-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 961D387F7C
X-Rspamd-Action: no action

On 26-01-21 15:28:26, Loic Poulain wrote:
> There is a small window where the device can suspend after
> pm_runtime_enable() and before pm_runtime_forbid(), causing an
> unnecessary suspend/resume cycle while the PHY is not yet registered.
> 
> Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
> this race.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

