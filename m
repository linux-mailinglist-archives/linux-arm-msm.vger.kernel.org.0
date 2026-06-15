Return-Path: <linux-arm-msm+bounces-113156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yTimNCnXL2oMHwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:42:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F92568566D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:42:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FE0O22jw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ijfl9d3E;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113156-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113156-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B50C4301CC48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5511B33DEFE;
	Mon, 15 Jun 2026 10:42:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E9B33A032
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:42:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520160; cv=none; b=gvYZnuLpcPyoJdCPZY0B2RUUxZLK597/OfL7G2YRiawUiNJF/Z0GxiC9lDDWvfZGbGgME/CQGK9bBwOQ2Hn0n0vygE0hPwcTmt1OSM1sz1PC+y6uYD25PqyeIx3iqKgDEYTnWihuxQ1Nb79y7RK6G+wBpQPpvuH0cDWJJSld6Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520160; c=relaxed/simple;
	bh=PFv8Bc1QwX3m0kl0RA/mhRJh7I4ymyWI54an8mkYJ5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozu/t6vLMaQk/WMEKc3N9YMCxDIeiUiVxhfE9OnZyvSnNNV0zdeQAlVSd01TLcNUR+dKVW21TKYn38+rtgReTJ02Du/Py1IoUUHgUlVUJodQRQSg7imXlgEa0jdfhXqQUJ+UI2tG2dTq5Z3uyV3+aoNw00+MwfnKkuaAJ3t/GH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FE0O22jw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijfl9d3E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAMCAm071302
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoDrHo0nAAL3euwZduxOxWenFYYl8H0QyMF+HqYIOj4=; b=FE0O22jwl1QN8hIZ
	DmjPlCC3hQkvfTaA2H6gCjt+UATlBBsb3pfMkg2pQMM997S6JuGnbRikkHgVxIDa
	hwsMIRLi/gES5do6pDcVbjDW4S/1mKbEoN28be/dUT5uh3IQzYx6hl5TIKNm02fR
	Zc1dng4tQa7KCDZgxXiBSPvWviLFEmn/Wx/PUORtEkJkrN4o3MXVFGv8tjCpdBDY
	nG6LcHOrXe5V0W8R7/T48Y3WjNVA7r5BmLign8SaMDNiAogbDOPEdGtj4mKR4hGJ
	R/yWXfAVbtM4RC3T416GDY6x34c8DdfUp7SWbqDkelr4J5Am5WIZyTc4HIhhUmSo
	wuOgQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx08py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:42:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2b64850easo15104875ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781520157; x=1782124957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MoDrHo0nAAL3euwZduxOxWenFYYl8H0QyMF+HqYIOj4=;
        b=ijfl9d3E+ISbC3tNnJmFbvsh6oaz6Vw9BqBqTlrXPGI0b2lTHGsAQJXcSzEEaNb1OT
         +PApx5lk4skIAVPqBSo9cUpD8FsIx8cULV6kiJcPZvvkp+6lAHYv/AMVOqT4DSDWRKfY
         QIFagz8RigiaeruQJCKA8usKhBPtSCM+xlsKGUzT6eLLusS6G7lmyQRMiHPMymebR5Vb
         p2r3teXMSTwOzrvK7M0lv5/AV2SBHfg1v6tG8/hegZ6VGjZNkZUcKlvjyV1faqbc4d/Z
         4YsdGUIZvIsYiXU8xIgP3ec1raQoDiGQSEhAh9o9y+g0MDfOImBGnKTVYEjQKhEkPVAm
         B7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520157; x=1782124957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoDrHo0nAAL3euwZduxOxWenFYYl8H0QyMF+HqYIOj4=;
        b=tNU+H2BGZbROONxMApJ5+y12i9MrIWQ81NIU5i4gDTQkLVsMa9GPkL5Z57ZmfThTFY
         eFSYz7Qg9LtwboOSQU/HbvvfRso70SNPJikgorrI4XHKtBiGJs3HXRhhQHmjpGlKJVbi
         h/1L3hx8k6AX1JSrRBgq6/K0PuSMOcRefBlEsoogxM4MYm4ct6wMJwtIk0XIsnCjv+gN
         bW12HbjVNR5pTTU8shN7+emyA4nlhTotfMKNla4L+hb7fDdvXaJ5NvAMHcRXPOt/2GTt
         awO49Pz4wdrvF+Wji3wvYRcuoBYTOqyelMhSWRUEIYf+/nI0u8tP7zWYG34lnmGgc5n/
         Raww==
