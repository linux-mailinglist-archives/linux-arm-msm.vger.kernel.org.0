Return-Path: <linux-arm-msm+bounces-92994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MTQOAU6k2mV2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:38:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FD6145B2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 16:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63D593004CB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF1A331A4E;
	Mon, 16 Feb 2026 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3dgx7uJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXGvcOTP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01973314C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771256302; cv=none; b=ttdO7UezdGOZx7Fjkx39IU8ekZZHu3IkYLIE4n4t+bvfOQ2c6QcHPlPr7BBFKY4RFTIiC43DuHoV9tiQ4tcbCcu70uWEeudS2R+KfPw/bA5jjbteJ+a2h57qCFI4nFKbi/2zxaLDoeAP5UxeNvwMxxo9sd6fNWfYd+OC5oz1pxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771256302; c=relaxed/simple;
	bh=umAviro1edzALVbCFCHUlVXgedSDoDxm8M2/FJ8hrLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h85NNycQdya6zecYhPp7m5VDS+eXGWtRjOZ/mXQu2CHpWPbh5zIKRpkW+WGwzfJVThjNsbDRP7ZMKMKm4VgOvr0ZKTA/CXcyZeWs4SHSlgDJKtygbfNDQCF29s/NwH9ejF4zKm/jJ0G6o68tNJyeESPyeDCtpwgYuWlOAGA3gsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3dgx7uJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXGvcOTP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8dAo32271398
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1Qzz6cdVTjH6+h8OfWPLz0uRUqylqVjSN2D7URxDDg=; b=N3dgx7uJjkHhLU2W
	PbgGZyh2kRkmcxgiKAJ+VW1P9IuH6d07MeumvmUU0+lSy07KxKn2ZFBrsvfzAcE8
	12sUGQE7otWYh32+4cDBGcN24eUcEgcwcoGrj9glF2JqyewtFIJ5V+MfDvz9Hir1
	+E+SQFBRuG1k7q9Vmx4zbNBllvb1wi3SH69wPzGboB4SzhxHU9psyf/IitROU5NS
	q26vEGzhmAD31k13L9ln8Sol/+RhkZ6OukFrW+NAMaKujRH0Y2IHcfTBugU29xHj
	QrR1u9CEzEPzyw0inRmI1vAV0Za1U8AtHBN0kQoifoMo5WTjIooVij4ILdidI+vZ
	Nyj2xA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4sn07t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 15:38:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so160877785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 07:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771256299; x=1771861099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1Qzz6cdVTjH6+h8OfWPLz0uRUqylqVjSN2D7URxDDg=;
        b=BXGvcOTPKZvWmughTZg3fetZZnR21G5WLf2b0+sQoK4CWGGj1lBazKZ3OSPWFY1uQ7
         B8utjyuN5AlemtvVxLEZKp0tqqYnnhr5K6l6tVu/hRwHp2I/GrsXra5KUnvlg2pEMjNh
         CMaLKtChxC3tH7+0wrAIkPlGrgBbD0wPRqDSZ3jmKiSg0qY67HcZ6FPAcmzgJXyHAGxh
         MCkxmlv7js66WGu7FBpnYQqe2reRjzxp+t7G56iJAFMMOShXwA7lmGSzgwQjlM7Ofa/m
         paW0C56l7voDQAX3emJTxgl+ik7ytYe/JMaIf/qMQEVNm/cYdLukZ++j+NvsL3VmSNtM
         TICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771256299; x=1771861099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1Qzz6cdVTjH6+h8OfWPLz0uRUqylqVjSN2D7URxDDg=;
        b=uwM9k/BGVxAlIgBjh/UEjvar/lwRBN8cCXsC/lZyvP4Zblw/adaSTjR9Byyha1pft4
         ZSHjbpzqCzJlUQHYAPVyrQXxKGHr5AZbu6p7GkD+KO+Bn5jATLFnvM0L+Bi1vD3MrEam
         X8SdfFKyyqX7mZAg/XazrGZvr/irNmFEQ26I3Vd14kVvtW70kumCggLXIXMtV1js/Pcl
         PkCt0+raR0nUlnlFSk6YC1SWNexasTU5DBxRAzdnbla3kiyQ26LmC0t/HxJyRjm/2Uey
         xCeUJBxNO+2+ggQQvZHAle1VDj2XPuGhgjhgVHoEmxomGiCSpJJYGzuQYY1c8aGJqHR9
         BF8Q==
