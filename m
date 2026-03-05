Return-Path: <linux-arm-msm+bounces-95507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ax8ASogqWnI2QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:18:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6931E20B5FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30014300BE22
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 06:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02291DC9B3;
	Thu,  5 Mar 2026 06:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lh6ZFJe6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwRCO2NP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7062E414
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 06:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691370; cv=none; b=u9n+J1OFKIUdvXtFj833Nk1Kc68+AMD8aVzaTpiebmhFXJSEVpyysgzJ2WQUgrwbrNELH2CqkhMSBDBjEmhwKG1NZn8gWKE9BrmZnRiT7k4wckB6WU4wdxjG6k0XqtaspRiDDq8aWkITc8HoJlGhbPjSDd18XU+mIAtwhfFJ+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691370; c=relaxed/simple;
	bh=Ia4Yz4KKVzkSh/fu8vsFIuw10Cp+EPdBgiOe1HDakOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frl8TZSQqLiWn51SFI/fyGF5lElaSIskokFinQSdBJNYt1C1xOAI6cHdkodZuDUXKwoz/3LuJe3HLhjfTJBVHUhE35xJsg5AzPtv5YU0ZPo2aeWkqMbmVjyzKzvuCvayUGpZmjenhTaK08aYnrawJK5ghltMiFeeFU53AqSyEH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lh6ZFJe6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwRCO2NP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251Bwkg3160367
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 06:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yT2bh0pqUrT9WVafRDTA0zTBFOOrY+u5lkhZrA52Tho=; b=lh6ZFJe6LjX3lSSs
	Xc3jZMcDbSfmpBWEFQJzucS7PBsrDlB9TCckeWFBkF5Xu6XP3arQfx1u5rWHAMuV
	rIQ998wkBAWSElQhYYbiePZEZTEHDLtLw+EZAaPIpmiwXldb/pM61ZP2OT3QECG8
	ZkzSmFyV9Ab1SqeNoI5sFaW9W5T5AzFDrMICuJr00yyjuEwvfG6oHz3S0QFUxX9i
	dqNFIUGqjRjLxRvJkNi9X3vYY6RO82hmMEVGfYadkkD4ix9VrORGVtERFr55LPvi
	veX2ERB0PST/z4KeVkqtOojdFxMP/TqErAbDwBHrnEBqUpwbToXw9A08p/2953Fe
	yZkkmQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5ucmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:16:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae3f446ccfso46029745ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 22:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691367; x=1773296167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yT2bh0pqUrT9WVafRDTA0zTBFOOrY+u5lkhZrA52Tho=;
        b=fwRCO2NPv5iiJKbHGRY9awyRsFiWq+NPo0Nk89y2T8gf1B9JwIkHtLpr2LJVpSTxj3
         PNVxg94Y8CiwEkpIhyW9tmnap7NNaSR8us/mYirTD9gOwiw5cz1ddMwgfjxkU4m2Gby5
         xeiIVOQUWiVqkwOshjQDpESNKdQtCY73zn1NsSqhQA4NrJ4LVD5tGQ1DEl4zKBg6pEJb
         /boa98bVe9Vc/T09zxx8P30logM/AldlpkTVzg2r6LfkkjEAOIs7PvjeLaivgCsdsvAb
         s5rz8j2XMkgv3pXlY42e3oSzGO4tfxGenMCherTq5RqdtHV4KRdYKdxjumN8/My8ElOC
         pYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691367; x=1773296167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yT2bh0pqUrT9WVafRDTA0zTBFOOrY+u5lkhZrA52Tho=;
        b=iEsbIwDy2/6zsfVVq3wHwUoQrHF7KfWpQMlJ8RsvArtLl8XkMFAEiCQtSLNx2k6Bk0
         j8rIoVT4SJKVEh6CLhei+8XunbczL7CUnXZX/VxRHCAcrMux33TXotcHW0MKB1V6LGTW
         o9+5RD2rXv37Y2GUXBivzmePQ4fegk94JKSqF9XM86rjtI4qG6KaqryiuVbO3V5HBMKa
         nR5mppcSK9UEDKp5m3nHSvt3YB+nSXKve0aZpbi/674HZKWhnsLBRq+MHJvRiMDd7Lxn
         efnzPQTc+suLYCjGvQUeAYYdozSG02T29pGRI8Q8GL7eBKfDBJzlMXVjlQU+tKRXbadF
         WyQQ==
