Return-Path: <linux-arm-msm+bounces-103151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id a37AJCdV3mmsqgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:54:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D423FB7F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DF4A300AEDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6982A3E51F4;
	Tue, 14 Apr 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEac/cTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VO5QFqFB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF01344031
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178464; cv=none; b=tWehjU59mztGw91PF3OzLSDV4jnm2oiatvIbMg4lBEJ8+huKa7My2DEsgtfHdCvbqfyW/sp0CYq10E18n7QUnrVqiFp08Xp8xo10ZbRqgdaLwxC7AS7exeEddSaABy9dnsmWl92n5MLg1l/yO6GVbZFYb9UHvbTih9MaTokAtCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178464; c=relaxed/simple;
	bh=HrBmvLqteYg5aTGc2DzvOxm0RLWwLjd0RIAmC+CfnIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAo9cvhbw1jz1+/2CAGzeBsZ7CO02/S/Ou5oCMaUS8qkOodamSvJHvksTLtWaD1baVxmKGjiVZ+2loU/7FFHG9uNrLjOB+9aTxV5gZAC74Bj8YWZWOYrktk/SEsuw2GKxYsvXqfkeMRyNSC+ucGVxhi4NF9fzS1kCjYq0jd9Sro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEac/cTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VO5QFqFB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBOvO1280842
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bKB7cD9md6IVYbsiHkfvOWX0
	PgGW5lJEgvhZEMBVnM8=; b=nEac/cTK+eToweDulFaJbOwlltHopAnHNYGupvXv
	9GegTmxF2/uNcsYspfu8FmS8gBJRFarbfsxj+SiZAXFAkBO8icTB8NPCWuH2iXV9
	b1SWXgFgah6T1wL6FruHZCLeuV0GYWoPqilwNm14RDVoFPhng4iYDkrt8FV0LlpP
	sAfksSDSsqTl/VC0vXL0LOvmbHlRi5JqgMOf9d1uLYZz15310CxNroOeKNGfj2+U
	r/485T3OhSaTahNLyCuKS/3vRf8Ayz+a85opuTf4n4e8FNFvYnEdD1KdiM51Xfn8
	dJxsCY7lkhC7gi2bs6j7QMihDSjMYb5HEx43Qj5WKzH4XQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vk6t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:54:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so87146071cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776178461; x=1776783261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bKB7cD9md6IVYbsiHkfvOWX0PgGW5lJEgvhZEMBVnM8=;
        b=VO5QFqFB11luvuZxjd6psTkAitlc3fjcAQ4CIh0YbMdgG/KYh0iSV1IZP9FDZdQU02
         N3exZsaHqb/rf7Ff/zW5zh0pcu5BAXOiOdMLygWSq37TglGA2TXSoBz6TkaJEJnn8rps
         47LIc9tK0XjivqMXpucbmlteC4W6ktnlTw6SDlM98TZL8cXVHSEyUjcm1w7ZCutZb+Mj
         qArb3wGJdlU5eNSMzOcON3iKSBG4ZVHc0SezYeP1nRANThsVVwZLLocn+R6mS/2MpfQm
         H3N50Oa+bbGgHLGMg5X6wsJJ9XVAh6cx1eflTlmiaIufW2OUCu+3q/etMXIwkBlN2Y4b
         vj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178461; x=1776783261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKB7cD9md6IVYbsiHkfvOWX0PgGW5lJEgvhZEMBVnM8=;
        b=HITnqco5T3UEhiOelK+ImEDWL01fT1xe0pdQv+osZMCHMXMJCtXE9UyEPcKPipnMBP
         lUHNGRVjWIcxTH6VL4xrwXb0xfeRix2veUM8afiYdhsqPo7sHUcVfE9LpYYrqofQvLkR
         vEWc87l9PqQEUY5d4QobM61+hdAjeIVRi+XDMdyAKj1my0MWvL3OEftBqNIZP+OjUrUz
         oZlZ+BLyPEv0A8glSwTX8i2XdQ0crawRY0h5z/8V9167LpCxMJuDfC2deD8Ne/5fJJOi
         4g0d1ARLtlsGTzwDaz86PvrCD4gIl2TgimOb499yJpzxzgg7yuX6Mr/io0F091bCKcA5
         uUXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EGxDAUT4bY6cus+cYhn3oj3po0y4Ku4RHE1gu3U+STZ0DJBqwQp65eoNQMpyaYGKtDehQGDxrFWkF3vEv@vger.kernel.org
