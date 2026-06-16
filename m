Return-Path: <linux-arm-msm+bounces-113302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hMZKDO6YMGp9UwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:29:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD2668AEF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:29:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LIedlHWV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bKnNloaj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113302-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113302-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41097306C86F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E59250C06;
	Tue, 16 Jun 2026 00:28:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04623ED6F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:28:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569697; cv=none; b=DGMr/+Wo85HINvcuaLYu2RjZXkq1T82YswcoGNISFVDj89Xn8TXayNHk6eGmaLBCQEUwcQNuUT0JcRDrRK3Cyoy9VrIED/KGRQBRkNDB9X+DOISdUq7T0nZZo9WAbjEmzJHoDijV/nLE3xhB7wdeb2CS18k22ezi5TMWRYjGk4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569697; c=relaxed/simple;
	bh=nDuZJ6RpNfUQegjL0t24433w4IbPUwhql8joglujyTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b36MYM1YvhIzL5b3AQ/BYNVmDGbAqn3mjlk57AOJVX2vl6mPPXDdmSkM6rXFgho3bi/LCqG+uqr+SBx5AjbzOgoRfBSlq5naSTj/ohtNA50620piRWEKU4m9lLtPGIPaI23gQD1IvSdPDgl4gtgAt0qL/XnHU9aIn3nCmxiYsLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIedlHWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKnNloaj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OjeS2094384
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bFSo8xRLtwok2hPU8ysHad3w
	ymjeEQwi7dld2OfYzu8=; b=LIedlHWVyJ8L4PtHaMwb/joVnp6AEjMPm2D+6qP9
	/aGXMwH/ffZgrF+tB3/k9rGpYf2yiBWv5DzgY7zBe9DT23VRIb1crZJ4fiM/Vavu
	shQZm1IHeBGsl4h6tNsmH9Kbvw4rX2mr1HKEdrCttQDDe1Tj3n3N2Vb7Z1aMMFKY
	xitiZ3y59elNiertDOFQFo5v8AvSZ3u81LWV+HstEjfpwCcmetyJzuv3SgPCknKh
	f0OHJUSKhir+1gdyfLJkS1jKCbhQK1j257xf0Fx6h3dRzG+Y2X1Q8nzxmIIuE/O6
	A/8IeBC6Ee48qPB6WvpeR2czVtUY9+0QNrakIE4IWr9Nfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter23udr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:28:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d1d4fc5aso677151685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569695; x=1782174495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFSo8xRLtwok2hPU8ysHad3wymjeEQwi7dld2OfYzu8=;
        b=bKnNloaj7tvR/Aa0zTQM/FjiwRjcfnxkZ7Xk6pRBNuHQeNMA5D8f1yIEL0GPWDQcS8
         947NRq8WsrkrcPgYuuD+O3EZzzDp7PfmjPsOOvv+/Iv+E4xZbwK1SWf+CdrITQEbAUP5
         QDYS4K6wUAXUsjUR0cgufwxk252pll7RfhizJDvF5roFYtckKzzTuaKuTFZ8j5FVd2jJ
         iV6SLQE7xnp0xMrPAdIjbPj0zWJ1egqY9jISJ4G8NdiTgpMgATNHqMVWQNQoBFC2XAPJ
         bIzafJMmw0xT5r/PTbvmcUxJZWWAxSEI2VASiHynsn58MU+RIpNAKdLx3bdlSlI+wkZw
         nZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569695; x=1782174495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFSo8xRLtwok2hPU8ysHad3wymjeEQwi7dld2OfYzu8=;
        b=JE0Xh/LJxK0D3xbYFqUNBtBKqeOJlZ+yYhKkaZuv7lt5MdqSNf368dom4JmAfbq6Ol
         F8EG2wmeg7YLqEMufr1YG5JT8xKHFfVH/iiwLxZolYWMK5qi03ObqfQA1J4i3mJKTIpJ
         naV+W/gO/WO40S5v+0tnIg/lKqk3trPirwz2K8lHKighwKebQ3FtUNSermaP2nSkT9/J
         uxq2VcyW2VaXBJr1A4XOlE10NY73em7ZQEpCCa+muSkunY6mZ8CVFOe6CCucI8Agj3/U
         uz5CJ+G2cVl1I9mC4td/pOFqm4JfCq50/Mdsd6+AkoJkb645cZRTwIjn2RiISgLd+HWX
         r1bA==
X-Forwarded-Encrypted: i=1; AFNElJ+vAb+ujVBOOcHpq8g6pWEtZpwXwqd8PfwaOzHwVyvQQ5jDBLRm/3KCO4CGfBR7rIkgL78hiuKZRFaQZn6N@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAUAopJj20Ab2+J60BcCvuwSSbQpmzPhY7nsGqsUDLaChsxYo
	o3p5Tg6yU+LUlSIAVYITchwlSbXKZE3790QYR7b1EEj658RAmMcMYOt+G+kws5ncChG1DzNlN4V
	YH/jXZVCfTyg7ocaOxvKaDCwOTpLX8mkBREkwDShjyaSBMjBAnSp8L/DZAQB1HjlyxgnSijjnGG
	k4
