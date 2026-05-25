Return-Path: <linux-arm-msm+bounces-109660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YArzODhLFGpeMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:14:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 855DE5CAF2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 442CB3014C23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2380B31ED7D;
	Mon, 25 May 2026 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kg8ItYbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdeWFohV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25703839A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714862; cv=none; b=mGxaCWKI1RS2zWGImluukjxv844HXTMk1rDkkCSdndzI1/+e4DDdN700MNqfs9dewnEc/Z5a1NBeEWJhwxn3FVnbP10e8rdVK0jBsCbFIcOCy1FkGYjC3mtpX9quZNz1o5sUqdJmpgjs8xoTs3Ew4WQreeNfpExf1WbKMVc74SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714862; c=relaxed/simple;
	bh=qE5EJYc1DlvLU7oXvi03MMUgVrP6joq6NrvGONO6KK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTTgQQDvssLJY6BK6VZ1LfqShCBK5Nt4q/3CjHz/RFUcF3YPg1WQMGMRg/xTTdQrLXq8tgtGk6QY0BWoCPjx8MRX9yXuXpQ0afIqaIixe98bq7eVzT46nIgMxEAuHJcF7x+IionqymcCeARURn0g6a7tdastptFB+GtrrBlpkAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kg8ItYbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdeWFohV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PD3ZLC3603993
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6b3DrpErweAr8LUzJdL3m0TUMj29KLE3BG5Cv+ijrck=; b=Kg8ItYblBODUolE/
	exqk3c9YhXQaEglM3cSAlIMksEKTE+zu/vPxxn3Ma9YcqRSLnQsTHFAFvj5ijt0r
	zHvzzpDuxlXNBKQfy0PmH3O0oRZ5dr2qGZaVX22AmfZ0SVGTd4mpvVOAgheF66+Y
	86V6KX49y6GkJ+TBp2EOo/4OdXAJzMURGKhgPAdjkBlOfhT2QTUrmDE+Ef1oQT5I
	67QvZRFWRVnyzo6FDEBB66v4fiverOsksZFYvgkLAKfJPyQ5FDzEKyG1QWNyq9jd
	ylieoyp68CzThnul4lub+/hRBYbPM+C6WCXyUNs6t3joKGN8NM1HjqyRjGvfyQNg
	OaOUeA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqg1ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:14:19 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5752affb36bso814554e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779714858; x=1780319658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6b3DrpErweAr8LUzJdL3m0TUMj29KLE3BG5Cv+ijrck=;
        b=PdeWFohV8gQrTB0C4N4cn1JXGhcAL26wMfOGBJ9Be2xDKROBMDkfQ+EgtSJvrXh86m
         NNHftEDX8o4j1rPu0tKW6R4/u5pzVDx3WmTONAhb3IhZBXaWA0kEvjHVJiacn9H77uVT
         mXMFurem4poqi2afyplSWdhp2Ov/boYfit5699y3od3uUykxMIg1dZdUoimjpy5Wa83Y
         wMEzMLVGDptSGMdY2z5t+z1X5XAB2GqrwqIcpsxYT6giBomhjkBrTFscUPfQZ9nqBeoH
         Pnei+uX6C1ZO30jhz1myU273gFWguQEEKlZBA25fKdsUyuxiHxji2AtyFwUqMIsxR/jS
         qwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714858; x=1780319658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6b3DrpErweAr8LUzJdL3m0TUMj29KLE3BG5Cv+ijrck=;
        b=mtjCSiZIvFbTuSPkLZTneoDsZxpeF92NeFvOP7o/emI0ems8XLQi59azmQOvqYXexe
         kq1+wTzJcTFbPrjP+CquSOE+0WAh3dHlaOe3fYhiagf5Gl4k1KqSlyfC6lFxP5QZTXy7
         oWS+YQ1h/OqPgcXjV4KhGi+QfxlirtOwipek49mZ2CE/zrH0ug/JJPyirGxiFuozL5fC
         5RXb0dgZvdqfejnl5NuKSR+nR/uS1iwBUoPK4qe0KBLnW17yOBpmydTrUPv2YAmklzeX
         x5D9y9mDtuzyBh8ri1OTtKz6N7RA5V55vfnU6RTx6iNCBKQ27KM4s3KEc09g70o6OMeM
         Bu6Q==
X-Gm-Message-State: AOJu0YzZYfuptl3kwwBCetq98L2TgZz2ZFx9ZGtO87adPIFD0wdXPSW/
	32wiYl2VHDfsAdZ53Ok8xL8T9ZSAFaHo84YHU0n6WX9QWWANPVuuTyphPWFeSj3dUFSenQa+BJt
	HNZDoSdbTNSZehIF1X7CIkUNUAP2iWfa9xj0SA3KL/Xt0cgk8TfQa0rEQsnalf/XSG8TkhIuJVp
	DX
