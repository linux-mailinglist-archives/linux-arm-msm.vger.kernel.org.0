Return-Path: <linux-arm-msm+bounces-107542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKcYNLl3BWoaXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:20:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67A53ECDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4300730166CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 07:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8B3331A66;
	Thu, 14 May 2026 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DC3PDAWT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+/zqqOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ABC3D75BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778743222; cv=none; b=fB9JNBPyYDTuG2cjGdREr+Ut/JcddLiLnO5vnM4a36Qfx1I5y3UuDhkccwpRrF5Lp6FInbPdXnWSRdnvOdV0Rrr32DQsgMHiF4Ey5M+10DbDMba5gUP4uGcr/wfkvUeSMyUfwgSkxWsTfTNJJknPJHLoqOlu1UcgrYO0CQ9Gyy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778743222; c=relaxed/simple;
	bh=sz0PagC+xrsAYD/iccgzajP7BdAoD35WehWbqXyLlyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Exzo/xNAZNVosI0ez+HCcTnMsmgaLZEselJ6EIHvmsURFUBtzK2H2fk0T++SD92wLDqAPoVKjT2FUd/g0l8X+5+p34mHUveWNNft47mwsfH3TxUXq9YRnpbOQ5Vtxk3DXCn9IAUxDWnGerm07JsyjRekWtNhY6WF5I7SNBlL8Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DC3PDAWT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+/zqqOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E56mJr828359
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6ixpOPWUsk4SIfz2iEq/00oC
	QThu9qSNMayoJJuninQ=; b=DC3PDAWTGaL3gB5dhP46bBnI0NGYHx5rgy8rGU9R
	/n0lQ45zVVA0m89AiGpD5LNyaui5Jy+TdacyTaTymQNRzVrh+gHPuzLaMsg5YgQb
	qtH6e6VUbUlKN7ZWXJYoG3dEvAObGRXwSSuTVypHd86J4gxgdP2rEAOvbd9EHpaJ
	SZObApTAwPE8to8vaA0pQyt0YjtXN/vH8QlpbgAq6vO4Zx5WbEh7hczMLuCIauXk
	UX5YH0pAt83IVA8j9nUqkf0ipMcZAFU2QSwdnE7xOc633dvq+3mKA9RWqiHNvXdS
	aEsHC3fF7rDHy3tF8aaysgOXG3zIvNzoCc06s9i/y4U+HA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7gdhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:20:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso11994946a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778743220; x=1779348020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ixpOPWUsk4SIfz2iEq/00oCQThu9qSNMayoJJuninQ=;
        b=R+/zqqODODDqLYgTLgcdgtiwdaLnHFy+vbml0NWZNyHjAKC2WPX9cpQ66crnqBkgjC
         ZvwiDID20zhcJF9VF8gPbCM8X6VMFzgSgIblLuXIUdv8Nfk6JJj5KWtEQhoNhXhpGrNq
         72+jQ2dSXeIrpd3bVEyg0XHMTeZZZv9LCk/258oedVZ/hJ1lQOkWJflSY/5YfT6xe6If
         w0QTivvECFQvl+9/h+qz7ZiSjHB4guReb77ogPRKG83zrF9+LEEy6HroCeO7gIryc70a
         zP33wCUKf2xjtEJ/Ek6E+f0pVYvMKkt9U/uTxxSHPVQa+I1HPC3JqOGmZEEpYdCldJ1+
         E+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778743220; x=1779348020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ixpOPWUsk4SIfz2iEq/00oCQThu9qSNMayoJJuninQ=;
        b=DahfRIuECov/tjwfcKgvzRyUhVR7rsEavE8vlXFjm6UPImborQpxQK9XtWNNS3sPi/
         aqdn7f9TM1zoKLdBB4JazTtZpxHvAu923hqcjPs/g03VuQXbIQc2L3jH7MyysXTlHPZw
         vYSbqD244a7SzhxthyitYe0PCAlXp/FyipySxQf18jmsfoc/eDRGiJaBdRxEUUBFGOen
         8OOFL4tD82qwS5icRbZImJrV2Ghso/IVfkmNVbLuyHDNw3hiBa3adOF9jNgX6mMyJgff
         FU6f63n4fc9P2PYCDTIO98JOVfzEvklh8bJal5gjFSCPrz1RSVeGzbUvEpK2QiLL0H8s
         /Vaw==
