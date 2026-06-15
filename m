Return-Path: <linux-arm-msm+bounces-113249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O00JIlc1MGriPwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B33688D1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:24:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E9GuwE6y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fH0adAbr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113249-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113249-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80CB1300ED90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59F1413D9F;
	Mon, 15 Jun 2026 17:24:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1E413608
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:24:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544275; cv=none; b=JtU5ZqyFavJXB9b3y04E3J4BXJ8JMv/Ok3QUWCdKg4gc/HTtmlqF+bufbXSYj03EfAXPEMcABdzpR7yCRvTptorcjfL7ijfKbyaweuXFP6Ejg4OITs4ZCRI0L01ydPKsAYUsveOF9vdSNIqkx+3wVrEJA7EfhZs2UgO7gHwHwO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544275; c=relaxed/simple;
	bh=lfqTbh62VPA+qxPJcuNFmKye2khZv4QuZQHCqHBoOPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTNCpsc1EIser22udXL08NUVx0W+6c1I5SSpuvn5nHG4C9DTz+UW2QA8ye2WqO8yM1T10QK3YsaXUSR2W6EuBLZx+LOLi9IOf+EjchIHeWBisDTBPjgOQmTSJKDwtnIXMz9mWHlqd51zEP/pfWCdsLnKHidaIdqcwTCcW+W6pl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9GuwE6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fH0adAbr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhvd7992813
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZnhPtk8mMnWcFWmXtG86F3o6LgtBZSk/BNsIu+3Vawk=; b=E9GuwE6yUeSLsh1X
	u1cN1kGIy+DikF9fWXbHBLHJ2MzhAZHXBxKfGwXvBZeXSiScR8PSFfwIg0dzJOxA
	8TMzCFhCn5W2w441rAlY+IYWMi2EnUQCXR2sNC/2ayJb9/2pO3vTROkzaZwFryBx
	WYIA5Zfq4TFQKLeko6Xt/xfz6UfRHp62Rbh6/rXDuhEUx98ocIj/QNqlSKyYl8f7
	mHNVhicwwOFV47qLtX1B1VnGxcBtnZZ2WVGo09SNTLltY8U0zvIOpPUiCQtOw2PP
	9FjJUYqYL34XDqlq5ZzqokCsACyXJSLPNnm3rE3zX5y+SGwWPD16F2thYh9JsrG1
	mkI2uA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhhh5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:24:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842211d6e48so4381896b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781544273; x=1782149073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZnhPtk8mMnWcFWmXtG86F3o6LgtBZSk/BNsIu+3Vawk=;
        b=fH0adAbrxkUKT6VPNrIAuKYSff9hSNC4yBaj5Yw/hCxp0tnEEXUcgG3k375BmwR5EW
         0yJqLzXU8k+n0d3c3j5ZXVjCNNELq36+tdgwrT/LCmaH3AUYo0PTod4ddlW01TLxUcOk
         VTW5a1o3XNloeCK8dxzXOdlXoaBDNrV3W6NnnDZ0WJcP4rKFDGQLM3NIvwxe2qoDEBxM
         jEhwIADClpaDGtd1//7xbByAQp9Ly3iJ2K3KP9j9Yjh0XH72xqLuyBml4YmF0hciOuXw
         xZGy5VU3oasjEsFaTyiXLSNnsgqrVrRTooGO2BoouIHq86bR/GgXALuZD2mxANNXtQB7
         cu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544273; x=1782149073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnhPtk8mMnWcFWmXtG86F3o6LgtBZSk/BNsIu+3Vawk=;
        b=iPc+MK+sv7RDW52aUPe8nuEplyq11j64MHxwKdd1qx5+ClKWRfB0A0NbIzzzY85qnC
         W7faxn3tPnkxd+iUILDzJhIXRJaEDVvt+Ok0IFk19T9SSyAbMbShUe2+Fcyi2Ogu8p+z
         1J18hbFsQSgSSfl0dE0p1pdv/Hcl7/rMY01Gk5qJKFNR13reCPtiDSEVizpWiDs5Foft
         2jsG3z0FEZ8+vlTa4+imhuCZKvjeoOB5VuGyBoHX66IBBVw9M4jqIr0TYRNWp397jbJj
         1PEJfl67/GepXbzuRY2pz+7y7lvfsOdt6QvMj8UP/nU9RHbQRGGVmL2pIN38ufcm+M7b
         HPOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0pCGEAVDT6cmNGatpuh/2oSQ4lhNzc7gxIf8k/JjnVD9mf/M1vKTNey9bhWTg53Dzdw41nkvkCL5FYRX7@vger.kernel.org
X-Gm-Message-State: AOJu0YyI8P7yOABy59JMgCWw4mB4LaofQDXeqNKHeF1Pt4Bg0OGVw2OH
	hty9Brw8DFGdZZPMWKTBcsjZjhGPD77CMiWzAFcop2G1dlZ0q5RbFnelIDkBEiIf7BlrSympm9I
	kp+TJDCONjx6FuqTiB3DsvFjtxyYq4dxqFVt8vdHc76ag5BcsLtRxCc8OSFpLX0NSgkJq
