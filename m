Return-Path: <linux-arm-msm+bounces-91356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKr5AOG6fWmoTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:18:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DACC1388
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04E68300132E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061F12EA169;
	Sat, 31 Jan 2026 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlYxvB0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRGTZIe1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D751275AE3
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847517; cv=none; b=sNRgXnSGPjkdmrXtqybFUZD719oY3QewBGRdbGapYI5UbpKxScrCcNk7f6z/arLrvB/B2Rb7RdiEYwa0Ps2w+/I06jn8oSHi5L/cW4EYJppFFM8DnjqOoJO+4NW95LBM8H2kQS4y04V2kuS8/DjbYYbEllNjx475DTrn+LISbJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847517; c=relaxed/simple;
	bh=zYyXuAM4YeUBOzV+q5z2UMblwbdeOowvr19qcaF/ioA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cA0C23xhlfLhBURkTbeaMX/rgRDq8dGmUzxvZhgiwRp0ttM3YdpNbkTYXfw7sn7IwSw9Q5lb9fIPQxcsCU0hYumkOeKkbqhS+jGGuqTxnwxQV3eu9F0ART15/IKtXpJ6NpGb2fnt6DTgQUGyR/zswyklJjMMtHfGvB1bq0KdW8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MlYxvB0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRGTZIe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4VPm8867084
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1NTPRQF91mxy0m1hC/Sthd/K
	Nv2hoMq06wZ3tlCA/rs=; b=MlYxvB0eIyWPtZBFDFYj4xBXO4kLCXlnoafTB+qX
	65+ncMYWiF+HDT/8ocveYZtG2nZgiKSzROWfkkK+yO8ETm0/Zg+6DHKSYO7uc0pd
	D7vF4Dxxw1B5fEa5qw9gJ8yZRaLBfd+6hgBoAoNmZOHPl+s4UgA9Y3zfi9PPvhGj
	xNmflrMVFUymWVv0xv/NhUp+HC8dUWDPitlZX22Ftpvp7tbBQDouEoTrO6psL/Z4
	zw1njtTA8OMdG4XbhMhBvNeDJhZx1gE+/y1rzhKhg3nJ9Y80QJKKNp/ivOyHcR91
	AK1Jb0q98rU2CrzUm6veBvE8Oo22tKTwLRyTUgZwN85uEw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1asdrfgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:18:35 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5662a21d35bso9330335e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 00:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769847515; x=1770452315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1NTPRQF91mxy0m1hC/Sthd/KNv2hoMq06wZ3tlCA/rs=;
        b=RRGTZIe134zgBOmxLljkzP0i7OwPm9bSugQ3y1ccVEoBTbujIG3mtdTagYzV8RM41P
         +GjbnjTP70k3XB0Fb5gDO550lINJy9fYe1jqdAfakoTcSHbhtuKC8zBXOci0ggyS/8KV
         NifPpmxLtBZSRh6AeJdvYGMxFOZoXuygB2Mj1jWEHpStfno48zO8yYsRYqQDklIRuAQz
         OSJqQXkJk/p9tZtzcu0xXq+GEz3WLmv57y2+NblCMi+iLhttXvl8fylFXHT/lHBLjjHu
         wq8W6eW3NaDfUBvRYGMxT6MqcHOvzhyQE3OzUkGaDSjcyST1PGuLwoXZhVdjb2rlxq3+
         yRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847515; x=1770452315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NTPRQF91mxy0m1hC/Sthd/KNv2hoMq06wZ3tlCA/rs=;
        b=V/u8zxXDIHOreoAHKc0M//pC5PZxKX8t/Rq22hvlaZIqUadwemfXh1fpXh4yisHwGT
         jXqD2LbLKDr6RPYjd3RSQTiiVyTPugTHZDGnaozvZh8QcOW5ZVj60RWTXR7f8CLLRlkf
         sCMnSAX0rkS7UuTmD0TcJjDdrg+EcJpoxICOxltnB3c302kjZ+NlukpSTVZl0NaXIvr5
         rCAfMIP8FYDueHYQdmBXKDoONaQ/1XCTzjln2yRSntYgZ98YzeycoIYGJeEN/VsnRXq8
         WUH72/zIa+U9tZKS6WBYWg0qCYTP1mxgmcfjiXyrxS4YH6Rh5yhNq5N3NW2l2Pwgt712
         raHg==