X-Gm-Message-State: AOJu0Yye51CG4cY0Nn6iBG8s+Nz/6DWLA2YeAPePLsk3aQ8FbjGjykQ8
	N0sCD/r6b2TEISp/nZicMMUO7hDJqj5B55lR1TOLjBv+Y/Bx1+Uera1bd43A59w0nUgQRiZ6O0m
	nSU0SY9lAgqXhEYqtK96SFKShWpTCowDBbc06SQRWHBXZiWXIIj8mLsUfuahDPmKkPV8a
X-Gm-Gg: Acq92OEiGxjVqGetKn1ixPQYPvJX7z6Jrb4vwqYeEL8dTDmVprt1ymlbnOjccorSg3J
	5/ro6/QLhhbXsG/WaD4/S48f3kXoU+Ed6e9eLOnF98oARxPPFHJwxXV0VqTLwN9IYCBVesUcEKf
	C+vZyUuJeJog+o8OQjk3Lg3Vjq3V8cfGCbO19c3/0QuyQj/Gh29SxFMofnFnLV1sPvUQGha/Ygg
	cqRtKa65ehcDDjHsq0usUSxCbEXpiJ5JxJoh6iy+qWNxDgotzTChfispJrE7DdeQnmk7H7BgBCR
	/Aev3HVjq/iT5G5KN+QdGYVRaNB7q26+r9gEqudl4BpWwT3f8pls6XRbiRgHluRtStaJ7kDpxVZ
	i1as8Sc61nLKbYlMXX520+h6Q/BCMl4j9mM7a+MtKb7mG+6Xc
X-Received: by 2002:a17:90b:3845:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-368f3d183f3mr7267862a91.16.1778743220056;
        Thu, 14 May 2026 00:20:20 -0700 (PDT)
X-Received: by 2002:a17:90b:3845:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-368f3d183f3mr7267803a91.16.1778743219456;
        Thu, 14 May 2026 00:20:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692e706875sm1678572a91.4.2026.05.14.00.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 00:20:18 -0700 (PDT)
Date: Thu, 14 May 2026 12:50:12 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Hawi
 Platform
Message-ID: <20260514072012.acgmmzdo2aeugyq3@hu-mojha-hyd.qualcomm.com>
References: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zG7K9tmKP8_BXBMnZlj2ngFTNYzlpTFP
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a0577b4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=knjUYP8iK99Px4kpKqYA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: zG7K9tmKP8_BXBMnZlj2ngFTNYzlpTFP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA3MCBTYWx0ZWRfX7RdOtaHN27KH
 X0p2XXqChSoyAAJ4lNGeHWNxNWSvQSXaQ60FQwDe7LXWvr2RoAW2h93Nb7UO3Qlp4UcsQhODrnC
 qcKATKB13+AAVj+pUrUgNZcgOU1U3zJ/fMda/HfENM6tTHOwlJmoscv8BECDFZEne5itdJRGy/U
 S07TPX3bgspzW9PSpi2lM0BjFREJyHXuTjFRd/7MlDvsbjo0fIj88lCLx/SSrdnttSc73cyZxvW
 RbUbcE5gATymjDUjAYDNd1h8eazLfC14iZKwgYK4j8vebLmur7IA1eP0/pJox2oPnNw4GBxGFSS
 gV0y65NE64miC8/Tzjjy2x7rpWe3ExVAyjQSvudqN28oI3YaPgjl+Gvi3G5gl+zrtqZ5wkTmCog
 TkvWnV8LxZZiioohX1dY3FWY79QIZkIDs/aIaToI/yZ1vi+1QkBtKzTvYZYw1yktfIJMaf+AMAx
 ysZ1PwKEs8x9sIeNvVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140070
X-Rspamd-Queue-Id: 2F67A53ECDB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107542-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Apr 01, 2026 at 06:21:26PM +0530, Mukesh Ojha wrote:
> Document the Inter-Processor Communication Controller on the Qualcomm
> Hawi Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 7c4d6170491d..7dbc3ac6c5c9 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -25,6 +25,7 @@ properties:
>      items:
>        - enum:
>            - qcom,glymur-ipcc
> +          - qcom,hawi-ipcc
>            - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
@Jassi,

Would you be picking this?

> -- 
> 2.53.0
> 

-- 
-Mukesh Ojha

