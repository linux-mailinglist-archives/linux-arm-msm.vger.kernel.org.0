Return-Path: <linux-arm-msm+bounces-102612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CpYBNW22GnnhAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:37:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF23D42EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B642030233E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7013D3ACEE2;
	Fri, 10 Apr 2026 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z02rzTt6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUDMCU5p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A833C53D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810252; cv=none; b=PJc7TAeNWP9hed1mX+IJvOuHmNrg8C7bbPsY5H8CmWDyqzZOR3WP8p2wgvXnB3Pdq8UM9pu/4YgvFxvOKJhLXntBqGFFCs/Idz/2gNDzGI22edvG3/RJQ+hXtC5zFYdX2AWliy6MKzXs/lzkSGQwNLj0T19B52znEP/sx92OGDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810252; c=relaxed/simple;
	bh=cuenWBzSJmLiokbaGxbkNinIf9f1cgYhZ03f6TuoKNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgAIAbWqj1Ln2SUbeWrWjKYhYWvd6uEjNKPstHUmCEjUBefgEma649aYx96jywPIVBLI3BpfxpInAB6dnBp+JZChn+CH/5PMR70yzEKwUdkAzygy4Zp7GXUTNYlahzOW2238Gg4EioaygGeXydt3Slqn1DqOV6YHNnrrQGfsfiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z02rzTt6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUDMCU5p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6qXCU1729939
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cuenWBzSJmLiokbaGxbkNinIf9f1cgYhZ03f6TuoKNk=; b=Z02rzTt6EXUBoTm1
	0XzwelKLH5pzCQn9ydVoUzcEhDvQuho6OMVx5ZyKsNIg6nRaT3gQ9dLIX2J011Tz
	VOKQlMwYxesoQmTYuXY4Xb9zPbyObL+j57lJJQp5p3IUwBOuEdbYHPTXxqV6D/GW
	kIyyh7pJKzfk2x8/bovlG4pcB2rI16qtK1zi54ySH3ZyoQEnYjAxzWEFoKzs9TWp
	045hrjVtlJ4aHCBdFA1/P1xtx0voojfr+TnJAePn5g4pXrBail6ckglM0Qadr4sE
	fzwY95im+84dq4sKiyYXZe08acetgfMNE7T4SgajImxA0V4ykCcj9XCXllJMqv+R
	5gOSmQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxke25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:37:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89eadc12c84so4956426d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810249; x=1776415049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cuenWBzSJmLiokbaGxbkNinIf9f1cgYhZ03f6TuoKNk=;
        b=PUDMCU5pjY31hTM3MNiCmpd0Ip5iI1hR4wFL1LwIwVqRwHe95l1scWv192ZnL0Kb8V
         yN/gUfARduRUbiar5uh9JNlO6hitJXWdx8gz/Sw04POEvsRZ26oHA6n4Iuu9N+nOOiF3
         SIlZPrcxe6stZPy8hQLM13aMexP38g3tN+lD3/Jkr6KT8TMnOPk4Q5YkpVhuNG+lAXWF
         2o0/sUqSKREPaZeSQzlQFRluM9pcHiMY9INDMkLD4l+dlXvd+bRkZVa8pUvMmYNRWVFJ
         I5hzTkQWHk1C5WqF8fkxQZEzlWx55tVP84LQ5OuasRT8WvQD5Q30mgOLpF0T41BMvYBr
         p8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810249; x=1776415049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuenWBzSJmLiokbaGxbkNinIf9f1cgYhZ03f6TuoKNk=;
        b=DcGQoqLtVOIw0/Aib5yyY72kzXqMy7JnuS5HozkeZ3DBx1V5wI2gxmVyW45RwmZTGl
         6A1keyFXAT0xPUO2RJBR1S9Sdux1L1wwezCTGMxFr7zdpmNfA6NGAoxai8A8WHXw066y
         Q/yYJlEwLbSoS0M0exnBpy2fb8BfLrrJpyM84qaXEF1d5R5hmdbr1g5KJL5Vw6w7tG41
         F2Igv/yakcy6fFzeGLJK8TcQSzkEPZZsyAt07mguAwNptbMDF+EHArDfhji6SSvZpuCA
         IMyUNC0evw+6HKiGMkQb6ynbt6//ky3AMoSQjehNQwAxaKkj91XSOTcWAaA+w0pJ/KTu
         a3YQ==
