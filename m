Return-Path: <linux-arm-msm+bounces-115608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hXSnDaDORGrC1AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:24:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C3D6EB0D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:23:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OxQuoLhW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GOEWBgQr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115608-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115608-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0282300E26C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C5C3A5443;
	Wed,  1 Jul 2026 08:23:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B78A3A450F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:23:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894235; cv=none; b=D5KuO83YSUDjbokKiKM0fx8HAPVV+iH9UFO6ZAAutt1u3XGqYXQEtYG/sMSdlC/LQHf3CDfh034V/1I9Dr6KAMwpf+8Aw6NaVe4UF5x2UKJdAe5vIdaHjYPFmuW0+k/V2K3ZOR7+fBSQnn+mG/hse0HSzJz81H1BGRgBHCfYvP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894235; c=relaxed/simple;
	bh=xFiQKu3tppK+/p+0A+SIz1TOwpgjocYnBLAllGtYupM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBowsLWphVIs5sd7holidRLDIiOjXuRSXajw7QgLqeY5nhzIA1V+ELv2okAX0a4Cs4QB2kCT+vle5+ZT8WUShoznyRkfanUOs9NcnRRbtB3gDIpw7TZQ7AYkL4EKJYDlF5J5SHVx+ay9s6cGHgJRynyhWbmUDu8g8s+olHxIe6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OxQuoLhW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOEWBgQr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618FskX479239
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDr1P/gRifULM5ny/bfMaAFY
	vuYW12TgrrrVaHWwgQs=; b=OxQuoLhW5C3aI8eX5BvkQPrUAF0RCOuanrUCjLmM
	varYVfA51U58OCMJpHiOTWT23CAlXo/IR0a9MnCSF71t9Jcw64yvVHzHO5zPpQ7P
	CKv/lzsS25Cnou9A4MMpOEu0M7skaoaLh0Zr+qJhisxMkszXj3xiCdJmMbp1Mjpf
	4BeaudNS1eoc622XUeyOTn27jCuny9KhKFgIR2iGZ8SgwDER1vQT9bxApv8LzEti
	lqR908xGgYA7AY/BLjfLxAVkRbonZj7QZqoy0xgK7XhwyatpfUzeHwxeauKBY/ox
	nXbCNyjmmRHS07vrLIwnlGt3Kbxx+r/+uIaJex7km584HA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tgeat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:23:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c80f89b64bso7513905ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782894227; x=1783499027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDr1P/gRifULM5ny/bfMaAFYvuYW12TgrrrVaHWwgQs=;
        b=GOEWBgQr4+rUbWpb7zJ4c6ch/C9UOcT0T2UWdT0kgybg7QldwFaHdaJ30zQYLMb8L1
         Mt5AoDhQwG1I+ktExn4ttWirUtgm1Ua4iNMId7UgahBfejKTA5lbzlt1/CobaI6N23xV
         aOWmKX4vdFEzG70PnTwPxPCHm3NfUsaD0B2Nws/k+bxTHx/JLrIcUmby3gRiifdjgqVE
         vr9k2CV7tZEmhaNCEoij0uosk+fj//LBOw6qsl2l1FuV45Yn8VLr18RIgnN/zjFxwssx
         M/WrYrN/9yQQaJ+Kemqei/T8ZID9IBvZi5jvDxUjpiDGNLG+67r4E4zepDiaM0GL/AVd
         xFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894227; x=1783499027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDr1P/gRifULM5ny/bfMaAFYvuYW12TgrrrVaHWwgQs=;
        b=BjYF8BiCP5Jf9m9nUfcULy9F9Sdl7z1Ajio3zKP5q73m54upqHwznE6ZXbKpabWKl9
         UiWSUYho24ovGWiILLMSYL8MVi4byNuayA/sA7huukMQzYNJqbTugFUHDGTLoHp70l50
         QJSTqYL+eYD6FGnolD3NwBLASUoTUAUcU91+a1rIqSrLXW8oPFyVuEMuJtzzOO18bLWe
         gvN3/zO6AQt1OBAoX1p9BI6QZLwvV/xUdZk+iV+2JMqnBFfAQGJMQHJzrp+kwvw8Xx5/
         pIQmEWV6pnbLMfVYskbH2ErWV+TyaX8VqEV7oVnirh4OWWmhsMx8i0mVac/xETkf7DyQ
         BKzw==
X-Forwarded-Encrypted: i=1; AHgh+RpD59Mg1mJuoy2kQipmatVhZ2iovLmNmVO8+gDGKtAewg6w+8PFelNcUqh1IX5IbtKJn5KTK5+ODkbBFE2D@vger.kernel.org
X-Gm-Message-State: AOJu0YzSRHbwtC6g9ExxyK5iyGmPwGZxJ/y3chLEtjfxykh0YQDRx8O+
	PaEG5CAhdpYpNj5gHEkYT1B7F4Wni/3kk5JPbtm983wHYqgZd2fHrHMyCU5YxvyM7/dPWcWz2ui
	kN9INIkIF2vo0WN0coalVZH8tJB2T96vMa3V1DdPCykIZs84XS5+N+dCzLugbHi3/FDeh
