Return-Path: <linux-arm-msm+bounces-94211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOplN7G/n2lOdgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:36:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE71A0989
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11C433021E6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99D03876C0;
	Thu, 26 Feb 2026 03:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtnnGu5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvytonto"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A10374180
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772076969; cv=none; b=SUgSO7NpnSPGf41TPbjPR4Matz3CnwCV/RY070ysmOEm/Fb/Aa4m2n46w/ERHuc9lFDPyBAb0wLCFenWHvggxK0YUkbn9D8zCb3Xj/I+x9lyWOLx0HBCRVEh/Oj+dBFViRlMz3y57RWupq4ECyF23VEsYQHIj/a8LuXV6SiuopQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772076969; c=relaxed/simple;
	bh=Tm/CntGVx7lzcYy31vYFSWuxJJq5hPUQ7g57M+fcQDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fg28ae9leR+q6o5AVt72o9nAEYU+tZGvBlWhUg5OrblDG1nswPPcgW2d6OARU+kOmgoZyxD+nLoFit/hn+vCZfBIbN13ohXC31wRidNtHxVrFh/WA9gr82wW1honwhkgn2T3lI8N07jGpz+yZShOeHjT3liir9Wte8P6bmbcnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtnnGu5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvytonto; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q1IjgO3041192
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	su2c5PEEQWrzHZdSjwt/TsT9V482yyWcdTzdDBcp1YY=; b=YtnnGu5r36902Mz9
	dfUAjitYWSG+Fm1ugd3dsDoQSSnsv/tUgJcoc3mImrLrKchln6RNo4FlO1Av9Z//
	OGH+m/1/usB5/xiCld5EwYyzXViO5FDw97er0xLDTWQN0QsBgWh90BZiIIqXim80
	JFk3Z96+ALwHkxNB4xwBLb5JS5WEWWEsMS9PFX1icVAgMY1cozHdQQduW4K3yGer
	43MbjqhXkLiZJk45jTWa9UdVHLCuHCMxU6lUGPNEynOV9MSmOIRfGeV5p2zdz+j+
	D+xGBHIFvSivGvBDJnUPdK5MERCc3smKvWx240g7FegstZJX1zQF3+wHnxo9Rt1F
	qqsCtg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350j2gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:36:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so407502685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 19:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772076964; x=1772681764; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=su2c5PEEQWrzHZdSjwt/TsT9V482yyWcdTzdDBcp1YY=;
        b=kvytontovAcrfDaw3r3cMdJKjne+KpMw0DbHvIn0/EpDcA7mazN+uYS3vUwiVY74NK
         K5r20Wu4fZxgJJZmzBzGLW9bvxX7mOGnOZq5MUb+BuKP0V7Zua/3kBaIngJx0Bw+ncDV
         QxMHP7cxoOJaEJzl8yb9pwBGhRrBKTFzeLberSdNFXp89kbE2AXUYWT7kdi8a7UFepog
         RHtP4IwmS++LElpVyCiqyoHgIhv9zWcaUaC55LZV2rlJf/xCU/yn5kdTuDTQ671JxaEo
         p6ATN7ID1+Kb513X2ACz3o7P8caKdAvqzOE9rMeGEv+AGwHYyiGhn7D0gtJ1aaIk106o
         NQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772076964; x=1772681764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=su2c5PEEQWrzHZdSjwt/TsT9V482yyWcdTzdDBcp1YY=;
        b=j4HuCAAlzWqD1BWW0lw4aiga+1d3iB1cAS8Dee8fRtI+rCrq6R1Soah+BNVtzWN9c2
         NRCOIj2siFOdT0Dt1PMRUeqzoPHElVw3yvr9XY8vJeJOdtySnD7mnsNOvijndNP2V3xp
         oKCVuBwmOBjRg4/5cmYpaaYsNlz68RSPhUBSbkQvVece4n5QrBgGmPHPoeQ5Ef27ZPP6
         ILpvQP1vmuAit+2Wub6TPwJReWIoLmrAensyPsv56NWifzluzJP/9B+Y2KZOA0oiYFZX
         pXMB2gepph8MT8FUEt6uOpYwnDxMd7Jw/8mniHXEZFF6DyKZORgKBqpVNZ8dELmp88iB
         26eg==
X-Forwarded-Encrypted: i=1; AJvYcCXjqqNdhBKO7J0vXX8klL2+P57g9iEkFi5dvF2GWQpEgk1z313DUwiKTR7shF/VFAOC2evtBJG6b/PSZFR2@vger.kernel.org
X-Gm-Message-State: AOJu0YysSKPEzKwteTUYJKzuUJRdFqabaNGcGbuOk1OTNQDVzndIeAzY
	/i4m0Fh1Mycv98DRF3e1hdPB9sHPJQBfXqYrMT5h8Wmdvsqie61hYiT3aIXVSYNiAeQJRqGiXXj
	I8LGfVJKr2Ip3Lo71ymSEJZa9v4+VmUgqZuBDZOhm8FNwzxvYp0iqDBN4Bo2H8cXOPL5x
