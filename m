Return-Path: <linux-arm-msm+bounces-111212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UeQeJup4IWo+HAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:08:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA8C64030A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:08:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H8KFaz4v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SX7f0Xyx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111212-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111212-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E67930048DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 13:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4A047D93F;
	Thu,  4 Jun 2026 13:03:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B9247CC73
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 13:03:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780578188; cv=none; b=jDfVJ6sQL2dEXhepywbLwo1PqX7kaywqVPICGAsF5uxIOsWZX3Z9sKf3RQzdzaNviRxErE8q7tWPCMRrk12BUXwJ6s5J0t108XydkISCqNFy3uXkZeDtMH2EBmfnDe/oDdOJAZLn/h6BSOij77wl8VK9yKc0KHXrTGWpyVBypmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780578188; c=relaxed/simple;
	bh=aCZ+AS8Mf9BxnQNj87m/hj2teLLK19zwB5HLLG8xeL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIGK1sLffVafc8e8Ys4htPAIgs5QpiksAzqVFfpAuppQrATIGxIPRESKQC5MJWxJh6hnn3ootYs0ofrvUNIrJno53vYObOCJZMvnb+QoWpWY8IsnBnHpQCfJ4vHnf9Lzpc56kgQI3gtzvndX6qrItwmRSOKdQRWGiJinJ9Lj2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8KFaz4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SX7f0Xyx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548KlgE140445
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JfgOto66Y3BLWLac1kUqpihI
	4RTvBJSSkEWoerZ0cj0=; b=H8KFaz4vgr9C3gNzdMlBYO6OFNtIQCeo1LdaNXs/
	YpfqyoP1Aa0ccSgUiwDXvz0HasZVd8x49Hp/pU6gksfHztq/6Wy3SKKixJTHzMtX
	3H6SmVJmEDX/HT4mdzSaj/+GXrz97sV0TjpxBSu1IjBnfEEisk/puCehARlyz8Ii
	tquZx0zMSUtxv1yU6U8NbBjtAPYUH4Zs/xHsTtMR1llEfTTIKRQuayosNPeVyuI+
	cmoNGQr8Kw4RmphkdGO4DLpS3cXrGD4iNN6BxL4TnhLJId7KslM7EV0TSYddCGxi
	pa4BGp9+7X3brrSKDNw7waXFKI4KS5t+xzjkAZnPNif/rw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyenaeg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:03:06 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6fd5f007eso1267863a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780578185; x=1781182985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JfgOto66Y3BLWLac1kUqpihI4RTvBJSSkEWoerZ0cj0=;
        b=SX7f0Xyx96tWTyEjzgz4ar1YwWA4CoUei5P/OdIbb23tJT26g5pfY0HP7AdNQraWnE
         GiZvl9km11+Q0yiH+PT2hRJC7jbCXBh4S6tUA4ukNe8sWHW8Mbp5naZPHfXei0YtmDx9
         Lsw15/diyaRw1jhEg6eqAMOz1cwJTXlwwXq385gOHR07I+/3VXJiAbIyCQXe8wVo7QSt
         Q4YnCT82Q0rFKJLbB/XXpCu6FWdbG+5W6MYQxfrrnDNyBHq2WaqVcrofjOBojDrKdzm7
         TY8vtHS/US39PZzHJ8vnlqr2TwILkNFAd8Na+eiPvGOXhQBbwyob9El35ajhp1NfKARH
         /0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578185; x=1781182985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfgOto66Y3BLWLac1kUqpihI4RTvBJSSkEWoerZ0cj0=;
        b=RUgFl/Ft8CM5gKGYrE/LM8yHD8lFSPtXfo9iYcQypyb8enlYdrrqAih9+W2jU2JjuZ
         3d3SsmuFWQ7hLQlRRnNSSlsrkiZP2M0nsc0wS/pZkeKn2OhOV6Zjfup23ltBqSd+9IOp
         Pt3lGsVnbNJ20vRiOUhXqQdFbRtm9LE06ZZ3d8dt81MT+zgHstVjk34a5KtQfJEETVa2
         jwV65TFPGfTE/yFePnKs7sE6P2fE4rmMq63MMvtvItWiLfmS/qs1pL9694HvKDL9cl/R
         JkrPayRP6g5rcfcllHEiT876Z94GqAU4KkQCQYeEWkrY6SoTPDRI0ejn1JpZ8m5Fm0iN
         OqUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3GyqpqbX9dwzWmUqdB2Au4E1WzwR2RK4C5hGeE9gBUQgZEi/ibSOvcHD8Rav++xfxV/ThaHD895kGIiod@vger.kernel.org
