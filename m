Return-Path: <linux-arm-msm+bounces-110976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dkqlJhsuIGoCyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:37:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5EE63821F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:37:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xxvaazd6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Tv0PWYHk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110976-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110976-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA8A030EAC40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA942C11FE;
	Wed,  3 Jun 2026 13:23:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE86229BDBD
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:23:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492986; cv=none; b=K1rnornXkudZK1OOqEPBVOwAKc2pzW2BKRJQp+ye+lPD18zpfGXtD5+0BbwVCVdeIgiTiFqsNRwOedpr/FCVJoRdVVbB3czogPza5zHfGb3pvJcuRBbufFb44WKSlGtwT/1SbSdIXXDuxOe3a7cMerZxYZPvzXG5sIOA/ifxB7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492986; c=relaxed/simple;
	bh=kLkExFe5rWVtSO1RSLx3uqGB2p+sNdY1TYV//EUnguU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmAwK81HHMlc92NXa4l/KWk8RFb28Fabc4mk+7bRHQ8BihVGqyY5jFhrf9qXHMyYCmlYNQSVcSGabiQnGeAMulY2mUC/kOBkb88sf4+wPBOymWFkaSPkr4iFs0IGx0+M1zBvmXUzTF5COHZDsFqJ6VyPia5rzRKnSlbCjafFC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xxvaazd6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tv0PWYHk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CV3cF1947134
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MI7LNUk01Rjy70p+Xfg+itjt
	rKzVoax3XdU0mqcjMBc=; b=Xxvaazd6vtK5rDYftVZth/q+eFTbPE2oGSEHEmKa
	fTM+/PRb89WWfAhaz9FvuyDbalq4ltbniS7tNM8zyK3JWUrxqP37z/NmU9n8ac3C
	zr/zGBzeqN2u7lc8lfR8JlisEISaGAznb7bKoJ2t6a0kNoCn3N8rCrTvpxirNgGA
	ooRM742EKtxkn59ecl+pve9Md/nYVEvpkb2DWDSEBumWAWzBay0zWUfpfK79YPLQ
	to4G1bzryHUbFFsYyZEogMsjO2dFtCIM8rrmhI3mf8okKgHwbjGi5Xqi/ltDkeu2
	5daWQnFqEoPUSgfBXk0sOUrtQB86ACr78OU2v919DSg0ZA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgjn2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:23:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59d595bfd94so2703002e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780492983; x=1781097783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MI7LNUk01Rjy70p+Xfg+itjtrKzVoax3XdU0mqcjMBc=;
        b=Tv0PWYHkaKoKHWykiOGvJshW/q/XpeWeSudM5VT+Ky71+iqL4znJJA+GooGoDciYIL
         Z/c1HHTctVJVD26ivzIqtqjtJ+zIli29v0M0VggKiKUkZI+kk2Kva+LCXATqC8z+0Dt7
         RupUtyjLxy4M87QLXHsyQs2n3801sIRJWGS6txxVE+GiH74iGPD4o98BO0lmf7DPS7Li
         xkkDss2FF+LIoKBeNr8e90pEcBuQJJLebuxIF0DUujk8ZzBZn14xHp8RNslekdt9Xfpu
         /IH1fD3qapxlq59PN/0ZNLZNFes4jMBlobWdTMR/VifY9TQaG+iR2pZTte8vq3EL/nHw
         82mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492983; x=1781097783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MI7LNUk01Rjy70p+Xfg+itjtrKzVoax3XdU0mqcjMBc=;
        b=H4/OyTXsYD27xC4ubxMLQqVXaF2ERX9cNeEK5ZgIZIa304THpTRImkGlax6Z4o6O1a
         d9JKfY6j0079PgamsVtGrLs9YRTmKs7txAbLUcjifgG1wd9ZgjGI+T2OvyrR0u2aAmcb
         eolGrx7lcmvYjEUVdiVgqIaq3szsxMRdkIJDeelNiujGPykNBFzGl5jE4vKRGpl/tUgV
         R4Ab92HW8qmpVS1/G7RLbF6INN65TNeiSueMDPSi05/kiQXU1pWFJC6NKRmvQy2Jak7Z
         U1irbdj+A4V2IjS1H4CEEEhh/q7a7ptQ63kJyXL5HYlRpTso6Y4elrsMLQM7MiPGLTUZ
         9jdg==
X-Forwarded-Encrypted: i=1; AFNElJ/iBeIMhji0O3f/M0EotMJjOw5Zb4JeKyB6v6idK6enOYLgvGxp1fGc91+bLMQ0Kjq1XyS1lCW9tJ1Dg7LA@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFjHkFeUQzyqWJX5GWIrdBsmS20dMtRtt3vpj9yMsYtsFPVKi
	OoE86Ryzp2/dbUfQfgdK8nZuaA1erfpXhEbAZe4l9CbgCC7vVI+JH1titByANzIzOSkMQ7UJN73
	MmEmVrLfX2aEJOzK6ctwwRpuJoxGzP9YyBBLXwvdktKYHVmY/TpvdANK6CtqN4RdK00D0
