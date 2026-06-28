Return-Path: <linux-arm-msm+bounces-114808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 779EFQemQWoVtAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 00:53:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB63E6D5320
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 00:53:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OgyRgftV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BNzHTxdh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114808-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114808-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60BB630041EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 22:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CB637269F;
	Sun, 28 Jun 2026 22:53:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C55371CF9
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:53:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687235; cv=none; b=TqmWk6ajhINLCxCpxvsM+pnGHkCYKzMemGwhs6zU1Ao4bJ3OEKFY8k8tFcHASgor+sV8u+pd/VWd8hpNy9idcbTukrVFpOhcQNHW8z1Sa1sxjm2n0Jhg7MSyYI6eNaJ57y7oKKtiQ3t9RndCqi7kzfw5M/d6qX/V5EHm6Jscd40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687235; c=relaxed/simple;
	bh=OX264gNLBq3yKdzWgzCkw26t0180hmvjKHJeD5hHvOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCxTBMYNqWjOtph5aiEcIT1+A5ID5I7G1zJduEfk8dxzQ7QXIiBxFG+GvQDB/boV040N+FD9J4m8bNgvto6ha2eRAKpdljSWRe+vKNICrtgPFo9o+Nz1GebnMr+TTiL391eRe6L+ONu4pUdCxOqnvMR6oHQexkuyCjKvmUClE9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgyRgftV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNzHTxdh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SMHhKO952202
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DBiYvBC1dJo0dJZFGs5nOgph
	H0zzbBFmjSIO8xEAr8w=; b=OgyRgftVx1LaUcLi7CbJ7X+EZmlttu6Nb5pxO3lb
	bJxsyhC9uxJQ04+QS2kRlpajNDb9m4gH0QjapQJdq2qE6nVwiOB6X0zNtRXWlzma
	vWBJ0+4UJsdlNq9A0a3q/R4DnN9sdF9OTspNoY+YILH/qzGxJ00Asq+jHUwNg0wU
	A8h1FMaS4ZLgpg46LK8NIe5XrA5WME7QOg+ojudFi67tCYWtxW4LeLc4714YbGq0
	mnm4n6UGdIim4r7n11O2Pp4ewPyScXWYY7zA0BUMHc8egGF2VeNj5W48pJ6K0C1N
	QcsyKoyri5JcB30vf4R2Ar6b3SbXVXuDOOV+lwQfu2Cu5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf3ku9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:53:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b2ccd7971so473216085a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 15:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687232; x=1783292032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DBiYvBC1dJo0dJZFGs5nOgphH0zzbBFmjSIO8xEAr8w=;
        b=BNzHTxdhFaICpEUtzVLo7BHWblAL2vejzzmoEkah9mmWT4BWUEICxUErK3aeTUFq/k
         zsTfKamMTPldN6jkxIpi8uNYzbZXVnUW6BJZdFnqEJs4IZQhffs9r6mdkYQp1wg2mW2D
         uyTB6/S4Kk8OG58rbBEcFsdxVsfDtYPgX2AmKxTLPWPqZfhX3fx9cAwkyLIkQlyLob6y
         JAebwhfq7Dh1aCcMrS44MgkoMI+V9TXqFUS5PLwmi5iN0kbOWrrIE0kUynLdktaUP+/q
         RYGWf5xAPMgxJcQUi6I3upfpmCSW8w3k5SZqYUcannCDtfZ0iLzhhf6HrxNNaJ8J7wDS
         0JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687232; x=1783292032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBiYvBC1dJo0dJZFGs5nOgphH0zzbBFmjSIO8xEAr8w=;
        b=JB+XekdejuH0rY7xZy9/PNMkTZp57Hh+BZJjWrI78VfzfXjl9hmL87FdZ6VHGbA1n2
         2xSf+dSDKw4JYvLvG1AebwUCkn9+RZDwCRSrA0H3FQUQnyjNKaMebR0qTqu6iwyf7ArF
         xBrKtXEuKkssTw0obZVfdEzOoGQGBx4XAJ+B5TXrYf3DF6BUHuNGHjc1BOA5Kfdqmxi/
         iqGLZOS4iptE9SzOmlU1Za6baWLbnuBRRDG+BkJzWeQ3lgFkg4a5QYy/CSA8So4FU1F4
         6Vq4cIeGFhb0JayBicwpQQzwhsYNTBVUiBw9YhOLLRossJhdmLFCAo1r1fNrR732/7uN
         hecw==
