Return-Path: <linux-arm-msm+bounces-117131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 357GGHeTTGrjmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:49:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D3D717982
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:49:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZHhxHNv3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IxG0epPv;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117131-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117131-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC5430846B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3302E386C37;
	Tue,  7 Jul 2026 05:41:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68A0385D6B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:41:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402913; cv=none; b=Sz0dcMeX40GEZkZsDjGQYgBehoe80ZzRlSIrIBzRc3qZNxwG40xbPP/TPj0GwdRbBEyiQtuXQsNboqoGOHfGzQDtD5dBjatMFK3/4g3Ay3qHzpnV7sxjDyFdvdD7A/Zswcg5q6/f28CZcJUwsl8Ix2cXY1kO2X/riB5zWjSoJlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402913; c=relaxed/simple;
	bh=l5COQz7+rKfKHFX3vjfY9rDdWBq8Vjg4dSzVshOnYuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jM4ejX96hyb8WKqGd6u8KyLqekCObt7ZNjrS/If7u8qgydZA/TvoLcDBTRe0Q6ybwP0raJPqfqLcXaey+1qXFDa/Ufzp5K20ASWCMXIXVcFf4xHhoZqhY6bHjVePBFxz+PMbCetzkEW/rjej45NSe2EbQ3ecU6YcPiRCC0yrt4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHhxHNv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxG0epPv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748gxi2449770
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ow/eYL8dueLqt/B+l/aviyIZSIeIrdYbf3Z3NhMMHok=; b=ZHhxHNv3oNKYdllQ
	HccPBJl83ODUJG7oL7Kx2LsFfGE5GuDSMP6LgfHNgnxLzfUtVuj1V32G7gHx1pAk
	y0TKnf6j7RkHtdxQVal94OSBWhHZc9llnTlrkltz0+dE7GcY+Gv9yfsrYXY0uuCo
	uC/T+eZ5yDlQHgquP6cTsihcMV2VQo+IOPLgYlr/ISrEJwNsYouQRZFnFr9Hy0pC
	Jqzyr5jwN+pBbnb8ZRorxlOktNjIH7bD5lgMVUsUGJF4CDnhgOZfxV27jo6zBkh6
	0Yaw6nUkwSANqapnogCMEdFFKVzefTjl7lZlq/4KchuaEbRz89/M9R0+e9R5IFCU
	1vl4oQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su70am2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:41:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84622d6102dso5384867b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402910; x=1784007710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ow/eYL8dueLqt/B+l/aviyIZSIeIrdYbf3Z3NhMMHok=;
        b=IxG0epPvdaVVTDq8VL8zamQYBX4j4bcknJddBPuNjfZvsxegbIb/JSCnDHwJHEDefV
         7piNRtNCqFV0trAtcyFN+qghkhFxfSglJ6wbHnWUYTcB2UmKZRTOd0b0VhwjizKGvVSw
         sXDCXHpVp/BkutqgDdVbBy5VoEVi/R5lxZnGOLrPO1Od6kjtKlANOxS7Wp21PGR3SpkB
         3pZFubKEEvrJPCHkwgXG0XLrGcgiWs3ibm2paRBZBTpIZvqTImY8GykrkhJtfyOxNzr+
         2fwMzhDpv4ihI394tk5oXAFu5m5esslSrUS25vU1tnxfKdbqpF7AfCLLaV7If2UzEAVG
         w5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402910; x=1784007710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ow/eYL8dueLqt/B+l/aviyIZSIeIrdYbf3Z3NhMMHok=;
        b=l7+UF/vRmevzMiAClp5Tw4g03HgZF752Dj8TTwRB8Iv0lRCHMYjYCLfCWOtsZnYQjI
         HmZ+0t1SM2o03YwRjE8IVoFGgKxENaIjDMvYwf0gWE9ZRcONmLNelIyQY5ukG/Sdn3Vc
         NV3SGCk9iEyMv/nI3I/gRymX4Zwi8JL3OczTtuFhrYOjybceLNDV/adJ3+sQPndP/RBf
         kTVUx5cyVg4vs70Wq+lWJTDlztNmbH8BxgXPZeuAjX42qTNGwTd41X5jYGsG1N94uD93
         zeugkbtY8D5vdqqBqrK5O2ylLa3TTqdIaPe7Sk/3aeBred/wdNo0KizcZk/+5VRmXVya
         OKjg==
