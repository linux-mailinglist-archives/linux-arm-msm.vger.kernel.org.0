Return-Path: <linux-arm-msm+bounces-109602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNxQGi8VFGo4JgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:23:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BDF5C87EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93BFF30013AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66CE3E5A26;
	Mon, 25 May 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMtLprGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMbOop1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF5334688
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701034; cv=none; b=OT/MNewWCkyk1PuXk56VE9MDhjZJ9B9JuEphRDNHPjR3OALsjfjG3fFWdEtSe+edmz/rbCIvycTavBOZ8nKptOq0HCMjSzcKxsrniKZUoAxTcJGAH1XEODUMXz8OG7KiMmdt0IlXQ3y5pN8XqTnLTqLu2L85IZelf+y1lEsjp6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701034; c=relaxed/simple;
	bh=yMesBNc83KFeDSyEVsHsqZR1yAWMj5zw8lrvjBNS3N8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNhkP8nDf9CdJH7zXMk/zjdl3B5k0l5xwWYWTN0CWSgdy/7BxcGl6bitqPGuR3gMI/3x90eym/85j6rrswJcdQ/ozTubsoAwWnLIqH7+HySy+R4frNRPkoKsC7GUiJdUmLd5ZYSfXyTDn1+Hpu4Egp6+92SCPxjZKa/oRg7KWfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMtLprGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMbOop1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P3rFhE3856157
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZgEROvWEv1cb9w2QdV5vokQY
	l9MdDAQ1ReIXJgtHI+8=; b=TMtLprGbDMI/hnPqqiYx+U/blMZFw0vbp82uc7bV
	ooCXpTVMNnGMYmPP2wGeLXGZlLmClFHi9qjstlIAnKAWK7GAD990gatTG2frv2eR
	XQ/r6guqNDn+yeFlbFGFzW5sqEGxbRi5fA2m16RCeHrnjG44WiQbG+ExlTu2qV2B
	X/WKO+uYWXz8plEefKKasBbG4JxRg7RNHAKyjoG0RnStdGTvD7BrnP9TmEJR71G8
	rbyum6Nq4U1csA97iDrFXzcMgPLjXkJih+JdfychF2q5NwPN9Ihp2x9BTHSNxbUi
	UKopP6vYMNA6s+ku9VTahM+Wkx3YaaCGIlEgQ17FBrZGUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txp0mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:23:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d19f68acso72966171cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701031; x=1780305831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgEROvWEv1cb9w2QdV5vokQYl9MdDAQ1ReIXJgtHI+8=;
        b=jMbOop1dqPsfu+VeBFOFpXpPwXOcY3gYx56YjvAl+Qj0H0X0bUgdQ4+fb/Bd5bMNbd
         XlYra/zQIUa0/0EtWoMIaPhP/3I4LvL0jCY0roH+MyEIPGTTJqJxpVkomgjX41dRukZT
         S2nfbXoM5XCc1pbp2nF9h2nMwfvBTvWtC7n25PInDTMSR5zt/Jp3+f4S5gu+xXMw82uh
         zOAUK/Ecrkgg14E4ItMpxOt961ji4IdjRPnK9VrYPOwNZeU33PqLXhGwvxiryOPmEK7G
         5XpXLQNdcYPhmSUKn57BWeITMbemzod4smY5L2EOe6G7HqZZq9YaV1rJaNQ9YGjvaMgp
         jYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701031; x=1780305831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgEROvWEv1cb9w2QdV5vokQYl9MdDAQ1ReIXJgtHI+8=;
        b=jHd7ib2zN/fkUcFm6JED1kkAmnuPrqcKPRPZg41BLYGPXMlTzHV9QqdDsrurQnqs2E
         kewoSZTUl2FXI1nJ4/0iByu2SxaS7Rmqd2caZRuRSQXl6Co+p391w3yNT4cQ9E4wq8S0
         i45zFfdPoEFs6Agy1xLBrhsV02NM16Psdoyg1DyJNl7r8Jk3GqZQNUVL4QsUHgZyLQqx
         D4zK8wQS7SxQ2UKjv5Wn4WSVl1uMl1FdKJ4dWjQzeUYrGQF0hBnGvN8/OXNH9/VkHDkM
         RYaTCKPx3ptC6Oae5/i2ZUwdimjtqJ6c37c0RE2YjGVFLOZqy3Dua/LSErF2zxfWLMlL
         7Waw==
X-Forwarded-Encrypted: i=1; AFNElJ+lGxg/FCbznrImxsauHy9owdyki3hHcpQ7DohW2NZ+2FdxRMZ46bLiBZYd5MEXWL+0R9TKogQESreS/qTu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1RZ4dPdLMvG+lGN804gLNER+mKigBoJqIiwObEUPNuezlTTH2
	wbLEFnk9stOQ6qMYdbmttSlFpFkV9LCMT1YmpzEMRu6XPhdBxjFzsNJVZ+TSn3LqQE20hsDH/hx
	YwW7obX16XXgirV5BQ4cT8+zujQWa9TY+BuFHGOKUZ/w1QWX0bdrvglSBsXtnVyGi3l7P
