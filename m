Return-Path: <linux-arm-msm+bounces-103493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Mc8NiDv4WmKzgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:28:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ABF418A2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D2CB3002924
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 08:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144A23368A6;
	Fri, 17 Apr 2026 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAaAU97+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMenLeLq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A4F2E8897
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413966; cv=none; b=lZSTlWMtiw+9glHLS52QDAh6Si1l747YpieugMFS/xjEDcmfYIxsUAC4Twp7fHn1LGpt8joaJLqsCPq7qWEX2UTPR97Ih1Osvx+58lG+fKalQtyTqksDE0Fv6mhh+RQZwvLc+61EjFE4viSDJw3kmF1DATsSJnVloOofPAocaZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413966; c=relaxed/simple;
	bh=HsR1pD1cZejjpSMOdjKfntIeiU3V/CQ7BcAr3GWo2zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAD970EF1C9JhRGFAf1jORaNE9HlcQLgoiZkJZYQ0C8pPYQ9d5zyy+0EYIY1QNy0PdSoz4ua+Br2zVlMYMF85ZP010sMknISn33YDPVzDiClH63upo6q3+oDIpLkPSfZgy5a03ccUTXlN03oVAWx6bdlsZFwJUMyVTlV2D7ps6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAaAU97+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMenLeLq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7nIX24017833
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEXx3SSRARXgD/Ye1EzxIF1scAs6C4XDpVH/7JetmD8=; b=VAaAU97+o8+VxS93
	PbHUwjDR0nZgpaOC/6uY0xywdR/k2fMF6K/i2UdDrE0E9Qp2/XQ9Xx/ui2XdD1jo
	2ckR1q2l9710YTpzSF1jJH5aKEvnfJ/W86O1gmfeJxbp4vq/MNM3FuHm3+G0jIzZ
	6i27p6p9xH6nI4kzYTruVOEIAf25RdM0Lwq9/owEW1xtJ7e7lC6z1d+pyWxFLmg5
	DUoBemphwkitgtuMuR1ijAG5B05LZRW+igjh/1/gq+UYD28RR3D5tGu+/QlX647F
	7AxScQwXeWO1ObxD0Vp/FTzF9SJV0Fgd1yQouyN23RuYzUnOr3TJuBwT+1jSWhFm
	3M4Mdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk11rbekp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:19:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2955cc1eso669051cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776413963; x=1777018763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tEXx3SSRARXgD/Ye1EzxIF1scAs6C4XDpVH/7JetmD8=;
        b=TMenLeLqwv7kPrv3QbBVtNxCdvm5DiZEakHwmBDbnAV2OkMBXY1GFlgOYSakHEgSn2
         TW55oMhRGvtprqz9p8X1Oy0xZVzx/K6QCtDLNWplywmVq27oc3iUc37JOnF8G8o3h8QF
         V2q9+v205chWoqO0g2csiAZtdOI9Ojdky/YMznoo4WRISI8X75Vl3LeQhwh/sFuVtKlw
         7udlV5JCMFZWQWosKML9EDZzGs4b/4kbWWbLBOJWkAiSSpWiHcKNrExEuXNqkgKN2UKG
         j+x8rv3HlmUKX7OI+K+6qzp0+R84qx6pjDsg+WDCf8zC+FudiSWCpiIo7jlxTlgf9dek
         DLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776413963; x=1777018763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEXx3SSRARXgD/Ye1EzxIF1scAs6C4XDpVH/7JetmD8=;
        b=TGrBHqNBaf2smHvNwxbZvJPmfU1kRDCinQMbPZvXxo6eeiO0onBN0iOxZf1eoc7ypb
         PKpAjI8vbYVP7dtHYcu4a3tWh70H9ZkZLqJfe8ZwoE0mEjiUkrwT+a/H+smGx5trN9FY
         zVqBqSicNXABkdQ6mpZph2hkyCFLIWGTSyhYQnVVGrucb4HArHlNNDAfyYJ544IlGYCd
         XfftTShhZh3MVu3oW17w6LRwY1wpjr0Pzf9Odg3l46OGh8zYajWGYSKiTqF4yIt8tUC5
         6h0SK2dgajrg/H16VB4hkvNOec640FYZC5LMEZRKOwXbekTGIAB4VAeAekITY4L2pjR2
         UfhA==
