Return-Path: <linux-arm-msm+bounces-101165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIUXB/I2zGn7RQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:04:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F4A37155E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 23:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DFCF3086CE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CAE3E3D94;
	Tue, 31 Mar 2026 20:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfMp43Ov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcKyJHaZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733E3D566D
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774990736; cv=none; b=ppwfa1QBHXhrlKoSD7lceVRSym0oWkdZE3OanNK0/2HD3VDPHWlB5GiopR0rwIZiyg9216LgfLBt0hAcaJnI0ryxMsy7B4Nn0pp+E7bQxqZOKkNxsFzm7/fZonuIvKVAsxsmRw2PTNIl2axa4OmP7Bjzgp+FIYlS2tzybGdC6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774990736; c=relaxed/simple;
	bh=4pw//0aMVpVC79RUN/bCK1yLIUNfqEnOpV6nZbaH04E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTV9ydZtOTOLTkaaIkrFe4UervwSdm2lksStYUw+23xuk2aVT3FjRYeHgg6HwCJTn1J+VQf/SpZUuXLzGAiF+nKo4BQadpGKmeSxhCnYIjRlUmn8s1xRKFE3+YGIeqzpCzBr/KKoferF0KIPn5HTyRKqdIlpU9m6vP7vIRiZm1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfMp43Ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcKyJHaZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdIlb1831880
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HddPcSAbUNS8veYlTx2o5Se9
	1feKqDMffrj4xcj/ilE=; b=nfMp43OvPKg9eH1vcdrAPIcAYlhRnyjwneuIP46G
	95nmc/u5yohrbiDrFUCHs6ZXEnG5EYXm/spSAwdxyXOkNvaHJ99r/HtY+iZHzEn/
	3fKvEOb+JWTFsKJpS92+tez1J2hGKS2ej7F00zGeKqCtTHM+7bnyz20x4k/2EgyJ
	EIrLrDC1ONnIwrzo1Q7H/ljKWZjcN0DIDydUF3RvLlpn/fi240m/I+QVmzv0Tgvz
	mjndNVO19zI2XiJVyfemN9TiyOeibZfO6gxfohI0Dn2eRQb61gfZ6hVcBmULUZ/S
	SqLtMmQMPufxo/jv5e5PRFf1Wjl/+1Oy5FYxWBOrXavc8w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equada4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:58:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c646e980bso4126668b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774990733; x=1775595533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HddPcSAbUNS8veYlTx2o5Se91feKqDMffrj4xcj/ilE=;
        b=XcKyJHaZMkfrwD8wDAL2YoBzRKl2XW9fLwAwI4gt15BxRyIlVjpv8DrRYSEONrz4de
         hF1iAxngYm3BeuYwBeYd0cpq2cnlRPQbaOc5z4NbR24N64l6Oc+FMr9T4MX+RcYpgrgP
         XtZdzZpdqrIifSJQLIrVXw3SE7WSwCRcJ89yWWtHeSws1y3RyWclUgt8v8xMBjrRpDa+
         2fvr1H8mOts9fxtwK8YeIUOfcyyk3GRqW+Whpz1JR71OgvM8UB2XG8tk+SSfwZqYeoYE
         sFm/zmHP6fjKcbyEWcEce7jXojH4BE2z+B1QjCRWbUw5/F7YXJ/KHzCXPec7BWpSiJB/
         8wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774990733; x=1775595533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HddPcSAbUNS8veYlTx2o5Se91feKqDMffrj4xcj/ilE=;
        b=RB+oYsVLWobcM3xpDQr6xW/u4DOvFsJB9ot5MtkWwHfolroOnQZF/yw2r8tP7btuFo
         j7oAGh6lvAj/piD2BOxv7xICqqtPyNFUeYeRZWEBijfJ06krgbXGff33GmvLVSwf1PJ4
         MkV4/1bmxiMQmR4lMXJuH6r7ZesNZeH76ri1uM8ei/nfQ4tqX1bRD/hsJtVwzKwBIElk
         F/u7iewPVy19yhIHBSPgmegcLMF4pHcGlHySwuTZKq9o6kURtc4/Y1gV8kC5ZQZpOeHx
         Xscx7DniVHLYv462tIfIvjRZplE/2ntewkbsn44Ajwjp7fFBwa5ONb2/NTdIXAov5/wF
         yAQw==
X-Forwarded-Encrypted: i=1; AJvYcCV9bDC16AwhsJURsCvDLN5YT88ogrvCPzQrnoos2gBZemqCOOAEMjPWUZCqB7mmLaocsiCO3ZrFU9TLmBz4@vger.kernel.org
X-Gm-Message-State: AOJu0YyWgcn6J/zmJ2pOQu2umQ15ihV09qBEcyMG7ClILG8ywE8Hqu+o
	gWD4EgYY49JSkXLirfZQbgZBEi2g5ITKGU3Nv84n0OwCxrdMgujAqY0vh83ayv3ioxF077I61P4
	Gpd3sHcj7fyumJUUajN8rcgiSdk5xziPm8K4QQbd8R6Op1eBhkd8c34hmFtrlX5y/3G1f
