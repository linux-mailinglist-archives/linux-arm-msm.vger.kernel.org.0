Return-Path: <linux-arm-msm+bounces-119177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7zZGMzk7V2orHwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:48:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 814CE75B95C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:48:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QKfvrEjY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J26WSoVa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119177-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119177-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8059B3004DBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C61C3C4171;
	Wed, 15 Jul 2026 07:48:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71BC39CCE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:48:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101682; cv=pass; b=m2/XE9+ZcuN1D+EXGseeCvmQyMF2kjIQFmlCtXlkOMWjRV+PMKjqrzxcWxS9UiqP+3XCMFvS3HZD+rE0nnuDjNGruKm3ERZczfkGF7ZzmeJYFvXli9hhopWHsTABnd3ESenBQ7mPHclk9Mc4hqn1l9td5PyO+F84ghamlBAT6k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101682; c=relaxed/simple;
	bh=Bu6Ky6yX6sbDl5UgTFXVtjOAaG6VLdCnbYe3baMXbv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Heq1C4qdM8U3PNG3aABh6xz1wSE3AV7BNgxMvLAEe54jHqsjgf1qEkPaKxSVCZHWYLQSfpIBwqdT+UQKssR8L1/rS8ZID6PA4pgbo3/ruiE5FeEvB4vhTgLj7O5mQpn8veWGKjJZvqdJIrHxDhAsSx8kChrddFJ5yV3rW8gNfxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKfvrEjY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J26WSoVa; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l6Yj2373375
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5akeSIk1resecXsgFYOfGYCtw/8OsKDC10ORZ+u6bPU=; b=QKfvrEjYHpGdECBU
	5D16x+dmjrxnZ6Tfw69NOV5xnTp9SsQR2zBGpeK4QUm7aIkPyYce+8cGU3eSs0hq
	7s4Y14uTQSh82J/RZl6S2XYMYjgK69sQlwoxgcG0W2GxTZsN6NwR4oA27gjXSbSF
	Gr7TmigLeM8ZUC5Rfj7P852XhzaFUkCFQ/zbos6s7UuBo3cl1UFgcmC+YCX/HU8l
	rO5PjpYByiN5acmNorQKuvoKMs8UmLm85t21767s3cpx6q9xIAU/rOHkgsA+TP9R
	or5TBkDCvdsDPYK4mubn6hc59aHHVBkBziLtQE0WqSXFAqvLgzMvXxl6k4ZUTbLB
	usIAqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk3x1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:48:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e66f9e2baso278724285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784101679; cv=none;
        d=google.com; s=arc-20260327;
        b=QoOKfbPuwMwbEbJ4q41wnCDjIW4P16fn9T6R/ZHT4CRM5ob8CnPjW4adVP6akuDVQk
         zxwtfvbA1iNKJw7i/1KSclvle6CLEJ8x0WcVoF3wdeJVF2gQUCyLpKOUrxqyblGnMfbr
         hue4ApQU0mBqWuVwEOYK6UPSpzF6FSw/CPMA9n2LH4bQesqkJZpifqqPt6c4pE5W+2DB
         LOI5jhPWsHT0PW8V50AwngFLDoUtre8I1yQGoHSmeTemXMfy5phIyB5wqFXwLLkNE0XP
         zfYVjpEOn5s/aXReuKPUos+HG14HCdHQJAjlRuyLBZUTcZE4BzZdkyQMY8B/YSuIYO/t
         zhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5akeSIk1resecXsgFYOfGYCtw/8OsKDC10ORZ+u6bPU=;
        fh=PkVq2NFaDu9vC9VUskSd2nXUegjDSzRWOX0qo4weKTg=;
        b=WUmqLEooXMXYAoZHhVfw2BcWgS+r37wxYyx0mr0JjUSKK7H/g5eV8zTRKA8bVu9wwN
         KKnGJ1TXChlIye8VWFIo51W+aj/YxtC8nbkDDmyEMASzrwLT3Ps03ckp7RMsJgdXjkLb
         XBNAJ3Gs2A6cyvkUiDQwoScdci/ajRwjRjY38wzWt5yIFTGGQ396VYKU1BBub5PxL3jy
         Epuv6zzlU0G93nHfWjINaEfcskuhelXNOnrPztduTc/VLRVmTA3RTot+yzJHC37LFOXW
         FR0ukZfx5EggdtOy5d4SSHhv6M0CR02DbkLDU3KwvukvTVXYVvM+AGgbteHjyjr2fLCE
         tapQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101679; x=1784706479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5akeSIk1resecXsgFYOfGYCtw/8OsKDC10ORZ+u6bPU=;
        b=J26WSoVaEqHoJVfKTFpoWVyzzvftnQWw3JdindqbdDybKAm+ie8owQ96t2RT8EM9lt
         Q9sEWeeNRcSnauOIfl5Wpok4zA8vBs8j3OwMrtWGGIwrywRI+eSBMk8vsKPlrZiBpJJT
         9IuiHIShL30FXGefsuRQ4EGoZO/gzwkfjvv6/+1wES4z+RjYSGMpq9PX+n6CQJY3AGQF
         r/udkX+bdMDTFMndJDtnu6g+PPg82nqVEDf6S8CwrQG4nBei4F+XC/Ljlp+9k1evC4uY
         CcYJYF9oJfgxOadQFSepz0exig35Hd3GNmtSoiwQizBjos59uU2Av4W4c5F/Dv2qAIcq
         0bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101679; x=1784706479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5akeSIk1resecXsgFYOfGYCtw/8OsKDC10ORZ+u6bPU=;
        b=s3swn8s+bi8kKFWO29S/OrhOUaNLBOpDkGY5hy32VdBQQaYVMFnrlyal/vQ+xSXB3c
         ZowEPumKMoPA1T4lhw3U81eH702dWbl4Hufe+MC1rMsoN/u84dUsi3anqTXMBhY00ROu
         F4gbZ+vCJIUPZh+h3eZ2Pw0Gve0FTH2hLe2/+P2W+wXhnNQlgZ7u9FCfR3Dkfb8RbMN/
         rXvXoy1mBV5qV8GUn7urJLvxYiMufjHu0L+aA4T1X95b0bWLyUDUVxq/R+SZXz07relu
         sI+kDC6wIOlkVoLaWXFCy6paqisA1lq9nLGYCe8eIXtcNnBwCG1p1O+Hz9M++O3I64Z3
         ytJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEPSalAuL4Wy32GdtZsBAIFza3M/cIjJYCDbUNxJhAcsVRZ7LXzsdfFgH4frumHxsCrDLMhp3BV/eNrm0U@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXL5d8ORR7MzK6ONPFLmlMVaQJU4oiHUp6LUlpnwTDSiDv9Ov
	W+TvJcIrqfXG0rUaiwKcVusQENfAGlRVgLbTd6jYs/h2co+4ARr7qSOjDVYCS4fnU5gCuUmFXck
	EnLmgug2LsFN21LugWidIKhX6KeQZ/B3aP29ct3gxrhnq7Wt59hVRBdUXrygDXKT4TT6bpQtooa
	hw+deRiv0Kje8M3tdopnB5e/+OTJZrBkb/z8cuvgWRGfo=
