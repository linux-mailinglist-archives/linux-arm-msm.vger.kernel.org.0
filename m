Return-Path: <linux-arm-msm+bounces-113435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VrZEImtZMWo+hgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:10:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB79A69047F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:10:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LxiH0pyD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ABKA10JP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113435-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113435-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F4CF301DBB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622DE367B69;
	Tue, 16 Jun 2026 14:07:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D40133439A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:07:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618854; cv=none; b=qXkDCyDTNuXFE8fIHbMum/PTYFVtuWVsPDndWCCzFBWyYGVBgzGjzn2rbgIWo4rIUtqhj+4yE2ip9h485lxQTCcUjYdGSA5LB1XtLH/pXIMjcYTS1h+GUpsSNr5/EO6k8GYWZalg7AkPU4qaXetgrY4iS6QiTNdoFIqy+ZJQm4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618854; c=relaxed/simple;
	bh=fWNdGAKn0Vg9If9U/WR3XdW1WMUX1D/WI/n7ACplOXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8JByTKLVgkBoC5PjYuhDiJBCO7ghOlWJB7v3Fi6+cIX3BR2oB5IjEIsaOoAfeERk4LlqDH3im2XH6mR7W/5DYDnj8gIdD1KHolah5/+8oOUPLk6qkZDHa+3RAJ5CIUiEV+wm0MPyv0ZegHS96aopE0ImTVqWBCxCLIVk3+t0hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxiH0pyD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABKA10JP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxWMN1934623
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNoWQH1x3DXp4pJU5DWF9FFhRF/80Xvj4WBq0B37bzI=; b=LxiH0pyDHECyrTt1
	Vf5/mls2Nuf5cmJaAZXsNYZo32J7/DP0FCRofiOsxh8qUQX9lauUnN33jQ5QBWBK
	ct6lUdqW5tjE8vt2hNRKNAOu7Ue1xErQtxxUl13dJG9aLolSwcGaG2vlSieVyjX1
	jg/Q2YoC4x1TF8Atsz54lNn7KJB0zl7//yliFTOwcL/kQEbJAfuoY2se9peRK2nQ
	p7M8iMbk55aYH5qBMqYfRbbnc/gDIcRyo37M8vVQqVbMn9oiOwTtbNQP3gRizEYA
	Chleu/AEjI/v8Z2gHKxhtN6+UiZyOkj49QTeEDbit//RAQzjvlQMr7xtfx88yq1f
	YPTaZg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct1b8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:07:31 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-966d1aa6688so19381241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781618851; x=1782223651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNoWQH1x3DXp4pJU5DWF9FFhRF/80Xvj4WBq0B37bzI=;
        b=ABKA10JPsKlG+c6gkVtKI0sgzTnIQ451GHjDn00oc79uLO3Ppz15KxR5VzdqxErdMz
         8+Nzn2I8Wfr6z1H0N5dYcAiCqn5f5lPwW9aJ1f+JltY9i2FxvCPyMHFDnyhlBPIUdArv
         eDqIKxc6dhmnOGwXQPoV5+pIvkIXBLIjH8uwkjPE3GXz1gcWiIPfIRM5BFIj4DXpRxQM
         31++21Ee39PPr9LExo2pz8Lb9zg2ymWdRhYxDcqMsiTRFbUcLiSHnTC6PtD4byt9abuT
         Mswbv8X6R//AJg16mPXIkcQuTd7teaA+kiGGvd2Y2NC4AllTrkTStSuBVYPm0ABIvzcD
         8yNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618851; x=1782223651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNoWQH1x3DXp4pJU5DWF9FFhRF/80Xvj4WBq0B37bzI=;
        b=ZRzMDYRN7T5X4mgp19NAsk6uHwiyR/0CpvLAjcSEe2jZQpJ4OK3z93mDDmJVRW7R3B
         8AbJQr+wk/XCTvFJ2hznoCoe1LOULRVIr6zOOgemGSMivWfkfeMPEkd/969w1JHzI7SP
         WZL9zdSracG9nAoJVDNgimpz//xFwYzyzC3JdhSstRQJm+FKMtlxSdExWYi9Zjvaw5n3
         yT9s04sJx9ZbJL6BehYAoRHYUzN1mHE3/Cb+KIef9kixJEmjxlHoQw4L86kp02tHu9IY
         nLKycNJlRTw98p+C8SJRZlhcnGReU5ScrNFxXNtCoTgmMOB3l26AHCPYju4AjeQZpZQi
         gTkQ==
X-Gm-Message-State: AOJu0Yw+kfUxT36prvQLYFFbVq8w8kimVcKDmD7s1+lUvGyPd5uUHdBi
	SL3rpkrjgWLvNHa59zEvfujoc1uvcj2v0V4GVShsidZUL2++pZACYWk2IvjuQ4MlJM7TW91UtLr
	8ZGEm6GS+xqQMI6ZvwCdkPM9NzMLPAkicoFJ6ZGpfEME2d4k2H2h4EDM/pb+HNdLUU+l6
