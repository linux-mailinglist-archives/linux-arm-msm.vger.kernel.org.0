Return-Path: <linux-arm-msm+bounces-115457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gqmNORLMQ2priQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:00:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB016E52A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:00:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="EQ/hQGc5";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="RYp/5oCS";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115457-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115457-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8110B3049596
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCD5368D77;
	Tue, 30 Jun 2026 13:57:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9102A334692
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:57:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827841; cv=none; b=dk9IALNOjqvHO4EA1MY1uiY25imb/+LPN9JMi2Il4bcj3XRocG1VYKctBuJ/Qac8D22ehMpErYTbNCpIyeZoA7shA0EUFH4fR2Vci1sJF6VxVKm++ITaY1mvJu2KBslpn6xX+dpQuoeE+TZ7aWlYt61RN5z8UmNnd3ozDC56RIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827841; c=relaxed/simple;
	bh=VZXDCkGXPqjXNLo87oDiL3MGUCb/C/NcqCHPksmBoj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SaFjqnznbYYzgssPAUrJFI1EsWp9RVDVlP7WoDIp98j4q+r5shp+l4Z1ETDM9rNqbQyK0x0cTZpSZ5CQRzmsHHhtIESDQNz8nw2dfI9gidw5Ar6sgcUBBngG+uRJAGhO1eJQ0MdbjeVuYW5WJAC5+QtD/gx6wHlB8qetebGOdNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQ/hQGc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYp/5oCS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxch1613365
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jHHiZ1G2Of8CDq7sIn2bONVFdln4OQz+K/2zgUurUOs=; b=EQ/hQGc5r0U+JEjJ
	rwXLZDRjg/yJx5q9y9n8AmOTYjnbhXszb4FUElud33w78rD93Eypmp1NnCYi0W6q
	PuEjUGmqiLeRE9r5VakI8DKVA9qkbxGoiWxoQgzq0Ww+J5ZjOB4c65f2K9kb3ssG
	A1QTZJKj47eZ/wB/oH/FItolhwmG2rIGD2vnmfjGl4vnQKIyyKuzKLZ51eCCII6a
	onPKtqM3y4gk72zTUDXV4o79M4E7WHnpEIL5mcr9ADcFSSg2OxNW8MWTuQmYrrA4
	eGFAEU+Yvict77KF8ItlALa2KxSnXLj8DHL5vKIdvejhUMfUSlmLpP2meIsjQJVi
	+R3+tA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cv743-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:57:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1857417aso364721cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827839; x=1783432639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHHiZ1G2Of8CDq7sIn2bONVFdln4OQz+K/2zgUurUOs=;
        b=RYp/5oCSqSGKmIOywIPiNot4M68g97xtxRi0V77cy+1t0dc2D2v9+xmZnL1V2wEsYS
         D+N0bv6ovxw5yP+mJSGYuRiU6KxhIXCMUWDsQkCCZcyH6Mm2dW7wKRLGoWGEB/Xo+IoA
         VnQNhSKtvc6Sg47ldrQIY2iEk1bhY7FlsHdFSVGBJYgi9nPoSZPTVEqcoxgxQk/9CBsn
         CZskP/kNLENHuiucvyCdRk6CW3FGCQDtSc+bw281RDw0JhzSvw8YoJrpI4ChqISeMwGW
         13YoMkyQScG+gfGsBeqrXa29D41Roy2j1QeTR0gDK3FOGCN7dE0AGzcZTGlVcPnEBCXw
         ZJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827839; x=1783432639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHHiZ1G2Of8CDq7sIn2bONVFdln4OQz+K/2zgUurUOs=;
        b=O754VVxQzFpTOrl44/zo+KLKbgGxmPoCpLRCq9air0oP+f3TXAAHTPGVF27OMnA2HE
         tet3Wi/QT3km4yEd137ZNeBOlXx+vF0/yJf/bLgkae84uBCf6kERh1a+Fsm156WE0PzS
         4I/ULcSzRXPJVEPUjpmVpgRPAvN6+cdOasOJBIoNNCiZZMOI+OkpuimaIJ2NKDvQv6wy
         EvzBLXCJz4Ol7XE2cYjVrIbFoMhpzil6KtjOmzo89tfLJwu75epFlt1c1M2a65iRrqtb
         KYzcMlfQZpFGyFK1PrztycHaoQGWlk3Ecm9Rvz8X5S/7eyLBHTedfI+E1Cfqb1xx8zPS
         tMdg==
