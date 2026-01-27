Return-Path: <linux-arm-msm+bounces-90736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJxZNHCkeGmGrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:41:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDF93BA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5056F3006523
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B073491D0;
	Tue, 27 Jan 2026 11:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGQolWPw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6QXreCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30206347BA5
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514092; cv=none; b=GRQ786H7EeuIt1+7olwQt+k4F7fRQQPc+DNHQO/d1TlSihGwmPgdhdMrmfUqxVM8/NJTmw1s1hR41Wozjb69s0YkCpReQgPSWPHNw/mgLW8k37+A7UTBlEFkFPsvkp1br7oiQqQk2418CrQ2lryzydKES35dYj/qDpfRwUC54qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514092; c=relaxed/simple;
	bh=Xc+XEbWu7NydMS1y/ul3bnMWcOeJ2XSUcR1hvGpsXAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+zEpRwzCgph7OY/0RYk7rSHIbfdESw2qf6Y6Kg31tUyzMYcE2O43XygDYTqL4TykkkxYvZTDH29Ww0+0D4U8+H0dh8bx1Yv/Dm+lsuoe/CCCAzNUGUfcHzqmNkmxn3aVK1ZBfsMazVXg4GIX/LqABS+GeK0/c4bDSfqjyhUfzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGQolWPw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6QXreCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7Rwri112650
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/LYpTnA6P+gHv9F67L52mGzLDD2sDygJZB/kfqndfY=; b=AGQolWPwXRqBElCS
	Tblvac8tvTr1pjU6aBZHdCx1Bl7yNM+UCWThWDDPshKw8d02Q1W0uW9023pw06xv
	hByoN6hdAmQY/bvmzkhv2c6D6nkyClm+U7xB+WvOEzQkgcxhoJsc3ZenKeercntJ
	bAIEYjGsjGc4NZNzDFigGkKDgNl3adYhjogbE0MCuY3kVynQxCU/xGSYlrUMMWQY
	iMGcvbCm+W1T7asQq+Uv9d9bfYG2UATBOJSIbjdCtAJf2SLXRT+heRZhO4sAEImS
	B9sLjDRg8SL/b+F4eOQvTbbdYfuUelrBlfj8oYtDTgAkqxTI0zTRJ52OIYHyiIj0
	k9VvNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e0w99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:41:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c533f07450so152967785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514089; x=1770118889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/LYpTnA6P+gHv9F67L52mGzLDD2sDygJZB/kfqndfY=;
        b=G6QXreCCfOPePV2gAjYXMEF/RDcGuv9lVK6avxAyTms1fS9c4eGb5Tz6rKBN6eimQf
         jiWX16soKyHUQjDhFMtJcc42S3ImPO20ha4Vsh8pSg5Ec5eh/PB1HmmDwkrUpMiX5cr4
         oVq1RgNLLpkXPRTJSHVbbMsmnwX+KEE4juLvWU2h3gFBrRqQ9g0q7V8Kipq96lQ/Nhqx
         RLZsGt5GlYhTOyrfIV+BwsPFdag3En2sYE77JdQZCS0SGGNJcCT0RNEpn4/SWFS1+iPH
         Zf9m0JUvCZVbdcPjBLrWv6T053SFVmntxGBMqsY4QPra5jXgchJl7S5RcsCAOF3P68J4
         mHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514089; x=1770118889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/LYpTnA6P+gHv9F67L52mGzLDD2sDygJZB/kfqndfY=;
        b=XrU+Xl+2RjdiyOtAmqe/zlUd9i0VUzalfua7A6sW0lkMFanWsYy2KC5Oj5M2uXllmC
         GqvgyvQXAsaCZOTXigZJagvRjlITB+/aEPAYLdtizcGa6bDbIcYeOdVqoVirYwxJYWeT
         li6Ph682avsbbGkpedx9768aAaze49Lhu4xmQRrXGmht8kSF37fuy4+kt3fSrLGS8Njx
         AkmRhHbN4ZoxQtEPCRwtdEbG/ZixJAcH/7uwSbSqfhVh8+REVMmI/D6g/spCEnvAIQHC
         4vffGHm4xHZUclqHJ/Uv9vMxKX+lBO/vULmWGV8yawGji11ES768xaJ2WYsgTskc901U
         1w3g==
