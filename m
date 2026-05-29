Return-Path: <linux-arm-msm+bounces-110257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM2CLQx4GWrewwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:27:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E1660196F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 757743031835
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046D23BD638;
	Fri, 29 May 2026 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7bdhRdR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQhSvMZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B286A3BED37
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053891; cv=none; b=uz8CCCVqQoBGJZUSXryvtp3+U459ucl4LHoArhX4D7YiGYTQqPbQrZiA1GuNf5b2m6clSqOBqPtoDGc/Svd4jL4DTN/zH58WSYYOy2ehXdjXqVE8YJxfGv3C86yb/c6ejk4iqcmkV/zekPeOKYTwzBzDSvFh5xNQPMtBKE9+PZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053891; c=relaxed/simple;
	bh=v5z54Xk4bSmgyuk9NpYqxo4keii6dzEKvD9OmkaJbK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeFpeBNls160pJ4F0cL4ifQUZQv3SzBu1Ue2m3CyD5kkdjDy4m3F27a4SYgXN6ibj1MJtvbm5oSFIu0juSVarRWnTIuVydc9lvtQ7LTHkN3KeZRQ4frjLIGcfKUutqvBCAjzjfoSnR9K/vrFqBeMcPgPw7fce1RA6R5jeENocQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7bdhRdR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQhSvMZz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T739Kx1829458
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qloH8P1ospu9RxarNeTE+kqA
	33QizIUuoyflf0m4ulA=; b=A7bdhRdR6ZoVn/jgz4lBLNeY9QR2/Py1cCOeQ0Xu
	dYO0FIlhzWXYYkGYRGUcFDQJKNV+0MxeDY5QGM+ehW6BYk6whBR5S7XpfWFoEvWi
	GPZIDNIz0OvB2HGALPKTYFgOB3N2RNtL3ws3g9IrUGhyAGMfN6MmBkqzHFaHmVjG
	xUTljCrw2R6b9ZqisXOYtX1IphCbl9z5G5rWJbj34Fbue+oEGNv9OXTVL4/8jpri
	wi5Tplp3gSNX/P0g+l3ciuvomu3iqsRJe2PyrskcSpk+OAiINskm/0CD0NGdnnrf
	1pL7nwdF2R5Gz3FiUf1jWkfSwtitlAXd/AlMKF5/lWvG5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m310v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:24:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516e0846095so119440361cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 04:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780053889; x=1780658689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qloH8P1ospu9RxarNeTE+kqA33QizIUuoyflf0m4ulA=;
        b=fQhSvMZztaudcMfEtnPpXfi83O83jKz7wL+kHSgSjdSTuDCZ59uI5qy2sH4S1H6A62
         FZDWc/Unui/UcIlZoSNa8QY+qLsS5h66ns4ttlD8BYcTYDUswl+NuiDN4Xfe9AJYxD/0
         XfBZx+K4n/gc2ryiO6dTooZE4w9Ugy0kZwG/AkwSa98jBeOFz33VBKfTdw1YP2AHQV/o
         3Ui//i+j3AxDBs1wUIVXw9T1lo5K8tovbGUVxPTxmVCK/Qq9LbWpo063d74RsNWe6VVJ
         xFDyWjYaRupaTjv208825CUaUlgaINcMvYtCP86qd1DPKty5xmQzrTXs1eroRyk/aKQX
         XyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053889; x=1780658689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qloH8P1ospu9RxarNeTE+kqA33QizIUuoyflf0m4ulA=;
        b=nDxpBWXEIQNDbjPfCogPi83rH1gnWfJf/KZ6ZGLyB8Md/c+3khrmF4bpTSiS+VI4xT
         EDdNNKFWtv3WkaLFjcAwU3GS0W9Bj7022ZV1gFnVVQxKJf3vSue6SMp6hT3gUdkopog/
         B3sw4fnJjhJmWE0Lt0ssY3dcwOrqarGzL3l3rQmHB5LAZIfOeqLznTLBWgN25+NDqc0g
         AwLpbljupWb9EEX6BWLdvWu64tytPYk4tfi9odjRFpq/Wcfed0nntS0aETmVTOSpda5n
         p/cul5DYnmaKs38xP5iUHC+rFmc6X4ayyLWVwyQiw60cyqYM70NPKYqXORgZp7L8VPjz
         cL+g==
X-Forwarded-Encrypted: i=1; AFNElJ8FWyte/Z2EOhXaVqPo1qWw4otbIdmMEnQSzp8FptJmN7j5z5En6rWmcGbU94erVB8BgvjWp9WObGRuZS4h@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1u082QH1aRjLExIm1ZN9ktHkDKWFmpPmMQbljwoIuypfCJ5vf
	YKtsoxuhKfgcnRG5lkt/+jVIPXkz6MfAl5cN3ScL+LOIYVF8eanqnAE+Cv7MXwPoBvLncTDUglI
	DlRD012Dvu2TLrWRlsxsMLNRGnk4Mi+fxpG4HfhHLLKefl+2aaVlS3zgyDz3x5prYPcJP
X-Gm-Gg: Acq92OFns6ECoxAoGU9Dj3l8CMSXykC+PBKR27E7M/MeSjcwiHOlZtC8OT6tsxUX2n7
	0uwu3yRewwHFKF3bquGJUU6sD62KWl+NICLorJd5Pz+NJNaBkctFcXUbKF1AQawnuJ5USSgYMnF
	7QHtCIGJPe5laeroYphneIQcG1ylo+YgtuAj1U7kWJriExs0hJFipKQDEt40ODE0Z4IgzyqdJGG
	dKYNkE9pqBrZ4Sf7LdB+GvRaO+R8wqUwQeOq2GzdTDCGcx9P213zAwhsDhGduhrr6ZRh2WPOo6F
	TQ9msf4MiVFDmOYoSXrjO/3dSJBuDaaoaGyL23c8+KP6H4P7xtJTfBJD/lTyOGGhNDk4cEwYNUZ
	NofKFQM/TUCb3GrgK5IYO7Zru3pZHMd2FauhYDFiiogiZKddMy+6G3kUxpSwHVjql1cIBOy1v6/
	SLibUt95Nc/EqK9FsZFPSTDX2f7+2bPha0eMv9W70tzntCEA==
