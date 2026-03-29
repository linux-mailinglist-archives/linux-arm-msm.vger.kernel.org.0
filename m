Return-Path: <linux-arm-msm+bounces-100591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1E89Iwv3yGmFswUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:55:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21113351796
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57C86300613B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 09:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2038A308F23;
	Sun, 29 Mar 2026 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKNamHwh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsP4BYYY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FB3033DF
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774778119; cv=none; b=qdYbUDVycwZR7t7TCfXNCIYonXpooQA8vV1QwjVor8KTkq5aWLJj0P9G/n8R7xC4+ZpeixTxRS+8nhgIW8n8mloqOHbFuKnp1GDudUQTwgb5vUwquLd7WG07dSno+lNqkMbq5zGA1yY7F7cNfgz70vfK6sH7vsE7O+68iXsCbtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774778119; c=relaxed/simple;
	bh=hKYMUQhPlD+FcxdSRmVqJEFjcEhfYuTKsWc2YQyjzN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYxEtnSx0grO1a6xq0rt0iEhZJzqvZoHqzFkCoCXAAg8C34xbT3xk8v1jTnGKh+tli2uG9KZHYqPwYVkNyJABUSXyQeEfxCJa9vRo1JMJPw0/dgfBwhwOod/10SS1VGAn+yoc/CafgqyzSpQG7w391cxmSEJ98NO/40q1TiB+ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKNamHwh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsP4BYYY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SMM47f2450929
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xdTDbVwnBwJPE7K6myDip/i4/5A23VxWLZ+PE6E0ew=; b=CKNamHwhspxZYN7d
	hfY/sU4jRhBZpXMyojnulZYqq4L8Gi/2pCJfCVg9UFplwydJisHdpEXx1LJtkmiP
	Ul4Tij5MEE+bHeJpes8SVxs29xp7OWjJR76eWAyhpFfKZejxYUjRmJs6xRx9Jg/K
	Myd8ipYKKKQZ23Wn05o7tUFn+H1keh/xQoN/HS7NMng7KApdUxNtbfADkQptZ6j4
	ixkGbMDwA+XlD8/57KA9ShgGrTPhVGmt9iyDHYHYlWc2ulKLdG9q9L2HNWVA0wl7
	GY73es/J1lLU8+l9HFlRBb/TXY14LzmSzM48XM4uhU+otPfmrCENjqMyyCBjj+Ba
	EWrw+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pdaukm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:55:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so87353691cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774778116; x=1775382916; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2xdTDbVwnBwJPE7K6myDip/i4/5A23VxWLZ+PE6E0ew=;
        b=bsP4BYYYgGsAteYG1Nn/yaOg1GWn2+02FfQ4IpsnRTRVXZ25ig9Q9s42utGHIpj3l9
         wLnWIgPNC6/p16d7LytKjAAnQBXKTQK1qhO+T6faPo8a6C7Gosssrm0C2mcnUNyDaMNR
         LA72Ygyal07mWy2WLrqWv4tmdtsOPbg61/TDooRAZd+7Hxm69C6Szx7qeEVoK850LIPY
         VVuHs44gUdJ3qVD/EXcEZqzM7dtGMpb/qEaDpuz2WBIG7Plj5RQLWJHh1Ko7M3qzNHGv
         HzrR3fUNImg9bWMLZwSH5lokcEuhnuW7GyYe9vjVKjoryD4YjUI7ZjQPZA2UCe8iKD6l
         OBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774778116; x=1775382916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xdTDbVwnBwJPE7K6myDip/i4/5A23VxWLZ+PE6E0ew=;
        b=X5Jclcfo5i+TvQonZtAecoSV3bdTB5c//+Uc9MAnnwuS9Wx40wJ8PA8tYK75MocG3z
         0CfJ7ZWRmec6uwg/5efvFtjFmHGXgYhCOm182D9P8WBQt5JaHWsNREBnDzGchalIATI0
         ga5n+aQWcG0IQcVPS0fakVA4aFegvY3Zw5hO4ekM6wWYhp68jsSsp4HnHR+WC6b8ibsw
         cypaAAbYe0yWJgdr5WVLJg/QUrI6kkGesjmY0By48kfyIY/R7OBL3c90u9H+SCnCt1/m
         gQaNgd7Q3Mad6oXJop3gfnmhM2Lw+l0X1z+Q4lso9Yy4x0uLZ3l5bXA4qAkkJNMdWCXS
         GJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAzCNkkDBEKJJZLsScKMMIKg9u+xMR4wSpxlzH1/hgxci1xUC+YososGauurFHUYEj9jakVYGdf4Y/LdA3@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4sKkIR26YtT9JpPkUdgypkkFoOvYZBBH7Zn+bIbOlrdphCK7
	oOoXEDr8tjJCPwSbIBwAxQ+AHqVzBLEGxsZJNPBz4CP9RgfsBYBZF/0AVNh2ovEl0RkEh5olzaM
	VjoRNPLAeYcrxxa8YlLoSQulx60WxNgjxTcYXLEgd3h0xKv1niB0xcT/oXpOozLbNGLeU
