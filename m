Return-Path: <linux-arm-msm+bounces-111225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9dnHHeyaIWoeJwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 17:34:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A4364179A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 17:34:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="cA Q8nRe";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P6ZeNdxD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111225-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111225-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BBA430755C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 15:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D440E32B119;
	Thu,  4 Jun 2026 15:13:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A175325490
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 15:13:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586031; cv=pass; b=cmq5rgpS3v1lrA4AYLg5V+llMS7U0owE5pSC3o9KthTCkrw2T90qtbgPqfjRnkRahPpLLK2vfWSaQMo4N1D0Gy0RhvT859OZcyOwLSdKdrQTkyOnmeRoXNv8EGEk/WYddPI9+nq952Ax+OWc/TI1V5/b3JTLSjGOrsYEw7e7oUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586031; c=relaxed/simple;
	bh=eJ4qQZliHJ2fOuXvYZn96rGr9sZtM4wEG+Otmquj8D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/7iN2j/fnMWJU1dOuJKIJyPf6rljmys9p2zTFtTqCI9A47Xs2jlAIWk8lMAjTRn/CUm3G3RxFQcYG8+f83IKw9WPfKA0mXj2ExRQn9VLeMZE1b7XZhVTj3O9W/EZmE927MXRGLFTwkqyYnSU6Isn4FmEh+5DlyHPgdVOMMaVJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAQ8nRem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6ZeNdxD; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BJojl944404
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 15:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4my79OSMQYPXhU2YUseQMtgxKn07AEG/1T3jHV6k98Y=; b=cA
	Q8nRemcWM1cs9R4fXnIyTAAMiK3S3VySEnx2ab2jHV+Y2+JPMDuLfcKVsugBD6J7
	yScjDxdDvrhuz77j2XQWlOGoyCqMyk7STeUHcPG+zWfw4vVYClEN08Ttqp0J7cxX
	ZhoaSmnTkAsEVjmZSPeMb+69Ft55fd8q6xDQw5Z99VSc+H3KNOzkIqfYuekKDeQQ
	vr6Fn9CMFYma2+Ub+wVyrD41VTVM1dW3h/aOetrf57WQzqrjDu1kmzpHJQQoy0WI
	H/YzuF0ozwapJT0SI4diu2lnZ5oOT4pQe0oaaiswuiV0L+b0enCKEnpZ98Md1IQ0
	74qmGX7KXzUjMdVDVgUQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8d511u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 15:13:48 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4865a2f44d3so1387458b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 08:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780586028; cv=none;
        d=google.com; s=arc-20240605;
        b=D03gWfl1gp/ENL+TpY/JVsjk1TeU4NUqYGPPbAJBYK1gPxzotW7z28JAYQKrRA4CtD
         tZvx6L/OPxAvhbKsuYUVRlx732lVG+6PlitNZLt3wVd96VWeFmwLMAH142lZEg4EzhYC
         IZ6gNb6yjNc1SgoJ5sxBZn3UVPt1zMssn/OEuWWOo/Ws5oZaKAMjiiwQPjjb5pa0038k
         QB73TDwvOZ3tmHsSqahjpZxaCN092isfcsbHnK0+Seuz3NwuSwKerxHSPgtW3WOhzPsl
         T/AroCPEVDaaODgZqem0qBqBIL/kk4A2A5DQoxdog8RCZg/6LOJsNNX6VYn4ZSfdYFKb
         yNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4my79OSMQYPXhU2YUseQMtgxKn07AEG/1T3jHV6k98Y=;
        fh=g8Aym8X8BCqj9b5KbbmbzKnfpSwU5iwkkK3JEa1NZx8=;
        b=ZRz5tmVUKTuBkgtKBVW47AP+ALPYbkjs9tCxbOqgb43LO+0eVy4gszbttqGyJ2mvut
         /5qWSYKjzvsd4nZ2/NYD0Ji8Spz/aR2eWmG6tdtrNHWtib2z24skDJ+kC6ZGEa0v5ipT
         w8pRHE3J01Mb2J3oEhn3TffgRb4Sbka6i0ioi235/QURwQJ+69+tmtJme9fi/RrUaOF0
         LLnPj7E6t27fmedd1Bcl+6clSNttfxri6g8/5FbxnG/5sc3Yh1SY/1Gz4nrMQ0nom8H8
         r8mZ1lBPFDGF55DVMnIo9U0m63T4sjl8z0rIIMmgVZCyiLPifYseD504ZYX1lKsd3Aa1
         d5WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780586028; x=1781190828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4my79OSMQYPXhU2YUseQMtgxKn07AEG/1T3jHV6k98Y=;
        b=P6ZeNdxDkfDmMsvqE9MZpORRI8YNrBkpF2TUFV9On7OvLfEwG9Y6XHV9Jrgef1eDW5
         79vWzYhdLWCWpsYb8TxoW4ZiCx/NNfcuz+vgE/Idm8loMkvh7aG0J8SjlsmVr1mOBMpM
         kc7Ir2ScIu0e4mciIbb3zwZt3x7UmZGIj27dPLBJAuT9jsp42CfzgRWb2DTyoMJYo37k
         kxUNzBGBc4rnrTYJalumDqJZxKRiXFwuO/9gexX2rySm4a0Xexmrm+ubpHkeuBKNZcjk
         7lTJwZa+Ngg8mKY6cEAqz6KQGuaHR7Anjx8pIDmCeZH9/Ta16d3err/oBgR0cpQ12sFE
         cSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586028; x=1781190828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4my79OSMQYPXhU2YUseQMtgxKn07AEG/1T3jHV6k98Y=;
        b=Okybxz8s9FLGmDSzwWdpXzhvxmA6ACnGQasWxj5A6G2saP0YmE9eM8mvCVmHOEKzK3
         gjrhr8pzzQrWPGEprCP/YlJRpoMChbbBIEKj7F+QZyLD5iZbvImGyCrpvy54SeNnz79p
         qdnylCSVFdsdQxEkjDdFBrPpiSpCV07PwqIhFaxAKZ1quHscsGoT8HDcHPMA8pPawzWr
         4Y3EWV2mRcnsz6IugqbRIRafCjO4Lv3yYFqjV7isfM6b9GuNLjku5mN1LuAYTA7U4C+H
         TnobolBhCaaT5nJsDJupzDp82npTIdxL4035I2R9WDM4lhKTMsF1YKWkG4n5YttV5y2p
         OG3A==
