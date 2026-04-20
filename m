Return-Path: <linux-arm-msm+bounces-103753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKtgO9Ic5mlurwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:32:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3342ABFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5496301EBE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6296F39EF15;
	Mon, 20 Apr 2026 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhVwzEAz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEyA5Pay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABE120B22
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688300; cv=none; b=EoNCaHjK5cFZ1K4Rdk7y6bE4R0WpqlQueOkp6PJUkAgVFcO6SdsMMvPL2IfefiNrDEn/7+4zTymz0JTJA7trZ3OQIkbSfC0ai75RD/3KTAI7sVlmQN8Nw2yTzsUTcEyl1kedTrZ6j0AQTCF9zl/h7vpwfObWxOWXqzC/X3T4JEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688300; c=relaxed/simple;
	bh=QyGU+JtrD+xfoAqSO/a6JhIRG4Nj15cSg+hd4z8eLWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/3/boHXtrwexhKBUATlGYG8sie0VmTdVSDG7i6pFGDs2HzqP+sXAQx/IHBxqGBXYMwwCEQ5+u2SK/jVvB7XG1WnchC87cxinr82TNNQL2qhCAXT+X0eNn6BwPzpJlZMa+nrN6EW1ZhF1vVWMOmUohuOMmWNaaqZrH981BYSv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhVwzEAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEyA5Pay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9J5Hl785558
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=; b=lhVwzEAzfHqo9aGe
	atEILuZcF3EqA7ImomSmqrJJaLnmSwnHX2ol2nDReWzhCnvB/ZnUBsaczHV7Sqqn
	UCXC2W12Y95QD2fFm4W4FTJ9tSjcUwmP+xH+bcDBBhirltmDd7Pc21luCz+xb5M5
	jdEWtEcIVJOdyjeeaGWkpASC84ZCeh+IkVNX4dBSzymTPbHjji5HWWLsC6W9hFBR
	CZ9UVCfZPRaqqFvgrEcOGjWcU3hBDzXcH8NsCYYkA7UdOroYYwkR2TEKQV2JwA1I
	rtWJnuSCwaKQBmPfJYbZkej1GF4/bqYtJ+WyLAyY2iOpWxf23B7se3NFnUmY5Udq
	zBsaMA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhgmeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:31:37 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-46ef241b62aso1770637b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688297; x=1777293097; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=;
        b=jEyA5Paylk5AkOJM9yndesbST3nP5/ec9pVa0v2KuGTlRKrQinBkjYNOR7nE5dBSSD
         ICQciD7QnStJQ92E5G+doyThsv6xZPO2db7dfhX5h7A2Ss9PE0VqRReG9q25ayUx+0ul
         4OR8YX8X/s9ttJIAGqX4MHXaTWBXK6o3SCMSF5HTfcCyh723NBRf2ZM/Rc5DciyswRct
         chvqVrwyDSFDG947nfJs3Mp1ebkxWBAniCkPF6l7qjw3moYtyR6N0c5s/pCd+q02tJTS
         /5YQymnJDZTRn1j3u7cbqkfmSbULFXpm+AuvlelWjtUUIJkCNN10uF1fFbmZejnHQF4X
         aDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688297; x=1777293097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=;
        b=Jx4MjQ6vDgM8usf7N1TP0+naU+o4K9uLU29PkKEWt0E60/V0KTM/bsDjE1wWFqhHsC
         O/uDQeRmp/zGVSB26hMV+K5EsePQFIkWyTyvzycSqTo5qEh0xiytqqV1zcIi+cPt0WOw
         8dqJZEUiJkSIxLDccrlJ6Ka+8U1RgBbIZ5D+nSUT4eJgyEKJtDhWQA9DgPL0/WoRTNuU
         7fVnB8lgO1Bqsj5huDNkSPrzp0VMVRbh84MTXtjYodzuZQXweWtw36vBlUeBMNlcVS+3
         VL6rzUsKd+eTpA7uQTsEIXGSuLqK+blxs3FqpmATfwz46e/M7WDwtMdQ1awLy7aZbxph
         kaqA==
X-Forwarded-Encrypted: i=1; AFNElJ+ap/4BZpcgLiieMedfYmPYm4R9ePHifuv81HGRhlnpFpxf3xfazFKBfJWPaCZnNpUoWfWWxFkDsV/ECZ+W@vger.kernel.org
X-Gm-Message-State: AOJu0YwHU+jeHxVfUs5uXc/daWpJfRPyGuYPxdpnvcfWaKpFw0hZNuKq
	GnMPrAiuGDMGv+H7zw2mQFA/QXGC57VQA3bzLB0Roiw9+0XdFhE7arOIVyrtjbDCLvI8oF0LC7e
	kaBvyXsluBPeLKf9PmwaHC9yTL5AtHoExqridBqGKlUpP7F2A4Hb/j85he5dwJAwNYMu7hWHzBH
	vx
