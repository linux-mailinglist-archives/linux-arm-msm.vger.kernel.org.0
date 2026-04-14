Return-Path: <linux-arm-msm+bounces-103197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGX0BgaA3mnkFAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:57:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D43FD5C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 550B73022AA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E434031AF07;
	Tue, 14 Apr 2026 17:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="haTNbaQ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm4eM/Nl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C024A313550
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189388; cv=none; b=PhNIxwPGu2D99EQGJMFzHFllHiuR3XqqHEK1DO/rK1QCccAkA6vTjkqPKCYJhDJkujQnyJbyrUTDRuMLiD+g+l1mvs+/SUA6ampMHLCB2dvfAKKQ8CvnAt1ColGgZf8XDSpdKE/J5fom1fQOiWUaOZ7OZJiZk69pMu0tJq0dnVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189388; c=relaxed/simple;
	bh=7aBT2DK7EHhd1zMiHlKrhw0mccqkDL6WTD1AjS25XJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbctY3FWHoeeJ4sUNmvbWkVilU25/DEucWNlHEnhgtStaBVZrAqHa4fIpQ0DQ34RXkACHmHXZIDKim5GUwm38Ie0n5D7nx6J+vAox/mZncXIBVcC3uP73sSCkZxxORCoxcBp9WKNJiIgA12ppQT+jkuOgj3ABRlRcBvc+5xB/Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=haTNbaQ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qm4eM/Nl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EFYNKi3936626
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yBCQAoKuaAbhqEJpnCtly0r8
	8WL53vqH1z95hkDBEPY=; b=haTNbaQ81NXFL/jxs5evOseocmMoZvkGthci9wa4
	kMchjbnE0usUgZrYK7JFakcPvxNDbtHPiBB2sDWAYXZwf6e+zfC/ar7HFZMldFRY
	vsxbhsyxag31AfVfHGebx1fcQgvnZg32KecZTyfdtdIGyBMcMePAWybG6HkZIyQN
	H4bw3e9NLyPVBT2S+q887s5V3JJmQLwAZcsEGOsLwniJYzJxj28QxUd729eA9+/W
	mNdWYw/+s0jFhKKJO/wmQ2C/KJUHB/skn1tn8ZmFJisN73bI/tzWkkeYlk+2L3jz
	3E9fRaeIwok0ch/zOgPRnaGVTP+183H6p/x/lQEa2n+EZw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrbf0jxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:56:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acad256115so71887946d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189386; x=1776794186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBCQAoKuaAbhqEJpnCtly0r88WL53vqH1z95hkDBEPY=;
        b=Qm4eM/NlWORnaJj/X6wkb+FM6uYSnUzlNMM6vRaCm9BjYgBERbEYGJB8/Xct6MXEWS
         A7g0Haa5ddk9QVsshnRtM7IbKG9Q51n1A0KsVxSP7qKW5joHNtcmvX6449hu67ympB3X
         CvD70ixH1lKSe6KJVWWE3/ixUKvWjhsSonORVwV8r/Pdsz9vwvHvv4JY3x7kjCnUjps/
         6sIqOE2/m9R5Pc1XUk7OEnvG9AiQTz4HFUUZaISueruR/Ma2fKrBbBaFIbXgldgpWqvg
         08dxBAp9AmvqSvXPQKfCST0l8B0S0FfjNgzuT0x9Ni4bVwLrEop86wG+3C97TcyC1kip
         4QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189386; x=1776794186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBCQAoKuaAbhqEJpnCtly0r88WL53vqH1z95hkDBEPY=;
        b=rrsb/cg3zg7QV3vLxiYsbCVXMtAzzZr+lyZ1jyeJ2lDMo/xsQoLygJvZmOq2FecjsV
         8QWx+OTp7L+Y2YeLKep2va+8zrYkaBaDqIdfF26PF0mKrK28yTFLVmQnm1MNGswUnkGu
         hwB0/72NkE7MoLbHm5VsE7x7dnwj/liQI1/S+0WRKAef2xYUB8MMSyn/rEYbU6fCmwh1
         mW3/JiVi9ShUSjM3kl1V6NkwKiPdhHBKheAAF7kGIqoJtKWyQAz+K0EbA6aZi5jywFOs
         cL1E2Giq0NjeA/tX8aBDykHDClxCtISrWGuhi1uz4WtzgXvmCNevKYuf38CPGs3ts6Iq
         Tffg==
