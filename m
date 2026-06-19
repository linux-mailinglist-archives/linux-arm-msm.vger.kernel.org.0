Return-Path: <linux-arm-msm+bounces-113836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EVGaIbM2NWr0owYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:31:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F616A5CA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:31:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Pz/g6FMa";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WZlcALdk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113836-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113836-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94CD130156E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874AD380FD6;
	Fri, 19 Jun 2026 12:31:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A69F3655EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:31:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872301; cv=none; b=WQuMZ7Vf1AwhIQhR7xrF6tKcoHM9SJ4eHBzDYUtfNqrefR7/A3vTU2f+IDpfz5h1u5/pbLEL9DrsGNW4KqzTz1DbrzC/ES9+vO3RIfdW4p8bIti4jIvgxsji3UHgcMelB5CTBHp17kjhBUNBnGcEIzE30ZvcHnVqgNyT3G7ftTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872301; c=relaxed/simple;
	bh=L6z4k3QijNHTGXXT1fty9BWxZPIxToZssOMwBPutHeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihBH8/OyYZ+TIOci7QcKNUbKQyD3SXJ51jnVrQsRC2/zSco2RJTcVNUsceky5PD+89qghvgnHH9sQaL8KtyyZyjYc4lntSo/DO00jowVUQTdVh1lntP6qbrxfFyPIhDOo+rjBmRBscsjM1DroDaMs6Y4au1XoLczYwjgWiLV9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pz/g6FMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZlcALdk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JCA2In624980
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFcrLoU+u+djEDf0Ql04tP5oMolAVqMa7ZABzijFO+s=; b=Pz/g6FMaYoQlQk8+
	3WjzmjdxjC4j44ms7bfVLBwq0rZdzNZoXBxTKXWdnGgXegvrabKGeUMCL5gh82IS
	mOBo6SMiETuCVsq2tWK0CgwFkTRXj9REs7SkW13ibhHozaFEPLUHLQ9W4iUComHM
	rwHUK+D7z5BBZvE2Ew4dk5h9E+6DbDEuU5eOCCWHVPIoTbUqFs78i8Qhd7ImUuFz
	wEvJfUfSXjzJpKntcC//Z4nOzaYZW7T9t7lhTNQWluFTd03VGI2ppEPfzxCc32b3
	BuSJuDbDUrDn4W5QbGWZPLorztFFBKLUydOf4M/NLcx7+OV4UGwIfA18xikEcBVa
	3TSNhg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5hp81yk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:31:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso2561981a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781872298; x=1782477098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFcrLoU+u+djEDf0Ql04tP5oMolAVqMa7ZABzijFO+s=;
        b=WZlcALdk0uMX4UtSKid6qww1GssGiwBONzf6Z23sxsNwn4Bx3C4BP8HNiU9XKaij6T
         IrKynLmRbAGXz0UdPEyPvqY2YQN2HWeKXBDt1SNjI4yv6Y0Ef25fBNTzD6i/A5+68hXA
         GZcxggzzDogJqrrdESFNpqpxXVwtxnJHVrNwRdFfl4XMNUTLwef0IDSTXjVHk5FhWYVm
         3mUnhd9G6k2rCX03BgDeUa6bOntg1WBrvPa4LHuNwq4TeOTxXQLq3bhEgmr3pFl4lrzH
         MvK0d1VrA4J+FKdqWCIAvPaGsybArJ71C7VU0x7icDJ8YQlW5gSTkFsa7CB4p6w8+tE9
         9OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872298; x=1782477098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFcrLoU+u+djEDf0Ql04tP5oMolAVqMa7ZABzijFO+s=;
        b=Gu+K5bvaaiPmbZw8twOMaD+MTFNkVPqN10T8T1mBy4MGiE9XuoNalTDvzN9Aiebx9G
         JBYKGiycjdIG3ug0kNDU2kdodQS0CiagXvjS6vxZ0l3i0zMq1VT5aq+TdkP0WcluosoA
         Yri+11NGSZMc+eDkv3XgJtUPtaKT0pmJSadfszLSjT05MPhEr3/1/fDpCQT/uartFSxq
         vgIz2ZTKEbJuUy5LyK4AyWXbEZDD5TwL9TN+Q1B3urGxtKt+BHNPmjlobVgusO8S3LEQ
         GbqdfAC4pNH5pyZZBhSlcCCtalcJYiM0mnIeSLg5sCE8ZpnDo0Kr7pBgpGJMLog0P6ch
         wT2w==