X-Gm-Gg: AeBDiesNTMHPwtZyFmAkLBGhqe8sVgBYSkqLRUgriyScT02m5mNujV+R5kLdF+Doxb1
	ufoSk/SmRyqT2aFtwIqTlaIflqU/CylvGyPHhd4ckJe0ceU1c+EsSR/gHetBb4wuh7zrFMWmWhp
	ovcc/MeQywKvLdtSzXo88Ocex414cUs+pXwlmyeaDAFJ0SCWt82KihtAF4o3bC8Ro4SfZ/fSdMr
	s9cThO9zdgL4J0nvQkyOJzNiNyg2xpuK7vzXM3Yyy/NFTmty4+UVy013+7DZgWuOVTX1MAzZQeV
	bfbnrOSofH5KH3YnzLCUbH2Sn0TnUFHGOSCgqqX8z2gdu/NGb6TSs5AQ5ay0pwyYO081PTb7Aj7
	dck+2dn3Gd+fmrT52mLV7Hgq4dPyKTLVxQsF/yPFVGCTWwS2cH0/LbQQpWslMe6EvdtPFjRNhH0
	AYnkIqJoRbCzDRKWhLp8w4brAt+4/fc/7VrFURBAmKWf0zYw==
X-Received: by 2002:a05:6808:4fec:b0:467:2509:c20a with SMTP id 5614622812f47-4799cb50f32mr6675096b6e.47.1776688296806;
        Mon, 20 Apr 2026 05:31:36 -0700 (PDT)
X-Received: by 2002:a05:6808:4fec:b0:467:2509:c20a with SMTP id 5614622812f47-4799cb50f32mr6675055b6e.47.1776688296347;
        Mon, 20 Apr 2026 05:31:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm2925137e87.82.2026.04.20.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:31:35 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:31:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Message-ID: <aktvbu6ckco2zfmt5pxyij52q2w6olwwlg4ziuqbdya7vrtxmg@w2rizg5zymhq>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
 <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
 <37poakqgqhsuavvrm2dyzwk36syyq44o4cfdsylkzwsupbh2yt@ycdvyrxgnrcs>
 <a09485c54946b754741259540257393734b518c3.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a09485c54946b754741259540257393734b518c3.camel@apitzsch.eu>
X-Proofpoint-ORIG-GUID: 0kLlKvXyXkdr672GzthqCSNxpv3VRkq-
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e61ca9 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Jn2JxawGAmoOaafwVl4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 0kLlKvXyXkdr672GzthqCSNxpv3VRkq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX5gQ2Cmw0E+K3
 uOql3QI5PnLOVmn4NUmBBFXbx1TEjasa3Q/8Hpt3HoAnlZZXaFI44q7o+2ZGwz4asMzrt8qOmaR
 X2TX2pmHTdO8bhmZWIm8dCXztpKkHOytbcHqm7w/PmHTZfk241+O5ubnyTAcY+auxAiQxXhgxX8
 crCgaNcX62V3sqSr1YViapso1SALf/H11eeWiomCfrOXJ2Zve9I4sVIdKFiO2SK5p9dgqbIm013
 DzZ9cUvzdOjfeyQ4gSsOwpQgxZfB9wJBhwAUkRbWKpuLmRAI8+R6hcQf3PHJ7Z9XvqLZf0iAZJI
 9sjFX0V4LJCRFqMlMEgy3nXpkIXp+UgkhkMjjxZQfv+KUILRZD6/zMaZxNJT58F2kyMoW+/SHD9
 hesjK+TctyYmHKpxlK3qBoL3Tw7w64fS4ki/9Q0ZNvRNpgqX7doId1JDrNuY6aeCfsqsi9wAZCG
 wGpvu78CWd4BLaD+4Sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200123
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103753-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,baylibre.com,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97D3342ABFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 19, 2026 at 10:26:56PM +0200, André Apitzsch wrote:
> Hi Dmitry,
> 
> Am Samstag, dem 18.04.2026 um 02:40 +0300 schrieb Dmitry Baryshkov:
> > On Thu, Apr 16, 2026 at 07:57:30PM +0300, Erikas Bitovtas wrote:
> > > 
> > > 
> > > On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> > > > On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> > > > > Enable Venus video encoder/decoder for Asus ZenFone 2
> > > > > Laser/Selfie.
> > > > > 
> > > > > Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > index 90e966242720..231a3e9c1929 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > @@ -267,6 +267,14 @@ &usb_hs_phy {
> > > > >  	extcon = <&usb_id>;
> > > > >  };
> > > > >  
> > > > > +&venus {
> > > > > +	status = "okay";
> > > > 
> > > > You need a firmware path here
> > > 
> > > When I tested Venus on my device, it loaded without one specified -
> > > msm-firmware-loader creates a symbolic link from modem partition
> > > for firmware. Additionally, none of the MSM8916 devices seem to
> > > include a firmware name. Has something changed since then?
> > 
> > Us becoming more strict? Or more caring? The default file paths are
> > supposed to be used for unfused devices. So if they don't work with
> > yours (most likely they don't), please add firmware-name:
> > 
> > firmware-name = "qcom/msm8916/Asus/z00t/venus.mbn";
> 
> For BQ M5 (msm8939-longcheer-l9100), venus works with the firmware
> provided by linux-firmware [1] and the default path (here "qcom/venus-
> 1.8/venus.mbn").
> 
> Just to be clear, should the firmware-name still be added in this case,
> even if it is the default one?

No need to, but it would be nice to mention in the commit message.

> 
> Best regards,
> André
> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/venus-1.8

-- 
With best wishes
Dmitry

