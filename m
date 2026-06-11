Return-Path: <linux-arm-msm+bounces-112808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6NHmHeMXK2ol2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:17:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7A26750A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:17:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WGPd0WPC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hVNfFLMt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112808-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112808-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3451632CBD2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0121E376496;
	Thu, 11 Jun 2026 20:16:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5AC39A056
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:16:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209016; cv=none; b=h653KI/cAWSKUSMUPs3+KAWgWZ0DSogK421I+ZOwcPiMa9barriEWPF4Mhul6Y7K+Hn4kvVuzNV4J3tHjGN53KtRMr5EiL2nzHfvQsyDTtMx38qdUGuQCvk9CH/Gvw3rS8/jwA94o76mjLBbCMJatP6CCOXKnwnx06hPla4p54c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209016; c=relaxed/simple;
	bh=YJq0j55CRO8wxi83erJLxi7d4LJ+0Qu6CeJvyMiZr3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emPrQe/pzpcD7mkMl6Enp6P8oosKxZ/PCyK2Ta2XY2QEEb/Gu0VvR3P7lby36T+mGcB9CW/d1XSRT/mk5zFCPniXpC5qHNEkyPso0OAQaZfJQP8h1p9m5AdfFKadDsbINmnj8gXM+NmLdMI9y3KtDhqWAOYXc8/y9rCK8zOlU8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGPd0WPC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVNfFLMt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3GRC1426639
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6SCinHMjZ2J3w4Roqcjw2GQM
	ab17NAGCM+R3vMfhRW0=; b=WGPd0WPCoAB2KyheGqY3gMf6zT9oH5krcp4I+rwP
	09iHgrfa9eA381ElIqjMhyJJQSW8yisxrLMi0h+lyTErbPgKUtz4TZrNDlHy1NvJ
	aLv3xrqVhoVbrD8lVDaMqU1wtW/RWh9oPZV0FQgPddWSUXzY9mWio95mvLpp7//3
	m0yiBi6q1/rHqPdJMTs93UuOmc0kskgNtZM2Py8t2ZJOyGKvwS5XaeQ6vNODzKjm
	yW6Ou4qlAwYMcatqRYSxPxzYBpsXC91PcnutgIo5gRAvr7EPxMUzr5fDobnvqiJZ
	SCyead6hSu91UABaRt/ypq4GYKqRWZNp/SrIG5fR7K8VMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcghnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:16:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177bddf6e0so5657331cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209014; x=1781813814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SCinHMjZ2J3w4Roqcjw2GQMab17NAGCM+R3vMfhRW0=;
        b=hVNfFLMtTUc7/NBpiPe6JcobiGQ3Atjmx0M+2wjHYcfNp46vzxdzbBFoFhSQf5ETIE
         WS7i+GN9Q4EHSNjTRWUvFl68c4zzik3K6Aphb3DzoAXjkdkwS873w35RkCfYUhpf+kH5
         o+5T1QEZw4KSx82W6yNlsU2fRrJer6qu/Spr+ZgqLxR4XR3D+qXogg4X6nnAvIzMuaeK
         jFCdfIFMCWQJ0N/uj7e5Lral4aLWZNy7I6TGJxV9A+ADPlZfbXJ/Wi1M7WY3gq9kGSUJ
         Q+Wm7QtE09BFJJpcLGbeVMXTGHJn64xLhUDU8GeFYfafYqdQ7+oxkMMRiZZhzdIArMv6
         hejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209014; x=1781813814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SCinHMjZ2J3w4Roqcjw2GQMab17NAGCM+R3vMfhRW0=;
        b=fMPG6J3t+CZW5b3rhLCYEbA2SDepWf6gnBjVAp9Hd2DvEssGuPSXXZZ2oCOxYzg2QR
         TG2qHAVe7Iol3BAXZpIYac2cdSUZTA43df2fzbnmXD35WcO5CJJHxENJG7YuOtBoc+7q
         SJ8Cs9Hfe14MBV3WzkOeZm/XZKRConaKbGxqjN+MyQGqAckmFEiMVSSCO88fH+n1wGQp
         HJnTtU8ElmQ7Oa0IOSd5XmiWDWGP2b8il3+V8p/5TE4ejCWel0l6N8oUJvssFCb/VZ2p
         Qy89F7nySpONoF9D8SHkHqThC4JkcxLL1lJfKmfMjUKlJm1Ynt0ffafKes49tY2p0l3p
         QmMA==
X-Forwarded-Encrypted: i=1; AFNElJ/Zb6EV+dPSCyErltR0j+tvs3qzbI8kM2zyD85zpTHgy2zsczWEWZIzGXSFVUsl1zOasDsP1OBRjRPxl2f8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3xTTpPLZOLv3va/p+44gma5JS/xcQJHllEJfupebC7UCy4Xll
	VSmfEq5Gz4KnLqA9b95N81sdMAPPixlIbmoWdT3FJKXDm2hF88kWWdgpqU6ypbaGUyWCIv0Mo6j
	hUD+wurbcQGdOJEXDqkMTPisVL0vKeoNYnTNh2nzEyxB6+L9LkaKClqcxQRm/7IadfOJT