X-Gm-Gg: AfdE7cnbxo12rqcKL3WZbo2VwHC68Rzy4fVLmjXKC8VyU0ESlGc8dViRSuMg75fZ6sT
	9OPuI4bpalB9ZGbQ+r4e6raEoOl6JY5/wkK4cIX7zuMlgEbaCXFW73rFnQejKKobohrWgXszMaH
	TOq2qVE4VC1p1Ik/ItUhbc5EVq/Dv+kr5GsIYU8ZpRUAIPsViVtIMX/uLpS6Adl/3QZ2OV7zy3w
	EeD35efe98LqTQh3Onw687292CAqS76lB8YPtzQ8/l7952IBhlF93xAZPmivPbHyjZpBuKklI6u
	2PPumBobqW8=
X-Received: by 2002:a05:620a:448c:b0:92b:6805:91a2 with SMTP id af79cd13be357-92ef2ca5724mr1598996085a.74.1784101679070;
        Wed, 15 Jul 2026 00:47:59 -0700 (PDT)
X-Received: by 2002:a05:620a:448c:b0:92b:6805:91a2 with SMTP id
 af79cd13be357-92ef2ca5724mr1598994585a.74.1784101678668; Wed, 15 Jul 2026
 00:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-5-51207a0319d8@oss.qualcomm.com> <54d76244-8ba2-472f-8577-b5d445d6ede0@linaro.org>