X-Forwarded-Encrypted: i=1; AHgh+RpYvlHOszuXzYNRTgU8mIs7O5U87LikRm0Eml/XNx442TWE3/QRkmS8Ta6U236JFn/4Z63G4PfYt2kD6UPP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9DF/jg57QAtS3gWLVb79axmv6LM8obTfem/vAVOpdV+cPlg3
	uvcYvfMfFhK0DD/av7xtnhy02m/xPMbiFIXP+Gr53ynfkTUeCXGBwRVIHOOS2O/EwnSeAy/Mliy
	jNOHFGVZxMGkiTmdqzxxG1Hb0vcGDtUW6JnIafl4i/GC83DKrv2aY/yboIvIGLQFk8pp1
X-Gm-Gg: AfdE7clMEYx7XFZlF0qhV2lhsCYoUhnHU+3GTW7obNBSbYNUCOdv0PBASVgv0HQqaMG
	Q2OPdxCFbOsBNpfFkE+VBwzjJuVFD7pvqHz81YEeFWi3jY+W8Tyr1e7ILDNlFAoX8izNN6saJUQ
	cUs9r91MecgjSAIKWEqm0FrVEchPEtH9200gWd7Wxgnzi3L5xVo6Ngu3cLw6sWKvnaAKI3mNo7S
	53pNIyCM1oZ9o1Zh/y3nDvCcuqnp3/A6UX/mtkvEzkg/CLYe9kMpQOrChlwNKwSW1w97MuaxKyy
	Pqa9Kj903BywsDvpS83QSR7QYcElfgqhxJoX4zJypVnVol7kZfblfd7Bc3cckHSRct3kf4+403q
	uA+RDxTjA37otCtPOdi9IJbr6zayylxwmibtwOMJJ4XTi326kvzPNegAp+TL4a8V7d1UFmZ1dlQ
	Jo3zHE
X-Received: by 2002:a05:6a00:4fc1:b0:847:9c06:2bef with SMTP id d2e1a72fcca58-84826d3e5fbmr3666426b3a.29.1783402910007;
        Mon, 06 Jul 2026 22:41:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fc1:b0:847:9c06:2bef with SMTP id d2e1a72fcca58-84826d3e5fbmr3666389b3a.29.1783402909456;
        Mon, 06 Jul 2026 22:41:49 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm4763011b3a.46.2026.07.06.22.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:41:49 -0700 (PDT)
Message-ID: <eafba447-1b25-4c78-be17-d0a90fafc8fb@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:11:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: PCI: qcom: Document the Shikra PCIe
 Controller
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, linux-pci@vger.kernel.org,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com>
 <178285172593.288348.3890129606237873483.robh@kernel.org>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <178285172593.288348.3890129606237873483.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfXz3bU3ler0JGl
 BykmFXaQTA8IIA4e0gz7DbghKiX1AdSZarYjvvSt0BqmqOlmy2LIjJJhvAlK20nG68DBVpOqTDu
 ZXUjicKQMRAfgn2Ug6MNvCPnQyvZ+KJFO0G8DTlpgD1Oj0EeD28ub/DUWxDlwKDK/FDJjCRHIZn
 w1x5Qqhp2m0yARS+nnuH71Wr4dtogBeUgd1U51z1lXB1Z6H9k3U+DT6F1Acr0d2y3OjTxayBKhR
 gQOIC8HoVHtRyYOYur3hyPssgh/kOHXQD9+sHqrhJKh8XplgmOn18kUy5UQjHFrFVMSGPRINe7g
 6cPCjWr5uFfwXe8OdCrssvO/6+rnDtlseqVaxB5OSkCYCBc0Rk57b646POxwPj7x0xu/uAD0Srn
 aVWnEuDzcLJ+nAt5LXLJo5NodjsApU0/p04sVDf/nxFWlbSaZHLMxCgEQbU9TaFsEUXCZWdqPMl
 yyDP8015xG2j0QwT0dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX+W126gTycz8s
 Y0lwHJdo6uGdua3ildfk30KX8CQlmQ/TcN7pYDTO6fuFxOcxg4KuCoCJYJKhmH99lRMt7GTMpIG
 4iAbXHMKH/vqzXedhLudVmqK521okpM=
