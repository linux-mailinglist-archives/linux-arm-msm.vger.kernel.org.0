Return-Path: <linux-arm-msm+bounces-90521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFcLKM9Bd2nLdgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:28:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AE986E7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02F2B300E242
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FE033030F;
	Mon, 26 Jan 2026 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qo61C98E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3tekMNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A677332E753
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423209; cv=none; b=oW3KC9wwTGlcUPalopczRdFXHtVguTlI4QzMNb046qQPrU2Kck3Gr4vSlx1yStggy9BJeHAdKIBrW9jB221cw8tZzL1Rbex1hPSRjOakR5KM8oa4G1p4Pel/xctp8RQZ6PF4mEuOwfNuUoLYIYKd2AnsPkn4X8OY3+wvlMNjVX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423209; c=relaxed/simple;
	bh=zbKGx4LYMUTXUpwVoC7oqmRYDJSiv/qkgXjtwgLExmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8uX6fS5nuFPsWys5u4Z+96RPl1/ilqpEoG79Qp1ARD0Cbvv7jct3ghQIrsucvgArHjf61Ox1lQwvVRLJ/5H+baDOq/yBTYURinM6/+Yrx6Z071NkOrCEF+4+EIrvHrqWn5dxPcLBrlruromR1XAazfDlSHLXVuDNHqL1aCmkyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qo61C98E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3tekMNt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q9hl7c1841490
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NbfSiylWvltQwu7NQekwdeTvyNz+4tlsCK8FJwpqZCY=; b=Qo61C98E35n6PVDd
	DbCuFuIWBNzp8bsdW0Q/mUlDcVJ0HuCCc8qoTAxamiGkhYXyp1NSGCYo4WxEsR9K
	yqmygOqaY+aXf0aGXfkySyrrx4ozoywlR4+0STC+wfltQcUeRS6X0LRIiqwD3xiZ
	uISel0msR5ivsqJcUtCU3LI5ndfrW+u+QQjMOzIMx3c9tG6e66Az4j+HgM6A1ps/
	5l3higduzuBo62TkCHhxNRE+0DDTJShKR3BHJoi8ziZPudi/Q4qfdcja+lk26gGY
	0B2CJI3mknc/JP4VTMZN/gbsMXIKVXuqzZwOZm/4afHBY7eHjfWNZMXqP+9O7Zxd
	R2cYIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq2q45cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:26:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c523d611ffso78105685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769423206; x=1770028006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NbfSiylWvltQwu7NQekwdeTvyNz+4tlsCK8FJwpqZCY=;
        b=C3tekMNtPoY8D//4mDDOYkUzcusbZ0eYR66WhEG5Kld3LwA+tHZVUSfQVKvh3oouTF
         VHvcDt38fkZhhvZ3UNVBJdL2bQ78hFr82HgEhiIvd5XPAParNBlKb0hRlNhkP2lkF7HH
         2MKLwJmxBke302iTsHqnHW98IJvOZ6LHrTaFm4ebVWkeV/E8SkfgbfLsJXBPtGvtwofz
         PR25mzXPPD7wSdoD2phMzOrvo5Isz9BmbUkb//MFUb2gHLFv34eRvEQnzEfULQo0mRKI
         IxVeUxLjU/LQrzo3SPN4Prqooqv8zG1mz96xYE47b4cF2ULg1MDvJZ5W5gMGMeG80alc
         1Hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423206; x=1770028006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbfSiylWvltQwu7NQekwdeTvyNz+4tlsCK8FJwpqZCY=;
        b=MUbbKEgEziVfIUxMKqLQ6+cxzEeH0zgEeRLn2Nte9NiASSFKPG59+MWFOeePOlSsys
         DNfLLajTgVN5Rdx/SegbHrcKEH4Mcnntrwx5sy7xd2vTXoH2IZ18A3utGEdIQdmHRHQC
         uspZ0CsQUKQ0Hv0vHPXsIAZ5V5PbE0g3tfjJhewanaMZrNrM4bYkjnpz/r3Aa/CBKKuD
         GS54I5EXCE+O6AAqpfcf2YtkXkKuQkz6u0JjMe6oOKklA77dnhy6oMnAlrMFdDpslyTZ
         YhBPrwFLy75jG5H2Df2VBB73IANKzeFWGmQ9RCGIEtBOwcOW4CTyT4G6/vl3TIU9h/3l
         MN0Q==
X-Gm-Message-State: AOJu0Yy+7LhB7tCxhgSfak6JGSLDyd7U+dFDATVW+IoT0qZZtRPgSpMF
	jAE/T7LbH0gG9q/56hb34qkEyGKGex2rnub47Uf3dTD+Ph6kbSKsOpfujwfuvgRHd3xxD9S7ntZ
	p5bfFYijlwOq2uHCRyw+0fpABGZVUbH74G+FkIO+RX49NIf2hz0wVaFKt/VrGjimvJj3LzJ94dr
	BH
