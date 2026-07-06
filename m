Return-Path: <linux-arm-msm+bounces-116868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eSlnDSW6S2odZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:22:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A29711E5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:22:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ot5IHOor;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IA41cOCu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116868-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116868-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 335FD310609B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6D73385AC;
	Mon,  6 Jul 2026 13:48:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D706B33121C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:48:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345724; cv=none; b=IxygqVdz/W82+Z+vA8VR/1b/Ts2bK5I7IyXyinAgFXlKtgLsqRmiFqm22gzpJeABSPBLhjHvb2zrZ6vxM1iZFIUgKuH89gQgBfRNDX2Vemd1E7oFiq5MI5bjjw8ahLsSqXEI4VREGlJQBDKZT0I2rRK1vn5LBpyZenFBEdCwsB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345724; c=relaxed/simple;
	bh=8OROlYXRbrpzH6vJbohoRtZFL6ExMq0gugpmMioQgOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZvZ+BOxo4O5AZv8q57G56RgAfoEgBgzXztJWFaCPq5bH0RePbVcmtXBYML5NHAACdSTGru16CslKcKlDNCu345SBrcSc4l0wjWnS2j/6FQsrwYXwwQFL99KJRUAqmE6CYk4bHOBRTA0/aTVs74PnlTIkT2GLq4Yf3ssxhuBkp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ot5IHOor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IA41cOCu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxD6n366706
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nZt0YV3IbF/vrCP/UsToBBUQATNpfFQK/SKVJfqvgA=; b=Ot5IHOoraIc6IFRL
	Yr6Pl0Tn+B3get/892w0e2C3twDlVt/SaeEtAhRsESkjP5YT+3fN9FXQjM4dRQLe
	BjCDpJwYJ/0DOlt6CIkXjdBo7cHXvamLVVOhAE+Ucbdazvz2qwCd9YHTkH/tlvwP
	OvtjZ0bXV+mnpZqcRKqG3b31Hu3+nhI6EpKS1ZkZizz5ZgdnAq8yHXMT/hwdHeeu
	77/UomJhhKh2w3etQ2rduTow2CEvvPBH/RoxQLYv/zets2r828m5UL1GKpS7Oe/F
	GKlCJyduxYsGBfJLT9Bf0fRiLSPUcTKaYeY+ahfMLKU09BNYBJ56J4ztkni1dA2r
	C9wjvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891us6nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:48:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915d3261c5cso261967085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345721; x=1783950521; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0nZt0YV3IbF/vrCP/UsToBBUQATNpfFQK/SKVJfqvgA=;
        b=IA41cOCug1VTbcTYYFqSOUdW87BkOiIo/CJW/FoChGiUp/HDCFMFqjNVIjWs8YKm8H
         IydUUN1hcnZs/r3XiOyLsvrYdz3KPeusyLyghgZlE+CIkKAmJdOlFhyBVRnG9OHwo6kx
         uuk68X15GnqJ9CsTF29/h+k4Yb43zTPL8vjHIXENv+wMBhpMQ5nRsiHS5FDmlbZe3c65
         5N88Sj85IBhy2B8RGdREhLbLWAEsggL4N9ym89Q0MqG4/vtsTxbenMBCeyfaZBteef6T
         SnZqJDGFffwoxfOq5nMqzhfOLTuZR7SugTZpLo8C8UM5Vvtk4P5v4qPb9vrzkba/WNJP
         d80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345721; x=1783950521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nZt0YV3IbF/vrCP/UsToBBUQATNpfFQK/SKVJfqvgA=;
        b=gqP3QoOXuRCcHVxZbq1hImkG9C3MH8M6oRKDW6mzzXIc/6ciohFoYDrT83L1kyWji+
         oHJhsTXhbGLHEjeF5tmQx4Esgld1GaaFUFtOfCXl72wOgY2mpuw5fpN5YsGsYxlj9FQF
         hw2j+DMNLL2JMsk74FvLIMYhCzvtAqBz38Nn8B0C4sNNi/AvebfBe9793NtweqZKnwUU
         wNPNgc5OcOS+LZkvPvmu6UDIwh2bO4+4E9nSF1nyxGjGI94YyLh1UmPLaMlvylDU9uhi
         BVZdrTiPUQHEfYtaOM1RPT4jXAmU/rIfffO7KACGSSaky6bsHkgKRbZ/PGX6af0tOihX
         MJZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCxa6i6MUzv5MdINmefBPUG0A0UhbixiQumnYilfG0t0aK2o9jOA9q7NJWAmHrYBlZeikyGbX1p6y9/s9Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhj6JwkIFK3V3HDzqViKGumXV7ix2lAbkXMrJMB4u9KvXUdMZN
	0ly/TdGrtPn/LD3hsYERL1EL2YJXtXilxAFijxoorbq90kmpkhS0VPvHmtj5i5VbFbh5OrGSAoQ
	/5+YolLyd2sj+m9u/Lie1CDbPwblNPRbBmiYaQzawW2V2iKt3DPVu6sSc1lftimk+v3ds
