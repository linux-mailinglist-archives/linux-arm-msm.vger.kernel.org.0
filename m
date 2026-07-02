Return-Path: <linux-arm-msm+bounces-116049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cjwHNjB2RmohWAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:31:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 103C66F8E37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:31:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L3Ydypxv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aPqIrRYq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116049-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116049-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 77539301AC22
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 14:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F6747DF96;
	Thu,  2 Jul 2026 14:31:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7756748BD56
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 14:31:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002669; cv=none; b=IUU5ZZdQ3J7ZSnS85OR32nkO8Ee4qps0yU/0t1srX51NMdFUyXUYdleVQ7wP003Fs+08wWGo+8rCTRKchvERpr6Mq50Pqr+/loZCr7kZc+QO3Ni/KKi0GFNd7R43T4GxojNXVWQxxvMmPFyexXF+T4Pi8L4SduMOnDnP96cUcII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002669; c=relaxed/simple;
	bh=X7/OY0uc8QQRq8hA1qS/ZiNO2VD2dV/hohJiKt6Gka8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jf/J5R63gChr6g3tw9FU5T4D7zDbicfs19OYji21OWcjevxMMO7ZDMx95fWkGep5y02TX3sfBgil0jZqBIvy/BrlhqQJMhiF6INaUVCXCzS2NLvWXUM7xRNJK+MrIUxt9sywhGdENm4cyQ3eM54iTtCEf5gmSsXzfysEq26N8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3Ydypxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPqIrRYq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3FaO622533
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 14:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+WbSzJRTopQtkFBiLx53E466
	EVyAa7ijFkAM1VDlJXM=; b=L3Ydypxv9ZMSqtL94sjl0hz9+dB/BhozR8f0DMl3
	cb8aRaScjKqT/SGPO17SP4BqJLp8DhBMLnNyjWL2tkLNohRk9Gh2W/CA02ySLCr2
	QVciuHBARSwQf0KkBFBKQOFg2aNuNsVJbhywnpvaxvgH2BKfBdFTiyaunLuY1bB0
	De/nk3N3UaW/8opf3PtFCStzSJYlxW3EdGJrRpJicUnq0CtSpJIzVYF1u+BOrlDP
	kij5Fzgg6QvMdj2WHJRiSkFho0BHHZ/jdovbt+SOFuCJw56rm5Ow8bD7mFK9+Uz7
	Ed7QOIHTbkqpHc0+24Fl/wmIegFJ1Lfj1S7fnmP2FNMI6A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2506xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 14:31:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73986bb438eso2010925137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783002660; x=1783607460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+WbSzJRTopQtkFBiLx53E466EVyAa7ijFkAM1VDlJXM=;
        b=aPqIrRYqGkOvTSk6Vfzz6qDxpl9pOs+sVyO9oo5vspg9kp0U6rQzlX31zfeiMUccjQ
         5vuj4YQMCDDVnXf6fYIDq4j/0nLTqytHdAaox+P0QijB3TmhhcaHXJKMVXv2EZ53keRw
         lEEfiyYJiGeRtAQVNRiZiNTf9bkwTDshm2g89KoR+0ay2qkQU3au8Ad9OH0FDnX1bWoR
         TbWAXM8FSemdLqrj98ly22W7nb5Km3FMfKWaXUcc5j3kX0D3dszS3Ye6YAVQF9/LEE+7
         DBVAXR3w8Tlabbx2RG+pNh3iC5HvM638XSC/MD4JpIIYjYcM5Gmk0e3FQzBRZxE/76eM
         mZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002660; x=1783607460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WbSzJRTopQtkFBiLx53E466EVyAa7ijFkAM1VDlJXM=;
        b=HgzrfWIJwe/s5aKN2i6Ih9d9APVhsHrDsp2pcOTx39iJRGN/GmyycavG0QCpLtf5dp
         0R0cpUurO3j6owba7KSqA01fZUo139N7+kgZ0HOA/CNYudg/PwJ/CQcirdFwiW2z28+S
         vAaCqx5Tx42VjBo1Yxr01WRSY6K1+M++BxWFiJPYF0ar0HmIMSqHteGoaTgdpejMGmfO
         xxUFEhuzElWS94t4FrkPQzP0NswSSTRc8HJEL1qk7ct6b2pjaGJsAEjhAeSN5MWllWqk
         iF10c3KMRsbt7BuwdBXpf2jlxRynyTkfgQtAVdxpk8EZH0ssIkXM760o2zt02rTo3zE8
         Y0WQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8fTW99bJxtzPEKuXOg2yYrLAMvjScUmQ41N4HfdlxpY7qpD+Sw4QRbM5ZREGtyuIa8Aw7FXQfrna1KDVQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3stXR+H3S0+d9TqBa8J9pAAf/B5svsuXxGU6LW9D10x1eKW+T
	kfAoUYBjTNn9mIAhcD+ROEe1lCjcCpPhljHq6VBuVRJxrgHkaZpCsMK3f06GK8EjKRjoLZJlO2C
	ZeOCixRjq4d4wpdv5kVOL3n7wrE4hwN5W6zmfzlChjxAJRsZsi8odvZxJ2erpQqlgSAKo
