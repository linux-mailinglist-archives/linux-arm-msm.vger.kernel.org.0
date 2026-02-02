Return-Path: <linux-arm-msm+bounces-91531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCR2Av7JgGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:59:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E12CE8DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26BC4306377B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 15:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178622512F5;
	Mon,  2 Feb 2026 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+CCQgp8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3gmAVDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DE724E4D4
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047492; cv=pass; b=Pmi4J+6ga7/RcYHO+hcM1PPZMhENDWlun57MbrZPrc2h11GXsV3DaxW54EQRYN3UG5JfhJ4CoaqDUWFiYmxsyNKFc/jdTBNDVLVT4FEYWIuKGYTz/3xvyvIBgcP48HJsLKTN6KRMD8qcpq7LtlZqtoh6uNkUf1K60JctUBQZFlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047492; c=relaxed/simple;
	bh=T4gCvEK5pOrZp04yFKhri9JQ2qyg1XBt9hVS+X7ctlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmgGvw67h8LXIt6uC2R4kX75HUm2eRbTQl0G9wEZBe/lMj+hs3Z0CJ8n5TdmuAyBPS6k30FlCg+nBkS7AnkyyEIK5YaDgvvijTs5eczN3zxYtAYHUi4W3rM6rAzwgIXQU0ClK6vP6ewsZieU4+QHf1ExTg1q8EUgwRg9b840aj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+CCQgp8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3gmAVDv; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612AtHV13915984
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 15:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7yDh+JC7Z+2RBqZUUP8nJKY2
	Ywl628bcHYB1vTz3mFc=; b=K+CCQgp8nA15ZURa5/1084YIeiGw3MpFG3485Jyz
	OEBNk8BOLECS0x7hNAtxhic3vtEv75iaR/KvhrMCkrYAK/GxLQ9gbCMmC6XROraX
	vFuuBIW4wO2ny5k/p4ZJsnT9fIwfIwEYYHaqkVwjcC0fR4fJyN7f1iaFIjqnbdxC
	a7u35IRUu0kaAIreKB/5vf6DLyb9bE2J6clBHYkPhVMd9hsdGlUq2uAS1dnhA6Q5
	qifjSpkvSqLg2C61Ir35GSXM3dBzTdAPQx+y9wmvQ3dzeMTV3ELuthvFpiSVpQC6
	qkqyGHce17ZBpqEzWgWZ29zoYHQ6FAUvPSQKyBhKM1i64Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmgv6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 15:51:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c5269fcecdeso2747766a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770047488; cv=none;
        d=google.com; s=arc-20240605;
        b=fS10vIajjlrbgg1rh4vwxjQ3auMFZLy4qYs6KGgb8uWTa601bv5aicRX2PDZcURPcd
         Tq5eUSuNq0wYSLa7j6nPAyZ+0EFg7aYbQamIUapdrPYdFKb9wnhqLpX7/NAg+WAduawo
         JtRtAEDYOSepf9Jd9gmppf7rvDE4J4mRIu1cxaNk66pRf325x6Smi87aBXlN3FYaRGOy
         8ymIi15E4Vh9rT9jzBu/eZ3Ki4fSrrpO2zlW821SboQudwXjGfSvszeuVZT9D9lXkJZT
         1HCrq2W+gZSRl+VDsGgyYGo2QSCdDCYsks+Qhou6Fjnn7DAjjI0SJ7/z7JauzeVk/Oif
         koyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7yDh+JC7Z+2RBqZUUP8nJKY2Ywl628bcHYB1vTz3mFc=;
        fh=2a+WNX5Hz3wi1F0pYzZ4Nf/8GNmll7JRsiu88VTllKU=;
        b=JPZbhKlBSmqafrAkpPw39ocR2Acjnwa+fn8iFuZ8Jt6OpWvxSXgNh84wXmKh3JFNa8
         aFqpifNLPX7qUsGkE/MO/LnI8QjUAJggDEivoF4jQ6eT0imJlkX260BWuFdnJGvnHk9d
         kGTHlfgTgfqo0onQSg8OhuoBot6N0Fu+T2vK7RjkQIi19yA7IXoRT4WMisp65FxWzoMv
         o8LT7/Ci/pJPiHMx3Izq+XsYE88PNpxdqyksVOES5XiXDIvxkgrznj9ICrN9SKEFoQ8y
         K6jgaZzjSb0fGMhHA26hxRlqYgS2y5bIawO72NfuuQMEK3g+sOf/svRNO4FVu77Ke3OA
         TRXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770047488; x=1770652288; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7yDh+JC7Z+2RBqZUUP8nJKY2Ywl628bcHYB1vTz3mFc=;
        b=P3gmAVDv4mm6U2080KcMNIt9HkiTYhxjF3rAWfCl0Bva5dn6SZD/1WRxTqm3DZWp7D
         xoZ70AnLX7TUVV7RiHB47i8MWrp0EG3MbNhwd2MtYOBO4zKW/5kH4Hsw4Oz4dHOR2B/s
         zgDLVdI1fsqWpa/SGsgTBwnHNHPsO0UBoZjJLDR7Ug+/PzLFTTz5vsMMVkv4tLFknTKS
         XAqV/wL+en1gYrRGmBznxJB760Wln4/ZiLgqz327tTxQBeVJShmvauaYC9DtnkdHfbiX
         BkIUSIZhexy7FXW12bpBDfcH7C5Td0dK5crGWtz2MdYM1PpJfCKrtaJ3Rbf5ASdcj0pN
         Npfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770047488; x=1770652288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yDh+JC7Z+2RBqZUUP8nJKY2Ywl628bcHYB1vTz3mFc=;
        b=k8LNbUt/KbS8JpV+IYGrP1KBE/uJqm6R+X3UPBCWMf1YrFmfJBp5hU/PvH1wwDCGRA
         4yShM6iJSb5jP8ADN40GAPZZxwl0AEKQQYzwYHioCn9xWa93pvodOQipNGYzn+tFu7Gi
         YjuQCEI0IpHc9KMB6joGcLYugufYAa8pve6xmjCvbud4lEJ5rOFczDuZHv2EDORlEZaO
         B3QRFk/saILzXyyyDJHI2fOguh9WB4JeEVIszpOpPIXIQUwJMPloNEN99uL4kuS4F4c7
         pg1bEfpjZqNYNHrL1+QHj1AoW4D2MNXtYOtvMpWwqqZCWfjjR5fusVyeUYQ7I21AmlWw
         Kf8w==
