Return-Path: <linux-arm-msm+bounces-111213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id isgNN316IWqNHAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:15:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC21464039B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:15:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LYGFz4HC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iPVJiuaO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111213-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111213-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AED1D302F03C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 13:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B60E47DD53;
	Thu,  4 Jun 2026 13:04:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC1947B436
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 13:04:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780578262; cv=none; b=IgSZheEPz9Iqn3gwfRO/rJqAXwa65wABiPF3eUmy5z0c1xlOdEyPrnEW8/34K+qPhD/AG7P02KMH8/XZr0/vQihyE4HCoRYOIl/FOk5hPrXS6SMglea1DpPDKY9iQ5IOwERf1z6yWGCDmIrZ+L83KRcilnW6j6WX/WAtQ4owgJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780578262; c=relaxed/simple;
	bh=0Qgo0CRLvNENj48KGFAn4sGKVbbqGjtUkT4DIcxEHz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXns2mKzLNJuf1ORuZWeyD121Eg5emW5Yh8gGkCCdV0cS6gN7+tB4LaiGVGSIabRn6NpHk51Hv1/F0lnEiEgbGm+9LRIyItb6VWDXdatnYt2pLrWjRdzwgt207/2M1L7r8249WdhBRE58SkDKy3gx1IbIzrWG/XmYj4WQPpdZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYGFz4HC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPVJiuaO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548NuvA141895
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 13:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kygRY4F7eJ1NPjqjo+XnXvVI
	c/zT6FpT96y6RC3eCRo=; b=LYGFz4HC6QJIf95dQ+rkttk6BETSr1NO4PX6j884
	i1GC+e+8AwfzwdeAFnf2A09YFRF5Bgzbwsf55VHhjnBa5/usR53MnALGKwOnRH9L
	1HvclKZU7w8ZrvhbG9z7m+8pwlX4iLH7dtBy3svAUX1e2tpKcZ6i6Fm5fNsyXBbT
	0XPdKKQ1p2KWuDbq3pCNfJhckX9oB2B1JUriTePpqGxX5x9sWAlCU+rLL2LOs++8
	IbWLSW5qiApcqzMWdAaaDaz3+P+OEHAtMIS0HO6E/zMarcZcPAa58BDMpV5yy8AQ
	z2GiLgjfgTA1D52q4ES+HSy34wcFSjKtSxJRkGKObv0sdQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyenaenb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:04:20 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6a306a7b0so3569602a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780578259; x=1781183059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kygRY4F7eJ1NPjqjo+XnXvVIc/zT6FpT96y6RC3eCRo=;
        b=iPVJiuaOn5rtSzBwezVRjcrYeFr+YLjqg//xm4c7nrcQVMKvGPpyP0ZuuveqH77J/N
         QKULsrZS+B+j/LVMxy6osS1OBa79FengeY3w18MHL5i4ILxDjtekYVf7M3LMiL6nwZxX
         IX0ftBvqqTcCWEvi8DkGIUXKObnwq2QiRfIhAoRTXK8lv/Z1tFCxwQ7vzu1/sXggJP6o
         0G3qq7yXwKA5NHjWS93v26yQDXwxnJKMfOttsDglvQPVb2ufXvaJsfy3qPZSsqPaGRCB
         0Tb0NcUB8eHQU0sdYOhF8n2kjLLBrA4/Lc7doE6XKmUViWRV73sYsWyqksVUfLUb+5V4
         l5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578259; x=1781183059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kygRY4F7eJ1NPjqjo+XnXvVIc/zT6FpT96y6RC3eCRo=;
        b=or7T/XaXncldf79UmaOpJkmCGEQReXe8Ez+CLSIYAM+hpSfjRDjOw05QOjFkxf15iY
         wJfokveD55n1A1eVPrg072WlxbhfBoChlbee2DriL9KZ+YxVLuEzYh7BYxgFwX9w7Kmm
         fMIh5Ln8jCJZTu55FzAGTlTI3me8On9vamO7lL3LY1vBTSsON9X1thtdcVx3NI88SZBr
         s5iXDG1UrjgYMfLZDqKx6q7AUUBaU/BgX+kSXfC2KpKRGrkrYAPWFkYWuQrx8/RhScDg
         e1V86166qaOBQ4fXxFeyCjDFZvkG/R4xWgRbYfY3V3ggh4fWnZfkCE7bPtX+dYgGKXV7
         d2tQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HtQxmUjXZD9cDjCiXnLl8s+B2pJ1wBx98I5QkVADD/x8P3bVXJwHYg2mPiGejL8PVzpV9SrN2vF7N700N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Nn3yHQaPrQIHaN2gY/ynuohCX4pbDXeDKLZfrRXKu9+do2z2
	Aq8SxYAhf/35POcKBo8k1kCJieFTHMtKb45QfttRCJtbJGoUSpvQ5p/36eeSgnJoVedUypzoP4G
	gJcXg1+7kz2bl6j9fKCatiojLudxT9pubbkuJcl5NoONZnkjIDHuuVnPEXYHeFwlnLDLL