X-Gm-Gg: AfdE7ckL004MuVm5tasV4McE0Lre5O7O05MeM5HJ7QmiNzzNNSTa1w8ZZ43zFNTiepE
	maRyYyGaFz1O0gKLKtOw98MFF97NwJFeMZFA4STqRRRoP1m1nhBo5QCAASFePSpe6zDQjdwDoV2
	S9si8Yii0oaR/hKo4vItMq8x6kx1np/ojx4Sx3Gi2ks7WTRLOcHqyhFYGCB6dgalPtfQOwN7vmC
	OOR5TyxIq+k/CuwiV+0BCRNreuRhK+zbnONjBE8JmT5N9fPKvtrrJZSvDlmMdopYtjGHL9+9Ks1
	jPUDT1st9U1vLacwY6b8hBw8Mo9sj/wcNmaQcMSxI9R5rdidX3Kms0VyA6PcqWwP/+WnCl0Rq5/
	q/ee9RqfEa2kik4f5lbIieLw0zcnetP5qBgloTIqGHCoKrwcaZNdxeSGTu+XAEoKYqaRl5Z2DSe
	NyqjFOuKdwBSbAABiaDjyoZVFB
X-Received: by 2002:a05:6102:54a0:b0:738:fd01:5b60 with SMTP id ada2fe7eead31-73da7583d17mr3060399137.3.1783002659694;
        Thu, 02 Jul 2026 07:30:59 -0700 (PDT)
X-Received: by 2002:a05:6102:54a0:b0:738:fd01:5b60 with SMTP id ada2fe7eead31-73da7583d17mr3060359137.3.1783002659263;
        Thu, 02 Jul 2026 07:30:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec8991ad1sm711202e87.10.2026.07.02.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:30:58 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:30:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-crd: Fix the pin index
 for misc_3p3_reg_en
Message-ID: <cpee7ndhnudjj22eh5qbgzvhn46wsfdrkuldl4arivh4srub6f@ypi2nrsqe6ei>
References: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
 <20260701-topic-8280crd_fixups-v1-2-3fe92ee9636b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-topic-8280crd_fixups-v1-2-3fe92ee9636b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a467624 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Q6JVsqLeH8sYZwotHTEA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: utUCEK9dMH6hDcXIn79mw8WjfxTv0hR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MSBTYWx0ZWRfX8gE1DtlqBCkw
 6gkRiF+KX9DmxeX6SH+TslMi/I0PvCIdgmmeb1DhLMKkIpklnbTIZ+d+woiZur77kWO3lult1i+
 Rdy9Nj/ADxMUF9wYQwswi9kayVzP/Hwb72/R7wTcrdw57kELAGW6l/cKiL+YwXNvmD4DclY4bdY
 +mblhWXPuNQWugcJ8i69jGuLrPJDz3dnuGNtDEm4EsKjFIVipyWywFjMcn6FJkwgJghipC929Gi
 iEUsqROXvP4wmKd6/BWeafAu7G2bwhvvWDEJznPrAzF406FBqxmhs2FC+/LYJEhv29DyZlUAxh0
 IlQA0E1/S96x0gvHPwKBrfpY36Sdd9GfTsiE6rL4513op9oUvfWcH8CZvZ1AHtGCIizhqJz4uRM
 wWMIldgjI6ollSUI51q3YygARLFb0/rD0ZAZcdWdpXCgwtApIKWFclEgSbYnYtp5lBxLK4O4Zyr
 fOTyImJ/lL3jHoEEg8Q==
X-Proofpoint-GUID: utUCEK9dMH6hDcXIn79mw8WjfxTv0hR_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MSBTYWx0ZWRfX7lFZTlqUzXEm
 OJbpqKc2hV/4hPK3e0ONQwhYSPvDdmAJg3YIXXnA7LzaQ48Ahc5kENnIDKbJGfend7+NoNfW3XY
 xy/sBEmxQN9Qx9McuiW2i5x17LAGzH8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116049-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,ypi2nrsqe6ei:mid];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan+linaro@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 103C66F8E37

On Wed, Jul 01, 2026 at 05:43:16PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The correct pin is GPIO1. Fix it.
> 
> Fixes: ccd3517faf18 ("arm64: dts: qcom: sc8280xp: Add reference device")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

