Return-Path: <linux-arm-msm+bounces-91747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GX/NIudgmlgWwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 02:14:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C072EE05C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 02:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98193305613C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 01:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688CB25DB0D;
	Wed,  4 Feb 2026 01:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENsp5obo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMfTnY5B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7FB23AB8D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 01:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770167686; cv=none; b=e+jVEPqFLgcAjqgFzHdVCHxe/Gvy0dollZZ8eUnXJU/9DwnD6dCLOEqac1aImXS3UKQLb7kIhnTik6XhOl/sOWwIOxCqi7BlKfAy26NvVfkDDeK7ZvW1JeDA4T3U31GsDH1fcCsC8dP4fMSMtCBMAXY7T0Y/o15+BT9/pR7r5ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770167686; c=relaxed/simple;
	bh=+UlTR6hv8631B4iaBWsV8zynbZQfewPDNzChE8C9ErU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCK4QVHrJE0jSURtr6NPJsD2+8mRiSOMHZ5gi7Y/mzrz9GaBmfe4g9zrVDw6azdkvtvPPfe8Wss7CgWu6bFH/KBrq5WKlqhR2qCm6tWIsQsmWXe2WR298kgPJLE4yu5DAhnPdbxYPdbA1IjGmuKS4QAdIDKYrY+oX+bcoQjsC/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENsp5obo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMfTnY5B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613LK0dR3515394
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 01:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtHKENTQprTKmRT3YmuFw0K2tJb/ZLOHx9It1bp0h4M=; b=ENsp5oboTd5i+DJB
	MOmEwyHgB4+WnVjvSsA2DuTgK+vWRg8WohGL5KsPUn5uNlmrMesn4fEZ1id8C8Vz
	ghDF7RTnEqiQYe6bM+f8hOPxTeZSMGVeqoj8DtW53HWzx997jIrI6JN99V7DfjWX
	AGK+5emOZw2J0yNtb0/OMBMcYrf9At8c8VwPKqsFsrMuWjhSsd2H6+Ugah4WI0hX
	eGLZ1dxNHV9Ixalcf0j/1wrwcdQxfOoC0yMBtnbV3/zWAvmcrAwpXeJYTXEIVGgU
	FIyIYrHUoOe6Ihd+wZ3YzpFuIrLfOQoowyleyeg4nMH2cVcmkQmETPfxlKuSFVrR
	87BzMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ru98ky8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 01:14:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ed6c849so1634186085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 17:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770167681; x=1770772481; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HtHKENTQprTKmRT3YmuFw0K2tJb/ZLOHx9It1bp0h4M=;
        b=hMfTnY5BXWAnpuDOhf3UxA/6M7ZciTB5srMDymk50sSMcG6+l0HKHcuLXP2V0zhQE/
         ikxcL/PGCj/HtCo8svLpSkrrPHnH6yxoN7HpgdardQOShyijxDDiE3VwF9bJBdnm0J5X
         KbUrNzayFRxDyFgkLeTbARMx+kcVCgZCf/w3d1E8b8z/pHc6+tf9mg3fCXW15PHD8SXP
         a9W4vxacJOeBCeT3XlPWzsibPKBP2rpT8cKM2dXBcK9eKdhLXB/8M0zDGNnQidtBmJa5
         RoOl5B8BQsGag/Gxa1XxqM6UvRqZBN/5AuWVKrls38df6ZxUnHNNAuCnJ9/QSz/8Dqm7
         wmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770167681; x=1770772481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtHKENTQprTKmRT3YmuFw0K2tJb/ZLOHx9It1bp0h4M=;
        b=RfOgeZoiSWVM/26o/+gFrAnSgoIKmdtcdXNsFN3nR1SrjT6+uE6dBxWcAiJTHfeEeG
         buLd1Ogko1FHUxSe4HY5tKBmvpXAdjBmLHSHXTRNGQhGXbZ+eiwT8lZYa8oKcvW49jSe
         +OHbPsnH6gxUcM79321/z2wGFFqpRmcboLQ1Xgn2kUJDCQ+kJScBZSX3PJS3BsBMuS5Y
         MizHDJxeErKvRu4kJsi48q09Cek9qFqLw+N51pw6nUULxP1NlRp/JHc3+DXNz72rdvvu
         RDVYnwC1QjatiJAg5mvldjdfSMPEMRSFVZgpA9nqJIsPIcsDquT7mGxOM+5Y4P7KDKRN
         ux4A==
