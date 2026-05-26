Return-Path: <linux-arm-msm+bounces-109711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eObaL8QqFWr1TAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:08:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0315D0BEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DE383014128
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEC330BF4E;
	Tue, 26 May 2026 05:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAN/mDTv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ch9OeED1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995E51DED40
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779772096; cv=none; b=n26/E92aeqAojWq8y+ktnT2Vhfsg7YSZX+UZf18lDhDJFtLDrRyglQoWC39dNxf+oDCvtku+8eTwnC9prT0sEyu9nVwNmvupUf3HrLuu462tffMIlMLA1DVrFd0o4f5jqH5uwSklHgAY4LWrqko3umatkkMvnFpSrIo18bBkY9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779772096; c=relaxed/simple;
	bh=we6KjKDhWaiCw1Y3DN0Qx/Dz1R10oeHjWkhFnTdywyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fiqq9we6QbvxOeY4gAG28lj4NraJbN6/r+TPsMn/KBn9p4gLyB7SaSHVq+cZmtuO1v+psasPQCRw62YR0iOIrPYVHBBGh9SwhbiOHqOw1yRgN4psg9OV0ElcX4SdVCzX9k86FU7eYb8LodOfm/UGaLsL2+ob5DKempRJ6l9l5hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAN/mDTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ch9OeED1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2hx8s2822461
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xeq41+7z/tVXwb/S8mR07X8m
	Ys1jO7mkzHODLFTFEjg=; b=MAN/mDTvVvgqizzCvkCSM0m1b7HylT0q+LF3vtTp
	Qj2eg75SB/1yzAYsw3iQC3rYcNHlzKLOMAiA+cvPQsg2SG1T/xyIB8Yyqp3FFFN1
	9hVbY7jGNyouQtdEcOUMCEdCd4dSIq+Kz8p9/iJpzXAOp+R9SQm2qwqrWVr+B6DL
	+haN1QjvvGQTOlscwGyYn1h+89XXethHp1MUaNGd9WJO0TzMGvBNCFydlpk2gYva
	9Pezslp/nTu4XY0E4EHtolNbpxAbQ20gqUwT5M3InbZxB5ugipLSXPMU0U90Y+OC
	KAnrg2tdZ5uWRUYbSaIB1k4rFQeSsy75FDT3og/+sP67mQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwt3t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:08:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13312be8a31so1629467c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779772094; x=1780376894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xeq41+7z/tVXwb/S8mR07X8mYs1jO7mkzHODLFTFEjg=;
        b=ch9OeED1uD6mu55eYnot6+aFBsu6znGophNMIveEMlSANRXTwQNiQZnQms3Ziqy1CP
         u8eQu7VYOKcuK3u1y+TLRWvD1Y2j+IInAoGE8bz1f9XAijIPL0JfjR1Q21E5X6PC7J+y
         QMuH6XHGFjCZU1v7xGdgwMKxq8EfYUhTeL51K/U3G4ZZK4R5x4/bKvyD1vvLqqlg8T2b
         WfvZmuE54/4HHg5oDS/glkIMhLmR60g0VsN8LrcJCaE5tMv1e6LmfJjwheYSQrgm+Smu
         uHWF4giiUmku4CWwEmG/DZSfKBo2xvHamvPWG1IbTOiZbWocngQ7jrv0IQwWzJ3rxBgY
         o52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779772094; x=1780376894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xeq41+7z/tVXwb/S8mR07X8mYs1jO7mkzHODLFTFEjg=;
        b=Mejy3nWZhRY24Hy0pKFlVmL2oG66G2hqNfhqaRdKcSNIH3jKIrYzPV/aGUDjTAs0j0
         KD5fdAykdI8C7qgytd6TpooDw9oAKEKvtor/goGF1f4M7G/kYKceaSBMLlDUVaxDE2+x
         gG6QZ4ABI5QeYKbnNyms6TgPGtVq91hJ0/kavthrLQ3DmSGSyYNK5PhoSzibrpqCUJoX
         177DVXrtAL/p/ubSS7qt3woxjb6eQ770UcFP4JMKoBH8vyNEyFExmS5/9mn0CyyhOfkC
         VdyQm5Rnj4TmCygLWxbfxG5b3Ywbi/f83+IcwdRqs4exZQIMu5DaXmTIYe/DhcqbhaID
         luhQ==
X-Forwarded-Encrypted: i=1; AFNElJ918QrjGarT/yBQYlXs0re4bfNMVY40AjjY41VmzEmS6auQ7fqX7fqc5Q0bfN6BMwrmOCAGfwGvmKNVQ4Uk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa/HwXRIXHvxfhCQw+vciBo4wv38BBbk8Iy2AF5YzI9GLiu8t6
	6pS+Q8gHhF7ZiNxzlTRh0CDSqhySu/QZMyevg7Ae9la11+3gBOIiDIxFjPQ/+AIp0stLTng2lXC
	2mLP4ukSdHpVlp8i86NuEnAptkb7YFF9hW6evPBlq0egnRKueeJQr7DYUHQrSnhwKmVfg51OV/Y
	VW
