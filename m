Return-Path: <linux-arm-msm+bounces-105819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDZ5Bskg+Wmz5wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 00:42:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B85134C47D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 00:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBB5230209D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 22:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA4B38756E;
	Mon,  4 May 2026 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFkwYgbS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETpJnleC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0551338655D
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 22:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934489; cv=none; b=CCA0W10KcU9rZzrXwTto2K1V2qhIOUAiCMHitOau+5svTdzhIE6G1gmaMX8/x1aqRLx2Li2W3ixUvnPVC+DTsKYO5Z3yr2NdyOuTse1sHAmxy8jrgGi0VyAWiziYt+2k7hyHsZ4gxUR1c5jsGXcO/fReLIhQnI47+iDqzNoMzow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934489; c=relaxed/simple;
	bh=sP6m2Q1icT7q7swqbmA0n9OhyvZfa4URC74dWoD4AcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JppWmpn2b4Ofj+IEOKYwwkWnDnpCCLc3QxLzziqe72Su46XstledDiVKAe5r1z8QUYlTl72G9xzzSNWsjEHa+iIEAxB+BWTfo8HzhWSAZ9pHabZvjYbZI0ucya7cd4LhFOi3Y6yspFpndlhz+BiR9/IkT6+Mevz/j2cj15cKPVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFkwYgbS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETpJnleC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644Lkj2n2166978
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 22:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nwoJXM6+1xp+hLX5E50uMhXY
	2w5IXLa3r/hbeB0B2t4=; b=JFkwYgbSJdNmoSVpJMPbX0CCS6SptV6GgHo2/0n/
	jFC8/oeZYqCZujRkQBp0VHC3vM5uMc+PqKjt2zNudlMnItK+BWv9V0IYZRTBdN8r
	LbJ0AffuVMmBGxhqKPlKlJaFz+mdsDNf0s8BLyQaXGjAs1A8jm8TglOhlLSSl7Cq
	/2vWaAIYopRi8ti7AAwz5crGYzZNXWtGAEAZ1NEI/yTYaMq0ysLhbzsdTiuTVO7F
	9FpcGaXW2HCHfcb+/VoCy7f9AqHVOHYhbnQoQMEv98voFT5uLpJ0RDVcJF1rtR8z
	pY601zgpX+WZreXoyJ8aqaW8kiZKyuoqQfCIVvXpbLdxDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscf2jdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 22:41:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso161031371cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 15:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777934486; x=1778539286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nwoJXM6+1xp+hLX5E50uMhXY2w5IXLa3r/hbeB0B2t4=;
        b=ETpJnleCcDLALnmkM4SwjTlAS/ZkDT+kyDH7NxVavUntpGFr9pQk6grh6jfVZHnWn0
         bugsFT7RrqfkxliaFt+sw+f6NLV8s0/K+76MKLI/PStJw/6j+0+K3noNGV+yiiCxVuC0
         5sfKZj7I66QGa3Hrk3xU2El/+z7u/22T/YNTy/OJXqie/9I2HdQZeVUhCV+1R9H2Tgeb
         RFLrMc0mWR5o7H2d7JEoAeLKbkuaioakyS3bABf1wsjSqoHALeP2ZZ/mHHfaGDJtbKCG
         yBlvHeQMWAaZEMt8vNzR9YFY4XcJy2xZtDricJoEO8mxQOhoFJ6XER0sf4Ey5R6sPa3D
         xjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934486; x=1778539286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwoJXM6+1xp+hLX5E50uMhXY2w5IXLa3r/hbeB0B2t4=;
        b=iB/zWkAIfUSgbz1sqs7b2euuvCWJe/SvDY2Nd/hqg1BAm2X6UKXqi2xPZB1GizkvvL
         ds0b+aQ0oDKbL+qcLt9ocIvP/Dj95OVZ0CU9PzW3hsBVe4ylGR0K98RTMouKTA35wgJn
         rMQSBtAFPFwjz6bsHS1cuetdtJhAEymQHm6IoPQG14tCUGR2piqJL8hXQ5quaLpuBwH1
         Hsm+vTyg65vC6oLZPl0w5GndUfjKcdByiLj9nztXisv7Ob9a/xQwfkd4OavUAlt+xx5R
         6IHgTbSHcih0pXLYEntMcwLb7n7D3QCv6M15CXW62ViBUGdJ7lzGtV2VJEoXIEosQE23
         XNVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nWh0/H3GZqSdrrMZ9L8iGmzQ79csu91NY+JzPabemd8j5PR6ASovcPZoonVMM6r4W17msEHFM6rSP6F/i@vger.kernel.org
