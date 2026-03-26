Return-Path: <linux-arm-msm+bounces-100016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J+28KRSyxGmR2gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:12:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F305732EF4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A07D43018091
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8659399368;
	Thu, 26 Mar 2026 04:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiQOC7Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dalTUAIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51CF392817
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774498321; cv=none; b=CxLOWIJZZYsktGRokA2sFTCRge4KHxWKNFRlldqLgiYputIgW2t+yA1hviZdio66zyr/EecxWJmxw2fd5pBCFg+i5KJIPxu3BKgfT8A1lYKN+h+hNka78xH76OGQnAh2W1cQ6kGivH4Jhgp9S7OQOzdNYlum2kbxPOp4PdMaI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774498321; c=relaxed/simple;
	bh=DhozAv8vNnPSYtw8TLmWK2PoxiA/RC68tK137a0UTFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKjt7PVtGHervu0i2HTWdz0DoTHx2ITZ4VHPsKQ3I2B4osRhMQm6/S2O3+6LAvojMKgxxxzKlgsqPTtnrOlFv0rgaEYLX553ajQaDqrRJORA91y+JiqH/mzEeCdKN62swEMXtebgaW6yaYfnuCve4fjUSkWW49U12YsNcUIeZos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiQOC7Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dalTUAIR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0nQJ71810753
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6GpiHe3XS5xXF/sNBIMhZaAB
	WOl410Ff3QfC2wAxaSw=; b=kiQOC7FkB/YaOu6tDgica+57VcKzapzZSUmIduHZ
	+MaHytm4pwsrwOsJ5PpGS+H0FGwRXPHPqenwjN1UQ7oR7+PWCXwalD6S7CvqjyDu
	v2aWM/DNfrZ2e5hHYbnoBCKih57AW40g7Ca0BxXFGPGcD6zjAIXH9Tk75zA3pK0N
	5xMZ9Emd2L6iE/S/TxUjchwlGasI5CtyaGxQrhqMbmbR50sPYzrVG8UfPkgim8hs
	pFWXM+/8XqcAccss8wZj6Yaw49hZNZkmfxzZenYgfZMc2Gpet4Ic8QVK3afkE9ZW
	Nj7BA49E/R1BRVr0xdADvkupmnSnA+KvHSuYGB9lFpmHqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn0hgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:11:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50925fed647so18695111cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774498319; x=1775103119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GpiHe3XS5xXF/sNBIMhZaABWOl410Ff3QfC2wAxaSw=;
        b=dalTUAIR+bxVWPvjnPB5JKx8u6prIMWq/Q0p4x6ryy6BbtsJYuhhDOdjXL0Tqj7n2n
         6sKb5dyny9cngoE/zzGPeJB1vAAf/1dfIxzSM0Ynm5rGsVtkgJawsZFBWmGo4w/8FQd1
         56p0Bj4jR0+/CBcRoJsgm5/4Ragq7cgS+EwRS/z0RYpWTECrCKzU7fU5sE86XomxZQz5
         dCjFIqDQXnl9VyprYOo84+8BJr7g+gNCfFbDMXzkNIoorQrjnI0/hRGxU3ECzOUt08Lz
         VVTfgBT76644S+NUJht4CjjaBl+/NIvOVxzJV88Kue6yD0SsN6W94O57aAsfm2E36EY0
         99Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774498319; x=1775103119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GpiHe3XS5xXF/sNBIMhZaABWOl410Ff3QfC2wAxaSw=;
        b=jO5ATLiN6lOs486/EiLLmC6FRr65gXQUuAhAba4B4hWokCfKZTjZpk2/aK0XNBtN3Z
         rC2b+SmiGt7emHAozgHTfgK6b8ASykk2CJcF5M5ysEo/K/747PwnCpD2hMYCpV3pe9lE
         zfec+ro1DgEepxtCcSmheKjXuawwx/j5OG51v2EZvyTilMS8zK3gLg6cNwQOjrPL0wWD
         urPAHVD4IhqdeBZRazS/ny0BEeo7HNclzl8LORillKbSNKHIQr5VjBFHvBiVTiRZx4hq
         ErW2iJStI+4bLwdEqdHnIbBt2aAnFt3Kf277uM+XE1QWxSbPk4IBzp6SCyw5WSKbjIq2
         nhaw==
X-Forwarded-Encrypted: i=1; AJvYcCWd3K2MTsyuzoVp8SSVphv7NhW5jsKhejMyLfCUGpOfDg+qA+j21luXQ1QrlCNJWMoSyMIat1/0uZZS1Lxq@vger.kernel.org
X-Gm-Message-State: AOJu0YyMufcD9Xw7c8cxumAD0mrgfDKy0k11Rar1chEpLv2tZ3RoMMOm
	srJw/cnmYxL/QyCuHQJZvx23BAZ0VGPfnkHkmvFVO+JXIcjKzqgHZFqzuY3IhrxwCrkIjMaXYEq
	GihP2xccJPrkExIipDJFMBZQzRtf9x/8ylXu+aPO4Fdn6EgeYZmfmkgTzVnjI1op/I5B8