X-Gm-Gg: Acq92OHDXKT6pxjQOjyFdzDATuQWXq79LROB7VsRksiSF+lSxHTmN2CSjDKDu3K0nD2
	anjjiWL7a9MfsC++3eSAGnBO6svtr2tCcHM7GzbSMmo2biTQzDH2S3v2ayALkaBTGls1hDTiclK
	zgL3MqB4Il6M96hCsN1KnJ39LdEZ1rxqkbhJBH0Qentn6OrKgYIN81c5VIncvB4+3id4w/ddodX
	BN+SfHqN1imizZvKB68bPHKiZyGFKPRrroalS7UBMT5OaDTcbTN683cbAjCgwg104eTjesa5AAv
	PZAKUUmXqB7MG7lgwvQgW1ODWzEcSiJ+y0LiItazOCC8z7vNM7XhdqeF/FOuOQ050nh1JnqHmcb
	NzuYMS11Uu2ClOriGz0CABOb8a7/khw4QdwuDN90ZGIil0A5gBiQy7FJplAMb4veYPOPlA6BZeX
	XojV4d5VsF4DnSjMrCFJRh4OjWtij7t2NBMly2hZcvFQQWfA==
X-Received: by 2002:a9d:5e0c:0:b0:7e6:441:cb4d with SMTP id 46e09a7af769-7e6f91ca449mr1449308a34.3.1780578257765;
        Thu, 04 Jun 2026 06:04:17 -0700 (PDT)
X-Received: by 2002:a9d:5e0c:0:b0:7e6:441:cb4d with SMTP id 46e09a7af769-7e6f91ca449mr1449240a34.3.1780578256962;
        Thu, 04 Jun 2026 06:04:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm1197378e87.34.2026.06.04.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:04:15 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:04:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] soc: qcom: ubwc: Add Shikra UBWC config
Message-ID: <nkzfcmzslcc4e2kp5fv2i2grb22ncf6ewd5pn57wy5tdth4zrt@ddrquhu4ijcd>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-3-b3c1b2b67edc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-3-b3c1b2b67edc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a2177d4 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2Uxw_1zm03w2ut2Jle0A:9 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: wm9CGlW6KTBQTwUgPxnj-KqvgFH4V37I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNyBTYWx0ZWRfX1k8uIin5mhSz
 2yoG89haFtqxoH/NT4GF9sa+tSIf+vP5ov3xzU9UJ6E0SAtWPfYOOaj9Rv0OVaGmcug7AXyfW1F
 TE7gDmHOvfqNqysMFDTRZTGuK1kY6DIJWLj9Y+Mrny+gXp15pCBLKBc3OGV+ft+O1CUX9nairu5
 ijd7E2PdA0WzlLq9vLjqJlCzbb+2TOACmB2u12N2okHxcBk2eK4cLPjIJKvLN0zWmlM36lqNMka
 4qMnm1IoqRFeAwkZSI22ErEq86noMQJYb1Nae0jzvVQQCMnegz/QmFOXIhcz4k1pZ1mJw+sF8md
 osoVeV3ltRD83EjUXvRlZB1lyDUpkmtNxD92IYQKzPRctnmxW4jM8EZongMtzAWHSLnJyANh2Zz
 NEolwzFeRy59n4Rg2Qvp9D1JnejVjpWwSp70XZ4BJSQJKv0vLBocbpzr0U1T930tlhANPMqwh6P
 3ntyAix8YoVT5KwisQw==
X-Proofpoint-GUID: wm9CGlW6KTBQTwUgPxnj-KqvgFH4V37I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111213-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,ddrquhu4ijcd:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC21464039B

On Thu, Jun 04, 2026 at 06:00:49PM +0530, Nabige Aala wrote:
> Add UBWC configuration for the Shikra platform. Shikra shares the
> same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
> UBWC settings
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

