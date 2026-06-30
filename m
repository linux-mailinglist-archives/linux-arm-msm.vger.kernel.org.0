Return-Path: <linux-arm-msm+bounces-115361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i8y6OZ2aQ2qIdAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:29:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2826E2DBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:29:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ln05Bt+j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ASID6Q1q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115361-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115361-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E196312B43C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D2C3F0777;
	Tue, 30 Jun 2026 10:23:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B453ED105
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:23:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815024; cv=none; b=rOcW7R5J8VjtcBK6IwzBP20x0O8woInA6AsXCAeIsaCZKVkvUnVN0RE7LY4JWgraTWcKE80n9mXx7uIqU/iP5s/1IccQtX0Vv281zcdjENvlPjJWoOU2WYCSxmMbXlADNVCoEHOa8gTQzD4OoW7K2nLgKu1BFTq3tD3SIpP9xRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815024; c=relaxed/simple;
	bh=LRkXfXdmo8CWYkWy2OtyR6Psk+d9GjTH5Ank4/i27FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECmF9WQkSXZSGAh0PcE5drxoNNKh/ky4WMDm3LQmsyYXWLBczli+UrnfUvzBrxOafyZv51adfqYvkUuMfwcV4vBlp6Q/M051TITcvENCspoeXUwtD3cGA+M79oLagABSmofPnPj/eXkOReZytUXHIqiMx0ouapKTT9SDNnc6IQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ln05Bt+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASID6Q1q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n0og1613515
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjf98r/hrw4t3YgSzoJNbJCdT3mRw4IABG8RvUCuBYI=; b=Ln05Bt+j1MfPwQca
	e2McPsyRUsHf+OEeM1Wjbcg4Xs/cgp8Fikn/1wFR51kxoBmBOktvbIbvsdOBjgFf
	2wwe4YGZ9u6rlgEiUgSlJmZTX2N9z7hbS3q1KetCJyQlhuRydVK7dBlThceaFakI
	XXWAW/uCJIuMNGfBkVWTUYjg4JvIozjse4EDj1R/kJg9sXTbVPLRD7d4qi1+dUyT
	q+soN7PDfpQDXeBc1kKqo7CBqO9wFXhD95eB4P4ByHbD5drPmpEwtXbHkzSexXcR
	/z7l2GNPw0j+No924uIPaJs+geM9u83mK22Rl9YeHkR8hO95hGnqDJRWva6cgyXk
	zJzB7w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cua06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:23:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139fe708181so4925597c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815021; x=1783419821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjf98r/hrw4t3YgSzoJNbJCdT3mRw4IABG8RvUCuBYI=;
        b=ASID6Q1qzgAREHlgLjgVt1n4FA8X3ddC8XzO/qBc3FfXRoP1KaorhHNeCA9jO4Q85m
         MMkNvh2QCDbGQ2c43tK4bTpH8GOoF30XENCvUncK2hPMiaq+sUY08veETuMJhEmL7kpO
         xSfuyEuFo6SNbFG6385I6OQUEA/X6Tsp/t4TA3u5Sf/hf8vJR4lB7Tb+Gx1tJgkl4puY
         rSZq+PHfd1nHQkSHP/yXJk7d33zaXQzAekS5CkbmoUYGwDWH6KCpFAPCPZozJB/ey86P
         blF4L/Bc/WSrHb1Pv0m9fv+V1HIwnaIg70QBiHj33tu1bReVDmGhaWfP/VJEpgoxPLau
         oimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815021; x=1783419821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjf98r/hrw4t3YgSzoJNbJCdT3mRw4IABG8RvUCuBYI=;
        b=bAJhYqW8DBFGatSYYcVXQGBmWcoP4cLKc1PXx4VJ5cTmCSbOFJFBECsAHvnU4UrK+A
         0LwD0DWy1HSufoxistT70xuWB9We05QT0wutOJsiF8oPI2Sx+aBNkC5+sHJhy5W0kbEl
         Vh9VXUyKJiVsDcaGupDZVSRtlCzx6zG+SFYH9xePvbgwivLHBSPXiiOjL8IF3Ra/bUkh
         h6bA4jgwwqsQnrw9+5OH/MqTE2DAjfQQTnDjU4449zq0bVPhHbyLgIYv/8pcOut1g/u7
         sia0s3Fog4F1VoK8lbTicIUNvkPLBZ9IG7/i99pyX3+Fs35LYlTa29+U77MGtnA3LXUp
         BjpQ==