X-Gm-Gg: AfdE7clitovm8AeIXRcn84LIk32T51+/Vvobhy9E8ayZ+oKwavkjSs7VWcebsI7HHdJ
	s8Ca9pOGuFueg0DorU+6v5v1Iu2n5nrU4pUKXbCL6fu/UObpqVu9TrPmkknS/fphK7+Wjl9BM9W
	aVqOz/oBCL15nmVrGCqY0haoTT0GG9S8Xad/P652qzdiRjycKJ397lnZHgwX2Wy7rlpFRRCiMgy
	2B93lT5IHbsbnNaWzSOZW5cvAxa3fXSuenYg8CzhkhNRAEkIxKMv/BrjqxQaGAuPXTx6LX3KDIZ
	Ntico3fffKeTjlqM6MX1KKsVw8P3/zsYvykdsZfQhIICkgMWr62yHHdiupF2z2+On47OixjWu3g
	dHg/3zi9uzVS2uev8IpRoBAL3bb1vhmu9CQFB2AHbom+ARA==
X-Received: by 2002:a17:903:26c7:b0:2c9:c575:7e22 with SMTP id d9443c01a7336-2ca7e67b281mr9058685ad.9.1782894227402;
        Wed, 01 Jul 2026 01:23:47 -0700 (PDT)
X-Received: by 2002:a17:903:26c7:b0:2c9:c575:7e22 with SMTP id d9443c01a7336-2ca7e67b281mr9058255ad.9.1782894226918;
        Wed, 01 Jul 2026 01:23:46 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm28026635ad.6.2026.07.01.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:23:46 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:53:40 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
Subject: Re: [PATCH V2 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
Message-ID: <akTOjCDcQVLHOUxB@hu-mchunara-hyd.qualcomm.com>
References: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
 <20260616130347.3096034-2-monish.chunara@oss.qualcomm.com>
 <e6aa773c-daa2-43d4-ac56-4a26c58a3910@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6aa773c-daa2-43d4-ac56-4a26c58a3910@oss.qualcomm.com>
X-Proofpoint-GUID: ISKQBbLZQ-q4nN9KJIVsrlpc_dPVdfWq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4NSBTYWx0ZWRfX0/MIRnkkltT/
 th7hmgB957upHxOXfronUXP2s/kZGV6n0XwQWcnk1ZEA9NpwNSc29YrYAyL5u3YE6/OJyAqI5qr
 b/pL9zJP8Q+1PIi8tRSh1lYcdHOrNhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4NSBTYWx0ZWRfX38slK1oOcIOc
 Phia5scu3hcrfL71AUeHKW7yu1G8stfQJMl6rzszkHF3CVqskqEsGscXfQDDjmx1M4LVEpfeksm
 YNoPtBKpOWuGVpC4no0x4bFOZtWY7FOt5pu8VTXhYeLpiin2gvdmT0w/uVV9T5bodHvueeo0y8I
 SA2qaSZ06AsJMg0CO9IGF56pWRFA4TW1mQWoaU9QL8JVYpXij+VYNJa2poWdt1GLBPYxKmybdzE
 p/FaLYk2azuuA0/CUqGEQN/gknJt2IMUZtWig2lPcXOzxYmJxlCkeBAc7HJToJSOqG7/VhHoJD7
 1THsCvUPrsjVw4Yc+Vf23EyZEJDIBepJaRlohySQQelan5/VtEr9USu7lo89SHeohgWUS0WKqr5
 RBBzi+HqHv0QBpunEmRo6t1Am2SRErIy2V/10sUm4RC7+DMCJAZkZYrOTkj9hG/bWnFHaH0X8fD
 9anNcm2Ac8sD8iKDhOA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44ce94 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RFCqL2F_Yns_8Q2u2p4A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ISKQBbLZQ-q4nN9KJIVsrlpc_dPVdfWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115608-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:shiraz.hashim@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,hu-mchunara-hyd.qualcomm.com:mid];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98C3D6EB0D4

On Wed, Jun 17, 2026 at 12:17:28PM +0200, Konrad Dybcio wrote:
> On 6/16/26 3:03 PM, Monish Chunara wrote:
> > The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
> > the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
> > and conflicts with SD card operation.
> > 
> > Remove 'supports-cqe' from the SoC device tree to ensure compatibility
> > with SD cards. Simultaneously, add the property explicitly to the
> > qcs8300-ride board device tree, as this board uses the controller in
> > eMMC mode.
> > 
> > This ensures the SoC definition remains generic while enabling features
> > correctly at the board level.
> > 
> > Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco.dtsi      | 1 -
> >  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 1 +
> 
> Please also fix up monaco-monza-som.dtsi
>

Sure, updated in v3: https://lore.kernel.org/all/20260701081715.2580329-1-monish.chunara@oss.qualcomm.com/

Regards,
Monish 