In-Reply-To: <54d76244-8ba2-472f-8577-b5d445d6ede0@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:47:47 +0200
X-Gm-Features: AUfX_mzpIoQvU_fl4v76ZB-CbH3Mrj5s-TpzADjkC7rux3HKFHCjhcZr8kGUlMI
Message-ID: <CAFEp6-1LUNta5qADVMFLG-W0v3qV79APwSUohGPcMtoAA1Mbbw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] media: uapi: Add CAMSS ISP configuration definition
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: hyzUosHh1KFI2SsUjFl1_1zYxPhLb7Bp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NCBTYWx0ZWRfX9UuRNtRKZfHm
 HP6JJ0O6gPqGe7dBQlFpYky6MoHcQea3iBvQCoQVY80pAM/cfl4DW5C28F1+tZNpXi6Pu6GdUN7
 VORLCaVmyevkhg+m379cN/PwTeXec2zDnBh6+vbpHJ2JQat74P5CECkgVgDG/eoFDoKOhswV3kV
 LNJvmJLBbzJyRd5kaW6OMMgoMsN+k1RH4pby6ya5RcMJn6BNWM12WbHq7XxeWBBuZQh0aRohbKF
 G/xV0R5dYF0PwWdFmiEdq9zSNImH9fyJoQEN+G+pWlNT6arMQ3K/KiIRSoocPdp/TM/odwwLk6q
 Ss5FUrUfvqqeeDNLkoqH8xvKwJHgaPOoVtADGzVvLAz/2JJD6IqHUysuvr/0+7S6hYivjI7J0DV
 +OAjDg/siKy0VMqtc/5Qp1CzJ0/D/cfizqgivYGl42rQFZb7kO1iUkipd5Dk3IDT+RY9Ji+qGU3
 aTZ99t+nlUEb0UMY4tA==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a573b30 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sqNdUdlMnWxU3ffuJxwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hyzUosHh1KFI2SsUjFl1_1zYxPhLb7Bp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NCBTYWx0ZWRfXyVWOjJFTeqRz
 mT33YVsewZjxDd71Uy/E2a3PlkMG1HXuvfJQSqRcRPKtaJSW0xDx/qgKldhwseOmLVvoYfMyMvO
 eiIrRHdMkC0pU8/FuIuB0k3KJJ76Lag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119177-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 814CE75B95C

Hi Bryan,

On Fri, Jul 10, 2026 at 11:41=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/07/2026 10:04, Loic Poulain wrote:
> > Add the uapi header camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > Signed-off-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> > ---
> >   include/uapi/linux/camss-config.h | 161 +++++++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 161 insertions(+)
> >
> > diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/cam=
ss-config.h
>
> Why haven't you based this on the HFI stuff I supplied though ? Its the
> same hardware right ?

For the three introduced structures:
- camss_params_color_correct is the same as the one you supplied
- camss_params_wb_gain has three extra offset appended (post gain), as
supported by the hardware. But maybe the signed offsets you introduced
were supposed to support both pre/post based on the sign?
- camss_params_chroma_enhan is newly introduced here

Regards,
Loic

