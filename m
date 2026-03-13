Return-Path: <linux-arm-msm+bounces-97591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CX0FURDtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:03:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE53287BEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F360333ACED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3B33CB2DD;
	Fri, 13 Mar 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxdexNi5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhL8HaQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFF23CAE8D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421011; cv=none; b=hIWEz2Zw7oRYsZBt1wOPX/8Y9RQsktv/R/CMuoUJHp+ti7koSgeQzbrKsChOdfmXtNoJalJC1cPAOIj+tQt64+2hKZnlfK48uE22KjNfmzUtZ2r/yp9l1lT4EzFd/4vxJ5IwFIu2MDDkrWr1/YUv2lg+8W7UE8ETtH7s60KU43A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421011; c=relaxed/simple;
	bh=8cXrzLlHZgLjgAyGJAe6b6ournYzw/r6A+1FgFEmvK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZP6Q68ctnWr6dKULNiLFx5HSd+hAUryIHXbasYZm1a9Cwvykzi8ijoY6V+3hfGyUCkwNvgH2WQUl3tPVB5mqG2+FZL8TlN8Etx5EOhAPPTx4+73yMN89OSkJPp82LOt24ZucV8I2c6SHHoO28SBm0S0kHIJtnxWoKyodxM5RpgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxdexNi5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhL8HaQF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCmGX43229784
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9XtUHVBJEw3YTT8/B7UyUbur
	+xDGQgnnq0q/2FA0szc=; b=hxdexNi5MF8hVxXUYxs0kP4laWNPqBYZ8JPk7zRj
	9iMiX543+WyXoh95lD9wlMDe8NctOaNpu0+ehj4YiWn/6qJmhbcmTRQtaSGhBGGu
	visPGZf1dem5AGMHgRT90zvdS9GggSFHhcy1NMAG3sUXCAo40h1Wp+wOrnjhl262
	6ERA9QjB8GwYIW5FAHSKuNDZnHI4BdOtjcf8RE/X6igpBL+4XYW2EODXtDWZDSbV
	TJVQBgPycFstzarQg4D6ih/714MFJLSXisfLvonO10N0JMrVrxSKXhIujupzMbsX
	jdw9NfI6qDVKq/5J5Y2Oq2vqcgrp/fOx7mVZGGrZ7c20BQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7k0r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:56:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60132c655bfso24096449137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773421007; x=1774025807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9XtUHVBJEw3YTT8/B7UyUbur+xDGQgnnq0q/2FA0szc=;
        b=fhL8HaQFwsSwqwei8llR0J9xKT9LWKWndi6WOuRH+9kEufzhieAMStNUyffQuMrpg8
         JgKs/pDKyT5i8A99BjxowoaBa4oX/C00KRbzQbKlDDbxlu/AO4C24FuGa4hQSAf33oRq
         c24x/nocUGv4vNzLyX49OyWq+RQlTETy8WTO6NnIMC2uATeoZqtIo97SJIij6aJNbXEw
         YQNd9amuHpGVEwudmWUZZFRs05gOF2YziVNN94cfLEfh50v0L0zyWvQ7unswiOuH+2mB
         q+yj86ZP4/3nrdcsICIjMmHBSfmQndVhH+rrjhQ6RQ7TQyCy9i4rhf6oISMMX0LxZTqS
         kwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773421007; x=1774025807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XtUHVBJEw3YTT8/B7UyUbur+xDGQgnnq0q/2FA0szc=;
        b=Ijw4Z+aYetV7/bru+rkMqYdQiouEPRxP0HjjoJ6PUUBYBro2UudY/cBQksz5wrAC6G
         1rUvz2lGUqSLOFtfZfRBcI7bSUv1klXG0kNvfFLj3jZUySPCVg4BkhvRLP6ESq0nVm6Y
         VioREQiMjdx2e7aQwvh5a7Kj51WQprz+IMhGLHGuONfYv5Y5Z9HzIhXVkFMe8UG1x5sU
         nFXf/PADpfS3TeSq4kdxGo2KsM2d+QnAL9Tn4adnBo3kNjq5IGzO2V7I3QUqKonFs8kN
         Rc0n/TvdX746u2psrIFPbKKEmF04ZD0f5PhbqzAvZIOBtnIkyQ/BwevTeg87qW1SDYai
         YihA==
