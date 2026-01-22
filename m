Return-Path: <linux-arm-msm+bounces-90180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMg+EIsKcmmOagAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:31:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D3C6604D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ADAF36C932C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A5743E9E0;
	Thu, 22 Jan 2026 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atDu5xow";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGC+U0Vf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B943E9EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079877; cv=none; b=n5st7Jua6RKiv9JSrj/Z0q4N721zgdGdR8XCAhMgORnIOXkQzQVX8GNc3Qe6dZcNSI9HCpQu6g055Uf3qvMmixuumJ/V0EQi0DP9ykYrUg7DM002bl0/WE/2em6uP5bKoX99SBheUiJHPzknWvhAGI0bZ4TgmzCHDn42yvjRXnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079877; c=relaxed/simple;
	bh=fkAYeCgBvo99N2Nt9+mGGBZC9j2ppYQ5lmM3o52fWq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MH6vT047A+LsjHd+sxBvmWaiyroEi5+8hEVnOxi6zHg6keAixSF0BM0OS+ZoZedz+hunJVtG3+pUVe/GpxaExTkptC7/JcdKpxtAVOC6qmWEJxrsD61ZZTZaJ8J3bDEOSqoQTR+7jsqMUhr6og9Rkh43MQ11j6iaO+gmpJDGmn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atDu5xow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGC+U0Vf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6riow725005
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0KlvkM5KQlhi9X1NhLsO3/hA2b2nzw1RRo2lI06OH4=; b=atDu5xowozGMAuUZ
	GzTtRyhJQ2wqIsuDLs7r9ve+/Ed1V5cy9CzphuYN01LXzxL/RVZWp4hu/nDoNk+3
	TCwhJUsz/ORIjI16HRuDW8xFabYsz0DgkWTdvrmUoG3JvWhiPOnKAqDNHq2IyyuJ
	xaSQh2qgg2FJDegmMLs37HqsKzmJSPCHkS7JrjolG/zBbpOUXKFvUch7uQr6m02/
	NAVlITpNvBiNOW8BZKxFktIr8KWt1xipbBpL493HGz7UoLElGipusI/zFLkMACmP
	Ae3W/XJWF+f4gCBe8MKE130TmCtczKSyeknY1copj2+dgEa5R1cdbTkVqLPULtkE
	gG3xgw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bgrs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:04:34 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5634817781dso741825e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 03:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079874; x=1769684674; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t0KlvkM5KQlhi9X1NhLsO3/hA2b2nzw1RRo2lI06OH4=;
        b=hGC+U0Vf6oCO9fnzGn9zKWz87GvDtZO2zi/4iFMB1RJPoY56FlNjpa8hFi9z2p4NRT
         rMcJXPUWO1UiFVHJ87+vIPDaRsE5HizMd1XfKSrL0IXqd43jpL/v48ur11mlXbY7oA6P
         bUex8CkyNPPF9W7gtDXRAGHlgtG2eNf31cruxuRX8uOSIkR+mAF7aKsH4Gbh09w4ewq2
         qAW13B0ffDKXhyWMYIWg5ZtZGqS3y6GxHJybtUDDqn9sSDFF7fGqn0ZYjbmgN4709ZoQ
         eSmZXentqwdgT5TAw0LpzEaxwtAT7ElsmYYX5ChjczhdlFu3LLpyoovNHJXOLKWKxUlp
         c3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079874; x=1769684674;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0KlvkM5KQlhi9X1NhLsO3/hA2b2nzw1RRo2lI06OH4=;
        b=q5HBfjz80VvRdYS1v+On+Z9cE+hmLnfP3tMohiQGw/B9pIqB1o+I0SN0+5g7RNyjA8
         4YWbFV57Bt2xRkEkndDph9w6jKAZy6kgHmfD1GkgR2i75pXjZnvf0I3cSnruqO+zZYWK
         V8SdVRox6Ku6qcyqKDuzZK2zjoWpmBxY39WPejoO4Lb/qfyV0k7oF1LKBA6G4QwkfTJF
         TsaPae8Mxr7wBWwBeuhLvmnWBoYI2xegHlgF5STFG7Jvx0HMO4QndIZiWzfUBUwQ1ymr
         E7ZRapm+Nj4fpnzydw9gayoUfaYCJ0YdZ1DDB5MeVXSP2rIr2knv6yTswRwpllzo3zp7
         QNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7IJ2OG8WD3gjp+ny1UzYj0t6ATMYcbGkgiD+Qi5uG6deBp++Ghi1DZyy790Vbmw7c76WCAttXdCvwziH1@vger.kernel.org
