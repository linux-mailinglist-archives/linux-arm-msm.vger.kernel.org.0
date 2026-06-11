Return-Path: <linux-arm-msm+bounces-112747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i5ScFPSeKmpMtwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:41:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B7671797
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:41:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lAoW+kxZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ccRWLxlL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112747-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112747-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 544543061039
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C883E8340;
	Thu, 11 Jun 2026 11:37:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263E3E7BC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177857; cv=none; b=pe3qagYcx0NELyD5X7U0sWCFnrMuUoZsGfyswSJcMzSd/oSmQzZlPrdnStTUq80rGjTW76EYk05c9Gmkj6wiJ1qLotFZ4jMajvbwIrHIUZPIBOAoslcl9598uAk02C6VFjpw6uahLdy1oDE+1CzOWf4kt8PX58uAEYTgTtmbZCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177857; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8pnFMefDt+VxFPbQLqfi2rJfcS2Re0K7n/PNLHkbtaGwreN3/2PRmPYQBj9r4jW3BifMT/lSGMyjHhiTmQKPGDa831F5IpKYxVqzrH2OP2ltbjKS7c6oex+MQd4Saa7xe015uL9dlONokbcxT2nHsRYDbwuB96q2DHGqOa1tl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAoW+kxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccRWLxlL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xEV5263737
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=lAoW+kxZvXt5xy/h
	2DSrQlEb1phY5f6A8ahLX3t1qHW1H77WOqnye4m6zaLb39aRzZ7fyRPTLAJ1mhqr
	am7HdubOzve6gbcZE5SAtj2sTk0JTe/bdEKdxmQ10w683bwz1falnnF+YpuWW2mI
	NTVZ2u55qtDOxCy9yqAP2gzmgFrNagUO0fEsoML0Qvoab8at6BcVpq+17jYhyusS
	+k6xsJH2ZRnic0FpIbWQlDJrPwMmCKLyBZ3QDt38ifL9f/WaK8/gLoaaVrmqdGKc
	SbbByMIrJVh3JCT/Ksha/hxca/Sg7DAw5VxkfKkAL7QeDfrPMV8uZyuxyfnrXtSw
	grIsGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu5va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517796be724so16384191cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177854; x=1781782654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=ccRWLxlL5wlxqwpLgaFDr94zottk4Xh+8VsRxvpHT/rlMO1co7LiH+CMZijMu84qH5
         w4kcAnsq8Hp6Sss56O8HMUIDlPlJvFJaculPot/WrArfsUeFe4w3alxM334tuN5ye7y0
         FybpbL6XJ4b2My+OUnmX0oBO+uiTm7dXYXS8R2Kn9Ol9LF1IRmrHKDOoloCZzsIstFwN
         mRRPlXBH4Td4IHDqjuXvUw0FD8Y5evW8PG19DaTInBna3q6rBQVUX2JwVpqkXy/TyA5+
         IhSsFIqPuXc1Q2kA6NwGLJKhZXHQYUcUwdLYbjeFAKH4/903CPFznPBMfQF8W7x33RtV
         QcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177854; x=1781782654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=lJoxLy1y83PkrAJ3MglBwoW9+D8G2CAFBSNDV4R3VpBQ/pv9kgNn/VniV0tmf3p9k5
         glrhBM6C/5l1kYZIDNvvlvk4oeCWtKXFK0JFStkfRzOzxcl8F4zaECiV0t73VSQ+itDh
         WK59XseHEwc7pIKCJvv5ln42W3sX7g+3wZn2E2qLG1W2F3u5vDpbF9FSMakkswNSAFb8
         Kin2kRx2IsL5BQ24JbX2jkaKDT5jRv07EcZnuYcWMMjrMHnsWr+GqCIcIdnV+WDjYc2+
         qhxSaR/V6QZu4mkup2OkD6fyFj0zIBS5n2zAtqGSFWFNYXLb2bxZUl1WhBXAy2gnW27T
         yRmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/l4w/3GDvvYbEB9VVjXCoNAGS8TfLq8KYCcuih2cs+xGob995I5hr382mk7mtQResOU4c5IkWZe+Jjn3nP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5NIWgCxiF9/Cc5RKlFkrWT6Ury6dki6wJBfakYaTPh0RSDKxj
	ng14ksOFRTNPoe2C4tGZXrtb2p9b8xoGL0UWF2SZyJvIbEkE5UJE1FpgxWJe4UbKkil9+QCNFxG
	lBPkXk9BymcJXA8/sZuobkSbeI5uDsgUWJ0XCLAiqOC3YpmyRflruxL0dvEtnhQTKJHSN