X-Gm-Message-State: AOJu0YzDVEOrCZvJvVMFof2AyNIAMgF8LoE24Ae3xDnEs6Rpepl6mH+N
	TUeOhHEQzq85q4nfo+TPg+VxMjlAndzwFHxVquEXeVJN2/qGNLMlhelPlkqucok66Q+xe/N7sth
	ZIPi0o4qGN6qt/8qTESDN0fYmAK/9qCyUD4kOCiEn3l7+atadJy9XKenT57xPTw/ttQVB
X-Gm-Gg: Acq92OF0pBSv2ILqoxbyRF9rQpya7sEmdlE3zXSh9PpE5oRrbMdM6cNwjmY7kP5600t
	d5iVXgUldn6L7KDXsdkA+qsPvNb076gXmtHe4hf9g6VEDcaQuIkp6j9Y9gY/HNqAkc0LK3EdJKo
	GW2Hb+WA8nxqRGgIxzaqkKpiyschQzl1RAOMfI4zCf/E4fTHUp25F7xpaYSU+1VCBtwmOaM5drn
	erUlSXExUG5NNTgWou+lJ4d6uxK9jb7+/F+rUNP0CxFntgPNsuiqmh59x2odHkWCensLSZtKTC0
	Jr4zrTaWzf1ND0tYu1XXIYR3LMrOvP2aO5PaVbqcRJMtqCS6a9+94t9BZE72wj7QqYQI/4PoV2S
	uBg+XfQy9xIaUl4AEnCAKDPWWZAn+DJI7eEiVTJ2TYR6iTbREgMtxsfpLvnmlKe52tDEYcEoGPW
	oxJ621LDgUbS2/6NxpBsw+vDJFfbiw3kGa/dUHbnsd0j0xkg==
X-Received: by 2002:a05:6830:1e3a:b0:7e6:c8e:89f3 with SMTP id 46e09a7af769-7e6f9244026mr1380361a34.6.1780578185137;
        Thu, 04 Jun 2026 06:03:05 -0700 (PDT)
X-Received: by 2002:a05:6830:1e3a:b0:7e6:c8e:89f3 with SMTP id 46e09a7af769-7e6f9244026mr1380291a34.6.1780578184514;
        Thu, 04 Jun 2026 06:03:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5034sm16257901fa.29.2026.06.04.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:03:03 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:03:00 +0300
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
Subject: Re: [PATCH v2 0/3] Subject: [PATCH 0/3] Add Shikra (QCM2390) display
 support
Message-ID: <cvszjw5psd6cenek7ujczjkmcvrzhtckknrifb4pphxotca75k@irvape42pzzn>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a21778a cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=FTaq_hUnWkcAyd37DvkA:9
 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: 48FyDZlAZIkPJkrK7fuhBp1XOt5IO6YG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNyBTYWx0ZWRfX9gGS25tzD3+n
 mVKX7CLIls2cM+NARiIbdJodz8zDT8kWdW5gzqF/BJJ0Dul/lEJ4Y26NvSta8AZhaABCJIIRNXP
 GRLKriORhGJe9sktKN3OPHW7kiTgkzApzZgWSPMFgG2pOLCHjWZnyB4T+vTy4HopIO6IgjdjJPp
 mi+r3Mj0GBvSkzS7jWX/MBR3St3uQRc4ZaJNTSgoZbDtOQZQ2sgGjUtF6QhYotNLjNMNilrOziF
 TKxXxh9RAedpMqtVBHWZ7RO7UmmOhwsjNprfaLCnkp3lHva9lmP8nQNJdowKCw2zGaUxcu/WZdN
 +hq9BkV3mdY0Z8L2+mhugiyjR+dOHxJGpCCnRMU9x8iX2zAflbYooXSiKWtClGfhtbfeAmHL83X
 3npMldSxhz3Z98l2bE2PWfVlNEWiNOW+s1xixwU0fIee39HgM1LRJB30GpCp3VgOC/+MVN3NAWM
 fKjHjmJ76PQTV88fqpQ==
X-Proofpoint-GUID: 48FyDZlAZIkPJkrK7fuhBp1XOt5IO6YG
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111212-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFA8C64030A

On Thu, Jun 04, 2026 at 06:00:46PM +0530, Nabige Aala wrote:

[PATCH v2 0/3] Subject: [PATCH 0/3] Add Shikra (QCM2390) display support 

The subject line is wrong. Please use the tools properly (I'd strongly
recommend using the b4 tool).

-- 
With best wishes
Dmitry

