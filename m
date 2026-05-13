Return-Path: <linux-arm-msm+bounces-107256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBsLAPRXBGqjHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:52:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 67893531AB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2C8F30031F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 10:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21ADD3E7157;
	Wed, 13 May 2026 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gvyssquz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xh/UmnxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769F431A570
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669411; cv=none; b=Rk/h92ZySP5yc9guD7XbBgQbQAYmPuUGP03CESfxOaSqrFbhSZjgEKL9kla7ejhph1zQ1SaKacgHK1DAnv3hrInPS+tm/+nVSlgVw1LbScFgyCwQeKX1Nzw9YsrKIx6/hi7zOoocfDTJii0L+d2c8x/+9WznyTbJ4lDg9v9l9NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669411; c=relaxed/simple;
	bh=DXi4Y80MN66nIOaqAz+hq/1Z/6xBva7+tyMd/GkSu3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJhCN8871bM+ENFx+idOB3yZfLKqAa/WAcLrQNB5Aaza+HTzEmbq/UcKol2f1tUMjAiN3VZmEDIMaFvPFYgMe3katECbmZGooiNSxUqyx1pGHG6FGi5UT3I5mRtxjlrMTzAinhlEkoMoMS2p3h/+252iVp6RSwFBfhsOMXdDRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gvyssquz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xh/UmnxM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6FJN23324682
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7V+mRZjGBwQ8z49H8gLTd7V3wys4X3Yfy1pB9/n2aAk=; b=Gvyssquzf7F0TEw3
	sKN4qi9UgbSNfK6eHpz1oLsyOgjvRt8j1BHt2m7gg/to2eIlQu+xakla55TJNC8G
	NOQVU1WWWEL+KI4m71+n8E8w56rz9ezVgEnwRNZe1O5Fsqx9ZyNrJY5ITf92J7wS
	gFbLuhjdmyZu9IPIEVtHlneIoauM3+GLzaxa+g3sfRi/QxN+PLs82UJZ8GGta1W5
	g51rRNVflLrg6jEJvGT38pyNGRdVAsfzmjSpgCopzCDulV6ud082LUMtCsm1LReW
	DHyAwzVlubzaj3VHkk+ZwPMR60Uce6KhbV5XHtP/iIhzUtCVNo+93hEsPzi5Cyky
	58ClKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd931m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:50:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a6d84522so124858735ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778669407; x=1779274207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7V+mRZjGBwQ8z49H8gLTd7V3wys4X3Yfy1pB9/n2aAk=;
        b=Xh/UmnxMJdy2L6FkCkMc5RARwv5J5ecNBfEYJIk37uB0qkAjSh/t1jsaZ2l95HYSwm
         mZxNvjuDHNvCRBbQJBC5FR0I8DrtPlVgSroPpHkXWV6hcPyabTKKOvejS24cE5vXXG5z
         RE8eMB9xRjF1XWWX7//KRdmvpLaVLlOnoKt5pbkBIOJfFo804nEcNDN2rbEsxJmjGVIM
         MfjwWeHTW/XuymxGJmaUbEVB3yZA98kNzJxW0VoY77lLtzwc3Fr46PVafDFGovLZFzvi
         FFdXC96Ly0sdQjAez6E9UK30UPnRBYkr4ZCPJkjv3zu6qlInUO9eqIniHPmyMNAWuc3R
         gCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669407; x=1779274207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V+mRZjGBwQ8z49H8gLTd7V3wys4X3Yfy1pB9/n2aAk=;
        b=Gs31sMElqWEmT0+zOFzbMoL3QYmt/LbmqSdz7142aLBbGYmkN9yzYjyfOOcu2KrWsD
         8YcjSXn5nwyQZjwDHaw71T65Ht+TSqOs5h5dp0fTHslGOU6OYotZMva9HgIrP+Fn+gk9
         KOBcInPqKq7xyakrGClTuzbGSwpIPoLZjx4Pc3yj7RQkTi+oMzxmmQxkwSd5DlExHlUE
         FhB7gePbcdkIxF5qdjcr9jXSYiAYQmXk7qBTh0i0fnBOBQQIMlL68O00KleCBXUwK0mP
         NCba+NVQ7uV0wM3fAPBta6hp4WgCWpuNC28qxZxvzJwV9sCul3m38bso68Yg/TQ2P7vl
         QXBw==