X-Forwarded-Encrypted: i=1; AFNElJ/bdz6RBdafviD2EqXWcxUVlGajRGucFz5c8S8t5npvV7unANyXjYPrHVojmQds5rsaArxg1PvG4sbTpcOl@vger.kernel.org
X-Gm-Message-State: AOJu0YzFjCQKIaWZvJ4pcSlbrED6qMEz2BJvafSmwG2TgqKWFBF4iJXT
	hIp0CHcBC3D4FhbNDziQ2JrsbPQq5+DoXBlMn5yqNI4/3fX+BTFKkYLEziNrwygzfJUCaL1rLBx
	Zo3l+45Rm2mgTHdjzKUBn6kkv3ae0BuL3Mx9O0YXBWqTZ7aPLvWW4g56UJ3BxSIXG65Rfvnhy3o
	CU
X-Gm-Gg: AeBDieucN6OCX+pzk2iDcYtBNYHrGOoFMh1QNJ9//+3DiO6q4K4F6c5V55ad/CRhva8
	fbat4fb2Sg+vco9Tt/1u3TrGl8QQrjVitfM0hVydzU7ZGrVSiieGu+/CfRNfBptCMg8I51pN6u2
	aHjSEf4am0Nj3Pw9eHhHBk3M+EyViZaDiBqTl6qGiC4VQlzqYh0sXFIFbtPzW6UYGn5aIuoXKYk
	GPOKQSRuIt7cvjIrhn9gRxH9O2qFTKIvSiyChnHErqZ/5W7zpQCp896WXQCWRGRaD+SIc1doA4r
	5ZIdWwkgwAi6cPOL8ZVUemsrFFw8NqostRHdLPJX4mk0zTaR4HtsnziQDCIJ4fg0JuRcniJ+0E2
	ZbMgg1GKr9KPVmchaQyDVBnsKE4WJMPxifW3z2cvb3/j651Dm1rBImGNkYeBWe/CWqupUzmdylu
	n72VA51VxxW94C4wGB93jdA/KzcGCF0oPZrfrQCtGRkwUwHQ==
X-Received: by 2002:a05:622a:598a:b0:50b:526c:541c with SMTP id d75a77b69052e-50dd5c13154mr259578031cf.50.1776189385934;
        Tue, 14 Apr 2026 10:56:25 -0700 (PDT)
X-Received: by 2002:a05:622a:598a:b0:50b:526c:541c with SMTP id d75a77b69052e-50dd5c13154mr259577551cf.50.1776189385445;
        Tue, 14 Apr 2026 10:56:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4957eb1esm31525781fa.35.2026.04.14.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:56:24 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:56:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Message-ID: <vp5x6ood2guxtcqnb4fp5sqy2j2tyf37lk2pkypawexxkopf5g@4lfznaqhehix>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-7-bcca40de4b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-spi-nor-v2-7-bcca40de4b5f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KSXgKG0UlmN5O3VqtmJx25RhzBhwko1_
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=69de7fcb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=CipEwJKW4Sg1KE0sZiEA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: KSXgKG0UlmN5O3VqtmJx25RhzBhwko1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NyBTYWx0ZWRfX54vG0X/0c0hW
 5y12HNo3enwa76DUlh90pDD0r5whrZY4myKYnJ4AKugCDf78szcBf8pY6ZZXotFMKcQJMgMnNwP
 TClyoOAyHxIMjOlMyuGJ8j/6OshmNsIznWUeHCuLbViXzTGk184V8MrITOY4koUakhaHAqEyAyM
 gDwyAJC+J8lkvdUqvIAOVakJrDabZ7j0v2ScUhqanXKjeWxqTY5GUgjL9iS+08tJjjXvG6fkAUV
 fCyJxpBuGzAH862Sb0yqkzuGE9kB+HmFvvFiAUGSdhBEao4JmKhPzpR+ADvHxGmN5OSBsclR+86
 yhs6ritvWv2GyBWKZZV7y9XIrC7w1g9mdMCIffxLe2G4FhCOYUJXbueVPBMAyWQGtA41/eGZ8qh
 cc1dCH1X3SDCmvkzMb2eyipvrixHDDj/1YyLcpGvPo3mD5UfBc+xy9DdtzPqQftecooVwg/q1ws
 eggqu5qzD2RbzWLTSUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140167
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103197-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E0D43FD5C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:38:25PM +0530, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without this path, the interconnect framework cannot
> correctly vote for the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

