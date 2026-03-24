Return-Path: <linux-arm-msm+bounces-99617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI0mIjVtwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:53:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB637306C9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4500311A65A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F543E3D96;
	Tue, 24 Mar 2026 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2AcAC+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J22bjL2s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1517A3E6DEC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349212; cv=none; b=G9uzPw3wCv8hf/23xQi4GK/KpdJFTpTW0NnxPfabVKJdtgghmuynBLDETllpkcBB0efxqdXEEtb0rAITK9YIKdmF9hpK6tcshDOwI+Fy52eL/m2UgscS14AB+nRRQjZZb63Uh1v2wzW6NbYPNAEiQ4j7GZhjgLOV48lUWm7bLkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349212; c=relaxed/simple;
	bh=zGCxf41ucmcI39BJMZDvVMwlgpqtPp9lWSYfUynxSOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MgJHproeMdI8BXYIBAxp4jhL7EeboDN+RAzulSHqUjhqYjyER6nkG1zEr0kZZYjJTMuq9E46aMuKCqwzFAKJWTv9vBCml4/EM3mRrU2yLfCcs0zlTMrVotdDgW6mkKyw0fe5VX16o5HlNd6e749riJ16j9k020Ic3VYwO6UiGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2AcAC+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J22bjL2s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9VvhI890467
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xlCUXbyRu6XleGl7smMiG5330ZG+N8aHkYDHhXS+3Qg=; b=E2AcAC+xVw2u7H6i
	EEcGIIk9O3FeyN4ru6dCXEcf1Op7FmCI9QWQrJdGjuk1cFcocGOFF7cM9ymMHU50
	0/aqOIgJdcg8CfxLNpbTbyhaFD327oTFNal6qMnzD03FuKCnoizEuT/mkNueTn2a
	85M2E8dAPYvMMN09J3XumtQ9bm4UzTd1l60SllQmBwWdSZLiVWWQIl0wogq5+6A9
	oJHXE19wMHveVM2Rq6199pFBtU4FXd+r46WtilwGeN+GF8TkUG5ju6mAz63sTpDh
	kRy+TxpfdtkYe3rfFCpsatweiYJnJKtOoa8HrAOqmatMp/zOAWs0bNzJi93gnI6V
	WZp7Fw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1x9ejv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:46:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b8bb5173so2092575b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349207; x=1774954007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xlCUXbyRu6XleGl7smMiG5330ZG+N8aHkYDHhXS+3Qg=;
        b=J22bjL2sCOwDc/E/RsYD9I3XFtnOAKPe76bK6y1I0BTCqwZHNHIMFMc9AZzrqeMzrx
         +zu+141IT96N4dXEY57kySSkBPeSwnnEYW4VhvzT2msJKbVHPMwhfz/vuHHaLN/HUiE1
         q6VEl44aUbbBERbYLEo2naLQSDP/uRU5i18c3sw2f+8OT2eUM6hb7moeisphBf5SotyA
         uK4FuKwP9uQ/WJ0gyxRI3bxGryKkeGbIle45z0Z1CLPAaKF0JbKML3Ag978LEFm5QqGt
         w0u7Y/vTS1t8FU6yEXmP3pIe2+DtnEMYjGpYR11BWhB17bl5e+516CrK0TPFOjiIw1rY
         kvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349207; x=1774954007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlCUXbyRu6XleGl7smMiG5330ZG+N8aHkYDHhXS+3Qg=;
        b=iGOTyoait+/mczSRZqhTig4j0C1Y98XTvhD839reC7UvE5jCvH/+z6F2iyZrLjn/Ih
         eflR6ZDcEBwr/KAmPjjdJ1tQ4vo04sph6dYknzHxeFwPxzBJ4y9jnba0xJ9OpKW3pyyV
         jiQL2rspDOoQ1UadjNXYv0b8CzvGFPD55tgJgDel+Yrh/VmKmlPHGnpSnZwVjcirVkLd
         cI0QSKqjxRxrSvknOhHeZjZrUANnClOu4u2ykRKX4MoNSUP7NTAnlhGgeesa4khF+LTe
         FRQSSqZDMUO+diR5KbwpPOEKRNlp+tptwWvezFkSt0qnnmv0FfpVoZXNGCykxYDqGzU8
         r2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXe0uAQGZpsmSFz5MWuEVHF1/WW+JoNRQJsr/dhTbBx9sSgYaW+wuuJBMwAEshjsgp0v3uPVw9eKrPQr/qS@vger.kernel.org
X-Gm-Message-State: AOJu0YxLplRfoLpLJRkRFBUfB3jvJNHGHM34UWBu4V1pzqjkZHIl2sX/
	vPdrbol/6r6g2zLsEnQ/scI5ePrvpQhjabQ6lK4412ivSyuhm0rw3xoTpGFqaCvL/FqXpB9ZrQt
	yFZ+CPfCW+Dg6S5S5Q9wHw1SgEL1lsAQKF/dR7lSHQKeLotxVxhgjY5cfPgQIfJjnDw9Z