X-Gm-Message-State: AOJu0YxDqR70sS5uuyO3EWSedyZIXvev+USJxUTVVNkOrSKptw3pE1ST
	UoAAy94th7aNwPOgVXJb/JCZAY6z9/qbofTo/9s+9t+Z+w3SHlABYNnfdSPQrw/Uc6fLtzjBS1y
	XbmImkvlIz+HtHHf6UvNnSiwj/0tZnvRP9TdLiT7PTdmGq9mrZqZg3zsnWOFxaK8QBBQy
X-Gm-Gg: ATEYQzwSdajnGhNHFYStWJbSKi97JyLVksNfLUno19BDIedLHgzsEsNtrz5Y72sQwvk
	KLrleaD3GNGerpQ+c49UfaPXRdOTgSHAf6UR4vAtKiftYDsMEo19fBtbcA2WLfTmlZQBmTkFbok
	CV147u35wz1AEVciLTaFdGr8bOEP1LcLiTe/TdzurMpGYNHDLZTPZwuogtKWRxoV12xF3GcQdqh
	s2w/MBc6+QgbQAnY7hJ57nYFEnF7RVGoMPX/csS/Mle996hrDa8jqfiiF0ByqJdS+25yah+t3Ii
	g/JUBi8BqsdVIrwnT0PsP5iPStRHS0j1CIrgHuwXdLOkUj48X6/uwYgbljWoSJeB9vZMihaEmIg
	vN/TS3aBMAuIAyzI7BFXqsRdxgrLaIlZ/6VdvEMW1vnOonYjwZQ==
X-Received: by 2002:a17:902:e944:b0:2ad:ab2c:d258 with SMTP id d9443c01a7336-2ae6a9e3f1amr44416185ad.14.1772691367448;
        Wed, 04 Mar 2026 22:16:07 -0800 (PST)
X-Received: by 2002:a17:902:e944:b0:2ad:ab2c:d258 with SMTP id d9443c01a7336-2ae6a9e3f1amr44415985ad.14.1772691367023;
        Wed, 04 Mar 2026 22:16:07 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5dbac7sm287061035ad.37.2026.03.04.22.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:16:06 -0800 (PST)
Message-ID: <fefc35fe-e673-47bf-a1fb-364605cdc622@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:46:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: dispcc-milos: Fix DSI byte clock rate
 setting
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-3-b79b29f83176@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-3-b79b29f83176@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eia2gd_tLetBn410PZMW41r62KliEXmF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NyBTYWx0ZWRfXxHMftJ3IwwiN
 FLNaTNwBdprb4Jc1baJBg64OUEQl1JDnms+WWGro9Tj44MDZoWjAi8u+V8adiTPShqCOVAlVthF
 tfeFD4K6CM6wThscI16+qUiC9qiZHdglGKnPRTcwH+6fEoZyrfw85Qlha5LYGutivamndnVy8W6
 SbA6Lgwam/h8TtJObQihYQdh8Z2UWtoEaQPh56fPAlRvfkhK9j2BwJrcr6oH7M+pCphy8Mb1v8q
 e+RytTIiw3vMPryoU01RSclz3pSiZFdFoqKOe3p+10KnsUKmRVsmkXSa8SqLcH/dInkrx+24yf4
 5Q2yD88t/XFpCYZDa2XPw8GJt4205cRyFWq8k0i+OiXgOT0UmShu243GsOWZ3bH7y05D53/6W3Y
 3RLXpUKsceGjNJEP3wCWKRp/eTODrV9th3GXh3rxcxQJXHn4jWq9xIlje79pNzrLV1wmd1ethA4
 wMoFsN4ECyOsZPkfsBA==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a91fa8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-moZBm4D9L3eB_LYtbMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: eia2gd_tLetBn410PZMW41r62KliEXmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050047
X-Rspamd-Queue-Id: 6931E20B5FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95507-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/4/2026 7:18 PM, Konrad Dybcio wrote:
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: f40b5217dce1 ("clk: qcom: Add Display Clock controller (DISPCC) driver for Milos")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


