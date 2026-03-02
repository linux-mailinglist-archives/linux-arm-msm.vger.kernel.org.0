Return-Path: <linux-arm-msm+bounces-94936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJUtGpyOpWmoDgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:20:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F37271D9A86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A93DC30451DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11DC3E5561;
	Mon,  2 Mar 2026 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4mbPpKN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0evF6f0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2F83E557B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457333; cv=none; b=vASQckrmN/CedLnX2AvXP7Af1MoIFsGT0EhcdqAe9vLYOUBNPc2bYuzqADowuLhFxfn7YmazzfoLF3Tna3mavni2TeZDQh+mE4KLvr/tZ4VEtnoVTm8ycBd2Zhrutj5mRd1cMZ+Z2KJS2iryC0DuxaiOkLFT1f4QZDW/2IvIm94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457333; c=relaxed/simple;
	bh=2kJkiDJU3bODKAFmqbpKedWpQJLTCt+Y607Vdp6pIec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4b9HYzmQb498V5eNskGaYy6ZeZRUc/Q+EeZAoVwpG9/ju/yt3j45/JJbLbu6Mw6tfSwjG1Wkbif5jS21wJgncXhEO9tZcTkTMP6qEtPrDeOkj84pwRHzzpHXD/wEKpIQL896h17SCWLUjtEF5fq1rihRa4tkBNH2VGuCrvDbig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4mbPpKN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0evF6f0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622DE6d92504662
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 13:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OhkpJKWmWuPFZ9yQlNnuBWCgu1aOk0v6t2j8gXLrTAw=; b=k4mbPpKNE7NeMdYt
	O1Mr0HCB8bASBnh45d4ZrLgCgg201TbPrVxp0E3MoJV+DyDECPRxzTloYIX7ulyL
	jfUTMDynK5xnIQFw0g1zg7d100vvZZpASCeHQ1loo8ItskC6D/SmX3i6oEEq5xCA
	UO0Q9twSn3BryqMgM3VVTtRTbL+IL6OzuaelRNTPwLDB/NL9oRrjoYqmOhEL9XOx
	eCcarJqR2UvXgkA7rrhMgAxCN6AXDQtO5J7z3mR56rtIp94Zz52sEfQoIemPNbV0
	J7N6hFmYDNo891ujrEvLVGcQqEapnFBvzG0rq+ujaDo7FUfEIVlZvDMrb88B3F9v
	ikj6Xw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hesc3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 13:15:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb6291d95aso5026831185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 05:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772457327; x=1773062127; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OhkpJKWmWuPFZ9yQlNnuBWCgu1aOk0v6t2j8gXLrTAw=;
        b=I0evF6f091oG5d/7rXkbf3svzocHh5EU/ZsbXnoVBcivzUDWWAzBucQTd6v510ZUFi
         /M1t3zTvqWhLyF1WWU320pyKmN0xClRQngkMTNJkFM0Qt5wlwaGujuxq5rO1Bp/I3Df8
         YEdXMIpxMGXGfCC9jrIB0l7GBO3SDcdtQOLGshIVJjZ5KmfjqeRVQ3FLMidvbglbBwmO
         /eNGaoxv5wGI7DFFvg7qeA/pCUuYgSj+qPNzUaIkROk2Q1Xx262RuhmZPplsk6GEvmfp
         HTfrtzr5UHsoFMoE+FkMvaNRhV10BAm2CiB95kgfr5w9EqJ1XGFeg8v1Su1LvyamQfe8
         BPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457327; x=1773062127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhkpJKWmWuPFZ9yQlNnuBWCgu1aOk0v6t2j8gXLrTAw=;
        b=M6QM4G02ZHOVJSoiBiAWvowO+aWXy5D1Mq4t+0PhMoOSi9/4SwVOc0VgTdDhryxExH
         C8LFdNm+7gYknrkgeRMrQX15ZB8PSBgc8lDFFcuYvhZGFxwutBLMdJ4uKj6Dj1bAQzvj
         BVzm1qKIzrFFfst/efi1DtMPd8SliExYw09E91QAvI2xIPRt3wvdIPJpIgbACQmfBXAy
         Cs4+kvrdEoOpnRJnUlwg6YYv08TTa3e5qKNXLnabeqlDVdggvksEUpJ8YKeugwzUAWa6
         Onh0NlNjWQk3C4T1n4A13INJW3kZlU4rmLfCN6lsFGN/cpsUMhiZqeyZqbGw8NEkCYCW
         A3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUO8RfPShdnpq/zprU5hhDt3WlXjE1doUd8g2eiqqyNZJrMkXmtP7lyVMMVnsEjo16CkojNYivWdH4BmO7h@vger.kernel.org
