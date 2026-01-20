Return-Path: <linux-arm-msm+bounces-89912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHR9HX0RcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:36:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D86B14DE8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B687596ECF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382B640F8E5;
	Tue, 20 Jan 2026 23:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1jl8yGi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHvDwthY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7288340B6F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950311; cv=none; b=CverRBHNGNOT9GN8e5+DM+W4PD9tp/wuSRRNC9EWMVz9+Y2MQAUy4b/fkGkWI9KgmdjPgPmD44ojGDIcZIMMCayTKUckGN+KqwGQxiDidbC8WIX+mCs6U39sjtYNq1Da7R3ocVZ7czkxTMGlQLcK1LIrUYN5caS7xDBnHJG4cso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950311; c=relaxed/simple;
	bh=1j0Q7pzf7hRqlVAsUJvrX/tEEQPL7qnr4VVR8jMUNds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Srlfg2JJQe1kOcrWQIDT9A16/4zKiyphtO9CqGhTqBAp1CBXgAMOHGXo7qn2dukxqzNH9UyTrC81AoN38qJ7b/QLi0uM+f2RH3a+EeeT8MSnK/xNZ+rzbe5J8G4GCPmDbrm6CitIupCNiLhpNUdeDHdeHSS11Vi88j0cF5bdXt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1jl8yGi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHvDwthY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KKsQMK1037155
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GX80EvWIrKsY9lpmTcbAZWS9
	rKhCDtXMk6nX0x3Jqa4=; b=o1jl8yGiCVqVRV+QVz0wLA7JlQUIVvqJ9dafY23/
	raqoYDeVFq5SPb/r3Q4LGOLkP1LVn+ctg6Znx3RJYRe3COBikG/P+gDSzgMgSd/J
	SCTa1klEBv1dG/LyX9LuKDv5SKD+tGCQn3mRmEFJjy39f01mNkelrasRV4/p1NyV
	eO80qasxDBAm2qJLDsYhilbb3MWqsD+qcWJJS4spSRO0VQt5OCwzzBFbi3EowPzD
	4Xr2teINTn50uxUrjPsjCyofeN2EsJn0rBAWMEOogesSZWvxLZMc/WpT5J4Uzo9q
	tyQJA2BwmoKK04Dbl79z/SfMeHE+EON7JQQ+u7WHKxVVuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bth55gc7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:05:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c538971a16so202304485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 15:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768950308; x=1769555108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GX80EvWIrKsY9lpmTcbAZWS9rKhCDtXMk6nX0x3Jqa4=;
        b=CHvDwthY/yeqz/Bnr2kIuT9VV/ea8WpxUjKCJ0c4k6zuXJJjmPHT4WuqtjKdRgEsiw
         05r89Ocr5EBOupP+NhRhyz5k/TUXavML4DD5yYqt6GBkSu0wwcOyW7Zm4q/pube7uMVI
         qbindJKDi2e01Um4TQuTLTk9ubQ7iTg4AL6F7Pa2ZR7GzMBxQeH5ZQ46leyvWANIIIVb
         oxrNk2Qrek3EU4CaqRlagCSkJ657PJWn660Fwj7O0QG8SxUdHc0A9J1GQuVV0jEj2rZo
         XuMm4kaqpzn92aeO8opWPDCaIjvW0EuhatZo2Pu2h8GYg0gBYYQCI1O1TW52c4abMALS
         mvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768950308; x=1769555108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GX80EvWIrKsY9lpmTcbAZWS9rKhCDtXMk6nX0x3Jqa4=;
        b=M5yvnJdCCLcUohaWQMHOchx+wszwPt54KWR2IopvSjVUC7DgUXPVBhHUslrSRx2ypr
         lYMzkEiZIfTL8Cjtda0MTnzQUUnZCt9Qd7h3Pfp7oHBwXA1NImhF26smmFDyBejAn8rn
         6Fd+87vgUbX/3THWGHgS/Nypjg/McTVXldWeVdc/8zVE+VPbO4+oDV5jmo6AmKbWWNnx
         8ifX6rWHxEcwv7YcAH4cnJlhVfd2JntWlwTHUKo0JXTPKerVMm0/YqFSN+wo1zAH70Vg
         jsgwGPdHawLcqRd+VWhOdSGBGD+8Hqbm/L72XgHgDq50Hdl/nfqhV9Vb9kLQOWo/yRdN
         ZUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU833Y+m4CJXys7G1abEdR43Xpr59vPhPKn7P1q2+am13xaa0OYT3uYVnHWOx+FfH2zgZKfPsHX0ZeWHxlp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xLjsELCuTXFZoQK6+hA7FaTXkSIdF3kpVyQlG9PHHLkExRhG
	7FYtB1P8NgcGE2UzNkRzp4Px4d182yZWV6Y0/8hvDuyirjebw79Qbg7Fh+oegll2o+brgsFTvth
	JvEXEDJnjwzWuwN1TXIcwJsWtZf+97/1PYY16s60BHzmK20+dKtHthLjwymGQAxPoI5g0
X-Gm-Gg: AY/fxX4Z6L6c1A5Vghfu5U7gUtm/yFLmb3tgDD9d8m15VQovOWk7q3bHzbZlmeJRfbd
	vrEm40aMo+BPjccAVBZ+kEbqEmX4hbg+6Gg333uVGJ3JxbluQfxVQit5ZfLC4lF8Ft9tpF5NPiQ
	7Q4jZqypsmJyOAtVV08Ao6XumY4/SBqMXSw75egANoLDO+xmIDcuB4jcsoBcPs0CUvfNjtm53fJ
	0nZ+KGCzOOE8/okw1fqgYYuPNaZ8zzECQqccHB7eNbckHtPwvu+YDcjtcYizZB0QL4vjYo0QEWY
	jmRjA+kj7C5s+Rkrs2ue8iWdIIQ0XuRBV9oC4jcmPArtWflJlIkcGIPAcMw6JOSkFBgHpB4nxWV
	CMDkvKbS8M9NaOSkO5LeM4To8Hj8mpkHuSuZpzP+R4akFvABNYYG/PVonikTTM+XXiVA5MJ/x13
	jPBeER3RlFe1nSFM2xMHoixW4=
