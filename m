Return-Path: <linux-arm-msm+bounces-112381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5300B9ssKWryRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:22:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C20667C76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:22:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aryBfVqX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bhtDWvEN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112381-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112381-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 463DC327397A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3B7348C42;
	Wed, 10 Jun 2026 09:04:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE222F4A0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:04:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082250; cv=none; b=Pfsr/1dPwrHBCan2j+fuIZqyt/j3CEOsIbKz5VKsjtckrkmpmiJOo3bOWisvz0If7B9qcfPC76aD20SNlDBqlmnXzdVCSILyuwvamd4t6SommNHhfqUo0Ec8rPTrlzZHgL44hg9ETem2rJo0+blMyo/Y/uiU3aIfzLgRpDjAp0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082250; c=relaxed/simple;
	bh=mzJQrFxHSL3eTESAWz5T1yGZ+J03lJUWQCHcPKGgN20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cff49R4Yxiso//zSIbbsSZvj4sf0apSwVg9nygiiLr8XAqj37osWfQlg2UaaWUJtlIVGA+brxt5XKwDl6aoaqSb2eYodHpbj72HBfWcPS7D2JDuLr4dpo0q2tb0FfRqjw3knfrnHjySasgVykUrZOvzTTPpQH01g+I+s/9uQYuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aryBfVqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhtDWvEN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hmLE469521
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M5PkR6CHd3r+6amgLa4HebPTz48NfUJqUcMMEOkBLAc=; b=aryBfVqXsEgh9zsM
	/v4aLu414nbl8lmj6H6Vz18SNHc/eYDVX/Rmy09lNyJvFrzlB3jwp3FHsyCGADmI
	gqLuwl4MPjk61kV82VzJYqVaH+Ef3nXOuRusYgHnTHsP16Hs5tVE6BQLbAcHSA0i
	WP11zFo79aZWgJPJdVINtqrr8jq11JHd9r6NBk0mvx9GHeiis7nMHFbfuETWaEUU
	aDbCqfUetpYThMJ7wLpeGME6WN7ZfCOsUWxCkKA4SOzvUiGzZEojXcEliO3ncWhe
	fZ6ARqky3U1lPC9Zc2i6fa/EmfpljG8lxBjiP4S5FiMVE98axePmjy8Ga5aoJ6vp
	VemSsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvhcxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:04:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915827fb1a3so128021185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082248; x=1781687048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5PkR6CHd3r+6amgLa4HebPTz48NfUJqUcMMEOkBLAc=;
        b=bhtDWvENtERo7Qp+8qPr8AqUoc8krWiwrh/is1a2y4LG8Q9rjykeU+DksNTL8ZlL8c
         APKAIrYecxyM7arMYQdI2+TZuWzJFQtcpfoicrrVYzptJx3FIc93bbHWryaegaTY25gF
         Y7zeRx42NBZfQzI0+T4K5buPOtgnq4TpqwSQrgy5tpt3QMsYJVMvF+E9R3CsGNFltMq1
         VP9q1BX1piRbxzhjTQqWxYmJaelwZx1QzKeI4x34xfBupSpqOb5RnLItPg7yRc9qnLNT
         Yl1/rRLfqOGlbpOgkPFeUx3VKeQFkQsnmF0fowBEGLEkvhBofxCp35cESdSE5vqlXU52
         5mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082248; x=1781687048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5PkR6CHd3r+6amgLa4HebPTz48NfUJqUcMMEOkBLAc=;
        b=s0iPnl2bew4OUyQObnJvdkMNJEEMm/H7vx3QL5pLTEoKemHUH7gBv0bACSwFmel3Jy
         zvajKMaXGPjkXEsE3VC0kf/vpUNxEhDiEPIjUMkbhixQdLfx1emkE4BVwCtY8fO6zXgH
         W+wu+EOenM6ZiImqEaJCwzKIv4xZnRR6yg49NCxMVXikgSCvJxs0DiEPlIpSWLrdrqut
         4mvQbBeSeBxUIQvSNVpCPLaNUwYCuYxce+/ChPEXfE63RMeEAGvYImP/USUfgt6w1UeV
         Gs8kA/lPUSATmDent5ie8nXbCFv0RUIniAL/zXI/w4LQ2/y2ultvOhETK7C29fYMFdUk
         UU9Q==