X-Gm-Message-State: AOJu0YwRwbvLJ8D6562A69/78SeAUHJKd2oBPghOkIwAIEtdwl3ViAcm
	Sb6LIwJWaHGvXD07JFrig94OrRoLDizEt3BcN3vEeFrklPLrwlWpMG28/cPxnv3M12CQxeBoiLq
	VdF+ureKT78VTMc1/1Gnvfkf/XIlN8bJBVp7EOIj6YD8TN6rbdS3/GpORll2m1VTjPlgc
X-Gm-Gg: ATEYQzwJcx2ToNTyFA3dPXUZjp7TH7KZUjVy4hNtVlGysuy1nMJG/bmFvcR8DsSKGck
	dU11BLSpQrMwwSNc5BAoXc94n8uVvLZaz3NoSvugz2QNn+orj9AyijXfOHh7hbEn1gp7aFMgAc6
	U8FJ1oDeZT7utm97q/8vbQ5KvNCZo6CEVK+J7XYN3qWDA6I9oukSEd0NMuo/aCNFfih9GamDkBB
	B1IZi+kUH0X1oWCN8qyERcTQ2EVHnQaJcEwqPpa7tA7/r91llv7REGDxZPCFE5iyuncO7ncG34z
	VIhgIpDk3JIOQPccLYQdgR4WQDxuhZQK4+L+eJ7DnMCWItDTvElVFQJxdZYYsFQZs2e2jFSQksk
	TmPxYTmE6uRdSf5eU95laCNZVANfvTxg40JinZO5i3VRu6QKryr3fdF7NF/r9gzY84d3ZsvCv6n
	znHTAw+s5oixPdlkQciBPUkR+0+AsxnU/KmQI=
X-Received: by 2002:a05:620a:4451:b0:8c7:acd:eec9 with SMTP id af79cd13be357-8cbc8dee809mr1487951885a.28.1772457327089;
        Mon, 02 Mar 2026 05:15:27 -0800 (PST)
X-Received: by 2002:a05:620a:4451:b0:8c7:acd:eec9 with SMTP id af79cd13be357-8cbc8dee809mr1487946585a.28.1772457326578;
        Mon, 02 Mar 2026 05:15:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm27060481fa.6.2026.03.02.05.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:15:25 -0800 (PST)
Date: Mon, 2 Mar 2026 15:15:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Update TSENS thermal
 zone configuration
Message-ID: <f2azsmm35xe45xrtzspp24vw7lh226pztewlfgmqtnkam2h4fx@gstiujtjzsb5>
References: <20260302-higher_tj-v1-1-4c0d288f8e7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302-higher_tj-v1-1-4c0d288f8e7f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a58d70 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8V18cw6oI9jMPSUKXXIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: jWs1fk6wA_7b7ODyn_02QVvUiNsHw3u6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExMiBTYWx0ZWRfX0Q5vML86pFaF
 Vc0KA3Iku0fkULAva3yoHZjtE6cP/AjAhUMo+b3pDM+qwkx1FZoK+MhlWdZVv7iDBTT0NIXM5Xn
 gXmDgc02+77qcftfqvObAF/SMwM4hhPRljCL2WYWt33MkY4USZeoEL0xKrGoPGFo3xERvMdY7Gm
 TxJa8v3QZf1q8BJ3ToQ7ixK+06xQL8a32u2V6C7fN+Vw52GKvUIszubava2l5Dz3BrxZSOa6RXr
 mTV7eGIf31hLEvt6Hu/cu90eCcuXxsXEAEFFDcA0o1xIejkW/y+kPfnfw4065/OOof4x1iB7HL/
 1US4wLuP032PHQyndk4htWwhECo8m0XmxbC4emuFZqFe7repzi1eYITjEvfFVv1Pn21H6Yh1OgL
 uFMX5JxgyVC6mdYEJaO0jMQXRT1/WPqcGM70J/03cb1jso+AAIt14fkUnRu/xjyqdQUUD7omQpD
 1cDMj4i5lH6AnViq7Rg==
X-Proofpoint-ORIG-GUID: jWs1fk6wA_7b7ODyn_02QVvUiNsHw3u6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94936-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F37271D9A86
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:00:28PM +0530, Gaurav Kohli wrote:
> Hamoa IOT boards support a different thermal junction temperature
> specification compared to the base Hamoa platform due to package
> level differences.
> 
> Update the passive trip thresholds to 105°C to align with the higher
> temperature specification.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 66 ++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