X-Forwarded-Encrypted: i=1; AJvYcCV+m11nP/kEL2I/vRMKpy7g2V5OTiW4tzd594M7L1eESYFi/p3VH1xE0bpMrr9ipXMya3sGRst74ETl1CTi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy7MbTeZ7gMkIQGh2UQsnCjs+asvABssHdeTOPaMkhXjaJxqXd
	gDDNOpCSljuARpaSFFiYXizSgZVV+niOYQUo4KoWqOObeCZTh/qrJBrkFYjyPFcDir5ezZ0PGd+
	zZRv9rro7oeNcbw2ekM6ZSPSYhNtfwFZbaGzTEAiMJz1sCKKrAtr0nIlC0Z/DD7vwF0W09u8tCw
	/7tFITqP8dx+AeFvvfhQ6GLpwEyCF0efqgKUM9g7zFbqg=
X-Gm-Gg: AZuq6aInjBKIrVrVaqGIsZ3DnOTH2nmtbH/gO+JV72vXfwWmfz2bPIG7+NtH+nrgIjU
	09RHybF9rgtlZaE2R5fkBl+3QSmXfE23A2is/VWwEohqHt+nVTaL4f/cDlhhch18E09qQO4vKMQ
	inK7R4fllxhCltp/2e2Znm2rjjfUCR6eZXBg0IwsYbE3wTA+1BuXgGMi93uE9nVAqMWN09QWzkr
	uIqd95Ujr05/LpsPZRoPDUb3tc=
X-Received: by 2002:a17:90a:e708:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-3543b2e008emr10839056a91.3.1770047488067;
        Mon, 02 Feb 2026 07:51:28 -0800 (PST)
