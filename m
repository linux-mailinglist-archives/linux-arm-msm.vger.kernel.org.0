Return-Path: <linux-arm-msm+bounces-92609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOcRKOSkjGlhrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 16:48:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 171F7125D84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 16:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C4EA3008529
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 15:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EDD315D5B;
	Wed, 11 Feb 2026 15:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daQG7+qW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRvEiHOr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597F6310635
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824930; cv=none; b=lzwTdXg9h8N9jTFh7CBcmz0XKw0TADxJiZgb5KEwptDGB28Kna71YFfypWMEKjAqLhPdlsKSUr1BV859dQLq2ghNg2uetrdsdEYyO//ZCrmzrIrN4YKDDMdPgXPj4mJ0fOvwQAQT0MT10PoV3YZtt7WN0Yv3T9R0rC2xKPeXtVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824930; c=relaxed/simple;
	bh=7X6WhXcZP2zosxXdxnRbDH3wFCsRm1yWHsTW7p9o9i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fd2aL8pqYXlJ9tuJbJYhDHIDZpmGHFX0STNEdUrZdZaBcFbAjEkHhBQS+xzjG95bmgbQHInMYjrXOeipazFQPB78/27Bh1eVsOm4rkGmhfzq0DVe1vXitXG8teGI8+bShFUv7cDhNJLOXCNySAgYmJnEx+5QMtdoWMO9FLdMr6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daQG7+qW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRvEiHOr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BCVNXo519146
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 15:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dyp2g4U/Eio5nOlZx8uAt+gT
	6dCc3RNViNpk4NKU/nQ=; b=daQG7+qW5rmXcTPfgELVyez4U2p1M2VXpqI3G43f
	brfijTzAg0oqLdwlcqRT41O87LA7KX85DWfxmR+MzdD/FIyfJ7E3biXc2wQnAEFR
	qFRU5BdeErPZkdVUZxFvnxxJwvbDIirX9fPaArJpaJuXgzEHYY9qQ4SjWzostLTk
	NwjNGpf6K/jKoMa8X4RvRtW8Id9g+E300GfJ1wE0Z3q7cIIHdScYdqsPSCrTczk6
	vUYF2+85WWrG2yX0SUYtMDb+r7Bilr4+UrZEwybYY0mIO1WAKDDoyWjRa8kSgjot
	yJcWQ9M7Wla+cNJwby4G/VTog9uIsBEsdvepmt5isHgEPw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8sup8nhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 15:48:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a2ef071dso2214564885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770824928; x=1771429728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dyp2g4U/Eio5nOlZx8uAt+gT6dCc3RNViNpk4NKU/nQ=;
        b=KRvEiHOraMurJR8MwBSm5JiC8OQqtaZwRaObp4Pp2kpiPHgGn5bBRTVvmj64tnIKuj
         wiqazvutL1PNsZaAJBxBOUBYg83nzZy6aYEU7N3sfe/GAEue+yt/TtEwu0snEi6lPKo6
         Bw7eAqJ1AOfZD1H5N3L8w052MBXcICB6b1tIyzJxZYKLuRsgjSLH/MAkXa4wEWGhfZBE
         QlaDGFJ4wgr/QEW0ptk0mwhEiAtaR4J9r3O287IVbLUpxZD++WxkNwOJTdLJh6mg1Y5Y
         a5veM/UlFOkdR9TzZAOKR7Hi+pv4PbtHAeKfZGxAgX7wrzGOnBAuScFe+m0E+3k82meA
         UnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770824928; x=1771429728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyp2g4U/Eio5nOlZx8uAt+gT6dCc3RNViNpk4NKU/nQ=;
        b=svnOPU+hQ2znMQbEdoU84eR+y75tCJvWrXiMigd79OzD0LjyUuM45z7VSglcYx8yX+
         Ns0y8jp7Y90tA0Y3F747E2I40ZqDkYNqanXPD2phAexConGl/oXHQtWucIMxTpvcG4OF
         m68Zra/ktgqM21AC+pYsBbZsd6wHTxFkOjErCXDvx9t+FMpIK0nCX2w0Z9PLIpdknlzK
         J2h3cmH7lVgomrcQAlebVf0XfqaX2A3r7zIGVYjWb0o2CVB+GPVPIMzDyKPPE444/0NW
         eT7nc5TyQ91LsBpg+C4GduRBOzHVdoYI9sSB+0e/7Faz9Clmb3yZRDAvRSvU6Iumqaws
         6EmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpsSHaMu+p3poveB3In0yk6ViRmObGAbLPD8bsfQEWF0GOKdDz8xtnZ3Ro9WPDW3X7jjH3xXnT74TKPk7I@vger.kernel.org
