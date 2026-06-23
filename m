Return-Path: <linux-arm-msm+bounces-114244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MjcBMDyuOmp7DggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:03:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5C6B888F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:03:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jwk1pkc+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jtbFu6dG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114244-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114244-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78EBF3049E3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14CC30C15F;
	Tue, 23 Jun 2026 16:02:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5017307AF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:02:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230579; cv=none; b=iEGgR4tjwGzz/uLh2rayztj4mFa77bDabEYUnZtVX0GL7SRuZf6ezIg2QsI9uHDpNpxO6BkfvKOrXWDHOCvZgL8GfU3xS4gMafK7GZWzZxDm/umSO6yyrc+7ykvp/gZS5yLivPA/KCWboIcwrdecd6NE8ZY1jVL3uim0BFw4A5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230579; c=relaxed/simple;
	bh=/UrQ1a5jEoyvccg5tsS/vfbkMBLFSzVTkQSDcxQ5qys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/+9Dz5SVtueUombA69aS4SMVsRI2DmYvezlLIpDvY4ieEwF7qETX6j00UTe69/Y1UYMOBAKr1TdvxYvO7JVNKfw8jJbn74KCAhBgRj+bixkK3+8B8ujmu3kaN9FUTrf4ya4eVv7S0b2fW/FlOP2Csrzliff5WUM45Sav5EIgNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwk1pkc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtbFu6dG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZNp54017423
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EDBaC1eXq5Juv4WWLDTwG9RBd5emtPKDg9brhkdKs00=; b=jwk1pkc+AGsWUUK9
	dieU2WZWUbpVICpERalDXpEDuZLM9VJPIyIbpY0nLZUanFazpPhCGmj8jpYYRVqe
	rlymjFByyNLcA+jtd4O991Z/3dPPGxCoZl7Hrk+Y4vkJ8y9CscF3LvftTPYNV+Mt
	vt0LP5FUzvxIF+mRMYf+na/pMtrI0u6rD31yka+ieA1WC5LK7OCaQxDExGdDdvnz
	wmjf3uG2m97NlpftWNbzJnAQxD2C5zFAOgW5K7RDs+gYd0GsJXt3NUIE4KKxSvos
	x0emNgfvhqQL1V0O8F858JhFm5y9SUmWvWAND4k7k5dh3xqZnv332eJEW+/FPUS+
	TeP0rQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjk6sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:02:57 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9379e2fcaso13296a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230577; x=1782835377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDBaC1eXq5Juv4WWLDTwG9RBd5emtPKDg9brhkdKs00=;
        b=jtbFu6dGbQqJDRg0IBDVAvJBt9WFE2a4RUvCBzmb0xizsF5eJvwwPpX8c42poo22j3
         1Frfscvm6DOykeol98/B2m6QmyuJKsSsmgg8rc8fmSwYfyaDD+yyM9gl+NuWriBS8/HM
         HHzOtl+jFg6M+fR37FIpXy+dX5cet06+zq7P2RNuN+M6+514Uk5rqo7kFIbeVz47wnd5
         S1IyLdkPIhdTpk3EHz18ALHxisC86ai76w3N7b2U7b1bGf1NOap/gUuCDb7Pauz2Uc8M
         lDoNV3uEvWxCqSdujDSphOD7VOqbaujyk8d4WHbiPFxHyZy0HqV+MEh0vX804Ze4NJUh
         JR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230577; x=1782835377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDBaC1eXq5Juv4WWLDTwG9RBd5emtPKDg9brhkdKs00=;
        b=MFKWNcFYdPWbYPtitwO9ETjS2l8VuWfQ+5EKL5BG3UZpzlVmnW+tQlAf5Tk2O5qSuT
         L6+FY4cWvBkVtZAy35b218Zf2zIIo6ffRnnvG0NSywkjwWng2aXFIiCyxMmIrByXIUuy
         KaGwEq0zp0fJZn07C/3f4jnB5En68JuRdKNsCzQ/Ck9ZopxIEI/uE/dzvDZzro+UrkmC
         dn2HtZ173cI25GYXHb/rirD3GMJI9nv4pSHKnXV9iY3fRXUjsn52KvXSEojDvPLK7XrR
         ChpbjTcZ5NBMQJMIK+fR7c5m9g7917aFBEXOcYHl7vTuyeb0BO/8DWoMquP3w1v9AGkQ
         rI4g==
