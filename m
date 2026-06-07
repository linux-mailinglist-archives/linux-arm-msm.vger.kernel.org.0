Return-Path: <linux-arm-msm+bounces-111547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6lSzFaMiJWo9DwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 09:49:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B751464F089
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 09:49:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hsWmXFzv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ReLKv625;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111547-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111547-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C1E030156F2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 07:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D1B36BCCA;
	Sun,  7 Jun 2026 07:49:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25682DF12F
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 07:49:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780818590; cv=none; b=Iqara2GcQuJq2eTpJTPRlFmVNY3Nsd5r66xgmDxOU5WCUopiNrR6WO0ZE6aI+5YoOzbPgI1pRjux98el4D+QexEPQacNCX4SuqRSmLcLYZaPFHbRTaYYcV9Y0n5DriaVSmp+0mFiUY9uIYRofdXx42uV+ySZUHZrZ+ft+ANJ0Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780818590; c=relaxed/simple;
	bh=oSl2ogZNQGmd87ETOSzNSkSCh4CwHrElkWlKILloB3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nw6x8mIYQZAArHNd3xC3gHGoQHHBWzyKmcwOja5YGf4ADww67vbB89/vrqHayHoIiInzaEPQPkmNks5XhzFpxewWDWFAw9urKflBwShs2gxxyUzDrmQNhTMMA88vw+OWLs3vfead2m4t8f15leDXuiHjijLXPzlvna43QEhZtF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsWmXFzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReLKv625; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6577BU5l4123274
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 07:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=teBGrABVhJlKOgLTq47ixTXW
	2t5GHP5uTDgWHbMXLYY=; b=hsWmXFzvIlp0gBkcRH8W6efCALF31zsiNJF6+8uL
	abO3VPCbK/ndI6+DlbNPt00iqcQQy1afr9/huMWvIUlRuSGEbV1spJsmY+tUq4Tj
	+rxWtGuSSsoxWXKtqpjPZjUR+eqlIUEXul1qAPJvBNv6T3COCixE+p3xRh6jjbXP
	28q3hcRBOxF2AL3Cmnu2R6HEe6j45Z7h21jxMQKPvCPgf0Zemuy07AgDxZYZRqZ3
	EH7BecnwOCLwjesTrxU0FnSZCMGQyJhrLKtZ4/vcnHDmNdz7tNbeDkqBsBShB99a
	TdP2avwVDOWCyZBXFTT4taqoTYx4sumz4o7eRlM1wlUytA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3kpn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 07:49:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cf9627010bso3986059137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780818587; x=1781423387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=teBGrABVhJlKOgLTq47ixTXW2t5GHP5uTDgWHbMXLYY=;
        b=ReLKv625itXwta9J3sb8DIvaV+9epxszzkczRB4vegDInMjKjX6DFYWn8FXObiYoan
         NovG0oZdM9VW5tN2LakxjoAZ11c8tNLfBic+SU+Bfbw+rKMTLM5YhbFQhNtIN0mPSu0X
         2dKOZoNeuJUlMCYrluMIx7shh8OSGV1GbiLKyaL5POE2N1UvbhVjnMK+FzMPrif3Koi5
         W1AkBk4EfX15X8NCNV+DU/S0xaSXEjcngFJBUoGSPAoA4a/X8NTbGSdfqeHBAIGofdby
         0oq5gRLMiQJyRNpinstwAnBAV39PFRT/5IGWO3DK47C1P4cBQh8PnILZmuzEe5WogmXL
         eogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780818587; x=1781423387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teBGrABVhJlKOgLTq47ixTXW2t5GHP5uTDgWHbMXLYY=;
        b=JmC89GnepYEbdo2txiGHnDUdVJl2QIGf4VuCKwbV5hALGbaI+Nps7nnL5gB5sLFtu0
         kBjM0zZkIDZnNqARL2PW5YzVtO7KITLUWPCu29vYfKK06HxgQnzpiEo+DnuLMB//ljHK
         0GBRyBxYXLTZIac/Rz5OqO7TtYAlA/DeKRWN/4Qawz+Nphjk969JRphEkKBhq26CEOFR
         5wmZZmtwL+/KzH8KPwysbBKGlAqEkwvb5q7x9fp/qMtJubpIOe2fgh1rDxe/wVUUIT9g
         oBFx3gTK9JF0mNoRvWVEE5TlzhQQoEKRBJ0NilIKc2pKrhUrY549+2LDXMaePclegAAJ
         uGXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ylUOk1nV/gFqYPXRtzNYItZjsiRMMBamtFvCUxKsD8GN2QnNl/ZDmQtOg7xnR32no9LifC7gqvuQrXJ11@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2c1j/N8dbANyIBs1LKg5gLu3xLoWSPc9CWdIZ3SiGX53G5jW2
	1l/9Ta9IxVi4mZmCj+OfYJyKj3ksOgAHYa6GMTQV+NEdu00g2IPsS5Bm5ClM0d5/s3iZPNGbKKj
	YTuUKJjLKtLNiJgoAOCG16X4sLnws95fsflx5sGjsUvFXtv/99VYpk3J0/OhIzMUz1boj
