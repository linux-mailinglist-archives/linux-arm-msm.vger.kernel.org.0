Return-Path: <linux-arm-msm+bounces-114809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x8YgJxOmQWoatAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 00:54:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 319BD6D5333
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 00:54:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IVTj4Z6w;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="H/5NAo19";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114809-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114809-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E590300463A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 22:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF01372B2A;
	Sun, 28 Jun 2026 22:54:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2133644BE
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:54:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687247; cv=none; b=aE9Gvv6J/MRagSMqoB6i5WCEtrPL4QkjuJ0qa5gthnhN9isWClhr2UoAVlbS44Gacl/vzWpSD4Q1DvAB4m5dRpEun2IcF8H7ZZU1G1PIOcctDlLJ3gDR2OAakcLSxUgFirPuLgTt7klTPAyqpM96kp46Ied1jFvqXJV/D1scFk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687247; c=relaxed/simple;
	bh=FHM9I7MAjyy1mXqIUPgsWC9RtHIBPLm8K4VhaRELGzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dk9tKdtxB+nI7aE8xOF6MrDxrBMM6gmePDEue32Sdu3ytoC1vpVzHFigkgd9+f6T0tMhbra+hV0y5MA4Z2dA1zt4sssH8tViuAgwAQd86dRujhzpn10ehOgRdsS+UpzP7Ze7+NgKXSaHpJKjmWr+QbISlaV1zYKK4EAsbTRZvjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IVTj4Z6w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/5NAo19; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM94vu992723
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qaaIg3gvt+W7J5Dpnsp8EdV5
	SRcVyaxwovZUztMqYmM=; b=IVTj4Z6w48vDnABsrjEnb363TqfizJ+SNkX0KG6E
	XLKlk2hyKGozaj8SZ3OT0/Nenbli2kQMw7PIRzIyG2Wybv3CEC3TpRtig0023lvM
	wvTCfKvokAjF8rIxyx1ULFNUmunw2mDYeZuYqP/hNDXkoEV/LvkpJddGPGzWn5wS
	U+LAqFEgwMks/TqoY/12WvTSGaXSJGUiN8HMyMzqllue4V37eDb4BeHCdasWgyyi
	zxdvWOuW/HN1RbGkOm2maJ83M38RCA+66D7NTZ3NUPrQymz70Ue6BVw/4b3TnYuv
	9qPGRYUNyXM5WfZT/I0R50loFRbaf6sk6PGWZxxDyGYnTQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u73tqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:54:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef370f694bso8782856d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 15:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687244; x=1783292044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qaaIg3gvt+W7J5Dpnsp8EdV5SRcVyaxwovZUztMqYmM=;
        b=H/5NAo19PCh+YIAsK/vxsm3MVURdnYziUFSLd5hONDwBVTf/cK7WrLcOTbj387lEhY
         qHyr4qQZJ7h60omvgYmJ49go/v+9dnrScxAKBxL03ZuPS5Px4E1PdHz+v5ZMKuih+Fy5
         LwL62qj1VxK5NTHKBPi98Y8uGlXK05e0A0edLO1fA97O+wiMmNe91XgG5wBr0/fp3prV
         TYXAwf1QPYJeN+1AiNdzfJ7uiheiQfufOn6O4RfIFuW+GXVwgomyJjpa90rfVl7W8HCc
         m+Ma8yaJdKSlBkg2Y8wyVJZ9ZlZy4q9C43LBwue4AavEnPrI6pc8AdjDpwkhhEpVhSHs
         YBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687244; x=1783292044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaaIg3gvt+W7J5Dpnsp8EdV5SRcVyaxwovZUztMqYmM=;
        b=FgnGfzKhvFOzq7wzl9E1+KHdxFinYuGxmBRieHAenyKUkIdAkTZU4LRhVNfbVOSMVG
         d0+dAHzMjZZfIocOrkmhKj6X4i/tOSHoFZNcciwz6r2wpDpiGxFy1wgmcyzz2j34GAzO
         ag8z3OPD8qtiaxMRp2mCdPu2p7Be65FAqPLXdnHRFoAToUe8AvvK2KenNKZHJjNxjtAu
         hEbunQJWKF33tIaTs+4zqMCAtM09gUKhLyIPUg/xxN9C2HEtdBo4Sn1jUNJtnDrC7PO5
         YhW7tidtKbHa9whUIGjIlVeIFj5xY+3g837lzVK5tRMdffqyM1AWOB5KOFF+cn88Goj5
         68ZA==
