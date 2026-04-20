Return-Path: <linux-arm-msm+bounces-103823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNt7IIhs5mkJwQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:12:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF98F43290C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91A673136A66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2A13A7F79;
	Mon, 20 Apr 2026 17:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SS25jlsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V++CCTRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AF63A7F54
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707163; cv=none; b=Gae8Xz8S6/rYUtMtq74ZXgTw+XXdOvrPCceqFTB/L8HH98uPNVREFeWrUmN786xuR3llg2fPHlby8HQ5AyGRTtedNbq5bUMN7g3R259i+XVkRk7HQ2slOeJUWC0Gb7FGXtpKUTfSVb92h8ykx9yJGg+IPPbbLwhDiwE32lllVQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707163; c=relaxed/simple;
	bh=PK3Og+Wr7SWodQIPe7b9VhqU2ni5wqa2k0fzpY/+vuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6y1Ma3N34dT8K4IqfK1ZvoYFtyMTi1bZNX3utsY7G01szTfqywy46eXwXgFTUH5NLcYpOMjiXRIzMeOixBU51U7rmz+7CjLszm6AvdJv/QqAD+rP0wgohf6aayRpJ3B+2OJfsnFdqza5EGBpBzooFmEQ8Evs9pBaFmOUVaDWxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SS25jlsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V++CCTRE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFjEIO2755634
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JTG3cvdPMdhP4qQMHJXwSELA
	V02IJif0JhtB+/RFegQ=; b=SS25jlsblDDx6UNZewZFwpFAieQRVxRF6z1IAh6J
	OtJXbGE1Y0EIpf6Qrou/50N1lTDMesF2nvemw113zsZxxp/SWhHVIDXvelLkFgb+
	ETW4hA/PPYfXv9qEYsUeI11uVegNo1j6FXTXUjcXy6BcYzeFz4G0Rg1JfEmsoqbt
	pMpKM70SlBafkyBe6UAqNwkw4si2cN+MMK335Xv4A7cK2ra4QUxhBvYUMJA6DjxH
	yhPD4lb55gxuJFHQIv7q2QTgjXccHTUy99ofzJVKBO8cZ7uFXlAooSKxetBnlM3I
	/CWNiGOunzkbYoTli4czzOT2nuuEk/vAxUuILD5wGp9p6Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xhwxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:46:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-610169771d7so3727582137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776707160; x=1777311960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTG3cvdPMdhP4qQMHJXwSELAV02IJif0JhtB+/RFegQ=;
        b=V++CCTREZFld7phVlYZHkDHOeanyaoRj4Tmr35WaF0FJyI4SnS5YIcqrZS97hP4d+U
         JQFrfJHhY8+BRuwEL7HgS+tgLygmb8EDe3PBygAH9sTrIZXnbUkPDaAY62WZmz5SaHgL
         slKcL/6Q0knnb1EJEgMklQaSnvfQKRfqauZQ+qIb9fsxGqI15dkawJGTuUyX7IJPeznV
         Xl6d5BLHRd2T4D2lVGWyktNRSd9wSgQ7PdIqjY1MqCP4PebV+hM47do2sNpc9hnf0LpC
         +Gd9AFuaDdfIoeWgbJdXSJRvoxsNECS+KKHQPidM/5qP5SvBRElehxINBRolnHcdvPbB
         eHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707160; x=1777311960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTG3cvdPMdhP4qQMHJXwSELAV02IJif0JhtB+/RFegQ=;
        b=F/Eb7bghP2h9H2qRZlJF7d+w5YIAI+jjDrPXPxkU3HYLVZLP2w7y5x1BuxOKF5TFPA
         257iNOxbaLn9INTaqqLwkzhRXEn4FhpRS8yWOBaVHaywVm6nqP88fHYZbkEwCCq8Ksfn
         7KzG5a5z5MLuNbW3FYXrsDYoSkS7te2fc9b+i/JWxrkq0yil7TSkILNIvvREn3YEsqDf
         w/fctv7r/yEpLZR+9AM1T0jf/ekuDxBxDM+pMJiCZ8pBZrG/5yEWieFgiJAz6UHTPSQi
         x4HpHFO050epyF7x6uz5mXKcn4yRLlaQ1GrdTIvtujLZh9HLPJMKULKUCRHe/gPWIwf+
         6KRA==
X-Forwarded-Encrypted: i=1; AFNElJ8W8d+DuUqwu4VyrErI7Lgaen4EzO94GWgurqRc1SX6sM5Rr4bZ/uEbUFvWWWJjgJJR9Mf7E26g9bVTygFm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/fm4X1FvwTkhZxm3CS89jVCBUTsjkWJ4r7qE7mAV0GlT3mq5i
	ejmpmi4Gphe6+JZsg8ZowwXxvY9/okh1zXkOEkvpMsBn4YNTaEoFdjz20pdsgetgIcKBYiYJxR8
	fPgN56n5+adLt5vfaukqcj5ux8C7o6y7OfVwfh48pIrX/AJGEyc4qguUXxL9d0uZnlrNPVCcZfS
	3n