X-Gm-Gg: Acq92OFlanYs447/fQLMnIvey40RAHd/hLTHk1Aw1/EIXW+jl4OKfaGh5wxqA4MEeg+
	rKD7/9zkPR1a2FLGrzHt0aLs6tPLEXpJBxgt4/EDPavAXvMFfcnH0l0BQx2JZinjn78H0lBSSPD
	zHyzYwo+s44I+SrgmHJgbvdAaDOwL3s+L5jfXci/MWhzBdDRU2wxfccDc+ZZPc5R96zP3HZ1Nen
	1yzk6g0vi4Igs1VGySDsmraxs1SBz5bwYmMNzsvoXArpQdOpYPoTPVZRilfmiDHnEKPgpzCS4lg
	6u26cPUuVy9QzCCDtV7FjabRgRbomEGROZD8/+8DINOOxE1uE+Jdu/wN8DmJKaL+n5wSTBD3zLa
	LcmmE1YTDpdiG+TiO7N18g+OYUYvbn4w5N89lMSqXP1Ar1je4/IP/TJhHO3uuFpE1pwGug1xyIn
	B5PSVWWbilHDRKx6iu7YNxg+jgPFctTC5zq8g=
X-Received: by 2002:a05:620a:240f:20b0:915:aad5:e961 with SMTP id af79cd13be357-9161bc2369fmr1784599085a.19.1781569694819;
        Mon, 15 Jun 2026 17:28:14 -0700 (PDT)
X-Received: by 2002:a05:620a:240f:20b0:915:aad5:e961 with SMTP id af79cd13be357-9161bc2369fmr1784596185a.19.1781569694391;
        Mon, 15 Jun 2026 17:28:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1adedesm3116010e87.57.2026.06.15.17.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:28:12 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:28:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manivannan.sadhasivam@oss.qualcomm.com, bartosz.golaszewski@linaro.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2
 Key E connector
Message-ID: <tspehw7yb6hrgek7rz6qghcoqr4v6cdpulbzpggii6qlmaatxk@gcb2tbb3qji2>
References: <20260608091702.3797437-2-wei.deng@oss.qualcomm.com>
 <20260615103228.3104083-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615103228.3104083-1-wei.deng@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX4n8jg1f+uIit
 mi4G2YA9OMSP8ADIkVeA73Q0/vhrKkzukjfNjCeFoFx9uiw1O4iNsXX8d8ARKiP35N3ydp1TTnO
 dy0CYgnKfkQC+HE32kAEZAJAolo+mb4=
X-Proofpoint-GUID: UBbjn_YGuNWbKdU4QTUjR8Fg1Cjjavz0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX24bFfhq62v1n
 nUQ/XUw5DXAQU88eNN7+/TtJCZ1Ntih9GrX1E3vR13YI5oUnfLFVYBjrhHwqlHwp6kkl/atXlvD
 xQaolWYsyatwAhlZScgJrvgNEwIW924WXJ64+CQdHnqZLFVcO8gz7rlqP+zbkwxHKitChUxdyM3
 9KvaOWlEQ2yMz87uFA3g/U+it0K1kGg1LHMd0XCliKaxLigqxHXiwcO7OLTq5JJ4bo933f/iW9t
 oMcmUpy9MOfAWaA3vi3l7u1yjHyWYjBa/tzsnLZSIU+E+2vVIoVv1HoBVnYj/BmzIheh+TUh2Tm
 h94RhrZ6/P/pyPhFqgmAs3PEp1eRYX/8BCWYHC+9MRvviKW/iacI3aKojWyL9HgEMXxlWaggidX
 kx+SonD5iDLukzolCpiEBDo9OsfMYXXixSJ8+4EDkCtSLI7QP5NZcvNyxl7PLBvWhzV4l4/c42S
 jNknZREYneblpTVrfAA==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a30989f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8Rmc_stLs1TP-k28c-MA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UBbjn_YGuNWbKdU4QTUjR8Fg1Cjjavz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113302-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:bartosz.golaszewski@linaro.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,gcb2tbb3qji2:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FD2668AEF8

On Mon, Jun 15, 2026 at 04:02:28PM +0530, Wei Deng wrote:
> The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART17 nodes through graph port/endpoint.
> 
> Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
> lemans.dtsi to allow the PCI subsystem to associate the DT node with
> the PCI-to-PCI bridge device.
> 
> The M.2 Key E connector is powered by a 3.3V fixed regulator
> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> (vreg_dcin_12v). Both regulators are always-on and are required by the
> pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart17 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART17 interface.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - Collected Reviewed-by tag and reorganized the patch

Please don't send the patches as replies to the previous iterations.
Each new revision should be in a separate thread.

> 
> Link: https://lore.kernel.org/linux-arm-msm/20260608091702.3797437-2-wei.deng@oss.qualcomm.com/ [v1]
> 
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 75 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi    |  1 +
>  2 files changed, 76 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

