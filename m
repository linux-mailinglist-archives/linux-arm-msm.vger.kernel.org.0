Return-Path: <linux-arm-msm+bounces-116352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WmpYBf7RR2oRfwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:15:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D1B703C38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:15:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="kgIK3/LP";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="DY05/ipb";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116352-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116352-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C23A3036ECC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E06414DDB;
	Fri,  3 Jul 2026 15:09:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FC73CF1E6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:09:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091354; cv=none; b=OJwCw59NznR4IVSOSqvWekE/iv19ettHOtVcjsJnBrJQHkkSdVjz0MmeF6lfdJzsB082NLYY8kYMbt7niHrDm9R+qaSSqkqHzOX9XGALsFMwWqsz5Cl5o3DazBZMN6brAbm54hzffrwwLSZKwqD8qROh9a9Z/FE7koUa8kBpAf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091354; c=relaxed/simple;
	bh=9AJ9t2zKbz3CM4OW0384dvG2q2y6xZLXbgr5QaSSAbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGVE9W1HC6d6hOy7LyWqvZrA29BdGW8ZVq1uBTRY2SsNL36br3lL86urKcNIIQHnbf3BaM+DIXjaK2kj2jjBOLoqK0zkMr89Xnl0UbMvMcBYWhj2+0N9aTqtUAzXaAQ0IN0a563y5PWww8hhwGNjpWu/qbGkgmmeGBKJe0JeQyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgIK3/LP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DY05/ipb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BNxuU3110449
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwim1m/o8/vtW6F5/R3W9M3DsGtJx+nlb8SSGEWQJDo=; b=kgIK3/LPHHkmedOb
	wG7Y3GHqjJqq9Z6+xr0WIwEi21MowgiDLDNwxYAbrsqurA3LWf05TumdIREhJ+s6
	l452JLmnBmIMpMqPPH3OFWeXSwSHYEooHfK2Pd8RSEzKRDqrdHBFK/7aSnTPUeIv
	lUu23uet3GvU3O0zD1FXbUf7hdCFOt4n2yndhHJO50eAJjd1FL6BWQRjIF3A44Ff
	2PgMn83RrRO2Vovlo36ca+zTNaOvfHIl9fPxl10j7ZVnLxEcTREUDhXmubCvBOAk
	EC49FWRBIxAVDnwAD36yhPsVtPLI4/PuqK/ZTxRodiwvWLU6ted66BPCdkT8AZoQ
	PgTmOg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eybkht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:09:08 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7386e55c63cso24312137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091348; x=1783696148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwim1m/o8/vtW6F5/R3W9M3DsGtJx+nlb8SSGEWQJDo=;
        b=DY05/ipbVaAV1BWj/5rONCobo8NxUBBMFjt/k+WUrSu6IitTHet6smFmOrQMESqInG
         46qcE1GFFFmIOxj5X3AiMuaydaCQqlYaAWdLGDJI8nHL67sKYj+MoJd2Eaec00kPRPnC
         P297Nvop+oVV4iP9ozZV7xOSlKvKxoKbSpDAPvp+ha+fhnfpjHdveSzcDN8FPGoD4m44
         yd4SEpjaCntHs+lNJ17KFjJS3rPEw0jus9teme6v/VueARCbI3WQAUXvZdgwb7d7ERfA
         k+OU+ik1VYYRWaP7+Ifepkc3JJ4oBhfLniZsjACrKF4/wed1shg7Ih3HcpOOdvEEEloG
         dxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091348; x=1783696148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwim1m/o8/vtW6F5/R3W9M3DsGtJx+nlb8SSGEWQJDo=;
        b=S8bXAuyqqzTSo+VCstfu+GUya7luDFU5xb3p3S2NM2ibZ4vBXoAnLd7TZVHvzNDkcV
         PJxrQ3cjy3350+27EA77l+0LtG9gPGj/obIOyVNSHxQ+der/sVwYI6IF0jS/xBk6z1jx
         eIW2+tI/fXm7JwSdNeo9dqDJ78IkZnQYsB0CcG6nQF5iL6YxgzJyTRfTMZpL2op53KJc
         XrT64TpPWO8dcsQpz4r7tvzr4kt+Z53d4pk9p5A7h0utZMst0KYfXTHorfww8/hcvtWC
         mAMlOgSYMg3Cx0c9AKI6c1V6Wurtb6n4itM1OZgbCtTo5xaGySSad+hccFLe9ojGJRZU
         NT/A==
