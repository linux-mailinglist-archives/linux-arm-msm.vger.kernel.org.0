Return-Path: <linux-arm-msm+bounces-94820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICP9GWRapWlp+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:37:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5B1D5A5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A684303815D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F8F38F646;
	Mon,  2 Mar 2026 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HG76QltA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xd0fVBn6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6D938F621
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444189; cv=none; b=cwqc/XkaiXgQqRe0llIIEqztUwA97gpO1b/08AATRHt+igLJaBPPKN1rLuQslIgdS9c0mkrHukE4E5M8RNVORUctF3FmHMGAgldR++hDsfAASeUlXQbvURwC2vpDtC+82JM7wp31sTq6ElAX1i37D5+X4iOUX2b1gIdUaNzfubs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444189; c=relaxed/simple;
	bh=W/+pREnN5e1VxpAxRAovD9rwDlgzw5wWA1UEsPKKJ3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4gQZF1nhuHMYDHnkt40cuJQr0+KQIQphm1g4nE97zKREV9GnRUsPpV4G/Wp1WDFcQWOZJdbM2s30SwjWI56YeUXw6pCsWX7r7XwqOG7HMCPvXnWifiyAQ70xHut3cojCLSevOKnAarUWME01MjUT+aHm4TxUFVv3NbiKoPHo2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HG76QltA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xd0fVBn6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285bfk662344
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 09:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W/+pREnN5e1VxpAxRAovD9rw
	Dlgzw5wWA1UEsPKKJ3A=; b=HG76QltAhcQoR3rz/gGVhRMMFMawMLGtmyEzEBQ/
	RVn1dkPrPp7w7+lOS4gOYluBGrH8G9B0Ngrw/1d9yHFBn1SWYWj3APSGXjtue+Tp
	nc3pwToZyyB+TBlRFFCcEJ9JHLZuGPSTVNBMP5d2oVXnuslbXtlxqXQnFEbW8jTc
	4J+G78idwZ1/QAaJjZo9kc5sMYjuafub4CcrbJ5Q0Loiq3SmF72vDJEnBzfn+l/n
	npLhRwUs5fShAO9at6WAiQICN6QPr+ylP7ZQw9+aMIAhngBJuqNL4G02CZSxeCMd
	dw/LsSencxfv2Wl7lxzCaV68ySRF4iORUxyheU89jbltZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2rd1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 09:36:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3ef536ddso4230844985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772444185; x=1773048985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W/+pREnN5e1VxpAxRAovD9rwDlgzw5wWA1UEsPKKJ3A=;
        b=Xd0fVBn6bDSxnJBYVTLBhfrPrwS3N3yODnQBom9+Pc5NuEkAgEV+MEUEsJdbs0WtF1
         x2a8J1eD9A0pa9D/JpdlW9oPKWqn+idFva3gcwJgBiMtqVIWX10XezcHyS7QPxFatEcE
         dAS+dBIKiyrJ+hC9B7RCZxLqheZFQNKqYozZs4e1KXKxDAaXtg6ibYcIRHeb7aK6ruMt
         O3i584BvgPVdH+lF1WNPOIyLCJaLwrzvhhgZHPoREYk48Bkr2mTTHpNpg5TXpCIORMS9
         pxE16l+rr65Evj/NMDc4huTWFlm2K4mvP27F8R/3Xzim+5eJLPCy5jg2SEMAaNgBmbN9
         ls5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444185; x=1773048985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/+pREnN5e1VxpAxRAovD9rwDlgzw5wWA1UEsPKKJ3A=;
        b=DRPgW5NCVM2oxiu6cKCYZPrhfYc5jKJkIysCM1k9Tnn3zQAe+i/gZwMzCgvOTxQmXG
         nKU4zYO4toz5BvSbi5G2zyfnXulVjDcJI0Zt0Ecb8PcoOBYrBVysAI9Itv5c7r8t0H6A
         QDMsdQ1/NuPzBWIgu7h/tuG9rjNpUuYwoabChOEhthICMz04+AB3MJofcdG+w9yE/G3R
         +Voz0ezHFcby2Lp3yCMSklPMWCDiy7KkiblOlvdbbnhRBfjGdcRQRhzugcj3bsSI7liw
         524apIMl/J7Dq1bhzAeYiYlG+UCtgw+tIUpS/UvxXOEqOdvD6n6sHSixOqUI/hrtyYM3
         hfZg==