X-Received: by 2002:a17:90a:e708:b0:341:6164:c27d with SMTP id
 98e67ed59e1d1-3543b2e008emr10839011a91.3.1770047487529; Mon, 02 Feb 2026
 07:51:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
In-Reply-To: <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 17:51:16 +0200
X-Gm-Features: AZwV_Qi2e1xUlq06PRab_j4QBJgokhNft9ud38gaUZCSMyia8nonVRqW7NIgfHI
Message-ID: <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain handling
 on SM8250
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6980c801 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=2dp1CtdQIJBwMkjZU4MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zz-K4VyTyNdaiYAx0iD21nZVekhwyUp5
X-Proofpoint-ORIG-GUID: zz-K4VyTyNdaiYAx0iD21nZVekhwyUp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyNSBTYWx0ZWRfX80pM4cfOveZh
 sRVCrEqxuo/yXZKa/TQK3BIGm92XENz+QUgO+df6+icB5vkSaEc/zcJmW7XRQL4kIJIk3Fya6mv
 GZFOko4excKAtc9xCrCfFUx+Xw+WhvBNkfrfgm7gqbwHnnbrafrBWMm+mOSEUYk1NJQ9qD8lkwg
 xdFGJux71Wnckk3CceucIZyOOWSSibr4/6mcDtm4x8itKw2M5My7jLwwicmXySHp5eRCtMaGCrv
 DYhJ+4wdBvGQhaydjWFbXHDa74ewTcWNAA9k9DsY0o3OrGY8A6ZWd0fVfdPlStxPwwCGV1EXea6
 MW/YYtEKyLEq8KSvZ4YLYdWjcvIHpGVNYf5A4AnOw6RNZtvRtkOJddv6+Y8vmOghe9eQ1/EHcrt
 afbjdlXSzqKWtxwvXpV46M9hdWFWSEH0yEoqs25eLEH3DkhHrDyCzk2B3dqvIxNeJ3r40cL9WYM
 5NDSEKC6UyTgNA0fGwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91531-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 84E12CE8DB
X-Rspamd-Action: no action

On Mon, 2 Feb 2026 at 16:46, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > As pointed out by Konrad during the review of SM8350 / SC8280XP
> > patchset, Iris aka Venus description has several flows. It doesn't scale
> > MMCX, the frequencies in the OPP table are wrong, etc.
> >
> > Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> > stopping it from being overclocked).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Do you want me to pick up patch2 for v7.0 - or what do you suggest at
> this point?

I'd prefer it if it is picked through the immutable tag/branch.

>
> Kind regards
> Uffe
>
>
> > ---
> > Changes in v2:
> > - Fixed example in the new sm8250-videocc schema
> > - Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com
> >
> > ---
> > Dmitry Baryshkov (8):
> >       dt-bindings: clock: qcom,sm8250-videocc: account for the MX domain
> >       pmdomain: de-constify fields struct dev_pm_domain_attach_data
> >       media: dt-bindings: qcom,sm8250-venus: sort out power domains
> >       media: iris: scale MMCX power domain on SM8250
> >       media: venus: scale MMCX power domain on SM8250
> >       arm64: dts: qcom: sm8250: add MX power domain to the video CC
> >       arm64: dts: qcom: sort out Iris power domains
> >       arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table
> >
> >  .../bindings/clock/qcom,sm8250-videocc.yaml        | 85 ++++++++++++++++++++++
> >  .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 -----
> >  .../bindings/media/qcom,sm8250-venus.yaml          | 10 +--
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 42 +++++++----
> >  .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
> >  drivers/media/platform/qcom/iris/iris_probe.c      |  7 ++
> >  drivers/media/platform/qcom/venus/core.c           |  7 +-
> >  drivers/media/platform/qcom/venus/core.h           |  1 +
> >  drivers/media/platform/qcom/venus/pm_helpers.c     |  8 +-
> >  include/linux/pm_domain.h                          |  4 +-
> >  10 files changed, 140 insertions(+), 46 deletions(-)
> > ---
> > base-commit: 44ef70faf71468e0ae4bdb782a6d43f0614b8ffa
> > change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >



-- 
With best wishes
Dmitry