X-Forwarded-Encrypted: i=1; AFNElJ/HJoGELQ+U4oD8ozGo7EdK+qnr3bYbgFFwvZI5IYV4k9yO/kjjxJa6+1vDWROFh1VAiH8CpFxgwlExtJjH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0oF/VaK63c6noDwQd5wLAVCasonryPt0Est5mgPkHydfKxY1t
	KS/pezeCr/PX3PJdllP6bUp5cCze8ZfFpvdb3vehMsORO3Ghy4l35YCzHYP89AfeZoHY+ITeBBo
	heM7coz1rPzi4qZg1pceoZt8B4wZiZ7Uqi/e4MPnrTEY8yOzA2/SVl5h5l+Api4SdplstkWl+rj
	jhax4YlxQO3pLqnshG7X1slHcTb2RmmoIix4md55Y3Av0=
X-Gm-Gg: Acq92OGrSM2rRc9hhHRz3NjvZ4153So+zZeCGcuh7ObWzQx4xb/3vBvRAxskoN6tR7F
	AWXa5r3SzFI+dTOQ0lYQmV9vBoQ91/aO1zTL/Q2dsoLI3AtPVJUBcr5NWCV94xux1/kZmhK4OKv
	mPBr5yt36cswDYGcnMSMwPdZ/cBBXr0EOl4uiKBIhcKUfJHDYvINKpr4pnOYi0DFfyKmTDeijSo
	JbsPOYrNE0LVg==
