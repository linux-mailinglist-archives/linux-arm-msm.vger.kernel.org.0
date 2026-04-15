Return-Path: <linux-arm-msm+bounces-103277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLg1MChw32lWTAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:02:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D8C4038C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDD7930C84A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36A834BA57;
	Wed, 15 Apr 2026 11:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+vvvPTZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqhJG+IJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC98347BDC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 10:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250800; cv=none; b=dbZmNvR2hkRaqo+nMgrCrDE4KvWHK8Ii9AL+3p/x55EQ0tfGnxQbbvXrKV9dZDG2fMgg1iUcjdkoIdGIh0Iqzg9smJyrwbF/i5MA3f85dzieYxV0CpxVj9CN26V9E/3PXrlc4nLQfhUEcifrQyDk3nXjaFO/eRkqnSfy5zhhtHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250800; c=relaxed/simple;
	bh=+lnRg2QVwgm/33FpWxNm7zhDQuwHwAICUyGFrKrkn9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHVgeGUXW/C6P0jcq3BZ4wlNcCJR9vQQlkGlPXi2JAVEACb+SaO3dHmJ/Bzubc1aL3+Urky2mnnHCdIvUuUiIgPThPqnVSaSVwxiUvN/LddzWB3nlU6wkEYtPet9xsiDufedDHxu9oXSfNEcRJzbW4xDR5mKd/d3yXKnX4OvA88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+vvvPTZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqhJG+IJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9HHFO731026
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 10:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/7FN8NQtfV7xQGVRyNcE/DUA+bUuRssnQVKpgLbVXk=; b=o+vvvPTZrb/xN3zj
	49oGiH1oJIYx8vbIku1sto2ygLwSW+b1f4xN0ORlCBzAdIrBidJo3R0/cIDPHtuP
	WoOJ3M3lMN8t4GhUrkEsTVPDm691cOy1uPhucOLy/BLpw8wDfHGCqFFJyWVF++/a
	RkNRrXJhQClGZOWtul2uBkpswW2RBi9MH6Ee5CKDvN7UMfqzccvt7G6liumpH5gO
	mZCoqNgRi9VAX0hQ8yyJvDUKNDFB5jZ3prEs+QEoXd46gyb8BstOr1d/VtmDEh+t
	8jUMv8Uva4wt3wsNmURzMwHM1+5b3kQn1XtXp+m36K2urwRAmMBzxoAdv/o4wjzX
	K658Kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruubdg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 10:59:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfd003bfe2so126368885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776250797; x=1776855597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/7FN8NQtfV7xQGVRyNcE/DUA+bUuRssnQVKpgLbVXk=;
        b=KqhJG+IJFECGHGsT1i97JXVXPd7TerkTln4a7TWgL9nGjdBGS+qa21borcFnPtTmVB
         I+P1JXSmgHMCDqTI2vF/fwIrkOU1cKTHQHU7GCGlbtUKrAcLJWJStv7Y7hbVFqU9Ho6o
         bJXW5a9rTkcyI3lJltvp5Ohm6iw4H0BGBSZkyUi/+zjM0Sn0oBk7jc9rVH4KGgZQcl6J
         1CnBI9ryDmB3iOdCfXDOFUy3vKlieHi/mgYMp85UWyeSmWJ0jb5xnL+uR749ZXGABD+t
         2NrEBht09AuCfGH3Nc162wjQnmBpzsdVfOQvRAaTMFy2ikWc963rkNGqTEO4JNmleyDh
         yGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776250797; x=1776855597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/7FN8NQtfV7xQGVRyNcE/DUA+bUuRssnQVKpgLbVXk=;
        b=APOkLs9hTnl5StXmULcGGjeCmjOkvqbKPqE3p0hsCtUsZVt5TRB/jPq6hN7prP5mIo
         yBxrHvKFBUdJODgDXPckjMq+xy3RMuI+NXbSRNXVod+PbKQAIBacdWSbrxIOLftiU33F
         Eab74gR4/Ay4nS4jFfxq5LGa215KG57yetzkhKqqE5Tt499bs3QUazg0damECbU9NBk6
         ZFvmO5KJzJ3i2AWH7KR3GjF+9axHgM9ws38af8QxNvsQKXtAjNudOTL4uMhhcpZW2xNw
         0Hj93oADH8jpsQQZAPZSqlaQkyI6H0cZV/ExGcqRALTGgAR7d5pyV17zQ/MNG0bzB+Rx
         in7w==
X-Gm-Message-State: AOJu0YwkQVuhYEaCTtmw/qksvAN6Hwdz5iB2tfzyKFFAqsJaJO3JOnOa
	kY8qu8kL9cpi85LqV272LUAk6v8/UTP7LN6i1zjVkCHmm/0RNb3QKm8lCpvb1E6XqXnPht/Tuk6
	SyOXVc3TcsmP4fKoCD70au4A2H+IUJMixMCYO266b8lon+WRrhQEEpKgQ/T/JN1PRvAn0MesPDk
	ta