X-Forwarded-Encrypted: i=1; AFNElJ/Ak0uWtyts73IvnecveSjuTOCchqtkfsk8FEJonQLIrA9uGR93S+U9IGa87QIiWxYFq1E2VcMdq1wOZcA5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+rMz/FEnrp7EvNwWi6zp50afrRpUB840t1I0dhc41utybyKoW
	0qph/gcCft1PtLeh6OfOL6L/2drA4t/ElXb+RHHwlN3Zmbw93zCK9XPnt0kCN5tyh9nb6go59Gn
	uh6s6owemaHe0dYljBxHfOmHOuml/TSfVpllBS6jpUc7nEPMdTHDPVfMNYseHNAxXFjnr
X-Gm-Gg: Acq92OGGie8ofWFoSnx9M8cSfIBg8ybOga5dDmNxvBaGyR3GsvhU25+ZUqhuCyTep0w
	8/nOHK/bGiKR1HmKoS8g8/OKXw7yfCD0Fqt8L0djm89I0HsiAIZqphtpLKRAV4b3p9cim0ieUh/
	CKIGxh/e3usY9mAwzSgWVBcl4Auc58m8W4/L/bCmYT999fmxVAO03gxWbK08FyAYqjhHaZwYe6e
	fnv1ykg2Dxh7oN8opxPzMqE9SirxSiWSqa20tujYuOAIihTxXzlcLsTcb7iVd0Ij5elYAvAeeyq
	HNzQJsG1La1tYczhkV/hkej+mbAriC3AAbQgmDZuZJCjG9ZHXlrLfQ0s1rryeovi791DbKG8ehU
	7vXQvM8ETXBeGIlUnuAHp67i4YWlaug9tC52/bRyMW4drFGeelUTT
X-Received: by 2002:a17:903:17c6:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2bd2773e38fmr30000235ad.41.1778669407314;
        Wed, 13 May 2026 03:50:07 -0700 (PDT)
X-Received: by 2002:a17:903:17c6:b0:2bc:8f62:990b with SMTP id d9443c01a7336-2bd2773e38fmr29999765ad.41.1778669406768;
        Wed, 13 May 2026 03:50:06 -0700 (PDT)
Received: from [10.204.66.232] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec6e7dsm167884715ad.82.2026.05.13.03.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 03:50:06 -0700 (PDT)
Message-ID: <c3aa11e3-21c8-4150-918b-67e300c55ccc@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:19:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
 <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6LQmSbcnF7gZ8PQJ1zPyNFQg4To3AkoP
X-Proofpoint-ORIG-GUID: 6LQmSbcnF7gZ8PQJ1zPyNFQg4To3AkoP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMyBTYWx0ZWRfX8dRZUv+hLMEi
 wwevfhh88XoP2GtOQ9hYdZBE0cbAplwJ90okQmv61O/eySaqzgFXn9h8RLmeO1clr87igIp09gQ
 +NqZ1g/zlXaw/XRrYmGwWtRtz3lj5gOhgSQRfgiZfvjhCext1oa8YGgtwxgdHa6QGfxXo+2AOTd
 R8DdMVtKBQ1zMSTWkS0uYOedisjYQoLIKCFcWBm8vj4EK1b+I5u4w11/ZVsYAjrAipAkv5ZSdSb
 h1dMMaYduy5lbhJ3NhEIMPN57LJEp9ecGVOJtm/90B2QcN/bY96WKd5N7sk3YRaJVEk7eqEAxCg
 2e8V9r8SJxkXB9Fnn1UYHSr5ObpMBGyu3Ub5JC23AZzljcZL5M+QBAtdarte6B0ztV1eeoS23A7
 pHfjTq6aePxScRPLVPyDZtcI8cyG/4bj17iW/TCBn0wC2ubKvooxRURa+NwbvP+CwiK8uOLMkao
 sndIz5DxSTwXOOZ8RNg==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a045760 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=x8rGuSE_rcxhvlVRD_QA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130113
