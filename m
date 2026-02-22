Return-Path: <linux-arm-msm+bounces-93561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPNBIEJWm2kyyQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 20:17:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC117029B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 20:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E7AD300B9FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 19:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC8C35B65E;
	Sun, 22 Feb 2026 19:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIcHZCIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5QMGofM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9D519E96D
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 19:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771787829; cv=none; b=Vz0BY35z7kbHlg0kgqrmPp9QgjDuhsouXF7NeDO8T9NL5F7h+8+vCf13CTKmGW0FOKddoyBezma9xVcvIUQ+vf3vh5vSSm/tZWcCwXbZ0+XL7yJVDXUAUe2sMx3fCyOAArUpYsyIxuOzF6H2Ad38pF1g1Yk64KidnqD4nKkpfco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771787829; c=relaxed/simple;
	bh=uUJy5AX0svP0Sgv3pfmZ9ZKIlw3InDYJOuRWfytcO1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWWm4b4KGiBGxFfCsHNRCQzREhaLC8WXxHhwmYm5OtFGQhYDAlBBc/HBB3YWtnwootrD7GdSl2xgKvPibUB2+/GXw77Pq2v/B/bbJIzoVr3GWy1ljgWEf/3hLDALm45fN97pabVWY/EAMXQ5HQKf8lnKH47mAGUzQ5YXjaRrPNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIcHZCIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5QMGofM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MGcZlF766119
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 19:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZDfCM9JkJCvdLSvmgjTqAZNsdKDGqwDMcChuIGQ1KQ=; b=IIcHZCIiG7zKsojq
	GKXoSbaYnF3MTQUHI2sA/hGIXmxlSsrgMrgM9jx0ByBop0vQeOjxTk+vHqDxR0ZW
	zD4deAAYtKnSz8bWSxLHKgVhW+lF+1GQXmFS5cMKzncM9ajV9zJJy10Tqm2GyGUY
	wBoUPil7YO7vSDQ2rVh1MWFnyWvK7QzLB8jwwepvGwgY6XfBqv3VLPwPJ8lCcaZX
	bhMebtSOdqYWNqWpvZt+BeevOO1bHkMoLGnvwOIUoAgMcnCnssXVmBaVEkwofUYM
	1hBGqHYHxD7UTVWnrx1w+svMzmTuWMRZCiqTaz+23+ArlmYvQHT6q1TF3Nm+T3Qu
	FqEP+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7tm6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 19:17:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3fae6f60so4826989185a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 11:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771787820; x=1772392620; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GZDfCM9JkJCvdLSvmgjTqAZNsdKDGqwDMcChuIGQ1KQ=;
        b=H5QMGofMvCYI+Oj5eizlG3aO3FWYPe5ELl2/02/RBaGpwKyja9Hp/WlYTcHrjIpw1Q
         8M5x0XnhOM/vUsFlMx8CLQphy/viKMo+eu5GG1WniHBXJ+Jk0RgAEwWK28n4oPvtPF8M
         x99DQgpYYrCa6SLmumIMQK0FThkGHu/YDP6Bjznxrn59MjN/cb0+GZk1+VUPWzx45FSg
         ZLF1QiNCleoU7rVy0ZgF5lL3XIHM5ED3RmYqR9zj5ebH1f+/reiwSw6CttM+OgBVXEPL
         k8d5LPeSBScAkCNCutxQifrhAczFBu/hHBby9wO3eX6ql2qX56xkonmfj7Qz6g2xl2wA
         AfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771787820; x=1772392620;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZDfCM9JkJCvdLSvmgjTqAZNsdKDGqwDMcChuIGQ1KQ=;
        b=uaERtEn56zm14BIlo6Cj3T75TMFuJSV8aQZlsKQLLYaDsE9FLN0IR+VqtnrEtS2WAd
         2397zOYM80nYzJU3aFuj+LN1Ocp9dLSbGaSbo8Wxa8fqNy/2ibEp/QpJZ87OFs1fAH5H
         JrQFw/rh0bqCMqX2R2wbGE5yMHoFDnOFJPxSr1fZbnSF4v5g3xoBRr63+wuJ7KBbWRLe
         2BVM2/U4HRCZjhYThOVQnCCSlwC9QL0a7Q/e8uFZosdK3XjMuc8F2H5t+kRX70cDk79R
         uwfVCImWcV1OOWoqRUhKUFpXDYwC63Dzbj0SPWiLtB8HpUhMC82q0fZYZjHXG2MTxYkE
         HU7A==
