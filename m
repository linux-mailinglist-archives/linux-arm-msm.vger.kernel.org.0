Return-Path: <linux-arm-msm+bounces-116913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wLsaBh3IS2qcaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:22:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC4712812
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:22:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="IF/ut3ah";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="I/8n8/gw";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116913-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116913-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FC8830568A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8E235F184;
	Mon,  6 Jul 2026 15:00:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B507357CEB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:00:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350042; cv=none; b=LXL7jH615IOQKrHbVFAG8710RCOwUYm74r6PqA5KmftW8+fLy1KBOV+hwfP6jlOHYJLdulwIn7Zcj6igfmxqXzRE4zh652EyOWaymW65Jb01xiZE0UXvBUe24olqlInm22XdxmZn1RlcrFpPN43z5Sz0VXvx1aDLGEzOWIWGaPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350042; c=relaxed/simple;
	bh=CippwiaLchZkBp17ScVtGD5Koyw5ydwIvHSD5Nc6vxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TU7BNWy1lCr2+eqg/jYPVudOpeud6xi92YjeuXiYDoYUuj73AUBfXOnkJ5fAv761VUIlI8ZkvolI2D+Jt/D1ZH5BqGwf7XJGxbE+visFuiFTO67QQh7VRdf3Bp2iNC7lSpWIE5bQbTu9Y/MG3GEvTKSsmep1NqSecwM6EZjotlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IF/ut3ah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/8n8/gw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEKIv616679
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bn9/G/DyutefUg00Snqy1zzU
	39NkJvMT4AS5q8icaWo=; b=IF/ut3ahI8X40Wfyw7vMydD/20TuCbIZ19Z/0afh
	KTEahq8IFTkDK9tb76zcwC0Q9wNWvlKTH43UBxpNFSa/Q4XjVBXMEK7dcrVQhle3
	4FHEE50mrQk5Vo3uszoyFv9/vb0qHu75pm+FycOu6SSkqLMmDq2PGd4AyrBxHklE
	GVS30PqdnWrDeuyMbWZ7a9c8/QrIa6G8QZRy7CMcZ1jeG5X/3LTGoIcwZhlrbFB0
	7kEjJ3pdpmlUl/sXrkEQ4XshqJ3P0iBcJCnGnNRJr0d/qAnLzJatdHXrNBgoo3J2
	pt8CzE8jBlwn08YYTIQWXp9vHfE+KP7tp9sgX5A4gAX8ow==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxsy5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:00:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737cd7b76ceso466513137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783350039; x=1783954839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bn9/G/DyutefUg00Snqy1zzU39NkJvMT4AS5q8icaWo=;
        b=I/8n8/gwlqk055GRGT0zCgd/Ct7dOBM6kkrNYLMXpxmFD4+mbejhW/i0eZpm/x/mha
         wUqbvf7gwwHZSBDJobObYXkeXkDyYIVl8GYPR/UkaSk1imQavC2yaq3D6xsUWKmWrBvd
         wxkO3bC1vWbMOCJ5QrBkMtKVYB7Gcnc4Ud4C6/FRVRh4rZjI5dVYH4fVLITGMKTMI/t6
         9EMFjM9F36oeg6Z9OBy9DhcW8P//S0xoW84DlKGYKJI6VMbJbWCfMMWYno9juVy7+7hE
         TSJJ0p0TzSoANpT3hVZG4qMMT+6WBhA62O1uQgu03lw+/NbW4F3isIc9zeKdKEvEbmok
         f4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350039; x=1783954839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bn9/G/DyutefUg00Snqy1zzU39NkJvMT4AS5q8icaWo=;
        b=AhZWnJ+cOoHqYcIuLFjgvNKu5GKpTCQ8du2E83dRz0MaY7dS53MW8CKoP8RZ4UU1C+
         GYebPhXRvp3Ore71GTOECKalrTssKlOw9B09ZT33gEeDslXqiN7SPb9+kEbr81jm9dJb
         +TtzQo0XZH4j/YOoLUBV7OSbbL1BT/Gsnn4kf4DNWldAlYbpwyHAHTMLiZKMWQGx0hnW
         5L2goWo6iV7ilEwfwSGwZo7Lp57fGC2NTYLk3ma3Z4Hj5aOezJjsb0bWnaNbJF5yzkSF
         fZrRlh8HHesgPyES2pdRfLQBHyRfNeIZ7mxs8F411IZvdQP5+FqzQ90JigKqtG0CC8dt
         z0ZA==