X-Received: by 2002:a05:6808:c1f7:b0:485:dac0:a7d with SMTP id 5614622812f47-4865ac6394emr4440389b6e.22.1780586027684;
        Thu, 04 Jun 2026 08:13:47 -0700 (PDT)
X-Received: by 2002:a05:6808:c1f7:b0:485:dac0:a7d with SMTP id
 5614622812f47-4865ac6394emr4440357b6e.22.1780586027300; Thu, 04 Jun 2026
 08:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com> <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
In-Reply-To: <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 08:13:36 -0700
X-Gm-Features: AVVi8Cc6hFS_zyiHZip3PSaTAI0DzZRij3zeQsebuwBfCNnS4erThfLHMB24ZW4
Message-ID: <CACSVV03J7Y4-ADRNE+4qArqsWvQZ3qmTc04r7vmY64s0qDYFkw@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: TPJbjiayXXcCOJ1WYtQNtKTHMvsCEEr3
X-Authority-Analysis: v=2.4 cv=IZG3n2qa c=1 sm=1 tr=0 ts=6a21962c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=8k6WQxmsAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dX0BPLNIrGpKtFaJ3e4A:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE0OCBTYWx0ZWRfXx+UrJSz3ppJw
 lhlCMVOJNb8osuMCqqixuWti/4tCswYHKq6HR6zOay9BK/IAJ3qvouW7qhmI7co8xE+atDXvYI7
 F1hOYNUwvJuBT7p8IFfRMVzcr4mVhxbqdxSPzNJHXGZ71lxConnl4GOMibkNUyWYoIkJIy0jWc7
 cADPBHPp16oAMDEk0ry7VjDt7hUFP3ILuwprXMq7l6tHUz4myr1/VeWtXmQDardwydkz9LaUlT9
 6h546v3h6AqtLs3d0ptvxLeVkg26Wa74f/i77wz6VghoHzYvtADNy6GOTtcm2/LSwlXUmStB6Dp
 ni8ZSMQB4UdKn4lupziMECBgVtAcXyWhu+XfqaxqiH95ST5L7bfdL65vY6kgpBrb0KEOSJ0Kxie
 szuWlzh5hA0CdrIfm0bLaJxE9BqnAI0gnMCcHYtrX8C1UwZ9DVL1SlokuYC5bRCwPMb4qQKIb5F
 0SyKXh7/7V7DNbAnLyg==
X-Proofpoint-GUID: TPJbjiayXXcCOJ1WYtQNtKTHMvsCEEr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111225-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:replyto,lenovo.com:url,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72A4364179A

On Thu, Jun 4, 2026 at 8:09=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 04/06/2026 10:06, Konrad Dybcio wrote:
> > The Yoga Slim 7x Gen11 is a Snapdragon X2 Elite-based 14" laptop from
> > Lenovo, featuring an OLED touch panel. Add a compatible for it.
> >
> > According to the spec page [1], there  also exist other variations
> > (based on the Mahua SoC and/or with a different type of display panel),
> > but those are to be described separately
> >
> > [1] https://psref.lenovo.com/Product/Yoga_Slim_7_14Q8Y11?tab=3Dspec
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Document=
ation/devicetree/bindings/arm/qcom.yaml
> > index 50cc18a6ec5eddaf48542b85387c2d430cd4721a..fca3d180489d4cd3eb2726a=
722f15febe44f03ad 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -68,6 +68,7 @@ properties:
> >
> >        - items:
> >            - enum:
> > +              - lenovo,yoga-slim7x-gen11
>
> I imagine you might want different panel variants, just like T14s has
> LCD and OLED?

I expect this will be the case.

BR,
-R

> Best regards,
> Krzysztof