X-Forwarded-Encrypted: i=1; AFNElJ9ILVdMwPqVtvnZciVz0tmGX9bl9LBaO7UP00EC207BxMy/MuDQVJmFiNypKAvkTWpzsQF8FkUiU+fOPxre@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7qfX865k+Yd3GMlpLeGYniLpx2+vBzllvCPW2YJ6VQJ9Yq7sM
	TCAeDgP0DLVmwtvrlIyL37dQ0fE0XZonEsll5aYqs9s0YuHwws7BLDIXb2PqTPwccvZEgoc0HK1
	gFv7SJaWzQn2WHDoPOb8odxILWCouXgbxIGIpBtIOcjq4BTQnQ6fSD4EGoIv8CzgeYaKv
X-Gm-Gg: AfdE7cl2Pasl8RtrZ83/Xk9qY08H8ThtaPQPxv0Kj8pQFnPkm0nNlsZ7L3hO2BTbIMZ
	MHcRn/08eylNqiny9KV/KM571ByUwzpusPXNDHawVqAcsmIF11Ya75H3fcnvX+IbFbtYkmU5Q4w
	WtPBqZnxpxiHfKTUEhLyvEEdzzkz5PkuQEO3JoIJu3Eo9nSDYyiGplEcK7wsxM++lcbtfT1cypP
	B/YpSKHjvlJkq9EiS7PBXjMVPGhJS0fxuUCl+LL8Nom6lQ2khCUHuVjWOIjWk6dQop+AbhBWLQu
	X7AYEtiScZydU66mTxqSRToEkncYgFd+u+Zjrvy9/TlpmXS0JfFYroasVt8vX8gDbyGf+pul8Up
	9I/cvXZ1+YnaxvL0lj/5OhiblK7MFw2WVk2Y=
X-Received: by 2002:a05:6830:82b4:b0:7e3:f809:7984 with SMTP id 46e09a7af769-7e93c26c950mr8027519a34.1.1782230576858;
        Tue, 23 Jun 2026 09:02:56 -0700 (PDT)
X-Received: by 2002:a05:6830:82b4:b0:7e3:f809:7984 with SMTP id 46e09a7af769-7e93c26c950mr8027473a34.1.1782230576359;
        Tue, 23 Jun 2026 09:02:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b86de31sm4777390a12.12.2026.06.23.09.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:02:55 -0700 (PDT)
Message-ID: <f636b144-807f-4a10-bf44-d06b169fce21@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:02:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] iommu/qcom: Check pm_runtime_resume_and_get() return
 in probe
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX0VTm/X+hWUq+
 cdzZ0pZ9KKFou7DypTaCmmFQpZKiceMhYYqNfwOYs1bwfzPyFrxGD+dEVlWeetRRU/a/OUyE1Lm
 Dps7toiPo2c68RyL2NiXmTNY/yiO6f1/ZZ0Q6uViM8tmYa/Y50BhLYjCMuTrKtbwq50EKYHngeU
 z8BXMNTQ4GaPMCHVp4KnoLQ0MSugj/L66M3TAJ+7p3YRMQWIV8DpfKZZkhgGwztsC4PkJVX2SCv
 IrsjGv5OPfgRcPA+dn/uSujrsg3GGvCG2LQkEVNrBhR0eK0tyKuMMYOCKDVwIhIGmZva2HYcuG4
 nndtANXQLQ+37wzryYNVowAWF76Ux1fLw47RK6lfdotU05MWQmfKLMM8UFnaQEnNsW7UP8h17vm
 XVfodVw94wi7WVCXTGB6o9YYaE8filqToOpLTQIObyfyVp47AnFtf2kll4sTMu9Ncp6CEj/3gIu
 9dinQUV2XQ2tjbbOu9Q==
X-Proofpoint-GUID: HbmKvaVBVNzYYKIyK3qNWnBxLICmEUYu
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3aae31 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=v1Fw_KadxetzZ5l6LqkA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX6n/2jKz67/ej
 ePox3C1rDcUSQqkCLk/HW0pAfoIelhGumlWSjhiRXmFzyB/ocpJeunZbFAlaFqm2eh0FM0zODr9
 bI23OLWNGwVhOjCsuHk67eO/EdJE6/E=
X-Proofpoint-ORIG-GUID: HbmKvaVBVNzYYKIyK3qNWnBxLICmEUYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114244-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DC5C6B888F

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> The SMMU_INTR_SEL_NS register write in qcom_iommu_device_probe() uses
> pm_runtime_get_sync() without checking the return value. If runtime
> resume fails the subsequent writel_relaxed() would access hardware with
> clocks potentially disabled.
> 
> Switch to pm_runtime_resume_and_get() which handles the usage-count
> cleanup on failure, check the return value, and unwind the already
> registered iommu device on error.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