X-Gm-Message-State: AOJu0YyPoyUGrqwcg2sG/W1l9DWfE8bF/UGm5c+4Ks4w2gaCOZd+f81f
	Z2EK5Of4dA8I+JF3kl8KaZJNhYMejFg7FidEwBdXc2ijhSnVXSF0wjthbiFyrvMsQ2RNsXT4FUU
	ysLgI/SLhqSaeOVxvt9MS5gwkYbCIMGJysN3vpDP1KNDA02Ut4qjIakVqlujQJn2RnACC
X-Gm-Gg: AZuq6aJnH2XI+fryx8RrlfLNwjrY9q+srAoyA0rxQ1KY82oTUiXUavDPeZCdl4DyE6B
	cf1fBE0DZ0NBYuu25cvufuqUsjwfeBdaa6hA1vCWXyoPhQlPR4MXqJGtwkfwBfTGYf9jEmJW8/6
	EsLhSPnYm2VjZ0C0SaIc63vOjoPkpmGe1jRasbWnQdKjXHy7rIB/bFEi7MhOrlhJ4xR31PpRPMH
	xNopUJCeOly3WK0cHdFTJcb2PCy66Vq8L1Jxty9/UFj8fQusVTbuyHXhF4M32jzS3beIndHvr7m
	dlPOcDpqU5NECoqRMgdcrBd4hVULmbT04ixrE5dmGD76ctCD6Xn5sMIipkQwQ3mEVwGKZqFyEZd
	LjSRavKhOmDEvj3fVykfFG3RMas/fLYElUrwiuwiNZ+89NzRhpAGyFACzz2X1jVkVnz7QBAlnjD
	OE1Ek=
X-Received: by 2002:a05:620a:472c:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cb4081cdcamr1126059485a.1.1771256298882;
        Mon, 16 Feb 2026 07:38:18 -0800 (PST)
X-Received: by 2002:a05:620a:472c:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cb4081cdcamr1126056985a.1.1771256298348;
        Mon, 16 Feb 2026 07:38:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e587sm262157066b.2.2026.02.16.07.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:38:17 -0800 (PST)
Message-ID: <d6392cb9-9ab2-4743-a13f-7432ec03762c@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:38:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock controller
 on Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEzMiBTYWx0ZWRfXzB6a5hySiflo
 WwkPJrnRlbtDdjMiGzGGWr7AZE5VjRAks8C7479OncZvwQ5iVuoJ/L73D1Yggd9meQHFkNAmFRE
 cr8M5NuX3doQajB+4tDX+ZI0hHAi/VAX9nluJR1ox66fvLZIwWdX4nObFsIkM5S61JnxUYxVNb3
 jntlBH0bjxCpvD82f5NkzrGwzX6gSpdhiTL5oSkmJQZnipDo/LqbG06jfV05r48T/rEFKdZd2Cm
 IeIGc6te8s6Z8qyAJUSSmRnRExpaTP8CJmeUoVoGSfml09jFMbDv3cmtPui05G7VVMM6A5MUqxi
 8dHw7FCEZlyqm9jNW3o9x87L9TmUSnn5Eu1N4j2SjzUolXSSg1GTLP/woEe2Snw1Ligw5SBjqle
 WiHJ2OaEc65vrUiRHHpMeqG+Dyn9utJEnsCgaaSUkHuv3SOT7UqnlXF3Gm7HD6XVgPKGuha6Xcy
 Halrm74wVpGw391aV7A==
X-Proofpoint-GUID: 6inm9SFJp9EXcNtootuynIS_EhmGlVhw
X-Proofpoint-ORIG-GUID: 6inm9SFJp9EXcNtootuynIS_EhmGlVhw
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=699339eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KMfLPvBZmY1kkHWJjzAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92994-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55FD6145B2A
X-Rspamd-Action: no action

On 2/16/26 2:43 PM, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Eliza Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]


> +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {

This and a number of others should be struct clk_regmap_phy_mux instead,
cross-check with kaanapali and remember to drop the then-unused parentmaps

[...]

> +	[GCC_CAMERA_HF_CLK_EN_SLP_STG] = { 0x26018, 1 },
> +	[GCC_CAMERA_SF_CLK_EN_SLP_STG] = { 0x26028, 1 },
> +	[GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG] = { 0x26018, 2 },
> +	[GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG] = { 0x26028, 2 },

So SEL_SLP_STG=0x1 allows setting SLP_STG to =0x1 to assert the ARES,
otherwise if SEL_SLP_STG=0x0, it's controlled by the HW state machine

I don't think modelling the prior one as a reset is valid, but I don't
know what considerations we need to take wrt dis/allowing hw control
here and what the consumer expectations are.

Taniya, would you know?

Konrad