X-Gm-Message-State: AOJu0YybpD6qvDln5FcMV+VL9PiGlxrbkNHkZIi4KGb1OLlJCP6glpvm
	Sf7WqcmWxBQP74SMTUwTZD+WbHv3B0Orbs+0lV4Rw5dQw2TMr9DHnVhXQP1GekdA25bp5bqUGm+
	Do+8e4ttuI82+48vwBObotTg7y0qDQKofqQKYTsg+z1lXLG5ris2p84LNB78nIJ/gtn2D
X-Gm-Gg: Acq92OGHBuxa6cxEdZT7Wm6bz3KcqYV0riVHldem8BO2zcL77RYtT/j9JOsM7Fh0D4h
	xTHfBdZIpg7sUVNN5EshapJU0JThu+RYHqggclBZoCnqsyWr6jsj+QtBMD8sJ+xtuswDjleJOga
	6W+Tonv977CMkIFSiWSqWtKQSzUL2zgU0ohBYp0E+K2fcUtMsXHSjzGJLY67BCgoWN5NkpHQRUD
	UN+Jbtb07wzANN+ZlrA3rK4BVTVu7cyFo9OWslAjNWWztFaqXJkDMcCUTbzMdKjPxZpMQj8anki
	rsyqnT2HvT+ah2eauuaRwEoyxnBIgjL4U8SCdH/3qoNGab6PpqZuJ5eNMjyqCFHGXCJJDq9odwO
	Mgv4e4o/wIpFMTmFjbX9S5YmLFLyGO/ccYNxTKtp1/4Gn1jQ6Jga2bZWK
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr2200094385a.8.1781082248143;
        Wed, 10 Jun 2026 02:04:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr2200091085a.8.1781082247666;
        Wed, 10 Jun 2026 02:04:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd14sm1165456766b.11.2026.06.10.02.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:04:06 -0700 (PDT)
Message-ID: <67ff0f25-b2bf-4880-9559-e37ef4e2c6bb@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:04:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] clk: qcom: Make important ARM64 drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-3-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-3-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0eEYx9hpphp8hmA5FLeti75c2zkqJsVR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX6rNdhZTfZwh1
 qZ5RHvbZiKKTGno3ZMSuhHuxKrkOPYGx7NBU+oAdoBoZT1lOyhh9Vmqa6wqiqlDdaUwfBMPiMdr
 2CT6i/ml72LrbYjNzDUzPeuYrJl3LITV1ZqPVfLYk/mBcGzKTDbrhImsbZW2U9AhPQI9p1VTXSn
 J+2SpQi0jpQjDfIkRAMHXVRLyQGO4qaP13flrDMcPcspOodo2ZBVZL1oErx3cRMWyhLInUZ/hn3
 2ynf9dAgIs/ebGtFY+eqWWlOIzyiAL7zfqdt7jI0VnaPV5JzwHF7ouDsyoDArGztn2x7YdAFEo1
 aFiqTJsHX4fdHeMryKoJkNWxX0msvUokfUCta1s2a2Z7TzuF2mxTtNvqB/UD+UeR8KCNqPQXAdM
 ADzNsz+oFkO6y/Lqg27Y+9v2evXQL6cDU/y0qj9BRmV/QF6f4t9/+Z059qb1w+mtr3mdFUwzcTz
 AFuT/UTFSNBiuE8NUZA==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a292889 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YbJbqLu5s_8SUIbSLSYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0eEYx9hpphp8hmA5FLeti75c2zkqJsVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112381-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66C20667C76

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Switch all Qualcomm clock controller drivers which are chosen in
> defconfig to respective default 'yes' or 'module'.
> 
> This has no impact on ARM64 defconfig include/generated/autoconf.h,
> however changes few drivers for ARM 32-bit:
> 
> 1. multi_v7_defconfig: Enable QCOM_CLK_RPMH as module, because SDX55
>    (ARM 32-bit) uses it.

FWIW RPMHCC is a provider to GCC

I think TCSR_CC is also a good candidate for =y, as on platforms that
have it, it's necessary for USB/PCIe/UFS

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