X-Forwarded-Encrypted: i=1; AFNElJ/df4X9Ff+NyrDLmtOBSk0pDv7GqnObo3yWP7zhcSPaw3xCOimegUoJ8gBb0fUFqFepvJY7EfL0WPwhZ/lb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+mLPrOcHNdvGV6x6suh810R3gwEU7j/shgucqwoX69hntTu1P
	wDHDhIE/Fdh9Ocw1Fn9HJFC5aOz0IwivUADD8ayOp5/xCBpOt1SxWexzhsezCOTDtsd61G7K8tv
	1zO/D0lgTWThwz6hQcDioT5VQx9a1Dna5ACdrLXjKsSoyRey12IVadVbZu0VCemAjYCKu
X-Gm-Gg: AfdE7ckzbJQkLeSvZ6hJ9izfk6qQfYHvPltYjqobWUNSmrISQuslp4S7FAV5osYYee5
	jX1nkRVxlqiRinjELWwRGz0wwNZO7Ar9Utc3A7JkgfLzCWkrQGV1waCggzlS83ZjjYyLyVM/Bs5
	Db70cQ/xtaoMR/0D7vI+wZ1740UCHyBVUxp5VAwdUtZiJGNHRyyZEmGh8oAZm+uoGA0dw9XKZWv
	eBRcYwroypGzDkAsWY3KaBWlgfohTFSDcFEKjoehMFfiVFdHjkQ8++6FEKB9UGwOZ06AghMIHny
	wIydXf9Je4/jJBImZ0YNvv8RxJTkKR+mWeWrbPLJGgdXleTPE+iSQKoj5i7dFMHtBOSSfsXk6wR
	5QOBWuNXBwT9VIZWgZmCPGoNvZ1FoTGr71KV8HoRKJAAxWPKgSJlV2Dek+tRAT/07Xb2bQvcv3w
	FlVGaJPEPLSD2PfedB6IB/VYDD
X-Received: by 2002:a05:620a:414c:b0:92e:51ee:7945 with SMTP id af79cd13be357-92e51ee8ae6mr177015085a.30.1782687244498;
        Sun, 28 Jun 2026 15:54:04 -0700 (PDT)
X-Received: by 2002:a05:620a:414c:b0:92e:51ee:7945 with SMTP id af79cd13be357-92e51ee8ae6mr177010785a.30.1782687243961;
        Sun, 28 Jun 2026 15:54:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69585b6bsm5327111e87.80.2026.06.28.15.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:54:01 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:53:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU
Message-ID: <kz5fw4hqblmumabhooyupyxqmfwadkas57brxs2qxvnbn37v6r@jjrmk5ckqbc7>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-8-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-8-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX0FhHHNw/KhYI
 2PeuTQJMafKrrK8mF6nWYbZqZ3JcPOYiIL96NnRhA9Yn0BnJwGeFzu7peR8e0nadTb8yYxd+6F/
 dRkeOooeCU9rHYD8+j9YOB/661gzoeM=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a41a60d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Gs9I2Bc5OMsOgFIOwOX1hDngaItVgv-o
X-Proofpoint-ORIG-GUID: Gs9I2Bc5OMsOgFIOwOX1hDngaItVgv-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX0ns8U1ln1o8S
 7FfpWdSmL1Ht7bsyb93m7q1kJ8StxubsNwYOUunV+YMVEh/FzsPcOe0cV5RoYUQKxzeE7XxoMEP
 Clzq7zlYCV2s1i5Mdhtmo3RUP0mbxZGWg645T24rIMslZVeGUEb+I66wcdPInT9Bmi0FJUs7+ud
 Z+Fb37tr9oMIz2N3gadbo/ZcOmRUpo/8fW+ICJVfSTJDs+2rE3JeCiPXNNczJUjpbuiKiTO6lZ0
 d2/y/0pt2X0CAMMuqWcPENYChNxUjAVbS1H3PLNBOrvp0NJiJyWoSqWia8QGieVHLbEjCMg0qos
 8Bd2BzO7+auZ9l9zLmQfWxxsjBs4q4y5kIwm2zRcyOmkhvaWFkhdoxJr7eAqoLCgNWgDaT50HWK
 maIKlSRRQDyxej5mWCv3xJ3V9P5mhegv3tln2RsXWDfb7cvZXjxQbiv42kNRMibfAMijU2AEVK2
 /5LusAqRGI9wCY0ylMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280207
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114809-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,qti.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jjrmk5ckqbc7:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 319BD6D5333

On Sun, Jun 28, 2026 at 11:54:01PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra IQS EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

