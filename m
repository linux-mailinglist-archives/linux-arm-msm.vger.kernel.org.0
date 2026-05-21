Return-Path: <linux-arm-msm+bounces-108922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHzLK5idDmqlAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:52:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70059F3D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 424CF303E49E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C8B3612ED;
	Thu, 21 May 2026 05:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bv27kMSm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3kTfOjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209933546E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342729; cv=none; b=Lq90vMXZKdUGQ6zQGQSJbDj90NiK6slBIxNfPqptYzBQ6tmpdvOFefUUGiiFzKZtLhq2cSJizdWbM7Un5eM0EuB64rh+BMAm1AgVUFuASY+lS5cMhP45QwN8vkt43EOA8TnkdZCcHSHnLzP24OcC1yO0ZNt9cGKQcRf1S4BySiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342729; c=relaxed/simple;
	bh=Pzdv/DlhQ6MWl5qmD6joKZY28whf96QZcfVfp4GIB40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m53wu2+o7E+bc+vnAoyqtX+FIZ6qel55PNg2WaLnNic+Exa3MBvanbTMpjkLNXUXZruRK2Se+I4fc+tPPdTUEFGi1yLz9TFipBMrNg8RVpFa1hBJQRt7JLzXmc9z5RV/gmfZoZCNBEbrqwBcwPCpRsbskCrfio/Z4RHMe/Cbn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bv27kMSm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3kTfOjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KMHLLh3680292
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GvEhCAAaEHxiipGpPIpBeuL/EdYORNpcby/vL/G07iE=; b=bv27kMSmqFjn9kkw
	krb5oAq6LRGF27cCtGPhcXz9sQ7nfOyvQQAQd/gSIwQNYZwpoNrHXZmk27h8qJYY
	a6K6v93M8PTS2h2x81ob3+fqFDr1SdD+cjJ4aIgGZV1C08AAR64kPA4kbyDoWzvS
	hq+b8uJtQDzdCsPMcXogrcOHDaZFH5n/hQNmNb7irCTL9V3+nY8NoviZusSwIxpy
	MFnml6KyM9Jt4EiZ+qC/xntYNoqEmtddpKmN9zwBECUqXqBt0pMi34UplpXSJQ1b
	Ki2ffKQ5K2QiwrNH/2p9L28qwMfJb2mGAcubcZ7CLHJXRir4yd3OU6WZcPcySbap
	PoVEvA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j3ax0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:52:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b458add85aso60651595ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 22:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342726; x=1779947526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvEhCAAaEHxiipGpPIpBeuL/EdYORNpcby/vL/G07iE=;
        b=V3kTfOjWhGKV6DYlavBhBWPDykjjuUuBRP2ddV8oChPy53FYRk1tqEo2pa6V7MJW/O
         4cC9lWJFZWAd0cSLh+qKP2kSMCqfMEAEsjt5dnm6g7rl09kLNdujHE5EboNmIFRpGUvA
         ZQbkW8UzCGUAGct3FS/6HOecMN9+hCrzga9xc1zna0SmUsMeHUFvCfqKPoSjYNVf2m9/
         hHkiO4DF4oAfAF1lLHM+d85omYKNy0KOdghs+WSqKWSixPNhZ41YSjZ6nctfZSBAnYr9
         4vggjdR7fncP0Agvhts39Nq+4SYKYD41G1OQzCIh4utB+aLHoPHaqFyFhr2PdB6vdJqd
         A61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342726; x=1779947526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvEhCAAaEHxiipGpPIpBeuL/EdYORNpcby/vL/G07iE=;
        b=kF42QBzlw0Kb75RwTypBhDPgFrgO55BTfBFyAz5lRBwSunqFaioRwYwPS0D2coJ4FG
         ktGceJoXdYnVUXvtreNceei1GCj/X4r9tE6gLolHrXNdfdqDmGD25Y0M+3972YactgtU
         HsLD809BdFcELmS+ZshyFD+9Ke+az3ziS0/my0KfMtfHL0N93qORrnqquhnk5lNliozE
         3rMnhxa5gP0tfD3vBVH+4L6WkZa9Idh36H1dbW82R99fHg+vLy7vbhveeOM0D6hG4y6g
         AJAWKrh2vQOKG+hqx0eH1REwS6PLWz5qdoo+Bz4Lp1F8vNlXZgBQfcpvXTu4Rr3B9+pE
         uFZA==
