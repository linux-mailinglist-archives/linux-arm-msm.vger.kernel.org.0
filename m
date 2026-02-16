Return-Path: <linux-arm-msm+bounces-92923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMf5AlX7kmlx0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:11:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F21142BA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6137D300C00F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40042F12B3;
	Mon, 16 Feb 2026 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cF7npTWV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQFDv584"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8A42D2397
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240212; cv=none; b=Zdg4s6SC/CxuwFwSvI7UV/EIrjSGOahkysze2J7X6Z4kTn/c9McnA7tGDzDpNmUHLGo425ptNtQQSrOo5RmIccuhiGfLX1ZbrMZvSfN4+N+rBJF2BaqP8Jmxf7uXNtDird6j+KkrR5ByoAE6WTOQpdmyQrNwpwhE9bb7dew9j5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240212; c=relaxed/simple;
	bh=g7dP+8lfwb/lT6YzqLD3i4VHeMrHGPAqez2+4PwA2r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IFuKqgs0bWH5UZZFvRWP0rAqmjbkVEkeSn3NRZ2JpHVsb+1Tw7DutnQWX8AvLfIzvs/eDoaDBk8OgRx1CBEq7MtllTe6PoKGTjoU1OnQaFDtSa1ZWXGLGC2RrxVSL8BPdEr69Yei8bE/0mUWGS34mxJy94NABmg6kGewnNzOwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cF7npTWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQFDv584; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8fpa62801723
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qv+KamAOdFvslDTauIv8lJA6oKf+reuje9OpvNUDuQI=; b=cF7npTWVaMLA7hgJ
	+VgnQC/Du9POpXv9zPB4nNsNnBr4BTsq+N/RzEBrcN/9+Vb1dX3spaWZUlLGKr+M
	0w1XVF3i/okn0I8O0wixnaAnDcwcxv3v7/bTk2FwthPbjq8/ofFgTJNXlKWIc747
	r9FTevk4Fe72tydjoqZuqUQ1cr9bjfP2eUqtDarM1MoQ6d71Us1y3z5YzzVtPzpm
	4flGmvZneHlzcPXR1duArp95XBceUbB2u91vwEhTZCWNbOnatkSxha7Yf0jLOqM/
	vXkdQoxTsF6+aFN+sV9aZq4SveT2iowRy0hoPWUaDazC93GT/8CJagTy32cFcaA4
	MgOh8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxugc62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:10:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb45a6b860so151830085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240210; x=1771845010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qv+KamAOdFvslDTauIv8lJA6oKf+reuje9OpvNUDuQI=;
        b=YQFDv584AHgwBzbMwIKn2LZiB3NChqGjvdp4Q3Eycs1gbdd2qba5+0EllRhANrIJ7o
         jvefYNtBJEDRXhwaZDRCRA3et+dweQOfnGjLSJWnxZmS3vrNoYvH8V1tg/NglKd20Ldr
         4GxlTbTjqQ+tfGQB7mORtbrp/+pzgJMDcdIWNuFg22z7ITiLhM78bKy0o/26VdGNoUWx
         ZffZst6CXckg41AwYX+Kc7FfTa2yLLYBHPAd+p2h2GESWqFJJLES52VU8rk040fZfIul
         2DuNIo2Y+ZiKhW8rvuRuFX9v+QBxOXbhGYyoxbJ3zji7J/zc+aeCBK6cM9uXHUr0CkGS
         164g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240210; x=1771845010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qv+KamAOdFvslDTauIv8lJA6oKf+reuje9OpvNUDuQI=;
        b=v4hVfmpTdvk+LrE1v5Q8i2qvwROGjtHJ+92171gblqZlorQ5qWn7w+1ZXdawM8J9qY
         cd+iy+e5sNn3TL2h03t+qF96qwbMbz2hhlLzYrD9nqkO9kWCRMZuCO4nqm9MtbgESiqH
         PDJc2OO5+X7xrf3V4YiNUysjVaq/CXJYbhPndsGjpxt+cZ1sgJABYMSNHDs0hZ653aam
         sRkPTA+lR0xgtUKPhePV5CEJJS+0OGEUwFD+brwlHrCJycDw8hCpppfIF67y9WpWro2z
         3VNf/UO3aTzeXanR+lZEsjMEf7qnLnLBSiHzLMdH3SxMMoCluq6717PPPZKpr+P09WYq
         HBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWamiWJWviqO1bJ6DmSeMjL+LCDRCU2Dhsbzja36Rm5W+1tSBXYIFPIUIpwJ9169y5/BcPPCx4vRYxdSKdT@vger.kernel.org
