Return-Path: <linux-arm-msm+bounces-119246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7pokEV6AV2rhTQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:43:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEFB75E4B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:43:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o9kEJEsl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R9droFRe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119246-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119246-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11848302A520
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7911D4657F3;
	Wed, 15 Jul 2026 12:37:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB15544163E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:37:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119078; cv=none; b=Xy7TYZmGYzdViQ8cjTFNwpv2cCfl2jXwJB0RdrtV+eA/7J+3HuhfoG35by4ydTpH7/h2rm+Z8KcgYJrjgC6YeC+w3evsn0/ETdK4iXPvWKm08akLRoud4yYIjUGqoChUhbP5X2CkDT/H7oZanWsbYObQYSRIczWR6pIN9BPpO9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119078; c=relaxed/simple;
	bh=s6rOJUKjsosJ8zG8JnJ8lvfkzgjQFmzpU7EX5Y+jty8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ejSYhvG4djgyzq+1OkYd1Ye15U2I5gfrE6ZAbnOSb5MudstEc74K8+1fQdGaevVHPiCP526OHkfuzcuk+ReK0xe1bBJU77W5J2vrC8dBXmEFALi9ErLF8nlaKiRDG5xzzQHKUyzDtS5KPFlQAYA+nTapYISHASusAASiHal/6xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9kEJEsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9droFRe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcfG93707591
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ke4jI+V5mt+h93c+f0rABKkElWpg5+/EJP/XOU8y9D4=; b=o9kEJEslBAWWEAlR
	gHUFresG05kG6GX0ZjpmXXVRI9SU1QlHP71/O/izpp8hUSvIFgTV2WLoGbEdk6sX
	6aEpcb1o8fV98Sj/ru5DV+7I1aZbm++SNXTevi6wD+e0P5kux7dG9sGJBg2WpXM5
	82SMwLtJqoCt1Nn2D3iaW5defR6/Oit2ifzGcdV5l3lY4LxdeACBgPtD2JljOqvU
	ujMaAyGaRBwtS/4BivxkkHt5JFuIHebUne6DkP1kT9ZfDmDeKSWoRl6BnLpHuow9
	cJ4pjiXtv+NyekaG5Lz9H0ay1IUOode+dHhPkQrnIYPwr5SFob1hgiX6klN+hs8X
	akq7kg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmgpwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:37:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee894b3d8so39219915ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784119075; x=1784723875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ke4jI+V5mt+h93c+f0rABKkElWpg5+/EJP/XOU8y9D4=;
        b=R9droFReBtBU+edgz4OOOgiXPGO/pHTn+QdvleEGTf+2IluH94AskfmbrWaz67zNo2
         0dpyNG0FZ9pVyqG+ugpitNJxKOs43wuJZJ+RSv0e+cTmnKxbdqfzSzzoyQYIVZ9/xK7W
         2yMXVv7VPaxNeVX7lpmgWP0O1Tsis1lPmRTnZXNlOT/FUQL5uY0QOITVqRsOSSuSp8t6
         yEbu6V7iMzrWH5a2EDdhcHhvcRUECjIwLAcUgXODbKxE5hSGs557+mcEPG3IvzNghiBC
         3IUS7GPlHaTYJ1/pli76eJz6v58uZztStBngK+5Oij7j0JFPAMXg8YgPz9D0CYEedVgr
         0W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119075; x=1784723875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ke4jI+V5mt+h93c+f0rABKkElWpg5+/EJP/XOU8y9D4=;
        b=kLO31SrwJUFHGwTFnWBKRLhOOaRyL1uJZRBCsJn68EjFmo+9qlUyENm/kUDPhwQZac
         unMLe8md1jPFKQCBYtm7seM7abHj8t9sgJyBLPwHlLyL9kI5PMXeVsAo53bHk637WFb3
         gx9Z8w2JRWp4B7j0LHk+plxiRamLOFcq7zD4q9Msf5c/O8GHemisJDNY0ZS/z98JvOSx
         SHLxfd0JWCOQ0exJFLDjTCfTPQ8oTTMvtuTmuwLImSiFkZWfweNLYGLn3mAMKPTkBeG2
         nM7PQSpApYEOY8tCZ8PN9cFzoFQPZnItTPvSIy4HMn9+0y7dxTdr6fd6e36PbA3VKcF8
         L1cg==
