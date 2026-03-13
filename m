Return-Path: <linux-arm-msm+bounces-97597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK/7LHVFtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:12:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C73B287E71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48764315449C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91A4C2EA;
	Fri, 13 Mar 2026 17:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqvS27LD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnTyj18t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A61A294
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421323; cv=none; b=qnrExEeiF9F3q5QyVquP3p+ClAhqwqsKw75s5Dse9XE3G8pfk94Zs4SpHiE7RX2FoxjWQLY5JC/DhXYKhFmeQ2ob3+XZWCioZ6RcEJQBXufaBvNseOLOTeIzoSpDvT9ut2hgzjnon1dzji0lPKO6aift4yty8M78H4SxUlCCTd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421323; c=relaxed/simple;
	bh=dvT3+hL8mejQEHQoH72Tr5XDWCruxy6VPuRHR0/q2nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ub92B5PuAtbCqO0A4FW2iiyLhdbLjGUWynQ3dh9vFNwyWJgigc1rfDPlINMFb5lGRIC7/b8+M4i7DpYQvJdZvKVVd25iZ41JHV/gQFKMFpA6UBXCSj5N2YucRZEh6ZshA6vnpmB4NF7p6rv1vg8pdboGd9LhgTVQUDwQsnQICZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqvS27LD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnTyj18t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA83bm1749335
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szMYKweoAod6UOumfv/KGkcHnTWmiLXooUBjS94ThxA=; b=KqvS27LDPzf9y7i7
	9AK4P9T6R1lDw5G7ctjXxyk7majoDll7M7scmCCDLogF/Ypq7KiPEwJDKNbQp7hx
	fdygepuoc8ZFdcWnoJk4UTu79QNvVgSApqPiEHuo44P50AhGe02cBfXEjPvMWivp
	snTpa8orcnIrObrKThCAqJMq0c89Tfu7YQy6pir69i3Z4FsaYTMRMvAOiVX6NkNr
	DlKwEJnjWy4qJMuYy2HhI4Y/cfwDOGsA4KrqP777OBxWoKPVzZgJJFNuecgJ0+Ld
	derIKi4T63u2lxkwXUYI92El7dZYHvdguEtPRg8NBOSxTOttyzcHZ2ChawaikLUz
	ELDEMg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6hbe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:02:01 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-66b612efb4aso29358761eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773421321; x=1774026121; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=szMYKweoAod6UOumfv/KGkcHnTWmiLXooUBjS94ThxA=;
        b=jnTyj18tv1B84JafxA7Y3IevlM0haflP+/6zWTn2Ovk32QvyYHGOOBYM2hS91geF1h
         wLZP2iMbRju8Brm/7siSmflGLRWLjcVRsxFrKy5KlWmHhfU+EQbgPDG7V4+Ecb+vGqRZ
         gIJx5+AQZkf2P1eYtzbM+UzEJrAT3wzyJokO/fWUvG5+iN3DkUPCpXhnWfu+dRM184Cx
         5GQ7RBfPKQW1W/GIQZM8/gF2hFN712C2Oy4S+G8TpLmcn4xxknjRNc5Xo1h0frRGzbTj
         8uWyheKp8sSd8cm+UiQ49XdDVJqJem+pg5tQqMkbR2SRldtEVKs7RvAjU+Vz8iQ/b9nu
         xnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773421321; x=1774026121;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szMYKweoAod6UOumfv/KGkcHnTWmiLXooUBjS94ThxA=;
        b=aHiPDPQYs5r0HLxJz9EksOtc2Gyo665Q13cEY7AAMJckXsCZpy9kKxth0AdmfKC12P
         qHWEhj92y5LFLbz2/C5K8mwnXOztRpuLgdzU+YlLqqvBvzBd9jTbJ28ZTj8F2CRC/86m
         YzRYl+DYQ3+UOEpraqIag3g27O165BwA+l6R2gXU3OZzpv9phs1P8Jg/jj9YnuCPl0NK
         453l5Xn5zGpXhGyZ+gu0ERa9oSHqVF4v3KxGBQuku40CApmGye6J8u+ol33zcORNwQmP
         +TosXZSEWBnF+VY733Dpn6t9ih51aC82EdqX0/ZVO5j+zF+DaU8FwW9A8KF2nB/sYm53
         d0jg==
X-Forwarded-Encrypted: i=1; AJvYcCW1gIZa2t8hpy7N5JqnUlAJMa0+cs4Ig5Jde/Tslmj1I+CxuhuFyFo6G7YS1kVIvdz2HtscKypf0N+e2aGO@vger.kernel.org
X-Gm-Message-State: AOJu0YzDddzfs9a9S5T41nI/FZGb0S/lA80CkOUtgr5x7rU17QHEE5Nj
	K2oV4RoWEir4PWPMKKEVBuq0h2LBaeLGqzHZ6E1HN/oh2giW5zRVhE95BawCZnHjnUBmFAhWRLm
	OFVCsMJgkUA9U8psKyPfgoNI+VQfb3AcAmQ+e21svbDPJo72Ugd018MSPmybGjUPOSEj2