X-Gm-Message-State: AOJu0YxJ9ngrPuN8MiAuGl/sfTMtvvaa6mb8aQ1tkIEuDcjaPJuXY7rt
	eVdKfRig2JwcVcewOis10p2gqOj1jgJJUy8QvCogqNTqtvKTWxmSiMrl9JiYftiE6dc6FWzL4jJ
	VeCnQZW/rw8xNpsWCYNYLoajPa8qEREsKbW14JS/6yBqhtzLdZV4BHzKex/OKQ9NY16sX
X-Gm-Gg: AfdE7ckWvlhPISiA7nm2iU6KCt4WyMh3TDZp9NYWafw68u4iLwMvn3RbTy6QFnz1TSW
	9EC0tR12qwOqHdx9EvSKMO2lhwxh5he2e6soQ10NXaJ5+yeT+TqvAtidyBpcIv9HiDpfGtoR1oY
	8PQwuw5cu+l3HjtZXVMnCLjaloqaLYYM9kD60I+vC6LgY4z1f+2To7yZpew7m8YRH46Y5f/EeNx
	caO/AVXNXPtZbTOaDdv23rGcCeQvujLgMaRzul0YR6gVvlEXnuiqlIIlGkzZ+MMBK/32lJ3x5Ua
	okC+rchQ7QsTcDBd64GdS13eoW2u3QwGjZ7eVcFehEJM+ARmBkjPSBOqWxtLUYEeQl0EEfYwI6M
	2uhVxKVCthpIBCyOH/pd3F7W8zx2Yx7i6lxs=
X-Received: by 2002:a05:6102:6a8a:b0:738:4343:fba9 with SMTP id ada2fe7eead31-741f8ffb110mr55443137.6.1783091347705;
        Fri, 03 Jul 2026 08:09:07 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8a:b0:738:4343:fba9 with SMTP id ada2fe7eead31-741f8ffb110mr55406137.6.1783091346108;
        Fri, 03 Jul 2026 08:09:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd8904sm2578a12.2.2026.07.03.08.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:09:05 -0700 (PDT)
Message-ID: <7ce4844c-8025-48e5-a1fc-4d1cf9f7917d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 17:09:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfXy8PrNfxTCdnI
 /BI3EWH1pUME+8/T4Jf44zcrpnEd/OaZPLzd/ACuhQNT1DnFXT9dKTPeP8sWCOoh13hgLjYec1p
 4Iuyt08k7g9u4VoiGvYfTdwEcSn1wthiJ+QQ70P+DcWr7pmJFC88RqAE9RGD4zX5O2kUdvklfQy
 CQBDwA6HLMzZ0Sz7WiKN5pZe+GhQIPQGnVeD3a5uhejooc/fl3VF7Aaau7XOE9frSbeSllJGff4
 EAKkV450AvTjKy5XP6+SpxsEA+5zxLzLbGjPZSJex6vLMl5TWIwvjQImVEG+r7nG9+XSQSXjVWp
 3bJp2k+edVQ46FbBipdhv4lIPHrwQISQAOG9jEvibi3JV8BbxRRiDSgtGE6c7wkyEfwV6GvsttU
 ZsuG2gdTKDdEkbLaWQqIIt6z8vm1Zd11JUTKE1BO3xSdJ99hVctXSTkg7FNjDhVDXfdTv7JTMzb
 Ks6N9IGyNBmOMs4nOVQ==
X-Proofpoint-GUID: IK-Fc0Xf6XRcXP7dEew5y00ZMTJGg-Sw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX2l8p79nFcgJb
 2UArnTQBNpbAm6kkrbXvkwjQWol7+e/ihEy075imZ/kSEWkkYtRIvAqi1Y2sbvi3iEy2daCigqs
 6QASN62djn4ktzwF0pxCMsiODSVFJkQ=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47d094 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CLDG33loBYVu3UNdBq4A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: IK-Fc0Xf6XRcXP7dEew5y00ZMTJGg-Sw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116352-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9D1B703C38

On 7/3/26 2:38 PM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +&pcie1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_default_state>;

flipped order

[...]

> +&pcie1port0 {

This port should also get the compatible

Konrad