X-Gm-Message-State: AOJu0YyyYZa2aQk/rlz/KTfhIzlKIij7/lZwIlXrJPAFjnBPaKMb7ubF
	d8AhM1qmoyRpck47umSrHtiT5YFY+6r2crwRvijWx3TH4ZVpzomuEOGylF0RDtLOZj51EWkJ+mk
	pYObCqovz4vIYQYwh6QQe0FQS95y7d1crKPylJhA24dotjdzZ6zTHIX/BCtLFkAMBkW3k
X-Gm-Gg: AfdE7cnhb1lIIJvnWJyPT5s/EoSq8ST/tuy3NWDwTKh5EELBOkxv2GJqs1Llb2zcL/Y
	Bm0tTIcLO+etK3QcZVMstyueQ6C13UO3BDuMI8kiuv1zzC7aXRRRz/sNdL5B5G74FH7JuzwGKHw
	V5omvqK0/GU3lz9mE0nbl2Wmm/mp+AG+KUHGzhI/GC2dc6OVKc2XXcbuippUsf1zRE9FSsK4/Zj
	j/rHMLcHYomeza4mYfTHR4K07kr+YWvXD1nTYrIIWmkHAyyZVD8g7OFcReR0BO68iz0cMefvP3P
	jBoBXdvMbI6sCJAjOBZmwJOhHa8IOiReDW8qz4MXaePXh2xUrEB2iZNJSTwtmHV/tUUiQNXTNid
	NnYWCCt12bYqB69iuOu8XLIBTF1BR0XdA6gtbvTdQbQ==
X-Received: by 2002:a05:7022:4381:b0:135:578a:cde2 with SMTP id a92af1059eb24-13b2a1c0abamr1761518c88.34.1782815020905;
        Tue, 30 Jun 2026 03:23:40 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:135:578a:cde2 with SMTP id a92af1059eb24-13b2a1c0abamr1761496c88.34.1782815020347;
        Tue, 30 Jun 2026 03:23:40 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2aba8008sm5339274c88.11.2026.06.30.03.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:23:39 -0700 (PDT)
Message-ID: <ffca92db-a3ac-4345-8477-1f53ec61ef16@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:53:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
 <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
 <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NCBTYWx0ZWRfX/PNRNgnXImrA
 ozyI+mA1mcT2PACqcSH7nlDVvTpNSeGpsjXBrO4t8YRh6ci5Q/x5+pSXlkDEiBfq8yUvx1a4PYu
 v61ufyGtK1zs7CcaYndAZl0imPe+eJ6Dosuz80H5iLAVcYcCRT/nwcP1/MItQf90hfRx+MGLrTk
 fAcI/5ja8xXY8Feu0RDePmTK/amW7pOVCHW2bqKVeqB6WpattbVKATh+mbOuqdYPXPr9nrCxcRF
 CM1u6+CLY8Zug9E0IO9jVGvBknzuwSqvRJpTKrKotG/5saRDMITQP869M01XUDLElBxhmHeqS0s
 bP5rQrs/Y8sKXFfL/V+BSCw/39ZkBsVIDblWqlmRU/SQMwSK8Y/PoKQ10i5JZ9oLe819NVEv4Tp
 zUWc8Q13IzL0T22rydYqwOKMlRyvrH91PDbW125YcuPox//NiwfiVT3AvY6ChGI18DOX4gFe93q
 flIHmQib9r9WkSsxa6A==
X-Proofpoint-ORIG-GUID: Y6wKUteiagN2g9IvW8kr7DUP3hrOhgD4
X-Proofpoint-GUID: Y6wKUteiagN2g9IvW8kr7DUP3hrOhgD4
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43992d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=kz5X_B4VHAOF4V-UfckA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NCBTYWx0ZWRfXzMya/Rhlm+0T
 JwRdUkEv8az1eRhXdQSuYIyZnTOdp83d+hbpCXm20X4debqrytCSzUVf5F9fe5pE0UxKVKM4/jO
 qbuZ09raTy2HDM3SQgXuZS9vNuYJNRs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115361-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C2826E2DBD

> qcom_ice_probe()
>   -> qcom_ice_create()
>     -> devm_clk_get_optional_enabled()
> 
> If we remove the _enabled suffix and put a ice_resume() in ice_get(),
> I believe this is no longer an issue

I see your point.
devm_clk_get_optional_enabled turns clocks on, whereas using
devm_clk_get_optioanl will only get handle but don't enable clock.
Please note, clocks are needed at probe to read ice hw version and then
later ufs/sdhc fetch ice instance using of_qcom_ice_get() and control
suspend/resume path.

But my idea is, if storage itself isn't there(like sdhc on
qcs6490-rb3gen2) then why sdhc-ice should even probe and check hardware
version? as there's no significance in even probing ice.

-- 
Regards
Kuldeep


