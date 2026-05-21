Return-Path: <linux-arm-msm+bounces-109025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN24LXnoDmqmDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:11:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 155825A3C9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44FF230300C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D703BBA01;
	Thu, 21 May 2026 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtxZsu3F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZPmc5wZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6153BB127
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779361862; cv=none; b=hnFBWioG4hnaCMV46DE11CRmoUOQgUcTg2QqV9U9lTv9Re+CpExWMCyCaQMdx78h0z3o2y5jH1aTbSScN4+orUHCa2aVNNKJUEXeM2z+9jCaTmlfb1cNM91A8OZYmVulXqOdoat18gAad4BqkSm4tTXNNul+r1o3DzHsKRyx9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779361862; c=relaxed/simple;
	bh=UCasNbHDZZYX31WUouMR5aVqtAjsbHcMINcZBQUV5Ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5G0tOEyKQOTc1yGOoXd1tbBDq7/8pisxnCZS75bE6AftHJd8L7PmkY/DVis9tTi6UJWCZFsLqaPbd3V9kCl4aYF+tY0cywUi3zcYeoLjXZ6nxesoKSbZscbR6K5twLQpHuFVPIpL+JBnjM2QygsAbULFG3e0/6uz7xjsvaruN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtxZsu3F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZPmc5wZL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99wht2491909
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SpkIdCGDZCRqXLE6O2n4Iu9e0V/TmezNwYEg8eCCoag=; b=jtxZsu3F2Tk1mTxi
	oMNw97eaE/vrDH8NcCDU50t4Pb8G0YoP3x8zrZMo0V0dtCKXoSr3hONTSZGdpX7m
	V5vzF8EiaXLGyxKQ9R35miShkCgaXNtPughd47ipi/0QDTA9cwoQ9dIG48glYznc
	/9jEUpdkNEfOEaxj8lrZH8xAcXWracv6NEjEGg1Z6QStAB6GBe/8HHvd5V/LMFv+
	4/q+UxyBQw/oYTpaQ7TRj/5BXumF15BUFyGOvm2xeNrN5CXphe7r1J9iigERqz28
	CgIEH7UQQF/OYoEIC0Jv8XLoPyCaQBklPSQCyrv6XfJP1O26oksPYvjRdAnvPOz3
	wx+bfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j4nnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:11:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366344513a3so12794153a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779361859; x=1779966659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpkIdCGDZCRqXLE6O2n4Iu9e0V/TmezNwYEg8eCCoag=;
        b=ZPmc5wZL35nR5AjBTFVIWUtdDTTYOkVDswziPbFFr7eIFMQtXJB6lEnpqrsmB+Dmbo
         ReJHnxaUNm0NG+nyNnpD3htSWWtsxRPekB+b3+F28GRDEKO+ZWEWHOfsY9Y8FbtqGfSI
         slCJYNquPFapHM2XUo7eIYCU/03wxshlUyZkHmfUmAEpliE+5xdW6KiWl/ia0pj9R1Kr
         kzcFLmfiuFh750jB2JL3xTvFKQhQbvdlqGHEpvHnU+DJDOGiF5K9InoaY2dm4N1WB1U5
         0sj/RK/xvnnN09fDhO2syX12p17s972DYNV+wIazhuQaBKo3mBgXs5Us9jCvVjoUyAA0
         yL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779361859; x=1779966659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpkIdCGDZCRqXLE6O2n4Iu9e0V/TmezNwYEg8eCCoag=;
        b=aji4zeTvqxRFyloqaxforpv+Dv5MK9U4dlaX4Q5uSqjOupRxE1oxIyMAkQHgRYMJFs
         tJxhhT0m6+vh7KDLoAomGO1NX6kOipNPdhbcvlyZ17vTD8DrfZybEnytEmT5y+PP8LIP
         JYWOiuuD0RXQ0GjFZ+TWltbpPXeQFh5fz7W8rkBTC17PQ3VysdYEYY/K+G2Ohx8DsBne
         ip9LsG+f/g7KodZ57R2W/MD9H2FfbSRqxXIPqCN3Vi/SzqC2zJmzag+x4ACSmhvJtK6M
         4+ImpLuSNgrFhJJLuwtTbrKVVSczkJ4cCBBQuyXk725+BfVJMfUtx92xOxyhcqs0XvVa
         iviw==
X-Forwarded-Encrypted: i=1; AFNElJ+kIh6UJzFVIIqV82gj6xRX+a0mBNj4omMBdVbe9cXIO8MCJCNbYUegHlUgo6TbWFS6ht8XXCQP7DjbFlAu@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEeHC9MfuBz3gqNYdZllhAWdr8LqA2VtN5ZUASekXrogKxgGL
	MCBpa44pFVY1EAdm+lm1vNweL++sgDlZ4T/+PlTAYkIavKv0vjz9jb/Z4VRURy/LGgVNF9OVBtJ
	erNGu5tNG4/Rp1jcqGBQAh0DVWa2qZ0ZtcPDNKISP1fa7NN3HziNAkzxSF+yqxjyn0SZo
X-Gm-Gg: Acq92OHAGNTjTuQxkTu7b8pHGfwKuUu2Nv+Ipt0W2BSjMhQTemRIg55CIr0SHqd37bH
	byFe6S9dw90LF/bXmk/Sx/ICYYPP13gTX19yrPeCpOZ9zsg3qbMsDA9+uvAP/GgrtRTx2IietUm
	eJkJvbH6dR8raRm8Ou3NGkrL6AncQbnGirFJq73NtwI6IaaZ4c502JoRvgZZ/XnC+byQKK0bBKZ
	CjgRVkQqNxLKkwZjNYI44Syg8BwE/2/kzW2vgcQUeiTYfWFWnjk6eQ7awBOXKNfFwbby8AiVd0i
	E08KxLE9XeOe9UpsttsMgutN4jMWrDpDdf5gPYHBeVQA1Mp7oTSn62wGZupUKWTBAbgODduYgQR
	Ta/l2t905n5KuNjOKHeW5c4/S9ax7Lmag6+mo0DgPHtibZFcJ