X-Gm-Gg: AZuq6aIMKCaPlgwI+znrzVjwPWvxcdVm0hH/zOp9Rv/Wc2FnkSzm/JwCN8fcfwGQXCC
	LfdkP9NxuWeem0Sh2it+MlRJOpnyS2i0Tk6ORr3RAFdq7+PhuYUn+bH04Ebl2bzRvgVfk8exqu0
	txdMleNxXl0IFJAzQ8VWaYw4U2gyV1ZPKhdCGdE4EasVhsvT7U1zdR8a1Wu0CGL81nrpWNxoFzq
	7ky6ut8RZjdHxsCVF2FSGugZCGmBBDuAQkPp5xvWo15eMDSMb1MPN54M2ZriwA1iC7fEm4ISw0T
	CzTeqVvAkvtCLwFlleWkZ+vCrEjlQCkRw/gGXcBWnYVr6BA6ODQjwaIHAVpukW2bDpt2hbOqhkJ
	qOPq+EQz9KgPlSyOyzEA9pmlUj/TRx9PxCRzbWe6Kv69Wy7gLEPsnjMHzK3C2AyWupeg=
X-Received: by 2002:a05:620a:17a3:b0:89f:63e7:b085 with SMTP id af79cd13be357-8c6f966f9f4mr338988985a.10.1769423205996;
        Mon, 26 Jan 2026 02:26:45 -0800 (PST)
X-Received: by 2002:a05:620a:17a3:b0:89f:63e7:b085 with SMTP id af79cd13be357-8c6f966f9f4mr338987085a.10.1769423205486;
        Mon, 26 Jan 2026 02:26:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dad3asm617422566b.12.2026.01.26.02.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:26:44 -0800 (PST)
Message-ID: <76f24d28-30e9-4268-8774-9e75a116959d@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:26:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Eliza SoC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Georgi Djakov
 <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-eliza-interconnect-v1-0-010ff0d100c9@oss.qualcomm.com>
 <20260123-eliza-interconnect-v1-1-010ff0d100c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123-eliza-interconnect-v1-1-010ff0d100c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UBXsCIkg4uCP21bBbNR39d7mdkqn5NZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4OCBTYWx0ZWRfX8AYzwo3wpir4
 AmKk69h4qKEM3FBvsvLx19QNbIU7rJjaLw1+FKyevDLjrJVgr1G3ikdALMpafBGJHLBWfUJWONm
 SWCjy7cCPCOgJfgZBHX9vjf3PJhxqmxq+747eM2jpOGmcE6lzA+N/uOj7pLi2S8XT/mOCHq/UuI
 9p2ETp7rsDriHgTcQ1uXeYKF+v3zMhCrXWB0jEIcNRZ730EkKya81LGCucbaJo8eL5tuNMCeKwa
 /W3Q4EiwQvX0i8bygEN/WhfIiUEdHYDOproGFzySHnThcAmBw0+t7g5UrY1hVKBBfO0rmmDSi6y
 NGvogmNnl2deAeINiwM6hE43DRMa47EzTmDtb4ldKEVWrokxTScc1eh80Qqe/rKWzvR1woUetDK
 0FYvFGe2pfem+ABbsCw9ipmz3mmTvlDZ8s7rCLdfYYhsbgvfyhPhye3gJSVRFSA9noPjZDsgZmC
 KsfF475P/b40C1S1zWQ==
X-Proofpoint-ORIG-GUID: UBXsCIkg4uCP21bBbNR39d7mdkqn5NZi
X-Authority-Analysis: v=2.4 cv=POECOPqC c=1 sm=1 tr=0 ts=69774166 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=TziFidvlL9lt_hk40QQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90521-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 45AE986E7D
X-Rspamd-Action: no action

On 1/23/26 1:43 PM, Abel Vesa wrote:
> From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> 
> Document the RPMh Network-On-Chip Interconnect of the Eliza platform.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,eliza-rpmh.yaml     | 141 +++++++++++++++++++++
>  include/dt-bindings/interconnect/qcom,eliza-rpmh.h | 136 ++++++++++++++++++++
>  2 files changed, 277 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,eliza-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,eliza-rpmh.yaml
> new file mode 100644
> index 000000000000..20da73c1c778
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,eliza-rpmh.yaml
> @@ -0,0 +1,141 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,eliza-rpmh.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm RPMh Network-On-Chip Interconnect on ELIZA SoC

"Eliza"

Konrad

