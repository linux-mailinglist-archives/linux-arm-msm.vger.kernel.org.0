Return-Path: <linux-arm-msm+bounces-92066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGnSGbcUhmk1JgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 17:20:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 606991002CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 17:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9360D3001388
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 16:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28D23254B1;
	Fri,  6 Feb 2026 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J0R+hay2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqIDL9CC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CD62BDC04
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394801; cv=none; b=WsHiL2GxrwSW7U6p2dd1LzGNVlW5iS/5QK3zOTER3Qr+3cTm1v5IdFxDJ7n1FWGucsQAod1oYjsLAqWBOtY2hqNowdaOReupnpIf9g7zN7P9YEIkjaftZdSsyxXYG4irxjASqGxoijftByhr8FYvQ40Bb+GEECo63dGi5BLQDfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394801; c=relaxed/simple;
	bh=J2F4cDMahLcJgIExHRlCnjcPxZd/hyolua5K32XiCMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3GmNki4ZN6KyARE2v8eWf+BCpit9/wEmcBKI/6zfPYjyM37hKKvOlJKAoyzu2FxYyfokR6TnXYV/b9RWuHlMqXe8qTgMtYxy7dsV710mQ188X9t6QiGbnDHwfOJPeGUAadM2DpB7V+kv5Fd2WAaBWS/pgJmxNRyzlQ5OLRMaSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J0R+hay2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqIDL9CC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616B4R3U3764245
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 16:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fs02lgRZdnfzJZx7ozr5pRKs
	fSoLUkp+R7JZ5Ifo0+s=; b=J0R+hay2tlDXMTGE0umss3EQWdWY1vd/gdxRrC2X
	aXTbEVA3+mUxd6/429yR61BVZYFm0jxkVEPtKKrUgUnyY8aIh8WSLSi1AwXWKatR
	qK+1EbUwjoepUNs8x6DNfeGIzReamjM8tsuyAyZc3hYlSRLuP4Hhr2MSa2aa/lSb
	fPn7A6AfH0R71+S5rcTTvprkpcNNo0TvjT9aGyfUPxtg2DOvGa60/dV9M+dLLOKu
	ObgCF3on/89aSV6bMWNb99ngNGAV0EDT4KR1qzTLNG5NMmCfPRdLblxssIfFhMoC
	oFMg5UVS2/0zl5nCN/MrL7FkF+rKw42ZSYS8S0ga7awmCQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5f3wgvxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 16:20:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3545cc84ab1so4576096a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 08:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770394799; x=1770999599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs02lgRZdnfzJZx7ozr5pRKsfSoLUkp+R7JZ5Ifo0+s=;
        b=LqIDL9CC4oQbP0mCv8wRJgQU+SFqjvoFtbiIfkzBDG8TWLVvY6Vw0XYO2TRV41tvUA
         Vbj8D58BmDhVxhSIrMIloSBSEizyKis5qjrP8DE6/s+FFgBr8Z/hSjkGdJkYO4j2juR2
         JD5kWl4IAeZOIBlnhJa+KF1odEgYZLAQ4U9dWAfx9K80OdyHfBZVwEkrU3Kd6CYfviPg
         en46iTA4YAOZ0n8AVO22DgDUZi7tBBnomj4k/bRY1sXaJgZPRFCdNjz8V3+3thfk7Grk
         vmcCITu5gTfTlfJ43hR22MQrvw4wrs3kBbbZs0lxkuEVVKvvFXupXgJ4Pm5lxhzNY703
         4zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770394799; x=1770999599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fs02lgRZdnfzJZx7ozr5pRKsfSoLUkp+R7JZ5Ifo0+s=;
        b=PB7qGxxfXmSqPNEXMbMZTbK0lZKLhdm696XPL9QEpeUWgIq/Jn8Y9uH3xX7Z0dDWeB
         9WQod3tPfLGUCuKMRR5eGEx5SGf44eXvl9BTtD85tg7hpQi3Ucx276YaPEyL5m657iPF
         tIkrBcWUvTulDp6AoWT2fv0z/ant9VGUOHdr8u85zj/AFlB8DvcG8UAz0180eLTyxH/k
         hv5pgl3N3geDFNdp8owDacTSAoVb5ZD4nxBqIMxsSdw4U1044PzauoHp8hIeEfvAn8yg
         nVZmo7rRoWbwXRWSa/mRoEc+dlIikUjSrS8LyR5TQYD/97wIJb9wKmFH+ry/mDkYbBW0
         +I1g==
X-Forwarded-Encrypted: i=1; AJvYcCWvfnPnTbF5YdSrsnZhT6xA/ud3zbYVGEjgIaf+9S0rsVD4M25lK5FfYyzqT4/8uAzSrtAtR7gpNqwHpV8E@vger.kernel.org
X-Gm-Message-State: AOJu0YyR1Qf/cHlZmBksDXkhXNNMQwL/md9Pqx+pCV9nE8lUy+9Sgaa6
	2oXyEVsPRcyuRM0SbqhsLMiu//NxJOeFWrrXN/MLYY4x5QPF6TusOYnqAkbxuFpJBGDTZx8nZy4
	2zPyulsimxH4rFK/IvVKiCCK/g96basWR7RWDx/Y8XHHXoDlMKfpXWuAPL8dpUwEOuKKu
