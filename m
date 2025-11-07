Return-Path: <linux-arm-msm+bounces-80806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB10C412E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 18:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A428B3ABEBD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 17:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E03303A2B;
	Fri,  7 Nov 2025 17:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEpjZa/O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQtMNifM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE78025FA2D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538246; cv=none; b=Ydw1dvR3teMbYiJTbBmSBmFCuumvXdpEhBVAyws1UknFRduzp8lHqWk/bpZYsOQJ5i8zkWZMNF618aJ5g0xFTEOkgoyNutNocGe3R2Rf+R8/5EWaTZQHyjkMcTXKA9OCwwWdYFZHb7fA1egYmp81Ny0Sb7cC/oGyg0xGaFpOzkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538246; c=relaxed/simple;
	bh=uzxXV5Df9HC4BB8VmSHSvukwgZrPq/clnwxLWolTVvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPXdUiodwUR5PRGwaHaRcA9QAbW56XqDlqo4QokLqW05rCQym4SsFixa8fO93fpRjJwVGdGAUjiMzw+wcauXnOoqTigGsjTl2dZDUXp12BJNb+AkOzVVDK14CGnUTnIDJerKGDhNwqc8z6baGzfx4wznu45hXBg26ZlA6/wgHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEpjZa/O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQtMNifM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7CYAZh2281722
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 17:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JNZGC633VqLDVToRc2+58VD4YsWuRK9aRk0gQMx3vZo=; b=JEpjZa/OAYhG9wh0
	2eqk4Rm5NHCiGFZAxtPjfV+xiwGJyJ9BDORg/8VW2TRq0z/BTqkVvje2+s4MbJMw
	zgA39XmmEI9DgrWyiK7TdH4F/GJR72QU6fMLS9AOehpeUV02Mk3OZh1Y0ATeTtVX
	BlcY9Z46VC1hz7ck3utgMQ+LIbOcDLz3+s58vvB+2aKOg4koSHEmWhvl9LXIESXH
	zI+8mheVsB9B8ingi7ow0sohbeA27TRlHcmb4CJUc8vAXUYUh7H5QEaWyHX9ux9v
	0vth1N1hGlNvvxhMOjxbuoTNvY6pJc2EPT+QV6atdT2TCiMOwHReR0rYnpfz755T
	GYQySQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9sj4ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 17:57:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297e1cf9aedso1806445ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 09:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762538237; x=1763143037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNZGC633VqLDVToRc2+58VD4YsWuRK9aRk0gQMx3vZo=;
        b=gQtMNifMUpCKhOasyPascB7ElWLkqrhXZN4GBfwNB5kKMHyLaBmb7Zdn2gvyu+ySdo
         t/vXeElG5Zr/qZGV67KAOtVqwL4bH5gixSF3Ym9qxOAhlCnXcIVeblwrWSZDhTRh7LuB
         TMQ9T5+TepSMvSlCReKpUCbpn7eK1XI9jaY0n4uVZQypakNZ6FEXRrAWl0t1OiG7+UKj
         rxRaErMB3LMip7Pg+ptsM3RBqwJddsTXq/KPNrcJw+bSRd4b9K+BAd+d67IuZXRW3SSy
         9j6pGmyISOovbUxDSYZkO1dhVvB8v+H3Us2/u/voXcB+J45pMgx0o1a0NX0TqIxD4rhP
         tOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762538237; x=1763143037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNZGC633VqLDVToRc2+58VD4YsWuRK9aRk0gQMx3vZo=;
        b=ZpuHfbi8xoVoYiiScxMDMW/yIlgYrOUhh8i0TNKwmEioMxqxb1yVwmJU5DRQJFuatN
         jkGVushxsLUf3uMMTL/oOyQXLlmHC9Hre4K/6CKiC0HZNpk62X8QRE3T3yGkbuaUqOH2
         G7WUwZHJepBvMhfvtl3tryovtdA+X3ajcIeyu4rXEqsUXXOCXt+/Ojf5nze2UrXiVbgH
         BIFDBalfC+f83pOtUtzydSnAXh7V/SXF5G/C/4lDSLdAx0p3uzWJ5KvG0mzvm82d+cxL
         EAKLx/EOfH8ILVIqNhtI3yuVdcrmK9veP2GY0l1oQpwNVyse0XVmZz6/tf+h6qXv8vyq
         08MA==
