Return-Path: <linux-arm-msm+bounces-104576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P8lKAW37mlfxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:08:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CEB46BCEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DFD530075DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42FF1E5B63;
	Mon, 27 Apr 2026 01:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL3un0MB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONLOPSGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A989B1A683F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252098; cv=none; b=S3J+Tgq0SUTB2WEVAmw9AsEhZHRZQHksC8GXqsAeFBMP4thLkpyvbhs/fEEI7lv1kKFbwMNolsqy+cSTLUZvA/BjLSR7OtmqTFhMgmyn6SEf8TyHSojVDYse+oceKNG2gdCGXixyOH+BhcpdgIyXctM2uofA3baNV5mc7GnB/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252098; c=relaxed/simple;
	bh=qgqzSUw1r5Wu+T0TkmA4VehsKlakxSppwbUBv2E5OKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BE9J6CBw41q/FrMMR9rjJhPbVhK0FG8XVk9v4S5aGqatQdURuADvmVOYpcuUGv5wXNORIO+ZBV6UGR939OV1B82J9rzvTPYOx6jD2jWZLFpYfMAueGWS1d2ic919MWrxaancuN9B5PgHV3mtk2uNanigCN79070TCbQoTk/mDXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hL3un0MB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONLOPSGh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q4hR293540523
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RxYXb+FnIAYwYa1Hr5YmJF7S
	m4XRXquQMMMxDS07Ah8=; b=hL3un0MBJ3KZfbd1r5Az3NlTEUjaUkUvpWn/bnFU
	GN0/7moGEud7EpR6ItyQsrrpJb6pKECvnZxLvAsvc9XgNQWYysfxWnppsnPMbWH4
	IWeki5/FEE3Qix2YyZyAu2ds2jNwIVAgxPXM/0Rgez973CxMz/uqTTOwDccgFcls
	Id0NBEEo/wWrXnw79Xo6fc9tbNyRLP+qqw8P8vvKhfdTTAobqpKWE41r8FEHZzSw
	LnsFPj++c3Qi48WytTWqC9lz0KmU9Kmf1N2bvTyrggnd2wcgZU4tXF/gxbX3Obbr
	HNec8Bvr42jLSpjJuSe/jU2CAgosRZXDNI5yGgmbLgg3tA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4ust0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:08:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2eaf70f3b5fso1637022eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252096; x=1777856896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RxYXb+FnIAYwYa1Hr5YmJF7Sm4XRXquQMMMxDS07Ah8=;
        b=ONLOPSGh80vMN07zFhHVYVHjC4L4V5Y5AvEWQXxDcE4gar0YVS/qqmCWT9ZbeJA1fj
         7UKOKByYARVCmLdlEJMykvsGEuAHYyNGCOVgJ0Ew2ZXc/GrOYG7bFPr4o2lq5SjnU3jg
         xsurNGYA3IK6oIDz4B/8N3D3pqIbcxuzE3t62mAR3Qstc1t6mnWB7CFLJDGkzjpBA3S+
         mCj4sKJI/xtJ2MBxx750YFWnK06YMhgyvP5RknjJa3tBv+4F5LJpaSlUa7KmCIOzic73
         R2tFiN7kLEnWdpEKxfuvGpAoWX7D3x+nmxATE9qPLwPNAvn6s/+k0TNmoPFaVsn27tFI
         +I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252096; x=1777856896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxYXb+FnIAYwYa1Hr5YmJF7Sm4XRXquQMMMxDS07Ah8=;
        b=k4uKs794s2RDlLwWVbhQVIaHsIOjUu2Qu4BjuoowZayB8uBQRGsaaT/SXPB+rT7ODL
         AtKXfSGLKy/q40l3FnDDD/lUC3K94dua1Ll5ieXLFESXrDxTheJTsvXXQq4T+WC3MFww
         00z9Xh5JYXOUGpBGyNXwjCW0vTQ5T1aXwXy0R1FtvssJHULqH4f+b37yBqgFzHlYF6il
         OgWqYJYCwIM0fd2QiS68Qmofb4JNt/Dx308f/W9YuNuR9cAnWiVaqtdnVQ8FtVnOGAvP
         AgJvZbLo+j4WFsVm2JVSby2K/VddkPEHjqAnPLU5P3TCFJsezXSVXZ74sybtbLhr59cA
         adcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1ryjzY848VQjWwArULCgSn2ijLdnEauMAwtx+8qI7v75jWHlTJuSSFvVmNdaY/yjEPBhIqB8e5k6OJMAx@vger.kernel.org
