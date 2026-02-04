Return-Path: <linux-arm-msm+bounces-91735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLlKMhmUgmnYWQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 01:34:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B565EE00A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 01:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BAE803051927
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 00:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FBE2040B6;
	Wed,  4 Feb 2026 00:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iiD/SY5R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOPl9hhW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA541D8E01
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 00:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770165269; cv=none; b=FY7K9L6lmablxodMQdWwsJ6Bg3DL9brdD8qIdvHJWSO+MhROwHyOW0yKN8LyKzC5EpjCMyOKz1xRvy2VbWwIvuFF5CDONYFeuuBT7aFiS1rkOCvC9ydWSuf8m8epULz+rxZj7f8qsd1Ky9JxeCaoV8Y4ft7Gi+iBA7JSArNtgXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770165269; c=relaxed/simple;
	bh=JZQapraUF3c0HIr1n5jj+Xl9qv7HTYhB1kxe5WGZUaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSonQGO8EErb1TGPWSC1YDvahte4FgSCSdyGF/x/wapmzXq0pwoB5PFkBchesN3VriJ6aP1mdk2FoOclDw3KH9Yv/TDxZb55SD1UYUYleFKdX0D7VVV8kaW5sehu19LoK2cKaOx7UR3A5nREYG9rMVG+N7dqMrYuO3QjOrvdcQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iiD/SY5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOPl9hhW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlkkV2667192
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 00:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+Y3KpF902MQDgPLjbKI9jOw8
	WubVDSA0uuvgF9yv9j4=; b=iiD/SY5Rgv0STdjZ5h7frGuIcMsCV8YFBPpsHp+d
	6LVuHDda6W0DujxoQzCS8NMvvFacO3Iq0WkN40Hu/lAWS72aMQQHiuuJeXO8YX39
	W/6Gi08KwNXZZzhU/984rhIMVMzAHkgDjH2HoE7YeDHkEr0wjIMRegZ4aGUM3OvJ
	ASWQSFXuUBAFSbIotCwio1c3fb3Hk2HBBzos+K+dW3Xp+HNRGHB4ps5LgCVN+Mi9
	uBF3juwgZJnhngOb808MeTwlvnyvkiipQUr+olmfR9H3AVkBodEoGAs2xigPwSFs
	PhYNpZeFRnjhFp4D0p+i1kr6sUgzHts4cb09RAHJAWCBjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3nf61951-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 00:34:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52d3be24cso971047185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 16:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770165265; x=1770770065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Y3KpF902MQDgPLjbKI9jOw8WubVDSA0uuvgF9yv9j4=;
        b=cOPl9hhWamm91ab/QF8ki42J/YjU3sh2wjNqKB20bH8j+bMlQTL9eEfOLEilkW17nm
         5fAm+Q+LTqKG4zZpcGT/mjpLjGpDndd3lu2Xw56O7suEcvXcFHpq3fKqIjscmczNWpwx
         kL2O4WFABqudSQc1Z4p7SIW3Ik8WU7DBwvyKS0zg9w0hYlST5UzVPQhpvqkH5b+MlITK
         JXtd+stePugmulCvgbFZHAZvO6xobG86irRXz12PW9so+MdTeYZEK+ymu4lUWgSeKgUk
         CiCLjdQbYxX135xYHOSL3Nw5u9OMCAhCHHhRVmutXAU8JbhXzwy0oP/xAJtvfxzpzSSq
         GcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770165265; x=1770770065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Y3KpF902MQDgPLjbKI9jOw8WubVDSA0uuvgF9yv9j4=;
        b=ad1miXdI80djbDBo5iteNnO6WBmbH3tsEzo4YbwVVZbDXD/iQYMcx8Se7hfFAhiszb
         GW//Mjz+3uZuI8BE6wr7W8zx8Zy/KUorWRK/UixEEwp7sxgzGdk8dB/42dpIkJ4KPSKJ
         Xeb3/xPujTcn5GhSqaa/5F7Ge5uirmyV34t2WpDjBSEMxwQeZXyTfUtJSqt9PwBl7tsE
         6+fVv7oD8RmqHmFEAo/paTtpFK5Gs+SJwsnbaxAuoGEGLtOEdHfaq1OBVbp2JLuTGbGA
         0k7w0/UpcqN1yIOmvdT7MxDD9AKtESJplSSYAmc8V3U/f63DcdShPg7HABdvTQvsI32Y
         7J/A==
X-Forwarded-Encrypted: i=1; AJvYcCWazGX7KqRpqqvondowk3/0RVVMNp0ISD9VAoTgyXX1sOLNoszWWUfLuZ4lXbj6n35T7y0NHXk0/xy+Zopx@vger.kernel.org
X-Gm-Message-State: AOJu0YwkNprJ+PlZ9Mz529kfpqy6kJercFIDwkpvoT19IQSsT/QmCz7l
	wNwLieC0H7bYJQrSE+EkIs0onzAEC14tC2x2HMozr0Qd3yUITBIAnFC/2aDLrFSZ/XN0wFEWn19
	i2q/QSJrBwyoUKwpC/r2hErgihG9Uaf05j4FTcc5Gs2fsxP3dlEwk67DH/oUmil9C4u9Z