X-Forwarded-Encrypted: i=1; AJvYcCVktzuu7DBg4TbH0CSciJp51qSaam7n72pPl6v6T+64xOgZ4OmnqZOoW/KQgBbIJwyfwBFIiN0I6lJTLJr5@vger.kernel.org
X-Gm-Message-State: AOJu0YyEe6xtcXQshak/MycqS1QkwTLed0hzMqTksJy/jr/7T/UdMudN
	8KAhmhfgUZiGPsBFVFnOcVrnEMuRXJaOBbC5aNYTHnv3/mQ6pAvqGPzVuzdoMDXlXJn43KCJo1n
	ZBjwPPvZ2UXUH2Cf4fMWWTe5oWS1EVGbxcAKfTZlDgfzJdIoRqcXl/K57qtjZLUT9qqlo
X-Gm-Gg: AZuq6aIzR28L3ueG00e6m7ItVBBLdqRkZ1SNPtjGiSbtKEj4wR14GaKpdQ5jJfH0dP2
	888egGTW954zSqBpXNfs1dnNguqzoIUL8rgVeh7u+95f60nQHVYMMUuoyQDr5Wnrd9S60yJNM7t
	+gEm3vdEnQZNnN0gGxlizF6yoYbB1AM7PGeT1KD4whdIZc6BSmLPiHGQVdeclyhGVs5u7LmkqAo
	vb9EszPwtkHKIOUD49jTnru5vFOzpF8Z5Dm6CstKFbmLyDgpL/NC/FLl8baRjJAivL2ianypQu9
	htiVmIwxGIywRse7oGBIJBsJWrT0Z2bHDaqH71AylPDEcORzf+tapxyTcJhqfTQAj/GYdwXiiTf
	zd45977souDaqIHQ8Tmsh/yQepdnUTIDWp3MN625oX3Rc2olKckReqxZeqKSBZaXeAOD1y7Uwza
	Je5TSAVKsCLPhnjWZCcJob0lqbD3SI7YHh/IY=
X-Received: by 2002:a05:620a:254f:b0:8b2:1fa8:4684 with SMTP id af79cd13be357-8cb8c57c8eamr819988285a.2.1771787819691;
        Sun, 22 Feb 2026 11:16:59 -0800 (PST)
X-Received: by 2002:a05:620a:254f:b0:8b2:1fa8:4684 with SMTP id af79cd13be357-8cb8c57c8eamr819985485a.2.1771787819100;
        Sun, 22 Feb 2026 11:16:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b923sm1128724e87.6.2026.02.22.11.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 11:16:57 -0800 (PST)
Date: Sun, 22 Feb 2026 21:16:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge
 with displayport
Message-ID: <wvjfla4rk2qxzayloov6ofna73kl22nls2a6h5uzvap4kasfh2@nqvpdsassfcx>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-linux-for-next-v3-1-3f77ad84d7d1@oss.qualcomm.com>
 <z3y6wb6irac2ef3f55roy66wzyufel4vannfbynoivzgl2cuob@um5eomgvt5uc>
 <aZo/NRg3IxdyKZ6I@hu-vishsain-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZo/NRg3IxdyKZ6I@hu-vishsain-blr.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDE4NiBTYWx0ZWRfX8gy31wP8kABC
 QStLS9c5CDzjMERdEqAIVh5SRvfUnzgGnOTuuy5ljKI5HZpbGPRORYeFrkHXGjJBr4uR6eIaDVP
 cOfNhsdez0mOLBnDRfu2rlXoFWXVZU+7BlSNBAG+QTk+5TqAa0/t81W0SXiy17migw0MDflxRcC
 cZi0fQBJaPDUzNE08X7ShOPqIiiRRQ6Ue4JnoBYq5M/vxkJmHWF08REKCH0DEyZ+xzmq0rJQXXZ
 ST4EzC96BCaU0MTCSCyoxkYZpdeZfbjSnInw/eL2BAwcce94isOQk7ChkuWED8MUCxq+bdq46em
 Lx8QF496g6Q+IsJm/LHWVe1zKtwKVW+j0MhvHMpCDK0jIMoEJ0aaOQQwmb7q2tzWnfusZC4cxGt
 pOPU/Ncr2vNHSO00H7Kq/OLxYJThb7Hxrb2zsOc7wIS7DB/54wHxGGLTzeMSldtm+kLT0I3t154
 6gI4rUZL0eo84Fd6+9Q==