X-Gm-Gg: Acq92OEWJhtRjqbWsPG3e7Mw0uIHP3tupfEJdyreITYhLnOa83osNeGdP+swHjcE5bf
	ug8HPHwBHy/eIUYrlu5qZ59CSQ+sOO7anXD4lSwFWvE8oETc61RJubzf4/DZjPWS3TgMTY3AYFy
	dwVwocOsjwKZoqZYWyA5e6ab0U4SnzBgKmuBX8DFYYGCN980oU6lRwcNem+gqhnuZ4uHwPbf/+v
	bw0/5IhPmwvrd2o71V4GpiYdxsiQo6g7n4NA13pUWxg6Y3YjH7iuP7ryHR5/1+k46ioYa3+dkeD
	fjsAWhfFUW1kwD9DK5JrYXz1AFMdOCpb0tePPeMzShYAiKGFfMhiLESG/YkSZVqP709cR6yR6Eq
	ioXyFPmoBU0hR5jAo98NilNJvZ026pMScRQn1Enf7new9VmW5CKJqHsolaG4qKWTJ0ls17jNeBe
	U=
X-Received: by 2002:a05:7301:4181:b0:2f4:3a9c:8193 with SMTP id 5a478bee46e88-3044913e776mr8443383eec.16.1779772094133;
        Mon, 25 May 2026 22:08:14 -0700 (PDT)
X-Received: by 2002:a05:7301:4181:b0:2f4:3a9c:8193 with SMTP id 5a478bee46e88-3044913e776mr8443362eec.16.1779772093599;
        Mon, 25 May 2026 22:08:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230b25sm12376866eec.15.2026.05.25.22.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:08:13 -0700 (PDT)
Date: Tue, 26 May 2026 13:08:07 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Add initial device trees for Nord SA8797P
Message-ID: <ahUqtyGz4FkXTJMF@QCOM-aGQu4IUr3Y>
References: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526034557.1669007-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: iRboanf8_cv-VcPS4-aXfVaA-jL7TuHN
X-Proofpoint-GUID: iRboanf8_cv-VcPS4-aXfVaA-jL7TuHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0MSBTYWx0ZWRfXxS/lOKw48LAF
 E1AdabZiwW17kKbt7EFT1JEaiSsfUbIH9rNWcKkBH/tIVxijwWN3WH/Y3D+73puoNWozSk4uMos
 ZPPreP2NyrkkdaJoj7JKgUy6HGsmCE7bBR+d3NjLPt2co4Z+AppdUI2ROwdRtC0ZqUoRhxMKMxL
 k1HNiFe3e5J33wg8oM9dWA71tI0Fq1/pUxh9P00It+2qAu3n5hW4QgmcamDJkgw01pyk3bA1k9P
 1hjieJr/BoWHPuyNuiy8PTYisEDjiGUcEh4XDS1IpqlYVsDyMsx3jsr0OrCaF/WnSrHJNRg1XsE
 Yoh2Il8i2YEfBlTK/grejXuh6uCwjdIAVqapJbj46BWF7KyL2MurnfF1e+3fykm9p37xRGHJNZH
 yIsmCty03qdQWTKEIWFF1r+fZVnb4mYGs2juWNAgh6l5olYJln1eBB2aAg8SdiK4G9HnmX68X1v
 WIGuTfZekqfV1ODIn6w==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a152abe cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9JTcp5UHuzCfzI7zTwkA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260041
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109711-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A0315D0BEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 11:45:52AM +0800, Shawn Guo wrote:
> This series adds initial device tree support for Qualcomm's Nord SA8797P
> SoC and the SA8797P Ride reference board.
> 
> The Nord is a new generation of SoC series from Qualcomm built around
> 18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
> is the automotive variant in the family.  The IoT variant IQ-10 will be
> added later, by sharing the base nord.dtsi with SA8797P.
> 
> Dependencies picked up but not hit next-20260525:
> - TSENS: https://lore.kernel.org/all/20260504081236.825755-1-shengchao.guo@oss.qualcomm.com/
> 
> Dependencies to be picked up:
> - RPMH powerdomain: https://lore.kernel.org/all/20260414035909.652992-1-shengchao.guo@oss.qualcomm.com/
> - APSS SMMU: https://lore.kernel.org/all/20260519013950.873105-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v3:
> - Rebase on next-20260525 and drop patches/dependencies that hit linux-next
> - Improve commit log of "Document SA8797P Ride board" to explain the need
>   of SA8797P model compatible
> - Fix the real issues reported by sashiko-bot
>   - Fix unit address of pdp0_a2p node
>   - Add missing compatible for i2c15 and spi15
>   - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
>   - Update commit log of "Add device tree for Nord SA8797P SoC" to match
>     code change
>   - Sort sa8797p-ride thermal trips in ascending order of temperature
>   - Fix sa8797p-ride thermal zones with identical trip0 and trip1
> - Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

My apologies! Please disregard this. There is a typo in list address. I
will resend.

Shawn