X-Gm-Gg: AeBDieu6uJohKikv5Ay0khBSlq+yDq/qKg/BTG6VfXiidaNTYJSoQtEAaqDQsdny806
	e8cZozlsP9W0WOTFJ1Z1l8zAFgBirDHffB8Z4T7OXE7d1elcwB4U0z1H2qbkBGcp8dFLDiEfQ62
	3sfQ4X7ikGG5ntFrlmeAE8WM8+6k8cTwF2sJuwWV0IMmyI8Ss5xwyYDMp5MO+mGqI5hH17wUDdR
	C9dWJAc8TeMkBOEzd17AkWdRtrFwSssP5Wo3JUiHIshqG/XpiUlL2DyGzhN5tFOgjqmGiBwzyXh
	+8aO7l/lZlJyhMd4P//a8D9983hfDAs5mL5mPlnf5hQRL+HK6HpAfx0/QC2V4zRbZ+UxTgP+/8H
	boe+GU2MbKNEmbEqJgTBV53u/AYj5VxTS+RxeNXTuj8ZBCHdNdFWXi7G2TG3bygJWVAtldb0ytt
	94vFffTEdWx2jrT2ZD7HomqlTsewM2rBnain+kbpF1ODhDXg==
X-Received: by 2002:a05:6102:3581:b0:611:b9be:1199 with SMTP id ada2fe7eead31-616f6ee96damr6894876137.14.1776707160451;
        Mon, 20 Apr 2026 10:46:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3581:b0:611:b9be:1199 with SMTP id ada2fe7eead31-616f6ee96damr6894846137.14.1776707159957;
        Mon, 20 Apr 2026 10:45:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0d49sm25711771fa.19.2026.04.20.10.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:45:58 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:45:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add
 display CESTA support on SM8750
Message-ID: <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3MiBTYWx0ZWRfX5FBzBASTJQMt
 2myjTbpYLfhxWl3VL1MhykVE93tUJVQwUmbaol2D08AaYvXBk5REwstPvQMXcVw31os1g2yF/1W
 dg7VBKOknOvA8PxVOaPZaMZRgT7XnGpV7i0YRbrhsLQ+myh2gD0zkgOyMUiSs9vLf7pg9vFD2sf
 keDi3XOcYILSzVNcT41961VinzqeLIhwYa0ygTUaoFlMPnCS0EecOjdXUstqB/6g8OWIvCpt5xU
 teNw+OIt9zBDrSKm9k10bl5GVIAcLT/mkvY5UgpSCkM/Y5KUd5iSQwM63edTctgHRdztrZlI7Ik
 H0SRxpAIIMnl1wopJxWbYM9DxrGk9IPMUccKP/5ICw1wvQCorG3DXQfrf7jo0zYhaAgjJswqAKm
 HC2HKrt9jnp8r+fFC4wDXf1oz5ZG7gX0yz0cjepC7TNTkR9zsTGl/+Y5ywX9TXH8mW1jT8Q7bEN
 V8LeaLoMuCZn/1rqvyg==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e66659 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RHCnOHRpr3UYmH0CO9YA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: lv7RpE7npT_wgMoEPPwso5xg8w5hX6XA
X-Proofpoint-GUID: lv7RpE7npT_wgMoEPPwso5xg8w5hX6XA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200172
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103823-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,af00000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF98F43290C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
> On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
> (Client State Aggregator) hardware. These clocks can be scaled to the
> desired frequency by sending votes to the display CRM(CESTA Resource
> manager) instead of programming DISPCC registers directly.
> 
> Add bindings to allow the DISPCC node to reference the display CRM node
> for sending votes to CESTA hardware and the CRMC syscon regmap node
> which is used to read the frequency look up tables provided by CRM and
> populate this data in RCG's frequency tables for CESTA controlled clocks.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb30b29f0da5c9e156b61 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> @@ -60,6 +60,18 @@ properties:
>        A phandle to an OPP node describing required MMCX performance point.
>      maxItems: 1
>  
> +  qcom,crm:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the display CRM (CESTA Resource Manager) node, used to communicate
> +      with the display CESTA (Client State Aggregator) hardware.

Is it going to be shared by several entities? If not, can be make a part
of the dispcc and get rid of the extra CC <-> CRM API?

> +
> +  qcom,crmc-regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon providing the CRMC (CRM clock) regmap used
> +      to read frequency LUTs (lookup tables) populated by the CRM.

Why is this coming as a syscon? Why isn't it just a register region of
the dispcc?

> +
>  required:
>    - compatible
>    - clocks
> @@ -100,4 +112,40 @@ examples:
>        power-domains = <&rpmhpd RPMHPD_MMCX>;
>        required-opps = <&rpmhpd_opp_low_svs>;
>      };
> +
> +  - |
> +    // Display clock controller node that controls some clocks
> +    // using display CESTA(Client state Aggregator) hardware
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    clock-controller@af00000 {
> +      compatible = "qcom,sm8750-dispcc";
> +      reg = <0x0af00000 0x20000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
> +               <&gcc GCC_DISP_AHB_CLK>,
> +               <&sleep_clk>,
> +               <&dsi0_phy 0>,
> +               <&dsi0_phy 1>,
> +               <&dsi1_phy 0>,
> +               <&dsi1_phy 1>,
> +               <&dp0_phy 0>,
> +               <&dp0_phy 1>,
> +               <&dp1_phy 0>,
> +               <&dp1_phy 1>,
> +               <&dp2_phy 0>,
> +               <&dp2_phy 1>,
> +               <&dp3_phy 0>,
> +               <&dp3_phy 1>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +
> +      qcom,crm = <&disp_crm>;
> +      qcom,crmc-regmap = <&disp_crmc>;
> +
> +      #clock-cells = <1>;
> +      #power-domain-cells = <1>;
> +      #reset-cells = <1>;
> +    };
>  ...
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