X-Gm-Gg: ATEYQzwkxCKZNXS8s1LMCUPAiVI2VPtoyBoe+8xqDJoc2LLY15FMF/6K81usLobTuKc
	i2dAfjLGxg10/bLac9HSnlgC5KfMwpD2CjlDT9Uw4N8g3tGVGuxnFcwQ0E6Mc+W6GWXTGuajUkq
	X9gKUW56onaJJcueO1vL6beZ3n81JO0i5eZ5QCg9tMtdHR8gvShlf2ofaM0wPKRfPPK/EOsDmXw
	sp5Un/m8Jw4TyHzJveIsq8gKvWgWITopeKEOIzAPuYRjYSrVWkpy5SkPdL+DlG0asCLr8K8DlO1
	Qmc1lhfWk+wK6nPAJ0ySeOPDugO/dl94CxhjJqwwgRosT2OOoqJrttRNY1qpZOQEwLTkswJ6d7u
	WI+dV/sX9sLDd2odqjbIJkp2TUpiQHJjPlU2ATJ1pEQpyuc1amAhSoqbZCBPqC6YodFthvhOAS0
	fph7VBzhDcNO7r3cuMoqXth5Bnl2egg9LQZmE=
X-Received: by 2002:a05:620a:4407:b0:8cb:3143:64cc with SMTP id af79cd13be357-8cbbf407265mr167692585a.42.1772076963621;
        Wed, 25 Feb 2026 19:36:03 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:8cb:3143:64cc with SMTP id af79cd13be357-8cbbf407265mr167690885a.42.1772076963151;
        Wed, 25 Feb 2026 19:36:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109e1772esm271922e87.20.2026.02.25.19.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 19:36:01 -0800 (PST)
Date: Thu, 26 Feb 2026 05:35:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
Message-ID: <3y2j6bvfepzathzrpvyeozmnk3h2whj3mes7w4xcqff3mhnh3b@h5xntwre7t2i>
References: <20260212-rb3gen2-upd-gl3590-v1-1-18fb04bb32b0@oss.qualcomm.com>
 <iy3yypj2gcl6znygsyoxja3lh7irrl25snqnbxfmyhyhqgays2@57lyx33bthh6>
 <5slnnbku4wap4bpyg5iyme3zmzst3frggdukg4elli3e3pmsow@7oueerydfiq2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5slnnbku4wap4bpyg5iyme3zmzst3frggdukg4elli3e3pmsow@7oueerydfiq2>
X-Proofpoint-GUID: gQaZSC0sAHTd0Z0A4vYFSvtyVX0v63pW
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699fbfa4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=3_uRt0xjAAAA:8
 a=EUspDBNiAAAA:8 a=ticRl_MBgV-HPz6wqh0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=z1SuboXgGPGzQ8_2mWib:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyOSBTYWx0ZWRfX4xruDV2InVus
 ftldytb0wLUv8nuDGu5I/26EfhenAfz+RnkHrcYhoC7PSQSrrS7ZzLCTCi6tnS0+mbYwM9uCU5w
 0h0GqNXidMgPeacNeaHbM+FGEZMuKEhUtplS5rjzVcvcuUcd4FiyIDZ8jj4STvm8+Eb5ChWN8uJ
 Y73OHqDUTh1+gNaMgA5OCVvfj1g8OgubhxbEnTWvvbb+i64RCpAMs+txCaYzx3pyJrY5h7Mk1Rb
 RDt+LSxfpd6UGZJzE3jva/I/0AWeRLZ7B/+3vIVD7q3eS+0d4W3O57a9XxypJxN9kT6rdXQQ2GG
 qVO7Lm5tjbQ1Vfg3XrAXls7MAppkvYp9Ei6AGv20dwP4a4nXLi35EJ0BapQpAM3VrUuVUzTwsnE
 XTgQtKLhXXm/8Mmk/H3P+zw8HNZlhKThL2VcVn4QD/59Ydg5AUxlLVLMOdRvc6CVHmGWPZjHPvN
 DekKVT6o7bFbE5Bn8LQ==
X-Proofpoint-ORIG-GUID: gQaZSC0sAHTd0Z0A4vYFSvtyVX0v63pW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260029
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94211-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sources.debian.net:url,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76DE71A0989
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 09:40:40PM -0600, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 09:52:45AM +0200, Dmitry Baryshkov wrote:
> > On Thu, Feb 12, 2026 at 02:43:46PM -0600, Bjorn Andersson wrote:
> > > The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> > > the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> > > two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> > > interface.
> > > 
> > > The Renesas chip is powered by two regulators controlled through PM7250B
> > > GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> > > The Genesys chip power is always-on, but the reset pin is controlled
> > > through TLMM GPIO 162.
> > > 
> > > Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> > > allow it to be brought out of reset and discovered. Then describe the
> > > two peers of the USB hub, with its reset GPIO, to allow this to be
> > > brought out of reset.
> > > 
> > > The USB Type-A connectors are not described, as they are in no regard
> > > controlled by the operating system.
> > 
> > Nevertheless, their presense in DT controls port's connect_type as can
> > be seen in sysfs.
> > 
> 
> Is that information useful enough to be worth describing the connectors
> and wire them up, despite being completely passive?
> 
> What consumes connect_type?

Quick check through sources.debian.net reveals usbguard and
libusbauth-configparser. Granted that Stephen Boyd wired it up for DT
devices pointing Trogdor devices, I'd assume that something inside CrOS
can also be using these properties.

> 
> Regards,
> Bjorn
> 
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