X-Received: by 2002:ac8:5fc5:0:b0:516:a471:dfc1 with SMTP id d75a77b69052e-5172dd3e10bmr29951061cf.49.1780053889127;
        Fri, 29 May 2026 04:24:49 -0700 (PDT)
X-Received: by 2002:ac8:5fc5:0:b0:516:a471:dfc1 with SMTP id d75a77b69052e-5172dd3e10bmr29950541cf.49.1780053888618;
        Fri, 29 May 2026 04:24:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b068abdsm221819e87.12.2026.05.29.04.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:24:47 -0700 (PDT)
Date: Fri, 29 May 2026 14:24:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 16/16] arm64: dts: qcom: shikra: enable WiFi on EVK boards
Message-ID: <teatmsgijdgdfwwqy4nrcvcfkhpqybje52gkjzniqt23si2rms@bksrb5npq6ji>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-16-f51a9838dbaa@oss.qualcomm.com>
 <qhm4zgn3yiahv6dfucisu7uwcxddty4fvl3wwx6gk2zm5ggzlr@n3nqcpkkwxps>
 <57f8c593-11b7-47bc-8e11-7ec1b97210f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57f8c593-11b7-47bc-8e11-7ec1b97210f6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExMyBTYWx0ZWRfX4XZlhel+0sLL
 F+NEEijyxPbEJ6ew5xXtnopnFMEKsf2T2PTcuyw5ZjDIElXijA0TQ9VengxySHDkHUwPjuB0I24
 gwTl9imzqzoLDpZlzJwNgLgbb/GN1ekGz0et02tvcYumKRAzGyrJOBzI5i6RHQsjAkn2Oulb7eu
 xWwNKoLbQq3/NyulrLSyWc20WvxYtcnNqAJPF5d8C2jZ7z5YzpRNL95sCNexZJjL0vi42571kX1
 jxPp916JCb2kj4PPic+0qDA3N12RvSFUxf/Abtk97u6lqWGoS9mds+lyAWDR+AjqvajzUkNeeTt
 1OSnKrWIcmWiuoFluwDEM+d7fBTJoWRlqe2HJ2zCcxwiJEGcirzt9vn6noBHhTCgy2l2yVQkwqU
 AYpP00TijxcFhnX+IEt07i3MxdFUrj5hoYifEdhU/ETzzmZZjCL1z9PsR+eiZC7lYHVZNOtHtIk
 VJPXX47opUj92tME+Ng==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a197781 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PDj5yD4EQWKW1X4F5PQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NtT3zzUuEL8miUoa0j-2im50T5Dk9HOU
X-Proofpoint-ORIG-GUID: NtT3zzUuEL8miUoa0j-2im50T5Dk9HOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290113
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110257-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11E1660196F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 01:49:03PM +0800, Miaoqing Pan wrote:
> 
> 
> On 5/25/2026 5:34 PM, Dmitry Baryshkov wrote:
> > On Mon, May 25, 2026 at 01:19:20AM +0530, Komal Bajaj wrote:
> > > From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> > > 
> > > Enable WiFi support on Shikra CQS, CQM and IQS EVK variants.
> > > 
> > > Provide board-specific WiFi configuration, including power supply
> > > connections and calibration variant selection. The WiFi node is
> > > enabled on each EVK according to the corresponding PMIC and board
> > > design.
> > > 
> > > Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> > > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 11 +++++++++++
> > >   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 11 +++++++++++
> > >   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
> > It makes me wonder... You've added DSPs in three patches, one per board,
> > but BT and WiFi go together. Where is the logiic?
> > 
> > >   3 files changed, 41 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> > > index 259032bd20af..15208e1abff6 100644
> > > --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> > > @@ -69,3 +69,14 @@ bluetooth {
> > >   		vddch0-supply = <&pm4125_l22>;
> > >   	};
> > >   };
> > > +
> > > +&wifi {
> > > +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
> > > +	vdd-1.8-xo-supply = <&pm4125_l13>;
> > > +	vdd-1.3-rfa-supply = <&pm4125_l10>;
> > > +	vdd-3.3-ch0-supply = <&pm4125_l22>;
> > Squash with the BT changes. Use the PMU-based bindings. Don't forget the
> > swctrl GPIO.
> WCN3990 does not rely on the PMU module; it is managed directly by ath10k,
> so the swctrl GPIO is not needed. The details are described in
> qcom,ath10k.yaml.

See https://lore.kernel.org/all/177432372677.35532.960283784585134331.b4-ty@kernel.org/

> > > +	qcom,calibration-variant = "Shikra_EVK";
> > Was this submitted to ath10k-firmware?
> Not yet.

Please do.

> > > +
> > > +	vreg_wlan_3p3_dummy: regulator-wlan-3p3-dummy {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "wlan_3p3_dummy";
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +		regulator-always-on;
> > Why is it dummy? Is there no regulator on the board?
> 
> WCN3950_3P3_CHAIN0 :is powered by on Board 3rd Party Buck which is always ON, VREG_SYS is always on once the device is powered up.

Then it's not a dummy. Please add a proper regulator describing the
node.

-- 
With best wishes
Dmitry

