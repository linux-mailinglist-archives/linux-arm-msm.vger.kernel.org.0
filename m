Return-Path: <linux-arm-msm+bounces-101739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB/5DJM10Gnm4gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:48:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9893988D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8734C300D151
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 21:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7ED2EC0A2;
	Fri,  3 Apr 2026 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNkJiBdU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYcI7FYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378E92D3ED1
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 21:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775252879; cv=none; b=VibusoIpOzfNG8H3Ll2W1+quBrUncAhS1CE8NPvSoRVzIXt3Xke1w3QKVAC1snMuSKuQ6jpk6604GJQeGMG23WTKkGVXlZi2MaSG9IHPybUGJBxx2oSlrD+kiQdlc/LhbSF6+LlH8YAAPEAPASUc9DBEymOkzDLKzBvyqxpNlR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775252879; c=relaxed/simple;
	bh=obSRFqphICqgwu5mGB5dOzzmoDIay7Ygz+pA+RIw0tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7nhMxYXEHqlYyyxnLCyhHEaAaoNNOwrm3bihTCejqXQSGGqOb5lCPp62K+ln9bedZQ02nqC90kwMT0QIFgHuZ16MS3KTFXAVfcUzLmjhn8w0rvuywBT5ymPbmllYI2keDX7IOC22084K8n1pnB5PBBygE08ZD8BYxjTtf2OVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNkJiBdU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYcI7FYR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FKci73449980
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 21:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EmZwj5MaWSd913J5s1DiIbj1
	ZJYGAjg3Ytgz19+VIvo=; b=NNkJiBdUr9k04CqPptP+mgzxkXXxEYBFuZS2c751
	dZ3gHcMzXVdD5udjq/jQbvVgNtwBpDUiUaFZt/zvIdGerjdIz64aoK0GJS5NprEd
	+Q8TJXY4ZWrpIrOIFgDtGMOecVP/0pEdo/oSbpT0FouqdWZp8nGQa/E7Xoipapw3
	MRMeLbbiFr/SnQVbJcPE0NaQmZnHh0SZGKQAJssRtMPBxp7J6sBSElGXMaDSFCgL
	GfGPcJ+KZIzvX1hs2rrAIQwCyb5z490yo6W0H+4bQ4Kim4lQp7TowmPAwd95BRSl
	aIsPDO8kxE9djO49WzfmbgG0mWuVkx0JUz1sIfg3BnbqoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u5aasm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 21:47:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so107218631cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775252877; x=1775857677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EmZwj5MaWSd913J5s1DiIbj1ZJYGAjg3Ytgz19+VIvo=;
        b=EYcI7FYRVnJJMY74rEZB14rWAg3gip3DhiJb6U/BJV1a8s7lvAHdtrQYGfMc7WpeS8
         qVpOkn8xsG4Q+QpRbm9bYOIB1gWayJJenclAZ78cqmzgH6lCWCiaoqOZ7Wfi1Co2yxoA
         hlfOttKM44kwIM8T0H14hOqPwrWT09+WDdNLNBKdx+QE6w5NUDBAfYLkUAo7a1O3cDHh
         dYUh/syEpiRKnjduh4QLoKmzsTyvNFymdFXQ28YU0x50kgfGQ7b3qzmNiXMXcPuAuA4D
         a7EX2dkg8gg3Us+T+2lQuyJFwzff894zTuhPNNfkUX+nZcOmLN4iEAGIG0iyDa2uiQFd
         lkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252877; x=1775857677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmZwj5MaWSd913J5s1DiIbj1ZJYGAjg3Ytgz19+VIvo=;
        b=IVRoiZlZ43OfNzQOgKXmFbahhWEKdXpmbWnLQdSYTyBbQRXfgG/CcIJz4eRTgfLqhQ
         ip0ckYk5cIS//1yn1GhLOheWN+U0p4u5VESDn19KkJ18LBN5h5CrQSDLCsQ0IWonMHWC
         +GZSZ0P0Iw6p4KOZ3XE0eL/AP3LFGe0vVJL8dBYkGXawW4/aGWKkhEZCoUHioSOYQWOj
         3d5O8nhTAX2MYmb4yHwborsJhV9qjwf/gpWgR2nZ4Rait4AnxIKNn9LyHBNNqO5MwVCB
         vyVXRRD0cZWSXyZYdpFrsrGnAiMOic0QWQOgRpZl/5lZHpY5AYYb4kDRanNUqJYKQALi
         rl9A==