X-Forwarded-Encrypted: i=1; AFNElJ9uqRfHv7X1b5ZEGhqI46HGsrBY+vvW+rLPw4PGGzG9wLsDnmTx+PBuoCLBizq54SRebwGFB7eivNMmwYkc@vger.kernel.org
X-Gm-Message-State: AOJu0YxAj1n9+kOFpgY201Ag1Y04dBuO6L7hqzaQucgOGUUv2qkcORvX
	dul7FCGHNgpxlqX5bLYclvMY7MglQbGVJeza1jmx3QKe/jid+iJNHg9PpcMRZaJr5HXF6+1c2Fv
	ZZC5gnInsoXiMR/EPn+/x7uppBDdSiQmFOMmxAbX6/q/pnifiIpO0LPxoqB8TM75W3+Gc
X-Gm-Gg: Acq92OGBOBxdbkkLKMpv7FG6ERmil5KwVSXAtUX8txPBoynzsOCn4H9GIC3Auq5fwBC
	70hXlUWu7k1+08F0AnIPv8faVxpS6E9ujHP7QQtXdKBh7RXeddE3bLcngu11BpmnD9X79wzB04J
	vAmXqSCcFglvSy49gTDuUGNsV9uBGet3dz57fw54mheCW7aXss+ayaNKhWQvjmwz0VGL63w4pi2
	ffn5d6duBIB0Xf5W2MERCkoBloy386IkmaI9TRtWonyjPvM3XUnx2kaED5wAxmHy+pNAmkEStCu
	8XwPLcFBxfhZ0w9oXm8At2wOPtITivxpUthNifQyyCal/CNaFDuraSJRMqFcgyywH91JFfNigX1
	AzrIqB2TMtDGDH8Nl2LbsPP1I+M0rOU3Hh3jO8H6nC1BoRA6NqJGGhA==
X-Received: by 2002:a17:903:2acc:b0:2c0:ab92:584c with SMTP id d9443c01a7336-2c66426264bmr116471015ad.25.1781520157225;
        Mon, 15 Jun 2026 03:42:37 -0700 (PDT)
X-Received: by 2002:a17:903:2acc:b0:2c0:ab92:584c with SMTP id d9443c01a7336-2c66426264bmr116470495ad.25.1781520156732;
        Mon, 15 Jun 2026 03:42:36 -0700 (PDT)
Received: from [10.217.223.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm95512865ad.10.2026.06.15.03.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:42:36 -0700 (PDT)
Message-ID: <16746ff8-4b33-458d-9c41-3f43bdaca4e6@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:12:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
 <184dfbd2-4781-4dc2-9165-66b3617bde0e@oss.qualcomm.com>
 <ai+x7Ovc9/pPTu9f@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <ai+x7Ovc9/pPTu9f@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Cf5l1TIkPWTSOXKzpj37TnFnGc-8kZXy
X-Proofpoint-GUID: Cf5l1TIkPWTSOXKzpj37TnFnGc-8kZXy
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a2fd71e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ENEOTGz1k9nZZJ794AwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDExMiBTYWx0ZWRfX89KtMOPXmkgK
 27htC05OiBVuIpadKSM2QUHFOKu1O+tH7GkEbFKV5Pee3y83d3/mt8cfwjep7PZ4HSQyLLPwPUO
 /ErGLbtD/NuDlehMEcYAi090+2CQL0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDExMiBTYWx0ZWRfX/gCehRK4ofEE
 BnAhdEOIh5sg13y22YLdcwi5e8CfPliA7KfxRue/0Q4kjHDhAHJvMEYpMgKKfmY71JFywiHYiMX
 ++sII2/Hb6Nf57Gun/y0w/0tuRAxClz1M+fJw46KVjSkEUdFNDOUDPdzkZsmE0f0FkDBxPckjKv
 7fZW/3vUQ4EahpoZywi3jN9CISQ+xVf9quLRRaMX2S36IaQh5kapSUISLXNhyBkhALUQErl3Of2
 ucocsmCAOM+x1IMe3Rdjal8YAJirtUPEK70+Npu89ncIsnaU1yGEFlACl0VrzqxDZGUbc8Neqh+
 8VG/z2G9cycXFbALEF7cdX7jX18tDJ3k2HSgWGXt9IBynerAWYZvM8XpcHsX8YY3Vy+Mg6mCM22
 caJksel0iQ/SewuoGvEPWir7T1NiWi0kJE7kOVB/OyATczWdaiV9Mmgt6UC8Gh2u6hw5UCJNBA1
 n6Iwl84SbVDBlUtE9fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113156-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F92568566D

>> To align with sdhc_ice(as label name), can we rename to ice_sdhc_opp_table?
> 
> Do you mean sdhc_ice_opp_table?
Yes.

-- 
Regards
Kuldeep