X-Gm-Gg: Acq92OHfI3Z5T4IWnLNbhJxT5QOSoQUcfU+z1HB623/OrYnMj82W6xqY6pp6yGdEXNx
	cqMFxE7w6rFZz1bu1TwJ0Wzv3MPPB2E5nSP6P4PAgFBqvP/oN2RVYAd1kbYY+3HmkvS/e3l+qr9
	BpTuEufiekquunBEmNRsRiguhs7CqTKwknSy0axlOIwD6BYxRPtVcPV48HpBrkHWd6KNw2fwRjp
	VfUosUz7a44W3oHo37lmWp/yTcXQ0rKkpLpvjzeMG8uRzEBPH6D04bPtH7Ek4eIhNZ4Pl/6xO08
	EsD44GLIWJnQOf5/nPuVvgEqYPwapzhlbujNyXUehZkouSTp7A6mEz7Ze0QQ2gDJ8ZTmWRxfoue
	C4k70Z16kWH5VeA3L67B07aN4b9lZky4adzo9gdZQBrduMZCyJTL3ZYpkDBi23HBr+LTECdfUVV
	nrRzXU0NjOlwTZdRvkUgcs84D1vYuW69GeQ24=
X-Received: by 2002:a05:622a:138d:b0:517:9407:5c38 with SMTP id d75a77b69052e-517fbe61614mr3716151cf.24.1781209013582;
        Thu, 11 Jun 2026 13:16:53 -0700 (PDT)
X-Received: by 2002:a05:622a:138d:b0:517:9407:5c38 with SMTP id d75a77b69052e-517fbe61614mr3715471cf.24.1781209012969;
        Thu, 11 Jun 2026 13:16:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd97dfcsm114395e87.73.2026.06.11.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:16:51 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:16:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: Introduce Shikra SoC base dtsi
Message-ID: <zzveallrfaeaclkes4dvexcxacyyew6mjgar5ctmhevh6ld4c5@caxx3gdr6g6v>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-2-103ed26a8529@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-shikra-dt-v5-2-103ed26a8529@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfX3oQx7gKCjBgf
 Xw4XUJ18TPtNosXFrEJ0ieo4UNs1dD1Gb1HcgJDIuNG2IDwjZtXjZTD+mxuaLv7g/emuytlcohM
 NXHB3O929y7n6yPdtfUUIji1ThgCQ/f4zlc+TKeNU90p6I3duSBXcVu+wq55p2Ur5cTy9ZSMXEf
 hN7ocuJkvDdfmE7E0g1iyG81PqQEYRoKDOraQ75X6k/UvkpKYRqANMeWKX8BlKEWFTSMuWJmq+q
 TNthU3hEGfIjUJBF7CEesbvTCX1vv0UMzfDvXxDQI0WWnS21oMrWZaD5be4bbQnGHsJ6luAiZGW
 hry6VcdXibz4KScfWrJLi+Fl0AeYssedBvvVKyb2D5VNxGeHad0EEEm2pJVk+m3VwvkN7bAWH4v
 47qUeVV4S3sIBNY9aQcg9ij+KPQaJdLBuxQugFF6OCYKxmlltUo8RTdqHw6u4CqDeuUxLJ4pGk0
 CY2hl9Hez+q5Eda4JtA==
X-Proofpoint-GUID: Wf1mkYvfCxDNKFIA4OVC6jyov69pV12C
X-Proofpoint-ORIG-GUID: Wf1mkYvfCxDNKFIA4OVC6jyov69pV12C
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2b17b6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=nLTNWNGuSljmtZLY6HsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfX0US7lKvQU7hU
 s3WdYb2jRJKfCXS8T7sD/SvIEIW1Qc2cFUi+D3W1ovy19PjwCkdAsiCd1z9BoK9ceYI2+e3Y441
 AWPiqpQe3M69TP6fFJIk2gkHYj9nqfE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112808-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:quic_mchunara@quicinc.com,m:rakesh.kota@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:vishnu.santhosh@oss.qualcomm.com,m:xueyao.an@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE7A26750A9

On Thu, Jun 11, 2026 at 03:40:09PM +0530, Komal Bajaj wrote:
> Add initial device tree support for the Qualcomm Shikra SoC,
> an IoT-focused platform built around a heterogeneous CPU cluster
> (Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.
> 
> Enable support for the following peripherals:
>   - CPU nodes
>   - Global Clock Controller (GCC)
>   - RPM-based clock controller (RPMCC) and power domains (RPMPD)
>   - Interrupt controller
>   - Top Level Mode Multiplexer (TLMM)
>   - Debug UART
>   - eMMC host controller
>   - System timer and watchdog
> 
> Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Co-developed-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 842 +++++++++++++++++++++++++++++++++++
>  1 file changed, 842 insertions(+)
> 
> +
> +		rpm_msg_ram: sram@45f0000 {
> +			compatible = "qcom,rpm-msg-ram", "mmio-sram";
> +			reg = <0x0 0x045f0000 0x0 0x7000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x0 0x045f0000 0x7000>;

0x0

> +
> +			apss_mpm: sram@1b8 {
> +				reg = <0x1b8 0x48>;
> +			};
> +		};
> +
> +		sram@4690000 {
> +			compatible = "qcom,rpm-stats";
> +			reg = <0x0 0x04690000 0x0 0x14000>;
> +		};
> +
> +		sdhc_1: mmc@4744000 {
> +			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
> +
> +			reg = <0x0 0x04744000 0x0 0x1000>,
> +			      <0x0 0x04745000 0x0 0x1000>;
> +			reg-names = "hc",
> +				    "cqhci";
> +
> +			iommus = <&apps_smmu 0xc0 0x0>;
> +
> +			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			interconnects = <&system_noc MASTER_SDCC_1 RPM_ALWAYS_TAG
> +					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,

Please align on '&'.

> +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					&config_noc SLAVE_SDCC_1 RPM_ACTIVE_TAG>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";
> +

-- 
With best wishes
Dmitry

