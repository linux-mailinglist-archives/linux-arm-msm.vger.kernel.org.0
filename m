Return-Path: <linux-arm-msm+bounces-119129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lv7tFOroVmo/CwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 03:56:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC07759FD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 03:56:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pfomCif5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="BUjxWC/4";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119129-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119129-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB3313015A6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 01:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065E638F94F;
	Wed, 15 Jul 2026 01:56:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125E638F65D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:56:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784080615; cv=none; b=PscOEtPbi4+OMdbUACQAH+VT2GHWyyjzo3oBYYomY/ioUXkPrWjeDqV8I5RyZNXVe9oivD6+lXfjIvh39tN9Wl8+mW9NmS+WoMuHjFRhQOQvLMNof+brZ9FSvbnPhQeUs5vlwlypqcCpjVnzsFaoXGjS5VNsAG7lhhb7XCEbvC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784080615; c=relaxed/simple;
	bh=u2V17qhyxgg2JKFSjT9oimfPdJhN/eer9bOsaU7KjVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMjDegrM4qR2OCf2n+j6jV0BmXnsj83DOHV0Jd/rOZBoeZs1iaGBhw0t5AfAh2ri8ka83EQSIOoHqwSc9nlDN4eHxkL0ncluwszR/k9HIUziS+NBUcPECnguH2eu7Xg2/faXnvi/LC//7F7S8gllUUqJ9Jyd5wNA5U/C0hyjGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfomCif5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUjxWC/4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IDNd2098846
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1NEzi3ll4gdZ52BqXNdruNPx4sABY2QC7pNcTut8oo=; b=pfomCif5gd+3Hlkb
	cZi2zrSktGeSpgnOcDMatkNWKIO9zn0xlT/6s40IuHSxZDsquL6GVkpaMT0yF0Cn
	KaUM4iMKDnNmQ7q7ei6l+HZfLpjvHJXzExx8Uy3fu80gcSU+PgSqp2q0n7W5R6DZ
	33EQdIkgGz/8KH2Nwwwfr0tparSSRrFLQuog26OGg1VEbIVdlA//rsnbDQN8FY91
	sQZjUKCLivPX/lXJ3uPq2dJb7V7NOJDKztJa8b5Y7TmBoHpoiXR5EY+gRIXgbrZb
	0DNIR12GF/PmpHMG+GGJ3SqCpcJXVfWKda5nRj49qzzcbeyxOic5biBonrSUws2r
	21m7sQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9ksgmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 01:56:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38c7de7baf1so5389577a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 18:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784080611; x=1784685411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1NEzi3ll4gdZ52BqXNdruNPx4sABY2QC7pNcTut8oo=;
        b=BUjxWC/4Ltp2jpa0NByvZGZJMWd7hB63TDpLfjk/RiDMYbWFRlrg72JjphxIjdQrPU
         Q6fDP4qK9MzOhwMEywPnvRbS9Pbqxj/wzIMIzTsgYBFBfaKHh6nVWdbKpOVQ09Zu/u/d
         lZb0wBE7VZiQg9MAAScsk+6bVA8ZbnIzO+XAXO0vRTKT86kDsQhCu0r12OVmk2MkbU9e
         BdCn4211AbPGTxu4iscTeQVCyp1uPMfvjIftrXs/XrkuLCRRJwK4VfWptT3PrHnbkaHY
         U5Ih6+NOyXHD0gW4C+vdVQtNI1EB9sqCFRH+xb0vWiFMAfyXKHgqIzqQVBwbrhKTyvhC
         79OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784080611; x=1784685411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1NEzi3ll4gdZ52BqXNdruNPx4sABY2QC7pNcTut8oo=;
        b=YAfx08uEe7mhKcFlzFWzT+0uTz+AtBk6BcWsL05FpES67W7BBgFDpoQScsHlLF7tKy
         2bJtvleAH/KWRzCce3SyRS985o+Ae915c+/V3tPEKvxUGrTTaKhxeitM7ueGX6yl9xgt
         +qviBVhW8MXRNPSm7kGZARhif3/1N/m1FswvGbdB/nfGEy39r3wyDUZNx525t5hK+iFE
         dgGQt2zClliIwuBnF+SnkDJ1RLU0ovyAM8vKZGCkDKENBIu/PaEV2Bdh855ytaAz+5hl
         CrpVtHF68Bls51CQXxPJWiSPbTz05jzhLGSu3vzj58J4CqkHPbolvR8kR20PxerzUVIj
         NI0w==
X-Gm-Message-State: AOJu0YwlLNUwMgDGK4HHfsdI6+hXAi9PB6fgfh68bSbHPiHpUinb13pL
	zK8nV8nFz4zo0vRtGMT3MXibClO8qzsWyqNuFq0DpCugQTPZwLmSqwYXxNoSRRSojLAued4f9n9
	GaJi3gPNLiTUBmf5CNipQ44ntsVR46Or3vSe5dwYHk/JiLSg5MLOw8Z5i8ED8Yg2quoL7