X-Forwarded-Encrypted: i=1; AHgh+RoS6PIMUnO7c32Es8urTN2tDvVSn+97IKQyc0VyVuxOTGiupZ49lllFsMGMFFvlx0cyBx7qs5MknhU35MRF@vger.kernel.org
X-Gm-Message-State: AOJu0YyChn5xPuHrfuwLmuNWFPbFwEVDhRy64p8JeJrrqQtvVTAPFET/
	krP7CSG7drpJYoI/3N7U64i/lT0AP0eYtuKANh1/S5ZCxxZBBBVylUwR/fXQADv2+z87H8rr1mH
	1vb872XYGaJO00xSciSu7Z2FRSMDm3kaiOLdM4/ynJ3jLYOuYqQF+OWx/AwLjY1Hffe39
X-Gm-Gg: AfdE7cnpHrOZ3hD6cJccBGLQyN/l7VtHe9Www+fuR+iKxTqLzn8+kZ1d24jOx4D+Mgf
	WSEkY32VZyF8Pq6kTiO7O0H4umG5RqUIBpTNW/krqat81Y7n3/iviJDlPfIKN284za8P71/Etsa
	Nne1NSix9dNiunDehHzgbfFHRTCOkFNIxGvIIEH7FDH2x5Xzcd0PDX/QgzaRawSVcf49gPnbq0L
	E119jGQWzNTBy3Y8uSZ6zNa+PjPXEJBrWaamsl7KltyeCHPVNDsd6EyJYS1p/DrrgQnavUhzmc0
	H1iXsp17wap1vJyqVkLiwVcsR/h8BsurmZidGBOlKeF/ZpF1Z/+D2bEF88PcbjO0igJACyQD/vw
	l8JpweYjPMksqScgcjrvbsqw5YQErsG78gp7fSbUH175M5ObBxxCpe9U08N7Wz0nY9aqfA6smr+
	AopY/aj0KJm7I769qNiyftLkNx
X-Received: by 2002:a05:6102:5ccc:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-744b7bb690amr470655137.13.1783350039006;
        Mon, 06 Jul 2026 08:00:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccc:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-744b7bb690amr470598137.13.1783350038304;
        Mon, 06 Jul 2026 08:00:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c5c11sm2964033e87.77.2026.07.06.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:00:36 -0700 (PDT)
Date: Mon, 6 Jul 2026 18:00:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 01/13] iommu: arm-smmu-qcom: Configure lpac device
 with split address space
Message-ID: <5vfdbrk4bu77e7wgutp4h3ilbpjhcxxnwemqiufmtiwoffp4sl@oaonwwouw4qm>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-1-01d50c3e0c99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-1-01d50c3e0c99@gmail.com>
X-Proofpoint-ORIG-GUID: GmWFp6GHcohfKGjw1TIHS7eqTPXtJXH5
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bc318 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=lhguFYgXd42DN747EnMA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1MiBTYWx0ZWRfX9KSyrqvBNkjh
 sHhGdW9UxfPDLmpZXymFBQJQpUaWIRs6juf8PqKy3/qsLT/XWvtwtuxL1PAQl7gCt8heRe0i1Vk
 zwd0VptnST9TT2Ppdn0CZKEif+IA3I8=
X-Proofpoint-GUID: GmWFp6GHcohfKGjw1TIHS7eqTPXtJXH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1MiBTYWx0ZWRfX7xU9lGAa4KHw
 GVkjAgL3irwf6xnYq/Ce+/g1V1d6SWBkRy1HghirzJOku3uDXsYE6uOIUm3PZYEkHQuy8rH/zcn
 V6pJp24UGNW4JDBNjvUxrcOixYVNCI2wegpM//l3BvUZK9pJh8hBoOiAwerPwMPxv605hgl3YM8
 xoVV11y8xKVJ0Qm14UyWReWaPU8Ut4RBaNi3KBTu/eA0COHZoHCvVkYokF+paZw80YM9RHofc5K
 JYbfyJjpEQR/4H//wkymBrRWDLncDq+KQGcFcQaZmwn8q3GmS095xfw3VD3+yrabWGzOZc29AQb
 QMD3TMQoXOmgBarhMF2C7Gmub9zxAMtH16jm6/jc9nZskqZV/zR+5bwLJX5hWb0sT5/RNzRs02P
 dz9KL/WWTWPBpt8nXIhsX6mV+QgzbbVk2mkbXqatHrEsr8VyTiJ7Vkds2eTymh5/zsqUfPaMTOw
 yfoBqaLEifymTLdRS7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116913-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:anna.maniscalco2000@gmail.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:annamaniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFDC4712812

On Sun, Jul 05, 2026 at 09:13:35PM +0200, Anna Maniscalco wrote:
> We want the context bank used by LPAC to use split address space just
> like GFX.

Why?

> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