X-Forwarded-Encrypted: i=1; AFNElJ9mox7ANL5qffqj5TGayk7+zOnE+OX1TZgxCh+Ac1qS+sRzV/8Fd1Lom/CA6u8hrEQ/I1qkl3qMEpys18KR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4IQhAZvsbdD/iK1cAuvSsVCeefDepjb5KXlAYLQdOW77yfLMp
	VVT2vNobti69jg9V7OAX++eE6eDytkvBBK9GuriM7Li4/L8J3+QqOBbARKkBg5tyeXb8B3Unp/m
	GLdNHDv7J4Vay4PCrY0snGBbj0kVIEPN0s4fs/z68PJKI2zp63htjZfTpk6FONvuT9nZU
X-Gm-Gg: Acq92OEKuCDukrzFNH1sD6tYHR5rSxGYUG3RTFKJsMQT+zl2Cz6Mg7MTW0mZBIpeoCr
	qzFeQSl3wkjiiFSTWMWmye4QkBrVmhKFfHcNDgkx1jk7WlsPJVikNKmRhAPdo2uxhUT0j9R9/lq
	J2a7f600K589oI8fpATQHJPD2r79WJ4RVBbCGVJWHyayVBirMeYMGxMkDNZbomD96saDA3tWtt/
	gTeG1D8LfxJ+AdoVmxq/IiweN+Viz6VyHI6QwUvrVxrRlQZiUOW24y9dZ2Lz4d4ble1jIxxsUzr
	AuJTBdYnvSc+4BBBM+j7vAhQxuJFXCefzH8tcmsWF3kj5ipmkoBaAOO6uR+LOVArHoiWT2Mjv8u
	ix73qrCzmTdi9cIoFW/gtvDp/Syao9cUWKA9iPovOQp6s/CToHG8=
X-Received: by 2002:a17:903:110d:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2bea304ce75mr14982055ad.24.1779342725616;
        Wed, 20 May 2026 22:52:05 -0700 (PDT)
X-Received: by 2002:a17:903:110d:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2bea304ce75mr14981655ad.24.1779342725141;
        Wed, 20 May 2026 22:52:05 -0700 (PDT)
Received: from [10.92.163.96] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm235890855ad.25.2026.05.20.22.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 22:52:04 -0700 (PDT)
Message-ID: <4d46b38c-35b1-42fd-8bae-239449978402@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:21:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: wire UFS to ice instance
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0e9d86 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=M_1ArNHsO3nQ0OE0WJIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: pL0HSmnZqpwJXx1c0o-hoT_juI_9l3_L
X-Proofpoint-ORIG-GUID: pL0HSmnZqpwJXx1c0o-hoT_juI_9l3_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1NCBTYWx0ZWRfXzAiqNCpFtDYq
 SMFj63Ye2dT6XpGaJNARaR6q0hmb2u0eY7yIX8ZaIjRDV4fQHool7gt+I1ED8kXpPcA5EXRzTAU
 O3fT1DVfjx0WnGjTitA5w9NdF5HtV7Rdgc45koiRr3iZtzV3Rm39SfVPSyj+fijUQx9cJIrRA6V
 3DDNfrZOA2l5jTFhXZxKVMCSGnMIoDucVMv5zXw2xPzKUBsY/fG3DbOICQuXX5JJU90XZWnskSI
 yLKb8cjLNFvjMQbrPGaHVp28SoOukdZNCylLIRVl9PEwkCS7+10w/CasKhPP6Lh6OBCNpZrZVrP
 BYzriMqc32FXvXPYriMampcGqY8mFyoqgfk1iRNcD5cjmuCQXqTt14Qsux1O6QpwSoNbFWl8TuH
 fRhRNVWXymlQCaNJKXeAC5tkz4xr8z7/WG9SgG8ZUC9+jDu+qf3ev94LLPnafbwwD+vabD7weCw
 DwzKgsNjwBxgoiaK7zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210054
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-108922-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E70059F3D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29-04-2026 15:05, Kuldeep Singh wrote:
> The Inline Crypto Engine (ICE) exists as a standalone DT node, but the
> UFS node lacks the required qcom,ice phandle reference.
> 
> Add the qcom,ice property to explicitly associate the UFS controller
> with its ICE instance.
> 
> Fixes: d288abc3a70e ("arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Bjorn, kind reminder to review and pick the fix patch.
This is required for ufs-ice to work for standard/wrapped keys which
isn't in working stage right now.

-- 
Regards
Kuldeep