X-Gm-Gg: AfdE7ckBvhEMw+WpHNm75wxCra7MMSdT9hbk3Xp4umxg0NPV5xolra2mvcf6aF/qQ7u
	xpIeVgWX4TrqVNIsysMSre9/tAR/+U/hSVgoRt/kYAYQYFmb23b0qi0OnVwA/RNoGi8mXMzQ6DG
	Pm7w2gZ7MfSBlFhU7Utny9BnxU9x3awjWZLZq83HGDtj6TvO+KoGKEzhcIKWDvNrd8fSGzOJle5
	Mk7tkmaPBRIYyomGXuCNHDizZK4o4vHPUqXV51Yzpk9+vG8R70NXv5WE4r86NhILAmGb6sZvH+g
	zlnmK9EY9ac6b20LgKSVgHEwbcYYaIM/rBjxWu+Z8ipR9PMFvPZ9JHvhFMs22sx0QFCJsRBe8ma
	ViUpiKbBdkL7ZTvRoTL/wQeJiBc/r+DjMtKpsC6QApqaHPkXfD6YYzAWIpbnPPp+CjNI9Iy6j4G
	mTcGtnsYVeVw/QD07s4qkr01Rn
X-Received: by 2002:a05:620a:4041:b0:92b:6805:9197 with SMTP id af79cd13be357-92ebb59fbb5mr84326785a.63.1783345721042;
        Mon, 06 Jul 2026 06:48:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:92b:6805:9197 with SMTP id af79cd13be357-92ebb59fbb5mr84323185a.63.1783345720542;
        Mon, 06 Jul 2026 06:48:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4adf5e87sm19579811fa.22.2026.07.06.06.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:48:39 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:48:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <qb554wbejeqjdzv4lyrmjuco3bfvbb3cb775sbftybhwcyc4fj@uczxvdc7ppec>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <7815e3ac-30c7-4564-9a7a-6a1ecb9278c8@kernel.org>
 <52b7ee6e-bd99-4555-8a49-6cdde1331714@oss.qualcomm.com>
 <23580f8f-ba25-4dd7-a2d3-f2df9bc7303d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23580f8f-ba25-4dd7-a2d3-f2df9bc7303d@kernel.org>
X-Proofpoint-GUID: 6vLqJg2qf_vcUE_IhlozVRBJvOQcoCM0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX5NQTPa/6Vben
 gP7wvUODPvBf4Y16zNfrIcIuXDrzsxMcdiFSapLCz5AIbBVb7dF6mTEsCRvsc4CXA9LXOZsri2b
 D6JfnP1tIs2oToW7tWLegzmJN6mVB1A=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bb23a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=fzYDJ1lVqJHfsV3C4UMA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX4AQlfW9xvfIx
 6xjkLPX6zfH7z3jNeDwctEFaIYjr+5GybEJjykwjaRRGacpkJJHWhH0w1xeFfsgKO8FhlttLnKS
 JCYY+nbXtJV1vIbdRad5xKtax3BNBVIqywLZ4I9VxuGR6GItXSHXHXOAJwfae5+tCG6xby7Bzcu
 eO+3byzIoilf3uqESPH9duFHG13m0I2G6oHpRJ6PX+yj4sd4lRzXzyIZMYuwjSU1/s6i8tAbix1
 GocmCYEAgA679pNprwJGVR3g97BU9efTCMMNZxgpbMVYZsxsIAf3U1HZ4xwKWP+E6uh+g/56HAb
 5tCvTouKFOdMQTEZVDMY6djeAWToNRJ0IvVmBgn+DFzZJ4gsuludpd4bXyWt/73bl8I1iJbV6U5
 YYSmcz57gKisRfAOLf8s+ETpJVP/QyxjhCdRkCZmLvwYzrsim/Q1hvhhx68ViQe4j9+tKBbpuv9
 NPFO/wiP7bFlwXCo7iQ==
X-Proofpoint-ORIG-GUID: 6vLqJg2qf_vcUE_IhlozVRBJvOQcoCM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116868-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4A29711E5C

On Mon, Jul 06, 2026 at 11:19:59AM +0200, Krzysztof Kozlowski wrote:
> On 06/07/2026 10:52, Arpit Saini wrote:
> > Hi Krzyszto,
> > 
> > On 7/6/2026 12:03 PM, Krzysztof Kozlowski wrote:
> >> On 06/07/2026 08:04, Nabige Aala wrote:
> >>> +	lcd_bias: regulator-lcd-bias {
> >>> +		compatible = "regulator-fixed";
> >>> +		regulator-name = "lcd_bias";
> >>> +		vin-supply = <&vph_pwr>;
> >>> +		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
> >>> +		enable-active-high;
> >>> +		pinctrl-0 = <&lcd_bias_en>;
> >>> +		pinctrl-names = "default";
> >>> +	};
> >>> +
> >>> +	vph_pwr: vph-pwr-regulator {
> >> Why so inconsistent names?
> >>
> >> Anyway, drop the node, not used and not controllable.
> > 
> > As per the schematics of LCD display Bias driver , vph_pwr is used as 
> > vin for that.
> > 
> > So I created vph_pwr , if you want , I can drop that in next patchset.
> 
> But vph_pwr gets its own supply from main power, which gets from socket,
> which gets from building wiring, which gets from a power plant... Drop
> the node, as I said, it is redundant in DTS.

Just for my understanding. Is it fine if it gets used as an input to
PMICs?

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

