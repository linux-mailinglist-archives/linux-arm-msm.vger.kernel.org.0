Return-Path: <linux-arm-msm+bounces-92812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON4cE/pZj2lxQgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:06:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B06E1387C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DC40301E21D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1C83644D4;
	Fri, 13 Feb 2026 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPdOyG5Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N1ZqfoG8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE89A34B40C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771002349; cv=none; b=GiajvkD2LS/5CRN3vdHZ20R51WlmYczA4QmawNvPdTlo2fafWx5kJWKq6ch6+z2NulsQ/gMXmkV3UQ0NdX5oza0pzq5xURqx3d5rIbbSrp6EhW/5f/aV3gZByxtf4geZ1iU+KarCu/KK2AHaDVBIEfSyIxcK/ZWlGEowbw0Wd20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771002349; c=relaxed/simple;
	bh=JaMWDMUvkCuT60rYSLNvS/Yq8InoIXkHAd/me+4HYd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLcuhzbBSDDwmDDniprD+i8qS8VlWCMl/femwjCVXxjuequWFvSc24hOJhw5ceMxqaZQAwHjPp4TY0cnNeKZmeph+l+OOphgNzdSHxXf87HJMhp8X3ph52VxGtKqMfwNpJRTX90dzN4KC5IeNHbTo3HwO5yDKBia+6g7i/dGTzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPdOyG5Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1ZqfoG8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DH4Xvw2733890
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XDtKK3ZwskAwrdTOOOeTaSJY
	E3ZqWCXaeiQv9bcxDI8=; b=IPdOyG5ZigUn+0A7Ttv/Af5/aKi/xn0o1+TqJ8LG
	M7i/meBXdF5V2SJg2I5hDjiiQtLo7ilaIV2Zu7qCtPhe5AczdwUXfh2/SoVtmRl4
	hu8I3uGESesoVJXocJvnoQB6+bHoLrPvjO63t219MqasFv7IueUlByH5GvbQjNSK
	WhEJFEqA9g27qitJf8ZEdJQXs1zWTmuxLnTGUWSB3pZx8GubZepBXVfyyK8voz18
	EyVU6stauuWkpG+iMGBqxT4AKoJruFpyI8EiutJPP7zTizPxOREINNtKIxkO1kpC
	IZNfguVSX34mTyriEZW2CpToyUP68ELp3BHDiiHIyyqwOw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wudth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:05:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5674bbd1e06so1394763e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771002345; x=1771607145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XDtKK3ZwskAwrdTOOOeTaSJYE3ZqWCXaeiQv9bcxDI8=;
        b=N1ZqfoG8B8flsxVyOuxzeQBWWhbIEO6h8rw2/ihc7W/uibrjSoY33hBw34k9cP9LSt
         t4L6nde9R7Gxf4rS1i+QoYoBImTZJxQoAdOAuqg1jtsHm2+fdu1yotYd1IAUw9tfCm/h
         GlNddZTzfUaVIXrvqf/BY972D5P7Ua5OQjgdKLsU4tYDgLY2G9nSTdnmBClg6PULeaf/
         UXJc+OD07PPAUWMr0nBHcG7XvrdFnVuUsMtOb8PmBfZpbKcnuXR39ILXioEWiE2Ephhm
         57HQvz1EMWZAT6Jb4tJF6S/4KjjBmp4gaZHP9EnJYEP0Th51PJ40VFMpHa+pLHUX/Dqi
         FtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771002345; x=1771607145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDtKK3ZwskAwrdTOOOeTaSJYE3ZqWCXaeiQv9bcxDI8=;
        b=GVhaI0PzDi8ZOuXuJNo+Qxx7IdjSg1XF+ay0FYFEjAZsncwC69sMSCbBZsKP5YzM6g
         jXBxO58KInOARWx83/8oipDHiHO/C2zYmTD1RTvarwpWJBpZcqZUptuf+tq4duDyrTJf
         QjdsKoqN0y50sJDVHtCzMc3b+Hzqeey7bqDTg0tNEojLlwEjb7y/EoRu8GP+Ns10yfn2
         uR4wt5Z1nP0okSOgPztXxdEnzpzGQY8C2sN3GgQFhk/979xY2ShBSptVgQaRVoZrvzlC
         9HWgNfg3+jiX8pnLVeBXvrsO9nlzn5R/IpwCC7F7jT4bzMrIPMaGjCtPmS4s3O8F5Hwu
         pTHw==
X-Forwarded-Encrypted: i=1; AJvYcCWZgNBqu2tI20e5UGvCsIWW3OBCAcpCBNI/Pm2YJ4W7dnLQ8JoY9u3ybroJVEFH6u+KKHJXonWihszgygPW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8W56o7jPji2AyNjGbQe+f0eq8qZtKKxl91t37Y2mXt4AYVVP5
	w+4jWWgBFSkGG1Xym3/878UW+oOEVb//t/f2FpP6cnvQBHpgq6djWOwq+gjrtBJZ25elbqz26eH
	3PHQu9I3mZb+mAW0UQ/1PI9XcdHEoOaE/OcPNaZe6O03SwUbXJan95Gb4hgbraVxnZnjP