X-Forwarded-Encrypted: i=1; AFNElJ+TEeOhxBp57CeiZVIR3EFOvzpb9Dre99EN2z39xSZaaGr0gHKiD/vCmMlMUIAkvOIwfVqwjwD8EoMb5vke@vger.kernel.org
X-Gm-Message-State: AOJu0YxBnPK31SCscmB6bE3++w/x5ij7eMIrLpczwZ+Kc3WVmzv/fLkc
	tRXES88KeDYdU3i1i1Jw1n3Su02HcUe3HYXL+vPNRaH52t5bb93tGEniKokHNom2PCBq9xKiriN
	ohFSubZPpmhRS3wjHEJgq9+xRhg6ULMuf6qI7IbnAV1IsQKehOSgJDtWa0GMZvr+wLuo9
X-Gm-Gg: AfdE7cmj6rPfCfhWZ2bQ1yOyy4Q89lCOkygkqMESVIIqKEs59QK89Txy55asypb4Pgy
	J7ooLUoHLj3I6YjQf2MMtslCcJiMLVN8dlBLr4d1TandK7Uj5Ke2j1Usx1C+z3N30qg6pF0vf2h
	/2WAIqnDCurQPmJGumUV9PEdbVCtp/njZ3stCNSqpM5UfV/l85og7RIJ06BC+nEQ4tM6GteXW3q
	6Ef0dsEcHNC0R+SajE6PxZ6ggyLnR1XxqiDBDkKEerneqf/ROXX76KUHu5zRC4Q0EWKwXWtM01g
	HTECPs2YDcY9krIpSIPFwLhkjX9L4sZtHH72mw0AxvYx7NV+g/u1NsMX3mE6t5Neh829udM9S37
	34DCewdG5+shcTwP9aLV/N1+bGbf9IYpindFtv7zZV5B0rK92nip65t8AtzTQ9ExG06F2gSblUX
	vm6bMiJGLh2EI/M+GKBIcUQbv7letwaOLwRA==
X-Received: by 2002:a17:90b:17c5:b0:369:de03:29c8 with SMTP id 98e67ed59e1d1-37d1ea3ad49mr2456622a91.23.1781872298050;
        Fri, 19 Jun 2026 05:31:38 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:369:de03:29c8 with SMTP id 98e67ed59e1d1-37d1ea3ad49mr2456595a91.23.1781872297615;
        Fri, 19 Jun 2026 05:31:37 -0700 (PDT)
Received: from [10.50.22.170] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a8525f818sm2378163a12.9.2026.06.19.05.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:31:36 -0700 (PDT)
Message-ID: <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 18:01:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sxOrjE0D7dEcXdqLQSrfLA_OQdi3kY1P
X-Authority-Analysis: v=2.4 cv=aOHAb79m c=1 sm=1 tr=0 ts=6a3536ab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=_HCkHYxhaP3GdHjqj7kA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: sxOrjE0D7dEcXdqLQSrfLA_OQdi3kY1P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExNyBTYWx0ZWRfX+ENmVvy5ifNh
 Bc5Yua0cfF3w022yoRk8wn+WmBXxjsZY2Tl7ZXjMAay9Vl6blQHqolNaR1p1gIG/LI7ux/44TFQ
 FyaSgYFXOGxaxagDdUTcavcXGUYv7PI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExNyBTYWx0ZWRfX0OmAfUuOT2rR
 vS5IHHznCFCdGOiHTavJyy4oBB0qtErtGdIXF/LU/+tw0+lV8PcHS25uw+dIevBmz0yToMGdBDv
 NCviIQl9OwvAtc3H/VW0XC21IPhqcb1MkDWahWhD5plshKVu922bie8p5lYXHdvuRNJo8a01mRT
 5YOQ0I0rchGoKTCqfiK5i4DsYIx6epGYfvySOx2Zz/3VD5GGzRnm/iKONXSYheEAAdgVL7hvHoY
 rNrVO1GLj+ZJlfYNYNTu8nQ8l5b0y6a7QcS8Geix2/pnSRuxaB8wngRk2+oSmuPLUxuqQ9QEaUv
 FiZHY+1TZGwHZpFBvG0nxwAeNoBvjOJVuDj1U1oJsUEmjJlOjqlzAVvbB24yxYSnjHeKfVLaNZn
 9/9gySxSPIgd2KKQ9apNDaS0d+L38Db0GSuT0DnfbPWel6xaWiTImB2WDdl7WdlopSp+pVHluM1
 W0q/sMjwKK9ZbC0GeYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113836-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:amir.vajid@oss.qualcomm.com,m:ramakrishna.gottimukkula@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2F616A5CA2