X-Forwarded-Encrypted: i=1; AJvYcCVV/zq6SEMetRJIlKU3de/W1TNo/cPqFJYuQiPLcPqO/d92DsY4OHVbUrNvWvyqSDoB361dUCsLdJkS2X3H@vger.kernel.org
X-Gm-Message-State: AOJu0YxtaIlyDD3ZRxwUI8HQS9fkQO5U+mRbpkigGOdODXY3FnE3mGqX
	iT75+XGcuaaWObry2/Td02NtcBiaU9QWj4tvMPbM/rhIo+1K+LVLqw4RbHT8sCbm8+0TAfN3PU0
	ee3fQ3IOf6p/UlXw2v2ce2sfr+S1pvrdvkadugDeMUarVYOt3mDCogZRUqokDI3/1vVOe
X-Gm-Gg: AZuq6aJCFdnzFcTv9YBXGJ3iHGOx5taRLblbHb4S4Ls90XKmb5Qy6R6RxOJIkklmSWT
	7qSHm6i4kgsIRsx1GardzIbS/DZRhJoztIC+4wOpodBoafwEf6l5XN4vkq/vt1UTJeHY3uyrxKd
	tKP281PwUTi03Sh5cPw2GGsYOuvl6af1e5bcI1WuYmRcXjJEfoHZTftHQzyw6nHFkh3rl6deWnf
	U9AlFgtjec7DbUAOM8Wte+xDfw1zjjONzhjpyNJ07Dai5b0Ffdfcf0rMEfksObpOZw/UYXd460r
	b6RtY/jHfaSudSBSFnLgx8byAZvOnrRKORQQdfgmeinfqDyk2Y3qoGS62V5aPcPG821U1UJ23Rc
	BrLXQgavmnjx9o3v1OxEE51AAB0I3CLkrtRpRg9171f0onudTJIexTxQvWSmyFQVY9HNU4U0zB6
	aornPmSfxjV3cUwmrHUl3t31k=
X-Received: by 2002:a05:6102:c52:b0:5e8:1dcb:4dfd with SMTP id ada2fe7eead31-5f8e236b9fbmr2091766137.5.1769847514886;
        Sat, 31 Jan 2026 00:18:34 -0800 (PST)
X-Received: by 2002:a05:6102:c52:b0:5e8:1dcb:4dfd with SMTP id ada2fe7eead31-5f8e236b9fbmr2091759137.5.1769847514528;
        Sat, 31 Jan 2026 00:18:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07488805sm2244188e87.28.2026.01.31.00.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:18:32 -0800 (PST)
Date: Sat, 31 Jan 2026 10:18:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Message-ID: <5zqxloovexknbuhknbafc2trf66d6zwtvtkhjbchmbndxg2j6u@3giwqjkd2vl7>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-5-417ab789cd97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-wdt_reset_reason-v6-5-417ab789cd97@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2OCBTYWx0ZWRfX/g4aTLArJcjz
 61GhKah1t9d3cSv2BEaTCQkuJayI/FqAF+y05XkTnplfka0PtEG9qxvY1vtUm+1bUcJ14cZ8R4w
 wWTiyQZYjcLFSLJb1un2rx5R5azBgn1Tgva4QPUmQiw5gyy6GIBH7fz3AYWw3WfJuqfgYeCWIiX
 HuNH0FaMUMzdCBDaSzEXXWpQlwWdm/0yacdEUYc6cp6BfYzMTMfCfI8x3HTyBzPSPNtWWtRBoSF
 +4V8s2DASqapbrLmVnw4fEo8N0dKyV9wtma1tJCqO3T1hBgdDfS2i7Yde+tkvG5A5ou7a7Rqa+g
 3vXqiV9obDXAF5fs0qpgdB2Z/8YYwUwRVJvsx1dWLqqdoAP0wsVnTtWv6YD1mfAoT+jLSH5VsRa
 oN/t1kH5iHodMlEtLalFoJg4OIOUzfBLcm9eAPNiHFZbbus0HtutsUGSQtLAYqpmwKCKWuA02n9
 UsdVTOi/+NSZ3OcKjdw==
X-Proofpoint-GUID: sH3Hkfr6oH19bx9y9bZtNX7AdcoTA3q7
X-Proofpoint-ORIG-GUID: sH3Hkfr6oH19bx9y9bZtNX7AdcoTA3q7
X-Authority-Analysis: v=2.4 cv=LNNrgZW9 c=1 sm=1 tr=0 ts=697dbadb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gWikCEODulKzl4wm0QAA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91356-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95DACC1388
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 04:14:34PM +0530, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.
> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v6:
> 	- Update the 'sram' property to point to the SRAM region
> Changes in v5:
> 	- Rename the property 'qcom,imem' to 'sram'
> Changes in v4:
> 	- New patch
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

