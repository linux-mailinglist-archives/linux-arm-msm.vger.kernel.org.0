Return-Path: <linux-arm-msm+bounces-107341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL+9KF+JBGoxLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:23:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7896E534F81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEF1430AFF71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EE830ACF1;
	Wed, 13 May 2026 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nj6ZC+Nq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWqjnQ9V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C46306D3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681206; cv=none; b=MtIPn1rm/AQSWYaWUsbalyV27sqD5D3al184mWvWmdXpawmSZuaGsoGHNyEM9GMdYtLfsCNkRkjxnbS2HTPg1R12eYXyWfrCadcM1HnuBi2tCVYQKcpuCcUQkhvomq0uy6zAWUyAT8slwTwfgRWZpRa9mNgzAIi32aU0/G9mOhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681206; c=relaxed/simple;
	bh=Yhyz0hv3eV8PhN9nKafDEtA5JZ7bSJjwlgsphHBI9MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eho40mBrWjl6Z8UDQ6JSMaC3f9mCVoOX2kN7/wqC7oHxkCkOUv9W/lJZuroRcQpcnPpfgCaLSIUQpMTOYQ3BKzWcystRVb3SgJ2SYFigDowiBtwGm5zUy1uq6VpEROqN4EEBgKkoCGqTohghHI5dFgFu8JVmv5vB4E+L3Twt4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nj6ZC+Nq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWqjnQ9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWo2m978342
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Sv2mS35ALbniobTUzrRKgd6h
	lYi7vNZsP9aMzxoPIfc=; b=Nj6ZC+NqmElLseaABuYVQb1PqleeNZjFLDTD9Kns
	NwjU+8opwm1i7EtVj6ZryMVbzNTxj1LiWqO3wMusTO5wONMQQ4ZWralPlex5Aztj
	BQoa3Zoh727EZGXlzICeBQ4wiDAgwrKPsVRYi7UsEyZ6VtPsmMf0wDV/4cyjQokz
	Wpns1223rrbTp91qP16RBOHNYiO7e5jk46ZzrbOZlB7u8p3QJEwOS3hpkou4XSv5
	JpwpRQJaj1FEdpbCK+qBityzgeA0XQ7F8jEIvs4dGgj7cl2NcKwkXyTmy6zAvDAf
	ETVj7ipZbKvJ+k0/hmLTCte4CfMG4bc6pqt4+qmn1TTR8g==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9vkt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:06:43 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dc41904354so13805758a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681203; x=1779286003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv2mS35ALbniobTUzrRKgd6hlYi7vNZsP9aMzxoPIfc=;
        b=ZWqjnQ9VgLzbffJJMXmiBUaMApQo0BbUv/rb9B7BThAZrXZN3aEc23uAxW+Hd/j63k
         keYxLM7f3B8bfgZjQpQOHBTmA5koVXMLl3v5sLTHMJxHsdGqA0+2b4LXOBfw9X39w5g2
         4koo9mKGaEgW1qNHybBbRQmomCmcc2LZflARGAMgCpYj78eeGW1j9vGYG503cplwzKx1
         JU6RotkRMa3NUFLBN18ygC4Wz3n/DINd6xp1d+1ZjI8cIqg9KBPqma3jxbS7zvKXohI8
         2Nth+B/kQxLC/W9f+mTY7i2qC8m/SJ02nHgzg6ovFR72x7g2gZjI9M7Eyu1WhdIAyP48
         5flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681203; x=1779286003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv2mS35ALbniobTUzrRKgd6hlYi7vNZsP9aMzxoPIfc=;
        b=FRsN5w7bIYEO52vJEjftG4KQ8AHi0r0kQUNi2r85YuedlukglnywoYxLmW4jsuF5zn
         Nv6X2qtcQY41bis8+1gi6FpjCyIj95EBoFQra/v7ttG4pIFdUmPlWuqsk3gFbqXctnhS
         l0Ar4KQU3YJebU2wqsM1C11WZZugPo4JiNbjONc1fgb1c4ZMuLWdtMYXcU0Uu3pabY5a
         2S+h3gqf4TODAk3HnITREOwZWq+UvP1cuAgggYBJvCcPtDB5YrAgo6BwwhofVAIdkROv
         HudBg+TZskb5fPJV3uT675/JM0cp8KJ2j1k+sHsVoCMVnm0MoUeZlkGe+DII2UbAilW9
         BZcw==