X-Forwarded-Encrypted: i=1; AJvYcCUXZk9CflpTEOrqcDV//1UrS3TNYLtqbtaED7YmfBUz4VQ3+EgIsbvv7bRIo/lOjy/KbOH6BjfzJpvAUNay@vger.kernel.org
X-Gm-Message-State: AOJu0YymXchGDG/HWhLgUbw2YIpXy7BUaJFyH61HQOuXhnPxup02p9c8
	V6P8TubfDiVJUKyAZ3m3MBd8T9QgiOQq+g6i+LV2HpAeBtQfBbUd98Hut9z4gX8hYdXSUjgPoNr
	c1769LUcxUtYfwwzumsfJPoAeHhrl3a3bj7vh59/PS2tyNvTcyqfWxb3K/tv18Ml+dPaf
X-Gm-Gg: ATEYQzygh9tXVgYjGgUv2yW2jXBKAw+rkInAFOxcJYudPu5Yiwh/gNFTvRdSdqli+7Z
	jI4dfmCjrDPLC6UkMG/0I0hDQcSKey9A7dgr5yLRIPNI+SlsWE2SdAegIWwS9aqnciZ/W1fO97+
	dd3HowGZKhfjOG++xxeeMdy5JXDK5tlhdmMX7jh3j6cG2Q3NVSf1MPdpALf0D6ipkz/FZTWoImZ
	msaUUrk0JW5RLKYKeWeGKyowJCU0UyyOamIOL6HmdtD4v5PAbtk/1qMkHQjG18nPUdoJ9xVabJ9
	G9AnhX9J/rrQQAj5L/OJOZ2+Go9kU34q29MkE239Un20FUH7zMH//1p2OxTSe7Ns1JBZSGR10ud
	apOdI5Ob0e70l6OfUjMpk5ROgpWAmmlzXQJ01
X-Received: by 2002:a05:620a:370c:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cbc8e1d882mr1703927385a.55.1772444184969;
        Mon, 02 Mar 2026 01:36:24 -0800 (PST)
X-Received: by 2002:a05:620a:370c:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cbc8e1d882mr1703923985a.55.1772444184259;
        Mon, 02 Mar 2026 01:36:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f2f88sm381265025e9.2.2026.03.02.01.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:36:23 -0800 (PST)
Date: Mon, 2 Mar 2026 11:36:21 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] (no cover subject)
Message-ID: <nu4hcmawoq6kzug7lx7pmhp3f4tep2ttpo3mugdk5fg2mviqn2@p7nfdcllvnbb>
References: <20260302-glymur-fix-dp-bindings-reg-clocks-v2-0-e99b6f871e3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-glymur-fix-dp-bindings-reg-clocks-v2-0-e99b6f871e3b@oss.qualcomm.com>
X-Proofpoint-GUID: 4KB1miN2yaMHWlz5GOlBDVpavRofvQe0
X-Proofpoint-ORIG-GUID: 4KB1miN2yaMHWlz5GOlBDVpavRofvQe0
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a55a1a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Zo8LqNs0DLUyECXxfzQA:9 a=CjuIK1q_8ugA:10
 a=VxAk22fqlfwA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OSBTYWx0ZWRfX2QXndZf5qKf4
 0sQTmPHpOui5DoJnI/Q/67DbPP/31HmXmnxcEDAOS1DAF5/BJMQX451Q7LKYoGacizIr61r11vy
 mVv+UqNpCrrEG/CO42u4F/izEsW2bUeo/r74nIErMdUG7huAGQtzeqOLid1R/t7xTLbRVAntN2p
 J+0dUbisxrzlW/eIutZ+rh0/hq7icX1YYCHyZHehQE2H9Nh7n8zj/nLhU97SAM6STHsDAEUPtKe
 BXkueaacUcDO9Fps49mmqY2GLmGYoHHGiGwzLJKFTLHJgPqkdUW0g002m7VuW2xrgF6AM8ED7JE
 v4VvLwRi6+vg6zvN6vw7yfS34jLEAF6F910NTSe31q6TRPOCNmDluybx48+sHFVhxi6iZ09/8gG
 JwastbGdvltILKxAOEJ7Z4XB9sxduhxRcjRqajclOwYkkl7n4Z/n4mxQASTigjJE7QSRQHCdXX2
 xTappcj6vDMxgllDCMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94820-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,msgid.link:url];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02E5B1D5A5E
X-Rspamd-Action: no action

On 26-03-02 11:33:18, Abel Vesa wrote:
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed the reg ranges in the example node in qcom,glymur-mdss.yaml as well.
> - Link to v1: https://patch.msgid.link/20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com

Ignore this please.