X-Proofpoint-GUID: EiF7NxQkPBzk8CZmO7U_yewWhhncmUG0
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699b562c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=RmgxRUnRNJUv4K-xdngA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: EiF7NxQkPBzk8CZmO7U_yewWhhncmUG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_04,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220186
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93561-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECEC117029B
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 04:56:45AM +0530, Vishnu Saini wrote:
> On Sun, Dec 28, 2025 at 05:49:30PM +0200, Dmitry Baryshkov wrote:
> > On Sun, Dec 28, 2025 at 07:10:38PM +0530, Vishnu Saini wrote:
> > > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > > converter. Edp PHY from monaco soc is connected to lt8713sx
> > > as input and output of lt8713sx is connected to 3 mini DP ports.
> > > 
> > > Two ports are available in mainboard and one port
> > > is available on Mezz board.
> > > 
> > > lt8713sx is connected to soc over i2c0 and with reset gpio
> > > connected to pin6 of ioexpander5.
> > > 
> > > Enable the edp nodes from monaco and enable lontium lt8713sx
> > > bridge node.
> > > 
> > > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
> > >  2 files changed, 95 insertions(+)
> > > 
> > 
> > > @@ -396,10 +456,39 @@ expander6: gpio@3e {
> > >  	};
> > >  };
> > >  
> > > +&mdss {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&mdss_dp0 {
> > > +	pinctrl-0 = <&dp_hot_plug_det>;
> > > +	pinctrl-names = "default";
> > 
> > Is there a single HPD? How does it work? What happens if either of
> > connected displays sends a HPD pulse signal?
> 
> Yes, from the SoC’s point of view there is a single HPD.
> LT8713SX aggregates multiple downstream HPDs from connected displays into one upstream HPD to soc.
> When any display is connected, the bridge firmware notices that one downstream port changed state and
> It aggregates a single HPD to soc. The SoC treats this as a DP interrupt and AUX transactions start.

Are HPD Pulse IRQs also combined?

>  
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&mdss_dp0_out {
> > > +	data-lanes = <0 1 2 3>;
> > > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > > +	remote-endpoint = <&lt8713sx_dp_in>;
> > 
> > Does the bridge use DP signalling or does it use USB-C signalling here?
> > And even if it is DP signalling, it should be correctly described as
> > it uses signals coming from the QMP PHY. See how it's done for laptops
> > with DP-HDMI convertors.
> Yes, the LT8713SX is using native DP signalling, not USB‑C DP Alt‑Mode.
> The QMP DP PHY is already implicitly part of the mdss_dp0 pipeline,
> similar to other Qualcomm platforms where external DP bridges are connected. Because of that, I intentionally modeled the connection as:
> MDSS DP controller -> LT8713SX bridge
> This keeps the DT consistent with existing Qualcomm DP bridge descriptions, where the PHY is not represented as a separate graph endpoint unless there is external lane muxing or alternative signalling paths.
> If you feel strongly that the DT should explicitly model:
> MDSS DP controller -> QMP DP PHY → LT8713SX bridge
> I can update the graph accordingly. Otherwise, please let me know if documenting this more clearly in the binding or commit message would be sufficient.

Please check how (and why) other boards handle the similar usecase of
DP-to-HDMI bridges. To put it short, in your DT there is no notion that
it is a native DP rather than USB-C signalling.

> 
> > > +};
> > > +
> > > +&mdss_dp0_phy {
> > > +	vdda-phy-supply = <&vreg_l5a>;
> > > +	vdda-pll-supply = <&vreg_l4a>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +

-- 
With best wishes
Dmitry