X-Gm-Gg: ATEYQzxgu61aqqoR9JXeAvc2hxZesRrQYl7V1ghUZ19M4hOcVLd9Ou/V96DHGusjP98
	Jbmg/S3o+LG4x2re5n3jJ+CPJoeTH2PgEOMil+3rr3XdamigOeLvKaU55Ny3/yxUdReI3X+XeCB
	A3PIgSv04OBDDN69TF7gl15Df6PHshIL0Cv9kjXyIeJsxu4tX5fXTz/kOBxu8A2D66UuJroc9IG
	11mtk9FkP+TENew2RsEEirq0VuOYRZTmzJSONCi8of3Sh5Sd6n9LfUAqg09M4JmDwVJHeb2x2YU
	/XkWSa+icnyfISnRw2xIKfj5G8ZIwB+iClpbWUkJT6GKGWEa4DHeH9ee1hiBujSbuBeMW7b0B3O
	FdU59uDac6B1iePzZWcDt0TqmBlRJH6nCnlhKf6cFNUBrLQOBFmJx
X-Received: by 2002:a05:6a00:4fcc:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82a8c211eeamr12266105b3a.13.1774349206697;
        Tue, 24 Mar 2026 03:46:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fcc:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82a8c211eeamr12266082b3a.13.1774349206165;
        Tue, 24 Mar 2026 03:46:46 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm11946398b3a.31.2026.03.24.03.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:46:45 -0700 (PDT)
Message-ID: <873e8ad2-50cd-4c09-9a51-20ad745fe8dc@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:16:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-1-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX6QaSJH0aXGvL
 kbJ/EqGjH5QPikt79YcwygWFE/D4l/ceaSH6reasFptNz8nRVVllA3+S46h4ftJOutA7uJ5Wd63
 duC40q0vaSRzCRFEbFF1pawFVHuHFvV3rbA64Tm1aPD0c5xCBw/c5Pa92CNgxUvgGyjQdqzFfY2
 1woMyChHx1gXPTijXJSLOMQ15x16AilZTfNU/+lJoiI2etZH37CqHRWQln9sLotphaGT2UoGtxA
 iveuO1sIfY1hgVcJlhTfOIyCSop3mm4W3zi+C0iNdgk9JoAoOu27uGuEIcQJ8YHeNXdw5GknbLG
 A54pJfz1wvO8WbJEObH3Q3E+j1CX6kO2UFPqJ4O5mtsIAWXQrKePCD+VGHnR+IClw0QtQRq8w12
 Pj0RS4/cGIhF90WnEt9Byl+fW0vvYweagveYxbNEbbRUjMPlQJe4YzJFnuchdtP8GZcxdBy2i1q
 XZySvfYjT6b6JRK9H1w==
X-Proofpoint-ORIG-GUID: cGk9JJpxX2CkmDrlxbWnLuW4DOwHCc2p
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c26b97 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YA6uSS_--xYBq1kDVlIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: cGk9JJpxX2CkmDrlxbWnLuW4DOwHCc2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99617-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB637306C9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/23/2026 2:47 PM, Harshal Dev wrote:
> The DT bindings for inline-crypto engine do not specify the UFS_PHY_GDSC
> power-domain and iface clock. Without enabling the iface clock and the
> associated power-domain the ICE hardware cannot function correctly and
> leads to unclocked hardware accesses being observed during probe.
> 
> Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
> power-domain and iface clock for new devices (Eliza and Milos) introduced
> in the current release (7.0) with yet-to-stabilize ABI, while preserving
> backward compatibility for older devices.
> 
> Fixes: 618195a7ac3df ("dt-bindings: crypto: qcom,inline-crypto-engine: Document the Eliza ICE")
> Fixes: 85faec1e85555 ("dt-bindings: crypto: qcom,inline-crypto-engine: document the Milos ICE")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index 876bf90ed96e..ccb6b8dd8e11 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -30,6 +30,16 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: iface
> +
> +  power-domains:
>      maxItems: 1
>  
>    operating-points-v2: true
> @@ -44,6 +54,25 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,eliza-inline-crypto-engine
> +              - qcom,milos-inline-crypto-engine
> +
> +    then:
> +      required:
> +        - power-domains
> +        - clock-names
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +

Hi Krzysztof,

As motive here is to enforce 2 clocks for upcoming targets and keep
minItems as 1 for already merged ones for ensuring backward
compatibility. Can we do like below?

allOf:
  - if:
      not:
        properties:
          compatible:
            contains:
              enum:
                - qcom,kaanapali-inline-crypto-engine
                - qcom,qcs8300-inline-crypto-engine
                - qcom,sa8775p-inline-crypto-engine
                - qcom,sc7180-inline-crypto-engine
                - qcom,sc7280-inline-crypto-engine
                - qcom,sm8450-inline-crypto-engine
                - qcom,sm8550-inline-crypto-engine
                - qcom,sm8650-inline-crypto-engine
                - qcom,sm8750-inline-crypto-engine

    then:
      required:
        - power-domains
        - clock-names
      properties:
        clocks:
          minItems: 2
        clock-names:
          minItems: 2

This will ensure for every new target addition, default clock count is
enforced as 2 default.
Please share your thoughts as well.

-- 
Regards
Kuldeep