X-Gm-Gg: AZuq6aLRrjqR6yz8dWmTL++/N3bl2Tow1rNOVB7yywdhpfITdnauUseLnEiBApGZ1k/
	Eo8q6At7Skh5x8foO9rf0EwtBHrTNBIAuuK4hl4rgl0bax5fZzLF5GQjq8f2ptk0D3wIAvV4PZo
	H4LcvIOq9XYIttorODOeWLDUKe2fjfIr8c+4/UPUSF4Vk3R9OphR9UeK00iO9r51+2ReHVvIamS
	JKNL7o47c2kCw1PXAC1TO7LN0n4XqyTpahpkBBUfG16YvS0kWgRCC/AI9m85DXtuz8pX1vGEg2v
	xb0KcG/kTtzp+x9rhCm0JNtP39GABgB2yyutNxe+DRIIWGJLrqHspHWNSDXDOpqJ+QjVTZ6Zhkf
	DdpqIjYvQ1X2G/wpZ/ypDpNel4oAOtwQdwfag6pg=
X-Received: by 2002:a17:90b:35c5:b0:34c:f92a:ad05 with SMTP id 98e67ed59e1d1-354b3bc38ebmr2865911a91.11.1770394799153;
        Fri, 06 Feb 2026 08:19:59 -0800 (PST)
X-Received: by 2002:a17:90b:35c5:b0:34c:f92a:ad05 with SMTP id 98e67ed59e1d1-354b3bc38ebmr2865890a91.11.1770394798702;
        Fri, 06 Feb 2026 08:19:58 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b1f490f8sm3542277a91.6.2026.02.06.08.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 08:19:58 -0800 (PST)
Date: Fri, 6 Feb 2026 21:49:52 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>, lgirdwood@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Allow
 regulator-off-on-delay-us
Message-ID: <20260206161952.ctmzghln5tkqzvn6@hu-kamalw-hyd.qualcomm.com>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260127190211.14312-2-bjsaikiran@gmail.com>
 <20260129174829.GA1324020-robh@kernel.org>
 <355213ef-106c-4383-88e7-9b40f5b1c1ef@sirena.org.uk>
 <fa760b2f-4b8c-46d5-90b9-2ad9e69ebf04@oss.qualcomm.com>
 <20260203162005.ui7sl4t5m32jwas6@hu-kamalw-hyd.qualcomm.com>
 <7da1e3e3-18d7-45f8-9168-481ce8e4493c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7da1e3e3-18d7-45f8-9168-481ce8e4493c@sirena.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDExOCBTYWx0ZWRfX9BIrX7OwuDyz
 E6PUL+f36v3luFeGCT2KMHAxMDiwmuh5Ve2pd1Qc4eoZlrVBMnUhu5ycmdwUBJX0V5ORL++GZle
 m8vZzXbnsF7pJu7YigvE8ETLHDeD6hcj2Lw9cuIIn0LB7aE8r53uQaTa4Ls758H40sTqsMCynBq
 SZXeeOGnWETkWV1ntGy6yl9Czw4h9OvOfZIosGz3+non0qbbUzztcdy5+0mFBmNZwoWkrJQjJ09
 BHK7rBuDrM33VYDsZ/nCAWFh1sv1HXxHo0WUd+2Iv1a66W8+2BambxwEjKgkOj6gKc8S9OEVyJk
 RjhMFvIGWBTP+tYuPVdu/kygVAl3Zd0zMswpY1808s1zcGncOYhVNq2Hi11yodeDaJofzBXKsQr
 dn/C3CiSJZ58oL3qKD1xrokmpy2YFv9DI+Dy+UCkPdj9utVrxMI24rjnWU+t9JQHJ3gMpqXf37z
 GJqDaGurjJanCBEJBtQ==
X-Proofpoint-ORIG-GUID: JhaCKIolieQ27THPZ5g2EvF9PEQGYB3a
X-Authority-Analysis: v=2.4 cv=NajrFmD4 c=1 sm=1 tr=0 ts=698614b0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=y3iAXnNNSRDe1lNesa0A:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: JhaCKIolieQ27THPZ5g2EvF9PEQGYB3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92066-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 606991002CE
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 04:30:27PM +0000, Mark Brown wrote:
> On Tue, Feb 03, 2026 at 09:50:05PM +0530, Kamal Wadhwa wrote:
> 
> > But I'm wondering if this is really a 'slow discharge' issue, because if the
> > caps discharge slowly.. shouldn't the rails be turning back ON faster
> > compared to when they are completely discharged (fast discharge case without
> > bulk caps)?
> 
> The issue is that some of the supplies fall to a level where they cause
> disruption to the devices using them but not far enough to put them back
> into a power on reset state, the device browns out somehow (I'm guessing
> some retained state is corrupted).  Ideally they'd have POR circuits
> that handle this case well but apparently that's not the case.

I have checked:
- ALL the pm8010 regulators have the PD enabled in OFF state by default.
- From kernel enable/disable of regulator PD settings is not allowed. Its set
  from the boot and stays as-is later.

But since its already enabled with strong PD, i guess it would not be needed
anyway.

Regards,
Kamal