X-Forwarded-Encrypted: i=1; AJvYcCX8Us0K9nggADZm+bPSGi0I77UY2BcFbjmI3Ke3OQ0dc7h2VEgjWhB8zhBhAOwtOY2cIs3EKGe8icqRPyQU@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmDsC7solO2pDVTilxMrlTlAex9iSXdjCczo/pgJsv4I03nW/
	gBcPCWUBoO+PJqICA8EUrQvpUyyVIcGvB7rj/7oFRV1I4Yk6Hf0HiSmqz9uNSIS/qy45PDlO0ov
	eUvP4C/GV+zvE6MyF3HSTWiKHVF8VppSmMRhdKjJDqUqVVd8T0ZMDQcI/cQFSMNvZsgu3
X-Gm-Gg: ATEYQzxi+4iPT+QXp/qs5OcmyEOZOwl7nvJeyWFbxH1ReNXC7FgzE01j8PHU/lUyZeP
	QJlzrNTlNs8tHqgRQpMU0brsLlnKNUUNZM+zjXM/gnCm6CvbRSV75u+9YMjva+S/+4LcpKJKR1j
	JWjSTOdLCVhSYmUIzbLgAbM+hKsAFciVwviv6Yo9lihJfofJlsnIPTm2e+5o/L4GfIaJT3i8cA2
	mXEtbyyBHi3ignz59hpVbSkcplqK9zrF4UXqrEMk/J8Ce8k8rCr/eEmexUdOJk/yNRnlJYqAQyY
	AOhPE57OoCe6TdqzvqA8lHnfc5FHGnN9f81BYjH8j7dd4jLwOoSzStUFjcZ0cqL52RSQJNhqhec
	Sq362FWPuYRk/dwf67P6XuR1yAxL2IIGtqD0DeH66q1ymWU6Uf0cLWFMC7uAgZGrIZtM3Kh4Can
	imHnajkU5tmffA1lI98OsP3+eZ5QyBR8mfw1o=
X-Received: by 2002:a05:6102:5121:b0:5ff:ecd0:1d1f with SMTP id ada2fe7eead31-601f4a8a882mr3834551137.19.1773421007366;
        Fri, 13 Mar 2026 09:56:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:5ff:ecd0:1d1f with SMTP id ada2fe7eead31-601f4a8a882mr3834538137.19.1773421006905;
        Fri, 13 Mar 2026 09:56:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d6185csm16241861fa.3.2026.03.13.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:56:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:56:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Message-ID: <jzwfqsjtrerlt7bi73cyqxbt4ehz5aleeqx44kjqfuf7fklxem@zqw22cog5qz7>
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-7-14927df4906d@oss.qualcomm.com>
 <efa27939-67d1-9315-96cd-8b6e7f99a3f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa27939-67d1-9315-96cd-8b6e7f99a3f3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rpbFG8Kq_MrD8OM864ydMU45sY2wCqvk