X-Gm-Message-State: AOJu0YwONllB1Munb7tpbMktNfbYzssp9eLqHRciL2X3zlvRT+GSZ9cL
	54Qnwg42zO7h57NpRp8ifdVyCH3Fzug8ABq3rthNBC+bCib+8D1sPcZIDIGtbDa2sj/wtHu2YZa
	W+2bqjOdzA29UZOw2qW9eB0VoC1qlEJT3kNoBvMnPIMrtcMK77gaND5ZQrLp0uHwB9XUz
X-Gm-Gg: AeBDievKeUVWR+Wdwg+IqKvR4TOiXEveKjXnOOJhaliOa/up6/Xe/av5wHrK6J3rpRB
	CnUesiynOK4+V/mUn7nXSUewqzdD0rIYlD2QKAOxBc5n3/SucfWvTERvgKgwW3I6C3bbhBafIgF
	NXzgsJE6GBFc49FPRfdEQc+Z5VLAu2q9ti51qNckN7uFnca/cT5J+LXLpD9NWNErtrIsY2XWdUg
	HbgYMk7JYOTqN47xW6seAxAV/4mgMuVcpbs7WJeHcxb+1t2FUwUxPfpHkeN+mo+UC9N+e3g279A
	/dtNNvOQOnM7GuQrYrzvdYKsIfoMGxFOgGsyXJXEZQzQETGsEVjEigd51CLefR4M5B/94xONfd3
	iJMitL1nWa2ZM6ysugxbUiN4ARsyZDDunZKKN0QbIQo6ZFx4TL9ZtiVafwwX7gnKBbHVdBbD8cw
	AmZBU=
X-Received: by 2002:ad4:4ee8:0:b0:89c:ed34:5653 with SMTP id 6a1803df08f44-8ac862f9d75mr20986406d6.7.1775810248747;
        Fri, 10 Apr 2026 01:37:28 -0700 (PDT)
X-Received: by 2002:ad4:4ee8:0:b0:89c:ed34:5653 with SMTP id 6a1803df08f44-8ac862f9d75mr20986256d6.7.1775810248337;
        Fri, 10 Apr 2026 01:37:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1a3bsm58706366b.62.2026.04.10.01.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:37:27 -0700 (PDT)
Message-ID: <87febe1a-a4f8-41cc-b471-23af05fddc43@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:37:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa: Fix GPU IOMMU property
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-purwa-gpu-dt-fix-v1-1-4637892156cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-purwa-gpu-dt-fix-v1-1-4637892156cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cXi0frIpMiwd3mCpPmawBFsKsOxn6wP0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA3OSBTYWx0ZWRfX5U5xm5nW1B6t
 UsV/jBYbneAVZQiPcOXMFBU4ymFx1qE21047j4qu4xWmaYzTBvP36fXatw+P+Z0TcQMwPCIn02Z
 fNP0wnnbkVQBfEDcSIQWH/zI9tcS6vMkPLRpOA3vvvKmyMFIAvH68u+OZUkA5aqOjwG0Jpj/qmE
 Wvc4pJQROrGDWFe+kN9LznZ0nrEiX0YZ4X5vKnIQe98Uc9qLgouWfE1zZ40OhkkLjotn4wkTLG/
 YHtvu/iBzlsk5VWjCKsybJ3GnQGphHkNIk9zlEbaK/0VcKRhcCUkXRk0/QkLfcdt8/bw+TZ/bd6
 CFvSCHaXyGyDTXuy7hHJe4vB7Minq/CWMvRNAa8Q6IxzLOhoAc95QS6u2F8szc9BroOV3SAykjx
 mbiFJVD7atEe7pKqZEnDvulyV2kOF+Itm37DjD39lZQjBiOM1yCpNzG4iLF76fyc9EUiWniX1fh
 FszjXT8yjR6i8Gt8mTA==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d8b6c9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=a8Rx7n6bxzFdax7iYdwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: cXi0frIpMiwd3mCpPmawBFsKsOxn6wP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102612-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2BF23D42EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 11:08 PM, Akhil P Oommen wrote:
> Purwa's GPU does not support SID 1, which is typically used for
> LPAC-related traffic. Remove SID 1 from the GPU node's iommus property to
> accurately describe the hardware. This fixes the splat below, seen with
> some versions of Gunyah hypervisor:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