X-Gm-Gg: Acq92OG91IvxSnWHNH5ACIXkyygKYOvgVry+DqXidj6tOXvYXfFhy16AXoFnVC2Ti6u
	44n1wXilDPzQFwrIBDDzcgOO41bZ/jem1YDrYBLvRLoQ2GnChp2/p6l6t0okEMBnnnh2mrtVXFW
	VqKz0d+5Pvhq0pBtGXIrORSgbq5i4MuF1mk6H0UHIrt0LsEb21mD+8luexY2rT4htGGWb8nSYcw
	FlbgZVbwkH1wSR3RHhuUOAUwrxVmoe/3HpM6wAe/R5/zQEcOYY+7RiNa8BplZ5HThYh+0Sun15T
	SuzfizVZW6xWSBDz2kTlVMWxP4xuWQMyVf9fO/BLUePvKodsguV8DYMY/PnZGXEcP74GIHRrNsu
	ufzAa34ZbNlUfes2r2tWLChiWLfjN7VAAtk0rWirCDR04z49TNWuonDca7Kqg60hMVe71rdcUGL
	aoaMdFo02K0qGHY53P/97p5egjRapozPkSh5byIm99cTF20g==
X-Received: by 2002:a05:6122:3d01:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5a6e40945f5mr1784954e0c.7.1780492983267;
        Wed, 03 Jun 2026 06:23:03 -0700 (PDT)
X-Received: by 2002:a05:6122:3d01:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5a6e40945f5mr1784871e0c.7.1780492982478;
        Wed, 03 Jun 2026 06:23:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9040fesm644860e87.31.2026.06.03.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:23:01 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:22:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
Message-ID: <xptdvm7h52675tjfc44agdcayjovwfllds2fusm4iamgofxtau@2p4bk3wppqk6>
References: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
 <hs5roqpupi7svf4pyylvseqx44s6jcwnb4he36psoijjeeizbl@aq3b7k3xffxn>
 <4Fnu-d1cqR09ASN7DZABvKUO9mibDR3sRDoETHQpnOhzFTdtp-QIjy61Xed2OMB4Ddw96NGv7a4pmLNFXQESxWfNCLv9xQfyeWqAi_IdGNc=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4Fnu-d1cqR09ASN7DZABvKUO9mibDR3sRDoETHQpnOhzFTdtp-QIjy61Xed2OMB4Ddw96NGv7a4pmLNFXQESxWfNCLv9xQfyeWqAi_IdGNc=@pm.me>
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a202ab8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=y2wCMltUePGyc3NnhLkA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: E2QQPV5NX7iIri0kTTsg77h13irimjmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfX7YWERfRaWZq3
 8UyBbcJKWFF0DkR0VbI1XxJT2DYQlSEtrX47a5DU5NrPdxEzUJeCqwSiAyp5QiDrz5t1IJjRg/+
 IMbBXFfu9NuUmPqOnpQc1cvlpW2YLVOEMPP9Ut7qyE8SwVx1KeSXpAYzKibv0+Mla1CmHbwqJPn
 dApYm4gOtiQQmVQeEslr4XCWJGLqc4v9yXqBbDHm28BUXSrjqurd4SVyS4/yVDJuoDKgFqly03j
 OTtQLBI0DuHB/peGq4Wy3K7kCVwzN0Z2a2VoavbXG0MyRniV5M+wM6GPHjyYs7ZOpYLZZs7n+VJ
 uP5IE+KO7nCsVPNCehjKEoPFuhtBK31dpIIvGjXdNZb8aOhp80Gx9z6ixtdHnMrvvBYK9HyNn0a
 W9ybMAMxRW8/8epr6g9hlcGnYBm8yMG/2kqE5WauZ6z7Adu9vv8P/GujPYSEI2Yq5ldgTGAgH3/
 89JURLyt3ye1XKCe6pQ==
X-Proofpoint-ORIG-GUID: E2QQPV5NX7iIri0kTTsg77h13irimjmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110976-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,pm.me:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,2p4bk3wppqk6:mid];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B5EE63821F

On Wed, Jun 03, 2026 at 12:59:44PM +0000, Alexander Koskovich wrote:
> On Wednesday, June 3rd, 2026 at 8:54 AM, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Wed, Jun 03, 2026 at 12:41:34PM +0000, Alexander Koskovich wrote:
> > > The dummy panel compatible 'boe,bf068mwm-td0' is missing documentation
> > > and gives a warning. The 'interconnects' property is also missing from
> > > the binding.
> > >
> > > Dropping the nodes here and will just submit panel binding & driver for
> > > use with MSM DRM.
> > >
> > > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > > ---
> > >  .../boot/dts/qcom/milos-nothing-asteroids.dts      | 38 ----------------------
> > >  1 file changed, 38 deletions(-)
> > >
> > > @@ -131,15 +107,6 @@ ramoops@81f20000 {
> > >  			mem-type = <2>;
> > >  			pmsg-size = <0x200000>;
> > >  		};
> > > -
> > > -		/*
> > > -		 * ABL is powering down display and controller if this node is
> > > -		 * not named exactly "splash_region".
> > > -		 */
> > 
> > You might want to keep this node.
> 
> I have it dropped in my working tree and works fine with MSM DRM,
> unless you're thinking of keeping it for out of tree simplefb users?

I was thinking of making it useful for possible future usage, but in the
end we can always revert it, if the future use arives.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