X-Forwarded-Encrypted: i=1; AHgh+Rop8yV3XPTLff60hlW556p96y2VYhC7Gk/tuDxPM5PnE338E53ZwTSUiEt+oxMdjguTyuudko2gPDzB9j5G@vger.kernel.org
X-Gm-Message-State: AOJu0YwJT5V4XiAEXLRHjwk1XIxCyxJB5ti9aH5D2eMbvoLUy89S20CO
	lV2IwzHMqSeNT5X7+B/dlhERT+ZP4dQrtf93yTEJGzz2B8zxQ9NocWoKi6PMk3x370NXr0bUPAR
	6zwk+Hgj/yuGvBMcQB65V06fdnFYN4QM25+mf9QcJqigAf2Puq/13AYUGtHGeDh8ly7iE
X-Gm-Gg: AfdE7cnS+jVqlC6A2TiQLPJSUvvEofydLIwjN/uqO9TIsBxRDo0N8jLYP3NPAdHPCEw
	35ArwbCF0viu0sFwuXlEJFZ+esXLPU31VP8+IuoVfm5vpmoFcP/oTll7ddLFyQPftIjUSczaJSi
	7tcQNMDiVVFjbBOTg463tpELj2C4tx+2vikH7PE1c+eGrsn70n3+80AZlXJTUZfPxSMN5Y9ojoo
	zxpndJkWMHLNymw4j/ay7IJNJDgAUw8zvRJaT4mFGT7CTEeAUnSaxCjmn4VGE9zELRanNkIEdsH
	OwKUnsJcMS/D9i8xk1q2PzkRH4TOyrzHNhkwggTJEgNtzhcOfjdcff5O2422TkSoGPToi+iFNA0
	PrDJgDuRuhUPL2CZxE4bfRinX8/On+fzB8QlY5lNl
X-Received: by 2002:a17:90b:2cc8:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-38e29fca185mr2454411a91.10.1784119074627;
        Wed, 15 Jul 2026 05:37:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2cc8:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-38e29fca185mr2454388a91.10.1784119074070;
        Wed, 15 Jul 2026 05:37:54 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c10dcsm1404027eec.23.2026.07.15.05.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:37:53 -0700 (PDT)
Message-ID: <ff6f8e27-5489-4d63-afeb-a38881d717d0@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:07:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
 <CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
 <20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
 <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
 <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
 <e83dffd9-e54f-45a8-b997-e84b5beead71@oss.qualcomm.com>
 <b434e198-2778-4dd6-8896-f7f54bc9b8e2@samsung.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <b434e198-2778-4dd6-8896-f7f54bc9b8e2@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyNSBTYWx0ZWRfX3xYShAEDR4Bk
 ituXXRo6/Xjvu7nxvSE/Y1o8UlRUWfhV9dqCAwcL+COUkP14NmCchkS9VEgZvJ5s5xPWYTeXwmn
 uxqeJ1XYTkoMmTAlFq95qHkcrkGlEhU=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a577f23 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hD80L64hAAAA:8 a=R9InvSr7yIoRGizY3ssA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: FaI6XKfuZAukIiejmxx6wFRqos570Akf
X-Proofpoint-GUID: FaI6XKfuZAukIiejmxx6wFRqos570Akf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyNSBTYWx0ZWRfX+IcwzdfC7feq
 bHn/BbNZu27RXs4BBeBXZU0A6FPoePaQ0EPhGycj5hmZHe87cHWRv5OgBx+mRL+Pe2VzrzaPHiU
 WP05FlzyRI29xX4B0yi418X6sUIbm7Ngff4Uu/nlgMf5afvJRw9jGZi9PAtrMAOwSLgcE2BuVZB
 UAMvpKBFITRJq6Tutfj4itKiQEDE3GCzSbk51Kv3Iy9ZwaHIEbJ4bZ77oc6zFIVqxG0QCpCbH+0
 HzOKw3NNoTvcVhcEsso6PqPqKVrUBF9DNi7MAhjwh3MhALL9lM50qI1liZ1AWeGAD/7gA6ORCYR
 LUYEvHD1r2ptBPWy9+Fzxnjc/x8qtY5x2/Lm0bIqMJyuWQ+fkRNnUw9nuQSfRxgHy2cNl+e2VTo
 aJ/7QyhlD03vTMD/bUkSdGjgTZylr1WW7HrC9Q50Too+GlqMLIl1zPhUxSN4J9bLzU9HIZevNNM
 IBGKpNokfpGR9Ea3gnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119246-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:ulf.hansson@oss.qualcomm.com,m:konradybcio@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:robh+dt@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:konrad.dybcio@somainline.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ulf.hansson@linaro.org,m:linux-pm@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,samsung.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBEFB75E4B0
X-Rspamd-Action: no action



