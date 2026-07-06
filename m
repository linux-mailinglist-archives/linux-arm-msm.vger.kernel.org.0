Return-Path: <linux-arm-msm+bounces-116620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yqnwD54hS2rNMAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 05:31:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F6970C562
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 05:31:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jz5EivmA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jh0U9LWw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116620-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116620-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181B53038C69
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 03:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63803ADB92;
	Mon,  6 Jul 2026 03:28:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBED73ADB9B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 03:28:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308520; cv=none; b=tnxMF2Cy5ljtqFj+OlpGyqz9IzOxrTavyNDhLHe8LIYs62werM0trRkjpHavToH7TcBgPgubQsp44ZryiFFXTWiIJegob+pUPu7vKN71k3NkL2U+LgoC4Y2evEDMo7FwI5mUmlYMPLMNPmTUgWMPnB9b9S9bhhzG4K+UlmUX350=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308520; c=relaxed/simple;
	bh=XXnnosBHHEG+4Tp7rVSsLTBezTokdwoXuJeq610RzBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cw5kip+uKYyPVvM2s+JByE5I7qN7XU2rC0yrnzXTr0pkFe2R9IxptDsqjn7344hPQ4TCzRo4VOeQ0szGMEJ9gT9Qj7Ny8nuWi2gXyQjDgiR6OpGolqQ3mVk4uI0PpD9bzMWolP/59w8FSlhzOyuFPrzpILAH1YgbfskRi2X/lUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jz5EivmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jh0U9LWw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665MfSBA2947760
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 03:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eK6+g7ouEyZ55quMY4a0IzhrH/gHcqLqIlm2JyFXWbw=; b=jz5EivmAlCnGEhaL
	5snzz6HCL+8livh/joYJB+fiMly42Lz4hQz94ZtFCXintREAtNsVIk96M126b5ZN
	7RhA80pPsuc7SQn+hdd4AQnGJcwkNKd3lIW3t6+gCLY3EBdgN/L0apOwDJXDkfbZ
	xZnRCCUQW23gm+bS5cIX/ws/bxSv37QOoyvaefzRjExBWFuMumCkTBm0RuMtDBIF
	5G5KZcotgOmbQSBhUUO2GtdKfbyA4n/UKTLX7Mq/bjZD5m0Vezn4oK+4W1DlkG3D
	kCUvvOMq1SmSUviOD5Jj4CEAW7THLe0S0/WX9T9RBtsM7O6X7tannBb455G1SxSE
	ZxNFqg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64m9qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:28:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847c3a12ce8so2602418b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 20:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783308517; x=1783913317; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eK6+g7ouEyZ55quMY4a0IzhrH/gHcqLqIlm2JyFXWbw=;
        b=Jh0U9LWwNvXw40c9K/kzfPOaKGIp066Z5XayKkzKs0YzcHMkJ4yDA1ULZOLCRBb1ay
         zsmi+e4JGzJCCo6yzZGGc6VghZ78XosZaYsIbvzDBxr198Hwp4KuVz+4N+Zo9mSKZh6b
         vU4kNm6kGXuqHwbz9wRkNIAFA7SQOEZ7ecJzUWIqCgFDnyHoL1/5NRscry3vBPfS52wf
         8R7Qn4JN+1J/crBG0ZgweWybTon+H0uW8jyUjOVTJGVQBQm5pW5046VD/ZqNnivjao/K
         UPJTN+IcIvdIURc2SYqbDBLH+FItCzjhYkr4EdcTeglkF0yi5uQJBCX2noauaVeP/b6k
         JYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783308517; x=1783913317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eK6+g7ouEyZ55quMY4a0IzhrH/gHcqLqIlm2JyFXWbw=;
        b=Cz7ptWxOa7j5KLbuO8cRgYWlsHNFN4ADdjNafnVOB0/p6f5fVHZLAUwncmnySoA3vJ
         l8NfGLVScFjsdfPRbzDKGnmYldlGCbwxcz1xA4dVU06oGiUuPqz+bn4t9zX0nG66upPp
         8gNUzDBibXTBKxaUeUNMdfHbq0Gi0uyBq9SbFLnpFQLY+V2fDYiP9x9h5CFhfH/kbU20
         vKqaEoiKqs6HHMdvNVZRR1k65QXMeApGYwpdD/gK+cBkxvN8N33hoEmT1cj1sDrkuYl4
         Z+iS4HVIsdsp2NI1B2X07dKIaCGssJM3Af5t3dcDjNU0sLtl3RdVZ1BOWTu+C8OTu+YR
         +yrw==
