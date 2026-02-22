Return-Path: <linux-arm-msm+bounces-93564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHreA1p3m2mzzwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 22:38:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C95170792
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 22:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89A74300E39A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 21:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB8535BDD9;
	Sun, 22 Feb 2026 21:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBNGEyfc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eG9hYHi/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD2B35B645
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771796307; cv=none; b=b00WmUhPyl7LKGfVcEs1gEduwBl8XWYFmeg8zURD2rZyBiUss47cqKlhfubU9GqkoJVGAPSQ3eKDIGgamGJerikLrtLb4TBI2gzJyRIBR9xiTPNTwppniuDTHSpRU2Ye3F/OUnvB9V0XGaqoFjISEtNyFfB6UTY7FjeNRR+j1jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771796307; c=relaxed/simple;
	bh=10kwcO9KwUe9Mgn7Fz9Z0wP33cB2cO2agqcWonfFNiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoQI2sONfHDY5BVkfrpw1FCVIGwGbKm6Y7+vov9Cdh8w67wR8Jfz05nWKlDSLt8D7DbEPndDipfPXx5/Ua9jCFvHku2iWz9cTdSuHNgoacjuPc2/RpZR11M1+P8Wa2jQukggIYEJ5yJ2jd6v4iXJNEA+qn7GGryREsDPH3LuMSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBNGEyfc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eG9hYHi/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKkuZA1485208
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnk+h7lyNJTdWWRz8JbpDi36ywbElvqI0B9vKg0rrPQ=; b=hBNGEyfcwjDADzAM
	tQYdbfsSWQtfUWUquvKB0Y1o7aDnOeTcsAieGA+vsZhBgqn7L/NkaFHfme4WNoQ+
	WJMByKoJ7A2ExEgPp9gnVzQXLsupnGbautGduNDJZt55Ezc2Zlrn5C1xeArq+iSH
	98qfVqO4YebHMtuLcD7z0CsjuF5BQNCcoiWbVEQO/y6zLLGHB6mZsozVOMjnWl1e
	KALkZgDnE+EvaHZ9AcQK/ttPmJNOhZOKlSaQTi9en+GfDRxZpwjAVir3gVeiNONf
	yreUnr4l0n6BuUN2OSD+aKDvT13Xo36Qir2AzziS57X4qJ40l079YooKi4NW0E5x
	nu/p3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9trtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 21:38:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cff1da5so3122180385a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 13:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771796304; x=1772401104; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tnk+h7lyNJTdWWRz8JbpDi36ywbElvqI0B9vKg0rrPQ=;
        b=eG9hYHi/ckuCXZFiG+EejRLtQLA3liqZX0zLzx3LlWSIE4XS9CGoPxIDPVn9kq5jGY
         ud7xZTepmp7anxU6fJA6e5gChhZzEQdHAyrUGtAed50+H/5sf3a5EARZO69uPmrEERYW
         BXO+c+Bbr/qxCyEwIFTsbFfyyuyyJNfjo9rWvIIcOVfPNJfxtJ3ji6ufzeLzDxujC65B
         0iI4XhjO+1yUmqONBNZKkCZXQQWUeS+TjPv7n+qvPf5dZdrAk4D64NVRoV7Rgn0gibR8
         pzghP0K04CRK0qfvczTCgu3oaNNbxDONCavt3RWyUu4SIYzpeHPVHHWdIt5i/dYrix7H
         P9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771796304; x=1772401104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnk+h7lyNJTdWWRz8JbpDi36ywbElvqI0B9vKg0rrPQ=;
        b=vksCoUTcV/toAchSZGn1VtL8FxWB5ahzqB97n+EXEtcKcVkcYYceNDfStUyjawOJmV
         Z+PlUve7LZBH7ydcs+3f9KLTWFh9RW4KQMHOoZFWXvo8xWSA9oRzmmQatOm7kJTyceTR
         XLv0KJx6tr9a8sbOSFimM0iJLssmPXXixejFm39+lAInB/IDQT3rAwRKcsP14rakwaID
         wUrGGv9PU8Qa6ekiPU8EuUtf1qGyCwf2ZCjTFn/4zk6huxR2gpz0mfTAaTkX2Tm3vrA8
         qhs5wndwRjG+jxokvLvyk/juLpp+L+/5OwUL+pXP+81NimyGVl1jcDwIj3hZuAAqxdyl
         fxMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW95Xg0nxve6BA3/+dQZhwGane4JJt8vz2tEvBn7GppBI0b2s18BIyKwDGIvt0WKyIJqirjo3plhRtKTS2Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxB+HkRySNmBAhMHBBnfBqtsjMnvgbTpNZdlvgumRA/ReqxjGrp
	TzhWQ8rH2cS2stLzsPQB95z0vW94B6ueS8sPVfM54g7mp0+UYszlrHsmRJQR97AQH6dtAiTopv9
	9PFc0jW1cpY/3s9pKxd+4tZdy6/lPjs0JvpqSdsShCA4qNsKIi1LMUJerAI9ffYGn/G/n