X-Forwarded-Encrypted: i=1; AFNElJ/5hueq5ShaS56GuTVHiyn0GipAc9RP1zHJ6SdpQq+FX6bZRetY1XMM4hCjG8wSeo6Tfh+fe5Uz5KPWOGH0@vger.kernel.org
X-Gm-Message-State: AOJu0YzjDCENdmKLOVJxptF2cbn9A4PM/5O9fx0Ox+RhQQUp4C2l3kJf
	yPncsj/YHOyVnasTcIAlyEAvTKmLsh4Oh5D6UBNpj3Y7aoVG/CdB9oOl1DJ41mngTVbtJ/b2lli
	N0q11KcT53NR39c2UQWBXu4+BDrFjMjGmy0W6aUYVNzrjngomaPP+xruKlbRpTuVWHhZl
X-Gm-Gg: AfdE7ckQKvNLJ6bEU6rbl2uWS8YU/m8zI42oYqH7qmFJknIH99vlL4NyyVfivZ0hrFH
	UjwHGI4qYjQO9IdQ+ciMGZCSpWxCzSO6smawk5LatyKciGw6ED3LMKbDsHIm99joC2icycCnKj/
	ngO5pJIEgMqnHLWqoT6G/uvvB2tF9PgrF2wV8OFWv8eDvgHIC5eHSSNB8ZNIZ1dguzZA1zSBHuI
	D5VLLmEDcAKJsgF4nlc2XC4TTYbBbs8ycYsfJDqMt00WwrZ4nZ0gdMkP5bfMWkvADW25r0FTNH/
	r9Ri3sFEUrnBKyfnHJz2C6Vzi1pbGywVzaF+w4jZQ7/QP5N92dFUxzBKNwdw4JDVT+xOM7d+T7r
	1cGL2YmRXGbEXb2qeRq4OYL/RCybkel+J8wUSCwDp8a+IGXfh+d7u1eMzye6MjZNP7d0SDpEcnk
	FwcvzGp81R5p2WMXvRgfVwFTE7
X-Received: by 2002:a05:620a:4405:b0:92c:3086:6d50 with SMTP id af79cd13be357-92c308679b7mr1003116085a.2.1782687232129;
        Sun, 28 Jun 2026 15:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4405:b0:92c:3086:6d50 with SMTP id af79cd13be357-92c308679b7mr1003112185a.2.1782687231656;
        Sun, 28 Jun 2026 15:53:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b134fb1f7sm360941fa.5.2026.06.28.15.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:53:49 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:53:45 +0300
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
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
Message-ID: <2e7wfaejgbapxhmlxqne4rtxzcuyhijxns5su2kcr6k2do4c7l@3zdmkrtik4iy>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-7-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-7-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX26G6EFW3vc7U
 R9o4M9LsZkackwO1DxZWDb5EgZYl9IdGFDAGOu76km/aktH7qboFB/RcVvJzHLI/E54LHEtxtE3
 HIvzhSqzfsHMgDcR8lACb6sqWGI+WZI=
X-Proofpoint-GUID: f3RPRovYE_ItWCNg-sk3uQF5UZTPcU4F
X-Proofpoint-ORIG-GUID: f3RPRovYE_ItWCNg-sk3uQF5UZTPcU4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX2eQD2M/82naH
 ytbvqUN62/vGXpJcjnNSfEJMV2+cCes3vM9pBMnu/S+shgNgmgjhXzecB3a8Cfj8A+njbQF3PR4
 13GawS2AfP4lmbRiaJKyJZDzfjT2pTSc8hs4CkDG7PJcn6x3mrrd3lqiBMuKWYo1UfQlCVyGV1V
 pGn57heEPjjTkQUtCroKn19hCHr0MceVqOqlV5j3hak3fB+41IChc39R5J2I7qiJ8wyJmN8j+LD
 pU+faDebRBD38vY8mWiI2AyMBgpCX7If28mNFxiVFM8ehDCzLlNqFTmW6cwdzuS15+M4ZQJea0Z
 v2DFBc/e7JWMmwjuZMVrnC9EbhUkUL1eEvDZRG4lhMzCq03NyZQ1T3praIHyZ9xnmLKUhR8PE1q
 z1KNok4ZJYOzez+anFuiQMX5YnZliRlwxuTuVKnsVJTM/7TvIw9h82haPoFL0HO0oq/AMlobQyj
 H5Xc2yuuJRTzQvh5xQw==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a41a601 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280207
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
	TAGGED_FROM(0.00)[bounces-114808-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,qti.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3zdmkrtik4iy:mid,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: DB63E6D5320

On Sun, Jun 28, 2026 at 11:54:00PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra CQS EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