X-Rspamd-Queue-Id: 67893531AB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107256-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acb7000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/11/2026 2:29 PM, Wenmeng Liu wrote:
> Add bindings for the Camera Subsystem for X1P42100.
>
> The X1P42100 platform provides:
> - 2 x CSIPHY
> - 3 x TPG
> - 3 x CSID
> - 2 x CSID Lite
> - 1 x IFE
> - 2 x IFE Lite
>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,x1p42100-camss.yaml        | 352 +++++++++++++++++++++
>  1 file changed, 352 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..757eaaa0359e724b141863a50d1d8d0b81749bb7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
> @@ -0,0 +1,352 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,x1p42100-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1P42100 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1p42100-camss
> +
> +  reg:
> +    maxItems: 14
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csid_wrapper
> +      - const: csiphy0
> +      - const: csiphy4
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +      - const: vfe0
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  ranges: true
> +
> +  clocks:
> +    maxItems: 21
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe_lite
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 10
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy4
> +      - const: vfe0
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +      - const: sf_icp_mnoc
> +
> +  iommus:
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
> +          - description: Legacy slot 0 - do not use
> +          - description: Legacy slot 1 - do not use
> +          - description: Legacy slot 2 - do not use
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: top
> +
> +  vdd-csiphy-0p8-supply:
> +    description:
> +      0.8V supply to a PHY.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      1.2V supply to a PHY.
> +
> +  phys:
> +    maxItems: 2
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy4
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-1]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: isp@acb7000 {
> +            compatible = "qcom,x1p42100-camss";
> +
> +            reg = <0 0x0acb7000 0 0x2000>,
> +                  <0 0x0acb9000 0 0x2000>,
> +                  <0 0x0acbb000 0 0x2000>,
> +                  <0 0x0acc6000 0 0x1000>,
> +                  <0 0x0acca000 0 0x1000>,
> +                  <0 0x0acb6000 0 0x1000>,
> +                  <0 0x0ace4000 0 0x1000>,
> +                  <0 0x0acec000 0 0x4000>,
> +                  <0 0x0acf6000 0 0x1000>,
> +                  <0 0x0acf7000 0 0x1000>,
> +                  <0 0x0acf8000 0 0x1000>,
> +                  <0 0x0ac62000 0 0xf000>,
> +                  <0 0x0acc7000 0 0x2000>,
> +                  <0 0x0accb000 0 0x2000>;
> +
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csid_wrapper",
> +                        "csiphy0",
> +                        "csiphy4",
> +                        "csitpg0",
> +                        "csitpg1",
> +                        "csitpg2",
> +                        "vfe0",
> +                        "vfe_lite0",
> +                        "vfe_lite1";
> +
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                     <&camcc CAM_CC_CORE_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY4_CLK>,
> +                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +            clock-names = "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_vfe0",
> +                          "cpas_vfe_lite",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +           interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy4",
> +                              "vfe0",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc",
> +                                 "sf_icp_mnoc";
Is sf path required for isp?
> +
> +            iommus = <&apps_smmu 0x800 0x60>, //S1 HLOS IFE and IFE_LITE non-protected read
> +                     <&apps_smmu 0x820 0x60>, //S1 HLOS IFE and IFE_LITE non-protected write
> +                     <&apps_smmu 0x840 0x60>, //S1 HLOS SFE non-protected read
Comments should be kept to description part
> +                     <&apps_smmu 0x860 0x60>, //S1 HLOS SFE non-protected write
> +                     <&apps_smmu 0x18a0 0x0>; //S1 HLOS CDM IFE non-protected
> +
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +            power-domain-names = "ife0",
> +                                 "top";
> +
> +            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
> +            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    csiphy_ep0: endpoint {
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
>
>