X-Proofpoint-GUID: 1nFrzG1Yu82PHSg1VY_uQuUh14v2IWDS
X-Proofpoint-ORIG-GUID: 1nFrzG1Yu82PHSg1VY_uQuUh14v2IWDS
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4c919e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=g4xDkRcHy8dAf5eKVigA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070051
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
	TAGGED_FROM(0.00)[bounces-117131-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:mani@kernel.org,m:krzk+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-pci@vger.kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06D3D717982


On 7/1/2026 2:05 AM, Rob Herring (Arm) wrote:
> On Wed, 01 Jul 2026 00:32:44 +0530, Sushrut Shree Trivedi wrote:
>> Add a dedicated schema for the PCIe controller found on the Shikra
>> platform.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 211 +++++++++++++++++++++
>>   1 file changed, 211 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:57.29-36 Unexpected 'GIC_SPI'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:57.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:58.29-36 Unexpected 'GIC_SPI'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:58.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:59.29-36 Unexpected 'GIC_SPI'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:59.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:60.29-36 Unexpected 'GIC_SPI'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:60.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:61.29-36 Unexpected 'GIC_SPI'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:61.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:62.29-36 Unexpected 'GIC_SPI'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:62.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:63.29-36 Unexpected 'GIC_SPI'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:63.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:64.29-36 Unexpected 'GIC_SPI'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:64.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:65.29-36 Unexpected 'GIC_SPI'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:65.41-60 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:76.56-75 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:77.56-75 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:78.56-75 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:79.56-75 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:83.30-46 Unexpected 'GCC_PCIE_AUX_CLK'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:84.30-50 Unexpected 'GCC_PCIE_CFG_AHB_CLK'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:85.30-51 Unexpected 'GCC_PCIE_MSTR_AXI_CLK'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:86.30-50 Unexpected 'GCC_PCIE_SLV_AXI_CLK'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:87.30-54 Unexpected 'GCC_PCIE_SLV_Q2A_AXI_CLK'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:88.30-58 Unexpected 'GCC_DDRSS_MEMNOC_PCIE_SF_CLK'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:89.30-59 Unexpected 'GCC_PCIE_TILE_AXI_SYS_NOC_CLK'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:90.30-55 Unexpected 'GCC_QMIP_PCIE_CFG_AHB_CLK'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:100.39-55 Unexpected 'GCC_PCIE_AUX_CLK'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:103.44-58 Unexpected 'MASTER_PCIE2_0'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:103.59-73 Unexpected 'RPM_ALWAYS_TAG'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:104.40-53 Unexpected 'SLAVE_EBI_CH0'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:104.54-68 Unexpected 'RPM_ALWAYS_TAG'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:105.41-56 Unexpected 'MASTER_AMPSS_M0'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:105.57-71 Unexpected 'RPM_ACTIVE_TAG'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:106.43-56 Unexpected 'SLAVE_PCIE2_0'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:106.57-71 Unexpected 'RPM_ACTIVE_TAG'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:114.30-42 Unexpected 'GCC_PCIE_BCR'
> Lexical error: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dts:117.37-50 Unexpected 'GCC_PCIE_GDSC'
> FATAL ERROR: Syntax error parsing input tree
> make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/pci/qcom,shikra-pcie.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1669: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

ACK'd.

Sushrut

>