X-Gm-Gg: AZuq6aIkVFmTEgJhmtj69yEH9iBJoza4azIjTHYjOCVTO6psFnRBjhXjn2ioVCu11lv
	nXvyOpgMmshzy+ZCFwFUg2sYXtIa8umhKhntuYfQ4ozaD5rWoka+qPKvYzQ+xuRV7VxDZvLoQJL
	ua8smGejfwPr1p8RYmjAmWL2LnpTyZx5+lCRpC6kM3/6ivLp3uOA15wzamLpxXTG+LdpWGGyWbj
	2cccqnCzCLMfLjnqusQ+vLO8A1bJT+DJGZSnHvaugIPxHXhVa0s2TYT1Vh06OQyLE8Mx3OpmWN1
	LQcwBZv6gHHIkeKEJdd7NoIbe+t9gciIO4vmwCyxYnhewtwVcgJeo7abW33C4ktC30JVtqvLWnS
	8HQHUygs3vZObSwzZQVoEUKDP1xqwU+HnKGeDjFKiyOTz4lghG3fqIF2YQLqC+Ql0vF5zglKqYG
	e9K5PBPpuskFyj7F2BX4JGCZfMtvpt7NwDQs4=
X-Received: by 2002:a05:6122:4893:b0:563:72d8:ea6 with SMTP id 71dfb90a1353d-5676a92860fmr865079e0c.10.1771002345350;
        Fri, 13 Feb 2026 09:05:45 -0800 (PST)
X-Received: by 2002:a05:6122:4893:b0:563:72d8:ea6 with SMTP id 71dfb90a1353d-5676a92860fmr864991e0c.10.1771002344545;
        Fri, 13 Feb 2026 09:05:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5df8sm13506601fa.29.2026.02.13.09.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:05:43 -0800 (PST)
Date: Fri, 13 Feb 2026 19:05:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maud Spierings <maud_spierings@hotmail.com>,
        "Colin K. Williams" <colin@li-nk.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1-vivobook-s15: create a
 common dtsi for Hamoa and Purwa variants
Message-ID: <uc3fzq7z7levfxeybetqh6yay37h6aqtge5kdf42zy5xayzbf3@imzp4vwfauov>
References: <20260211-b4-vivobook-v2-0-9f500415d2ed@oldschoolsolutions.biz>
 <20260211-b4-vivobook-v2-3-9f500415d2ed@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-b4-vivobook-v2-3-9f500415d2ed@oldschoolsolutions.biz>
X-Proofpoint-ORIG-GUID: 0AfhNKkZcSg4G_7UmlwKF8LTT-j0h50x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzMSBTYWx0ZWRfX+FDi0bVdNgs+
 HLvzhAyV9GAV3RYFfnUfKEjawUALfJPww8DOLJlXfsmYn6rGqn2EprBDurV8ZiBBUC+SxNsbTsc
 sZvbkPZbSfY18aEqiAY3w74k4v4H6V886sHk2C0Jl2cyJ4t16BaziWN2nVgg6h/kNVfN+N7f+po
 eGvkX4oYToJE4x2XQKoOqBmKeo0zkikshM4qkApRBHBtKzzq6IemdltthnJQtIeAKf9cKOB0WMc
 wddnMHg9ZuUPKhNCHj1UCuLmAYI2YF4tbc3tAARMofubYVzrsdMU4k4s2FZzB5KhhfiGF/FUUzR
 uuelGpUuw+PLKhAWU0BetSbVHggTazpXzc/Ko+taCAEA2Qq9U1Mcj14X2gxwpNsPXJVHNdOtNvn
 xoxLsuNOG2jUQZSYlYcSK6l7zJIH2YBFIZS7t0lnos4CyPb7n6d2zc7kSFDI/oucb2ea0Q4ZQXW
 D2nwkjH1QwgDCeuRmSQ==
X-Proofpoint-GUID: 0AfhNKkZcSg4G_7UmlwKF8LTT-j0h50x
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698f59ea cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gxl3bz0cAAAA:8
 a=MmgdznzwAAAA:8 a=EUspDBNiAAAA:8 a=pYpu7gQf3dW-m0xnbQsA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=kiRiLd-pWN9FGgpmzFdl:22 a=bHFXaHSPdiGCh6GRCv3g:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,hotmail.com,li-nk.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B06E1387C9
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 09:37:52PM +0100, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Asus VivoBook S15 S5507QA is sold with x1e-78-100 and x1p-42-100 SKUs.
> Put the common part into one dtsi file to be included for model-specific dts.
> Include the common part in the existing Vivobook S15 device tree.
> 
> Tested-by: Colin K. Williams <colin@li-nk.org>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  ...-vivobook-s15.dts => x1-asus-vivobook-s15.dtsi} |   28 -
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 1425 +-------------------
>  2 files changed, 40 insertions(+), 1413 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