X-Forwarded-Encrypted: i=1; AJvYcCXsih9rmtPfDN8ZKk8xrbMEo8K97Dru4A0KJZfbLShCl3onehWGBTzcMr1NOhlHSvVz/ZFG2wLCil5kL9Eo@vger.kernel.org
X-Gm-Message-State: AOJu0YyE83HaJ+meNQ8zBCxL0uIWrJJ8lEw1bYgIHJRmu3Ii3m3IiOhR
	vyx+BHsFHKaBDLep/rFTz90jh0ogn/WuaygWUif+hCHpjFPf4c9Pm4T5uCeHhiJbrZ0IqbXUvv4
	E+bkHqiQAzukqmRUT4r2EHOqkC1QXgnJT0CuPZs0a37RD9kAPT9+l7zucoVRPGPb1RME7
X-Gm-Gg: ASbGnctMkjlBxXTq1wW8LMJiZbrJuc/eJgZYQse3Pl3pGNhMf3PHS1StIdCgUMoVVsQ
	sbKC0AHEw6yMsFn8H7z/Ms6fpMQcBQ3a1fE4UloBRE2I7kt1KRcMeVSiktyW+0fbdf9VEzCwk4N
	37WKlZ71uNxNzUGZp1UnGVt7sJEX92Qw1029jvXfJLG8NT1yqREXWXSYfi06xJ9AgkEnlvpT03i
	/3OXXXU2zvLZnvWQnpQvRVIbvDtH7FyyzJftV4/5xWhHaXcOfCPGmi5zaS2W+SWTNF9BG3Nxgk3
	audID0kgKBeE/jtxeoqE9/ypWRJ7Df+RofA1orCUGt6IJNBe4Xqhukpk0E7X43ILsHhwYVVqLGh
	5S9+o7nj7C/TTNQQGiUhq6zhlU51dMHVuMxRU6O/3NPKX/mT9vPLG
X-Received: by 2002:a17:902:f549:b0:297:e1f5:191a with SMTP id d9443c01a7336-297e1f52541mr3192915ad.17.1762538236782;
        Fri, 07 Nov 2025 09:57:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMbJ7e8pj3Lmk4ZZUYgAKIsiMJG48xVqamaloif0B9S3Yu+inP3lg2TrU5g3wDUVRpcjzq+w==
X-Received: by 2002:a17:902:f549:b0:297:e1f5:191a with SMTP id d9443c01a7336-297e1f52541mr3192485ad.17.1762538236262;
        Fri, 07 Nov 2025 09:57:16 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-baa3c2d92a9sm5063602a12.20.2025.11.07.09.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 09:57:15 -0800 (PST)
Message-ID: <c29c9c3e-cbc7-4103-b95c-945a29ca2880@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 10:57:13 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] accel/qaic: Implement basic SSR handling
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andersson@kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Troy Hanson <quic_thanson@quicinc.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
 <20251031174059.2814445-3-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031174059.2814445-3-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690e32fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iv-_qsQ2nCPXPxgN_3cA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE0OSBTYWx0ZWRfX2Z1UZURx/Ale
 ohCD4T7T9b0ooZsdaZjNXO5x/dC7VotvlqLs/Qv02weRb5bx/zG0jcPTelTZwrICeGRQUfwOQ28
 VqkudasNQ+CGf4+sLAnau0kyml8+2VVFDczN86P7/h5TTnJY0Umyc0f2zJmvTCLj52IWQclxPWX
 JAe2UcMCjssqsJAHVTCOvoa30KqbYwZR+jdXy8+NDR3TGxb/O4rHorkhaxzZDZ3UuZZgNcHxmeV
 +ET1G682turqlSEAQE5PcYDyYNY9KQ0simC390Qw65tPg2lJ712bXMbhQWgFIHTF+T441i1PMAE
 U9mp6XDLLclm7cQJHjcxq1qXuUBqU3umKkkTe+qbaBEPAMDXQHCrhoIhZ7qA/ECXfWFx16mqO/0
 GwlOYbPcePb8APd0jNqn15Y2WUAH5w==
X-Proofpoint-ORIG-GUID: DWimTo_sh7FvIJAo-c2hjik7BQJIKQze
X-Proofpoint-GUID: DWimTo_sh7FvIJAo-c2hjik7BQJIKQze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070149

On 10/31/2025 11:41 AM, Zack McKevitt wrote:
> From: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> Subsystem restart (SSR) for a qaic device means that a NSP has crashed,
> and will be restarted.  However the restart process will lose any state
> associated with activation, so the user will need to do some recovery.
> 
> While SSR has the provision to collect a crash dump, this patch does not
> implement support for it.
> 
> Co-developed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Co-developed-by: Troy Hanson <quic_thanson@quicinc.com>
> Signed-off-by: Troy Hanson <quic_thanson@quicinc.com>
> Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

