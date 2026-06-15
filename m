Return-Path: <linux-arm-msm+bounces-113161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l12TFw/nL2r+IgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 13:50:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 003FE685D31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 13:50:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bVUNxNtz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eIFRlPiN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113161-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113161-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C35F73011C5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50463E4C64;
	Mon, 15 Jun 2026 11:50:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B860212F89
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:50:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524202; cv=none; b=Dxa5GI+75WPV60z9lBvAem7eeSMdrJBL6+rSM9kjVIqVCfRR/dHPbxx0JPFv0X8x/RCClsAHhW1Z1JEKKweXMsD9UcrHDmRTi+QEPfAywMxg64gGuMVkZEuQn//0b03IOZF/6KWa1S0RlC6wJiCaALkTARpRPWG8YdE/54vK2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524202; c=relaxed/simple;
	bh=bEEsZLV7PPSJuZMZ0TUDCqsG8lEzuoLvm6l1FqNwz3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ch5oWnW+LL41epu2G/cV8RfzUS0/Dpwv+Hq+8Np6MRnv1VLMxnDFp4pahywHUWagDJ1HKwMHYig6zHrAwf4hf4fuRka+w/xRdYJoJeBwrHh4XyFqqTXZA5zX9C86mgBkixtTB36yCp+SWl+UxKiaN7vIIyei1QRdLGyOiExgWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVUNxNtz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIFRlPiN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoYBX3986739
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUvYTTUsOLo7RNmxiDZ33LF9UzPszjwFsJuntJrwpcI=; b=bVUNxNtzgRyilwCr
	gVvbautuEcty47KsC7E0VuGc3NH2PSjsqN6KUN0RcOltnEvywtQxHKGyYvTZgIEW
	sDC2gI1bfHZy3+emTe7dfklVzyUxov2DTfmlYbXalZgiUNr+fg1NdY7f5L6Z+6Np
	ECkPiPQTxiSBQLvoF7Y5dHfL37le5jpCIqEYlMv3uuvyXhdhG/YlI7w6SQttGmyw
	ElES+hViBXDmBEwSJhYDl7WUvKGjkd+mi82lsB1iFZm+tZh4BZzYzpe5d/+QXxrv
	cJoJEzC86s5yXmGun9EydrZNb/Ln5DhSKIrzpfgvBmwatYqkKOf8hJGrkXWlt7Oo
	VmmpQQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0gg17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 11:50:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842208d5b0eso2644070b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 04:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781524200; x=1782129000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUvYTTUsOLo7RNmxiDZ33LF9UzPszjwFsJuntJrwpcI=;
        b=eIFRlPiNe9VQx1YWVmylC/5OAPM+bhMxPVh2Iqdkkgw8+i/rsgPP35YBmTIOwDqa5+
         gi1j2M/Hm1bH6YPNuHYhje7ssY1xJTLJO+nQkPMBkTs6L58NEY4yL8cyF1hWxOhJIQSN
         W5ySbLPYTYyhmpNbbQByBhx6xuleJ13Bs7VEaYAG2jpn5vXeSlv6lkO/wL0rPtzrNMYU
         7+8JsadFdgkMdbnaReIBS4DV6cty7EwIOzBMaGPZO9nqJhHFuLlohMea+KtBvj4k28uz
         NCB3LiyqTDUN54JhGYNinRBkh76rZvh0nYtP8RdjeUtOzYmqrJJyfUtXJUCREcUvvsQh
         I/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524200; x=1782129000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUvYTTUsOLo7RNmxiDZ33LF9UzPszjwFsJuntJrwpcI=;
        b=Yh0fO1uJmvEcEKhh0dLJoAKb1jEGm+u+oacMDAvfceo2BCo5f9dhjieLYHPLriCf87
         awajwl5c8XyVYzCPM+CpLZiJm559IHub/HdiLyEmDCjjlqyWAEjw8ZRNh4DX13zDzw2L
         FOuFO0W+qGQOiSgjGXwsmsEJpGS6RxJzIc+9woRsiWFU2IZDmqXFbpeJIpW+hGWg/pSr
         SWnoaSizPAtfzuAes0CkI7lGloQTQFyifd48iWvLB9edVw8kG9K6nbJkVaXsxmq3mKST
         iPhyHbbLOxnm0nM1Zz1PwD+6KaRS9QlG0u5SXDimnuUfBkxYkcscIpY4F+S2gOWCM/cX
         cyrw==
