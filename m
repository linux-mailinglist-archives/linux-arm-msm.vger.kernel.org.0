Return-Path: <linux-arm-msm+bounces-94562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PXPOAKbomlI4QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 08:36:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C11C11DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 08:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E3FA301A933
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 07:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A0B36EABE;
	Sat, 28 Feb 2026 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kltBAFth";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeahVZvb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148DE36D4E0
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772263890; cv=none; b=XwVK6vb/5rIVuXZje7Vcyj0el6atX3Z4ZjFa+rwmVfzfpKSnnx9K/rtlVZeIj+BExteNM4FhYStxDKykTg8I0AnfgsXsnKrbwdj2GOS+hn7dunywdTXOcdLzpFv5WYo/1pt070wDQkx0Eyu4UebnrUPO6iJxf3cflGOt9PEZRAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772263890; c=relaxed/simple;
	bh=0hpXyAKupsYx20QK5LU24bxIUf4zGuuCPOC0wLlS610=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbWmfstHGLSiu0J4founDpkXE9jSMB3LP7kyGBW3eXH/Jspl0R2TFpnqpF4+dT7QIPIFgl/sWjhJSk0gDrACC5CmDR0G0lXiAR6T/vF5QsZLgnhmpXcroZrAyPW34v3tQvNpXiAAJuJo+Rr2ZGPmSYTHgbYzm8NkBxFSCpr089g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kltBAFth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeahVZvb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6ROUG1403598
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fYIdXnJiTNYA86ojQfMfZlVy
	fuRE6VoZ2Cddr4hiJO4=; b=kltBAFthS463PfRaJ+OxjfybWUMpMVn494WMXU11
	dPq5ToUuT1wTqppYoSSLGJmi7sYxmZS+qPwwuNKEmuZPDXkjDa9eBY4aFlJ9oslL
	DTjPhfQjox/5y9N6+4fGZU0OsLF/bWmZbEJCe+uRuxv49ga+G5rZ+jvm/xXk0wh5
	UNIQevBzK1W8+AY8bhK7UjuPVO7JyqI02tpnjFF0VyGk2PnVEnYrxZzGj2uxBRLu
	EHxgUgtY9sSTAzMLR+lv9AeQtf4QZFgLLBo63YL/7jr6fpuB949lf9zcu/rshaPz
	O6QyIRsZNtEUmRlU9/rClUlmusFbepR8iSfg5wDCFgmonA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshkrb2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:31:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb52a9c0eeso875397385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 23:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772263887; x=1772868687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYIdXnJiTNYA86ojQfMfZlVyfuRE6VoZ2Cddr4hiJO4=;
        b=FeahVZvbw+jCoMuspqxNf+t7wd/jU7rggF4j2egYtqSQV9ISocryRT/GGiaodlgGDX
         gjirJSYZfiFclr11pPb+UeTqvPXl6+AI0hkJZXyfd1v3Bdc9g4UVRPeLWiDSjzJY6SBr
         qMPdnJrFFhmwSPh6WXQRo1JMpXVsmxEm6Mt9Aplr3ClcxZpRWAzA70RvzVqJQbpqfOK4
         Pbo8or06+zyo32PMjMBrVIeOOc8w63+AuBFQv5ckOzRXlF5/u9GKH2RCr/zFBrhley5G
         V/MiIwOTGVuUDRlVrhHgZLp7jjhaD3D4UMunhM+nRdFtaXvUJ+787y5/f0yOszp/KxCW
         3MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772263887; x=1772868687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYIdXnJiTNYA86ojQfMfZlVyfuRE6VoZ2Cddr4hiJO4=;
        b=uEkLzvV5GeCsNtCaC9EwbbXVtA6ULg34M/lHw0JqU9hxjXE9+8OnInyGQsjYcfltZX
         02JFkoUXbaXEOoDrfGnFwaZnxOm+AM4drLa6wlQiZG0JGSxuGQJs7Lh+XtXMpvKg5Rw7
         CfBIuCDTqDmtnwoVYLLi5yqReAMZKOuBgyEaotUV+usDMV1t3TZE6T125UAjB3cqMcRJ
         5k14aySAPGROqL9FS9Ikl1FCmtEZkPVcm0N4DssG2CUZgLJbJNS+19/9bddKxDkLtNhh
         g7etT3eFT3qtyjzBlYhmfe7HR640OPSy7XKak2EHHTwLPuI5sZB21jONgcwyajSiqQ5b
         KOLg==