X-Gm-Message-State: AOJu0YxLGADvQ9WRs3og2K2uvdKlFXlnPVMz98tOR/Qt6V33EPV9sZNY
	JPMaaZnWHganjAzzOcji9eH01YNgHVOMJEo1GTaSr55wvIW0UO7fA4t/rT9MhuTTnAOs5D6ajWL
	A4MUsVoGTg/asJz0Fxo4iwZmCU88f657BWuLGqS2gJOWJYHz1POfXqn2aqsqqNMeAWLa6
X-Gm-Gg: AeBDietmXnNrFmIJ6yqsYeyibOhA8W34F9D//WeDZQB0hvCvub4AyiJoXmow4BCopls
	NLLh+ROZagKOygXoqUxKwPYm73vGdjXN1d4zd6nsWmUAsOIGcoHMZqt36NSbp3mluHAamMv5f/p
	fuApUTi2nuZ5nI8qyHwjemYk0qtfhNGUakUphfBJGa98P8KnZ8c/DDjm4ELAtqH4RyIhDKVThT9
	us0SEk7bF8d2ScAsM+4tHxVWFkCbptahyOh8PiwmMFIJWcKBoPOsppWjbyx//cAAq9z3fMFClle
	7fox7JPzs0QMJarqWyHN/wDMWBIGqwPJ1dvjf4OGq/1w9XwDIOKUuIsuWOeiyoenlvGgHTtgpvy
	/2OewrncPqGe3axV6UlBjXUrfb8nMfSyCA9jxgYqeQfczn5hxAkVqNtLCu/HNN6BC/hLzl6Ts/G
	KRdpezx/y0eh/AtkWIZ1WpDBTVqo2X2Bz8OIgVTf5CKNrEWw==
X-Received: by 2002:a05:622a:7c8f:b0:509:2382:8886 with SMTP id d75a77b69052e-50dd5bab10bmr37662271cf.36.1776178461390;
        Tue, 14 Apr 2026 07:54:21 -0700 (PDT)
X-Received: by 2002:a05:622a:7c8f:b0:509:2382:8886 with SMTP id d75a77b69052e-50dd5bab10bmr37661921cf.36.1776178460876;
        Tue, 14 Apr 2026 07:54:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefba8fsm3359017e87.66.2026.04.14.07.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:54:18 -0700 (PDT)
Date: Tue, 14 Apr 2026 17:54:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/4] Enable audio over HDMI and
Message-ID: <6mmez2xb6sngpwl6xide7uojw7lteudmqpazobcpf33l3pykx4@hg6n5rsuoici>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
X-Proofpoint-GUID: 4CGx3PbwugLcdgRqU5pYirRJkYC-v9E3
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de551e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ZbuxZ4Ij7ejS0DuN_rYA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 4CGx3PbwugLcdgRqU5pYirRJkYC-v9E3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzOSBTYWx0ZWRfX3JpCn4dBp9W9
 UPMF7kHq1Gm/oMevxtdXfbZb2Ls48cCX1LL2VBb3Uax57PRD1gw2cLIHSfTnAAoTCsztBct3eN0
 PYrurf3zmSDXRYXHRCkuxMpmaSLW2a9LDbRO1/H9CFZrMaSOvT1Xd56oB2HTEBkN6Xua3Vab+Cz
 CHRIRqr7rOOXp/OaCn5/fdvmOWiF6EOCB9fLN3hRZkbrU9eemEmf278ewRb9d24cHsHreL15r5L
 hgxyc3WpG0eThN7o9yPCp2okm+49WuEPReXC5v0FCIX7hJvsOGGVLiOQKmUNTb4SEeWJksfLO5F
 P4lnTzaa1+Ycj8S47RuLx2sAYdQcfVUzguO9RpFHjWiySzhJe//UKQ+39Hi1NkuFdMNlvNPidE0
 Nd/uznCffxZUnm7fIY70awpkcautavbNHTo+ppCaK5VB+rYr9Rz84b0T7EctiqA3DV6gyam0v9d
 duQDZCjOM72yaC61MbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140139
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103151-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03D423FB7F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 02:19:33AM -0700, Kumar Anurag wrote:
> This series adds the dt and driver changes for enabling 
> audio over HDMI and Displayport. 

Starting from the cover letter subject. On which platform?

> 
> Kumar Anurag (4):
>   arm64: dts: qcom: Enable secondary mi2s
>   arm64: dts: qcom: qcs6490: Enable DP audio
>   ASoC: qcom: q6dsp: Update bit format support for secondary i2s
>   ASoC: qcom: sc8280xp: don't force S16_LE in hw_params fixup
> 
>  arch/arm64/boot/dts/qcom/kodiak.dtsi         |  5 ++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 59 ++++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c     |  7 ++-
>  sound/soc/qcom/sc8280xp.c                    |  2 -
>  4 files changed, 69 insertions(+), 4 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