X-Gm-Gg: AeBDiev94KzSQC08QtH7QHjHpfXGFXBgePxsZam9BXCbLZgNYFBRGsfDlwrQphIGuPa
	rFFYC39ZRoiN3eNyGlg3BiLlU8NCc40Fd9FDVHFUO6b7l5cTuTzNOBc5qlUC1vSGZuEVpTG9BMg
	UtVsLwYfnfo61GvPnEKkSZ1zAIOtxd1OxB/ZY5zsuu/Wfus5sRossB/YaHJ8LSRi9FvOrqZmoSb
	pFWaHfZgBk5L3sDopYoUC3q5P2IZUgIbiTHdYw+/tognHJVuVbYLXByVkOXa7g3LUUyina+DmTn
	nBVsGXdDir3iRxgbIWr5wfASvvMVqvscPc8CjNYzImFu1ACoHR2oapRhtTqQKER9tkWz/Wtqfvv
	6vUBLTUuprthLw/DLR0qXVu/ToUiw4xoPlJd9rnq7c8P8Fg1TeoMjYU9S1PDTwZq431jKfZPDNw
	D8AWULM1Tfcmk5AQ==
X-Received: by 2002:ac8:690d:0:b0:509:a3c:e390 with SMTP id d75a77b69052e-50e1a7601b3mr16917221cf.4.1776250796850;
        Wed, 15 Apr 2026 03:59:56 -0700 (PDT)
X-Received: by 2002:ac8:690d:0:b0:509:a3c:e390 with SMTP id d75a77b69052e-50e1a7601b3mr16917081cf.4.1776250796485;
        Wed, 15 Apr 2026 03:59:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237fff281sm310720a12.20.2026.04.15.03.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 03:59:54 -0700 (PDT)
Message-ID: <baa7a564-2106-40d1-a363-b95645d283bf@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 12:59:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom-qmp-ufs: Fix kaanapali PHY PLL lock failure
 after SM8650 G4 fix
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, vkoul@kernel.org,
        neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        mani@kernel.org, abel.vesa@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260415104851.2763238-1-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415104851.2763238-1-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FHO9yny0dHEPSfiYFfoU_XKpfJLiFP5g
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df6fad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IGLtpV1Bqx4y0bnjnHsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwMSBTYWx0ZWRfX8AWQSg1ft9nV
 +hJhLpe4v1Zw+RiV+lowRvMLE4+nwmop5wmvfuhaVjAA6yEcnCQykpueM+Fy7sWHVSpGa25uhua
 F35D3y9MyuSUBx77qV6hJT2msKHzgpc1aesxKea/jFN8xDag/lNOVUxZUO4M4aRpM5cGpOdstyt
 0cYUNBPG5nbW2bsiPUmt17oeE/s8ZiLm7Sd7kk5Loj1VKPZGf7yy9LxOT+h3a68S+h5j7697D/g
 4GDGojBELe5klV7PYSmyxScb0S95vTiSc7ttkaSwquGsmdRdmyQttxjNMgn9NT15ihEc8LyWayT
 SDiSUSLJNeEEEaCY8os1Z7nECMFOW/nBXxdhdwJKLME8XjPaB8YQUp68sqGIPvCBsDfbD72PfVs
 Ku80ZzATN0c3YP7ub3m+jmLk656utyrzImUtEfb2na9V8EdJoz5guj+cQcUN3yuEYvwJZjilZU2
 F382zXqMeT0yrJjqgfg==
X-Proofpoint-GUID: FHO9yny0dHEPSfiYFfoU_XKpfJLiFP5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150101
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103277-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87D8C4038C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 12:48 PM, Nitin Rawat wrote:
> Commit 81af9e40e2e4 ("phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4")
> moved QPHY_V6_PCS_UFS_PLL_CNTL register configuration from the shared
> sm8650_ufsphy_g5_pcs table to the SM8650-specific sm8650_ufsphy_pcs base
> table to fix Gear 4 operation on SM8650.
> 
> However, this change inadvertently broke kaanapali and SM8750 SoCs
> which also rely on the shared sm8650_ufsphy_g5_pcs table for Gear 5
> configuration but use their own sm8750_ufsphy_pcs base table. After the
> change, kaanapali PHYs are left without the required PLL_CNTL = 0x33
> setting, causing the PHY PLL to remain at its hardware reset default
> value, preventing PLL lock and resulting in DME_LINKSTARTUP timeouts.
> 
> Fix this by adding the missing QPHY_V6_PCS_UFS_PLL_CNTL = 0x33 entry
> to the sm8750_ufsphy_pcs table, mirroring what the original commit
> already did for sm8650_ufsphy_pcs.
> 
> Cc: stable@vger.kernel.org # v6.19.12
> Fixes: 81af9e40e2e4 ("phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4")
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