X-Forwarded-Encrypted: i=1; AJvYcCWLg79/e7SUHK/ZoDPCXevsleKJA/fo8J0DbohHMYHmyoo8b+S7wuxFOC1HQbPzj3LZryzJncYmke/7rYHS@vger.kernel.org
X-Gm-Message-State: AOJu0YyDjOSa0t8qyMNEBZASYw5AtZuYQUO2mn9LpejtxDTnS4b738lj
	2EpGkP/3gTEyjhjoS8bQ6H13GzGcUtCDx0eglwi2v73TjzUrazU7WNLkeLpKS9HK/S4vkjf2NSP
	5QxhrIOblw7qPmodFdfLUHrMFYMSLRTnkFHxmj/Bwa04+rTJIbo67k8xOGBWhhkHJ6v+Q
X-Gm-Gg: AZuq6aISgczPHpoqV5jdtuSLmwNS5Lc4TNAafqDulOWKTn1u639B11+iZfQZH0K0px7
	KixVV9l0dXO4XXH23+NdcRyLaxa7Ph/YxZFejosaUh5xphuQv/bdShUMEWMWS6g2K2vO9+p7vSD
	sdC80NVbNDRV//czXMHqzUacN7G7gv73Q72++Y6VG3FJTri/NN2jLA+CNc8/zDODC5NoreIl0UY
	36z7tiZMmKuWYsHG0Gu3wU1bGJc5j08wv9m6sY/wRrV4b823wGPXUfD6vA4COqNWgMxQknLp2zO
	dLFSIeIYkfd9rTqCxgmONtqrWWtaqQMgCgiRG8KnWVNl4jmGhuW/K38Fl6X0anad7n5WP/bn6lW
	bjOlT5hIsBGf/y8Y2PqcFC/7NrfQy7QSbUiYGyURYt2gZxkPFKv4dMwBGyuYd/tAQvYDePKspX5
	fKYY5GTN1wIeq3UUICXuldv0E=
X-Received: by 2002:a05:620a:4807:b0:8c6:abc5:f15e with SMTP id af79cd13be357-8ca2fa32305mr200284985a.67.1770167681400;
        Tue, 03 Feb 2026 17:14:41 -0800 (PST)
X-Received: by 2002:a05:620a:4807:b0:8c6:abc5:f15e with SMTP id af79cd13be357-8ca2fa32305mr200282785a.67.1770167680948;
        Tue, 03 Feb 2026 17:14:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff420sm263232e87.2.2026.02.03.17.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:14:39 -0800 (PST)
