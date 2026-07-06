Return-Path: <linux-arm-msm+bounces-117023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a5NwLjoMTGqKfQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:12:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B840715550
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:12:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SBgZQxgd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FEyBIoKq;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117023-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117023-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C44F301CA65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 19:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0DC1D5160;
	Mon,  6 Jul 2026 19:43:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463D8349CD3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 19:42:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366980; cv=none; b=Yo1PA7KC8jteBi3HspcGIpBjr3P4+Z4k/9iV1Dr1iJ2xDk8io/8H12AaZ9Jk/gKpfPiIf/m1LJF1099zdRiLkQSXfvSB63dwcmBAYzjbQ35Vq0ax4g7pCXwxBVVwakziMGqXrngF0GupeMCCHjUX05WrxtKI3AR5jpux7T3biXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366980; c=relaxed/simple;
	bh=ScLIuDvnUG9BCA1E6lrVpX2QUPXRIKVPiwRJpUJaWEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8Rj4xz72kznzLw69XC4EVSyGenVH+VrfcQNLGUCiejtVLlLtXp+UCVhzGOB14XERDVCZduVKRyXZS3SvEdSRGYy1IRG/AMS9yNr8mP/SiOKU/1FElR+PqxPsGYbsJfvqGAJD3LfaaC3iziWk2GHZkVJiKfteHIzpY5jRNuNuTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBgZQxgd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEyBIoKq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7pB900713
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 19:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6d3J4Mk83rpjnD1CFpHeRcri
	IFoaOdNUEoJK7UMDJfA=; b=SBgZQxgd8ZeVN0lEXedVcI3xWejSTJkdMTZDeinK
	T1PKPNJD2aqUlNOjV+Kh5onS9L58tq1s8oJoRliqL5FndtpVrotpmxhegvwtjdbO
	nRYATc7TTqCif6Ri7mss3fipRpRWzfO1BC1wB0YknOGxPv81ynV69eIu1rjJ4ykn
	zm3XMrkjHtplFNhCxoQK44jEYgv5fITM1MGTrug/cJamck+IwHaJ0bItomzYOpzM
	p+OhHU+dUXipImAN22mUCMR0Xi4VZ+guS4ErtBA1R8xORzIQYeJJVDdjue+i7FRl
	Q+pPMUooSA/cQO3O5m0kvjcYzu3hbV5DEuswmd0MESDlRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7k91m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 19:42:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so367589685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366977; x=1783971777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6d3J4Mk83rpjnD1CFpHeRcriIFoaOdNUEoJK7UMDJfA=;
        b=FEyBIoKqufvrpWaYFkggJ2ytLmC7nuYLo7e80kNjR1iCoTWOL2CM4zAMVgyKIfp8Lu
         e22aSumFvS/jI0w8Q/CScfrFDH7jiYBUO+W0sI1ZGU4aH+r+KU8UFxhJJusT+hD0xGZS
         5fMiCeDvPeHS3n5nfMsML5CtiaqTYS2p2vWGxUnWDv7fF5wvQKXHPxJ+/8tz8SCAhqsg
         pSQiJHk7fSuD+6wdV0MHClq9onAPRWN8ilpjED4Byfe/8kRZsvYvjn2EgRKcIov8iykp
         iW2gN7A9LLQIbx4uFwmYeVDaZG/lJgvS9jAduhlW/vtiVNvptfKONdYJGbD8NCHG/0/R
         ng7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366977; x=1783971777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6d3J4Mk83rpjnD1CFpHeRcriIFoaOdNUEoJK7UMDJfA=;
        b=d7whxNmPjAIAd4P1sIatHYhaM+OOD+8nERrF3ahuXnuwDe3ixiDs+lM39zjibxskTV
         Y1NRGzmey0GW+SEQmehFpAA3IeTQ/OFfT0A48H2MSGwHMpGyQ4RTLewzfZn0LlCnCdR3
         b43q8tvscNCF8wjyp+7CwTA6JuFKece2WJBOvMDYwlKWii/LQfSDsOye0sKZLQNWhN83
         0hfNU25rMNFk6FLzTG+7QqoH1gaPPcMVDuBHEh9SW0XzLXlTdGyyAOepKlwMl5cUK006
         4RQgS4qemEw/lJl/s092qSsurRUIFPol/LYJ30L2GbUGTgkVN+2sCxICw1hoqjaKNDbR
         mP8A==
X-Forwarded-Encrypted: i=1; AHgh+RrS03N7V3/mYWTL7STYEHQOZvO4SHrTcJTnKgy+S1FpGEZR/ER9TSHiuX4oXmJD2vVGlPkd6oGwH9hibKrK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd0zjAoj/P3DmMzycp5YfsdVecqRzW3m3/cGFzh2CkCTI5F0Nb
	9LkRVSo4WszRqIMedQSZ1PgMlvvLv/t2CybqvFNjqf07NH/4R9zSa0RYBuG6L/6vvh70FbWfqK1
	uCKppiAtVwDYsKhtX1TXSkImEhfWI5LALV5hsaGii9vxpZ472sz//bKfjg66p7mDbGuOh