X-Gm-Gg: ATEYQzzRfu8IEvLkxQso/zQQEWnPxv9frEtcMbCyA6KrGmob1YW/dMyHom4ovjMpBZA
	C4efJDlNwpHhgIcMPD5FqpNOhjRsE1nmlyuiEzIIfAPALk6BMja6LKReVImiqb2QcEKYF3bOD9F
	R1UAgSyvJuzuHJJCtHrMho5T1zbC1DR3tM4319kMDMU9mMImTURMYrXszexkxjxyHt+8cA7K6Ue
	FyXvhO7Lv5w3s1fvtD+Fa1A6bkH1B/DmDmzhVTnt2avZvawF2D0xmsVjFIUoAIedLb6y12UsQLW
	KK4t9r0GQz7GarygH9Dgu4RKrjsuc8uvRDAoOl6kjHV4omU3ezE9DexD8GUthVPmlxIzMKw8wWP
	R7w2YL19Y0mmM3pKJVYq1QCoESbKPvdTY5/M=
X-Received: by 2002:a05:6a00:84d:b0:82a:60ad:874 with SMTP id d2e1a72fcca58-82ce8957d6dmr1039520b3a.19.1774990733360;
        Tue, 31 Mar 2026 13:58:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:84d:b0:82a:60ad:874 with SMTP id d2e1a72fcca58-82ce8957d6dmr1039494b3a.19.1774990732800;
        Tue, 31 Mar 2026 13:58:52 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82caf97abfesm10359545b3a.1.2026.03.31.13.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 13:58:52 -0700 (PDT)
Date: Wed, 1 Apr 2026 02:28:45 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
Message-ID: <acw1habUsiSqlrky@oss.qualcomm.com>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDIwMiBTYWx0ZWRfXwt0MBD6FB5SM
 guyeZzHO6z8lQQiBKLCkok9Zh+DO+bCWuTRVN5/hSRewZBWebe/M7LGn84jhEXx9f9ni0ATj/xU
 FWe0a2p6+6ScMNbJIRM4Packv6XOpM/rGQn4+A8THjfxfhJkt5PFuYi8RST1NYJSW2dliRxvKoR
 GAwLrHABxw/Uzs9ph4wTfC+FbI6cw1njWZYYQOxcS6ReuciKAUYjp9f9Dm3+9j1dsbZMpZXQcfv
 ZcW/pnG1Z1ku6tLZ1Crjy0wE1HHwmbqgpGY0MpDg+0sAFjCiQj5UBe9nmHUQL5Mr9eBuAR+5jGV
 lBWH182/9FXUBqWOL89uMaP58rF5YBoTHXiZKTU75Pn/1EnNBalT96CgsvNacJZMb6VRrEBvY4j
 JhSkD/naL9xyRL9ArlS+xmqqqQfFgfG6UOQTpo/yayFIUY8M1vin6bWEnXWmAiIRvcPkQbjPpZG
 Z8p0R2y/iHK8lf2nAbw==
X-Proofpoint-GUID: _GC78BQUI5k-5q50i1RkSacYV-G2PnFA
X-Proofpoint-ORIG-GUID: _GC78BQUI5k-5q50i1RkSacYV-G2PnFA
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc358e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9WimFISaW_B1XMulNl8A:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_05,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310202
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101165-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74F4A37155E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 01:20:18PM +0100, Russell King (Oracle) wrote:
> On Mon, Mar 30, 2026 at 01:18:56PM +0200, Konrad Dybcio wrote:
> > On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> > > The clocks for qcom-ethqos return a rate of zero as firmware manages
> > > their rate. According to hardware documentation, the clock which is
> > > fed to the slave AHB interface can crange between 50 and 100MHz.
> > 
> > FWIW this __may__ possibly differ between platforms, but I'm not sure
> > to what degree. Will there be visible impact if we e.g. have a 200 or
> > 300 MHz clock somewhere?
> 

While I had made an identical change while retesting the PCS series,
I was holding off on posting this patch for the same concern - what
if some boards fall outside the 50 - 100 MHz range.

After some digging, the AHB clock appears to operate within:
 - 50 to 100 MHz for lemans/monaco derivative boards (2500BASE-X
   interface)
 - 30 to 75 MHz for boards with an RGMII interface.

This is not exhaustive, but it covers all boards I have access to
which actually boot with the upstream kernel.

Therefore, I think using the /42 divisor should be fine as it will
ensure that MDC never goes beyond 2.5 MHz.

If a future platform exceeds this range, we could switch to something
like: plat_dat->clk_csr = data->clk_csr, with each EMAC version
selecting the appropriate divisor.

Due to some urgent work tasks, I am still finishing PCS series
testing. I will provide a t-b once done.

In the meanwhile, please feel free to add:

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