X-Forwarded-Encrypted: i=1; AJvYcCWkQ49R5PwrKWBAamytjQCFXC+Ygau+YpfqnZL17LMplIDuGcdyTdhFnvsEBHzV4C89PwjNOvYZy9B++Adt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1V547a2QbrR3iN44AOP9ZGEEv1geJHkutfuESOjRHU4FkGLxa
	72bu5GkTtArf7Twx07TPfON13dtV52Pi9W1UYCF+44X3AE7hHRIqGPbXUgW7bBLr9PIlVfzTzcj
	Al2POpuG5kC1gtq0zq2gpPhPZ0UjqCTDRNpW6no8pjI6fMLaRwu3LBg7z/wg/BJWaAr4r
X-Gm-Gg: AZuq6aJxAlmBhfeK1m4x+dWy7nPfnAzJCn7w5CFxILpBIL1NdIbotbtp8IV6ZzAzaxQ
	pyB24B/gOXt2+Z80pVdcfiT13i6gT9Me8b6xQUKaeJDaqQTINsbDoKrlifctdeCvHwdrBwZlCnu
	hfTqI3ogaa+2xToQHYb26eEHrOTAMEZnebjL0/y6F+xkvEOIHYMcmi7jeqZ2E8C24Jn8WEwpksq
	xa1lmiIH47dP1S5XhwqkFHawtnx0psnUfYLs9MZYDNyU58zSySf33NnE1fuRApH98shPAz5WKwt
	AKUmhrIvjENxatIMGsmEDouVJPQrigr4o8QKQp8Xh+U7yWL15NWQz/4e/Ce5jAGuCwfXJ7ZO1Ga
	i5r5LzbBVdv00gerzISfpFwX5GoG7XTqVWajNxb9yXdW3P2zxXdcyAK3XylXjgb03vEQ=
X-Received: by 2002:a05:620a:3199:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c70b7414f1mr120435885a.0.1769514089520;
        Tue, 27 Jan 2026 03:41:29 -0800 (PST)
X-Received: by 2002:a05:620a:3199:b0:8be:6733:92b1 with SMTP id af79cd13be357-8c70b7414f1mr120432685a.0.1769514089057;
        Tue, 27 Jan 2026 03:41:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dbc85sm783768066b.1.2026.01.27.03.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:41:28 -0800 (PST)
Message-ID: <458cbc02-5649-4ad5-a6d6-3ef8c4dfe2eb@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:41:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
 <20260126-venus-iris-flip-switch-v2-3-b0ea05e1739a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-3-b0ea05e1739a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NSBTYWx0ZWRfX1h9DJGupRfWc
 tRC0eD0UHmx5rlHm6rQGn2x4oxyY2ViwbTlkGFCvUyb3zsrg7wGiKdAs98OUHunWiTvrCwot3rO
 pml6phQZw2ehfMOZSIe2b3UtS64S0hgbQizDmIbiRnyqu+y/cPsmhqKkkbg1oqi47izqhmh5K0o
 UHDSOsTHtP0+djEG3HgmWQkXUbv9ppomJoEHlOpGi0bxkbamH0KXSNpEYLrZ2p3e4QvO34bXNR8
 eb/zBjm6eFnpIHZutdpj6vAkikfs74K8ZzIz4TFG1OGXepPSz7Q5JAQHKPQ3bSHeNT9sKMVYxyo
 /+pwmm1XyMBSzk/92n9NPnVyNG4GxRliSRsj2GJh/glyPydIPsj9NkQxtCThJoKyDuXp5zmcxwr
 UK7ySC4giDOQfF641xIoCtwFgyxMD0GxISpvnyv7PSGEZJsCfOMEb6ZuG/vFUIoIZZQx7psoRLj
 vvtxsxsInzsHbOrxzwA==
X-Proofpoint-ORIG-GUID: NwVTbrcyjeHCvczKAZplUOdpOUkAwDek
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=6978a46a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=taCg-2STDlqsnU512KsA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NwVTbrcyjeHCvczKAZplUOdpOUkAwDek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90736-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57BDF93BA8
X-Rspamd-Action: no action

On 1/26/26 3:09 AM, Dmitry Baryshkov wrote:
> As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
> uses the video-firmware subnode, move its definition from the common
> schema to the SC7180-specific one.
> 
> Future platforms that are going to support non-TZ setup will use
> different semantics and different DT ABI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

It's worth highlighting that this set of properties is not enough to
accurately describe the full capabilities of the hardware and will
likely one day be replaced with iommu-map anyway

Konrad