X-Received: by 2002:a05:620a:708a:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8c6cce504d4mr450311585a.87.1768950307556;
        Tue, 20 Jan 2026 15:05:07 -0800 (PST)
X-Received: by 2002:a05:620a:708a:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8c6cce504d4mr450307985a.87.1768950307087;
        Tue, 20 Jan 2026 15:05:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384dbe6c1sm42390371fa.22.2026.01.20.15.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 15:05:06 -0800 (PST)
Date: Wed, 21 Jan 2026 01:05:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
Message-ID: <wpjvuclvpjft7y2rlrmfgszkzmc5vvmohif3etqrtvymxjjyjk@h2dujh5egdvd>
References: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
 <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>
 <DFSOPXFSOUY2.2Z6XCLCD796Q@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFSOPXFSOUY2.2Z6XCLCD796Q@fairphone.com>
X-Proofpoint-ORIG-GUID: _FRtvCR5cqEb0vkt5ayHA6ylNtrk6SnW
X-Authority-Analysis: v=2.4 cv=Oa6VzxTY c=1 sm=1 tr=0 ts=69700a24 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=5kQVAYz2r87DXKKq-r4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE5MSBTYWx0ZWRfX+98iXFyogfrs
 LF+NlzfUkepZZ3xrpXOrJ1Mf6egGBJetisCsv8YeuOzWyUYUjuaIiOhAbzcjwx882aZ+zYByYDL
 9hhdJDGA9N2Qe4IDmf3vDNkYye8fw+85LNgqaitGRoF0RjYU1Vx42WX2E5r/W8jwwcl65fNdouG
 Wn3j69k2XoqaIqojivc2Npu1qtOtCwYPyeJb36LFmK0pj/eiFTYV/leZMS6XEP0iZiUps9RpUZ8
 TQDxHu56IWN1rITxFLHnZuczJD9pjQaqWrozbbM171p+jV0siFd6r0dNFdQA3cpm023qthTbvEG
 dBtRVxlhr4zRMeRkdIBuNZNSDpVBN7Oyq1632Y7uI0FVmkZsIjDmTACRotVl0rhz8Ia99r2rfxr
 vKe21dvIVvMuGmyBqg2f4BsbaaZHtaoo6u+2LwASx9+BSXznWNvCY7Y+kOHWkNwXnZPY7BqjHS2
 Qp4szTyBxofbCicBAaw==
X-Proofpoint-GUID: _FRtvCR5cqEb0vkt5ayHA6ylNtrk6SnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200191
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-89912-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[fairphone.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,fairphone.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D86B14DE8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 04:52:23PM +0100, Luca Weiss wrote:
> On Mon Jan 19, 2026 at 3:41 PM CET, Konrad Dybcio wrote:
> > On 1/16/26 3:22 PM, Luca Weiss wrote:
> >> Add a node for the Hall Effect sensor, used to detect whether the Flip
> >> Cover is closed or not.
> >> 
> >> The sensor is powered through vreg_l10b, so let's put a
> >> regulator-always-on on that to make sure the sensor gets power.
> >
> > Is there anything else on L10B? Can we turn it off if the hall sensor
> > is e.g. user-disabled?
> 
> It's the voltage source for pull-up of sensor I2C bus (so
> ADSP-managed?), DVDD for amplifiers and VDD for a most sensors like
> the gyro.
> 
> So realistically, it'll probably be (nearly) always on anyways. And I
> don't want to shave another yak by adding vdd support to gpio-keys...

Why? If it is exactly what happens on the board: the device producing
GPIO events _is_ powered via a vdd. Added Input maintainer / list to cc.

> 
> Regards
> Luca
> 
> >
> > Konrad
> >
> >> 
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >> 
> >> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> >> index 7629ceddde2a..98b3fc654206 100644
> >> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> >> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> >> @@ -32,6 +32,16 @@ gpio-keys {
> >>  		pinctrl-0 = <&volume_up_default>;
> >>  		pinctrl-names = "default";
> >>  
> >> +		/* Powered by the always-on vreg_l10b */
> >> +		event-hall-sensor {
> >> +			label = "Hall Effect Sensor";
> >> +			gpios = <&tlmm 70 GPIO_ACTIVE_LOW>;
> >> +			linux,input-type = <EV_SW>;
> >> +			linux,code = <SW_LID>;
> >> +			linux,can-disable;
> >> +			wakeup-source;
> >> +		};
> >> +
> >>  		key-volume-up {
> >>  			label = "Volume Up";
> >>  			gpios = <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
> >> @@ -316,6 +326,8 @@ vreg_l10b: ldo10 {
> >>  			regulator-min-microvolt = <1800000>;
> >>  			regulator-max-microvolt = <1800000>;
> >>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >> +			/* Hall sensor VDD */
> >> +			regulator-always-on;
> >>  		};
> >>  
> >>  		vreg_l11b: ldo11 {
> >> 
> >> ---
> >> base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
> >> change-id: 20260116-fp6-hall-sensor-1049f2f872ac
> >> 
> >> Best regards,
> 

-- 
With best wishes
Dmitry

