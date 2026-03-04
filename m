Return-Path: <linux-arm-msm+bounces-95287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHV7ADURqGk8ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:02:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9371FEA2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0563B303715A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 11:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDC1390C89;
	Wed,  4 Mar 2026 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er5a/SQC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qu83KL/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9FD390214
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622092; cv=none; b=Pjb3A5SFOnAfxESJcQNHdv/cz9loEQXXw1GklRVuf/cbTYnvr48mieBB1bkiUOUjTkZMOCdmus4UVLs7CGYXICR7UtCPMC50bWKFYADJOPTDc1rb12jFsG8Oj/j31SbrHjpDqFBISMbaoEtHldlq4X0PocAKqUV5NYCviOLT1I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622092; c=relaxed/simple;
	bh=s+FC0dRAkEUbI/jmx4+Pu3dKAGMwjIBOR2B36djqFQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMMfextKly17mI92Dn538z2Ho+lMNSJGYFMaaLJM4jHi0Bhllhx1jmpHxbizT1HGivoowEOf2XgvPY9vPGaVUTP9NbP8sUrzQZQH20I3lKqMjq4csUNgDAU29XhK79QU0XkcelVT6MBK1zVkiL2OC9cVWKrgb4Yg/Dx8RNOAi00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Er5a/SQC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qu83KL/y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQrh957024
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 11:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+hECtUdp7NzhzWwc1cUHjCtGp9/ibwtiUcgBpnGa5ZU=; b=Er5a/SQC5S3by/U8
	t5TS7/AAd/zEkqvWFpAsMYd8Dugx8WBFeTHBbbW9pmw9eWjWhbZ+SdkxI44H4j/8
	20ocTEY/Fh9FMahZN/c3YnqCN/6LVnD38h2gtr9spmhp+ASyQOSnzrANrFuAID6o
	LEA3lTIiAASB6W5F3EZBRxgxgoExdnf3YqKvd1TarfxkSo4dvZ2VRI1DZgtdt+Fy
	KacxqMvw+o15ppP9WztVG2H1OAi++xh8Kvsq3nmjyN8E4k11+O/NxApAyueVELwd
	K3jcHr/VHfieQh9hJ1plVXsdaTUMv5fK5LxGFP9t/Umfel9wtm79AyR6Sw7WZNxC
	qHbKJw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qgajxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:01:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899ebdd0b08so23704556d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772622089; x=1773226889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+hECtUdp7NzhzWwc1cUHjCtGp9/ibwtiUcgBpnGa5ZU=;
        b=Qu83KL/ya4p/gNVABRM9CFUroQG0ncH/su+RTwuOs2n7ryadilYkZ2WNvWmvgO7+Yr
         nMZgQDiY+gJ7sjb8bZhZJggetULAvBBVRGp+jKpxof6EPE931+CXNxQhilVg2Y/Ku8Ud
         DAZ+5/VfWe8OKlj+pPHGRQD9jS8HLrOhGG3xQbt0oDm+9kOKZtCze4CgWK+/E5yON33a
         TbBktvjFcxuJMniPJjr0of386C/KjfPHAM0gCpaL2uutvnLNv9bxGYuVM+5Co5PboNXJ
         avb0yeMYEir9HqIvEUGe/v5uo2/rAH/aKXJBqjan53VNg2goMOP/HsF9AmfwK5k4ymFP
         fi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622089; x=1773226889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hECtUdp7NzhzWwc1cUHjCtGp9/ibwtiUcgBpnGa5ZU=;
        b=jvcPV29WdJPsrHCBpWhu74dnPlsyzr/YzOHMcKy+9RWmGJW38S/dKBbGXBMXGPP0Xn
         HbdjdwYRecSdswFc2oh/ICxJd41c9XWojmNjT4sxhv7TLUClDVSOPC7ESr0aacboJtE0
         nsBmFVq+xTvYwWFnWEbIQuUlkRVpCUHCJidbEzM1Xi03oi+UTm/h3Afh1LI1ZgSEifmh
         ts1zksX+igcwIdAljl9jEcgX5ujQeY7bBrIc6G5QHU0aXgA9YC2KMj9POKIsE/TKp9FV
         R06BW7t5miXLHlUzWe7i7zou50r0izFKGIP3OCZzA1H3Ec4Kj/c6oVL5TxdaRpMC8SNi
         mPRA==
X-Gm-Message-State: AOJu0YwFxmYvKpzwVdZ0sB6DuBmbzxHMX4IK2RL7KAOzNL+R/IZLF4Js
	JoH4VNujBMmGquRBJdg868eYWCRFc4MgbB0cJUNDUpM3F0oELZxzz8D8ZBRlrzBdksbGNzXpPVi
	dtmaR179Z1yn6ZYRUCvuOL41EXs4YOZMzAR/ZMvZDp0VpXbb4LOzB4I2r85e+jfftBhw+