X-Proofpoint-GUID: rpbFG8Kq_MrD8OM864ydMU45sY2wCqvk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzNSBTYWx0ZWRfX2/Ausaq1LIrW
 K4CDtWzqbNqNUI5+T1QP/anq5UuRo+xVpwvwB0s+h869EwtEPyrQVPFGH1aP8klRzTQnkLCXMH3
 bHS4HYYskwS1OTmhd0ClH/RpFtfDnmoBJs23Uk7zpKzTfVuIj9dPKEPzgwvEvFYyqMuCp6TW1B/
 aNGfEcXrj8iSFIn/sXfq5uMMI68Ma+uJ/BrSqfamcSIbDvTyvlCkqcoV8HP1h98cAC30Fo3qD8w
 5X2GVqpD9VeLs8++yCWHX4uy/kv+u+lJ8v9QUU6R/hB4XnjBfquF2Y2Ul17ZyCPZn5JMeBP9bte
 WSkqbgBT9Hbe0QYO2pAmacHvcX32qs+Cg2UDy3n8aV6i2wspP/8l0eX2tmp//9MEdrhplWERIWX
 XWlbmGWgex6tnrJhBPE6Lvs7O1hBFmxmN7DZdQOx7KdTMkDpbDJBe/TWC69KX+6yamV1F6RfCox
 WpSAA7gUow0ZNZwsEnw==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b441d0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=JT-4tI7F1-PbuEfca6cA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130135
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97591-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAE53287BEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 02:26:12PM +0530, Dikshita Agarwal wrote:
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > index d1daef2d874b..1a870fec4f31 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > @@ -201,45 +201,16 @@ enum platform_pm_domain_type {
> >  	IRIS_APV_HW_POWER_DOMAIN,
> >  };
> >  
> > -struct iris_platform_data {
> > +struct iris_firmware_data {
> >  	void (*init_hfi_ops)(struct iris_core *core);
> > +
> >  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> > -	const struct vpu_ops *vpu_ops;
> > -	const struct icc_info *icc_tbl;
> > -	unsigned int icc_tbl_size;
> > -	const struct bw_info *bw_tbl_dec;
> > -	unsigned int bw_tbl_dec_size;
> > -	const char * const *pmdomain_tbl;
> > -	unsigned int pmdomain_tbl_size;
> > -	const char * const *opp_pd_tbl;
> > -	unsigned int opp_pd_tbl_size;
> > -	const struct platform_clk_data *clk_tbl;
> > -	const char * const *opp_clk_tbl;
> > -	unsigned int clk_tbl_size;
> > -	const char * const *clk_rst_tbl;
> > -	unsigned int clk_rst_tbl_size;
> > -	const char * const *controller_rst_tbl;
> > -	unsigned int controller_rst_tbl_size;
> > -	u64 dma_mask;
> > -	const char *fwname;
> > -	struct iris_fmt *inst_iris_fmts;
> > -	u32 inst_iris_fmts_size;
> > -	struct platform_inst_caps *inst_caps;
> > +
> >  	const struct platform_inst_fw_cap *inst_fw_caps_dec;
> >  	u32 inst_fw_caps_dec_size;
> >  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
> 
> Thinking further about this split, I see another potential issue here.
> Some of the inst_fw_caps are not purely HFI dependent, but also vary with
> the VPU architecture. For example, on AR50LT (Agatti), certain capabilities
> such as rotation/flip are not supported, even though these platforms still
> use HFI Gen2.
> 
> With the current approach, handling this would likely require having the
> structure in lets say iris_plaform_agatti.h which would be included in both
> iris_hfi_gen2.c and iris_platform_ar50lt.c which would lead to duplicate
> inclusion, the same concern you raised in kodiak gen2 patches.
> 
> How do we tackle this problem?

With the current proposal it would be iris_hfi_gen2_ar50lt, a part of
the corresponding iris_hfi_gen2.c. I have no issue with duplicating some
bits of generic structures. Also, currently I can't see a clear pattern,
how to split this data, so I'm simply pushing it away from the per-SoC
data.

Maybe we will reconsider this during / while working on AR50LT. I hope
to have time to bring up Iris 1.xx (SM8150, SC8180X), which would use
Gen1, but it might have different caps or different params (I haven't
checked, sorry). Likewise I hope to have time for SM8450, which is also
Iris 2 but using Gen2 interface. Last, but not least, after we bring up
AR50LT in the iris driver, I'm tempted to look at SM6115 support (it's
another AR50LT platform, there is the Qualcomm Robotics RB2 device using
it).

-- 
With best wishes
Dmitry

