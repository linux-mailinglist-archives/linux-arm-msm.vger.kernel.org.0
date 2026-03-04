Return-Path: <linux-arm-msm+bounces-95238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPAJERiRp2l7iQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 02:55:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A1C1F9BB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 02:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4ACE3019C93
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 01:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C2830F531;
	Wed,  4 Mar 2026 01:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhgK5UDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJN1mqF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F963246EC
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 01:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772589334; cv=none; b=FFtg/eBfLn19oypAysIDeoXah0QwdQK+zz3531R/jlKJZjcrvk1DrZQbcjQIDVgtNXN39irXABVApCwv1M5yxCRuSKS5nfT5ThKMU8FfYB2g1rTgv+HFG/lYirt74SYFfKVzOwJcYc+zi6kqa08/HjVtkxT9GIIQBLEVP6RNgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772589334; c=relaxed/simple;
	bh=UFg+j/Y8ZucMypkuZJF7sEz4IZAIuHIRmFuQhsOzIpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OI17i28xyyObqXosZZ8Gm1cJlr5/IDa59r3kdWJSXaD4RjYQNPBUQF915lZeTQQM2f3AFGSR192KJsJx/If7IXnGW+9xmKL+lWtoOktxu3L56/iKhR3ODs5BqrwxqmLWd37lUSWlMk53w1pexfmlth5i0z+vl4VFXdfu42wifSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhgK5UDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJN1mqF3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0OZm3708650
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 01:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OHbm5naIkR5F0mYCp+/Z0mxA
	zTgo5cKKpME6H9yKg1g=; b=hhgK5UDNlWdv659lFXkAByI2YHxtScYeLL0QduTT
	MhOkzDFl2lw7ys+cgdz+JX+lpdlezAFPIKsrrwpophIMphyj7RGN59FwcAiiLGDR
	CMIdIjcSRuBxypSoxiC42cig5Q9N6hOQq9oTeypHKkGfej8YX/DxTG3xT7o0Nla3
	RyyrE5XI9D7vR9Bbye19bDImp/HoDoNb3rwHtWJ4op+P9APmu1QWPZ4kltY8kalv
	nDSnNKIsQ19kDBHcvd46p4epmz/pLSSieOFkSlqVEm1S3K5RehQKc8NHK5wJgfmU
	e+YxvF8UMn0Wflykc0p0xB9nBeE1qG628LTl2Ls6n/A4Lw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm3w9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 01:55:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4d191ef1so799933085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 17:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772589325; x=1773194125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OHbm5naIkR5F0mYCp+/Z0mxAzTgo5cKKpME6H9yKg1g=;
        b=iJN1mqF3UeFAqM3CIR/Ts6MNMRvFapnG5Fihqn8MtbU8ddGq+zxI+c09upqRAT7hVB
         /7VaJJW1QkkX9PsWVLeAqCEecSpUCozNw8x3vV5F9gJmiPEnT5KefZpmQALdJK9Ftl3A
         LrTzkE+h6Ps6TJyo/cUhxhemsENmX029W5ZgkOnW26LtFbA+obavn1S+glamgo45tfqB
         Vco2103j12eIGZeyE040vQFUBbodI62p1TXHKalKYFmRCI/1eUtdG4MKq7uYVaIj2571
         DU2bPukmUTKooJBzZP0S7MTGkW1qGwWm5/yWDWlAmQbqr+VIrN9X5xd6QJfbuNVQNQVp
         VJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772589325; x=1773194125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHbm5naIkR5F0mYCp+/Z0mxAzTgo5cKKpME6H9yKg1g=;
        b=CRXa+d3ExCoIqV4jk9QH6aJoXGBb930MBtNQdAkfFG/xokP3fWPaMRvszKmcI+Pq0X
         ta3bUkZ0dVCOyGGolFQ/qOszfphI2lz3efl6w0gG4aDwAx81qBwuDza/pROLrhWBFY+o
         k8rHIZU//oTuf0Y8S31VXZjJDbZZmdOIK5gYXBpNs9q9OTLvnVGi5o3iK1a/Fy8wON3c
         rKMuDBf7Lxf7Ws4BEcr3tpCTBDYILrTgAwvS/GEv4OVzYh5T/rP77zS+pG6V1E/HaiST
         O/c94ESZ0AKq2jt8rtbpsUKsnzQZ/BXEyPNY7NGHNn2U/CvX6ynGzlQU5WHUIW5kgww8
         3LUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjvPHLuOgv2X6D+kHT1+sHdWV/0GAfG3mTb1KKafY7tvsTlq55BYNEbO53haTMqgj5UpZQmaPYst0CasTI@vger.kernel.org
