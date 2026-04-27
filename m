Return-Path: <linux-arm-msm+bounces-104748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBhUERJy72n6BQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:26:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49817474545
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F138300B529
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB583D811F;
	Mon, 27 Apr 2026 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh0mNiGJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZnSCGKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA33D47A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299769; cv=none; b=eyfbKZkUkjJsPfI0PdzAzLo7Y9zxe4GcNC2PZy7tAXcLDMadoJAk4b1FaOm9g6yPWz7dzOsq/AWX9F6I45/FIWKIKURgEyPc88vD80cijaS3i2A3Uqmc/LS/zdL8BA4Ma/BTHAnQbuBCNXJJc77ysfJcFgCQMTE24zFrjGriN74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299769; c=relaxed/simple;
	bh=//5y8usvnlLYIU6Nfwsa3ikRzmN9fsBFZ2GRchFaaCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTn5KgBSUOlDTSVxgETsbjc4Tb2VyiZGeE3f44/H59QQhNveR/eo/xWacJeh+rNsyCvagTREXc0TMTmHXYMSvFtcRFu099jkuBkVOjIxzPedKr3RTdJnwmuz7Pr/NKB7VlZBNIMOTGDrwqnup8n5xc7JNr4tfWfD8DjEg54yca0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh0mNiGJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZnSCGKm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3n8D3123502
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTFrH73lEwXqL7N/MOKb8e5ZwbO+LjToc1hBsxjavBc=; b=Jh0mNiGJnaEQYxKK
	omUPGyG5j1o8r/izROyiLXmknMGdYdLnYKcpkqfA3k3TmiLW5iQTVZGncB0Ou0J8
	Vx3yu4YEhG/ZuIGgdCaooPiLGcV8+S0QEQVkBcQytIYcibuTiZ4Me2evpAT2U8yw
	fNbCfLj41pdpXXR1wXaaUNbiFRnez2VMzwgZEvUMzGjRkc1wdUVGIcsI8w6Mvofa
	sJ69vuFcXPtLLceNPR5p+tzVPVg79t5Q8hRJfHzjWM4d+sq18Vk4fjHFhk0TIBe2
	Etb2k4lt+cnTxZS7HmnQnZb5iZ2ur1FIyijdiUlv+x8AuyQMkQxmmWXUZ20QtrL8
	1pNVGw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qggwv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:22:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6110e7e82b8so682239137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777299764; x=1777904564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTFrH73lEwXqL7N/MOKb8e5ZwbO+LjToc1hBsxjavBc=;
        b=MZnSCGKm60ubRgUHscjOi0lUffsmH38o11RlQwBLtcuvPVOo1VtLhe6ulLvf9zFxak
         NialSHyF3xur4V6N0As/ANT9fxLSlti2ZIrXwny29D6gIMMYkECGjFGmpWaYXXUedCHl
         zFF4V6rOFlv2n001EABBW+aoYhcKVhx6IAEXkXSxc/dx4ZIst8E9dYhwojA5j+1iHTbW
         FWiz5ZTrMJvRnXmbA2lkYVSxke3f9CU58m/F4wM2hRJiV7qyKnYVt0SOSQLiIG5LMbi7
         s/+EilXYhGISIX50U0EkSYTDk3qmeye9yPp+Pq2K2136jpyfkTxdiTP3DmsmW9INKx3+
         buQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299764; x=1777904564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTFrH73lEwXqL7N/MOKb8e5ZwbO+LjToc1hBsxjavBc=;
        b=KiUHYY1N/FPbfBqwhYjT14zJzmkl/YBjxRPEGOtP32W29KWYFHGvCvhGrVACeWXjEq
         8MTXdizU27mICw9QJzuqAbE2LLYbzDen9AMX5yXnVLCn3Me5mDKCwC0gecpZhzj6PG8/
         dvL7xDsW6kP6XiqtKi3PlbcM3IRnk6o8qb+4v37tQlF3QWoB1h+e8OLz6ntWAjjJ7yKi
         pqS2GsmrDNyGli39l3eWG4vHO4IepF1rxIFyOIiPfwm+kONSPyN+2id2I4TG3XHumLgs
         G4OgJY1LnTX2v/NyN/w+kRPZGhPXalxZBJT1cfZ6susHN/t2fVBZ64wgBPrGexQf9SuX
         QePA==
