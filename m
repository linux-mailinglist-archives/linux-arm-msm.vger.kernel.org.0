Return-Path: <linux-arm-msm+bounces-89907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDnzDvcQcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:34:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFB64DDE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3DC17B2E7C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26633E9F9E;
	Tue, 20 Jan 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uq1aKteu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWFNofe+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE875451065
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947990; cv=none; b=jmtWM1CCAqdrM3VFGdPGp0Z4WPJkkArswCDTZEqkeGyHNJUkaOOKgPTppl3s/xuLjK6GsBAzJJA7YH7JiKDPBvwKu7BRAc8PJgYPCp+revZBtQLjN8yA6Njl2oHA4GPtP2/tf5iWaYrGYv5KPWGvvb2b6AEP9DKdkOIqadmOkbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947990; c=relaxed/simple;
	bh=+AjOHVFzafAxyNv7kFoLLoEDJ5x3Ho1X9GPgsA5PtZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPKTBdaIBstEyT7UHvgWjBlhuZSvH9M+MIy6wvdwOvY+RRYLN1Cr6obuSrTrqu1DCjUDN59d8aio3CW80EGSYKR1T6qL5mb8souRsmMIZH8vpQDHrRLh/1cUfiaEQNkwceBABUCCt0oYQuUBeC09mO2MeEst40YcplVPH8T8sSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uq1aKteu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWFNofe+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KEUCEx429026
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=12m2xvgJzDqiJreuY7EetpiV
	ScySOxRmwMPypQhBiRc=; b=Uq1aKteu47PUQzhdxfFj7EO6snCXAim50cVpMhE4
	lw2IzTFCoAZcdYOJQQ7+u2shTUiCSxqeBRvsxCO7RZLFDh8eYm9mxgiCiuglsdNB
	q/yvkrlBCzTvLuO5lTbYPQZ2EyNcyKzR76+GLFRsNWOVISDHS1wGppYKy2FCD/B0
	ksdH+i7yWwMV4Cujf1h58voGin2EU2PNMMTR5CURy3/hSqtsF6X3ZJ93qfFjUGCN
	1IF9uxVj6JJprDlEVPjPoFeIehkdDHphW7UeoRsX9gsQ3K9idKZFkqsVEPle/0w+
	wuYCYnKKZVjSq5gRdxaFT12r0u0HYlewIgBOfZqBoooj1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4ps2xph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:26:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ad709d8fso107394685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947982; x=1769552782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12m2xvgJzDqiJreuY7EetpiVScySOxRmwMPypQhBiRc=;
        b=UWFNofe+kzp/DanWbV1WNMbgkis+g49HIr18OIZSkbV43eOkJsxZw1UjxAea//rzox
         1p1yJkfVLUv/MN8I2rW1YPsM+CSq7oYtQnat8UaOJ61dZRjdBB8ekhP5KGQwiejAeHze
         Naeogbe1XcPZJqKYvvXKWnnybRNDRNonB1ZUxqTx2isZRJ4wrJVNBUmd/OWii9NGdggr
         yPo/9uImG1JIIFkAARW3AX2WLTGCIDVlMmHnrCfThT3PSfUcOQhczht6To+pFJsh8OwR
         ji7cpdCt6KG6azwRNIQa2bvMYiZVaNTdN/MT0dHL87KjtL2r8c0BK1QdZgZ3w6Qa+AWh
         PI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947982; x=1769552782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12m2xvgJzDqiJreuY7EetpiVScySOxRmwMPypQhBiRc=;
        b=NXBlndwG7sSKN3Bd+xlKghX2vqWu0Nxkm9YEnLro3xSCwDit81/YuOKmGsQLLCaG8J
         Z9ajuXVJxlIRqOk/zgZgHgK/YIAOUXMChwtxdlAyodLE9t14oQirYlgMUuVRvXImPkbT
         KupXrCHajIdsMiKpssvpdQ8RBhaffCyr8q5qX6XojcQxPeIWW10fMYz8HD/VYeUwQ5eh
         xDwuQ2K5W3FtuebGpjntGBYT8a3xMvUZTM7ayGDJEeF5c0Kr314P8aKF42/gIs7ue0cw
         KaFR3S7mcFTxtyySc28V1oO4d4fV2nZnSAkuHvSmzScXlFwBN01CZYcHd1RfoSsieen4
         Onzg==
