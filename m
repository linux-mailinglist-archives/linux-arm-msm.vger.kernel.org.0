Return-Path: <linux-arm-msm+bounces-100716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA4hKOM/ymn46wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:18:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5458A35804B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E79D33009893
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9FC3B2FF8;
	Mon, 30 Mar 2026 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQHAtDaq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Doe2guXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC494381AF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862301; cv=none; b=EjBaQfcaRJ96+JPG6xmIeadV+/CX9/TXRsDw3YsyGlNpmpUJ/SP2aOJFT3FjIYXsZ+IXRKSjmQFxA/XpniP3uGxgqZpvwbZ3gHXz4/dyfsrPg5uA1nz1sPHgwRObkU527cKW4pQrxlzdHPBnHKUYGxpWUoijETlGjv0Djz+zAMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862301; c=relaxed/simple;
	bh=EgmTmKlnGSggZ9oeuTL+y6aV8pgQMth7vygiP6lUmQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4wQuWAmqtWnUacF/0BGyGnsotvQu7GGgpmIC+hGMJUGldT1FdoUGG/aGiIEejvTkmwTzPmf7jMaglxMfxRORnvLYtlL1huKWLOUWptlKzPpCn34aqXKdQnNZnd4BsZBLUEOn/q8v6LlRXe/wXzRw5hLqTV0u2urqeMTRCgiNqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQHAtDaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Doe2guXj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3m4hs2954647
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjxNTNDyCOYF8ParJqsQO9O0jX2elDP2zds2jZ5uMkU=; b=aQHAtDaqX2VxDlhw
	aowZjgz+xZyLmcUxSk5yjnQ/fJPC4B5R7JG37aj1oJUablZyXK0cs0QOSs7YYgBm
	w51kn9sqvW2Qse0LeH26BpSgCrYqBh2DSYbxSb6D+tgqmvu2GcxSl6Nb3iW/gx0y
	dcbF2/BfMkRrOnN6soYD9+0Ir0Up7iQHmAdLcYWz1N5ustSOIsCzP7elxSX9X6T4
	yBWNJ5L8S7IDBuBbSlPkuq47bKn84rCmo4DuZsHKtlkMQyZ3U20GfieqC7rW0quX
	BUSxqXBDg9S+NXVnduDgGmzeQB+roRBLc3NSRjO9ayzEagZU5xUM6AiuABWV/VRr
	NraPUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqeka1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:18:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b27636835so16051431cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774862297; x=1775467097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjxNTNDyCOYF8ParJqsQO9O0jX2elDP2zds2jZ5uMkU=;
        b=Doe2guXjncQ8q+ei1I+LIOVFIvgCnGPgNv6tvFxEZvnwNwRreaHDNmHziEN9S5OF4g
         KnwmZLdCHx11WYjFKr0hg6IfydxCKh1iQ2CThjGOjMMcAAAGWh/+0WHAOzdbQkGumock
         qmxZMQSrwGuYFxMm8ugIb41CyYEPGXs52a+ijPadN4sYpFP6E286N3CHt3ohJSifrYnj
         kIqOAz0vDGS2OFFZ7czTs5w7DexNykCtAV85zsiVeJ7pyYO+F9bWkUKANtf0XtxmnXeI
         TILdIL6QGDdSLnEmqxMh65pIMQ4vzj0vUHWMI7VdAwXbyRweccrawR6NLZ8pkEDuBYFL
         PpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862297; x=1775467097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjxNTNDyCOYF8ParJqsQO9O0jX2elDP2zds2jZ5uMkU=;
        b=Kx5ue4MRJcgyndhVfsJ2T9Y2J5gB6WQMXt9BIfP7OflTfmLv7uc3CHgmvmoUTV/Xqa
         ApmcpyANXyzevhfZtwTv/Fnek7JpFJfNazO9We7igsYUOi4bxIsVHJCKy1m0PD/L3g/m
         qek9HxK6mWTKEvYdHsVpvp0INCXocPTBl6D87XjLEWzgCT+CeIY9EPNuqkOkF5H6peyu
         hP/khYlOS4a4hQMTQLFQD9B7vd5r86YbJOD8pFOaW78gPVJT0oivDHNZ/gs7IGFICF1k
         57+mbUoFktEXe7BsEJsy/aVEbz2RbvYbopaBgH67F3xKS1fZCJB5L7/aNcvKEeqwj3n1
         j8pA==