X-Forwarded-Encrypted: i=1; AFNElJ95cLmss8hpUS6nNdxyEKX1zC0OF63vLsta6Xe5+1vKteFmHRUP9IR8NpGSg/ADI1U6D9CDwPzBFZJYi/7h@vger.kernel.org
X-Gm-Message-State: AOJu0YwJMRzgt4wh6VB/T4jVnBWEZXttF5Hg+FW3mIsHhidpoYjTWoTC
	5qWW3y1V5Xo0sSOS0Htne0yuw/VkkUNxgobc4xdVn8KeNEpUqlEYzyAE2faXrIRZnUms3PXsmh4
	agiFUQ6XsyVf1qj69qvITnYxUWuJK/EdqR/OAnm+b8TYXD2pxI9xNy1aNK5ofUrdx+T9bB4zJC3
	vG
X-Gm-Gg: AeBDieueK1Tq0PYx7vjhO+FaWahBJ6II5toYsVDXKmKDmDBKDR80AGboE9z6DbdJXue
	yFVx27Iw3tY6l1DqQTSMSVTVV/n6SLxbo1HAQR43tGTQmwvdGMId4SrYrcwjor3k/5ecmu2I4Ht
	TtQ5PEGOPEha1AO4IpjjBLOKWRb2472DG22kz+WDjP8GVirpfFRo5jd6qpnMKelVMisBR9UTWXB
	9+FVj2Sk7ytuTImPNNWsuZSsrUJChBLbXrunxihZLpJtOj+XSPlTjSMLrNMmDVlr2H3i39P7dNV
	RCmx5aXtsh4kpdplYNqXnpKGlq0uDovqhTZSLwcMU425hf8jxp5RC6D70VOZhUTKZ61PyoPFOeU
	RBFV/yFDTw46fkg5IFgUbaRIinoiwLAj5bQDx5HTkiqtdaOdQ6oIGJT2v0SS3M9RKh2v5F3giVL
	b82KFA2Lg/u8wkYQ==
X-Received: by 2002:a05:6102:5c2:b0:612:13af:f5de with SMTP id ada2fe7eead31-616f6ef8614mr6671750137.3.1777299764467;
        Mon, 27 Apr 2026 07:22:44 -0700 (PDT)
X-Received: by 2002:a05:6102:5c2:b0:612:13af:f5de with SMTP id ada2fe7eead31-616f6ef8614mr6671724137.3.1777299764061;
        Mon, 27 Apr 2026 07:22:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553223bsm1134937766b.55.2026.04.27.07.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:22:42 -0700 (PDT)
Message-ID: <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1MiBTYWx0ZWRfX5dWl1OTTjrtx
 imBAG/D323WY2bgL/oiazKfVMDpWI+jDynsVP3x0jH72Y2HoratF6+hw13BzEHidaieWcKcTJha
 MjYFgnbBr3KQzhKniWe/caBUkgRY+ewfU5hl/GL+35UXc9lHFO+O+jDGkFIoBkLWUcu+5hJy62w
 /3frD536ADjMPlLa+Kub2hidw3wxioNRhmAlrydq3WCqE4w/ndlwig7NNk/XiLwnO7d7HnkKDKC
 j7Elg45sfNjO81L/aAkth6Gp47O81j2bQPVYPsALv+rRjfa1brhWG737x+brl27nF/vKVhr2DNK
 LqYfauOqU+gf6Quuzlkh9u9FS0aCsgwf80VTyPdUMNYb9z67vFDLVbm5BDFafF1QGCOOfXtYr5B
 sdctcsQtDTVJ1pDD9T9+zRU/s3qD4eKi4hctWldABZCBxc/A3eY3dPuE+lnBvdc8t6DY9LyXqiO
 cu08OpmYeZKVCiYs5Pw==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef7135 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HtS05e-23YgY9VhomDQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: IpbEhb5CAWq-M_-U6d5y5q6QZPWtuMyz
X-Proofpoint-ORIG-GUID: IpbEhb5CAWq-M_-U6d5y5q6QZPWtuMyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270152
X-Rspamd-Queue-Id: 49817474545
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104748-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/27/26 2:43 PM, Loic Poulain wrote:
> Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> Offline Processing Engine (OPE) found on platforms such as Agatti.
> The OPE is a memory-to-memory image processing block which operates
> on frames read from and written back to system memory.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +        clocks = <&gcc GCC_CAMSS_OPE_CLK>,
> +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;

Should the two AXI clocks be aggregated by camss-top instead?

Otherwise we run the risk of the OPE driver setting a rate of A
and another sub-device setting a rate of B

Konrad