X-Forwarded-Encrypted: i=1; AJvYcCW9EjfZVjbHMR0u4iwOh05Fk3aWMnqdCI+bZZTHArUkCqDiJxCNmEcN5aI/moq8YHz1Vrb/hKU51tCkhEjZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxmdLveTlH60XlP7fufGea/B6yQjnFn0JAR22ZBro8Csk+W2dHf
	DfUPCh0Jir2UIX0uSNxhXL1zVSUcNn49Ut1zR0MY0GI8ITUPJZT2ikHelmKOlbgOjuSTwq+sLzd
	hi9SiLavrvwvDE5Hv28j+1NDdsvCOqDocukn7HD9EPiJAk2PeXO2OL+l7R6u7KrFyUlLB
X-Gm-Gg: AY/fxX55RHGNFrNFAwtiUD4Zn1LLKnarB7fY2muwO6HfeBe/l7GU0wUQegWeBZw4Mgv
	UloXxerdQKngm0AotG0ydKoCXxLWSEmPZlNs5RDZxGQtxgw26coT2l/tkpdx28UVe1e+gnEYNGy
	E+kmAcCuXHv/eDbSvlHTbrANqwVvukSZvFmg15N0nEfHUAj/PUzeI0CEfxSrM4RteGQmhKBBexk
	WZVWPhKGb9wCa3o3zvXksizT6a223cGMohtnXDzqfSUwEx+EbMKpx1s6ob0y3spuSQ3xwoi5yeU
	0U3J+gN0/XF1OyTgHgdkombebSuH45kS9mxv5XJuhc+MuFTGvSYk2Gzs2Bp8BmeWmafAVdcLIwA
	IhyRUy7swzT0hpUe+RKV1zmrwifdNLCPsEv+lJri508shP+QFg82RFam13/Tm0Jhhjjsv3IEJZo
	/vEv+LfNmV4/lpAeE/nHtj6B0=
X-Received: by 2002:a05:620a:4114:b0:8c6:a64e:f66a with SMTP id af79cd13be357-8c6a64f04camr2155763785a.21.1768947981612;
        Tue, 20 Jan 2026 14:26:21 -0800 (PST)
X-Received: by 2002:a05:620a:4114:b0:8c6:a64e:f66a with SMTP id af79cd13be357-8c6a64f04camr2155759285a.21.1768947981130;
        Tue, 20 Jan 2026 14:26:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34d572sm4303193e87.24.2026.01.20.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:26:20 -0800 (PST)
Date: Wed, 21 Jan 2026 00:26:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: bibek.patro@oss.qualcomm.com
Cc: will@kernel.org, catalin.marinas@arm.com, charan.kalla@oss.qualcomm.com,
        iommu@lists.linux.dev, joro@8bytes.org, kernel-team@android.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, robin.murphy@arm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on
 sa8775p
Message-ID: <ctdfmzictrjcwugv66hmk5pouj56qviy5umdo3yrmhvfexqoni@kmtozbt53sdv>
References: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IvcA2D-QF6JTTf2rgINdjf6YUApyJl4l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NiBTYWx0ZWRfX0zELw6xSN/ns
 GNW/l+GZf5t3AmExJ9zoncIHF2FA6cz28ZLSBZZyEcm/LwG3bnMRt196OUzPjk1FLs2Ob0cR9SN
 Tpf/u+lY6FvhPhKXQLPBxgSc2iHhsApm9wHmetTP3nVBKyzx1hQgvOmJgsYl6LamYcw8Zal7PA8
 cLrr9lZH4vgPe6odMNsTYTa8/TbLx4OmM4olB+l4fRPZ3fBgzqvTqZHHn/KKjJM1SZ64veI7T7/
 F7t4cwZ6T7sT1h6Z8Bbu2QWzjUfNVQ/cT8W+1NpbzfpB0dglecoE13T18uhOEdebRrAEHC4O79o
 j8JtPvQAeLjZh40sxaQyPV0zgwpQP5uG5UEoywPeGXJgNo0yxL2sgT1i5u242exN3J9LBX8SXlw
 3P8acZKZ1P4sUix+fDn4qNtz/ORsguntIf7FqgjtYi4Aoqe9XpXeowTzWj3/KPQHpzRpodxbHx2
 VwCTz+b1YxmKmoO7enQ==
X-Authority-Analysis: v=2.4 cv=PdfyRyhd c=1 sm=1 tr=0 ts=6970010e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kvr8ZGpsiUTQIvHu6H8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: IvcA2D-QF6JTTf2rgINdjf6YUApyJl4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200186
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89907-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CFB64DDE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 08:41:05PM +0530, bibek.patro@oss.qualcomm.com wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> The ACTLR configuration for the sa8775p MDSS client was inadvertently
> dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
> Add actlr settings for mdss on Qualcomm platforms"). Without this
> entry, the sa8775p MDSS block does not receive the intended default
> ACTLR configuration.
> 
> Restore the missing compatible entry so that the platform receives the
> expected behavior.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Missing Fixes tag. Otherwise LGTM

-- 
With best wishes
Dmitry

