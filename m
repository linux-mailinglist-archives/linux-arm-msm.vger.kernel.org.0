Return-Path: <linux-arm-msm+bounces-109206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Hx+HsggEGqjTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:24:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C68D15B11AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 295C330151E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4998248B;
	Fri, 22 May 2026 09:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ea7evTwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhLLag7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C7314B63
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441464; cv=none; b=oXTJ+cRxnFN3OB6FLnMIHmH5Cj9C42ZhfGi+SF/yiZpqcTj5S4xaEC+k0GCZFhOBMqANW4L3kWCvWm3oWnEf89GSSF2E2TyKNEmhtRnUqWqahhykI+SYBYo/Yr/2Jgc+kdzQGw4h22K2/iTR4R606Q3uqkXyR5HSw7VVfQX9Aw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441464; c=relaxed/simple;
	bh=x3RGqmi02L+B1ceM7ajx1UAM/CpjTvdaSV2SXh5VD9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/HAC5xEqhTlTZZndRuc+32sqIgcZaJAa03OZRWXYlWkHg6K1wCLCg4yUqbQLqwCh/Q2ar0gVdIgYK2eLka7iNInTTCIVLUBsZ553xsYX1vVT8LFq8PT0D10WuxaRB/aqUJwUpLv5aRRZZKOsTBsjqCktjhJsp86P8vNDmYKOu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ea7evTwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhLLag7q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9Dh0p3005101
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AzvTTIr3cJGUQwmNxyvJg4Lnn3zUHh4faG+9J1SDeU0=; b=Ea7evTwvhGg3h4GB
	byPpTgL7JAzMdGkJwWSTbOsT8P8VAa8n4DxEFfmKHHD9/eTWrCg2Y7jNTtZmgRWw
	jzqHX0KdeSkKgZmgZkujA4mazWYR4ao5khAgwrb0bs9t0LjUfYJihtasCK78bbO9
	q9p8/ORoU0LCw6fZJDo1JZf+AU1xoYsvX2qOGRESonCyR/lf+ShrhKNit/N9cUaI
	PE3+NI8MfKHOUyFGiiZ+KiwNnbYeCrtIp3LjPo+EoFjXJw2B10Mv8CKi7P0p5RCn
	Tyfna8yy0FQ5JkgP6wQ5lwfEuWgOqqA2WyFGWppOzqRZVtydGy1iILboXfE8pn2s
	ni3bJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt99aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:17:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso70507995ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441462; x=1780046262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AzvTTIr3cJGUQwmNxyvJg4Lnn3zUHh4faG+9J1SDeU0=;
        b=dhLLag7qso9k7z5667xb44CPdYArIWqyFY4Jz2Oz65XPyWOU68MLe2czhQhmI8bsdJ
         1WW5HcpqpR6tow1LF80xQ7PIzpuGaaKFpcfDjNXF3gQaHZxvo2nyVRtFs2IEKTdsJ1vU
         gslwe1LvMarZF7LA0M7YWUN46ag01D7CgcpiKP3znO25bHY77EbKfTzKmqoy5xSI+XOQ
         FtD4MN9kJ7vwUOw3g++mygKcY6sh74C72eHWShtVf9e83ZkW5kTRxRiAnnP7+H5MpQpd
         d6IzLsTWbN3r4fupORxoCqNrGffS6mYcIU8dVq5acbhfA6Y/rqBphWlk7p5wsEmbQjMM
         NvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441462; x=1780046262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzvTTIr3cJGUQwmNxyvJg4Lnn3zUHh4faG+9J1SDeU0=;
        b=MGRQbSYK3ONbWB8f0x8qIOTlRQca4ffVB/FBYCC3CHhDdfWmkFW0/ehhHHIdC3gSZu
         f0zDt33iYmigRgxwuBIzCJxN6gAZ5NnMl3RTyG9ZejP3TiQOR5Iv2+6PchD51i8pOqeI
         ya42//bulyORg5usFgB76zXv+JIGsu6aNfDYDeVBDLX9mFMhGP4UWj4UsXuKett91d9y
         f5ckiUO0EdOB2DnWLlT5TYnm+7ICQJkxws2Nw+YxEH8aj5HFrrGUQZlq+EwivBHwmGSY
         fFGDochiTLzWAtQq17g9m4eL74LqbV8d5q5vaU9WGmrXHNj35+JiPt0rDy6u2078yjb9
         GDHg==
