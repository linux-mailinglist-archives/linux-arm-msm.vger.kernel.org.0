Return-Path: <linux-arm-msm+bounces-97605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG0DNT5MtGk4kAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:41:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55F2883B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0197F31024A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C083C9ED4;
	Fri, 13 Mar 2026 17:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXDquxO3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmjmTjqj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15BF3CB2F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423572; cv=none; b=s09X5rz9bnt58JNCLYVOIKxdFfpIUALHp+1WQEKApyNS72PloF6k/2YYuCo7WupuKJACyEq0ducnr281RREehKEAKn1POwGLxdII+3v4pq6yewBDiCiq8sE03GasOQF8aJZepmplBdDaePFovU2pZdQLHn5BXOcu0Llq0ZL0ZmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423572; c=relaxed/simple;
	bh=OUAwdj6SEMzvo3Fs33hkT17f4NR03Bhr4kWWmJmT84w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qsrg87Ap0STUjrdcBoOFIelcZGcJGu2MLd3n0N75LvuGPFnMJXdYQVnh6Z2sND26hOp7V8o/2zSdGZpAgoR1b1LkS+BZgbObL3mI9RWGavWQipncastHBLowX8Z0cGJFkbLy+7SfTyCXk1WXCUiAXkp/JAshOAR6Tl7nF/tnHVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXDquxO3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmjmTjqj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DEZ0oL2262748
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Kfl6jeALNu2XrxSDVkcg/Mi
	KHvuLFnbxZ1dgGfW2rw=; b=EXDquxO3cOofbyv3BR6ijWu9D/29hCuVxkoNhK+u
	9KS9Vn5eQXYo+FQUEFeyiToZS2dNwuu6knCOw2oBo3Tb9GtsF+K04qOeFLbNuMti
	Ec3bK82ETNrOyohjyw94O9UJxWjhWQ0qZrE6PRGI6qNBDMByoLR2NmcTJcjDREOI
	f68UB70Rfennd5FCUJEmNljDogJ1tm1c5l3XLt3DRhFhzgsRHDxtsQusKlpUeS6X
	329N5DF+O2etX0zasF2SHPzI1UMjnn4bPpven0H1b65aAeQT22qry6htL1f+TXBk
	UsvR3ACbKP8T4Ip4TcvUe8aRzU7dx13htLgh4QWGfDnLAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4t1db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 17:39:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd722c1a69so1418376685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773423570; x=1774028370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Kfl6jeALNu2XrxSDVkcg/MiKHvuLFnbxZ1dgGfW2rw=;
        b=gmjmTjqjTPKmuf95l11mBuP+PSNm3pIrKSdu+v0l9FSL6Y2GC+N2yq59Pndm3P2762
         UibUHOrzITVHSnjKfwm0Ppty/PgEI9IPZh1jaaQ1T2PsXg5PhsaDGThCTLnR2uEG5aYM
         q2DbNn3TGabOVOq2TbaGzrd4lqXo8jSyObtCIgtIBgFeiUiQYUn5Csjkhq6vwRt15w37
         T7UPe/Tcny47Kip6Ne7nDTTU8m4nabN2ZmWqynaOexX5bGG8mgRgNC+jCfYFux0oJv+z
         Z4sA3J/h7OMnlq44K8GYv/12eq8CPkvDx7AoEbCExsp0Ez+ASO1V/8ZRqwnHesDDS7Tk
         3+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773423570; x=1774028370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Kfl6jeALNu2XrxSDVkcg/MiKHvuLFnbxZ1dgGfW2rw=;
        b=Cg+yTgnG3pgBn1M2ajURI2TlI98SRoeboDGru0vc1Z1rpwIjVVQYeJQQP9nvw8V7Ag
         CT0suJfsygE2hElARHsN5CWecS/T8i0lRZi6Mui4sWfPDGkJlH5jgEa+oBgnYit8wu+c
         +eu85cUXJgMBztXcho689SycdbdUIf+UB+hbp5orqFxazopMpFq8BP48lj9Jd0uwbDsp
         df8AHk7nwXlnAgiFgJQPj2yvN5kjk6nZpCI5jckiUx7Te7KVJ/ae33gYiEFbWG8H2DAF
         0Wg0hKzv0hy4J7mZyijznOl2ZNzULszVGWkwTX4tgRpbffcW6I4z2LDNYuFRXgfIJF40
         ws3A==
X-Forwarded-Encrypted: i=1; AJvYcCWmpkeK4bOqpUplQlUJInPsz1ryzu0vwxA1A06TYPXf9T8SsSU9IWgD7xdF1j1gm6JW3ox4YNzrV38Ena/1@vger.kernel.org
X-Gm-Message-State: AOJu0YybwKrGUl/B9JOBwHvM2tx+F0yDSuuGyk2I4gmUPrVJhqj3lXbf
	nRkw8C5osG30SZSCQnAgcCUwuRgdlzgcKz5asFUq0/WfZ0IOYngrPz6wnvZBI8sa/uMPiym0oWS
	BgGKVkhQHdVOF/5QP4I8dfXvKR1wWcfj6uuDQRYcAsH1RCWLJS3+XuDnfTCR5OteBNvFl
