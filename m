Return-Path: <linux-arm-msm+bounces-62021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD3AE3A30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52396169F82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 09:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9241A2367DE;
	Mon, 23 Jun 2025 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guowqrKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BE923184F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670974; cv=none; b=dWqoR7mDWn+TlfDOWIIBVbToYCIViVjGrfiZnMUkraZeWgn11l0HhImJLVvdL8MOnCd0Ul0/vThLWQhJ4eXu3bFe/5dwrPXM7rkHWa4I2+w8+485dTWF3CxT6YdgAtYC2H6x8nDsPABnTJ6H65T9H6HwAybZIPb7V/PwCxm7Ir4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670974; c=relaxed/simple;
	bh=s4yxcqSsLZRyFxKimOtxFZtawgdeJxY06K2HkvWIb4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oS0j/7DTmfTgEqxiiLxx/neFlj//7WPZClL7MXE3eJ7dkmtpm/I2PTOUlmwttOLHfcCW+/4ClKGj0eTwToJiiaidqF4/jJq0Vvmxy/4qf7yY09+i1SWZ/R8Jv/I3MDlYN+H9fzq1/2TXE5G58nBDO2DagooDasf6ad6hiA8KjxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guowqrKF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8LjZr006119
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	22uAjtV5PSzMb2clVet5sEROqM/xcHlqBYZ3otWfA1o=; b=guowqrKFrok3AVD/
	T5ttdwGw7bomWdYzexXSFDqcH7qPCQu0h15/w9lcZ/1btyfa2FmFwArVJEMk6BW2
	5Xt3/d0UABKlSF4wOXH/0z4po4z/wNKedhshiLNmGDpT8wNGdUti801HOvasMO7d
	Jvxk7zB88co3WkqXWuEBOvmn448yl43cbZr1v11ZYGN7dxb4wCxGRpZpSZMmDFTg
	li4Ez9rPs4j3aLb7FuTpOUxjyQE748KgNuz9vE53oPcnsb+XsksAjvDvRvDQ4WM9
	cw64DyTqitCP4XRHuWwPaNl1wWYbcNlOxpeqyumj3UY89QeacbyQuDoLtMLjYOJ7
	vnXpmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg85mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:29:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0a9d20c2eso107109185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 02:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670971; x=1751275771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22uAjtV5PSzMb2clVet5sEROqM/xcHlqBYZ3otWfA1o=;
        b=pZjIP7TnFOeb1CA9faaIjVj6T3UmG+jU05ndDoVyR+WhAuGs8QhE2+LjeuAcRHkgev
         hTa116U87Axx60h4hGtYzPc5JTZKRs33VTbJv8mkIEQHoUxolX5KGr+py0+Ea34SxfgU
         xzLYxmQ1PsbtoxEDGWL/HncpYyYPoK2kL/wvKU8lJ1UfPERVA+Q4T229M5iF+jzsL7Xg
         aYiplVMrEcD7/uanMquTMwU51/hRxMTwm3LFz4bJz5b7LsWQttFCLv/XqHlFZ9FB0P6g
         aJm8Bo3LrCQWnGYjRR5zgWw8RkE5H2kTl3Wb5OeBUsE8xRqSWwWjjWmk/twX5CNBIjV6
         5cIA==
X-Gm-Message-State: AOJu0Yz6bf04HXnmORsYum2PLhiFHycN4p5V+Bdb+glGKv81qyLVpVYe
	y7vv9SNsgIMthUDT0wKlunuJS/+g9BgepMiy7PVj1M8xfK21+vP3XOzPCDEhbFG1YDbz3pJIp98
	pcxL/lIazpQCisg8dS0hFgfIMbetWV3YBoxFdtqcbX/SVL+U1gAkLu1eGi8HPuXMfAR/jN0+ITC
	Su
X-Gm-Gg: ASbGncv3uyEeQsa0+PrlqjBK9m6A5EM9AsZNOCT5jxuXxPeSr0BB+Yyh3H9EOV2aCfC
	DZI04MoE+uioF7IAWj3W+vDPdCejoTGdNfqx/JgU94n0L/Y4mQsrXQ70Lp9pHglUUfMfxWgLJiF
	Zm5zIAUdSHOc27AcybWf/LH//9ZSLiXSzd2dHnIo43htbzqnPHl2U2pxPWkyqRppJHK+C2nExDY
	q5AwsaiJjKm8+N9diLpKgKUaCLUi4x0E6n1ARIj3kIV0ZvM7YpANiX/EXQxEgYszKxkP37YgPBJ
	b43eBNShH3QzQvSUujgaxXZUE5vmhI/32JDVRpqZC2o9Im9b6XTFCA14mbqcq8LS8kV7YzCKqnm
	hNuU=
X-Received: by 2002:a05:620a:f04:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d3f994246fmr546479085a.11.1750670970929;
        Mon, 23 Jun 2025 02:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTosP2CTpL7j4n9SIJ06lbqyjgLUjHWwM92Hw4eepLPWQDDD10Luc0PEkyQKT/A0YMQaHyOg==
X-Received: by 2002:a05:620a:f04:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d3f994246fmr546477985a.11.1750670970497;
        Mon, 23 Jun 2025 02:29:30 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7d1dbsm686735766b.16.2025.06.23.02.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 02:29:29 -0700 (PDT)
Message-ID: <3dc44e58-1025-4299-a6e9-d91ffe5e3e8e@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 11:29:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Add RSC version 4 support
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-rsc_v4-v1-1-275b27bc5e3c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623-rsc_v4-v1-1-275b27bc5e3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tXgtBHJOvOmUC6qRbxl0_K86A-vfe6mi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NSBTYWx0ZWRfX074K9LNXtDZO
 xli0ZQkGLZfpeT9lVtIqDSy47fqfcp3pBlRlDEib+Vjkn9Udp99L8BjEBv2oGbTrsXz71fgvgyz
 zUp9VEgDuofaoGtyx928vmyH7RhaQL3UIYuR1yISA1V4FpRNuZjUAX3GENBQAkVGrfO1Vr/5ldV
 HQNBbAC60ZxfOhCQsO7rZeu8R+IYzI956VhCrmVnYT0z+O/gZg22WSzFarIX2O3NChJouRqfRL2
 0PMwrFnymStoLX30hOIu5lAfQgyc5zpracJgeFeHK9NCaSm94t4TkCUGnCTW3el4HuWyHoG2e60
 NEgZt6za1Lu3x9ssaTzIgwIfthPmguwG/Ok4hBVTizBzzHmpJUTyap5JGm7YG4/syUMxWmIVy9l
 /yBeb7ckgv+9coZRnh5LDOWj1lo2WHglqMf93AySvv/WhfJQv91gc2QieaSDlRNBgxC82tXB
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=68591e7b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ynqr9smgVvFvz4hSB_UA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: tXgtBHJOvOmUC6qRbxl0_K86A-vfe6mi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230055

On 6/23/25 7:49 AM, Maulik Shah wrote:
> Register offsets for v3 and v4 versions are backward compatible. Assign v3
> offsets for v4 and all higher versions to avoid end up using v2 offsets.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