X-Gm-Gg: Acq92OGuuU9GW8yRLt3O3NLA0Txoq93qdF/5Ao/PdtMmnn0+++wffiWLsJ3ZHxvlrzC
	9h9MqwBpdg3cSyC0dkYvrIO36odhr1dJqZFB1893TKCnlCKV9XOU1dWZ2i93ZdmynYAwkM5soAC
	GWGd/se2vtsgFlXCgrsqsfuhHK/NkZzPqDFHumeE0tXXY1XzJCZ8wnbP1GIwzy+8F6dYpMYuU4Y
	4LgSnMHEyLqFJJCPGYHv3rZbX62D560hiTmm7RGf6h57Gk1B5/wdgXjwf1Av4NuRpxZvFx6J+7w
	/RhMqKqgKW4lBKg16ZseUb0tN7hoO3PbxRiLNIsCvaDR86TJowV13s1FuedpmP3TP2zKtPgi34p
	Ew78iVoAizirU9ZbKHNjiUiCbEUXaSX8cV1mzk0I6Cn2la2LQi937Y0TgOs1EjEO+wNWWApfN/U
	XFZYDcsFdKl/tglRfvQqDp+EJTTsbjSh3iwo2+uifd40Hx1Q==
X-Received: by 2002:a05:6102:3f49:b0:62f:5908:648a with SMTP id ada2fe7eead31-6fefe3bbc85mr5850559137.28.1780818587061;
        Sun, 07 Jun 2026 00:49:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3f49:b0:62f:5908:648a with SMTP id ada2fe7eead31-6fefe3bbc85mr5850549137.28.1780818586588;
        Sun, 07 Jun 2026 00:49:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm2915888e87.34.2026.06.07.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 00:49:45 -0700 (PDT)
Date: Sun, 7 Jun 2026 10:49:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH 4/5] ASoC: qcom: sc8280xp: Add per-card data
Message-ID: <t2vwes2xzruqygdjasgi6akwuvephitqbyz3dntiqidbm23bki@uj22cgv72ht5>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-4-7f334e16fea6@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-rubikpi-next-20260605-v1-4-7f334e16fea6@thundersoft.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDA3NCBTYWx0ZWRfXzsfIiVJBvJXe
 5fHEP40AP16JhTAMCaOk4ir3XcAhOmAVVABk0VZLI/tEpfXTKjhOCpkdqaNDudmkWMY75Mzdtpi
 G+/26qBDkfzf9/NGdOUtdEmYdPN5XhpE7mlxCJM0u/4MJ89TYwZS/wsguyoERuYPtN2Mj53IN2J
 95tWI+9t0w405oKj4TrQXffCIQCXBBrMeM0Nhl/5WaEjM3DUIZIj1hGo6o18CW2uQ8RBbRIb2ni
 pwDuMOCW5AlRnvSxW25Q4hSsBIziKcaYan3StWaa1oXKGDOYT+IHNXSjO/sCnf+60J1DLiPbQia
 JDfJhvskGcVDAI2aCPiqA8aA/6ks3O2/Q6plJmXOUtsnA4W5RFbefrK2smA/OZQRq7msx3g6ll/
 7sf9evdvsQxlNEpkOB7z15d4zZZSXd4bpF0Nzd4YM6pihon9GNNA+P37LDCHtFx4CRIrI+tlSoN
 sTGhs2Z5+s45ZF1X3Ig==
X-Proofpoint-ORIG-GUID: gBfN2MJJC1nkTv3QoB2gHsNEC7qO3xyW
X-Proofpoint-GUID: gBfN2MJJC1nkTv3QoB2gHsNEC7qO3xyW
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a25229b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Wdb1h0LgAAAA:8
 a=ucrSXoFAGfgxklnESFQA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111547-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:drake@endlessm.com,m:katsuhiro@katsuster.net,m:matteomartelli3@gmail.com,m:zhoubinbin@loongson.cn,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B751464F089

On Sun, Jun 07, 2026 at 02:58:20AM +0800, Hongyang Zhao wrote:
> The sc8280xp machine driver currently uses the OF match data only as a
> driver name, which makes it difficult to describe board-specific MI2S
> codec requirements.
> 
> Convert the match data to a per-card data structure and add data for
> the QCS6490 RubikPi3. The RubikPi3 data configures the ES8316 MI2S DAI
> format, MCLK rate, BE hardware parameters and headset jack pins.

Please don't mix refactoring and actual changes in a single patch. Split
this commit, performing one logical change per commit.

> 
> Add a common headset jack helper which accepts board-specific DAPM pins
> for codecs that are not connected through the WCD TX codec DMA path.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  sound/soc/qcom/common.c   |  75 ++++++++---
>  sound/soc/qcom/common.h   |   6 +-
>  sound/soc/qcom/sc8280xp.c | 319 ++++++++++++++++++++++++++++++++++++++++++----
>  3 files changed, 357 insertions(+), 43 deletions(-)
> 

-- 
With best wishes
Dmitry

