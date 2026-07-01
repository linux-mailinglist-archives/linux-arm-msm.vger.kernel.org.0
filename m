Return-Path: <linux-arm-msm+bounces-115609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SG/VNP/SRGre1QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:42:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B16EB37B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:42:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pZjTlVP6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VjhGYCn8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115609-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115609-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD49D3028C91
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1661B3EA967;
	Wed,  1 Jul 2026 08:42:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB303E5EC9
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:42:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895357; cv=none; b=LRN+AFoQTck8N2Ynqq9Dt3572z+CvIP1MU0IMpCS1gaEV7yMpyKxr3yB44m4x8tWuBhcwH5IsEMpfViOG78ltsTPmjPOXte0WCB5LToOFpRlyP0Yx5DYTGnv53krrcAFKWrvH1QGpgTQPnXbZezgHxZbwUoGDhXUt2TXwMyRRyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895357; c=relaxed/simple;
	bh=5xMX/jS64sihrUDNVUY2o5SYi6XayswfcKqfnFSmBXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bn0frM7aXLyvck9cLTTAH7arZPfr0BJjCUCuUqhQJrpcUpEmkoN9ZS8Cf7ETQc2XZnx6Ew5EIdodZkxo0czjbtzfPjQMuayVCUEyHbndGiMjHxpcB8fZtB30qZwZNkpANNanCgc6baCcUW260gUJvYc/iiKt7Sy0b656OXeDKv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZjTlVP6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjhGYCn8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GFjo488426
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ubvpnL1jK75HS3RX6DuGp9XR
	y8g70A3eerKMwr4sygY=; b=pZjTlVP6kZm2HvjDT8kzP7Rvsk0NwJu7lNljSR0l
	Ayr44WETuvGytyea/h03RXO0G2WxXa3SUmdB5isJgf5A/gAzcRVeRvwFCegXY811
	9hzIUFbVNIHde1jKPPnx3ShMr8IgYe4n8QzUiGuxhnTUSU02OGJp1Wk4PGNI9ORV
	t8fXcwwP76odiHdRV9j2m2oowF7i11ewG6r3+VWk0Z7cawFRFFehcYeXY6/kR0z8
	wy8byyPfiJRGyiBnVh4NnU42VqzyxtynPAhSl/ZuQca7K89bT/2ihqSGYgd0uFoD
	tx2+LRu89XJMNU2lQZNYDxgYl4OWQNXd2OFuVGxqtUEJ+g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy1quw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:42:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fee8a7813so500372a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895354; x=1783500154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubvpnL1jK75HS3RX6DuGp9XRy8g70A3eerKMwr4sygY=;
        b=VjhGYCn8l+o6+1vuvOgF/ngDmFrVko/6rfWOj2eulfSXkhHbxyjjJchufTgSUUrnSc
         G5+kbwYBjAFkgYn1kSKVbcHZq3VfyNhPzfTuCmy/9pSm/7afrAvKsnlezmSf7jqmA7Y7
         dI2cRtZyKL8pOIOOsK5qJOPp3g+qATkNQZbLpTsfcAk7fkfjE5Hu1dIQ3Yw3kX/r0Hyk
         Sf4Q+CVv0mtwaq4dvKRlsXK+R3Cm2DO0jn1ClcinO4zuFSeXbuNIp9C0/OqXF0ridnsy
         MEX3tbZe+LTcwTkN5c5Kr9GPGcSDedwZ+tQb/AVt22TFcQ5di8+J1/KL4NDbEoZaXMYb
         bR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895354; x=1783500154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubvpnL1jK75HS3RX6DuGp9XRy8g70A3eerKMwr4sygY=;
        b=bg3zT9+jIimZTU3c1CFox4rVT2NABOGL90o8+vbNcMhR/vaWZRHxC/c/sXk9ILm6U1
         NlgDEyvyxbIN297EZhhlvvSZh9RKZRRHra7dLFSPA9B3PugTA2FbO0nb0DDl7kZ5wFol
         EX25Oeeha54hdz7F3+mCnlpWiE2XqDM70mf4qF2HfMyNCgHFmcbmSAkVcJPz2CuGqDjH
         2/LLZ1f49LAjv7B4M086X1s3vqLRPev1J2JNwOICJbgUBHPd88GxL6GM7Iq7RHxBQm/r
         sMPOkb3j9FaSfxg2dntejuj831U54RgcAj358W57NulBqwISqMeYof0/gC0TiBhu29n2
         7XMQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro56N+3o3fNbzfQxUNlnGGUvmbVF0kRqUw0FQvhmYogFCsvdZUN7F73IzuynjyD1AedasEEexkRUS760zxb@vger.kernel.org
X-Gm-Message-State: AOJu0YwCY3UK/+4m6YcIHw5gur/0+ngZotlly0V7N+f3wExloj95H/C4
	gu8JpwRmXL7yh/O4JU/hCEuthkN/imExMOGi0PQtvLYuE5YGudzvi80UBjFUUbCxNALw8r9I4iy
	PaLQFILZbBYlu0djKYybQjqoXDuQzMCjdmJotIgd72q+vXsYm/WAtt24APVgpPBAtrGuN