X-Gm-Gg: AfdE7cnz696l6CzzS1FkPq8Fci2uEqAwP1yhxTy52MF1KS5xmHeP3cOl95UOJdx0jSE
	00MDrm40M/kDX+yXpKnyHpAgOtb8WNjoW/WadmnBP2JeLxs1FYWIEn7VSJN+jeQwUXHIkd/RvRx
	glBmSD5XczW8LwrqRtnuhL5pn26C3VO6vL8Giw0vVDJ/yqw5XRHFXryERRU6hoJN/0d/cpmWBkx
	x1i2Lz8mtpUvNpUCfO6N1ncn3FqW+KZCgbrOcTFJgavIvEq7PGaWT7iNN+Drh/WL7YZVWQlCrtr
	tAdEYuupQo0Wv7CqBydMXLTlVgnKZpDjzZliyhDlKP9KwNw+BxMRqpeD6fTJwdE2F39lJXB7mI2
	Tf13KuRMzoiWG+DyNHZAT/pa32WtMbcYrh9AWG+u9aQbDLE64kQcdAePq2iruwP1twNfwOT7QG8
	5q2+b1SP1MDWxvjgBbIXTxjKwE
X-Received: by 2002:a05:620a:4621:b0:92e:87a8:6f15 with SMTP id af79cd13be357-92ebb5c8cd8mr281831185a.69.1783366977405;
        Mon, 06 Jul 2026 12:42:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:92e:87a8:6f15 with SMTP id af79cd13be357-92ebb5c8cd8mr281829285a.69.1783366976935;
        Mon, 06 Jul 2026 12:42:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377024sm3110522e87.26.2026.07.06.12.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:42:55 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:42:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v9] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <zj7y2enw2owu4oidbxc5qhilmbb7uzp2fhlawapuqlvhh45omi@5j25uydqolks>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5OSBTYWx0ZWRfX9us27noF9Hog
 jkedHeFS3rThbD4riP+YfFERXSm9IpXjxdcaVE6DtfOU/jZuutkQ9tRr5MFVVLi8iE5ymzEmS46
 yLHadVhDYs02HPH6u4ldi5q4Znchv7BYkEJxnDQUuy29u8LYb0ljkVv/ivTIIa1sLiOgyNql1UD
 yuwDqkmXzneBi+ALgMBq9CjQZF58s9nESf1m8Bwwg5CqNeByRZWvfS+es6qetrPoSAiKHcKjUt8
 Zy6VscO4PcN2I3SWtH1tKFM9VCiM9lFEaB/2ppNM6lc+7Mm2CNoU+owPQMN4B5pcFh3/Xvym6oG
 m4a1LzpHZ3fJveR2+/DWSaWCdwBGRJub/Y0TF1MX1CNGEvrmKNH5B2MaEjWn8f4L/wUtxw3pA2w
 mc5XcA0dZW+1Rh3N67iX1dfb236iBAAvEv5Qo68XN1eCgM/XLVBvCCFkXdo9sRRiRU/OMFO6KSb
 gcya1poB32OSuw6/nBg==
X-Proofpoint-ORIG-GUID: iRVl6hkGsTXZbqGlOlFtHiNtkEThD9WM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5OSBTYWx0ZWRfX4KJ4JB9oOD22
 Hn+MM43X9bKX/ZaJmtQ7XWsnYmqk0Cs+0skmbubbRYWyKeSfO+//gjbeHQZg7dbA7Y4JM2VTxHv
 CEaN7FeqgZkG2aygJ0DFIyxCo9HadCU=
X-Proofpoint-GUID: iRVl6hkGsTXZbqGlOlFtHiNtkEThD9WM
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c0542 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=EnRuTfNfpS18YwFKnmsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060199
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117023-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B840715550

On Mon, Jul 06, 2026 at 09:44:28PM +0530, Mukesh Ojha wrote:
> All the existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on these devices [1].
> 
> When running under Gunyah, remote processor firmware IOMMU streams are
> controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> consumer of the DeviceTree. Describe the firmware streams for each
> remote processor in the EL2 overlay.
> 
> Add an EL2-specific DT overlay and apply it to Kodiak IoT variant devices
> to create -el2.dtb for each alongside the standard dtb.
> 
> Note that modem and media subsystems are not yet supported due to
> missing support are not there. For GPU to work, zap shader is
> disabled. In EL2 mode the kernel owns the hardware watchdog,
> which is enabled here. For WiFi, the wlan_ce_mem and wlan_fw_mem
> regions are needed by the WCN6750 firmware.
> 
> Remove the erroneous deletion of wlan_ce_mem from qcm6490-idp.dts
> and qcs6490-rb3gen2.dts as this is device memory and should be
> present even for EL1 configurations, whether or not the
> underlying OS uses it.
> 
> [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
>  - Remove reserve memory change of adding copy engine device
>     memory back in el2  overlay file instead do not remove
>      wpss ce device memory from el1 configurations for idp 
>      or rb3gen2 device tree. [Miaoqing ]
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 000000000000..37a906218d17
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Kodiak specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +	status = "disabled";
> +};
> +
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x1800 0x0>;
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x11a0 0x0400>;
> +};
> +
> +&remoteproc_mpss {
> +	status = "disabled";
> +};
> +
> +&venus {
> +	status = "disabled";
> +};
> +
> +&watchdog {
> +	status = "okay";
> +};
> +
> +&wifi {
> +	status = "okay";

Hmm, don't. The platforms doesn't necessarily has the WiFi enabled.

> +
> +	wifi-firmware {
> +		iommus = <&apps_smmu 0x1c02 0x1>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index bdc02260f902..6ab1bbdc0a62 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -25,7 +25,6 @@
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
>  /delete-node/ &video_mem;
> -/delete-node/ &wlan_ce_mem;

Separate commit.

>  /delete-node/ &wpss_mem;
>  /delete-node/ &xbl_mem;
>  

-- 
With best wishes
Dmitry

