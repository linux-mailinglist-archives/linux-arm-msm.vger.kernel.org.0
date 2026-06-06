Return-Path: <linux-arm-msm+bounces-111514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tgAkAkUZJGp73AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:57:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6F864D8E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:57:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Snec7G3w;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NTFw6F8C;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111514-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111514-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56365301F9D5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91543ACF12;
	Sat,  6 Jun 2026 12:57:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3EB3A7F6E
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:57:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780750648; cv=pass; b=GnWhfiiUexd58gR3GpXyiVB2M0RYtEzZjdq6unwXcQrsDx/k2flqYQ4CDYDUq0tkxx2F0cLgC5rJ7Wc3OWuCPDt0saMNxXhmy1wRwrmmhNZyGdtwbypyaSpNjG5XFJumgRMbvBUXKRuDJhamxyk9ImA0bz3hP1OYP0ffDVnJUhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780750648; c=relaxed/simple;
	bh=N2ev8NttSPp3sm8JN17mx+8UplfZQ9K6+B3+i211/Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bL47uqg9/nb+IkL4e4Jo6tE2DwZbNeJ/Q09bZ4ynJRkMUzKAIlyUqcN5K/FT5+ajOuydSpndELgbHF/huZQ2Hv+wORf7//MvXoMZ0rOYC9vr1AplA6jjWP+GkdU+gCvAYPxDy/PN5Nx37bOfaDIDoDS1AR5IjcB1b1dJ/x7v72M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Snec7G3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTFw6F8C; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDvts1330963
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5tekgFbaGaE0XEy2TBAKDaP0xadvG7zEM2y38MY8Bc=; b=Snec7G3w/7iD/SSO
	GVTQvnZ2gjF2VwjWoNnYCmMa/hIIGIxBdya0Y4Xk/FRjHec47aDV7VlDpQTnfgJJ
	1yUJvXglwD4+J15UtrB6o6332VomC5gGsNjr3nFKHK8SN11dR9RpuIaGHXgRheIS
	S2gBSDtR3tPa9B76L80rmcc0dAZFd2mTLqsaLCEUM6CDQfG8Vbags2571yJD35pE
	Jke0AgNfr2vTcwCI1fJXus8nC357e9VIKeeU3l+Q5x6MDJ07prQ6w8ntljC3QUnX
	ro4gWiBST1vXaEXfLtaYUvh/odlLt6q6Z8AOG1VugemDGV9zk8gwAMHvRPZl6wc1
	1JX8jA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98csm6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:57:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157929bf8fso152233585a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780750644; cv=none;
        d=google.com; s=arc-20240605;
        b=R4AMBtmLpUIsD+H/9KQFCPhsglN9jZj4AuFqYQaaOcu6tQJk+QHOQh59j+DX8lrGKO
         UY+s9HvLtS6QQs7CP+Ul5maMLnoVtdG0F5Ar3Siri/jM/LkEAG3T7nLUqpyLsGZsKv/I
         jndRsfT1SQ/yrhVLnoJhmbC5o6fBQeI1N4/a4/a0mEkhmiBWBLZwbKh/Lbx5cyRKELDi
         /FoXtWObTlL4/xmbiDzhV9wTvCTXVnwY6WwhuZ6gaRKOs0zM9nSmBJOVzXb6f97l2Nus
         0atYzBYoSsddgAdeDhO6p1OHnCN+Tc7k4TCBjJt8eo4SXpTcagVs5A+0GGZuzYnfEdOD
         0N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r5tekgFbaGaE0XEy2TBAKDaP0xadvG7zEM2y38MY8Bc=;
        fh=mUlKRaacXZmAiP8S0++Mcj0oCHcY3mANC4ElVSXCd4k=;
        b=i/7spYTpQAstWQYh2tfsF5AQzgLR2dr3QcV/EGXBxGuBMKXl66gmZ7BMByQFANo+co
         wHxL3g+2PvBdBFAZqAoeOzl2oZCCYE4sQhOik83MpPX2+euc4+J9Rbd8lMiqYmjHQapp
         p/dg1LjPAn5E9WL6d/asZMEeH4ph9sf/b2MAXHPEOJXmegdViCyQoCX1vEF5gjg6KY2G
         ACRjVn45r3x5dOv5cP+npkjIHomNu5RcdJZuAtaDlzyDTPMMi30xFQSK09u9e3HNA5Hw
         bPIwEMGlkPfb4ppWFEBkwD8vjvbRlaCUlsxPLefIHql+k6IIz1DM6Q8jMjBxdaK34wmH
         +nmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780750644; x=1781355444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5tekgFbaGaE0XEy2TBAKDaP0xadvG7zEM2y38MY8Bc=;
        b=NTFw6F8C/++n6YZIUh3hdvBs3FccDMLq549ldHckophfzy51CbFzLkPWq36byKXb+M
         JlW1tmWnTeNjKqqH1VQUzE2taZcJ4EzAIadeTtPcCTBziC1QyDVRqfmDeezabjWF6ghe
         CI2YZkABCsCVvwthnOaF9Ezmi6YGZgL/Pwftl546qfYU/AtjwM9h7ZYd0LuhD10EJeMQ
         qEeudyKQ/YDv6tVA142fzwk5JuSEyx34Udmsi3Ok6SzCyUyPQ0FlOyZmLZVNxwRNtSVU
         2bcKnRSB11oiGQKeGneUPYdZ2AC7QrleOlN73FtSwW/GlfMVxz64S664WWTx+JuJvWSW
         cY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780750644; x=1781355444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5tekgFbaGaE0XEy2TBAKDaP0xadvG7zEM2y38MY8Bc=;
        b=lCfQ6uHO3I8eqmKmiJ/Ti7H8B84F2OrbvZw4b+p8Gjjt+zOQIhlX5Pmd5zk2Mdj6jA
         yLBoRY1o/SFtCb8Sewsz6CQuRmSaDbf/3U9V5yM56ll2JyBPrT7qR1lTwiKc6oMzCw++
         fep2MA7pZtx6VNAZwE4mCD94NnfiPmJvJj5Lye+O7K57AuAIYumiPKLYkCApuA8gbK9K
         k9b0E/FEJvEr0p0ujauGnmo9yiisXD0A7Jg7ktuNgu65d4VFgTw3avoXjaw6kvJu1y8f
         e2gm1BSYieZabF4ReBML3fZw4u3QWhWk4iwcBSxzIMtzAboowbvGWDgVECKzsq4os694
         u/3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8kA3/Q3EMlo4EjDsRrj++1HjiG5HvcAV9dZPRba21asWaQBwozutzxNIj8tmCaaRhV7VZbvF+pyU9wrW8e@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv0wO96naCSz8aMfKgJhJy8CwrL2ZnCRRGJViFkazAVCh2eUBF
	f824UKFVzXhhRedGfjYtOw6s9kTctzi3lqPnnBilxQDOzFNbib8W095r+F4PORnBcj+tUL/Iknr
	KFVCLiBKvtKiWJeOsshaKc50zdvZPJqP/JiWpE2USBk1zjGSEfRX4mCr0h+jCcMvP8DhRdy0tUn
	0KRADibWu+WvIdUZEHN+6Eu2q3onbmjXdnP2phRz2In2mTXaWoZ1K6Jg==