X-Gm-Message-State: AOJu0YxU3hnU4CXFXWlLKBUdccVghCoFJSZemdRrGqBns8suya7mPf4E
	lcIRkqTdGxN/fiZS4P4Lh+BruU6EUBzn2egDz+P/3hWv4FdH1UsZj4zjSrQXxqNz2IV2BxiFDlU
	unSwOnc1ib/BVhmkf9iYw5llOrWlHaQaU45fHoQEabV5kC4jEjQNWWKnny57CT5Bigmbi
X-Gm-Gg: AfdE7cnPHBH52i8/iDiAYafo3kjBM6fjxeCuIfK4idHDYoiPf0T1JZnj5cuhcXH9BPO
	B4G+rcJ92nEJQnjTSdu/H/3ZPavF8xNSEGyXfkizlbIEJOvPKuac/UYgSxvS++xBSjVG/0Qr7Op
	XdxikWL7DaVxaRYyzwR6HVgp01j1Y8sS0s+DS7o55TS7HN5B1WjVtF8fRJvn11R29j/8/3xKKmE
	QnPWNWbGMLepuNLhW3QeXYpW/Y3xxb2O1Iw7Gri7NbQ1yBef1cjKV4sDBx2oPPTG0I5rN9/GIfl
	ybb5x23bXdUro6G0lvM5dGdK9pyVjbLshHfnrt+qNs3pvAT38TOCqkhiFnm4dOXip8tE0mDtJ1Q
	dMPlKhxeyE5rP/6Pvbz9WI2FmywGr8PR/pBQ=
X-Received: by 2002:a05:622a:286:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51c108197b3mr29499261cf.7.1782827838855;
        Tue, 30 Jun 2026 06:57:18 -0700 (PDT)
X-Received: by 2002:a05:622a:286:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51c108197b3mr29499051cf.7.1782827838397;
        Tue, 30 Jun 2026 06:57:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c128917594csm132716066b.59.2026.06.30.06.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:57:17 -0700 (PDT)
Message-ID: <359d3d95-4756-49f5-8dc4-f24f24844f3a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:57:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
 <20260612-shikra-dt-v6-4-6b6cb58db477@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra-dt-v6-4-6b6cb58db477@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfX1fvhRKR0AAmL
 SW51zwbdSbeMvG6SWNN2isfhufUq5bdCHOZO/SvQe1j08VNNo5mq76sqE+Cvo7NB3GmR8jj4JR1
 gbGamvET/p2m91hdY3t/bn9ZNXqGgPUVz+vEK7QE0z1O9wmkv2dEp/5haNkuwrJuW+CJqDZo82X
 fnSgyXxQCkH9+7KTsMN9BAhfnOHxcU4OOfcxiz+/kQD+o/ZVD/VodrrZnplO64t5aR27szzLiCs
 6JMRyEvsrUMu4UZQc/Py4/y7Jqpr+/uyX9vzYvFauuzr3EwHv6umm/GGPb/KiGQTbyhgY2kdmU+
 o2G60wAI0YnymanBu2F6TUuuAblFwKOmppf7ijCykVLDpyub9N2bMn1R9iOhSCqcju21PI4xQ2O
 cV9ISvtd7Qqn3k524jnPlG+FbHMJ/v66LLRDz/B9mh/ZHOUWdGGS2iJISREVmcHQQdHFQK4C8NU
 GQQ/myq/HdYfMMNmtAA==
X-Proofpoint-ORIG-GUID: _vfUSbGdLuMZ75C7_Ev0KYatOYPXQq3K
X-Proofpoint-GUID: _vfUSbGdLuMZ75C7_Ev0KYatOYPXQq3K
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43cb3f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MSeU50jLikp4iQrAx_QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfX2JQx/aBujAks
 i0BmLx6r3ZyM0d7J3h2URWaQF5BWkoCVRPX5yVWZr5ow40nwMf7j2KNw1Ir1+tGu0oZ+5mDDys+
 4waR73yvtnlkyL+HJHMfKscFMShcLBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115457-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EB016E52A3

On 6/12/26 7:27 PM, Komal Bajaj wrote:
> Add device tree include for the IQ2390S variant of the Shikra
> System-on-Module, an industrial compute module integrating the Shikra
> SoC and PMIC for industrial IoT applications, designed to mount on
> carrier boards.
> 
>   - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)
> 
> The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
> definitions specific to this variant.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