X-Gm-Gg: AfdE7ckXy92n2LoBp1AoheR7cbSKIRKu3TMDivmUCVJvHj1FrCaqhVIlwsavlVh2bb/
	X0hfVUmfMjGVYDIkk31BXyVVAxh8Bv/RhkTMupk/9VYQLlCmnCaPH3nkjfVnPEYJiJBM5Ao6OyS
	RZXt016+jphQqI0nTEbdWq1GWRU8CIw1T4p87TA3y5+FAKFXtpCvDRG4i0Iwhyn+U7uk+4zGm4+
	ZKuOpdUnbga5Fqme1MUN8SSs77kileoxdVkV2TF3akJvEfgJS4cGAMHiJyUSU0xNMBOaMENx5C8
	3zw66sF1eJzq0mGB8jzUca6nr5TypniV075HgWyy2oz8RC5Pt53Q2BkT+iaY3pSg3QfI7V5XPhM
	0ipt7eszOhbVTCxObXZwpFlvlcC5FcDdoVHyn8OY0dnuHAw==
X-Received: by 2002:a17:90b:3e8e:b0:37f:9ce0:af36 with SMTP id 98e67ed59e1d1-380aa22ae2bmr738381a91.33.1782895353691;
        Wed, 01 Jul 2026 01:42:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8e:b0:37f:9ce0:af36 with SMTP id 98e67ed59e1d1-380aa22ae2bmr738351a91.33.1782895353223;
        Wed, 01 Jul 2026 01:42:33 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382bb30dsm27935845ad.68.2026.07.01.01.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:42:32 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:12:26 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V1 1/2] arm64: dts: qcom: lemans-evk: Move SD card
 support to overlay
Message-ID: <akTS8j74c13kvJIQ@hu-mchunara-hyd.qualcomm.com>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
 <20260227102405.2339544-2-monish.chunara@oss.qualcomm.com>
 <c2atmwzjfw453hgmjava6ygs5tkvxg5lic5ss5jnhmxbgsr3b3@afqveapmmo7x>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2atmwzjfw453hgmjava6ygs5tkvxg5lic5ss5jnhmxbgsr3b3@afqveapmmo7x>
X-Proofpoint-GUID: IRgpWCULexCM-VmZZqmN7KMk0-hNHGHz
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44d2fa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=WvwDqqP-NZ-AofKDq4AA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4OCBTYWx0ZWRfX/6sBdjFFQP2K
 JMf8Ua/nDOfGYluWb3l3ht5CjVY4TZbnaxyBgxtZ0zwrE34Eooc6SB1VeAFDM/WTpK47cZrHzX3
 ZISEAYsgGIqtIZNbo8Yjo5NWdehWXn9w+A1e3Jd1MCPzh6S24WT+IGCY4lnH2VwhdMgMsDKcR+e
 EnFcgSJT/91lxtCHHqi8sRjMzX0eqw9gqOuTwDyo+qhYrEjfDnTAJG6qCCLcUkpTkifrTaBmK2s
 5VdmhXkd7AR+WoDtDu8LjzUZzJePd7ptZXHQwhaZmCQhaJ28ctJ4snQ1SlYeUPZo8I900V3iv+8
 YWYoQbdM7sE9xleYY/8fy5gWeXzrWNAmAeFsxo4By8sZ+IBpB07tNYoAblq7nFs1WivqPWLZ0Y3
 uTJKKPy5GzdlviQ8AHbN0sM990lnU9vGk+PghI8Qb258Bp3Xtl0NBodb77ARnUaqOJM9pIya8iH
 WkXY4rCeRceqiDDSZlw==
X-Proofpoint-ORIG-GUID: IRgpWCULexCM-VmZZqmN7KMk0-hNHGHz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4OCBTYWx0ZWRfX8EYh7QWl9oL2
 Qp98IoR/9puzDGekMLtT0cSrcNh+6LH/SuKhW0kx5/tl2VpAqyLAP9LSNNL9YbsWyO4Y2dmenZG
 /uza2ySrwFRAheJho/EnwfMSLaMcsp8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115609-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-mchunara-hyd.qualcomm.com:mid];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F7B16EB37B

On Fri, Feb 27, 2026 at 10:08:03PM +0200, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 03:54:04PM +0530, Monish Chunara wrote:
> > The lemans EVK board supports either eMMC or SD-card, but only one can
> > be active at a time.
> > 
> > Move the SDHC node for SD card into a dedicated device tree overlay.
> > This decoupling allows the storage medium to be selected dynamically by
> > applying the appropriate overlay for either SD card or eMMC support.
> 
> What is wrong the SD being a default one?
>

As discussed, the recipe changes for FIT configs would ensure that SD card
overlay is picked by default as per the default DIP switch configuration on the
board. 

However, due to conflicting properties and dtso limitations, SD card properties
couldn't be added as default in the SoC DT, therefore shifing it to the platform
file for better handling.

Regards,
Monish 