X-Forwarded-Encrypted: i=1; AFNElJ9ljgQ8tmMpJBKR10D1OnNviprmBNsaib32B5W0B1KdqK39tCwjZZ0IZCI7G3pR8JGJ/k3VVWaPsDPlwpni@vger.kernel.org
X-Gm-Message-State: AOJu0YwGFu1FNbiEV5RhqyCXeHidYCVJY03pRFyeFbbTL4qCwt3CfAdL
	HA58e2KCHnlnzsKJ+EQMaL+qkT7w+NJ3caoiXJDa4fzbCoFogOkntyIvmxJUzZOIi2BpJSTNb5G
	ZIRZ1m0aGjfuUz7jEzeXV+ZILh3v08Qy0ej64TfdCzDbnWL91P3yX63tYKa6fcop4qkjN
X-Gm-Gg: Acq92OHjgh/v2/MxfIYEKNJl95bCDI+ZTc0vqzVXDj4WSfr1jlA0+HVA4oRErBEDYQx
	fuFR+BPXhJauTiu5fUTwezdNI9SMaYiIcxTp55fUorF5UNQUgQNiK4wcx5OQ05XpQDMlFbxP+NZ
	Rme0s1h+Vh4hgswNLhzLgYSV2UpDFwuzbixPeiMc7AvnZCEXC1oVQLi89yPg9cDJsZmFf+k94f/
	BcQdNpdNUnGJxwBeT6i+icrpA/98Ph9hoLjKOwXDdLY5tvvQQSDxdDpkcvpdzgCCqJdw746Z/H+
	Ya5VQ0yduSyoDnHbyJdVsi/e59UiSqPhhnhaIMEHLerYSiOkxNt58u0eX1rQOoWOX02BmQAd5qf
	/rwSyK6hPfKmiUI3S2sEXiYsSPZGgx4DXWPUXT9hPNDPqGGyD7sa73Q==
X-Received: by 2002:a05:6300:6d8d:10b0:3b2:8675:47ef with SMTP id adf61e73a8af0-3b328ed49damr1680129637.45.1779441461900;
        Fri, 22 May 2026 02:17:41 -0700 (PDT)
X-Received: by 2002:a05:6300:6d8d:10b0:3b2:8675:47ef with SMTP id adf61e73a8af0-3b328ed49damr1680096637.45.1779441461364;
        Fri, 22 May 2026 02:17:41 -0700 (PDT)
Received: from [10.92.193.94] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165003369sm1548246b3a.57.2026.05.22.02.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:17:41 -0700 (PDT)
Message-ID: <1cf87303-2394-454b-9541-4a3ea4f3ff4a@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:47:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: PCI: qcom: Document the Eliza PCIe
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
 <20260521-eliza-v1-2-97cdbe88389d@oss.qualcomm.com>
 <20260522-calm-bug-of-kindness-2dfae2@quoll>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260522-calm-bug-of-kindness-2dfae2@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a101f36 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=2kbbHuhoKpOpG5pfR5YA:9 a=YgbPQC_rjE-wQlsd:21 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MiBTYWx0ZWRfX7IRO3qgAPRxz
 CDQoileT332aOdi73vVDVeyDcFZwef7wkvXV8yZRfnFBSMiLywmoBkccjZpqIS/UPaWR2U4B2TM
 mCpAUiQ+21J1mHWJuCny8UmT2fVS2DcOl4KptdgZKtXis7oK/FxWH9hUj/vRrWWdK9mQGMwhcX1
 +UccWYnZ3JYGVjgN2tBVoUcmTqF8K58E8fsvsapSvevZXAk4xRS8Hiq+006UimmNKCGExuHitn0
 cuolgvCse+ZYayTdCX4jgadhu8Zuu6f5yq1GlEwbOkbEQMcRr3GFgnheclU4e5UwB4hFOyZCCs5
 qAepSLwpYmrgEgHDFA+hdbOwvXBkZ9tWvEnwacwxCMYJfHXneDr9OZuHXBkiRPjIwDgVT1cr2mI
 pzebIxE6EDtSZpHF01pFJveOzGf8VcWREI7GvPoVt8391wp7QXenIlIrqt1Sy7F6ijQYl1Q7ASe
 pkllhGijEZxo/v6eNCA==
