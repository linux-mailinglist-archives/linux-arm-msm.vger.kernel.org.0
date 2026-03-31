Return-Path: <linux-arm-msm+bounces-101007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Gl7F9eTy2nMJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:28:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F239336710D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAC953072188
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CF23ED13B;
	Tue, 31 Mar 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKgDjEYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="en58lRZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDD03ECBC2
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949034; cv=none; b=uC7CLbk8ct7aMrX7dnvE4KzkzzKsayR/EhndatiBXkzsMmXcRCqjYcG01QuqtkByZ6ZjYEJjcW5Tw1NMoPoIL4v7ZyhrLmc17yAx9IR/o2MKP6pr6pAZlvUJaxOJ1BLghYbAw9gNCR+GRpuIVM3bnUyP92kkf/XPa79a5xOyhVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949034; c=relaxed/simple;
	bh=iz/SJN64s+bT2vQ5zMgr/0dxMe7Mb9gLmpbZUXqJF8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPBXZLuQ6H1wYB8zGEaLSqYht45yg5d4JYL6lGMgvQ/TvnOcdJAeyCKHuwlSOReA0ZfGQVKSM05kkxVotQ73kYjQIh9zN19rwuqRyARaqdivMjQuaf5W2is9nkaNcg4dbSbC8R0Tk7O3/Ku6qUCSTqYFfN9VmMKrYrtUP3aSQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKgDjEYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=en58lRZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V913tx2761385
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=; b=kKgDjEYV2nwPCyRd
	mPLjJcxBkpnZCFfh8t0Atks4IYH3HhFlB6Xpa68fC8f18wPTECZUZ/5sJrM1oX+e
	S35FdXz8mIn1KZXhe3bprKLplCHT1JYQFWTwIdDj3IVWh8bQxg4oQ7PATAabnihk
	cxN+bb1598xpGfNywMOhG+HAKVOgDXtAk4MS79QzIArQD9tcERIOTTa0drbAcm04
	/sRHGVDF5i1PnKnQ13h1eRJbhJjYL1HdqAMAh4omymh2ATeQCuli2tCjXsco46eL
	dZpIwDP7R7tpLBwu8mBfOTVrDgMPKlV9VDsEjR1LTSiznOyDHzRGJHEyP4s+XAOS
	A0sDFA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b9303a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:23:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b250d3699aso62625025ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949032; x=1775553832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=;
        b=en58lRZPq4z6CX6X66L6nm3CcE5dDTvFcJYXOxfFu5o9Lrp0EH70DJzhPItnwiJmvJ
         dpK+YUO3uWhpycmglOqeEWgLlfuxq2cbUQ2WhwK2ATu3Mto1Qu6KTumI22Xe9+j996Pw
         1i6l4JyO4AxUcyv7D0ichCPheePZu/4EnMXwJIESeOpce08/ykcKAvMJJraFYHjG9+aC
         Bf6RMvBwufUJIcKm2r+tow81Dk4jzQy55UC3hIaqARGvsd6vq5kGHaCFj0WBm/BhjWmQ
         TRkB1VCm3HgHjGKA93+FiAIpp4WEPv5N8hRiPneGsGsNyS3rZ7vmZQL9a4Eq/nrKOhQL
         2SdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949032; x=1775553832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=;
        b=nFM4QdxFJO3f8ODO2TCXtvX5u8cBTAJ1ZzuTkAEIgNXvRnqHewwmY1+fIRg6JkGgqS
         1vGZfcxwpups/rz4l3ktnT9hyGBXI/nFwNdpFmIJnsoYfWjwIAf0J1fjhXqPEyCz05Q+
         sSRJQLiCZ9JwRsM3NYV2/6/0uPHVZ1jO9vz20s7z7iyxUtuZVJFUnVu8/n4M69ToE8YS
         YrbxK8opoH4cgHrSTIpSS2l4NtC3mu9YZ3FYdZIciIbUxhpRSBqFjwH6kmHIuz1ZofqN
         iHXPcAy38gCFhTvhbwhxWdLR79wFTAWM8gKAsy5MmzDnS49SBzbfgHlQVfEap0+qgPwh
         v2XA==
