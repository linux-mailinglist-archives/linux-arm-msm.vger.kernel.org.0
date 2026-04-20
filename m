Return-Path: <linux-arm-msm+bounces-103822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KuFH8Zu5mmBwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:21:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6EC432BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F7A33146032
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D5C3A6EE0;
	Mon, 20 Apr 2026 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVy4wGqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UY3G/cTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1133446CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706748; cv=none; b=Bfm7SZ2cEaTU7sc/M9zH/Ohxtc1kSka5jbp6NWiMsE57CMjuc7A56uejmGquUMnMQBAthzM961YWTIY5cm/kTyZNKlInirCItnOoaszWsc0kGkE4KQIoWoAKfqF9WkKHhIniaxHmqz9+APOdVWWvbnJbyqR/cFWZv5b0CJDltk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706748; c=relaxed/simple;
	bh=DCz4xikQi7sloDAct+dFldHP+8xWbQUqhVb6qb0hy+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gyz59HV2meyrHoAYU8P+xt5wcGp+ve6iEmalcWgIymAD8P1VxB0WlvcSN9ANVzZCXQ1cCGNU3zdG2NWD5bUfL4veCy5pQkhhJhbeAmEmblPvlL8ymjOUI7kA63616r1IAQTtDIqfcMk8Gp5RqbYVK9VVGlMw5X9cyrwX9lyeEUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVy4wGqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UY3G/cTR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBwKIU3212182
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4rd/H6ZkqpeTiBEVqAYI5X0D
	pzNL4iIOzFJzHqgyAcc=; b=GVy4wGqT2aIyMIM+yuWNTRGp2A3GxdJdfQyRC1Ms
	ZaxGKvJrmu3O2DfiJ8RRxV50YvmHnvaOcfOe9O/ZyuIMp1//feYftZyP6TKDFMzJ
	Atr3QPygCQe3TBCyKGqbj/sh/MGs9zS2ioBYSGKrGbQtMToS5+Zws008xX4/kMvZ
	RbNMfH1bXd/rFwqIY2jPn9/qNS1lwh67M0s3n9b1wsJX2voRS8Sgl9oiDVN/xrHK
	c7Rjtcn50bK+AMprYxvjdCfZtDx7dAxpOJ1hJ2kD5oIFH3L0LgLNgk8Di88j9zfu
	YO8ILaG8oZ8g6jA3wAW8gyUacvFtTbTGsp4rNS8EAe6QRQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfjm0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:39:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faf575af4so8349241cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776706744; x=1777311544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rd/H6ZkqpeTiBEVqAYI5X0DpzNL4iIOzFJzHqgyAcc=;
        b=UY3G/cTRLf4xgw4qcrJLUNTuwilh1etudath/vAQarU6JFIlKWvYgvUNbygdsG7q50
         H7WLdbbLJ+dgU+zjNExgMWamMlgKSHUHiartdBIuaekDEdkMijCBcZ2dDMtAS4nmFs8L
         qfrOEle0+bDjIIWZVTCapky0s/IoDAkHkzlIK0oQ4bwXVE+U9MQf6iA/ZTM7pHGfAjnu
         nF0OtcnMYOdkHC0y8YDX47ktKACa4Vyw4G25n7LOlxd131aC4snOE4P7Ww1OZmicQufe
         jtW2QYXAlp4sCxOKD8O0YVSB3qSlLxKsBEIDNq9or2Qg5XT0RiSir8H9Fc3vzoEZ7kiu
         0QCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706744; x=1777311544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rd/H6ZkqpeTiBEVqAYI5X0DpzNL4iIOzFJzHqgyAcc=;
        b=C4QQBbBpy9V5hJ5XK6ppa6ohLf+NUEHSnFGR8d2/ZE5E6bXPmACyE9xYSyGlWDLzEc
         BERCRhBupV7sGIgLXmlXgHV1nIVZja4zT0ATjyFRhzZUfmWTGbY9oNdBY6IL/gjcTlZZ
         DqaUHZP/EUpOGcbOgbYSEs3tB3TTV2teHpSNeg9NWUixm2qFFv7XrGWUPoRNOH0C8YmL
         Jqy2twAZyylu0hWN/P5/Vk2lKO1jymOowbTckTXRnK0ERf3Kjh8T6aiOMH8le2S/7Wvo
         Lq2DhkGiPos3ww5bEzxUjfiRHLKc2HZw+Miunu6rILUIrxWzEAS5Q8ZcJHwhT3pzgJH3
         v9nQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VIYj2kiat3munSz8OK2hOmJ5AzYoDqeU8oTCRy85vs2y87yWtm6kkc6vA1N+2sEbkagdCQ6JMkYXcVXPE@vger.kernel.org
X-Gm-Message-State: AOJu0YwLS8pWLK3172tqS+44pFJ/Bv6K2wUdfg0yG/9+to6PMyw9BoxT
	GyNyjTEQzDhj5WC7BVWug+vs/uorq4Qys50E8zEnxX4i+ApojiNAYsmvEiVu1JtCKOe0cD4ds0D
	RY5jHHmGa3yLPCYHYv6HIPB2jk2/xqP9vFSfuf7dwS4S5JGH833l3+j+65Mo8vJAIdYRP