X-Forwarded-Encrypted: i=1; AJvYcCU2SgB5ViMvH5WThB8RpsR0bBMTEiITLTTR2+yf9WzrI2celVvLt53XMPrRxUMDFuyx32pJrkLbmLMyMaWr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5MutvSqqI6r6eq6niarjyxMLjxCr8ns2uxgo2xK6jrqd/hpHF
	AgUi38Bn6dZ5Dwh5ofEB8jvsBlZGa1lmVgOT/N1RI/QoXEGR0Lh539ioEXxOilSwFXfAuP5Ygm0
	kOF97nc+cT+pSWRUWV+8fwEGZV4cpnqx7qWRp6aApZoJ5bE9zB1aaCHTd174e9PxamFb3
X-Gm-Gg: ATEYQzzsPgg/JxXI8mOHJkTs8O45C3SUDrvRpMU8lsj3Xc0z24YeDDK2Zm6zPZRiVFQ
	Q3Qg5TldUO50EqcBH8JUaaAUoSPjNdpT6YEQIw/qHOsTSutOx0ZDMyBf2k0aDLvYRe9nMB2RDrv
	hUPFhH33x9edQX8RDVBTg6Y6YVnF/3sibeqnhxpVO81162dk7GBxeGrRpelQy+5KSKWnP6GPlm3
	83EFyHK8b9dw3oBnlVEPrB0cHScGs1/oH/9q6W9eIvVFAlyGUFgmMxcxuuT6J8V0QpiV9/0v9vc
	a67g7tf55HlSh+7Ua0PX8Wtk8QvfuchNWWQ6+FADU5x4cZflamAtX00u9QVBtH877rRPcVh7VGo
	Bo3yiGWA+a9NZHRuzd11odff85+LePpZ2f+33yyfzeEcuQrztDF7tPamQGpM9VArkWb9rUT7fiu
	f5SdznpFXukZ1UZbU5nccHIGszFKL3opYXdhA=
X-Received: by 2002:a05:622a:11c4:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50d62a7f2bamr66782651cf.40.1775252876673;
        Fri, 03 Apr 2026 14:47:56 -0700 (PDT)
X-Received: by 2002:a05:622a:11c4:b0:50b:1adf:89ba with SMTP id d75a77b69052e-50d62a7f2bamr66782381cf.40.1775252876146;
        Fri, 03 Apr 2026 14:47:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2187070sm14998261fa.42.2026.04.03.14.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:47:55 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:47:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: pm8921: add labels for ADC
 channels
Message-ID: <43agfdcud77ifh5oxkrzkxb5dcybja6bw5f4bxd3ebdjjrni4v@xc7rhornw4fh>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-1-29b50bf821e6@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-1-29b50bf821e6@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NSBTYWx0ZWRfX+UBJJRkpaWL1
 +iXEMQqT8afacIjWcKjFUXa0nsSoLza9OgO82kbBPfLrstU/vj/GYps2La7BgOzryDv3WDNJsPc
 NQveGAmNrFUJrZ5Cqn50/qXqMRkBO6qYzpq4slklkdgFs5mVWKCsVzyzIOzUgqls8uPJLM7nPw4
 LqTWakTx4MpwMB9KcPGtdjaFr+2IVthkmm8z1coWS3QLsVVHDJiLbMPQD+Fb2f2dlA4VBCdGBB0
 Nx6T0nzknw+pGi/P8MoZLttVylkO0YWTo6V312AE/nhUvEiyZiuDwQlxPSSuf+aGXO/h3VZK7CT
 m1vcSYpUofRNFqF5Lj3qAbMr1optgzRMlndzqriNpbov7IYBJ/6pS90zsKSgVLRe73neU9IPNa6
 fzUi93acy/8IN9OVPW2ioC189i9ojWoX4GVJZCepkiZ0oRz4Fsb35go9zOqOGaoIUVgfczb6eIx
 xHASRJ3O+mJV6TVpyAw==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69d0358d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=wxLWbCv9AAAA:8 a=Ke7W15zrM9QGlUBYRRsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: KYpFfKwujMT21XxRU5jgksv60h8Q4EfJ
X-Proofpoint-GUID: KYpFfKwujMT21XxRU5jgksv60h8Q4EfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030195
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
	TAGGED_FROM(0.00)[bounces-101739-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smankusors.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: 9C9893988D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 09:23:14AM +0000, Antony Kurniawan Soemardi wrote:
> Add label properties to all XOADC ADC channel nodes in the PM8921 PMIC
> device tree. This allows userspace and drivers to identify channels by
> name rather than relying on datasheet name.
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/pm8921.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