X-Gm-Gg: AZuq6aIVTA/uXDLmTSLdsvNpdMwqOBoaLNLXyxk3FkLb76/CAlKzDHyVOmvTlm/hnGn
	6j9Nthd+l/2x05+SeFb4I5aJ0BC9lzR69uok5aKP7S5CtsiuywJVcxEfF4Z2TvdXcyxoCJVs8cv
	d15Kht53dR+3DfTYX10nRRJKLbY8PsXc/y6gFOtob/pXRbblUoAgTff9vYbdaGLuE06U4a8+7rj
	M8IPWII1xotFk4biNt/qKauQpH+YSSOJwdmnkya9Jbe7f0h2xgA06i76DyWtWbgA/DqkiMNgvlO
	A/U0wQIycM9Nlt58HCCgQol4/EzmjRPHDSVmxUdvW+UgCneEmOfknJlUbi8XkjXJr7pJnV0uE3G
	CPBuy+FPKDWRPh95hkRS3Nr6dtwqbQE9NUFgxGgVxb96vaEHKuGfnkyG9j2sCi3RlLm1v98XeHB
	tDrQvDoq3goqEl7e+EOEjfDKE=
X-Received: by 2002:a05:620a:2808:b0:8c6:d628:8bac with SMTP id af79cd13be357-8ca2fa066d0mr184301585a.73.1770165265030;
        Tue, 03 Feb 2026 16:34:25 -0800 (PST)
X-Received: by 2002:a05:620a:2808:b0:8c6:d628:8bac with SMTP id af79cd13be357-8ca2fa066d0mr184300085a.73.1770165264545;
        Tue, 03 Feb 2026 16:34:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3869204003esm1713351fa.28.2026.02.03.16.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:34:22 -0800 (PST)
Date: Wed, 4 Feb 2026 02:34:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
Message-ID: <abl3lfuruwzyrvf4mz2kcvhfr4efxwms5cqgyfcnfsf5ntwyrt@dyqdamcq5sru>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
 <95d2ad4e-082d-b399-3a35-99fd6a3e78c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95d2ad4e-082d-b399-3a35-99fd6a3e78c1@oss.qualcomm.com>
X-Proofpoint-GUID: P1BnYsU4g1I_o0lZewT-kSuvI2KJZAe_
X-Proofpoint-ORIG-GUID: P1BnYsU4g1I_o0lZewT-kSuvI2KJZAe_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwMSBTYWx0ZWRfX6SbObz5bQviX
 /ZMfJDgx5muIWcm6iZ3MipnpOBMlsbOIDlV+B3vUPhIw76OWrKGmc/QPZYpPc5DZOhyioGo7oml
 SGR6LG8V3Mmo2Y5aCN3nQOL2TkQ0G7zBCqZ4txMhZSfJp/Su5CVjRGDz3PkpoWYy0LMPJ2Msyy7
 8KR+Cv5KhMOJJOrR6PXGt4Oa3JSQhQR6qiP003M++O2PetuN80LpN9S9K7PShqr7wLc26iv2pHf
 qJbceeZzln57eXDCWniR1DE7h7r48FRq3ohnK2Fakn1HMQ5uN0d2qur/KKsVd3Y92gq4Yu8HSx0
 OBLelP7mDOA1gXtv9/MhVeYZ5e+092cHIjf7mjkf1O+4ybHfC/mUtAYAKC3gYRB4SztjI13+eem
 SJlSh22f1FzLVuCx4+FT3KumRpF54eFmxo6/UgTWH0eFTt6YS+m5MYcPbb0Bm/5t7/XuEcGE2UF
 lWpzqJMnFnirV7mKpsQ==
X-Authority-Analysis: v=2.4 cv=doTWylg4 c=1 sm=1 tr=0 ts=69829411 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gnWdZZE6b5bJ3VmEtdEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040001
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91735-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aa00000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B565EE00A9
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 02:37:16PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/1/2026 4:19 PM, Dmitry Baryshkov wrote:
> > On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> > and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> > qcom: sm8250: Add venus DT node") added only MX power rail, but,
> > strangely enough, using MMCX voltage levels.
> > 
> > Add MMCX domain together with the (more correct) MX OPP levels.
> > 
> > Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> > Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 980d6e894b9d..531470506809 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
> >  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> >  			power-domains = <&videocc MVS0C_GDSC>,
> >  					<&videocc MVS0_GDSC>,
> > -					<&rpmhpd RPMHPD_MX>;
> > -			power-domain-names = "venus", "vcodec0", "mx";
> > +					<&rpmhpd RPMHPD_MX>,
> > +					<&rpmhpd RPMHPD_MMCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "mx",
> > +					     "mmcx";
> >  			operating-points-v2 = <&venus_opp_table>;
> >  
> >  			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> > @@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
> >  
> >  				opp-720000000 {
> >  					opp-hz = /bits/ 64 <720000000>;
> > -					required-opps = <&rpmhpd_opp_low_svs>;
> > +					required-opps = <&rpmhpd_opp_low_svs>,
> 
> should be rpmhpd_opp_svs for MX for PLL to get voted to 720000000.

Ack, thanks!

> 
> > +							<&rpmhpd_opp_low_svs>;
> >  				};
> >  
-- 
With best wishes
Dmitry