X-Gm-Gg: ATEYQzyhOAyDzVQYmo7pdsVD+ifpU/FbtT1F19IV8WglEjRd8dzShh0I6IskzamNM5b
	JZ8T4G8UfJr8iTKIKIdOadk8mD2avHNnHh1wU2MbvrH7MnvFAv44I1ALVdEAItcF+wOuPKata+D
	RGQ1E9x3UWFY/hnaMcAuF5Nso7o/vPqcKxZCeICJmqXrd93Od+bYbAIOKdWY40r6MErgu1RWuxu
	LI+q6LDuHMmIzlAFVlv7FQQeuOmlh9GlSFWXdytJnGfERkMjg85qY/Bgl1f7VhnbQE27IUTYmw4
	ZVpArLXbBofVxc30f3gnEiulJRKrjvbw2ObczDzKt+ZYqtveZ8eXigb6BTgLdRLYI7EoTwwshph
	h6ka7vV5xDhb4DcuJVMy6ruWJtG4f4Ykaoo85xtNQDCvOYTTD1eylyBA/L6j3nueF+o+Gx1zHKB
	51lLHN5XIIBReU9WHxyl+Q2YGER5GJ7GQUrxY=
X-Received: by 2002:a05:622a:1c1b:b0:509:4b11:6d0a with SMTP id d75a77b69052e-50ba383e35dmr123129031cf.12.1774778116099;
        Sun, 29 Mar 2026 02:55:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1c1b:b0:509:4b11:6d0a with SMTP id d75a77b69052e-50ba383e35dmr123128901cf.12.1774778115649;
        Sun, 29 Mar 2026 02:55:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8370dd5csm8686951fa.11.2026.03.29.02.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:55:13 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:55:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: pabloyoyoista@postmarketos.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm670-google-common: enable
 debug uart
Message-ID: <hbghyf4tj6g6sagmarg2tkps4mxaoo4cqj7yjupucvsepjzquj@e54bw7imsfmh>
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
 <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-3-53abd9db8f0a@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-3-53abd9db8f0a@postmarketos.org>
X-Proofpoint-ORIG-GUID: 8Xwswp2pjUoTasstUTbao7lZ3zVpxmwe
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69c8f705 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=qxnbJ2uNi6Wp-GEmhAoA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 8Xwswp2pjUoTasstUTbao7lZ3zVpxmwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NiBTYWx0ZWRfX6t4CvKd2A9FC
 NlhCQmO5wtpUZ5tabmYeTm/o/S4JtU244NAn69guwHR8/FTlEhQXmK2i2iB2OPa17O0QCszV6rJ
 VWlKplE+knDf1Qu4IFRVavZwTwPFwWP4oB+q3Oshg3Q4Y3MgxpiitUjJjbFLHw9dP9zQ8T7QWnU
 QdN2NPeZ3zTJTEUi8d2YrzQCGD7v/6aPawqlkKGmKbM28wvanWMwux+yvO3C5zgzNF9Co1tr3k4
 AbexHI4/XEkgJu90HWxlvG+rMyOWycq4SgovqjbcMYZxHITNG8pBoQocid3/nj0UEprGJ6FC4SY
 WRMYwoSum7tGrP7m9XLilKJ+zmVElIDjBozQztKs6nR3k7uSir96E0Lq4jvs+XxMZ0K/r6SpICj
 Ds9ki+t7yAdq7rXw4V7FyllK1H6AxuMBV/dKRRL5JwFF/VABMRaGwZDPfkokMHG2YrWUZJLzIYg
 S4vAHmMYxi55fZR2IkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290076
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,lists.sr.ht];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100591-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 21113351796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 11:58:42PM +0100, Pablo Correa Gómez via B4 Relay wrote:
> From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> This has been tested on the Pixel 3a with USB Cereal board
> 
> Depends on
> https://lore.kernel.org/all/20260310002606.16413-5-mailingradian@gmail.com/
> 
> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