X-Gm-Gg: ATEYQzyOJXEEqWDJPhFrZ/7TIt7oDCKE2q9Yv7f3BqOzSjWYh0p5CVWTca2kXr3SYgw
	wyXd6zWFp3GkhsTjxk7JuHKIpRSTAxMK2lAX0oAiMvkWhFA93XXnhKxuowv8Y0akgudXiAirKPn
	iDYhTwaqMV/uV/kMUyIUh95Qb62oUNNlfQmXXALGPTN4SgPaGtF8ce8gK9K8fWoOXo4Jm8YhT3N
	jVWHYR3dHyy8oT2iyCdmUtliavmyxNCj6lEGMvdGS27XlPUgt+5EzmdLsyzjxBY9L5faVURzZ9R
	qJlIYgsvJd6UAWoigTpEyCf3igvMSDlgdRiJoYrVgKtJEk5StqazcpqydV1ftEjRI1/YVkDPbOa
	8kYnhjUWfheiDz7w1JSmyEmKgpFIW464s7B0UG2cgQlKL/sojHCc4c4wbhbAtShTLz/G9wIez85
	4JXRK7MWc/4t/fngVQuedrJSedd2RyVwll0ZY=
X-Received: by 2002:a05:622a:19a9:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b80cd0762mr88199681cf.1.1774498318930;
        Wed, 25 Mar 2026 21:11:58 -0700 (PDT)
X-Received: by 2002:a05:622a:19a9:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b80cd0762mr88199451cf.1.1774498318449;
        Wed, 25 Mar 2026 21:11:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52fb15ddsm2856731fa.16.2026.03.25.21.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:11:55 -0700 (PDT)
Date: Thu, 26 Mar 2026 06:11:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kaanapali: add display hardware
 devices
Message-ID: <aisc36hfwhodqbsthph2o6deattxhzykcyphhzjn2i2hf4fwx3@gxhsr2juqntb>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-5-70bc40ea4428@oss.qualcomm.com>
 <vqj2pvtjs7dgkr65e4mzt6ezoxgq5gl5kyxbbol3tbtvw6bltx@yhf2x7oix2ss>
 <acSb5F9gZAVg76V9@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acSb5F9gZAVg76V9@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMCBTYWx0ZWRfXyOSmfmDE0bXG
 7n9mitccUjNGh89xKtegbRkderz11d/RUh4n8GojX8gmEtNPGX5aP1QDllJ3huwOzq5nC0sr+j+
 qGZR1JPCg0cNQyzXHrD4Y5ydyDRSlUGjNxKu5+0xu3511ak1N32X5+S8oJjoPKUotq3YI1yvzS1
 IhB8/o08VXwNSyxr/za9b5j5UEOQwSFqEm3NUW/WUkE3R916ks+hRlpm943XJV4vgpAEHE0p11E
 k070fR6bA5Fd6KAybIHUEJYyJssOgjWKrg3Ls5IdOoKb+uOEAnKB0C7XSD6S1DPGsni/00RuYM1
 i7CmZXDKOV3jCjTt2xm0tgI7D8DXgduy+GzBU9ijXI91KyuQxvxbhYOZBjhAPlMy88ELiJg1Cpr
 7M4C5bSFfjpkPgbm3ThL6XIbzWSLrwU8nz4f2iXC3CNJYfOl9QNpr1S8qcE0BnG2E4OmkHmd9uU
 l2Odmyb/1zT5cyr+2gQ==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4b20f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=I_l-K_a_3XEW2LnFtesA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: QQzbYU00co6_8Q_xHIMr6WuBik_ty8CO
X-Proofpoint-ORIG-GUID: QQzbYU00co6_8Q_xHIMr6WuBik_ty8CO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260030
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100016-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: F305732EF4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 10:37:24AM +0800, yuanjiey wrote:
> On Tue, Mar 24, 2026 at 03:20:15AM +0200, Dmitry Baryshkov wrote:
> > On Sun, Mar 22, 2026 at 11:19:45PM -0700, Jingyi Wang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > Add MDSS/MDP/DSI controllers and DSI PHYs for Kaanapali. DP controllers
> > > are not included.
> > 
> > Why?
> 
> DP driver is not ready.

=> commit message.

> 
>  
> > > 
> > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

-- 
With best wishes
Dmitry