X-Gm-Message-State: AOJu0YzZAp1BwVan4cO9p3yABaHTjIUu8gRoIwW/29yiZdbRJ3GQGWyO
	sbeIfEsi+j1m1OBhPIcAzn6wEmzMaMbJFTQBuMBuV2guBqZtExASbkyn1S6EdDmKKtaAFRHo76b
	rBtgEyQfOGmKquCllCBCcgur6gVOsb5AC+pvnRKubtFrJ09dcJvDduukvbeAvuP8ClZl2
X-Gm-Gg: AZuq6aLrHsu2CEdF9KkFPd3FROXfWz6qHsB79AbYitpzmrlAbfncllvuxwrdwtTioz3
	9/BLjxMoMlBas8z7ay6GC7BfyVsEF45mDVM3J+VRpP7n5U4oPTv1V1OeIQYG6v2uz0we/g3UmDC
	CLrdN4Sc3Gj60Rc/h16UeAUC9NNU7enfp3PXLUAPs3nsT7R79e4dwgt8z+CTNY+L+Rl31av7Z7e
	Ju1/jy+v4qV5T2ZQb+ifQOoh7FmDpMJqVPeSGMRm4wZDvMFRA+eft4tmQORYkX9q04IBNDV7QHV
	ZanHwDyIn8cfiaGCgiHciLl1AsdXROUsn5H59putBo2Liuv2htCUUzJiI2q4ebg7KYmpi00Ubj/
	+D4qL4MH9fHnChG0X9kcZaUyWFEF0PbzJRtW8g2t9YpzNp7kvv+4ySqFnL9EPpkW/e7D4zPVw0q
	we5qH0pW/CoW3lPXzA50/scjGD+73bhbDcCEg=
X-Received: by 2002:a05:620a:bd3:b0:8c7:16fb:ed45 with SMTP id af79cd13be357-8cb27fb7776mr433478785a.27.1770824927709;
        Wed, 11 Feb 2026 07:48:47 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:8c7:16fb:ed45 with SMTP id af79cd13be357-8cb27fb7776mr433475985a.27.1770824927255;
        Wed, 11 Feb 2026 07:48:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870691bb1asm3310321fa.39.2026.02.11.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:48:46 -0800 (PST)
Date: Wed, 11 Feb 2026 17:48:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add I2S1 pinctrl definitions
Message-ID: <3lzwobvrymrzo4ggnkewxi7wvp2hblnev2dmvfyelxwa52rdqq@dqexl3oe5fak>
References: <20260211-kodiak-i2s1-v1-1-b3a7fad8014e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-kodiak-i2s1-v1-1-b3a7fad8014e@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEyMiBTYWx0ZWRfX+HN/XH7Ll+B+
 71FVXJ41EPbseJGzNkCHteXNFCJDb29OhfTWvP1FmtYP9obOD7ddsBAGGu0uNyPjSo/E7+eiffS
 mZqqtuNkzgbu4lWSnZ2FEM3inshFAiOYj8yRqiIfC4MQ9yuIyn5HGMgT5HC5upRIQ0ejI9mfgYn
 VaBJvDINN1qMc8Sq/t/1qIxFI6CqeI7TNCqfxNvUT3EQp3/R8vYLV52QAKlgIvYy8x4y4kpOa1R
 ybMgBU23fd13z7+TqNttHwUUN+jzntQ5+zRFlICq5Qj6S0myB+iZP6o1H8JqQ/e2F5J41sLE82k
 AGJIY1QI1gTaix53v1VMbZK5PQqQhr1E6DA2cNpzzx9zu9KrVmXaHfs/Fq06gTG7oIEQHL9+KJi
 K42Ie2rLhniUyriUAztqyL+LcbbLZRPruQCeJOCyYD4hxhp2NtbqTHN7B12oMd9yt6LJMfXO26Z
 dhtFFLhLt1YODEukiBA==
X-Proofpoint-GUID: zeDqQIVYlZ1KNq0DOAJv9w7Vxy4N5Svl
X-Authority-Analysis: v=2.4 cv=Uslu9uwB c=1 sm=1 tr=0 ts=698ca4e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=SBGJfJ2iIvnYiQKw3gcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: zeDqQIVYlZ1KNq0DOAJv9w7Vxy4N5Svl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92609-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 171F7125D84
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 01:18:57PM +0100, Luca Weiss wrote:
> Add the pinctrl definitions to configure gpio6-gpio9 of the lpass_tlmm
> for I2S output.
> 
> Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

