Return-Path: <linux-arm-msm+bounces-118107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QoncHuL4T2pRrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:39:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C020E735144
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:39:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f51JX49F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JZh0bVKg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118107-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118107-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C6C73005A8B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD7A3BA241;
	Thu,  9 Jul 2026 19:39:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A93BCD0D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 19:39:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625949; cv=none; b=pLaZUT6P3AW5A0rzT1tz6ppg2ZuexHipDHyivmSOYCs8e18xRH48iF6kJVUstYrn4pr1iALl8cf5QH7/aAkweezdWvVU3yCxw0sQGMtJq44iBB8bqn/QRsnrVdmXLdCbnw9y4U4pjL9zvjusWcNJqnOvXJ7JV6F8Ob7b94Btf1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625949; c=relaxed/simple;
	bh=QD9mJPs+t+9s56rb5xaB5rKMWigU4OS46sDGTzukNhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMn/UKb3+FTKqlnSJS/lafgltNKMrKxcPEhvjgtZTUOwmCRIbF8ZlK7Jvw9EY+qH+6D3fT3eijkMUPLqD4ma7960xYzUA8dKAKsaNlmMzdrbjUZXYj50EuloesNzQxB+HGGfzsDwk/tNfJY7OyT9XrbrNW3h9I9r7mKpmSdy6wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f51JX49F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZh0bVKg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXNBt2387402
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 19:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXtkLmMeqA5Txfu3sYVMsQEq
	969mvFVnJZMw0O2S5F4=; b=f51JX49FycsxSY94vb3shNav9rc4rU9buD/v8EbY
	gVT3Lzsu85teQtDP4CIdy4rdzXRUPg42PS7hEJP4b0FsK6YCzMl1q46AneSH5TZh
	KiTZVG/rQcrE/J44s0nXXL/PfqyCp9d9o8YRwns0vDcsmgnm0IaLH+DDznbFgCyr
	iU3M7WhK1e4+S6M6odp6pB0/bZCh0rGdAAEyA+rajwDiFSXUBTR/F8zsUQ4fyqgN
	Xd57d61SwMw2Xn/A3UrfTytP5EsFkWf1198r7R2i86Y97z6boIBCgQdzRf1jWfwY
	h3EwAl+O3tTATUnjedMXV0VdoK2YMibTyYBQkNrldiFmFQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydvppv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:39:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e806f474so43732137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625947; x=1784230747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXtkLmMeqA5Txfu3sYVMsQEq969mvFVnJZMw0O2S5F4=;
        b=JZh0bVKgOEI3u0b0w055ufllEhkU94/wWKI6gpYU1QjVxa3EMcmrTk84NeUoCXVR/N
         0tAK29bzu0crlN+XpMVkEp8map5ghzOrjG2vGMuDmjP216pBw6kf1B94NmS92sjTk7uW
         j4bOSe0g77P7qxlQbTkzwiARemWqpEJ+Ioh7m7r5d4Qhk33/48lKzMC2MdW6/5MfTomf
         T6sFqDzpW90GxUSwTPnNV0RJcDUNaFLnyqOLPNlnvtm+i1xV6RAl3a8esMVoq5jD5KRD
         pJf+vltpvKJvQ/JbOWHbYAXSP5EjuzExiy2XvOxI60Ny94UBkwFUnSe91mFvLQ6Kp19w
         uzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625947; x=1784230747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXtkLmMeqA5Txfu3sYVMsQEq969mvFVnJZMw0O2S5F4=;
        b=Rnoi/MPitA2DZt1bzUrlOorVBZbroaqyMQe7FHVo8S6qsLUyC+WSeBc20+0/by0fXb
         nYJA1aCBbkFABk+N3qCA7PcXx1NVMtl3HQF5TF0dl5TAROasKQbfKuMY9VihttOSJdh9
         zu5+iIDddPMZviKV8Tu5CZOKT1dGh2g4vosoOIemOi2q03KSnCZ+HuyPWgiq9tRCs3fh
         3J/PA5psectvuZNREMyy62qBN5S+b7dWKN3Wj0Q2l5gLtkg9KxnCZCujgXSwkNqEijXk
         Ju7qKlwL3XQbGddTPq8Mxy1rln21vH8NsB0V1fpu4G8VAQJwsYRTf04ws5HBzngDSOXK
         EbJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAof+Ort5NdP0E+yqy7Sm1YhaMG+9rF6nOMWefI2K8JoWkgbFhQDuDSIL+4ttEhhlu3za0F4jRIJbFVpOS@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJjlkeYb00Jv8StI8DU7+lOycp1qsXDDwIEJw6EXpPcqRYamR
	QcA/7NGyOCXMzmwOaZZx1a1IBoyU4oAJILh6NlyOCG5r/bHf8LoHUkkDgUB93knWxOyfPBNmeV0
	rf/Kv/3BAXW0OsVL26Yk17B/O6BmekhOkgbSIGv+6JDZbd8lh/aOQvaNoipYYEt0/Gu+K