X-Forwarded-Encrypted: i=1; AHgh+RqNAuM59TM1HaQVHi1reeoD9TvVjW18nMBLELzRt3MvFZlgBl0uUFzW4UZ51ujNOS++HZMXYacJ/bYrRVHg@vger.kernel.org
X-Gm-Message-State: AOJu0YyL+2+2WfYEDU44Dimw1X28viWNFBtShKlFjO/skkJh5cy7RpZj
	jcA+2AnsbzhtKPuar/yQqWdurYYiPUp1EtfRSAFYoKtHyfuWSv+HF7cUnCM/USd9ePJ+KL+apN4
	Y2xarpUN7bTeXyxJ0AL+RSYN17EG9x9XSHcxjkDuEhivAJWrWdJcJS5g49lp1K19S5NzR
X-Gm-Gg: AfdE7ckcgcFPhZUKJkSpcnDaK7tRm8H5V2DmpQNqtmaX2JUN7TI2c2V5Y3Bb0zwcLv5
	XYDlKDGU5eWWh4RfBFh0FTdJyoJNT8pZN/QoQFtrzxk5vnmBdF/LYMk4W3nrCAFKJIHiZ2TbBJx
	dZuuPFP4+9TpeHaEv8KO89U0wH5zGAEJ1Y/PcO+Uax4EfZ9C/u9e7Lp1CM5YlIcY56OAmOCZiR5
	CPGtNxdreeXZIfuEJnAJwPs4C6T47f83KY3FGzcLyKKYuNaXx5S1Egs9YI74M5NQcdbWaGbCHuN
	M0Fk7U3aiZar6SOKbb8tY958rpwWUr07VtFBS5btaleolxjLw8HOCteMxp5za3wAub4CNh/vjhY
	wGIJBPzV+CN9ia9mrCnOiQA7MJwZwiPMcWsqB1LrW7SkhziCY/8T28PMA3Q==
X-Received: by 2002:a05:6a20:4309:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c03e25825cmr8268381637.27.1783308516601;
        Sun, 05 Jul 2026 20:28:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:4309:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c03e25825cmr8268347637.27.1783308516162;
        Sun, 05 Jul 2026 20:28:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm76309105eec.9.2026.07.05.20.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 20:28:35 -0700 (PDT)
Date: Sun, 5 Jul 2026 20:28:33 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply
 support for Glymur