X-Forwarded-Encrypted: i=1; AJvYcCW1BTzGaBskvpSqz8uZtpAyIP1LBuZ/OJSRjbJbwq0YqBlzFpK6L+0BUa70YPY4Sh6Q0c729yhmnCSPAn9A@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLXBZHPdLbChVabH6pwHod+I1XSrp40tE0ZadN/kwE+U1snxT
	w0ZriCnX5rKDCgpCOkJWMVOnhPUu1QDxAcYqrAbNTpPY94eWn89BtE36YpAMDkoXLGm21o9szJC
	ZkwBSnPkxOKR0fiRLiNnIBdqDWnPlkdfPwxk87AsnK/P8HTmynu+viJ1PaBSQPFmYFYG2
X-Gm-Gg: ATEYQzyvq+4iBaZs/OZtzyfIv1wyJ/NwMSTSVc0B/nMco2NLy6wrNX2aKSMV08FszV5
	Z9IPOud39ibWNFd2yDr0jpN71UGGX26l5JKb0MDqyaLuYqVceHLeoL7qRH649gvPrHq1b5FL7hD
	kJid+P1/44LvykGT9cXiRFrtitgjSxZKEKFZOanJnZzYDuq89cGLY8n5lntc8X7nvV5q0ZHJ7tI
	RUfNcGiygqztKr0PbRpKp6rXxrRFaPDtu7bcbMcSzGYZs9tX2FV3XAlSPBI8k+7E/1pRBdStgXs
	D6GtH6Iwlsh/dsepPAjoR1ZNOCkfbNCyRJKCSteTmcC0V6muf+dgExIWIiJjR7pQid7wVIbpo8Y
	2rE5RPBNLETA4xrELhetTS379cqGEk8qMxOoTCVFt7mcZHeWNy1GLKMMgD5ND8LiB0ZSDgcMDzE
	u8BFVMrCLTix5XbtR7nBvebX+0vxXJpYkVDtU=
X-Received: by 2002:a05:620a:29c1:b0:8cb:55cc:6245 with SMTP id af79cd13be357-8cbc8d6f198mr740531685a.12.1772263887385;
        Fri, 27 Feb 2026 23:31:27 -0800 (PST)
X-Received: by 2002:a05:620a:29c1:b0:8cb:55cc:6245 with SMTP id af79cd13be357-8cbc8d6f198mr740530285a.12.1772263886948;
        Fri, 27 Feb 2026 23:31:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca099sm424138e87.32.2026.02.27.23.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 23:31:26 -0800 (PST)
Date: Sat, 28 Feb 2026 09:31:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 7/7] media: iris: add platform data for kaanapali
Message-ID: <vxucx72fpppn6ujujht4whfanbv5qs3i24cxo6zgdjvvxaaoty@twwljn4jpoes>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-7-850043ac3933@oss.qualcomm.com>
 <de8879ec-02cb-41d7-a16e-aa6d4aab983d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de8879ec-02cb-41d7-a16e-aa6d4aab983d@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA2MyBTYWx0ZWRfX+m1iG9g3L/X5
 UBW/O+GH4x3OlTBvMY4+0rDe3RF8/rbfV+30DpX5Pl2cJwoPVjSxm1Py+Y+D9hqFFIzu257M6jP
 ntpZEP3MAqkDwLviL2f2bllKIbQgiEz0B2abt49hmseD3N45yswZDB1IrdZYt68XIfdM0lQJAQ7
 XpMn8P8Kyx59ogKSCR7CkDV9y8OPgwlamxxLc3C8HUS97SnU1tJq7ftu7FEzvTejmuS6fFzKGqW
 vgKJe95PMXbLFgJOqS4/4T9i5Ts+nCCe/T5vFeIATGs3HIF+56IwUYwx8xrYU0dzsdOTlik+3RE
 /kWhnyQU5385m23ZGvzWo2bSmUflmmMSXurbzTxasnO9DLiR6WiaXICWe92Gp/V60Nw6pCzt/BM
 eb6ezhflQK1lIhpo7vb6zMkwBpSumKwt164buXPYPNAExKt/xxghtc84hSchZzy70L5ss0zWl5V
 pveQWhMPOx1V0MrEu/A==
X-Proofpoint-ORIG-GUID: CQ81eg4l3bjom-SLlcgNmRmnddf3ZG3m
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a299cf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=1ZbspG3SCIlgkd432K8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: CQ81eg4l3bjom-SLlcgNmRmnddf3ZG3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94562-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C9C11C11DC
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 04:48:31PM +0100, Krzysztof Kozlowski wrote:
> On 27/02/2026 15:11, Vikash Garodia wrote:
> > +
> > +#include <dt-bindings/media/qcom,iris.h>
> > +
> > +#define VIDEO_REGION_VM0_SECURE_NP_ID		1
> > +#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
> > +
> > +static const char *const kaanapali_clk_reset_table[] = {
> > +	"bus0",
> > +	"bus1",
> > +	"core",
> > +	"vcodec0_core",
> > +};
> 
> How many copies do you want of this? Data definition never goes to
> headers. That's standard C rules.

It's not. It's a custom, but not a rule.

-- 
With best wishes
Dmitry

