Return-Path: <linux-arm-msm+bounces-114765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sMwmCeMRQWr/kgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:21:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEF76D3C79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:21:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cEvm5LaZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XGjO+Da+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114765-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114765-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4D9C30054FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 12:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16466350A10;
	Sun, 28 Jun 2026 12:21:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F8C2E3FE
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:21:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782649313; cv=none; b=WRC8UqxSV8PkBFf8FaYNbeZNXSvvS7P84CEDNVgtV2zAsD1xCgaN5CoVWVEBjZtjzvQAOpKV1ZF9dAuPcAk67w/0JEXFHSulAYFC/ku6gzddBViqrhXyMEFKpUCy/cLBYvoNZbVfNcjrddSNmaodR/v4cXIFBZ+5QmUVXSP2TpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782649313; c=relaxed/simple;
	bh=op+WxGLW/kXdCgZoTqKhzgjCtbMEgvMQu7dtKBTVzn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skSIUyT9yzFjLSRZwDKahehREjlbVAkOyvHKggEyTEni4r/c6aCHK5BAZL97FLGgookMm0S/qFifzuPfhjbQuDRiTSrMr3I38Es3dbD6bJ9cZ4GrfQdx/p8RGNSEuBz+uE6J0uqpBnrw+hwpuhYRnW/AsZYHCD3Uqf+0Cd21zKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEvm5LaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGjO+Da+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9Ofo83599198
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J14lsnd3NQDwPVQNQqOHvTpy
	FDHrkkC3UBRz+c0Wth4=; b=cEvm5LaZI1t4QUCWs+5Vdt52fLbfpWBtbzfoEzh7
	4M9UO5osVJvAlCGrFgFDF3i/xWioK8/CRLFKSCVMtvpNR2Ja/0QgEZFdxhklHy2Y
	xXAqhS9cAHYJcP+jwR5dDJypctdgFCtWC1NcrE7a3mvqU5p6TVfOXkvkz37x5mBr
	maN1IBw6ps1DeT8dy+y195Zk7u+3pPTfknKV05Ze78WGy0dM6eqZ/7SkbH85sfm2
	+9juDyaGigUc3xu6eXiOr1UacxtQ8uBHxQzyyDBemSpNc0RcFYU29eUXuP0Ggz7W
	d5ZmVKV2rFWGD4rnEC6SogN5ao7lA6nUS/fBpdFxehDuZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7tqvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:21:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d4b18b373so231939485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782649310; x=1783254110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J14lsnd3NQDwPVQNQqOHvTpyFDHrkkC3UBRz+c0Wth4=;
        b=XGjO+Da+YK0C09+3r3vEOIacWFcNIanDDL9kqIgl+9XU7zSp7BuBF56kpCsnlGQUpY
         yT4uHEWUsr4cNrQYS5YgZysaa5XrWfQBXJp8IvGJzOHqrQYAnTPG2IR9Pxp2dwkVafqA
         4lAHSWZPHZp1OoWV8L6emG6uaG3N7+ss0qnZMG8I3nf+RI5L+iHZImgTwFqLN8/WFL7U
         rOzdKWMncDcBYL+GuTLep5DV8Zzf4NU+Ytc+ca4SJlb4rLyHCfeOXwSIczDb+DRXFd+m
         NerdTDYV4bSOB+1aX8idodcG/vRow+j01OgHkcbCQtpDrky1o1qusBnZjw2a207dyvwI
         Wq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782649310; x=1783254110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J14lsnd3NQDwPVQNQqOHvTpyFDHrkkC3UBRz+c0Wth4=;
        b=k9KaCh3ZJHzdHK4CRkQbuOyfkbselguMPbXIH2dvupmUu8o6k1//4aMX1TqthjvU5W
         pPLt/owzA0Pirl4DasNYjLzJij4rYQGfI2H4Zdjqa6xfq3AwVk0v5IePhru5ihBv29dw
         FuHxIq/k4JDJovRWu8PpQgWjI/+ztBogNb7kjPxMf7/jdsEz4W1pIAj0fDRuny/39jIG
         9iRoxFnJdoCd4dd9fCMnlOxZIlTFhNGJe13zGdPf4JolUV1Aj697WwwAYRAOCnFpMbep
         JKIonFkOA8LoTLVL2zgRiYcYqNEBxfSypq6ED/xsT5r8iWTXFWI/k203VVkeyDo092Xd
         qttw==
X-Forwarded-Encrypted: i=1; AFNElJ/UIsSwAesshWNvQXDGeGhkkK1C/N7DND9ITysbUj4I3tQpWNK9B+P2j361+K3FEgV8xtFU40rytwOzqnG8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcw8QgnuhZG5OB3+buw/nK/4CRB/Z0DSeRJKmYTQbr8VNutI3F
	NYPB9fYPkM8QzAansL0UKeLbxJhgp5rEhDSfYy+M3fzGDRXZDyhadPCvzqB+KB91ZXiJPf5J0mr
	fMWjg4dGZMKQNa5xkAqHy8cI98rMW6u8oWJ+L9iiCXI/NwN08x1MZNcSlUEAcoBLAmGO3