On 7/15/2026 11:44 AM, Marek Szyprowski wrote:
> On 14.07.2026 15:29, Maulik Shah (mkshah) wrote:
>> On 7/14/2026 6:34 PM, Ulf Hansson wrote:
>>> On Thu, Jul 9, 2026 at 1:41 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>> [...]
>>
>>> Without detailed HW expertise (still learning about the UnoQ), it
>>> looks to me that the HW may have been modelled upside down.
>>>
>>> The power-domain-cpu-cluster should probably *not* be the consumer of
>>> the mpm, but rather the opposite. This is how qcom,rpmh-rsc works, for
>>> example.
>> Agree, There is a series [1] sent out to fix modeling similar to how rpmh-rsc works.
>>
>> [1] https://lore.kernel.org/lkml/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com/
> Indeed that series fixes the modelling issue, but it doesn't change much
> from the spinlock vs. raw_spinlock perspective. There is still the
> 'invalid wait context' issue there, because mbox API cannot be properly
> called from cpu_pm_notifier (which use raw_notifier internally):

Okay, i see why series [1] did not help for agatti due to fallback on CPU PM notification.

On PREEMPT_RT kernel, GENPD is marked as always RPM always on,
So MPM driver never get the .power_off callback it registered for and hence MPM irqchip won't invoke mbox_() APIs.

from drivers/cpuidle/cpuidle-psci-domain.c,

        /*
         * On a PREEMPT_RT based configuration the domain idle states are
         * supported, but only during system-wide suspend.
         */
            if (IS_ENABLED(CONFIG_PREEMPT_RT))
                        pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;

The series [1] fallbacks to CPU_PM based notification if "power-domains" property is not added.
having a power-domains property would have avoided the BUG for agatti on RT kernel.

Agatti device tree change in the series [2] only removed power-domain-cells# but did not add power-domains = <&cluster_pd>;
with the reason that qrb2210-rb1.dts had deleted "cluster_pd" however qrb2210-arduino-imola.dts still have it.

so below change on top of [1] series would avoid the BUG from mpm_cpu_pm_callback().

--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -281,6 +281,7 @@ mpm: interrupt-controller {
                        interrupt-controller;
                        #interrupt-cells = <2>;
                        interrupt-parent = <&intc>;
+                       power-domains = <&cluster_pd>;
                        qcom,mpm-pin-count = <96>;
                        qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */
                                           <5 296>,  /* Soundwire master_irq */
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index bf6fb12ad990..7dc2cade0a7f 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -246,6 +246,10 @@ &cpu_pd3 {

 /delete-node/ &cluster_pd;

+&mpm {
+       /delete-property/ power-domains;
+};
+

[2] https://lore.kernel.org/linux-arm-msm/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com/T/#m5bbdb535424c38209cc08e6afeae5e3aac9f6cc0

Thanks,
Maulik

> 
> =============================
> [ BUG: Invalid wait context ]
> 7.2.0-rc3-next-20260714+ #16842 Not tainted
> -----------------------------
> swapper/3/0 is trying to lock:
> ffff0000008ac408 (&chan->lock){....}-{3:3}, at: mbox_send_message+0x3c/0x15c
> other info that might help us debug this:
> context-{5:5}
> locks held by swapper/3/0: 1, last CPU#3:
>  #0: ffffd99263a61228 (cpu_pm_notifier.lock){....}-{2:2}, at: cpu_pm_enter+0x28/0x78
> stack backtrace:
> CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Not tainted 7.2.0-rc3-next-20260714+ #16842 PREEMPT
> Hardware name: Arduino UnoQ (DT)
> Call trace:
>  show_stack+0x18/0x24 (C)
>  dump_stack_lvl+0x8c/0xcc
>  dump_stack+0x18/0x24
>  __lock_acquire+0x928/0x1f90
>  lock_acquire+0x2b8/0x3ec
>  _raw_spin_lock_irqsave+0x60/0x88
>  mbox_send_message+0x3c/0x15c
>  handle_rpm_notification+0x58/0x114
>  mpm_cpu_pm_callback+0x9c/0xdc
>  notifier_call_chain+0xa0/0x234
>  raw_notifier_call_chain_robust+0x48/0xa8
>  cpu_pm_enter+0x40/0x78
>  __psci_enter_domain_idle_state.isra.0+0x48/0x470
>  psci_enter_domain_idle_state+0x18/0x24
>  cpuidle_enter_state+0xbc/0x428
>  cpuidle_enter+0x38/0x50
>  do_idle+0x158/0x324
>  cpu_startup_entry+0x38/0x3c
>  secondary_start_kernel+0x138/0x158
>  __secondary_switched+0xc0/0xc4
> 
> Best regards