X-Gm-Message-State: AOJu0YyDNVILcg9vEazY6UsvPVg4wca4S3uG60ywDabVwiaMDfRFl1d/
	SMZj/zr4NKdItHOBBO9irkEn/RwSi/qeUtYQhUIc3QlJiGqDHy+BJHcbKrlU2X/ssJNazXHCQKU
	5RZT6/wyvkoFMKYQdOh3/Hi8IN+XAzPEHz/wmTwVryJL5xuEBW4wzxpvDXbg5NNZvakLK
X-Gm-Gg: AZuq6aKRjvrMYfhpOM2KjeGIZ27A1ayZP9o/1bbtmGLl87LVeqtuGstyIEmkRbv7zTb
	Ht+vM3UH0YGjnTXBTjtZCtTx7Wsdjy7IMNPctjp2gbsxQZ3qxwsUZtezW3O4448hraaB+29SBVz
	HTbfwWXByoHQIPpko5NnRmBP3AqTNb2G/oY9kqKGBj8W/cpg4MCz/2i8VKLMXNAgKj7KU8MJ33c
	/j5c1rV8/R8FT9wZNPTD7Cq6PXTVyHmLmHGWPYFNmBqcgjdgX+aokJoJBDIVkt84Ax9AyhvXonW
	0AP+EMjB9Nr6w05PSn6lxfRwsEzNiFTKM7Kj4JUxZ8VM2KRqJfq9VIl/1pR3VoQbbU+y17MV69P
	HAFEEBs4Eq9tr08/pbM0OpRcHiSyV5mzLgsCHOrQUPPzwZNx8AD5c8Nyn7qfresVhwsUC2hJT5g
	BnqkeIDFYB5ftCJADz/cL/HEU=
X-Received: by 2002:a05:6102:6cf:b0:5ee:a2a8:2e73 with SMTP id ada2fe7eead31-5f1a551ef9amr6077494137.26.1769079873638;
        Thu, 22 Jan 2026 03:04:33 -0800 (PST)
X-Received: by 2002:a05:6102:6cf:b0:5ee:a2a8:2e73 with SMTP id ada2fe7eead31-5f1a551ef9amr6077487137.26.1769079873108;
        Thu, 22 Jan 2026 03:04:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3543d2sm5368629e87.43.2026.01.22.03.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 03:04:32 -0800 (PST)