X-Forwarded-Encrypted: i=1; AFNElJ9N88qlQr8bpCxJKw46wJNWkW/WcFIU4ZnktsnIYSHDtPtA+lZhtCEXi4DFn/vHvBb1kyOFwdzYemvmafla@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyu+Z5aMGOtueMYlRub4j54Edr6x/7c3A1qo4+dx6Uhppd4jCE
	SFy0Jgs3KbcEPkuzOmC4mV83thivmix/SIeDPtG7g9uleYK7De5T4/rZUnEa961IkoJzh7SbHVj
	m1pVzpb8I+cYKfS+eAW1/H8PMIzZV1MD0nNvsdA8obPzKDwdwMVYOX/NNlgcwtzi9h7Yr
X-Gm-Gg: AeBDies/VY7uoLMVZ0sfFZUO4H+L0JnJNtLQP/9CVNqWT0CnJX206pv7WiGGtvnIApS
	rz9ViimhLCJ9i8plBPCEK3/446zH7sCQs+d2189WbnXM5WlPh/x0X689vtt54TGptXAK8Q9NYqU
	YebM0h7jrum919t+QXq9kZ7+qNjuCWBMUKBV7UskxmPUJ2Bwx/kle0kqjpI65rGMkhFFI6jpvPb
	HD8wycHdlvJTHq3iZ7Jhqk4Av3AWbIcd3fi+khcyTmpo72vvu9TWdCKtVTHjp0AuNUk3R+bEnMi
	7aP/9QlSoIwNyGXKs31c7bxwW0NFfNeJO5KbZySQkhkYrCCbqHB6nbjvP6RnXTbDrwTz2+ftTPP
	oXGa6nuwO2cO4GVZu90HIhEbWmZjI/LoneMItCfmXwMBcmlivfIaFSP+qgwjL3978spuSucxhIA
	iXh9TYFT3kkFZaPg==
X-Received: by 2002:a05:622a:2488:b0:50d:5af1:65bb with SMTP id d75a77b69052e-50e36c4b4c3mr17653781cf.5.1776413963181;
        Fri, 17 Apr 2026 01:19:23 -0700 (PDT)
X-Received: by 2002:a05:622a:2488:b0:50d:5af1:65bb with SMTP id d75a77b69052e-50e36c4b4c3mr17653551cf.5.1776413962814;
        Fri, 17 Apr 2026 01:19:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cd8205sm31905066b.24.2026.04.17.01.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 01:19:21 -0700 (PDT)
Message-ID: <c862e4b3-3168-4b75-a002-ede2961dc002@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 10:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: eliza: Sort nodes by unit
 address
To: Alexander Koskovich <akoskovich@pm.me>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me>
 <20260416-eliza-imem-v2-1-fb7a71123451@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-eliza-imem-v2-1-fb7a71123451@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4MiBTYWx0ZWRfX0d9aHMlZ82it
 uOWLfQEe6B4RCRNAcyxk4Hn6gOQQXFFiH5RsqaeAkHMj33cqI/CuBeSSeffsMf+cSytubWYdaSN
 hq+8ODEDUmZWZXp3pwBmK0HL0BfjOqpiJ34V2cUGg9aBVs7r1GK3cxW1DwioNAYlreuK72JmYl9
 ZRFlCk/N+mV1k0eb5pINHac/ZGsJaD2vI8zrH+Y8rOBRnqoyNsKziIpBnjT2DA87eOZTSUbQAXG
 BWVRHVe07/fLtxKcxQHRP/nzfi/t47fnLObDFF60VjF44aJUJeOPGGjnL813s2pcqLz6EtTG+Wi
 bNFeP4jgcooCqm6AQ0GwSR4NnI1s6o+Di+p/qpapS66JIzH+RCwST2DMGdK97bvDsMwBRrMnt81
 qcWeS7kAhkaF28yEAxn8gcn8NR5fI1o1UiXNHCzmnkLAbbkuHlS5tQgb3+iwxm6/iwDqzHkWYzA
 mIeObaf275RNjjWgmQQ==
X-Authority-Analysis: v=2.4 cv=ZPznX37b c=1 sm=1 tr=0 ts=69e1ed0c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=O7T_dzNiMBTscPX1knoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: QzJTfLOc8_vCKPQ8ZmMN2vqW2Zlp86Rl
X-Proofpoint-GUID: QzJTfLOc8_vCKPQ8ZmMN2vqW2Zlp86Rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,pm.me:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103493-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5ABF418A2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 11:39 AM, Alexander Koskovich wrote:
> Qualcomm DTS uses sorting of MMIO nodes by the unit address, so move
> few nodes in Eliza DTSI to fix that.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