X-Forwarded-Encrypted: i=1; AJvYcCX6mEe6O0s39KWayiYcPFgf5bQLSXrDwp3knn8WqnmOcub19SiIurNgM6ymCI6si4ci40qD3+9WG9Cdeyo3@vger.kernel.org
X-Gm-Message-State: AOJu0YwjrUhUkBGyQiVyxKZq869BwFrn/OArqWuVJJsfX+pLGRtcPlZ6
	Te6y3pYIRUHSLLUTlc4BsIPrXCt+bc6VdW1i54XHYIgzphA+PZHkZr1Ord+lvvdsdZ0/Qg3OqvG
	WiqnRHHDC98V2kqOsxLv08sLP/FHaAk59NlzO7K2Xi032rQ6jtszq55a8l2CRDEftMTto
X-Gm-Gg: ATEYQzx4UGhHSbiqazRgtxFTBeP02pe7LSS021RSdnrZ0NfTmI03o39sOCMhnc2517v
	lJeaHWYHFL+RwSYm9R2B3x0iZ7O7LFQzM29XmFo1+hTW9hrMNOC1qDkShh3cePSCl9lUerKs3W3
	dUuj2K0a1KT13lQrgBvA+nPLnpiViSrhCkNuxDsaDf+qeoqJJepCPqNgiCUgQYGnAtBgOeBgHC5
	hYc6lJxLkEha3brGy3DS/AVvx8tVcxuJSL7C9O0k0CMl2OwzoUZDZ7RQjM+noqsIs2sxIKEeLrA
	jMxS8ov3YmXODd9l2yRqGdGCqEwwCMvt8duA0kZ6mcRE7dAjhJXEkkdIb5Mki7IfueCzMHEIssD
	4qN6V0PjBXNYWRsuj+jiC3vY9bfjIIgVTZRUifgF3Bkztam1PHQ==
X-Received: by 2002:a17:903:15c8:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b25491e56emr66423225ad.23.1774949031875;
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
X-Received: by 2002:a17:903:15c8:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b25491e56emr66422905ad.23.1774949031392;
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642913sm103836315ad.10.2026.03.31.02.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
Message-ID: <1b729b69-a7b5-4a88-ac25-091839e40d24@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:53:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OSBTYWx0ZWRfXxDntRPheCZAw
 BCxwnY67iqgm2SswpnDIFHQA4Pyu6NxiWkjv6r4dr2E0ab4cG9P0rw/busmjOragf+h6iUyJIcI
 CJ6CZ6V6OlAcSG6DLyKksiYD2wksrNIGwzPsGX0WAS1wVt0xFZc7rf485KOl0UbXgK92M/1xO5E
 jOuVfypd5GDoOX3u+YZjB9k/B2zaqo6Ml8PA/KqmWMIQ04OtzC7yTXA3fKJlaY3s3FpaQUcOLBH
 PfL2vTMQEZBxUNL5uOVsQGqtjaUSdHwwch9pGuh3T5VszS8wk/kAmrL0tDzCEx0TAXZJDdAlObw
 KwB+hT+cG/H95gGfnqLhcl9fE1FP7NmvFWhCLROgc3el+hAmB/tvo0Ckzza1K4onLfMOg0inzUZ
 Y+SRmD5j7vo8kSI3a54BZ0q4+2Qrr/d9jXcb5I0WXMGhc+F1LeDnOY7NPObb4S55jcKCvj336sT
 JDJmf1JX4/1EtrY+pbg==
X-Proofpoint-ORIG-GUID: Qa-aScTLFDxDHPDznigIqMLm-t-opQ_e
X-Proofpoint-GUID: Qa-aScTLFDxDHPDznigIqMLm-t-opQ_e
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cb92a8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Tg6AtToVi0MBdbWWjBoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101007-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F239336710D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/6/2026 7:18 PM, Luca Weiss wrote:
> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
> 
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