X-Gm-Message-State: AOJu0YzmuAk6OWd/oHOiZbJOWmYTw/b5bCcelm5FXtIpdLNHRbelTvhR
	Rz6dfY4tNNhEGnzODNePf9NDJwmmUnM0IyI/PfWe0Y/cOars+lEaxR2BOAtdI5Bku7BWHdiDBD1
	NQXp+aT5Oxa2or7A9KHrPdpv0/4ioVyTS4kFAHRyR8IDBF3LoySv2+c9PjG6/pfeGH53Z
X-Gm-Gg: AeBDietnRX1h9XRtbY7VQJNJ+tkMxpmshJ5KppPNBLJMCk0TCzhU60Fa9CtcPjmrKO1
	X8UMoSGSHizcmceeSKX9La+kzPq86K6OlkPmls2mhWzghMgR4Sh47+C1C5Sgq62tYxI1CDp+pNg
	82OueRhmi0zWiQkz1QNd4Jqx725rE9/g2mMFXr0KC0b3LuNZIf+yL85S/NMD4yGmWrJBAMCl6La
	dXc4na1orB1he7Z1DIrcbfKFU5hv7gGkUQDiQ1rao+x10Il/iOHJ/n4/pFdbF5MUVYcYObYipGp
	52rx124rnjDVeoBFfJzcftYTje8+90Yjm/lhGBcHm2SXoUQDSMkkn6LhzaXBTikcoC3Yn54KCqt
	FLJhG97wEMQhSzlZRGj2iuiOSooll+f+ewJzIFculK7WPpB8DHW78SKZ8Ccey67fdJDc25M/lUt
	nRUI9Knf2A9ktk/3H4FTgV1CPkJ/Wf8ZlY/NLVZUw0e44PHg==
X-Received: by 2002:a05:622a:1aa8:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-513069d6e28mr11412121cf.17.1777934486322;
        Mon, 04 May 2026 15:41:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-513069d6e28mr11411561cf.17.1777934485864;
        Mon, 04 May 2026 15:41:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361300c88sm34342041fa.25.2026.05.04.15.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:41:23 -0700 (PDT)
Date: Tue, 5 May 2026 01:41:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Message-ID: <7sujwhy2sbnxhyuo3xajlohsbkyvugciq5but4eyjsfohzojg5@wflekkz65bwy>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-3-e09cb05651cc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-fp6-panel-v1-3-e09cb05651cc@fairphone.com>
X-Authority-Analysis: v=2.4 cv=BcvoFLt2 c=1 sm=1 tr=0 ts=69f92096 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=7jsc-R8H8AlhYXVgh4oA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDIxMSBTYWx0ZWRfXzqIJ+ILCeXvz
 iD9zZV1SDxAodOSZGL6GGz2eJAU7nyUobuCofMouFW/65i1Sl+4RckFa2quj79WauEyS6Prisby
 xsN/sDkFFQWilTEQP/nd0W88emAf97b5+j9XyS2yLDt2tCyMIlGyeWfnH0K9lJt1Im2fb71BGg6
 vpmb1ewh4kuU5oXyfmqrRCLAgtI2hLGb9RJ/trekK5H/dnoD0xPxuhmDzKi/g1AO6KiDIMRioap
 hgAmri1AzXvSocjp+Jp+4gpNIhmvEUU3n2LIq1w+tGcP4OLrOWSkGSTDsKs/EMdipBBQ1N78Tpe
 LiJoliOWTs4dUKgoS5d4PPsz8aU1/171y5/xQiYjNiHiLEKiOHFYpRM6A8GnnHpbm5paCVic9ju
 9/TSqggkhbVoLTpAkR7OrrDgl64CGIFT7kHB1zaRvsg3FEkQcWfiHYVcQ7VRR7Ils+WDnc732QC
 O2PK8DUpAE5A/p5gLkw==
X-Proofpoint-ORIG-GUID: WV-_0X6cpTAq_jm-md2SRRMp9P4lPune
X-Proofpoint-GUID: WV-_0X6cpTAq_jm-md2SRRMp9P4lPune
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040211
X-Rspamd-Queue-Id: B85134C47D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105819-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Fri, May 01, 2026 at 03:52:47PM +0200, Luca Weiss wrote:
> Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