Date: Wed, 4 Feb 2026 03:14:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <4rmjpmwglz4rtmctrzryehhwn7t7g2xuljau7srzokywilrcua@muockktxclqu>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v6-3-245f408ed82a@oss.qualcomm.com>
 <2vqho236mjlsnraqif6ivic6ybblnsmk4litqw2sbfpjvrp2t2@eztnjrlsmrp6>
 <64x5xfzjik4qtvsxqvwqhf5mua3rpvh7nzw67v5sy7afoo5fzv@5vp3uvjk66if>
 <b2696068-2e0d-4197-9aff-606fd9d72b7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2696068-2e0d-4197-9aff-606fd9d72b7a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNiBTYWx0ZWRfX3jFiP+3m7IQN
 pXUNnfsmbrnmCFqWrBBusnTLqhVSfgWKfUooj2ox0qf5rEyIx13SwLSP1WU9l4uF4RnhmgMG9M4
 hLgghk3uF/GbUPdQZ0efhHqxxol/w0M8O5UL5ZVMI/5o1a7kEE61v9NkFqyGyBYP7XHfFHh/TsJ
 Yt6fbKIAh1LsAhp8SLPiJSN43RXhxKGgytV8qBMZy/Upqy0F+RfReeYQMWMl8ER6bnaRVxDWhic
 GtkZT6EeJ5wRsUXRJDybosw46uGO0VzW72x+LyF+yC65NOtXavvmrK/W5zSpIizfhPZ3lWXg19c
 OeolxYpgBu23AjrNAaYWk8/Uv6yhv/TP9++EMRKhbhZXLyWktuiNAioxwUgeSc2WDtU6DCmTaZ4
 /TLxhO4LZ9iK29d9T4MaEgMXfIt6Wcb7MgRvl175b6mqm3KhpluOZesNitnrnVT6jIV6gxzsK8B
 nyHyMSp5wS0o68r/Qtg==
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69829d82 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ZvQMFzxqNfvNeM4-o2QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hZgcUV1_-pnIE0-sB4cMuCUtMHv5T_K0
X-Proofpoint-ORIG-GUID: hZgcUV1_-pnIE0-sB4cMuCUtMHv5T_K0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040006
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91747-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.1.134.160:email,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C072EE05C1
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 10:08:35AM +0530, Pankaj Patil wrote:
> On 1/31/2026 3:30 AM, Abel Vesa wrote:
> > On 26-01-30 23:44:43, Abel Vesa wrote:
> >> On 26-01-22 20:54:00, Pankaj Patil wrote:
> >>> Introduce the base device tree support for Glymur – Qualcomm's
> >>> next-generation compute SoC. The new glymur.dtsi describes the core SoC
> >>> components, including:
> >>>
> >>> - CPUs and CPU topology
> >>> - Interrupt controller and TLMM
> >>> - GCC,DISPCC and RPMHCC clock controllers
> >>> - Reserved memory and interconnects
> >>> - APPS and PCIe SMMU and firmware SCM
> >>> - Watchdog, RPMHPD, APPS RSC and SRAM
> >>> - PSCI and PMU nodes
> >>> - QUPv3 serial engines
> >>> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
> >>> - PDP0 mailbox, IPCC and AOSS
> >>> - Display clock controller
> >>> - SPMI PMIC arbiter with SPMI0/1/2 buses
> >>> - SMP2P nodes
> >>> - TSENS and thermal zones (8 instances, 92 sensors)
> >>>
> >>> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
> >>> PMH0110, PMIC's along with temp-alarm and GPIO nodes needed on Glymur
> >>>
> >>> Enabled PCIe controllers and associated PHY to support boot to
> >>> shell with nvme storage,
> >>> List of PCIe instances enabled:
> >>>
> >>> - PCIe3b
> >>> - PCIe4
> >>> - PCIe5
> >>> - PCIe6
> >>>
> >>> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >>> Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> >>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> >>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >>> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> >>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >>> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> >>> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> >>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> >>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/glymur.dtsi         | 5913 ++++++++++++++++++++++++++
> >>>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |  187 +
> >>>  arch/arm64/boot/dts/qcom/pmh0101.dtsi        |   68 +
> >>>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |  144 +
> >>>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi |  144 +
> >>>  arch/arm64/boot/dts/qcom/pmk8850.dtsi        |   70 +
> >>>  arch/arm64/boot/dts/qcom/smb2370.dtsi        |   45 +
> >>>  7 files changed, 6571 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>> new file mode 100644
> >>> index 000000000000..16a3c3ecf97a
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>
> >> [...]
> >>
> >>> +
> >>> +	soc: soc@0 {
> >>> +		compatible = "simple-bus";
> >>> +		#address-cells = <2>;
> >>> +		#size-cells = <2>;
> >>> +		ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
> >>> +		dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
> >>> +
> >>> +		gcc: clock-controller@100000 {
> >>> +			compatible = "qcom,glymur-gcc";
> >>> +			reg = <0x0 0x00100000 0x0 0x1f9000>;
> >>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> >>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> >>> +				 <&sleep_clk>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <0>,
> >>> +				 <&pcie3b_phy>,
> >>> +				 <&pcie4_phy>,
> >>> +				 <&pcie5_phy>,
> >>> +				 <&pcie6_phy>,
> >>
> >> I'm afraid these do not match the array from the driver.
> >> I think there is one more <0> before the pcie3b.
> > 
> > Actually, one less.
> > 
> >>
> >> Please double check.
> 
> 1 clock was removed in v4 to fix the no of clocks, 44 was incorrect
> I will update it to match the array from the driver

Please add at least several comments, helping out to match zeroes to the
actual clocks when we add them.

> 
> >>
> >> Thanks,
> >> Abel

-- 
With best wishes
Dmitry