X-Gm-Gg: AeBDietfSdm2rI5w5FQXVppcxIyx13DENnRnQzFdS0xsDhE6jt5fO4wOS1gCqbDG77D
	jlSuhRSalWmMwux9Qe/rDr4l76iWYXuQeGWoxrkTHq8v1HeW4Q5pflD58c6F2tNWW5O+GLxVId0
	9d7inCIElbylz4sHs9Je62zWBmibaj/nmdLx0ht+UrK13UXE9RV0jgY5aJXv9Q8p6AR7JJ78S+1
	WscDkZ3vFEyfRlNvJ4NFdjV+MhRgvFMu+DuDIcrtsIafuYGwSv3WdTky9exO9gCg3MQ2TwEM1q2
	gFO8M+BKVEYEovvfgiMhcErDsmwVk54P6VxOUK5jO7D+ECKSoq002e62+ruQfVEg7+vM3rlQrnw
	j16vY+hY2iCoKszQESr0YJrFp3pXOH4MmQEkjNfUWaFTE5tUSvscPzXclz6SP9Zaztpuv1sSUjb
	hiNV9jzknzUcdcJVovYaomlCirM8zWSf1jE9yzpLTw4Wjwwg==
X-Received: by 2002:ac8:7c56:0:b0:50d:9b07:9c2b with SMTP id d75a77b69052e-50e36c8da62mr221698281cf.56.1776706744126;
        Mon, 20 Apr 2026 10:39:04 -0700 (PDT)
X-Received: by 2002:ac8:7c56:0:b0:50d:9b07:9c2b with SMTP id d75a77b69052e-50e36c8da62mr221697721cf.56.1776706743586;
        Mon, 20 Apr 2026 10:39:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm3116028e87.7.2026.04.20.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:39:02 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:39:00 +0300
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
Subject: Re: [PATCH 01/13] dt-bindings: soc: Introduce device bindings for
 CESTA Resource Manager
Message-ID: <kylte3ehrzsp3egp2y73jygjvqpsjym4sl54377ouv3nqxp5u5@cyd4nwfvwirj>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-1-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-1-eb27d845df9c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3MCBTYWx0ZWRfX556DP/ji67DG
 ZjMJobBYwbR9m0wp/2dN+btNy7g1NsygFWdYu7Xrm05amokR9U6nfRrdECrz8mLG+bs3c4pQISL
 x1mbq/pu+OV45el5Qc1aRnASfkNGvztPlbIuGjsmrcBb8J2NcE+46D+FiHyHKxiTyn4tSAxHbRV
 I6eYZiD2NhJjpR/cL1VdSUcAcImmNPKutC9OVzmORvlEuma2LN0rVQeNIF+94bklUxXGQvKBd8e
 khDoolZUe6XNtWxClWPwDOQSZ3c2t9gte7TNpwNum5aJ1pvd2Ed1A4g8GTmVz+HW17wkcbCsXl3
 oJL+l2eIESCDF8c9fHjxiHlcUsDxwMTZipnilTSmXn4+LoLfM0hBwRP2KGMdU2ZRUdH06RAC93d
 vSKqLFgCgkRjC8B6Qu10JQIRcSBfd9pNiSr+GVRAOTaMwH3L2AF7P34HpdGioDrJBbl4UOaJvHc
 5ADClglZOlPzf9D/u/Q==
X-Proofpoint-ORIG-GUID: kY9GpsFBAzEeBidrYTo6qlXkiw696cF8
X-Proofpoint-GUID: kY9GpsFBAzEeBidrYTo6qlXkiw696cF8
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e664b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=X-DtfH6_GkF8GqkYvjkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200170
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
	TAGGED_FROM(0.00)[bounces-103822-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,devicetree.org:url,af21000:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 7F6EC432BD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 09:58:54PM +0530, Jagadeesh Kona wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> CESTA (Client State Aggregation) Resource Manager which is responsible
> for client side management and aggregation of local resources.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,crm.yaml     | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a1485db8b7476b0cb0b4e8a41adc8fb4092b731f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,crm.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,crm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. (QTI) CESTA Resource Manager (CRM)
> +
> +maintainers:
> +  - Maulik Shah <maulik.shah@oss.qualcomm.com>
> +
> +description:
> +  Support for communication with the hardened-CRM blocks. A set of SW
> +  client Direct Resource Voters (DRVs) in CRM provides interface to vote
> +  desired power state of resources local to a subsystem.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8750-disp-crm

Is it specific to the display? Are there any other CRM blocks?

> +
> +  label:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    oneOf:
> +      - description: Specifies the name of the CRM.
> +        items:
> +          - enum:
> +              - disp_crm

What for?

> +
> +  reg:
> +    minItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 6
> +    description:
> +      One interrupt for each DRV. The interrupt trips when a message complete/response is
> +      received from the accelerators for the desired power state. Number of interrupts must
> +      match number of DRV blocks.
> +
> +  qcom,sw-drv-ids:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 6
> +    items:
> +      minimum: 0
> +      maximum: 5
> +    description:
> +      List of SW DRV IDs used within kernel. May contain holes as some DRVs can
> +      be allocated to DSPs / can be spare.

is this list defined by the kernel? Or by the fact that it's a display
CRM on SM8750? Why do we need it in the DT?

> +
> +required:
> +  - compatible
> +  - label
> +  - reg
> +  - interrupts
> +  - qcom,sw-drv-ids
> +
> +additionalProperties: false
> +
> +examples:
> +  # Example of Display CRM device with SW DRVs
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    disp_crm: crm@af21000 {
> +      compatible = "qcom,sm8750-disp-crm";
> +      label = "disp_crm";
> +      reg = <0x0af21000 0x6000>,
> +            <0x0af29f00 0x100>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      interrupts = <GIC_SPI 703 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 708 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 714 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>;
> +      qcom,sw-drv-ids = <0 1 2 3 4 5>;
> +    };
> +...
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