X-Gm-Message-State: AOJu0YyiA3gwtzHiNnyDDiBYsm33MCoLsmwqfsav0fUOS4rh84q5yAUD
	uuGM9PktB7bKCwa1j8mP2NMVUBG789qrvorKDCrSiqKFcRierHvB8CZzqpo76IAPP5M21NSFmm8
	81AFa6vKuRuZz224H1WMREWi/uxgy3ZXNvrzUzTmLPxxbd32JD+YWhihUYUcmY90uDfZM
X-Gm-Gg: AZuq6aI2HMTBigbQ5J8wodpe/8PDJ0Qn73+5V70QZY8qB4smm0eErErZfw47ZDEsZ2/
	+W+zEZpzbM2Mzdlg9lFHAuBq5iisFiYH0GjlcURnjZK3Row1479MDE9CTim6O76OFXqgO1H7q0x
	wBBfpQdJjn9BKS6nw3+6PePAXURiw4fWHlrLpEDAXAlQirnwJ0IIS201MWZocojaTJLkfpk+rDM
	f4prLne4ySC+P3rPqJ2yiZaEfFV2rbv5nVtz7MxANPJKNDtuPGkgJ45hM7oeXl0UT2Tz91eyvz3
	JA8NodMg9wheVmSFZAe5vTiN/1q12/VLOA0ezEKUbPa5nXJqevmtE9J9vlrSydjfnhUS7+5nJkp
	W6tp0n/NehmPx4omB1BeV8vj/fhxbOE6GbLo0DUWlZV5+3+fxUXDHLID7olACeF9H5AVEx5+kBX
	k5cq8=
X-Received: by 2002:a05:620a:2905:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb408ccb63mr995466185a.9.1771240210038;
        Mon, 16 Feb 2026 03:10:10 -0800 (PST)
X-Received: by 2002:a05:620a:2905:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8cb408ccb63mr995463785a.9.1771240209609;
        Mon, 16 Feb 2026 03:10:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc762b672sm250474766b.41.2026.02.16.03.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:10:09 -0800 (PST)
Message-ID: <5da70eae-a419-4490-87eb-8c61338e3e0f@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:10:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] firmware: qcom: uefisecapp: Simplify mutex with
 guard
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zhu_eplZSzZ3CtTzE6lqNPx_3RH2OgiW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NCBTYWx0ZWRfX0ueCL5bymEDh
 QtpDa9s1tkh+sNVV7JpXnxc1iRoW3lyzfGWUKH0TlcNKAED+1eizykiZIVZ0/Zp0k43PbQ4cqpt
 BrkQP4RIHA4ub7AxJGxbNUYAZuAl1QlpgkFoJwJzRXUhqe0uPNJGo3Tq1xZ5qwCwkwPvdpr14zg
 6JnG4/ASTLg9adFuXlyj3RmlaWd9p8uJppsWbnDsXOnCnskW6nXvjlbf5TNYcpbPHKT4XNQ/S2P
 JPhqAynFCk4eyJV7SDh9NI90eQteSLouCGdg9wYeRZX3Uzddt+J0ZRodVvqFfTjdKdkZxmtSOu8
 WfELvZedmEGK0PZREs+igrQFVJ1TvBYTEjXVi1ArIB9tpe5VOF0WKsmsuePnTxX2IgtuhCFkNMg
 HwL+c4xMReJv0IiHQSu0NATdez09IZKOP6uA1crrpmbhDPJSCW/nyYS8XGUq6doOAGNvMGqOl1/
 Su79qcLvqSIIelr6xEA==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6992fb12 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ELWE7tHOECisB7dOq5gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zhu_eplZSzZ3CtTzE6lqNPx_3RH2OgiW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-92923-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69F21142BA1
X-Rspamd-Action: no action

On 2/16/26 10:15 AM, Krzysztof Kozlowski wrote:
> Simplify error path unlocking mutex with the guard.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> None
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