X-Gm-Gg: ATEYQzyXFG62g1eCW7a3fYgXEfp3ptilppZFMHB0qg2zhjIzMU7R77vyBMDW3xZ4w6n
	XDCXoDxX9DVDYPdVWUW1sudxYYDQiCnR27k7qAbzLq6s28aGCJoN6zM9xEh+4LE9oh0kmlj3Z4o
	DVd/UabpXV2fbmYZgtYfDw6+tM8Cqfh9h1S9qeVJuD/geGw4tqPSh6/ankbBQC5ctmlG/kuiTBu
	kTuLyYcVFeeczzu1QlsAYojGyYQVqSS5lsA/PvI6UH13Aoa7lzKDMMaysinbZ5yrl4wl81C3s23
	CCb5ch+dabrRwqSypb7mFjruBzNW9oTomwRy3QtallZ9tcTvTgQEuneuOt5S7abTw8H5USr9mkG
	rHenLKuTCvdJPbtrMjtff+bft38B9cdqbtdL8VahOhTpD8rzV5i13hqMgMdc+PC7KVKaQFma2Dv
	tI58sxxn/i6Y8RnyKXuYgCkJ84b44WMy7TW0M=
X-Received: by 2002:a05:6820:440a:b0:67b:b041:ff28 with SMTP id 006d021491bc7-67bd0793cb1mr4864384eaf.31.1773421320628;
        Fri, 13 Mar 2026 10:02:00 -0700 (PDT)
X-Received: by 2002:a05:6820:440a:b0:67b:b041:ff28 with SMTP id 006d021491bc7-67bd0793cb1mr4864351eaf.31.1773421320128;
        Fri, 13 Mar 2026 10:02:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636a95asm1651647e87.80.2026.03.13.10.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:01:58 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:01:57 +0200
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
Message-ID: <sowx6cm2ayx4ezbkcpv5vez7tdkeesdd2kugjmvouk2ud2soqf@habtwjzkoyza>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-linux-for-next-v3-1-3f77ad84d7d1@oss.qualcomm.com>
 <z3y6wb6irac2ef3f55roy66wzyufel4vannfbynoivzgl2cuob@um5eomgvt5uc>
 <aZo/NRg3IxdyKZ6I@hu-vishsain-blr.qualcomm.com>
 <wvjfla4rk2qxzayloov6ofna73kl22nls2a6h5uzvap4kasfh2@nqvpdsassfcx>
 <aa6OGbZjT2SdTxJL@hu-vishsain-blr.qualcomm.com>
 <i6cdhcdj7f3lbfvu2lvakbir7ovds3yfqyod5wceiedjqrlxxo@5gntl3peqz5b>
 <abPXerHW3YoEcQ0r@hu-vishsain-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abPXerHW3YoEcQ0r@hu-vishsain-blr.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzNiBTYWx0ZWRfXy5+jp5pHep1T
 K8yFY23CmuUsZLDjOvBDf9ycW+DaCKp9TL13ySASXczfOSBCmtTyPUCPmTrB20+aoLgEhcdlOIw
 kUS36nlmfd90BfhuAzH0eYBYGhfdsSFmrFPgAN85i84jxBh0xT620ANIYAgRmgpL2AzWk/M2707
 NWLDxPIuqi2HM3UlzKvfPch18iHIBl+P+8rAbc0SNniC3D6/UCCJgWN2qfveKZyrSuObWOkxlK6
 ojqaAYX4nSY+1mu6c1GEwkkA/6x2awm08VFvVPMqi+94PdLY/rCnQ+Zy5qHZy8/qoXeb+TTbgOm
 gY19RNDMH06Oqn2CVLXkXsx8sXtuGuXbXHl6MJ0OmRxzBB+TTW0ZUFkmJiKttL+OLYKKhhEMyqs
 tOJKYj4+KJi7tpihz9x+5uHVhvscJqZ7Gn+FJw3Wa0eNkLyRz1eCuoCV/W+WNnyqCoTJaWXh1TO
 epdCZ1LdhW0KjJe2Apw==