X-Gm-Gg: Acq92OEi6/LxQALfzfsb/zkugGULsEQZyTSz78WqcBUBssxGk3nJf0XI05ABTUnE58i
	m7zI6XokPU/tL3COVeOpTedeWXMWuVvAoNqT6Bu43ZGuuHUNcSEhKLtt6BH1dLzvSsfsJF61ZI0
	Gec3N9U2tCXTFz1hhyReU00tsnYfXd5Yo2Nl+TC8K3Ysi6knAyzJqj7XjHeUOYwNOMyvm71se4V
	WIdwP2vaOl1Amr/r5gU3XKKZkWJ2xIIQG8LvU0UUJnq2NS4MnLIVnvE4sNKatXfgrj4aSF5LkZL
	relWnoKDxvqlcpKS0X/FDGK06inmAA/kk8QLL5/v4DNy8Cdx3UCfFa30xlHT
X-Received: by 2002:a05:620a:4590:b0:915:a6ca:f121 with SMTP id af79cd13be357-915a9dedaaemr1367557185a.54.1780750644059;
        Sat, 06 Jun 2026 05:57:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4590:b0:915:a6ca:f121 with SMTP id
 af79cd13be357-915a9dedaaemr1367552785a.54.1780750643596; Sat, 06 Jun 2026
 05:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com> <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 6 Jun 2026 14:57:11 +0200
