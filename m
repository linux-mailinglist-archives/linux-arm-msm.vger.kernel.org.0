Return-Path: <linux-arm-msm+bounces-103602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPKOO12142mVKAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 18:46:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FAC421AB6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 18:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B47A3024192
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 16:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DC930DD10;
	Sat, 18 Apr 2026 16:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMXNrOQB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSJaPWR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D051A683F
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776530776; cv=none; b=d+XgjhZw1lz5t6vcx1hbxma/uqVi7MkMVhonFRrDj2K2QFguJEwTrXNLsIXi1RTq4O5TUnXU9+yWagB6PYB78UubaVui44/ZjGfTTTRR/NwxVs5FLSTUFOf5tLfUswsn80nsv0DOQVi2W9qHi/v7OF9rXxaYaEkQW8W4ioAy2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776530776; c=relaxed/simple;
	bh=Wp5uo1kEWsoAlDaB84RI1CZfMuh7FTkZNljPadpndCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=my1RtgSeoxTZ2Dw46fwy3F0RkKXMlPQsZsfefh2bz0tQkg4R2PfIoTwZORzTnJvle1zzWRRubM3kxdoOdhd51mIW4mZjXtGMC0tYMwOtUlbKWku+nxciIZwGk/Op3m8pIGGofNP50v1KyHdPDZzNO51o5GBKsM0wajGFeUVgWh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMXNrOQB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSJaPWR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UB2c1430682
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AemAHZIONmX9Bx4hX6o5KMIh
	YVIU89hnctinbw54IEg=; b=lMXNrOQBbXNP5YWXpnI1rhoOIHnhDXKWzmvN5xcg
	fJUwXTY9lNj2l78wpeMHLHglBiWkwF1uaMJUjbVbEkhqWUrS8kItPV9vRwe1d1Oz
	08IS9x3N4FuvrV+YilWYQ2tw16vVo/eurdYF2FQAbTwRIJIMO4c4BTRLwohpRFGG
	0uX0K/vIXF/7sKZnsCF6LNYmnSEkq6+S/Qx5iCVM22370AFTWHcypdJE9hrSelyI
	/OzeMlf8a6zvPZyqMySHK7oVLNSd6gbSodPqAcXJhExXOliA2vl4obXJ7dRS8Ieq
	ikCPd7U4BvtNea9NZGC0y+ktA4VmVq+nBbk5Ux70K9zTNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21uh3tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:46:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b6f869676so27751941cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776530773; x=1777135573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AemAHZIONmX9Bx4hX6o5KMIhYVIU89hnctinbw54IEg=;
        b=FSJaPWR919mymUASTA5baUc9HNWaLL2lU89VDOUxMCPBFVEq0g9K+xiLy2sfMpKwT+
         dkDzEA5CGT+13D6UYii8Z+k6xh4LtR10Lb5i7/H5/f7Q9cl48nIJo8ChxdIyReyZIvmU
         WDMO72KTv5sLtqg6ejtZEn8EbtBygMAnydp3vL+XHI1c7LNnTA8wKvMqzhUZ7U9ozSsd
         QNOmzN6+baHeomOatIkWH1nBC6odetApZZTYdOBe7Kk8FC2bDqmwNk79lQF9WDtb6NoQ
         cO8S+Tl/AFn5V8JZWhAOjd9W8pZuQHqOaIM9pFI4iJ3w4yIqFUJelJIHzLf/vXx5hAxG
         5O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776530773; x=1777135573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AemAHZIONmX9Bx4hX6o5KMIhYVIU89hnctinbw54IEg=;
        b=BsUpDdHsQS0C2K1FoiAa5KpOQjpL+c4BlRgq0bk8o7FV7OB/bm6zIBU1rQMVLmqBv7
         xbiNKFcDL86luXMAWCzAAM9XiOjcqnTncvgZvTPa9oq6Pb5hhFLwmRtLQwlUhBgNzY0i
         FjN5M7DXivzam3zJ9pXZKfj2oNfYXra/aGGbWSEkvGhXZ3dT0ffctT0kwsQxWKGamm/1
         EgKn/Q9CsYX45hM9nM5sZLklfbeLrrXgzDe8l2yzyTRrjvztVIX+/2nk01i4ggMCU2hK
         krEDHSjzFjg2Mmt0Zy/X1gSfz0YaE/TO8r2lOzvD6FlJRqRAw2A+Lkzute0bcZAMbPdf
         Hmug==