X-Gm-Gg: Acq92OHfQjLsL8S7LZsm+DL30U1SIXK9V+jVsTh/JLVli6kJDSRgjtBCi9H0NsizBGk
	9127MXYa7TLQSiwtpscHguL8BWJTH4G5QUzZR/zPS/+Mayvc/ZJGn2th7g2+kAmZJA9Basg64Lg
	Bkvy+/dVyQhN8jjnBZ73Ovm8t585+OHfNNoBIp4TWxKPEmxcvGvf6DG+FqlgyxUAEHJUKADbARP
	rh2AX0nJ17/Ccq5nqdh991fdjSxocvvdWgHNH8v4XkT4U/1FOUgKS0WSRvGU7pcoCu9CNtFsJn7
	qif1ehN1PSWaDrDfnchlxNkQQ6iqwWtry+feIXkLoEbTphvsJKxdiFfm4uN3dtdIWLgcyjyJe1K
	Nk224y4s8rRlupbm4RYWqcbH+o7lJgc/u+p5/oGapomX/Ww==
X-Received: by 2002:a05:6122:2ac3:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-58663e43d1dmr2314192e0c.3.1779714858168;
        Mon, 25 May 2026 06:14:18 -0700 (PDT)
X-Received: by 2002:a05:6122:2ac3:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-58663e43d1dmr2314168e0c.3.1779714857596;
        Mon, 25 May 2026 06:14:17 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bd00e751sm3915244a12.27.2026.05.25.06.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:14:15 -0700 (PDT)
Message-ID: <ad5e2d91-6166-4fb6-a9da-1464b161da24@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:14:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] arm64: dts: qcom: Add initial device tree support
 for Shikra
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a144b2b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0ejU1cMun9qC18S2p54A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 5XNEmtG0ruhxzU8-qDnqmfVsxnsuprB5
X-Proofpoint-ORIG-GUID: 5XNEmtG0ruhxzU8-qDnqmfVsxnsuprB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNiBTYWx0ZWRfX3N+yxKH4LYF1
 zSevl6skQh6YvxIw0SneHJgy48Vu4iq1pULMK8ntthGzy4mesVLmF2WCOOqOIlvkzu2wRAIrIn0
 KAqsgDde3v8kxiJmRCNkOeBOJpLNO3Rsl4If8vw556TEfg2jkhA2gQZ+291yHONRc4tfWLBzImG
 3JUBKPpoVyosl1Ch9it7uHOqKZp6nGo5JiSa9sMFhVprIo/TrRqR8MI/tDFpUjn5TQpQtddM7b7
 XjJgI4c1B9Q7eawcKR5k8tj0kQqpq0Rq+Ubzeo6SXUQYYiJmuVOxHqqA+4N6txJ6Gamiek8aX/s
 RHWy8hNbHYvqxn5AEy7EIzcczX403alxx/p0nlzk8sP8ThjpAunbkUvRRguyRhMU+eZk0mGiVcQ
 RmgjkqAg6PNPvsUQU/CaCr+SmOZHyA0PMl7yswgydAXucPb28LR4PEDwKmA+wkVZpzHSk4uhXqR
 Xm8C0u6SdJWKyB3nfyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109660-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 855DE5CAF2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 8:02 PM, Komal Bajaj wrote:
> Add initial device tree support for the Qualcomm Shikra SoC.
> Shikra ships in a SoM form factor; this series covers the CQ2390M,
> CQ2390S and IQ2390S SoM variants and their EVK boards.
> The series adds:
> - dt-bindings for the Shikra SoC, CQ2390M/CQ2390S/IQ2390S EVK boards
> - SoC base DTSI
> - CQ2390M SoM DTSI with PM4125 and PM8005 PMIC regulator definitions
> - IQ2390S SoM DTSI with PM8150 PMIC regulator definitions
> - EVK DTS files enabling UART and eMMC on the carrier board
> 
> Note: USB support is intentionally dropped from this series. It will be
> sent separately once the USB driver changes for Shikra are concluded.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> ---
> Changes in v3:
> - Drop USB nodes from this series; will be sent separately pending
>   conclusion of USB driver changes for Shikra
> - Fix CPU3 reg address (0x300 -> 0x10000)

This part seems to not have gone through (have you verified it at runtime,
e.g. via reading the MPIDR_EL1 register?

> and memory base (0xa0000000 -> 0x80000000) (sashiko-bot)> - Fix power-domain macro: QCM2290_VDDCX -> RPMPD_VDDCX for sdhc (sashiko-bot)
> - Fix MPM interrupt number for ss_phy_irq (8 -> 9) (sashiko-bot)

Hm? I don't see a 8 or a 9 in either this or previous revisions

Konrad