X-Received: by 2002:a17:90b:4d90:b0:368:ac47:6e65 with SMTP id 98e67ed59e1d1-36a4518223fmr2405397a91.11.1779361859514;
        Thu, 21 May 2026 04:10:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4d90:b0:368:ac47:6e65 with SMTP id 98e67ed59e1d1-36a4518223fmr2405357a91.11.1779361859072;
        Thu, 21 May 2026 04:10:59 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5b3490desm385315a91.13.2026.05.21.04.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:10:58 -0700 (PDT)
Message-ID: <f20a3c1e-8723-48da-a912-ce269fa1aa0a@oss.qualcomm.com>
Date: Thu, 21 May 2026 16:40:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
 <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
 <20260521-hopeful-eccentric-pig-7fbcde@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260521-hopeful-eccentric-pig-7fbcde@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ee844 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=83-R8UJ7J38mYFGXg2wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: _Ppr7129G7JcPF1tFU7zLkmjXk4o51iy
X-Proofpoint-ORIG-GUID: _Ppr7129G7JcPF1tFU7zLkmjXk4o51iy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExMSBTYWx0ZWRfX7HUBK0xSgLmh
 jHVxV1SDJRz0445IXXR72H4lozabL6DOARx9Ntz8UcZEnizBcfJA+fD2AP8zbW7QZ8D1Vwq+oNY
 0rbdNXqLUEYtZ3DAaxsMLsw4b4O6/1D6JBpILiyX/Yaa/HO1ql5EhlQ+vjY8A8mYE96ToOQP/8I
 F4vtKYeQi+fHvAMi/rA81C/u5vOTrxY6n1WiFNJanY3YhKITOcDiahVHfmQoVI3XhFjf61o7xX3
 +roA81I0F/MrT/HWXS4FI5hKYGWZET6f2o3cbMyR3D4EcCIUBvTA0OVJuMvz7jlJTWaF6ndmMXD
 D4RLvHpAzA5ZksDQojj5npSqKX8gpW9MNTKGC3bPWZCXlDy5PLp8jeqrnYeK6Nysz9zl24UZXal
 eT7UGR0YBkpIEhSpdSxeokEIJzs5q2HwtLuKJmd3eLE+9FIhJ6RNcs76aSYNtrFD+XUDrahlyOy
 PNQDzftMIhM5FJQqfWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,b300000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109025-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 155825A3C9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/2026 1:30 PM, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 08:08:05PM +0530, Komal Bajaj wrote:
>> +  glink-edge:
>> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>> +    description:
>> +      Qualcomm G-Link subnode which represents communication edge, channels
>> +      and devices related to the remoteproc core.
>> +    unevaluatedProperties: false
>> +
>> +  qcom,smem-states:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: States used by the AP to signal the Hexagon core
>> +    items:
>> +      - description: Stop the remote processor
> You again got the warning here. It must be solved, don't send the same.
>
> See thread:
> https://lore.kernel.org/all/20260421195836.1547469-1-robh@kernel.org/

I ran make dt_binding_check and didn’t see this warning, likely because 
my dt-schema was not up to date. I’ll fix this in the next version.

>
>
>> +
>> +  qcom,smem-state-names:
>> +    description: The names of the state bits used for SMP2P output
>> +    items:
>> +      - const: stop
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - memory-region
>> +
>> +allOf:
>> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,shikra-cdsp-pas
>> +            - qcom,shikra-mpss-pas
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 6
>> +        interrupt-names:
>> +          minItems: 6
>> +        memory-region:
>> +          maxItems: 1
>> +        firmware-name:
>> +          maxItems: 1
>> +        power-domains:
>> +          items:
>> +            - description: CX power domain
>> +        power-domain-names:
>> +          items:
>> +            - const: cx
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,shikra-lpaicp-pas
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          maxItems: 5
>> +        interrupt-names:
>> +          maxItems: 5
>> +        memory-region:
>> +          minItems: 2
>> +        firmware-name:
>> +          minItems: 2
> power-domains: false
> power-domain-names: false

Ack, will add in next series.

>
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
>> +    #include <dt-bindings/interconnect/qcom,shikra.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    remoteproc@b300000 {
>> +        compatible = "qcom,shikra-cdsp-pas";
>> +        reg = <0x0b300000 0x100000>;
>> +
>> +        interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
>> +                              <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
>> +                              <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
>> +                              <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
>> +                              <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
>> +                              <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "wdog", "fatal", "ready",
>> +                          "handover", "stop-ack", "shutdown-ack";
>> +
>> +        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>> +        clock-names = "xo";
>> +
>> +        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
>> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
>> +
>> +        power-domains = <&rpmpd RPMHPD_CX>;
>> +        power-domain-names = "cx";
>> +
>> +        memory-region = <&cdsp_mem>;
>> +
>> +        qcom,smem-states = <&cdsp_smp2p_out 0>;
>> +        qcom,smem-state-names = "stop";
> Missing firmware-name

ACK, will add in next series.

Thanks
Komal

>
>> +
>> +        glink-edge {
>> +            interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>;
>> +            mboxes = <&apcs_glb 4>;
>> +            qcom,remote-pid = <5>;
>> +            label = "cdsp";
>> +        };
>> +    };
>>
>> -- 
>> 2.34.1
>>