X-Gm-Gg: Acq92OGMliyLY26AS/7tT9Hy0qC1jcPEBd4isP/WH0Z8/woFiqDEmn0ik1SqqHmcaRv
	dX8y5TuPujPwySO4PJxvITDtyQdr2iD+m4qMSRFlXeKluL7B8vL9MwJRkLjKp8Im4+J8bWy2SST
	8cfAhWiU/Yt7dd9JXxzknbD7qI1V9au0u8I7e7A3A0itBtcqbkBeg26fDOa9W89AIC6cPewIlOq
	MoQtMc+H/lZ+YvFNNz7ncN88DMn0OXEKP2ClMpeiS4X8hMX/cVHiNzW0r1oOj16Em76Dlu8rkBY
	2ydbEH+8jYNBrWKy0LM4Bzy1bUedNrE7EPEJ0kYQgHq7lzGG4LW+tDG9Oq/t4XtaBn2Ws8dFRcY
	Sy65EHe2JKKa4YUpGR2pUDTixMPUDXm2UW5kRrWyIXNJN0zma6npNJYXIY/OB4fD/gzZ8+XeE0z
	pwRaaJqsZIx9f9dI/O4TqEgZ6I0MaBBMy3Yr4=
X-Received: by 2002:ac8:7e93:0:b0:50f:c36a:3826 with SMTP id d75a77b69052e-516d42bfb1amr206103351cf.16.1779701030678;
        Mon, 25 May 2026 02:23:50 -0700 (PDT)
X-Received: by 2002:ac8:7e93:0:b0:50f:c36a:3826 with SMTP id d75a77b69052e-516d42bfb1amr206103101cf.16.1779701030247;
        Mon, 25 May 2026 02:23:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc41ca0sm22447561fa.36.2026.05.25.02.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:23:49 -0700 (PDT)
Date: Mon, 25 May 2026 12:23:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Subject: Re: [PATCH 07/16] arm64: dts: qcom: shikra: Add CPU OPP tables to
 scale DDR/L3
Message-ID: <4ugjyb73ftcjypi6wfqz47j2vvvfxj3ljunsqlixzdzzajy72c@3gb2bnx7coy5>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-7-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-shikra-dt-m1-v1-7-f51a9838dbaa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NSBTYWx0ZWRfX6bMW75bEdPsG
 LvxLnIQ/EuzcGk6hBahDxsnF44PlW1aZUONZUnHlcDm43G1fKgQDPi0pq69kcAlNfAKZbBy/uC+
 rnPbRpYPEIioc2B4X+Zm2xFX2iI/gm3j/GcuNCcLUEkWL9+NvayGGTg0JNDKSD+qe3U9GRaq+pS
 f2tIl0Z78jvu95nVfzvpM4W597BQCmGyP83TXQW6+wYPl8amTTWaXuE0xal1MEwtQFvwizKQZ2f
 OW5fLRRPtGN0ngavM11gPocvHsumhPyw/aD2lLAAuHi8puNNCQVvRlOVVKUGM1LY0/J/wVorX5L
 q4+F/M6Dd/vk8fX7NWTdWxp65SN4QkS9Y3ZkUOMYJVTiam5z6YNNVatWXdp38wo4ryr4muJ1VoR
 YHEkGtT8RXQeprmm8HKbR+BV09keAdfN8Ou2+9UwTRXtwchWcqfUAcxmysubnuINSujECJu827I
 H/uVbaFTN+qfAGH4mEw==
X-Proofpoint-GUID: e7oVl9vf7hB3vNmLOcM3eTC-zOS2Hohd
X-Proofpoint-ORIG-GUID: e7oVl9vf7hB3vNmLOcM3eTC-zOS2Hohd
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a141527 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=djs_V13T0nIvbdZk5PcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250095
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109602-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4.196.180.0:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78BDF5C87EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 01:19:11AM +0530, Komal Bajaj wrote:
> From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
> 
> Add OPP tables required to scale DDR and L3 per freq-domain on
> Shikra SoC.
> 
> Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 84 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)

Does it really make sense to split cpufreq_hw, EPSS and OPP tables into
three separate patches?

> 
> @@ -144,6 +164,70 @@ memory@80000000 {
>  		/* We expect the bootloader to fill in the size */
>  		reg = <0x0 0x80000000 0x0 0x0>;
>  	};
> +	cpu0_opp_table: opp-table-cpu0 {

Missing empty line.

> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		cpu0_opp_768mhz: opp-768000000 {

Drop useless labels.

> +			opp-hz = /bits/ 64 <768000000>;
> +			opp-peak-kBps = <1200000 17817600>;
> +		};

-- 
With best wishes
Dmitry

