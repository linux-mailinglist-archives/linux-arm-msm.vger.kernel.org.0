Return-Path: <linux-arm-msm+bounces-95063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB7VAGeapmnfRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:23:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFDC1EAB98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 096AA308C2D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2058F3822AF;
	Tue,  3 Mar 2026 08:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2GpSR/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVIDzOgI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2440A3822B7
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525979; cv=none; b=MvUcKushT+IKdLtBGfNoBexkmr5kW7nyQZvb4KqJSxqTUY7+d5I47OZH1dWQ8t4x4B4fV5ypqk6pRYQ/Vsb5QH+8tzZsXRsfHeeztWXtUVM08ZmQakHQBII5fLpvokKo2AK7EUUHw3n37w0Cnjte/hY+XmorhGZf4o+Fgk7Z5RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525979; c=relaxed/simple;
	bh=3kTC24SI6aT+LaTYEQI2ode7SdCC6mqXZ2wYGz8MF20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzbkpoEoOSWPhoGcEES4lyoUlZmHQ1BCyEhxHYEEN1CH+oMjQAm/Ja/463Se9CbR/OPXpmryrL9aXwcibEwPIPtreF8hDHX2CQVUwAUuyv00+vt8NXM+jbSDvfxPA72DCwmHQ6vdcE9taP04MkjpGKbdLo1sMeCkH6OMvWRD+RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2GpSR/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVIDzOgI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6237h6IK2048742
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4N213Yy/tErC/qPxFB4Ckztq
	tBqutFx9DF1gTLrNKsE=; b=A2GpSR/YSU35p94ku9bB8xdmQIUe8J9wM74m1FoJ
	Ab8sgMbTptb3ppeypULLoSNUO+hqRKRH9/5XfpTbcSp8FfTvAZCONmN82DXRt9Vc
	LZrmJPmF+cBXeXl9GOQNz3N0GztUcvmv40l3vzajboP4X9L7CRxRiIlhqymXS8Lm
	iIgZAi65R4c8ayKRhNz4B10ZB4cC8kBzncxjbT9n21STliZ0ORmPVxYcWbQhmBAK
	WdB8rjk+f5mwzEcEDk9Gefyu8lRqLrRHm0vShUWUPnnKoS4/aRdq5e29XbNo82ML
	aJ02rY9h4XiShDY+N7xJlFqV04qoYEGMqMJ7rC5gKRw37Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfu7x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:19:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70fadd9a3so5066470585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772525973; x=1773130773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4N213Yy/tErC/qPxFB4CkztqtBqutFx9DF1gTLrNKsE=;
        b=iVIDzOgI9x2VTPlZbZircit0VSXJ/CKaQrxa3ZmTYgqE5jwBFsFXnD8L8WECAHDs5g
         7i8xItu8+tKcL0o/UkHw6F89XDT2qOWNQr1elO9x7aYG/15dsKeDe+3hWWhFQWvptF4d
         aPPQYcfftspbTcqqoq+zE8IoSWROar7t0I55zaRUGQLqrbrX7EIev1Ea2HSnh7bjNst+
         8Cs3t+c9bsHyzwhwWMpqLFRgmM3cJsmUXyEDixt191eeC9SZ3ptGvh+lO3yIiAGB840E
         5x+mYrNe33JcyXVXIf2s9V+leu7UXEFpHc3BfeZm2twUMT1AhxbLzExtUJqpr+DNddBO
         E+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525973; x=1773130773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4N213Yy/tErC/qPxFB4CkztqtBqutFx9DF1gTLrNKsE=;
        b=AMg2GjvUVp/WdnYsg5mbc6akQc1slilef47FnatdbASx6QdhpWtjePKHkQoYnkSw/2
         j5I7LWc3GypRaDNTuPGlKW+cxiP7cY29oe3It64Xy/Hxt8mLfr4bL6PYw3o0lxkn1APz
         Ve7awjfkf5JrnNOlaX/iBhSumCgOu7OdojSOx+IYDZ1oMzwvFTVMbbBRUgIxmIlsRMp8
         5nVJ2fxHkQLq8g19joG30NDIPzJxBaGLcH3GOYxJAFbt3bcOtv2NgVJMtioElXhJQyTn
         aVZJlPdUv2v+YyQvl2yYoE9P85rnq2DlzjRUtLkCUYwhHrLtpX4p1kMhYB7ypfvZcy6f
         qv9w==