X-Forwarded-Encrypted: i=1; AFNElJ8hLowV4VU1ocE72zsm+gTiwjbMyPMK7LWB2GV3kGyfrqHv6wY9SPt8+iSZIt1ZuxERdKG0ZhS0yzrwMMvB@vger.kernel.org
X-Gm-Message-State: AOJu0YwCtFYRpODB3VCTxHyJgH1zMoO0bZkxV2SKgCuxlBigRsVnwiUb
	57ImbOaE5nhonmgqi3WtNVrv+Tni2J46n0wJuQFkFGY2qg6JYyLC1ukAs0rVkv0AkhpiYIb3u5l
	59Q05TzxCPau61Crc6UVWI08tWAnYTa/U1QofnKeY53ozY7Rl3iidm5xA5yqdHJ9WMuG1
X-Gm-Gg: AeBDievjlwWQkenLf1bLc6DP3fyahf0wGfAn9VlScUZuy6Th6ePyNHrzDZ8azQiDNaG
	iVCfpZhUy2jBU9bIpol2utT1d9bwFsX+H2tGCNMzVqM53qhmpSM3DijFeN2Bo3iSIYVsh1DbXCC
	XR7bHpyV0JkFRjoBW6uMkRB+3044Y7DsH6DOTBwPe6ulJhs94LJ3SQ3pzUvXL2wZKkxtEREB+Hs
	/7GIEg913VAg21Tc+eogqOhEARjWrBuJecHa0a1RExfgAAcceJaiTdzEwTx37BDxnm2p8PeRetL
	fM823DzDWBk/0VJhu2+3e3zIv+rhjyfGDzjDoZ9q3RUgneUBVYz6PUGAih3hCMTRtJP6CFCUlW+
	bPBfKvGZNDg48mrlibJqDEbPaeiZkScGeo/gek9Wq3pjOQhtyO8Ix0WjfEjxJHw4WkdCjk9tOKC
	kwpsISepOp87Hc0vNRpIykBAYHOlunYHFeWOYfXZK9KVBbsQ==
X-Received: by 2002:a05:622a:418a:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50e36c15da2mr110952851cf.29.1776530773232;
        Sat, 18 Apr 2026 09:46:13 -0700 (PDT)
X-Received: by 2002:a05:622a:418a:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50e36c15da2mr110952601cf.29.1776530772833;
        Sat, 18 Apr 2026 09:46:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm1448060e87.82.2026.04.18.09.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:46:11 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:46:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 07/10] ARM: dts: qcom: msm8960: add SMEM & hwmutex
Message-ID: <2gydufud7lykeselo7yca3n5jydtbzephhjcpm4ek5i6vj74h7@b45lfcheohsb>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2NyBTYWx0ZWRfX9S+REgEMuMvE
 Sr3uPeo32SzLIsLurE4omEyYd2eGNQn8CpyNF6+UutGCiWt23vn9Nw6WuI6eHqHHC9VIF/XM4h/
 XJtVVN0A52kOhn6bPe6A5PoxDSlOfT0u2bDx3kpOO54OKKwoU3SpBTNHo3wJTp+ys0Tlfw5VfNm
 ictiMUTV9FQs3Nojf9wXnojayLkrNoe/5ea7PoOVF/E0t7K0Tkepc4vLwgDGWKdBTTy9zPrVqm3
 yjdFF7Wf4Mo3zXr4IIqQJzJGK2a2Y38jcEoQAHNgVtu/CrvB8WDDbf2SIpZ6bSCYBi/ikMW1HBX
 24wA0wFpdWF1WGvuX5f21NyMEnwnwY79LzkU2FJvGokmkT0zydnT6NmTXUxynDF9Z5BmWVz03r9
 Vyl5PZDCn6Y8/FTHzpW9xczpURU/cZ2Fkx35du60vjYX284/llHy3H/w8MTwdEvOj4AXF/mmCAL
 itlNTlZjGeJ+J8CAisQ==
X-Proofpoint-GUID: QKf0ZO7sxdzzyCdcP2_bkUKE4RT8DNqm
X-Proofpoint-ORIG-GUID: QKf0ZO7sxdzzyCdcP2_bkUKE4RT8DNqm
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e3b555 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6Xm4nHdHo4a8rT5D54oA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180167
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103602-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7FAC421AB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 01:55:34AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Enable shared memory communication and add the SFPB mutex for MSM8960.
> These provide the foundation for inter-processor communication with the
> Riva (BT + Wi-Fi) subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