X-Gm-Gg: ATEYQzwhG3HD6Ay79EnGZ7AvtNzl282706KNyUo/RDMLHj9pOgAVstJqqzDKej5Qlj5
	SYsgg+EpEr7yWtu8OhdClltN9ZpQAQV18n8Ef+7+wQ9OuvBuXO8IHLIUNNCbdu0yhfWgZCpV7e0
	xcDmLBlplV9l1Ya5hsLqWNGTw156DP6vHubT89YsXT3DNnj4Crbiqifkv6PYfaaLOyP/nh+ChyI
	LZicM6/xEWZP670bNzEAWoLrleeRBk42AyMbj/MrYgzXdYLPyjf8z6YzsFQyz5WErYQUEmQ3VrW
	+oftFJSMlClm+ED1flBxRA/i8PlIFAKPL9f/DAOYOyghxSOw68CR8s2+GnkLXa6dNDfIbp+BiBW
	pwWCXjI4Rw7X0fAVgPlMvFbE65ZqRG80gqV/LSGahM6qjPGE8KSFBUHiD+Ji8RomrW9Fr6yTN8u
	gndrk=
X-Received: by 2002:a05:6214:4ec2:b0:89a:b62:2ff6 with SMTP id 6a1803df08f44-89a19d29621mr11665006d6.7.1772622089522;
        Wed, 04 Mar 2026 03:01:29 -0800 (PST)
X-Received: by 2002:a05:6214:4ec2:b0:89a:b62:2ff6 with SMTP id 6a1803df08f44-89a19d29621mr11664686d6.7.1772622089035;
        Wed, 04 Mar 2026 03:01:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae94441sm721915766b.50.2026.03.04.03.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:01:28 -0800 (PST)
Message-ID: <b44579e1-9630-496b-bec9-0d7f02383bdf@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 12:01:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: monaco-evk: Add IFP Mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260303164314.886733-1-umang.chheda@oss.qualcomm.com>
 <20260303164314.886733-2-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303164314.886733-2-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4NiBTYWx0ZWRfX2NOMystRYsSP
 AR5b3TD61PZqAp+UqFeR/VVmez+5eREi/dhGn3bE2Q1kzNQbTgNvvVGQOYNbtR/l5OpHlKtZR+r
 O8DyMqcPS77fsCKzBhC2WDwJ9a7y2rKc7RgUGhz+HHetyLsMwDXAksScNSEDnxb54JqQV1vX6Ui
 VfDdjdtqZuPnCK6cKQ4l8o7L8zTyh3fHwhFHRPvCXl13ldI0KOQq2QVBcPcKv59MQgaTirZ3DMN
 Pn9V+kqNiFKGU1j9bssz85S7tFm7//EsbtCxikQIajKb4D4PbWYSyOdcUV1Z7VJo4JelWdfbwyR
 EAM6P2pi+eI3mIHp54nYXAScYEbQxRuB8yH1SDqm4EHRtNjjiNZlIc2Dl2f/CSjEWKBWUtA3/zM
 W+DxF5y6B4IQwIXEuVms51HByXJXfmMb62nizvQOO3JFHvfbfYAmkIG7GCpxahtWDTJ7qb8VtD+
 DAorjepweDF8AQFOedw==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a8110a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=l294Hz_FD5paY8OFZukA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: IckUxkj_6gbWa5gdp5Try2baevuUdXYm
X-Proofpoint-GUID: IckUxkj_6gbWa5gdp5Try2baevuUdXYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040086
X-Rspamd-Queue-Id: 4E9371FEA2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95287-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 5:43 PM, Umang Chheda wrote:
> The IFP Mezzanine is an hardware expansion add-on board designed
> to be stacked on top of Monaco EVK.
> 
> It has following peripherals :
> - 4x Type A USB ports in host mode.
> - TC9563 PCIe switch, which has following three downstream ports (DSP) :
>    - 1st DSP is routed to an M.2 E-Key connector, intended for
>      WLAN modules.
>    - 2nd DSP is routed to an M.2 B-key connector, intended for
>      cellular modems.
>    - 3rd DSP with support for Dual Ethernet ports.
> - EEPROM.
> - LVDS Display.
> - 2*mini DP.
> 
> Add support for following peripherals :
> - TC9563 PCIe Switch.
> - EEPROM.
> 
> Enable support for USB hub, LVDS display and mini-DP later once dependent
> changes are available in monaco-evk core-kit.
> 
> Written with inputs from :
>     Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> - PCIe
>     Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