X-Gm-Message-State: AOJu0YyB19j+pe/zzGmQPzu9tKbEdYPVDP10iQLi/5/2eg/wyjk5bsbV
	wMZ1PV7GTsNGcDapffi2YQ1bZztrmJjMLrUIL8Yl41bSo01EIfcYE/l7FaeZCLw42GZW0KgnUk1
	032Z2Ar5mHVkTzYLTp6M7Da4tIVBkOtn3zkcoqY6M3bWIRN3Nrf2pcF/nMBbxFCLxuInd
X-Gm-Gg: AeBDieshjjODTXqMziBrF5ggr0ekLZ3Ystyau2teMTAlI6niMQkg49tSab0Ez/QkmuJ
	TUESBVvnBuU9oVQ9qY9G9Ew/YY5aEl4DtzO0+3cozSPdrS1BfzHxkYvEK1aFjBWLxAnsGqa+rBQ
	3bzbKaActFKpVR+Dktfus525Wl8ovcLHyzqegXf86dWrDlxGWehArf9v3G74hfHJqw4ey9Tbr7O
	zfwY4xn+lwueoyt+i99IqHMVlR62VUb4Y6OdfKQNSDja/1ucDG6Uf4tCdNdjk4QvLwYDTPiyi2x
	2KELbz428tLTXdso0zpiry40Mr6tYdxiryT5DNgFCsXDlFb/2dez01Z6Y6cPdvvWnBThSUibFFv
	6GrFSa05anTI6kUz531qBubaNYtW2V7oXoibfYgNGviRj9yCmHGZsbgm/0xCm1bn2reyT2/VACR
	0=
X-Received: by 2002:a05:693c:2c86:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-2e47a103c2fmr21228904eec.23.1777252096308;
        Sun, 26 Apr 2026 18:08:16 -0700 (PDT)
X-Received: by 2002:a05:693c:2c86:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-2e47a103c2fmr21228893eec.23.1777252095805;
        Sun, 26 Apr 2026 18:08:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e7025cf413sm37730125eec.15.2026.04.26.18.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:08:15 -0700 (PDT)
Date: Mon, 27 Apr 2026 09:08:09 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Message-ID: <ae62-exVm5HozUPs@QCOM-aGQu4IUr3Y>
References: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: ApEx6HIbUgTOgPjvcxLune1LMZYtomW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwOSBTYWx0ZWRfX+bp545MbxVyn
 1IhyECbgKJDxUFqUNqFug251Lk4Mb4t16FtVaZFvHGuBr7a+do1pV94CF6LDvC7uIc731l8kOEU
 jt+0z2VvCkCe4nZepMilIdqLR723H+MDo36eO881pO2dv9JoCB6qYnH+h+7l2OS6PFphB+Ur+rK
 w4GhVCuK/yFnHObAEvqjBWjBj+a01n3wu9YgWruIcR9hV2w/OyTym6hC1to+M0Jv4xRq2s4JNQP
 PfY+NIIiS1ymeCkxtztNc4WoIYC9IS0Zbmzp36cwTrfgDDXO0odTsh8b2Yw7v4b2G3xNq2NG5pn
 gUJGeENCOzh8jg0lx2NWYJI2wq9M+42rfs3wZYHDuKl/HOnYExVlnPTiS89Nhr7XdOKFli7Zg3O
 R4C56qRZTSHXzbuDy44wxUYx+OP19ZCZHHagCov6YAAMjJPOTLqBT07p/uGrGRtZAecrBZEFrGV
 9oJ344Rrx8vr+UiT6Yg==
X-Proofpoint-ORIG-GUID: ApEx6HIbUgTOgPjvcxLune1LMZYtomW4
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69eeb701 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BLlO_lzCmb2Ge3dZh0IA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270009
X-Rspamd-Queue-Id: 00CEB46BCEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104576-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 20, 2026 at 12:01:41PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Inter-Processor Communication Controller on Qualcomm Nord SoC
> with a fallback on qcom,ipcc.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Hi Jassi,

Please ignore it for now.  I will resend after validating it with
remoteproc.

Shawn