X-Proofpoint-GUID: LLDvsbLMlw_my2lux3y8H0Mea5jLhYlY
X-Proofpoint-ORIG-GUID: LLDvsbLMlw_my2lux3y8H0Mea5jLhYlY
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b44309 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=nkGAt5j7mUwkztzBHQoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130136
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97597-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C73B287E71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 02:53:06PM +0530, Vishnu Saini wrote:
> On Mon, Mar 09, 2026 at 09:19:45PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 09, 2026 at 02:38:41PM +0530, Vishnu Saini wrote:
> > > On Sun, Feb 22, 2026 at 09:16:54PM +0200, Dmitry Baryshkov wrote:
> > > > On Sun, Feb 22, 2026 at 04:56:45AM +0530, Vishnu Saini wrote:
> > > > > On Sun, Dec 28, 2025 at 05:49:30PM +0200, Dmitry Baryshkov wrote:
> > > > > > On Sun, Dec 28, 2025 at 07:10:38PM +0530, Vishnu Saini wrote:
> > > > > > > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > > > > > > converter. Edp PHY from monaco soc is connected to lt8713sx
> > > > > > > as input and output of lt8713sx is connected to 3 mini DP ports.
> > > > > > > 
> > > > > > > Two ports are available in mainboard and one port
> > > > > > > is available on Mezz board.
> > > > > > > 
> > > > > > > lt8713sx is connected to soc over i2c0 and with reset gpio
> > > > > > > connected to pin6 of ioexpander5.
> > > > > > > 
> > > > > > > Enable the edp nodes from monaco and enable lontium lt8713sx
> > > > > > > bridge node.
> > > > > > > 
> > > > > > > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > > > > > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > > > > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
> > > > > > >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
> > > > > > >  2 files changed, 95 insertions(+)
> > > > > > > 
> > > > > > > +
> > > > > > > +	status = "okay";
> > > > > > > +};
> > > > > > > +
> > > > > > > +&mdss_dp0_out {
> > > > > > > +	data-lanes = <0 1 2 3>;
> > > > > > > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > > > > > > +	remote-endpoint = <&lt8713sx_dp_in>;
> > > > > > 
> > > > > > Does the bridge use DP signalling or does it use USB-C signalling here?
> > > > > > And even if it is DP signalling, it should be correctly described as
> > > > > > it uses signals coming from the QMP PHY. See how it's done for laptops
> > > > > > with DP-HDMI convertors.
> > > > > Yes, the LT8713SX is using native DP signalling, not USB‑C DP Alt‑Mode.
> > > > > The QMP DP PHY is already implicitly part of the mdss_dp0 pipeline,
> > > > > similar to other Qualcomm platforms where external DP bridges are connected. Because of that, I intentionally modeled the connection as:
> > > > > MDSS DP controller -> LT8713SX bridge
> > > > > This keeps the DT consistent with existing Qualcomm DP bridge descriptions, where the PHY is not represented as a separate graph endpoint unless there is external lane muxing or alternative signalling paths.
> > > > > If you feel strongly that the DT should explicitly model:
> > > > > MDSS DP controller -> QMP DP PHY → LT8713SX bridge
> > > > > I can update the graph accordingly. Otherwise, please let me know if documenting this more clearly in the binding or commit message would be sufficient.
> > > > 
> > > > Please check how (and why) other boards handle the similar usecase of
> > > > DP-to-HDMI bridges. To put it short, in your DT there is no notion that
> > > > it is a native DP rather than USB-C signalling.
> > > 
> > > Sorry i couldn't find any good reference for DP-HDMI bridges to check signaling. I checked these
> > > DP-HDMI bridges PS175, PS176, PS186, PS195, PS196, RTD2171, RTD2142, TI DP159, VM5200 but none of them 
> > > wire DT graph endpoints, Please let me know if there are any specific DP-HDMI bridge you are referring to.
> > > 
> > > I looked for other references where USB‑C signaling is used, in those case the datapath always involves a
> > > USB‑C controller/Type‑C mux/switch explicitly represented in the DT.
> > > For native DP signaling, the common pattern is that the DP controller output is wired directly to a
> > > DP connector/bridge, without any UCB‑C components in the path.
> > 
> > Yes. Please see qcom/x1p42100-lenovo-thinkbook-16.dts for the example.
> 
> Thank you for the reference. In qcom/x1p42100-lenovo-thinkbook-16.dts
> I reviewed the HPG for x1p42100 and monaco, x1p42100 is having DP0/DP1/DP2 as USB/DP QMP PHY and DP3 is DP/eDP Phy, so DT graph wiring is defined as below:
> mdss_dp0_out -> usb_1_ss0_qmpphy_dp_in -> usb_1_ss0_qmpphy_out
> mdss_dp1_out -> usb_1_ss1_qmpphy_dp_in -> usb_1_ss1_qmpphy_out
> 
> mdss_dp3_out -> edp_panel_in
> 
> In Monaco DP0 is a eDP/DP phy, hence DT graph wiring is defined as below:
> mdss_dp0_out -> lt8713sx_dp_in
> 
> I think Native DP signalig in this patch is align with the reference DT and HPG, please let me know if you are expecting any changes in the current DT graph wiring to make this clear.

I see, I totally forgot that it doesn't use the QMP USB+DP PHY.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