X-Gm-Gg: AfdE7cl39Lj9aB2wBPscWY2cV+N+uASSlX425j9gWrzEJ2W8sx5DnA1OYJRULy7nUmk
	DHy02CebowvrHOY/k1XUzkXa4hED27S51IoEk9wSHy9NF+HMbDB2k7fSsahsyi9Szj9uGgWCQ8/
	8/6xwQLaOpMvGTKgeDZ4E9KRdv63nXQ+0O6Z1bddQmvNK2OMe9Gkluq4/halGa+jvlvqfiHGdbm
	7MJTNSvc9vB/fbb/zA3wfkQ5FoWmJnpiq+NVTHv67BIHhy6KeKzZv4shbxpb5Vfxo6mWKrZADDj
	i4u5T2eUPlKEV+j5ITbM3eK4Xs3iAxUpylNFKAuTS8n9qG/6N7wygOOLDhPtA7P94pj/ZqZjrjF
	W/q107013U4PKpmCB6lYwIsnWXt8XE0M62mAXe0eQTcI/d6cXYso5cWliq8hBUDPAXp7um3b8rM
	lTDnVB
X-Received: by 2002:a17:90b:4a04:b0:387:e0bb:5802 with SMTP id 98e67ed59e1d1-38e2a12332amr946853a91.41.1784080610901;
        Tue, 14 Jul 2026 18:56:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a04:b0:387:e0bb:5802 with SMTP id 98e67ed59e1d1-38e2a12332amr946835a91.41.1784080610432;
        Tue, 14 Jul 2026 18:56:50 -0700 (PDT)
Received: from [10.133.33.197] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a5acsm2245808a91.14.2026.07.14.18.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 18:56:50 -0700 (PDT)
Message-ID: <e3cd4067-8c30-487d-a68b-b4cf625059e5@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:56:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260602-fastrpc-v2-1-67a55e22427b@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260602-fastrpc-v2-1-67a55e22427b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a56e8e3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=XtIZyzpYV7b62ySdhoYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: tZmu9wRRKeuKuoHZMRKvnpUFfPhzGF8S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAxNiBTYWx0ZWRfX13Odhi5MZlF7
 UJu6IRrR1cmQX6pDCMhj9Xb5CQ0ahH1IeBUwHRI1rGOpkkGElIvDlnhiP/LBJ+PKMclReXCnoW5
 gVs/HpW7p/H3/xxt65X4YCEnWr226sg=
X-Proofpoint-GUID: tZmu9wRRKeuKuoHZMRKvnpUFfPhzGF8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAxNiBTYWx0ZWRfX5E5PQ1/LsFRF
 9U4QOZAecQuZhuEBS5jAS+zzKExYu0FgYZVwguyGS3+8KYWZDCnXOsodALQ/W7oo0LfKE7rge81
 Z3hqfayNJU8aEq0k75mu7h2SuXUkoTjIvh4XEikv4IyPIz5XmeTIHaMF2TS3SZ7AubvQzReKZuk
 ea1dgqXqWvp95QQPr4NDYxUEh6IixnujPhsOFOg2xFtfx2xxGr/FTwKm21Geo01U1m9D+0sDc+y
 D0RdIugYYSgYhPzybN08vDRb6FdhXWnZoITOowxLfL/Dj3rpmwcT/Y43YPlzfV+nMzV1orcgwRF
 IDAjV66wLF0YRSU1MavCaLVZg2iGu95yorsEv4A53LISpmAt3NNLPr3sBJMxKi+sHRAgWQ6io6T
 3t0VozV96OMtSm0w6QQXSBhc0ga5D0SKDxlplE70cQuAObzt+s0DAJh1OBfNQqGjKR3DnaetxlK
 L0p8BfHM9LP9ylE8AUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150016
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119129-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,msgid.link:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADC07759FD1



On 6/2/2026 2:51 PM, Yijie Yang wrote:
> Document compatible string for the FastRPC interface on the Qualcomm Maili
> SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
> fallback to Kaanapali.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop Assisted-by tag; no functional change.
> - Link to v1: https://patch.msgid.link/20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 2876fdd7c6e6..afe52296bf1d 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -26,6 +26,7 @@ properties:
>             - enum:
>                 - qcom,glymur-fastrpc
>                 - qcom,hawi-fastrpc
> +              - qcom,maili-fastrpc
>             - const: qcom,kaanapali-fastrpc
>   
>     label:
> 
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260512-fastrpc-9f3b691f8e2d
> 
> Best regards,
> --
> Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
Gentle ping: could you please applying this patch?

-- 
Best Regards,
Yijie