X-Gm-Gg: Acq92OElRfLkhOKBYRQicM+CbNuD6yIdFFigl8OJI3jfJ/vzkk94rrcVwHUcPKMwN3n
	R9AJ+MC+SEQCdlPxSsDoMAB6BsHJaqSF7X60uvxmmUcOMfBuwBe/feZUL53i9UJR8hYhM6f0u4I
	YoPReUfLpLTQENllSSqPOvDEc62O4+pnxGlVaioFpCTFEtxhowEPyeaNXyTQkU7ohB8GkhXlFyq
	Oemq3rAHcYJcbhbGakFnMm36KebZ/7zC1OcMnT+1l4pk2GONdgUbJSqSZYRTqW1c9buoHXWrXO3
	xrAQ0UMr5LoDp2AXFJp5RC+ch5QrAgGgEqtZmQ3eUCaZplcXnyJDHB9DsaAm6fTVpkQ6e5kjaeL
	dUkovOFKxFEj9QYM3hylLZ6miStvlvEpaCBaQAbPTRK0/j+HVEM3BZOzv
X-Received: by 2002:a05:622a:1e8a:b0:517:5cbe:515d with SMTP id d75a77b69052e-517ee23455cmr19317851cf.5.1781177853583;
        Thu, 11 Jun 2026 04:37:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1e8a:b0:517:5cbe:515d with SMTP id d75a77b69052e-517ee23455cmr19317491cf.5.1781177853045;
        Thu, 11 Jun 2026 04:37:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb5abe4a9sm53516566b.46.2026.06.11.04.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:37:32 -0700 (PDT)
Message-ID: <9fb5cb3e-53a5-4ce7-af3f-e4a483b39db1@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:37:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/18] arm64: dts: qcom: qcs615: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-18-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-18-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a9dfe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX2/tXtGieTTOx
 JJws7s2lRYpOHMDFKwTzmu+RsMt8k3XgABlVgjR68wlIzfy1uhQFUCVNjvbOIrBVotOPVx9QcN2
 s2/pDzt24XV9eNxCHIPrOWAPo5EGJvQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX1ACpZLdba+XJ
 u0Eu5rWe9eQBGdriCH8k01yca7wkwVnV/FA9BIR4ZBlc8TybdeEc0AAyMaB64dRXw6OU/uYyPoz
 sWRpiFZg31B86SHLk/LCVEZQdnYySL/abVntCM27nj+RwCCvQDRNF8ZvrwEYCqko+36+JVQ7/Q+
 /OTfn64pf315b0HbTav9VPNO46PQG2WeXthHM0HXQ3MuAc8BT4tSzxwdzlIsLhOuBFXjQVb7B8M
 HRz/C2c5eE6q2O8MmNGLqAJdEXjR//9qbJ7CLSSw0eYPfzkTk7WVqlSp2ZhVqvSaDIoI0LAi6/c
 T2I5U82lMHxb48poiCtMkJ0ibE6DpOAQtV8r/LVwFnE3BDRLsMToaEm5q05wXJ/BAmKi1/ACCku
 n31m2Qxt7MHLRq6tnU1RSJUZCKPDkUy67dv+zGBZkGF9AQ85RE/9JdzF4dTu7x0hMyBlOCNpS/G
 +gcVWxB09ssrGttPhmQ==
X-Proofpoint-GUID: buegK12BvKcPGhvWbSDwLfhzzrQ3olnO
X-Proofpoint-ORIG-GUID: buegK12BvKcPGhvWbSDwLfhzzrQ3olnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112747-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F39B7671797

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