X-Gm-Gg: Acq92OERHHNUCxd4O8QFxLQkECO9nog34fQRFvvuEPCdsXzW6hQYDCHoPMpL+j5iVxi
	5U1SFLY/bxXTFMrUO/Iqb3DcUEnjH3Uf4Vv1tRPTRsnm9OlXd34imsDHf3xdJyavDLM8zzP/Bht
	Cc0VB1PAA6rYnLF5Uf+H9t9Vs4haUyzQzWlrPQjX2JXujru+ah3wcuih6wZhxSM+pbTj+0mF4KI
	AMOkUkGKFPVvBAujFCWva1gp4yqa13eZeCDugFRH+kZVO/FaBPLM/KdD7Ieo8kYTPPnmBi563YI
	MqD8nyh/SHBvX+nmUhofgcC2RFDFnI0MYt06vYkvhW//oJRFv28nhEh2TpzjThlQ+FHp/da/RMa
	P3KP3bBHGWH/wPL9ojc4y3VJld9tsfiTf75r4T+TbGDwsGeWx1tazpDH6TJeiwEDyRg==
X-Received: by 2002:a05:6a00:2308:b0:842:5931:7b88 with SMTP id d2e1a72fcca58-8434caec171mr16906427b3a.1.1781544272670;
        Mon, 15 Jun 2026 10:24:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2308:b0:842:5931:7b88 with SMTP id d2e1a72fcca58-8434caec171mr16906404b3a.1.1781544272268;
        Mon, 15 Jun 2026 10:24:32 -0700 (PDT)
Received: from [192.168.1.48] ([122.164.85.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accdca8sm13328459b3a.18.2026.06.15.10.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 10:24:31 -0700 (PDT)
Message-ID: <c649bd80-4bb0-4a92-bacc-949ca40a1fe9@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 22:54:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
 <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
 <737655dd-2059-421d-a9ca-91ebd1b1209b@sirena.org.uk>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <737655dd-2059-421d-a9ca-91ebd1b1209b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4NCBTYWx0ZWRfX9noPzIXi4HI+
 xdYXEX691GGKCSgCh7vzUOlRaOWZuWEwc99NS6wg8b+J+HjNaiZsaMYNmeFySButTArzntD0m+G
 ECm3KvkvQbZ5ij3TTTmBYEZth8qD10Q=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a303551 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=BchUXt3FRQcObq55vMoYrw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7WPBTj7QaewYWrzPdxoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 8MY45-3pDC9AhwskDdorldg8OdmOfDr9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4NCBTYWx0ZWRfX+2Uj9M5D5e4f
 Ny8bjetKCTSWDeduftfAvZbr6RRZCFREIxFKsUO2EWe0S7cClr1gS5X/zsVjg6Uquv/oLP9zoRw
 1Bp9kmnZAHUSeD1qQjKmqQLyB2uL+TluWm6r5vhBIpOAnNqthzAC5pXc4o/ZiuKtdFhG3t9bQad
 2YCqrNDaH+nnugay5dQwcvUfwB7r6mq+IZvZ8/AOso5ouEkhLubDSHLfMLHXYsVPvCsEauRpGIp
 xQ3MYnfwK8ZfPzpR5e5cpwJkDcKvmfig+4ucwhnzhXCEGpn6aaa8aDUcfWzqWCnI/m/LrAN5NJo
 lTiEnne0ZvQJtfhVylgSzFykHtTv5WuNOZGr2BYJ7nM5jzDXYwRRBPFXY1eRp2dKdeh66KFG24L
 daCnVFBnTwPl+FRKzOtw2qoThxvMoRnwOlK4J1Gh4tm22ywrjvRzab8DV7a60QriK3BpJ6CaTy2
 EDX1GK+4VDJuj2ioolw==
X-Proofpoint-ORIG-GUID: 8MY45-3pDC9AhwskDdorldg8OdmOfDr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150184
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-113249-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21B33688D1A


On 6/15/2026 9:28 PM, Mark Brown wrote:
> On Mon, Jun 15, 2026 at 02:05:49PM +0530, Kathiravan Thirumoorthy wrote:
>> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
>> PCIe and USB, UNIPHY PHYs. For the other SoCs, clock for this block is
>> enabled on power up but that's not the case for IPQ9650 and we have to
>> enable those clocks explicitly to bring up the PHYs properly.
>> +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
>> +	int ret;
>> +
>> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
>> +
>> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
>> +
>> +	return 0;
>> +}
>> +static const struct regulator_desc ipq9650_refgen_desc = {
>> +	.enable_reg = REFGEN_REG_REFGEN_STATUS,
>> +	.enable_mask = REFGEN_STATUS_OUT_MASK,
>> +	.enable_val = REFGEN_STATUS_OUT_ENABLE,
>> +	.ops = &(const struct regulator_ops) {
>> +		.enable		= qcom_ipq9650_refgen_enable,
>> +		.disable	= qcom_ipq9650_refgen_disable,
>> +		.is_enabled	= regulator_is_enabled_regmap,
>> +	},
> This looks like a get_status() operation, not an enable operation?  The
> enables and disables are pure clock operations.

Thanks, Mark for the review. If I understand correctly, I should track 
the clock enable/disable operations and return that state in the 
is_enabled() callback (as I did in v1). Please let me know if my 
understanding does not align with your expectations.