X-Gm-Features: AVVi8CeAR11CszzTeykil9zbLE-OpnwBQ68EzyKpPXntRU4a3bCccDFMCJWuwUk
Message-ID: <CAFEp6-2rT5fXkWaa-Fd--h8zuJ7kQqPyjedGNXrGvco79yMJCg@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyOCBTYWx0ZWRfX2IuPqSFqtNa1
 pWagHUiPgKqBl/2Y9dKrWoA11kwvfq8TTHptgmFsSYpvE0/1hL7Euv0GwKpwflmejTCe6h66uay
 ibexeF8LAoZcCu4sUA31teCjDv+859Xp/mIuchroDmT5eV+kSoFChGERq0HBl0BSaazwrMdgypo
 VTtP6gebBPoqwWOCL+NykhwWddbRo/QqcHaUNovISoQcZaE5jDeCfDe1gG+crYdMWXgBEc32kM3
 QMV9QNRSEsCEEuQN4LVa+xL/w6aqRuA1Pzuta37M9cy70Ht5HKLgL4kR2CmEfha9yFGVFELpKk3
 Ms0ALNWi1EBGZ5j8goSMWY6xkMBZT3WVn/nVcP2fTX8dW+pQhOdxoUL89P6N3rr2AapjKkS3laV
 gVvVeo9zE6TkrfSiN8hif5BaRE4inNnRq/d00Z2cMo+/NMGA2rm6QnW+SSs7/R/r820omjmlBhR
 PrUOFiFdGedRBBDoxBg==
X-Proofpoint-ORIG-GUID: _Vhjl4EPIcTJNl0Yr6oQUlS-i8gWkmaC
X-Proofpoint-GUID: _Vhjl4EPIcTJNl0Yr6oQUlS-i8gWkmaC
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a241935 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=BrMfsZBUJKb9yWDY1ooA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111514-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:yepuri.siddu@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E6F864D8E3