X-Gm-Message-State: AOJu0YwKBqMuht5F46OCIgcOsmYO1r3Shy/lL/1wocOS0KZGr2AV6xeN
	n5s1R6cuTrVaWMAd8QFsTQU9iGcC73M4SeEuy4vFp8UE3nwyAGDY/PxrT2bilwY2t0pGkQuVYg7
	vpXPusaVbvmAShDJLAvGo10m4pAk1WS0oO+/lcfJ6gyI4bSJ4rdJEEbteLUZH5PMADiZk
X-Gm-Gg: ATEYQzz206dK4e52BnSC9NoJrH+NjeRXqYiVKxvQvtDUfJsgYqQi37kuy0eZUHymm2A
	Xo1IVge9E2PMV3xOHRSvXyON3Mshw7VNkjz7x4wFo16W99vUetk2uyFQhqX9r51PGmxDdNpi09T
	QaEaZ+qdw99o5G/CHbEPMQQoP0LPx4xck2mxkh2iIKN78jbdnqhfcRDv75ctB7lqXfoS/iXIBFu
	GIgVulWHTKIo3Ya8+Iq++P5J19jYtRO9eQ54ctBbfVHGP44/MLXcKhjEJgCfBDgmPWh+1ka19/2
	MFc8vV9GE0AMnoXfJAaMtl+HrgcMLBDbVTNDCMjnP63SNtQNN082y+H1yTPJpA3jsbJtYqo/PWi
	BcM7FyTZy2JlpydyGyxn9S/vOAhkbFU+L0oMl0WNqi5bRvXAVpUP/eqH1BrcaOtZ8itQB41XX/V
	UMHLc=
X-Received: by 2002:a05:622a:30b:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50ba3970575mr120358681cf.4.1774862297167;
        Mon, 30 Mar 2026 02:18:17 -0700 (PDT)
X-Received: by 2002:a05:622a:30b:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50ba3970575mr120358571cf.4.1774862296712;
        Mon, 30 Mar 2026 02:18:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae520c2sm266091366b.21.2026.03.30.02.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:18:15 -0700 (PDT)
Message-ID: <f971b7d9-8e88-446f-ac93-c3506bca83bb@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:18:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca3fda cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=edOAiv4QBLOMXHKBau0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: o334mGNCAa3NTMAD84l-kvsx_PPym8iM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MiBTYWx0ZWRfXwLol/r3Ay6KZ
 FkSG1U+lcCjc5cbKHK5TmBIKikl0ySQX1FoQaN3zmv0D4ab98F/qSLlJOqQBeazJ/lasVk2mI5o
 S+AfDMLGJlfHrQMTtkg20X+z/XZS8Ou+YJ00SpVJwKWeyGb/wT9Fw7nYSnnbzFl7NyJlcrt3TjS
 RaUKewWH3b3vnQ63dn2/zKjQVwloj1Gclj4DXUzYD44Df1ozWQZ7S+zVewouSsf4hoGzmBIqrhS
 AfYAtdCm3c7qhxdkqqrCOXJEblql/Ox4/8I/83DfxuJ6IQ2cRwWf4MAsY/OhoC1yA0DSK6taxRC
 OtIv22kr5FnDNfjGPRV2BeULc9JMw0ttrUOQNFlX2EvCxE1qtIiokPBmn/DlxIPQC0w/NMoSf5H
 OLvyIkNtTMArqPPSOZbwmq8Z7OEuyuzDpkBrZtJiCElGlQwHpFfyG0KEknHScuYchGy0pzHlGBB
 iYf4B5wsR9hAc+QPN8g==
X-Proofpoint-ORIG-GUID: o334mGNCAa3NTMAD84l-kvsx_PPym8iM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100716-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5458A35804B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/26 7:52 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Add the base USB devicetree definitions for Kaanapali platform. The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

[...]

> +		usb: usb@a600000 {
> +			compatible = "qcom,kaanapali-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x0a600000 0x0 0xfc100>;

Following the woes on Hamoa, can the platform suspend and wake up
succesfully with the flattened DT node?

Konrad