Message-ID: <aksg4arKjUXdQfA2@hu-qianyu-lv.qualcomm.com>
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
 <8811c181-9caf-4797-8e17-52311702e292@oss.qualcomm.com>
 <akJhrpyMuLnoXzJM@hu-qianyu-lv.qualcomm.com>
 <f2c68d67-1b12-40b3-8097-5b863d7710ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2c68d67-1b12-40b3-8097-5b863d7710ac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAzMSBTYWx0ZWRfXyhbtFWlky9H+
 +JsdK1WYjGCDyFWwEzV5M9ouUGjmMC8gD76OcRYCICKfylqufQich9NNnApIxgzGxjPYIdZKG7M
 9JEkBSyYLqDzy4JoCMBK/fzNmi4g6rKTDUJgrFdUSP66pxMEVIA4aPh91tE3QQUpJ+b8bi8vVgm
 +lnXZMqoDNbc1ZE9DfIDTKd4gRNS2lepTyGmpjvlKO5+kL7KjgO97D1aIN95wlmLFnWjmrEbeMS
 bsgbK9kBCVzkvo58WpXJ3sgkhRbNw+VjRkyttO5kTXOxLhBmAWbyhY/v8fyMurzNLHQ6+fb8a7e
 /bWWZiFXdPQqzeQOnrgWW8g40Yzvrnz+mep8xqWNGnOlQoSPCLkfMZSsy+b6fzMKjYZPFyGsfEM
 szVNkawEZL6uejNOw4nxBrJLuBBbeqjm+XyggY7191ZjL5fRUs5Vyb6bmyRCrPdLYvQNZfMHULX
 xUOoWSJUK/sYv9Bhz+Q==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b20e5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mkIokxEfF-L8pB4xSJ8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 27JgyXbVN5WoUycMcIdkBaxGH2oUao33
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAzMSBTYWx0ZWRfX8Yqn4RZW3aiL
 QJxa0EJrD0tWz9tLp7Xctj75EVYv3WK6XdWrhBTMRg9EkwHY3gHQFGlec0fLe7XzY6ThzpTRdKr
 YAfssKUeErmS9/5FJ7wjE/a56N8Exkk=
X-Proofpoint-GUID: 27JgyXbVN5WoUycMcIdkBaxGH2oUao33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060031
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116620-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-qianyu-lv.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87F6970C562

On Mon, Jun 29, 2026 at 02:18:35PM +0200, Konrad Dybcio wrote:
> On 6/29/26 2:14 PM, Qiang Yu wrote:
> > On Mon, Jun 29, 2026 at 12:51:55PM +0200, Konrad Dybcio wrote:
> >> On 6/23/26 3:05 PM, Qiang Yu wrote:
> >>> The PCIe QMP PHYs on Glymur require both refgen for stable reference
> >>> voltage and qref for stable reference clock. The refgen requires two power
> >>> supplies: vdda-refgen0p9 and vdda-refgen1p2.
> >>>
> >>> can be extended in the future.
> >>>
> >>> This series creates a Glymur-specific supply list including the refgen
> >>> supplies and updates both Gen5x4 and Gen4x2 configurations to use it.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>
> >>> Changes in v2:
> >>> - Add dts patch in this series.
> >>> - Reword commit msg of dtbinding patch.
> >>> - Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/ 
> >>>
> >>> ---
> >>
> >> Is this necessary (for Glymur) now that we correlated some of the
> >> TCSR clocks with the right nodes?
> > 
> > This patch is necessary for glymur and mahua and other Qualcomm targets,
> > which can be verified from the REFGEN page and power grid page on ipcat.
> > 
> > Take Glymur PCIe3 PHY as an example: it requires two REFGENs — REFGEN0 for
> > the PHY itself and REFGEN4 for QREF. In the TCSR driver, only the LDOs for
> > REFGEN4 are voted, not REFGEN0. This is intentional: each consumer is
> > responsible for voting the LDOs of the REFGEN it uses. Since QREF uses
> > REFGEN4, the TCSR driver votes the REFGEN4 LDOs; since the PHY uses
> > REFGEN0, the PHY driver votes the REFGEN0 LDOs.
> > 
> > For some PHY instances in power grid, you can only see one REFGEN, that
> > indicates the phy doesn't require QREF or the phy and the QREF it requires
> > share same REFGEN.
> >>
> >> Perhaps this would be necessary for Mahua since its clocks don't
> >> require QREF (or we can lie about it and handle them there)?
> > 
> > For Mahua PCIe5 PHY, it doesn't require QREF. So we don't need to vote
> > REFGEN LDOs for QREF in tcsr driver. But the PHY requires REFGEN. So we
> > still need to vote in PHY driver.
> 
> OK, I think I got my mental model of all of this straight. But expect
> me to make more mistakes and sorry for that!

No worries at all. Glad the REFGEN and QREF topology is clear now. Thanks
for the review.

- Qiang Yu