X-Forwarded-Encrypted: i=1; AFNElJ8rQFoNT9GwXe5Faj7XEvFN4I+9ozsuThlc+QZTDGdBaiWMAp+/wl0428oj2HwRwB4iXyowo1sayGm9HB4O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6An64wUdTLLL2aN32CesPFTIra+B/6glAHBmEBDoR9Dv8Dwkp
	An9iJEOHtPMp/89P0OncJg+2mp23D1gV0/kKvsA5cJRur3GwoqyD3ykHjmiD1UJXIStkokH5hMl
	LlG0U982LQDxDP+vLZcBKZXDiF0Y/NCgvKPiYpoCdt6q5oa76gD9ezBudREzBmnipRDOE
X-Gm-Gg: Acq92OEOfV3yJlxr37tRQxKBwjoZRKZj4YAoYxwKa8QQ+vgRb5k6ZXYGPjUDDRo2BP2
	Eo0OpU+eAAEiPTncc5FHCtU8v596ruMuVgo7pB6Zt4lyeTRq6JVZnkDPnv3AbTRldMVrupo5Mlq
	wUAiP0lGOo+9XtVnGYH7r1X6ZNkUItolTEp5eiLQD9TY4X6l/bVO1tEKWVTkCD2fgxGJwnEeWBI
	BaS2/wfaMshDrc0Ba7ZwJF8pGPWwqk0tb5iaQjp/bvdBwPjFNxLHFqYWKeqgJFy7KTUz8AbwePs
	H7yA/NTsZBPBeGOabi+PtpaXbsq0q18uqiiB3Zcx6CP0DvMGW9Ym9ieDRXgwpuaLVdsDAc1lSgD
	LILrBrl0dPDtEeZN21a+jfqyE6TE9K+LXTOPQtUNPy4Ywta2h37rNJyBGTemRUetl6xfNq/MZEu
	U4HXYPd8dKUPY63V9U1MQ2hKqwbUegIPuPiA==
X-Received: by 2002:a05:6a00:2191:b0:842:2f28:4e36 with SMTP id d2e1a72fcca58-8434cd4ae2amr14954090b3a.17.1781524200177;
        Mon, 15 Jun 2026 04:50:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:2191:b0:842:2f28:4e36 with SMTP id d2e1a72fcca58-8434cd4ae2amr14954051b3a.17.1781524199763;
        Mon, 15 Jun 2026 04:49:59 -0700 (PDT)
Received: from [10.79.198.165] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm10309617b3a.33.2026.06.15.04.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:49:59 -0700 (PDT)
Message-ID: <3f97dd62-1446-41c9-b16c-fce36076d345@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:19:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
To: Rob Herring <robh@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-1-e5437c39b7f8@oss.qualcomm.com>
 <20260612222259.GA1960900-robh@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260612222259.GA1960900-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNSBTYWx0ZWRfX/KnjJzPGPhkF
 e9lT7UMrBGxMN0mLt5is0emt8UHD58r9aRT5E2JCJlm5j1H+1t5OS+DjFXwoIZMYW+lyTPvQXHo
 BapXtP4gWUIFqA18kzV0jo3zsuaJMzg=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a2fe6e8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKCGUzlOdHAmEzU82osA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNSBTYWx0ZWRfX3WBw/RirPDMh
 ulgD1iIH8QdDcxtUaqBHLwN1QavOyA9CVMvT7HeJBNu2ZirBdBjIOonOPBtfdCcAXJokZIcorDy
 J9+/7uOya1oZPAKGDeYdl3FM1mMW4XiesF5y7ggB0rWHKfctvlBsHhcTy1LkZO+ZZK1bzg5qSE6
 woYkH3GHwNE8Vd4a1aeIM3t7AEumS+KgX+vKjojT0G9YqkIXtJ0zOnoQ0YFwwpaE5jMZFxuexUD
 UPFLgoUrojaklls8v7XoCS1gCX59JqRnIEZycyZr8J2zFnI3+XTRVrrq27KvhOpjRDzJVQI+EBf
 9+5hoNlDqkGV7zKSIwA0lp3fcEZEjfmwDSfI8QO6aJPbflYtbH4UGKxn0zrmshwaW/edBOO/3l5
 4Tdmaq0XJ28r3jvQgkfId95M7XqTxjb5ylqgF+0uA5PYic4Gg7pIcqh5MeUXGylGqtE9oVtqKhM
 93mEIEem/MK78tlck0Q==
X-Proofpoint-GUID: JZB1X8JhWtdbkSEcoa5AEH5froDdMwQw
X-Proofpoint-ORIG-GUID: JZB1X8JhWtdbkSEcoa5AEH5froDdMwQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-113161-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rdunlap@infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:maccraft123mc@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 003FE685D31



On 6/13/2026 3:52 AM, Rob Herring wrote:
> Looks like this was missed, so I applied it. Please make sure your 
> patches are applied. This should have been applied with the driver or 
> .dts files.
> 
> Rob

Thanks Rob for picking this up.

-- 
Best Regards,
Anvesh