X-Proofpoint-GUID: gFNcLxwImNxmPgdGBAqu_hWHGlfAkB5b
X-Proofpoint-ORIG-GUID: gFNcLxwImNxmPgdGBAqu_hWHGlfAkB5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109206-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,1c00000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C68D15B11AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/2026 12:20 PM, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 07:35:30PM +0530, Krishna Chaitanya Chundru wrote:
>> +description:
>> +  Qualcomm ELIZA SoC (and compatible) PCIe root complex controller is based on
>> +  the Synopsis DesignWare PCIe IP.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,pcie-eliza
> All new pcie compatibles moved to correct format.
Ack, I will change it to qcom,elize-pcie
>> +
>> +  reg:
>> +    minItems: 5
>> +    maxItems: 6
>> +
>> +  reg-names:
>> +    minItems: 5
>> +    items:
>> +      - const: parf # Qualcomm specific registers
>> +      - const: dbi # DesignWare PCIe registers
>> +      - const: elbi # External local bus interface registers
>> +      - const: atu # ATU address space
>> +      - const: config # PCIe configuration space
>> +      - const: mhi # MHI registers
>> +
>> +  clocks:
>> +    maxItems: 7
>> +
>> +  clock-names:
>> +    items:
>> +      - const: aux # Auxiliary clock
>> +      - const: cfg # Configuration clock
>> +      - const: bus_master # Master AXI clock
>> +      - const: bus_slave # Slave AXI clock
>> +      - const: slave_q2a # Slave Q2A clock
>> +      - const: ddrss_sf_tbu # PCIe SF TBU clock
>> +      - const: cnoc_sf_axi # Config NoC PCIe1 AXI clock
>> +
>> +  interrupts:
>> +    minItems: 8
> This should not be flexible. Neither 'reg'.
ack I will remove minItems
>> +    maxItems: 9
>> +
>> +  interrupt-names:
>> +    minItems: 8
>> +    items:
>> +      - const: msi0
>> +      - const: msi1
>> +      - const: msi2
>> +      - const: msi3
>> +      - const: msi4
>> +      - const: msi5
>> +      - const: msi6
>> +      - const: msi7
>> +      - const: global
>> +
>> +  resets:
>> +    maxItems: 2
>> +
>> +  reset-names:
>> +    items:
>> +      - const: pci # PCIe core reset
>> +      - const: link_down # PCIe link down reset
>> +
>> +required:
>> +  - power-domains
>> +  - resets
>> +  - reset-names
>> +
>> +allOf:
>> +  - $ref: qcom,pcie-common.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,eliza-gcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        pcie@1c00000 {
>> +            compatible = "qcom,pcie-eliza";
>> +            reg = <0 0x01c00000 0 0x3000>,
>> +                  <0 0x40000000 0 0xf1d>,
>> +                  <0 0x40000f20 0 0xa8>,
>> +                  <0 0x40001000 0 0x1000>,
>> +                  <0 0x40100000 0 0x100000>;
>> +            reg-names = "parf", "dbi", "elbi", "atu", "config";
>> +            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
>> +                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
>> +
>> +            bus-range = <0x00 0xff>;
>> +            device_type = "pci";
>> +            linux,pci-domain = <0>;
>> +            num-lanes = <1>;
>> +
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +
>> +            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
>> +                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>> +                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
>> +                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
>> +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
>> +                     <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
>> +                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
>> +            clock-names = "aux",
>> +                          "cfg",
>> +                          "bus_master",
>> +                          "bus_slave",
>> +                          "slave_q2a",
>> +                          "ddrss_sf_tbu",
>> +                          "cnoc_sf_axi";
>> +
>> +            dma-coherent;
>> +
>> +            interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "msi0", "msi1", "msi2", "msi3",
>> +                              "msi4", "msi5", "msi6", "msi7", "global";
>> +            #interrupt-cells = <1>;
>> +            interrupt-map-mask = <0 0 0 0x7>;
>> +            interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
>> +                            <0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
>> +                            <0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
>> +                            <0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
>> +
>> +            interconnects = <&pcie_noc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
>> +                            <&gem_noc MASTER_APPSS_PROC 0 &cnoc_main SLAVE_PCIE_0 0>;
>> +            interconnect-names = "pcie-mem", "cpu-pcie";
>> +
>> +            iommu-map = <0x0 &apps_smmu 0x1480 0x1>,
>> +                        <0x100 &apps_smmu 0x1481 0x1>;
>> +
>> +            pinctrl-0 = <&pcie0_default_state>;
>> +            pinctrl-names = "default";
>> +
>> +            power-domains = <&gcc GCC_PCIE_0_GDSC>;
>> +
>> +            resets = <&gcc GCC_PCIE_0_BCR>,
>> +                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
>> +            reset-names = "pci",
>> +                          "link_down";
>> +
> Drop stray blank line.
ack.

- Krishna Chaitanya.
>> +        };
>> +    };
>>
>> -- 
>> 2.34.1
>>