On 16-Jun-26 1:57 PM, Sudeep Holla wrote:
> On Wed, Jun 10, 2026 at 02:21:27PM +0530, Pragnesh Papaniya wrote:
>> The QCOM SCMI vendor protocol provides a generic way of exposing a number of
>> Qualcomm SoC specific features (like memory bus scaling) through a mixture of
>> pre-determined algorithm strings and param_id pairs hosted on the SCMI
>> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
>> mechanism to control the various caches and RAM is hosted on the CPU Control
>> Processor (CPUCP) and the method to tweak and start the governor is exposed
>> through the QCOM SCMI Generic Extension Protocol.
>>
>> This series introduces the devfreq SCMI client driver that uses the MEMLAT
>> algorithm string hosted on the QCOM SCMI Generic Extension Protocol to detect
>> memory latency workloads and control frequency/level of the various memory
>> buses (DDR/LLCC/DDR_QOS). DDR/LLCC/DDR_QOS are modelled as devfreq devices
>> using the remote devfreq governor. This provides basic insight into device
>> operation via trans_stat and lets userspace further tweak the parameters of
>> the remote governor.
>>
>> trans_stat data for DDR/LLCC/DDR_QOS is now available with this series:
>>
>>      From  :   To
>>    315000000 479000000 545000000 725000000 840000000  959000000 1090000000 1211000000   time(ms)
>>    315000000:         0         3         6         6         6         7         0        30    143956
>>    479000000:         2         0         7         1         1         1         0         3       356
>>    545000000:         7         6         0         5         5         0         0        10      1200
>>    725000000:         3         0         5         0         6         1         0         6      2172
>>    840000000:         8         2         3         2         0         4         0        12      1188
>>    959000000:         3         0         1         2         2         0         0        13       272
>>   1090000000:         0         0         0         0         0         0         0         0         0
>>   1211000000:        35         4        11         5        11         8         0         0     21684
>> Total transition : 253
>>
>> QCOM SCMI Generic Vendor protocol background:
>> A lot of the vendor protocol numbers used internally were for
>> debug/internal development purposes that were either highly SoC-specific
>> or had to be disabled because some features were fused out during
>> production. This led to a large number of vendor protocol numbers being
>> quickly consumed and never released. Using a single generic vendor
>> protocol with functionality abstracted behind algorithm strings gives us
>> the flexibility of letting such functionality exist during initial
>> development/debugging while still being able to expose mature features
>> (like MEMLAT) once they have stabilised. The param_ids are expected to
>> act as ABI for algorithm strings like MEMLAT.
>>
> 
> Not sure if it was discussed in the previous versions or not, it would be
> good if you can capture why some of bus scaling doesn't work with the existing
> SCMI performance protocol and the monitors don't fit the MPAM mode.
> 
> Please capture them in 1/9 as a motivation for this vendor protocol. It will
> then help to understand it better as I am still struggling to. Sorry for that.

Thanks for the input!

SCMI perf protocol exports perf domains to kernel where kernel can set
the frequency but here the scaling governor runs on the SCP while kernel
just observes frequency changes made by remote governor. While MPAM is
not enabled/supported on all hardware (Hamoa). Here's the pseudo-code
for remote governor on CPUCP to help you understand more:

Barebone Memlat Pseudocode:
Every sample window, get snapshot of latest AMU counters from each CPU and scale all the memory according to the map_table:

For each CPU
    // Calculate IPM ( Instruction retired / cache miss count (L2 cache refills for LLCC voting and CPU RD miss counter for DDR))
    If (IPM < IPM_CEIL)
        Use CPU cycle counter to determine CPU frequency in the past N milliseconds

LLCC_freq = lookup_llcc_freq(cpu_freq_max)
DDR_freq = lookup_ddr_freq(cpu_freq_max)	
DDR_QOS_freq = lookup_ddr_qos_freq(cpu_freq_max)

// Scale all memories
Scale_freq(Memory); // LLCC/DDR/DDR_QOS

> 