X-Gm-Gg: Acq92OFqIHoKBybtMygJ9xE1Ibz4gCuqFwcH5jJUUDjGA5X11P+7Y5MupYbD/0tpDBQ
	o6IfG9MxcKdMP7eMLZBUWO5BRSTlmWowl5Q/SBTWE1KpvHq96cZjtuho3e5OBjsQlnxLX0T+aQX
	waQQBk+FFbkrfzS4i9+vI7IaX3xlGp9ytxVUlADmvU+qOFF+vlOz3zK1NcJYbmvMi2OBd0OmmN4
	3DLr8RYDBWpSBixj4I906DO09kRWWz+Nf1EP0s3tmZORAoL1JpVvZK+YdJrvWNFlmkRYO6ZSnmT
	VTTyldB2nmSk973A9IDgBFfGdjK2j+/2xdluVfRCWwEJf/Y+QyHx0dDhO339FPbHyRj95EhZ33f
	TM7oP7eFF/ZVHO8tIv11y6MjOT78hWuwYRv4xwGUptkGpxg==
X-Received: by 2002:a05:6102:61d4:b0:71f:856f:536f with SMTP id ada2fe7eead31-71f856f5b53mr991020137.0.1781618850906;
        Tue, 16 Jun 2026 07:07:30 -0700 (PDT)
X-Received: by 2002:a05:6102:61d4:b0:71f:856f:536f with SMTP id ada2fe7eead31-71f856f5b53mr990988137.0.1781618850430;
        Tue, 16 Jun 2026 07:07:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948dff8sm5199455a12.22.2026.06.16.07.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:07:29 -0700 (PDT)
Message-ID: <bb3dd1d0-af41-4ecf-b23a-3800aa5414ce@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:07:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 2/9] dt-bindings: phy: qcom-qmp: Add PHY selector
 and Glymur link-mode macros
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-2-269cd73cc5d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-2-269cd73cc5d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a3158a3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=B5XY--lqvWkliBBd-v4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 7nVIXRREN8rue4w2s1gr0wzGMhWmutXi
X-Proofpoint-ORIG-GUID: 7nVIXRREN8rue4w2s1gr0wzGMhWmutXi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MyBTYWx0ZWRfX9iGVFRN84fze
 TEM39kMrnVDI0Wh+rouc8jN25EfSUUJMG/QDhgonlFg2nx8sadzS8z0ExjEtScvOk0TvKb/vnfF
 13pPkr1H2NGdwVVoJrR0P4iaJHQqHOQHTzWmK3geiB1MoucrjZbYkpLG9xmQslDuOAEnUiYdM/4
 LFKWJ8Kl11G8j9+ZNFr2YABiPgpe7Z9gGNZ9GNrIyD7yUqX+As9s0DDy5vOdwjGP92Rk+SetM4m
 wvtOM3yXdCHYThr38LA9eW/mKqDmurye9krmhwYrnqrMpO+lKafW/rcR/UIPr+c4F9zGUqwp3Dt
 o7SD4uoGYvaNBD9eOnhXJdVM8bsrf5RFcCQ9sGzIYq8abb7AlUP303l0fEZTxFt9nRg1Hso8N4R
 ndcoLhvugfZJzvysBXeklTbiPvFgzsiCVeP67hnBpQIkP2kr+yikrSAvxiAD2I1RU53ce7whYeM
 qc+BH/JSTx/uKUZqVRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MyBTYWx0ZWRfX0+5FQVQSlJUc
 hNYjCI17OghPK5nD5m4b+FBmRSpFzPCKft4ndn8R1N0QeP02TyjfXTwh6wjT4MO1KBt68wCTxF+
 gywy1tSp1AgbHYsvK3sVvWo1akGAMzw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113435-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: DB79A69047F

On 5/19/26 7:47 AM, Qiang Yu wrote:
> Add two sets of constants to phy-qcom-qmp.h to support upcoming multiple
> link mode QMP PHY:
> 
> - QMP_PHY_SELECTOR_0 / QMP_PHY_SELECTOR_1: generic logical PHY index
>   values for QMP providers that expose multiple PHY instances under a
>   single DT node (i.e. #phy-cells = <1>).
> 
> - QMP_PCIE_GLYMUR_MODE_X8 / QMP_PCIE_GLYMUR_MODE_X4X4: link-mode
>   values for the Glymur Gen5x8 PCIe PHY "qcom,link-mode" syscon property,
>   selecting between the x8 single-PHY and x4+x4 dual-PHY topologies.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  include/dt-bindings/phy/phy-qcom-qmp.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
> index 6b43ea9e0051..befa76f8392f 100644
> --- a/include/dt-bindings/phy/phy-qcom-qmp.h
> +++ b/include/dt-bindings/phy/phy-qcom-qmp.h
> @@ -21,4 +21,12 @@
>  #define QMP_PCIE_PIPE_CLK		0
>  #define QMP_PCIE_PHY_AUX_CLK		1
>  
> +/* Generic QMP logical PHY selectors */
> +#define QMP_PHY_SELECTOR_0		0
> +#define QMP_PHY_SELECTOR_1		1

Is this for the second phy cell? FWIW I think it's fine to use raw
numbers as they're just indices (i.e. "nth bifurcated phy") anyway

Konrad