X-Gm-Gg: AfdE7ckgTU73LMV50lgKpNsk35C5soDMLyMsewvz3ijjojQ0basA+heleyrHApOwBsU
	yaORbfFvW65t7Dnq5o6sW2pSiFX/qXZQIA17mbDGP0ybBoqhHYiVP5ft44VDK5ez3pTgeRnl5Du
	qVtJc582sp0WlDa3vcAQhR+tH1+zZFYb9YRZ4gJPZRKJwBYEjz3ia/AFSgEIHG+kLbfbMjxc+0Q
	LFmrLr1ppGkK3gjoPoEPiJCzKWjiZNz3Tbpah9OpNDLOIHlO+Q8phRjMGgmiN96fkj9LyCi9fuX
	12Sc6pwaPsDAmepzttpmsoQSlCybZIdJoWd+aJAsQSuQ2f/pBP/p7xrQlBu5qEu1cFOqufVVjHg
	2qr4qaPiIScIEUQwPsa+dTAt5coMIBC+ybbQmND6eRqzRgUtCNXQLN58rNosoJ1M9vhaIojtG5D
	k5uRSv05S+8HIKyxp3jusmEQHy
X-Received: by 2002:a05:620a:1a05:b0:92b:6805:9181 with SMTP id af79cd13be357-92b6805af60mr906110185a.73.1782649309878;
        Sun, 28 Jun 2026 05:21:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:92b:6805:9181 with SMTP id af79cd13be357-92b6805af60mr906107685a.73.1782649309336;
        Sun, 28 Jun 2026 05:21:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb0ee9edesm965035e87.49.2026.06.28.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:21:48 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kodiak: Set up 4-lane DP
Message-ID: <s7gon4o57b3fe2kuz5lell7yb4iw6tdmmg7l3emapbqkwx3ml7@irg2myydcmyb>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
 <akCGiJU2pIlLEi-D@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akCGiJU2pIlLEi-D@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEwOCBTYWx0ZWRfX9ALkfppGwymt
 XmK5Al3aKWD4UNRcz7viY5fe/ctgY8qAx0BPl0XBlLfCppxRmwGrZ8Vwat5BOyPdhizFVw3lLpB
 QqgvjQXYSzbUCLFec9Jt3rrddIyhUH7d2SSs5epFRQ2RXO9OtlXFZSvBPTJ8T2ksjYf9qvAPr/A
 akFaHlQXf9ORUr2V/B0sNMrqxc+Dg6yJy7xfu7J/q3ZR0ItwPZosF1aTtqFxlYcf1jeRzgfz+O7
 2ov7vMLAJDxDksD2iMOjikBKDpIAfxBviO/Lc3Ey0KSMFvkXV5Vri7uq+DGLxVsNr/SPUhJ0ge4
 LfT/imOCWRounP9l6wmpbIUXF9QQ5mAsiGcSC6tIkuKgDrbXUYEdKNbfbVGaxStGHF7DB9wtQ/Q
 pFPf3nzkqV+GrLJ1CayulaT2erL17hC3Uzi2RBoLiFutS5r2/dznzxOa9knty3iw+gbwAcWtoA5
 lerEjVKGL1YSAcpWQaw==
X-Proofpoint-GUID: CY3EVGRm8vSYQqaI2Kmn7S9c3IevQDR6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEwOCBTYWx0ZWRfX7Qs+DPNnN1k2
 zf6augEHSb6aTEZB5Vv9eoJy38LGdhX2VbSCvOzLU5ffZeFbvC12gGCDmdmDwoaH3IAMgFnSA0c
 Hc2a+Z3JNv9YJS8TNRHRdhoYIaXZdMQ=
X-Proofpoint-ORIG-GUID: CY3EVGRm8vSYQqaI2Kmn7S9c3IevQDR6
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a4111df cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=aVfzaUfxNQgOLwLD1RIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114765-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mahadevan.p@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EEF76D3C79

On Sat, Jun 27, 2026 at 09:28:47PM -0500, Bjorn Andersson wrote:
> On Wed, Apr 29, 2026 at 12:10:42PM +0530, Mahadevan P wrote:
> > From: Mahadevan P <mahap@qti.qualcomm.com>
> > 
> > Allow up to 4 lanes for the DisplayPort link from the PHY to the
> 
> It's hard to follow your thought process here, as you didn't document
> why this change should be made. Start your commit message by describing
> the problem that your change is solving.
> 
> > controller now the mode-switch events can reach the QMP Combo PHY.
> > 
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > index 0acc6917d7aa..204513a6bd89 100644
> > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > @@ -5704,7 +5704,7 @@ dp_in: endpoint {
> >  					port@1 {
> >  						reg = <1>;
> >  						mdss_dp_out: endpoint {
> > -							data-lanes = <0 1>;
> > +							data-lanes = <0 1 2 3>;
> 
> And as Dmitry pointed out, not all Kodiak-based boards have 4 DP-lanes
> wired up.

As a bit of explanation and context for Mahadevan. The link between DP
controller and PHY is 4 lanes. Historically we have been declaring two
lanes here because the DP / USB <-> PHY interaction wasn't finalzied,
so it was not possible to use 4 lanes for DP. The issue was solved and
now most of the platforms should be able to have all 4 lanes here.
However in some cases, platforms like Herobrine use this as a quirk,
because it was impossible to describe various quirks that they have
implemented (in case of Herobrine it is a fancy 2 lane split / mux).

I'd recommend the following approach: enable 4 lanes in the kodiak.dtsi,
while, at the same time, leaving 2 lanes for the following boards (which
should keep the board-specific override for now):
- sc7280-herobrine.dtsi, it requires special handling for 2-lanes
  topology
- qcm6490-particle-tachyon.dts, it might be missing a redriver
- qcs6490-thundercomm-rubikpi3.dts, it might be missing a redriver

The Tachyon and Rubik Pi 3 boards might be missing a redriver, which
would need a reprogramming to support proper 4 lanes DP (or they don't).
Anyway, that needs to be confirmed by somebody having the schematics.

-- 
With best wishes
Dmitry