X-Gm-Message-State: AOJu0YyPBum9g0eGOYWuZYuGucE1NICmkxR336sTnMuL/yyUbggwVUQW
	dUyait0KrjSweY8Cw52yN61CTgYFpu+pBHgaZINLJM+TG1TcOSSCZUd0Z0HZasZ/pciUwIlgB2J
	AvGKI8tcZD7c4APX9hLFdFdT5AF9jeO6dLkoQsFOVt4BMKRdMfJFP9JtUJFwcaxYTc67a
X-Gm-Gg: ATEYQzyQat0i46NTqsnKeMFVNhh4DNdeCwU1QPYDaURYyxqg60nwpUyZmjGcvoPgm0N
	ryIOquNsrGNVcWfJi60IPFxrgufPXC5rdkCZFn1OEtECNvreufOiFQuFt1lFpq3vQfPHCOSQWAR
	BJUJc4ZVAAkE43f6ixSeBhXtmZWYoxvtn3pKGZor5tuRiVBaNALFNrLjYgOV/yRC0VLh08Btxe/
	dG2MOVmNNfPRa2TsJpp5orHfyAQQhLNYdP2LGUaz5J0eHKEPXjuRZDAzzGk2ioq2thkDcPI8h6S
	mP+3ZjdmYg1r+ZtWb/5PoBa7Uv9vEf+/s6bdpm3X1JPKbp1n1ITkvj5VuAF6hctnDewPfu2DTe5
	qHt/FTkSlmczf+b5wNhLn2L4lUdb9e8G50HsLrUk1yQKq1TkRJ6NMvvMWNIUdJjJuJ7sDjUynTb
	bBCw8fzva+mMGlAiqDqylxjfDJqaCnNC93Dq8=
X-Received: by 2002:a05:620a:2944:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cd5aec377amr64463685a.6.1772589325358;
        Tue, 03 Mar 2026 17:55:25 -0800 (PST)
X-Received: by 2002:a05:620a:2944:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cd5aec377amr64459485a.6.1772589324780;
        Tue, 03 Mar 2026 17:55:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123583e48sm909623e87.18.2026.03.03.17.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 17:55:24 -0800 (PST)
Date: Wed, 4 Mar 2026 03:55:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm670: add thermal zones and
 thermal devices
Message-ID: <55s2gczljwgtk5rihaq6iu6a2osotruyostrhjawwz7xywlumy@7vjt6vb2kkwt>
References: <20260304014530.27775-1-mailingradian@gmail.com>
 <20260304014530.27775-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304014530.27775-4-mailingradian@gmail.com>
X-Proofpoint-GUID: Szmq6xdav5MD0fm1SM0WMztwh0N5QCiE
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a7910e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=M8YKDcNaA03c_0jmb2cA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Szmq6xdav5MD0fm1SM0WMztwh0N5QCiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAxNSBTYWx0ZWRfX7Bb4/o+2xkD9
 q1ugw9Lrs0vPnGI8ljZ9qvLpPN3CrYzwHL+y6AjINqBKqZrm92tEzBW/3U493/j9bNOy6CQqlgA
 RTGSm9DFac0sWto6MnPCgn/xKBqUtWCSXjsEFpg0pkzCzKFb66llfH/aThT/HS1EIKeujvSw1pn
 ekthi/pJNe8N6xVci1m9ZfGlt4s+WTGDhDf4ri4NCefPslHrvITBBKCTBmLvrXwA1MeAe9GnEkn
 QNAE+LVK+H64LHQ2/SGasDHpPc27H9qauwpOI+Gd76ADQgm0b8bfF8k58kp7kFSxvGvKHlx50tq
 56dixUPanrR+V1GqJM8Zn9ADIskiGDqKmoXAgvRIAYOCdK3p1Nuu/zsYeIPT1cjun6bvfJlH0Wq
 xR8XhooXg40Pbn25b5xyswfnDrmB4+esiogCdcuNrRI7LC3f4yZGF67H4mj3mTFnHvZwQHWONxm
 IUi+xZN0Atf+FRhbo8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040015
X-Rspamd-Queue-Id: B8A1C1F9BB2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95238-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 08:45:30PM -0500, Richard Acayan wrote:
> Add thermal zones to safeguard from overheating to high temperatures,
> along with the thermal sensors (TSENS) and CPU frequency limits (LMh).
> The temperatures are very high, but should still be safeguard for
> devices that do not specify their own thermal zones.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 474 +++++++++++++++++++++++++++
>  1 file changed, 474 insertions(+)
> 
> +
> +		mem-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&tsens1 2>;
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&mem_alert0>;
> +					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

Why is it only cpu6 & 7? Note, SDM845 doesn't have any cooling maps for
mem-thermal.

> +				};
> +			};
> +

-- 
With best wishes
Dmitry