Date: Thu, 22 Jan 2026 13:04:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] Add support for QC08C format in iris driver
Message-ID: <sa6y3vjstutglftts3ucoouj6js53p6an4wjcvqhbjsazmmxrf@v35pf2dqvfdh>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
 <s2qjimx4tq2jdnir7b5dljf4onsbcmvb5prxcvc22q76l5cgnz@wrgcqdrl26sb>
 <50137983757d754609d8164dbdfc429b32e3d6b5.camel@ndufresne.ca>
 <qkkjsjvhwovbh7stjc53htkt3wucd34nzcvnkilnbxv4ukbozj@e4ierwjhs7wp>
 <0841b98d-32b3-4e7d-940b-9be204fad7af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0841b98d-32b3-4e7d-940b-9be204fad7af@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Qx_OfkQ3qQV_cZEw409hSHqzd1-rej3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3OSBTYWx0ZWRfX891pUDxLat0J
 PzkilJiBx8hDFWM9dAdniLGs5B5TqWl3tkB3F6YuVF/1H7/nOAl9G4LqHH1u2WxShl1Ii0CtzzR
 b6JYVHCcBok+rKR/ynL5raOeaGDkC2dBeHOoU7u2Y2vjfUTtesw1UGG4AQegoKfqN0j7IAVbmcZ
 JorvfqpX5AIa/akzkpXATAOg0di/j/xtpGbTtpOMe1lrumxFxb0qiCvc9kp49ADQIqN4jK9b+Rn
 2uAci04obeoZZXo5f57Ib2g+9hGVtX5K5A/UWLqPtJMGmvh6e1iJxgTCiUr0yPMP048DkfufSav
 xCvjn52HTKK/9Za6QpGHUU/2MhyzwTHhQ6genwYh3xhjeWeq6yWZ78slJYrXNbBykKmLHHfRMy1
 TjjSWXyLmnhpNSq8cmtG84CLi7XIl119ptFeGpecs8+WgNIgXODyNnoXhhWprwOdUd9xR41cdFh
 I/RPA1ZmIprmlKdn2+A==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=69720442 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=nY9ItIvBOz0YvIiU8-8A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Qx_OfkQ3qQV_cZEw409hSHqzd1-rej3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90180-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[ndufresne.ca,oss.qualcomm.com,poorly.run,gmail.com,linux.dev,kernel.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,gitlab.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9D3C6604D
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:29:32AM +0530, Vikash Garodia wrote:
> 
> On 1/16/2026 1:16 AM, Dmitry Baryshkov wrote:
> > I should have added GPU maintainers and ML beforehand. Fixing it now.
> > 
> > On Thu, Jan 15, 2026 at 09:02:07AM -0500, Nicolas Dufresne wrote:
> > > Le jeudi 15 janvier 2026 à 10:08 +0200, Dmitry Baryshkov a écrit :
> > > > On Wed, Oct 08, 2025 at 03:22:24PM +0530, Dikshita Agarwal wrote:
> > > > > Add support for the QC08C color format in both the encoder and decoder
> > > > > paths of the iris driver. The changes include:
> > > > > 
> > > > > - Adding QC08C format handling in the driver for both encoding and
> > > > > decoding.
> > > > > - Updating format enumeration to properly return supported formats.
> > > > > - Ensuring the correct HFI format is set for firmware communication.
> > > > > -Making all related changes required for seamless integration of QC08C
> > > > > support.
> > > > > 
> > > > > The changes have been validated using v4l2-ctl, compliance, and GStreamer
> > > > > (GST) tests.
> > > > > Both GST and v4l2-ctl tests were performed using the NV12 format, as
> > > > > these clients do not support the QCOM-specific QC08C format, and all
> > > > > tests passed successfully.
> > > > > 
> > > > > During v4l2-ctl testing, a regression was observed when using the NV12
> > > > > color format after adding QC08C support. A fix for this regression has
> > > > > also been posted [1].
> > > > > 
> > > > > [1]:
> > > > > https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
> > > > > 
> > > > > Changes in v2:
> > > > > - Added separate patch to add support for HFI_PROP_OPB_ENABLE (Bryan)
> > > > > - Updated commit text to indicate QC08C is NV12 with UBWC compression
> > > > > (Bryan, Dmitry)
> > > > > - Renamed IRIS_FMT_UBWC to IRIS_FMT_QC08C (Dmitry)
> > > > > - Link to v1:
> > > > > https://lore.kernel.org/r/20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com
> > > > > 
> > > > > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > > > ---
> > > > > Dikshita Agarwal (3):
> > > > >        media: iris: Add support for HFI_PROP_OPB_ENABLE to control split mode
> > > > >        media: iris: Add support for QC08C format for decoder
> > > > >        media: iris: Add support for QC08C format for encoder
> > > > > 
> > > > 
> > > > Looking at the series again... What is the definition of V4L formats?
> > > > Are they expected to be self-compatible? Transferable between machines?
> > > > In DRM world we made a mistake, making use of a single non-parametrized
> > > > UBWC modifier, and then later we had to introduce OOB values to
> > > > represent different params of UBWC compressed images.
> > > > 
> > > > So, I wanted to ask, is single "UBWC-compressed NV12" enough for V4L2 or
> > > > should we have different format values (at least for different swizzle
> > > > and macrotile modes)?
> > > 
> > > Our expectation is that the decoder will produce the same format regardless the
> > > resolution. And that format should be shareable, so that same format coming from
> > > two drivers means the same thing without out of band data, except that
> > > resolution and strides are needed oob anyway and can obviously be used as an
> > > acceptable workaround the issue you describe. It should also have a single
> > > translation to DRM fourcc + modifier, and hopefully the other way around is
> > > possible too, otherwise its a bit broken and unusable.
> > 
> > Well... As I wrote, we made a certain decision several years go: there
> > is only one DRM modifier. At that point the decision was made by
> > open-source people which had a very limited information about hardware
> > internals. We can probably try deprecating it and shifting towards
> > multiple entries. On the other side, most of the blocks would only be
> > able to support only one of very few possible configurations.
> > 
> > > 
> > > So bottom line, since V4L2 does not have modifiers, you have to treat one V4L2
> > > format as a pair of DRM fourcc + modifier. Decoders typically only support a
> > > subset, or hardware engineers can generally pick a handful of performant
> > > configurations that works for all cases (its all 2D with similarly sized
> > > macroblocks).
> > 
> > This is not quite applicable: even if we try to fix all other settings,
> > the format differs from platform to platform because of the memory
> > organisation (highest_bank_bit in drivers/soc/qcom/ubwc_config.c).
> > 
> > There is a description of swizzling in Mesa ([1])
> > 
> > [1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/freedreno/fdl/fd6_tiled_memcpy.cc
> > 
> > > Since these formats are only usable when consumed by GPU or
> > > display controllers, its important that all party uses the same convention for
> > > the limited information available.
> 
> Would there be a need for any client, other than GPU/display, to peek into
> the data OR to validate it, it need to decompress it. For that as well, it
> would need all the associated info to decompress it.

It doesn't really matter. This is uAPI. There might be no such client
now, but there might be one later. Also, with the tiling format being
defined, userspace apps can start poking into the meta / color buffers
(e.g. for the sake of clipping / blitting the part of the image).

> Again in same SOC, camera can produce compressed YUV with different
> parameter while VPU different, it would again need the associated info
> alongwith single "UBWC-compressed NV12" to decompress it.

Yes. It's actually a good point, it clearly shows a need to describe the
stream rather than stating that it is "just UBWC".

> 
> > 
> > Yes, we added UBWC config database in order to have a single source of
> > information for the kernel.
> > 
> > So... On the practical side there can be:
> >   - UBWC 1.0, 2.0, 3.0, 4.0, etc.
> > 
> >   - swizzle 1-2-3, 2-3 and 3, partially depends on UBWC version.
> > 
> >   - HBB or 13, 14, 15, 16
> > 
> >   - bank spreading (true or false)
> > 
> >  From the practical point of view, drivers/soc/qcom/ubwc.c defines the
> > following formats (currently, I'd like to cross-check some of them):
> > 
> > - linear
> > - 1.0_123_14
> > - 1.0_123_14_spread
> > - 1.0_123_15
> > - 2.0_23_14
> > - 2.0_23_14_spread
> > - 2.0_23_15
> > - 3.0_23_13_spread
> > - 3.0_23_14_spread
> > - 3.0_23_15
> > - 3.0_23_16
> > - 4.0_23_15_spread
> > - 4.0_23_16_spread
> > - 4.0_3_13_spread
> > - 5.0_23_15_spread
> > - 5.0_23_16_spread
> > - 6.0_23_16_spread
> > 
> > Would it be benefitable to define separate DRM modifiers (and NV12
> > compressed variant for V4L2) for each of them?

-- 
With best wishes
Dmitry