X-Forwarded-Encrypted: i=1; AJvYcCXALnuiZMjMy2nQ9pJdbzDA1a1tHe+9CFYBnW+0ive4t2k10/gsrAcTWEYzU/vcSw+PBVVkj29zrVlTDLIQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzPHBfi5kJtzxzn5gbcEeM/keN9JHY8/r3Jn/zdjIIim9DoHi2B
	NRMS1G6DAYPdifEkPY26rrlEJ4y6kMM+6PbXcIaukSTxKhdwlUD3yFeA/hbFWutNpCbMDbnYf7r
	S3J+1HX5Cle4wRc1ahDVBBUV/BIEeUgCIK9esC1CcBn1ew7X4IrelX+AwB4g2qV4Agm6j
X-Gm-Gg: ATEYQzyiZTIDVNzjuWmuumYuF0si1/rN8ZGIZT62xoAMDlDy5sqGf4KHOjrdtuTatm9
	aLrzjyL1NoRcUEHCAtLla2yxetJYhE3tkRF0Zwfd6th7vFUzrsc+dtDh1qmuJYt+kVYOYTiGOfI
	CA7o+4A3XkQppxeULWl+jqqvgXgZkcj2a1W3ix9vsxGdChhhuNfH/fuuHjSA9vtgw2BGhGKoGfr
	gHGxD6+ixDRvYDpwfTuVZDphIrf/lr1o+syXroozgvGzD2eBqzxgtNeQ8GP47aVPidSMBZEvE6/
	QSKNUcWynzQLDQhf5rdiSHm8qJY8vwVWkhCicj+j1NejZQ3iVg3qe4aeIBSsMuqJw3mohXb+red
	RcfoZcXnmh3oDFmBm3kXTsUsO55I2Bi9frxqX
X-Received: by 2002:a05:620a:4004:b0:8cb:7ad9:65a9 with SMTP id af79cd13be357-8cbc8e79948mr1962844585a.59.1772525973143;
        Tue, 03 Mar 2026 00:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8cb:7ad9:65a9 with SMTP id af79cd13be357-8cbc8e79948mr1962840785a.59.1772525972438;
        Tue, 03 Mar 2026 00:19:32 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm486645545e9.7.2026.03.03.00.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:19:31 -0800 (PST)
Date: Tue, 3 Mar 2026 10:19:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: display: msm: Fix reg ranges for DP
 example node
Message-ID: <tzzwpymjwwqem7zph7ecjvwsfhmylvgvgel7jpr7zrfcdaevzi@aggighjasjac>
References: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
 <20260302-glymur-fix-dp-bindings-reg-clocks-v3-2-8fe49ac1f556@oss.qualcomm.com>
 <20260303-resilient-bouncy-anteater-b4cf0f@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-resilient-bouncy-anteater-b4cf0f@quoll>
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a69995 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=hwl0D8rbNs11RpkTeDcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 3dxikyaGMde7fOQ16vdrgqF4xIeITj3u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA1OSBTYWx0ZWRfX8AFe1trXBaHZ
 kVHUBFHPT6aa3TXQAe3prn3XVaguusi3JZGpvYQCzz26GF53y1V2V/enXVVfM3nbyur3KID0e0S
 bXbysOaH1Fpj1CDqRYtecQZTi3pv1OZGK4aR/tXfnugjV8chODYFsIUletDhyEYYwDAINgax8ks
 FmrAmkh5J+L5+loBgw/0Hln0fA6ZhyMyaEhc0PT4PvDv6pLdaaMLcqY5rQzCbJaERtexzx9gPQk
 Zmmgy7LBiHRQ+ihtt3LcMaTWQn6SJrm5rC4KV5pGsaKEj1hdcDXIulb0vhnxVhQoutZhu2Q4qMU
 nvLZVYCCUCI81S18qgityxJARH3PBrvK2BRsi+xgAE+d7Ie+37zfzyXp7Dk++BiHqrMugbb7ohq
 12cUV50JbzJHvoaex2mKEKmIAxFn6VpodtJ5iLUAfNeszpO4T4JgguOVjC4iUIIzuAO8AsJeOs5
 WIYtK8hRKe+uo4oBfjw==
X-Proofpoint-GUID: 3dxikyaGMde7fOQ16vdrgqF4xIeITj3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030059
X-Rspamd-Queue-Id: 9AFDC1EAB98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95063-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-03 07:31:50, Krzysztof Kozlowski wrote:
> On Mon, Mar 02, 2026 at 11:58:36AM +0200, Abel Vesa wrote:
> > Add the missing p2, p3, mst2link and mst3link register blocks to the DP
> > example node. This is now necessary since the DP schema has been fixed.
> > 
> > While at it, use actual addresses from the first controller instead of
> 
> As pointed out by bot, this must stay bisectable, thus should be
> squashed. You can keep two Fixes tags, if both are applicable.

Will do exactly that.

Thanks for reviewing!