On Mon, Jun 1, 2026 at 2:57=E2=80=AFPM Komal Bajaj <komal.bajaj@oss.qualcom=
m.com> wrote:
>
> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
> EVK boards using the WCN3988 combo chip.
>
> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
> board-specific regulator supplies across CQM, CQS and IQS Shikra
> EVK boards.
>
> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
> with register space, interrupts, IOMMU configuration and reserved
> memory. The node is kept disabled by default and enabled per-board
> with the appropriate PMIC supply connections and calibration variant
> selection.
>
> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++=
++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++=
++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
>  5 files changed, 223 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqm-evk.dts
> index b112b21b1d79..c2ed0396533a 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -16,11 +16,48 @@ / {
>         aliases {
>                 mmc0 =3D &sdhc_1;
>                 serial0 =3D &uart0;
> +               serial1 =3D &uart8;
>         };
>
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
> +
> +       wcn3988-pmu {
> +               compatible =3D "qcom,wcn3988-pmu";
> +
> +               pinctrl-0 =3D <&sw_ctrl_default>;
> +               pinctrl-names =3D "default";
> +
> +               vddio-supply =3D <&pm4125_l7>;
> +               vddxo-supply =3D <&pm4125_l13>;
> +               vddrf-supply =3D <&pm4125_l10>;
> +               vddch0-supply =3D <&pm4125_l22>;
> +
> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +               regulators {
> +                       vreg_pmu_io: ldo0 {
> +                               regulator-name =3D "vreg_pmu_io";
> +                       };
> +
> +                       vreg_pmu_xo: ldo1 {
> +                               regulator-name =3D "vreg_pmu_xo";
> +                       };
> +
> +                       vreg_pmu_rf: ldo2 {
> +                               regulator-name =3D "vreg_pmu_rf";
> +                       };
> +
> +                       vreg_pmu_ch0: ldo3 {
> +                               regulator-name =3D "vreg_pmu_ch0";
> +                       };
> +
> +                       vreg_pmu_ch1: ldo4 {
> +                               regulator-name =3D "vreg_pmu_ch1";
> +                       };
> +               };
> +       };
>  };
>
>  &remoteproc_cdsp {
> @@ -57,3 +94,25 @@ &sdhc_1 {
>
>         status =3D "okay";
>  };
> +
> +&uart8 {
> +       status =3D "okay";
> +
> +       bluetooth {
> +               vddio-supply =3D <&vreg_pmu_io>;
> +               vddxo-supply =3D <&vreg_pmu_xo>;
> +               vddrf-supply =3D <&vreg_pmu_rf>;
> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> +       };
> +};
> +
> +&wifi {
> +       vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> +       qcom,calibration-variant =3D "Shikra_EVK";
> +       firmware-name =3D "cq2390";
> +
> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqs-evk.dts
> index e62ba5aef71f..3bfd0050064f 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -16,11 +16,48 @@ / {
>         aliases {
>                 mmc0 =3D &sdhc_1;
>                 serial0 =3D &uart0;
> +               serial1 =3D &uart8;
>         };
>
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
> +
> +       wcn3988-pmu {
> +               compatible =3D "qcom,wcn3988-pmu";
> +
> +               pinctrl-0 =3D <&sw_ctrl_default>;
> +               pinctrl-names =3D "default";
> +
> +               vddio-supply =3D <&pm4125_l7>;
> +               vddxo-supply =3D <&pm4125_l13>;
> +               vddrf-supply =3D <&pm4125_l10>;
> +               vddch0-supply =3D <&pm4125_l22>;
> +
> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +               regulators {
> +                       vreg_pmu_io: ldo0 {
> +                               regulator-name =3D "vreg_pmu_io";
> +                       };
> +
> +                       vreg_pmu_xo: ldo1 {
> +                               regulator-name =3D "vreg_pmu_xo";
> +                       };
> +
> +                       vreg_pmu_rf: ldo2 {
> +                               regulator-name =3D "vreg_pmu_rf";
> +                       };
> +
> +                       vreg_pmu_ch0: ldo3 {
> +                               regulator-name =3D "vreg_pmu_ch0";
> +                       };
> +
> +                       vreg_pmu_ch1: ldo4 {
> +                               regulator-name =3D "vreg_pmu_ch1";
> +                       };
> +               };
> +       };
>  };
>
>  &remoteproc_cdsp {
> @@ -57,3 +94,25 @@ &sdhc_1 {
>
>         status =3D "okay";
>  };
> +
> +&uart8 {
> +       status =3D "okay";
> +
> +       bluetooth {
> +               vddio-supply =3D <&vreg_pmu_io>;
> +               vddxo-supply =3D <&vreg_pmu_xo>;
> +               vddrf-supply =3D <&vreg_pmu_rf>;
> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> +       };
> +};
> +
> +&wifi {
> +       vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> +       qcom,calibration-variant =3D "Shikra_EVK";
> +       firmware-name =3D "cq2390";
> +
> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/d=
ts/qcom/shikra-evk.dtsi
> index 8b03d4eafa6d..a79f44aff968 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> @@ -8,7 +8,22 @@ &qupv3_0 {
>         status =3D "okay";
>  };
>
> +&tlmm {
> +       sw_ctrl_default: sw-ctrl-default-state {
> +               pins =3D "gpio88";
> +               function =3D "gpio";
> +               bias-pull-down;
> +       };
> +};
> +
>  &uart0 {
>         status =3D "okay";
>  };
>
> +&uart8 {
> +       bluetooth {
> +               compatible =3D "qcom,wcn3988-bt";
> +               max-speed =3D <3200000>;
> +       };
> +};
> +
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-iqs-evk.dts
> index 727809430fd1..95bd797d009d 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -16,11 +16,56 @@ / {
>         aliases {
>                 mmc0 =3D &sdhc_1;
>                 serial0 =3D &uart0;
> +               serial1 =3D &uart8;
>         };
>
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
> +
> +       vreg_wcn_3p3: regulator-wcn-3p3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "wcn_3p3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-always-on;
> +       };
> +
> +       wcn3988-pmu {
> +               compatible =3D "qcom,wcn3988-pmu";
> +
> +               pinctrl-0 =3D <&sw_ctrl_default>;
> +               pinctrl-names =3D "default";
> +
> +               vddio-supply =3D <&pm8150_s4>;
> +               vddxo-supply =3D <&pm8150_l12>;
> +               vddrf-supply =3D <&pm8150_l8>;
> +               vddch0-supply =3D <&vreg_wcn_3p3>;
> +
> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +
> +               regulators {
> +                       vreg_pmu_io: ldo0 {
> +                               regulator-name =3D "vreg_pmu_io";
> +                       };
> +
> +                       vreg_pmu_xo: ldo1 {
> +                               regulator-name =3D "vreg_pmu_xo";
> +                       };
> +
> +                       vreg_pmu_rf: ldo2 {
> +                               regulator-name =3D "vreg_pmu_rf";
> +                       };
> +
> +                       vreg_pmu_ch0: ldo3 {
> +                               regulator-name =3D "vreg_pmu_ch0";
> +                       };
> +
> +                       vreg_pmu_ch1: ldo4 {
> +                               regulator-name =3D "vreg_pmu_ch1";
> +                       };
> +               };
> +       };
>  };
>
>  &remoteproc_cdsp {
> @@ -57,3 +102,25 @@ &sdhc_1 {
>
>         status =3D "okay";
>  };
> +
> +&uart8 {
> +       status =3D "okay";
> +
> +       bluetooth {
> +               vddio-supply =3D <&vreg_pmu_io>;
> +               vddxo-supply =3D <&vreg_pmu_xo>;
> +               vddrf-supply =3D <&vreg_pmu_rf>;
> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> +       };
> +};
> +
> +&wifi {
> +       vdd-0.8-cx-mx-supply =3D <&pm8150_s4>;
> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> +       qcom,calibration-variant =3D "Shikra_EVK";
> +       firmware-name =3D "cq2390";

Does the firmware differ from the one used on Agatti (QCM2290)?


> +
> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index c1f25ce89bb1..6bac6ebac8da 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -2064,6 +2064,29 @@ apps_smmu: iommu@c600000 {
>                                      <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
>                 };
>
> +               wifi: wifi@c800000 {
> +                       compatible =3D "qcom,wcn3990-wifi";
> +                       reg =3D <0x0 0x0c800000 0x0 0x800000>;
> +                       reg-names =3D "membase";
> +                       memory-region =3D <&wlan_mem>;
> +                       interrupts =3D <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0=
>,
> +                                    <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       iommus =3D <&apps_smmu 0x1a0 0x1>;
> +                       qcom,msa-fixed-perm;
> +
> +                       status =3D "disabled";
> +               };
> +
>                 intc: interrupt-controller@f200000 {
>                         compatible =3D "arm,gic-v3";
>                         reg =3D <0x0 0xf200000 0x0 0x10000>,
>
> --
> 2.34.1
>
>