X-Forwarded-Encrypted: i=1; AFNElJ8LAPXWJOdXkmZ6ln2saUMQZeTB42UCFQ6g40BMQx647alVAySvTxpR1nSmf6G2FvDLPplywVfO+AtKQ6gY@vger.kernel.org
X-Gm-Message-State: AOJu0YwMiGNTReCS9sBYPaoJBJKIv0r8nOxAL9SEaTKsYnlK9WHvB0A3
	/ILYwDQSVWdfWmz0iF4A+MK9eKA9x54OoViUbtHNVspNbSD82qBCUl+kZJoQ6W5Pz7Jt9MAGdsf
	geU5kNGZDoyxfoQX7yma6OmgrMmAC8sItfEmjYMf9RcZL87u/dgTfYMflKe49sD/MQdtY
X-Gm-Gg: Acq92OEtsQ64Z568MCYDGNXycd2ISYBUAt4Sso7rW3n1NoyvlIfAuHhmWlt9fgX8+8w
	RRUvizrZFP+Ir7v0M/UsnVQGaxSz/pxS9/M53rgen3eqS3qgiQUGTzGVKSmLAl0ekrFzzVsjLHS
	wGLHqOTfykXAhk8eOhEcWCM896GbZkNfBMHbnwacFfrAZO/gG9CGeEGjz51fxio3xB30l8qbflH
	81FIjyjCJr8jWkmUFJCPhRFGoTSQ5Ucxe1hTGjzV1y5eF+e+41lRTqeT39fwPYGXOgnmz5nIreI
	MIpk0AKSuWKZ7NKB7fSYjvpl84uWfBgO1zsjGmJfU+WT4vqxv5YnqQmbjofSicTYFkskv6QAt7C
	23UO3Xq9Ix1guNEN+VxvTFOG89vsnBaen0NIwHK8KK7a5cZFnNIRgIDRagUidGExNZMhrf4L0Zy
	BenPN9UjZArlT3Ocq8EnYEFKgd8fj6tpe0ZN4=
X-Received: by 2002:a05:6830:44ab:b0:7d7:f5d4:ef5b with SMTP id 46e09a7af769-7e3da0973fcmr1898415a34.7.1778681202861;
        Wed, 13 May 2026 07:06:42 -0700 (PDT)
X-Received: by 2002:a05:6830:44ab:b0:7d7:f5d4:ef5b with SMTP id 46e09a7af769-7e3da0973fcmr1898358a34.7.1778681202366;
        Wed, 13 May 2026 07:06:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95152b2sm4047227e87.11.2026.05.13.07.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:06:41 -0700 (PDT)
Date: Wed, 13 May 2026 17:06:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NSBTYWx0ZWRfXzJIGrknMBmNe
 6EFl2O3htiLhuGJQxhMD/2eZQi2BNsLkfz40ZC+P3I/RtOXtWEgE5hmVZlnN9b2UvzXgX2RatpD
 p4WLrhvqW9tpKHLCHlX4ivWp0UrCltkllmjafwWsM+Yise3FlvrxkIuIFmpk+NG1RINHDp67/iP
 RmOk2PzWaf7QJnMHbFXppnyigjOLRCkg/pWcd+UkFbJGfBsZmpCohsmPesuhS9r0tQAYZ+ptoaS
 plZhydPriweWkAw1dGhId7QeKtjisvzWdKJLJtR6HPW2rOzRWLMIneaREh+I6tZQHViP9oAvYKm
 ExVzdXEsrDcMTiKl+EDzEtMfbVy3Zwb45p6eStqoHMNCDChvJNHC/+jgAkpuP0qoi6XRzMSE0/b
 ygPO3lxBnvJwNPMeG1/Od3jzZ4TRpTZLV2JyLh+7MReT+F/AeMcLrooSnT41LeY9nXdmEYguvXP
 ehY/IbP6ykZb4RW9FTQ==
X-Proofpoint-GUID: T-bcBjSLUrKtYk8JL7YDe2uLJEgUlGeu
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a048573 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=39BKs2L7sj4-dcXLI8oA:9 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: T-bcBjSLUrKtYk8JL7YDe2uLJEgUlGeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130145
X-Rspamd-Queue-Id: 7896E534F81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107341-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> > Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> > 
> > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/Kconfig         |  10 +
> >  drivers/clk/qcom/Makefile        |   1 +
> >  drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 576 insertions(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

After comparing the files...

Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
clock-indices, but I think it should be fine to use clock-names as a
one-off.

-- 
With best wishes
Dmitry