X-Gm-Gg: AfdE7cnk2YXMNzRzVSZpzJo+M50HGeNgtPYbkwPpbRnRawkKVwXa3Iv2vPm8W3Aes+5
	KOvWMpwLJbJHqCCWlZ4tl4+Zg5qq/YttuVLvL0rh9RkjXXua5656mBNbyQFKoqNihySmGbVHRIM
	z5vTqsA9kdX6vf24/5iQr/jKPGjP/VDdTozXDMrM8EWsWfBrmVpF/ToWdNR1Yy3JJ8S57vKRclh
	ICIKp09XOGmQIXGNbL9kUdJrLPeMYAL2TVdgkIsnviWoQRAbCyDKse5ckjk4w4JYr00BukI4JOC
	sRZUeG5PXUQ83zenz7a2IxqRz2ET/eim2rcS6t4oiGopdcDLtHx6JkNuGpovThr3oOR4+YB7CMC
	35bZjo8cWKbrLCHWn6nb3x5zUd7iYswgTR4+DPvIlQmDwRRjE3Pb4ODGBF40kblyX8JGHts62lx
	XVupQkTSJXt+asHReFmEUCSIhW
X-Received: by 2002:a05:6102:1490:b0:631:af51:7d8e with SMTP id ada2fe7eead31-744e00d15demr5013499137.17.1783625946391;
        Thu, 09 Jul 2026 12:39:06 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:631:af51:7d8e with SMTP id ada2fe7eead31-744e00d15demr5013479137.17.1783625945914;
        Thu, 09 Jul 2026 12:39:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b13407sm5148981fa.12.2026.07.09.12.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:39:03 -0700 (PDT)
Date: Thu, 9 Jul 2026 22:39:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
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
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <wtun2cfukyzxlsfiz2izsejd33k4jpapwqa3uqih5drcsrkff5@e6llkke5dayw>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
 <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NSBTYWx0ZWRfX+mnAzQwym69V
 inAQ/04kECiAsdWjuRWXqHQPI3bfllusyxLQIk02zWEVn5TQoKEWTMbQeKIR8o2JNtVp2o4KkED
 0OO3WhEoXn0eszr0jD0BhR7ms6faB/g=
X-Proofpoint-ORIG-GUID: qU_yyYebIKleNO0fICYC4z4oNWPdfpx1
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4ff8db cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=9jRdOu3wAAAA:8 a=KUW68C9JwZgBSL_lDhwA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-GUID: qU_yyYebIKleNO0fICYC4z4oNWPdfpx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NSBTYWx0ZWRfX4AF3/QsInfFZ
 mAu0B8d2nyF/ungXZu7uWc7R7RuvTBAqZ9NzhB294zB47FWQqaA8kVeAASkpFvARn4j9guuu+Q4
 9zT609rXJMIvge9WUN5sgoCr2aMPZVIGIaSDMkWDASdYUiG9ZxXQh3aETMX83BrBhviwYiFy6e4
 3ObFwnta0KW+t8biCLs1RCh2QMFHGm2gsDmrWBZ6pZvjZziBvPTzBqO1TEqG3ifUEPtVm6u8r3k
 r/Rwx640Q+DjET1mMDQKWqKasFkPZTkNbUOr4XiKLQA27xezbKFJHxcBWflGrBgSQHYhHw/2JBP
 E7PZkbxnSslLp2H853eRpPNmropzQhwLCB6WwIOqu3xvshwJn2bWFi708z2L3N/lAkRtYPJWpCV
 swku9rxpAppiGzl206IY+Glfvtf3Dj1Y1DBNAWSGEeK7QyGgNnigkO430m/2yyTCp6GegllI7Ry
 vI+jYe9eBhz2KZi+7hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118107-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:anna.maniscalco2000@gmail.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:annamaniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,somainline.org,ffwll.ch,linux.intel.com,suse.de,lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: C020E735144

On Thu, Jul 09, 2026 at 05:54:23PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
> > On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> > > On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> > >> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> > >>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> > >>>> In order to associate the SID used by LPAC to it's own domain and
> > >>>> context bank we need a separate node on the DTS.
> > >>> Can we use iommu-map instead of adding a new device using the same
> > >>> addresses? You provide zero explanations, but it seems like you are
> > >>> trying to separate a part of the GPU into a separate device, but it's
> > >>> unnecessary.
> > >>
> > >> What I was trying to say is that we need to map sid0 and sid1 to different
> > >> context banks.
> > >>
> > >> From what I recall, so long as we use the same dt node, the iommu drivert
> > >> provides no way of doing this.
> > >>
> > >> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> > >> and secure.
> > >>
> > >> The address on the lpac device doesn't really matter. I have very limted
> > >> knowledge of DTSs but I think we could just leave it out altogether?
> > > 
> > > I think, you were poined to the Glymur Iris patches. Another option is
> > > the QDA driver being submitted too. Both ot them use iommu-map to
> > > describe the same usecase - a set of SIDs which are used by the device
> > > but which should not be a part of the defaut set. With it in place you
> > > don't need to have separate qcom,lpac devices, no additional properties,
> > > etc. 
> > > 
> > > I'd recommend following the same approach.
> > 
> > iiuc, the conclusion in this recent thread is to use child nodes for a
> > similar case:
> > https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/
> 
> Let me check internally.

After a brief discussion: it can be either, depending on what suites
better (and if you can persuade DMA / IOMMU maintainers to let one extra
bus or not).

-- 
With best wishes
Dmitry