X-Gm-Gg: AZuq6aIxvgAWJv56aGswttDiqLKMSPZmNr3WctPbkD8shhU9YnQcO5nvjZUDf76mxVD
	dYTiwWXzaYUthH/aFsT6lbs23RHP9dSkyiL3vY7dVkkfZbM8jjkWDXSIhb+qAOyt8DmaEQzcae9
	2Jii8CO2jC5G6JnKOrhepoSFkTaxC3Xu8uIto/BRUDJLgvUFAeoJLPmf1TCFIfoMUJ2XzlAV/ye
	NAYXFETdlUtJ7NBor3OH2OXz0GNqQtSdcC7xnkMcVTguARsDUY1a8Ywb/fRh5jGircVCFxgn9a6
	O1LMd9Y/o1noVfjhKtcqCI1efEYSVHgSsAnv3DIRvyEXDvzsUXuuDtY2RX1R1ZcM7ldfnrlXEkI
	3G+XJmnkuz6b630G8oVhdjlHDmoaZFyTsFXbkCjdUK8RZQFbqULohpEnKQneSpTC4PXmxo80ZV8
	gcftqnO9reIukqnf9jKwf1swEcC+4Qj+lwm9U=
X-Received: by 2002:a05:620a:468e:b0:8cb:40ca:2f8c with SMTP id af79cd13be357-8cb8ca02f75mr855935785a.31.1771796304582;
        Sun, 22 Feb 2026 13:38:24 -0800 (PST)
X-Received: by 2002:a05:620a:468e:b0:8cb:40ca:2f8c with SMTP id af79cd13be357-8cb8ca02f75mr855932985a.31.1771796304022;
        Sun, 22 Feb 2026 13:38:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7913fa4sm11223061fa.20.2026.02.22.13.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 13:38:23 -0800 (PST)
Date: Sun, 22 Feb 2026 23:38:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v8 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <wcjtoirydrlhbfjyz355uyn7bcsgmu7azzdu24fk74gijc2xm4@3flh67idkgrl>
References: <20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com>
 <20260219-upstream_v3_glymur_introduction-v8-3-8ce4e489ebb6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219-upstream_v3_glymur_introduction-v8-3-8ce4e489ebb6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDIwNyBTYWx0ZWRfX0bqu57s4OCH0
 fEgyLtU7TQHmmaz6IxHcch/O9f7v+6KEcVwsVYoCzPzLkYygyIYXNZDBNiZsKr0Sk0F9TuizGXf
 pPMFyhFCrqHutxWGR469PvIJSk1650BsDXa9RLo3uWnYsUS9pw2WYSoN071SG/iip9Rbnwu2UPn
 50/tCDddjhAiRNoWqlwOjGwuLNC8ZNlUzMlDAOjD6S9hZhcaA/XZDEh3fSkPzN3BrNfHjXpTZqj
 5hK4UBqoy9miNLT747T+jHV4Qp2qV9REo+a08Fn1VpCHSc0gVcaLfajt9m28cJFftDCXUnjfmNO
 HzG3ApJ8W4VlyB2UCBIiDjKkVu643i3WvDpDY9gY8hv2PD1yiZOQHsjiVUPy4RkTDFhYw8H4QUa
 tY2WhRY6Mbfo0+XBKX1uBpuCcVaFKy5piKeupZTd5LWQjJgU+GgwAOLYN/aud01nn58+rixjP1s
 gi01OvkHdBdNnPX/1KA==
X-Proofpoint-GUID: aM9UpNgWrhTePJjFeY9na8hXTRyXraqp
X-Proofpoint-ORIG-GUID: aM9UpNgWrhTePJjFeY9na8hXTRyXraqp
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699b7751 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=-jCX82INsGBcRmD4oUQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_05,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220207
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-93564-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2C95170792
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 06:53:28PM +0530, Pankaj Patil wrote:
> Introduce the base device tree support for Glymur – Qualcomm's
> next-generation compute SoC. The new glymur.dtsi describes the core SoC
> components, including:
> 
> - CPUs and CPU topology
> - Interrupt controller and TLMM
> - GCC,DISPCC and RPMHCC clock controllers
> - Reserved memory and interconnects
> - APPS and PCIe SMMU and firmware SCM
> - Watchdog, RPMHPD, APPS RSC and SRAM
> - PSCI and PMU nodes
> - QUPv3 serial engines
> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
> - PDP0 mailbox, IPCC and AOSS
> - Display clock controller
> - SPMI PMIC arbiter with SPMI0/1/2 buses
> - SMP2P nodes
> - TSENS and thermal zones (8 instances, 92 sensors)
> 
> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
> PMH0110, PMIC's along with temp-alarm and GPIO nodes needed on Glymur
> 
> Enabled PCIe controllers and associated PHY to support boot to
> shell with nvme storage,
> List of PCIe instances enabled:
> 
> - PCIe3b
> - PCIe4
> - PCIe5
> - PCIe6
> 
> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi         | 5913 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |  187 +
>  arch/arm64/boot/dts/qcom/pmh0101.dtsi        |   68 +
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |  144 +
>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi |  144 +
>  arch/arm64/boot/dts/qcom/pmk8850.dtsi        |   70 +
>  arch/arm64/boot/dts/qcom/smb2370.dtsi        |   45 +
>  7 files changed, 6571 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