X-Gm-Gg: ATEYQzwroxAUXGQ/1EZ3N5PGQ99cQBqy+4Gh257SuJ6BSKsn72GkbKAo7/ABV/ygKdG
	qL65yaHRekY4anLNb5e54FWgHtQ0+14/fRgvK1jwbSNDzC/rCyQeyOD/RpDXfaiKUtOR2GMy+Bq
	BmCHzCYt3JAgDRwlb42Fr99u2+QrkVVzjDgwgyWqcdY84j3choqgCoN9mLNPvz88i2uZsNC5MMq
	SkgBnJR5hwktDaINPBFWzbOeunMrS5Gc2xipZa7PRbB4ZSZMWyLX0vPCSakHTYHg4ibCAf1qcyY
	vonMMKodDKYc1lmtgQeAMnv3PSB+ttEeKwwX6UTLJa41ASUtd1LAidRaZyMU9INEBE03qkBAV9D
	+nbw9yMQ2vFDDl8pyY468bAXJhthJ4lkzeievyTomFPNKryFY3SCxpRX/SO5oTBrDtE5kKl0weD
	+ZPuAS9RtIVNR/eaDy2jFdL0qHt91btf8fhWI=
X-Received: by 2002:a05:620a:4092:b0:8cd:8938:f015 with SMTP id af79cd13be357-8cdb5b20a80mr583919285a.51.1773423569988;
        Fri, 13 Mar 2026 10:39:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4092:b0:8cd:8938:f015 with SMTP id af79cd13be357-8cdb5b20a80mr583915085a.51.1773423569552;
        Fri, 13 Mar 2026 10:39:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162baesm1728911e87.42.2026.03.13.10.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:39:28 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:39:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix OPP tables for all
 DisplayPort controllers
Message-ID: <drcot4oxpea5lnpa5htrrl2n6tcc4ocxmb5vsho3ocouvajwlo@6ueabivtjy4h>
References: <20260309-hamoa-fix-dp3-opp-table-v1-1-1a8141d71f9f@oss.qualcomm.com>
 <2f4e4cc7-2600-482e-88d9-d4b20d328a72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f4e4cc7-2600-482e-88d9-d4b20d328a72@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AjrhoH7EDnvzJkgn-ThRXuMLIZ_GvLs_
X-Proofpoint-GUID: AjrhoH7EDnvzJkgn-ThRXuMLIZ_GvLs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE0MSBTYWx0ZWRfX62PXAfHKwYn4
 zgbrSfKNSvoru+/0cEzbDmVntcLDQjAVC9ilemrxi/hvKWvtTlDOVnDMc8AXHwrvzX+73lk7Fz6
 b3rnmj/9C+OOfQdr5mSkC/yXXr8n3N6O/NfwpJzRfWB6ts4jgdtN4dWyP6IoMzDEa1E1As0LMdg
 gP2KvQpcSPSITfrDiRM6hQS4FoP2kzGHbh4yrXfVc1JEwfV6vdMlAew3JuVKX9UNBiOq1Goys3S
 8/s4dVjSFU0NDNvn/2hmVsIDdaTK2UFWawOMXoZ8e3xo1OPw0yY5vNqnAPN2FONNLSpu47stETw
 2mJDtHIXp+lv5jGD1NkKSBH1jy5SzxwF3N0vWn/PQ+ZBeNRIXd5pw/Ll7I+nHWKjWWc8h5rjauw
 FVi17nTeTLdd/VmwB0YRSW0XxltnuRz+QbxEVN5RopK5wtmEm1B/3XyhlXOMKIf+KTsmUSJMxe5
 J/+gVozfprutrpVkvpw==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b44bd2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=x7c7QD-1zEKvlesSpVIA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130141
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97605-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D55F2883B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 11:36:26AM +0100, Konrad Dybcio wrote:
> On 3/9/26 3:44 PM, Abel Vesa wrote:
> > According to internal documentation, the corners specific for each rate
> > from the DP link clock are:
> >  - LOWSVS_D1 -> 19.2 MHz
> >  - LOWSVS    -> 270 MHz
> >  - SVS       -> 540 MHz (594 MHz in case of DP3)
> 
> This discrepancy sounds a little odd.. can we get some confirmation
> that it's intended and not an internal copypasta? (+Jagadeesh, Taniya)
> FWIW DP3 is not USB4- or MST-capable so it may as well be

DP3 link_clock is sourced from the eDP PHY. I assume there might some 

> 
> >  - SVS_L1    -> 594 MHz
> >  - NOM       -> 810 MHz
> >  - NOM_L1    -> 810 MHz
> >  - TURBO     -> 810 MHz
> > 
> > So fix all tables for each of the four controllers according to the
> > documentation.
> 
> It sounds like a good move to instead keep only a single table for
> DP012 and a separate one for DP3 if it's really different
> 
> > The 19.2 @ LOWSVS_D1 isn't needed as the controller will select 162 MHz
> > for RBR, which falls under the 270 MHz and it will vote for that LOWSVS
> > in that case.
> 
> Even though the Linux OPP framework agrees with that sentiment today (it
> will set the correct rate via clk APIs and the correct rpmh vote for a rate
> that's >= 162), I have mixed feelings about relying on that

Why? 19.2 isn't an actual working frequency, as far as I can understand
anything. Or is it a working OPP for running "shared" clocks?

-- 
With best wishes
Dmitry

