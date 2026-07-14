Return-Path: <linux-arm-msm+bounces-119015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h5goHbgpVmrK0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:21:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B630A754744
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:21:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YnRaWVgk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gfp7NWf8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119015-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119015-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BA613085ACB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95FB3921D6;
	Tue, 14 Jul 2026 12:04:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054D379EC6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:04:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030667; cv=none; b=FVdXGIffaw8QA4tVHNoVdY/80/gEuo9eQgOizt3GzbwQqRjOyxTLGXjX6wGNjLdSkIky1+VhE+Yfz/Pdjd93ZHknFg5SEU1JNtmKcjLmOFtl3Zs4O0grXTEssBVFgjMNbJM3dB6yPAzaBQ0nqNswJS+oyVFUW+aEPXgH0GEVdPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030667; c=relaxed/simple;
	bh=U9EW8lQUWTDLhr8365v9Q+LEshRqNChTu6L6xIOCeP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXiW01uhSqnRe2yh96FyQdmdjIGjVdBr46yTxD7DYJdGkiIFVM6hXhlKMk5yRKXaQ/xyACZBYbMO29DAbwnpMBbPNO0OcmFVLBGPilu5xZVPem1Oilcsjk20UbsyfG5o5C1O6AzpZX2lm9Rt369saIIUqWtXhJ1lqqxuhhW2Ll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YnRaWVgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfp7NWf8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNwb4438940
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9EW8lQUWTDLhr8365v9Q+LEshRqNChTu6L6xIOCeP4=; b=YnRaWVgk9Dz/37Op
	GKfJi0vouUrjOPk+WZqL7SbAO9IGVVAaDrjcmHyHpTFDHccWQHIyRu8Sikcyentc
	YubntegVs8aQpysCauSItu3zGxpnuwRRFBRxWlR/GWDO4IiWXoIdqmorUCRzU6x4
	K8gx+Wio7HdwdjYgqqrPkE/KH202JkosEZLeueZaL7zc4l2NbbVO9TYB/wIRbEcV
	Sg0om/OQpTVzsshX0v/D9AhRMDSHdXdOSQtN+tilO9WeJwHLhZoVkeV9IbWM1riC
	1wN/iGh8fbFcbx/6ONA/S8RH81R4bfjilwTywAypUp0ifVr/CYPQ3C7D4CuR2d0C
	uc55+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudgxe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:04:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso103103125ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784030663; x=1784635463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9EW8lQUWTDLhr8365v9Q+LEshRqNChTu6L6xIOCeP4=;
        b=gfp7NWf8guLqOuojdKFHx1681biGuUN8mJ6gC2cDaAcupc87pzuSESNIUoa8hXmS7N
         uR3nGNP9YEbkI/3UScG7Hb1zbnoieXWimIQ+rfa/Uaoxqu2QUvEtJ5DQPSgGKocSi3PU
         Z3QPfPC3rPbplvcrM+Os/CrvXV/Ih793ELxJo5qCGcIghINPZbcUGuX30BaPsZITPeFY
         k6jj+eT5hFc9jn9DpQfZkT6LyA+0Y24kuZho2hGAixlyBzNa/V67Vjf4rIVdh1QeIpBi
         DUWV8jDQSD+WW1UtdnxcRS8GSJTqQHql/SEgnPbDsZ54kNZu2poPVXNHZLB+5lyo5129
         IweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030663; x=1784635463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9EW8lQUWTDLhr8365v9Q+LEshRqNChTu6L6xIOCeP4=;
        b=BF9/0isAVdfPvF8jz9WnXLIyqhwZb3tLVLQsZpSaHI1CgkvbbBgFGcQuTHjoGiBDwT
         7UA52f9PYk2KInq7PBQA79j0aPMZGFOBcGlWVGAP/0P2qWvdsi3sDcv+iQBaKVxN5osy
         oiNBPhI4ydw/alChIZoFQdOYxubeBWJUrBqDwyjC2guOKHSyNsK5f1YdFZ4yf/sygkzS
         CIDLlNzlDXBVmV+mvpiYF3lvHf6CSER+DT3TIkaFdc93bYH0mCRJUOYvCtPIeh8iaeVi
         5zW2t+vI2THQxMEdtcpeRU0AjiTxIWLXqJO3JH4JADD9ZPyoDxQOmSircjxh4qiBQXkA
         6kkw==
X-Gm-Message-State: AOJu0YzZ8+ERorT9Xj3nryjhk0KQtBBhmX+e47wKCjd9cwPYwzZEbEir
	/xZg4nvUHTQB6ZqbDXqaLaHLm1zYCxwIiM4bQkq1QVVD0sS4ZJnUEYj9GJ8nj2KHf4HvdeoOAcu
	t8l2eFdgQwSJPcxk9n0MT74nTaPdqBBRg4LCB1T+pjBkjJ83NEXYTshgBFIMrj4aABTu+
X-Gm-Gg: AfdE7cnK+53brcOubS+IGPV1GriHn6eZHylQaZCDozyOrWjFxXN2/e5og8N12Fc4fZ6
	iau8MUhYKO7y69qHNSdwFTNvffikuFrqHLbk1x7hjDDlN15EzDD7+0t3/F2kHyNVoFqBtf4jWPg
	Iq/ZFeVW/EJdGoyHQPIgSymXBfeUpyOVfb5tYaCNMLedSYJZMvboMSXkXTPWuxfoXdVDSKpbCd1
	mJAqDFXvUtMB3r5+egHYzgsjOhXZEjvbdzhChN7UDdcdDwraFjo6UrS0lmFynrkEE2zlEsmPxba
	6X10ubq0O6AGU7qHIH+KHiUF9bnJRJbgu8wufUB6hSrtVOXTAVG1cXBbfRwbOvHShFpOqOglya1
	ShTmpgzgPFhuhchX9qIIBpKtmZqCq9qxpK09nlEs=
X-Received: by 2002:a17:902:dacc:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2ce9f05872amr129947445ad.38.1784030663437;
        Tue, 14 Jul 2026 05:04:23 -0700 (PDT)
X-Received: by 2002:a17:902:dacc:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2ce9f05872amr129947185ad.38.1784030663037;
        Tue, 14 Jul 2026 05:04:23 -0700 (PDT)
Received: from [10.219.57.117] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm115439575ad.67.2026.07.14.05.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 05:04:22 -0700 (PDT)
Message-ID: <8a44eee0-581e-4f1e-a893-f9080f6b7595@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:34:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] EDAC/qcom: Skip ECC interrupt setup on Shikra,
 pre-configured by DSF
To: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-shikra-edac-v2-1-22fcb3ca9fb9@qti.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-edac-v2-1-22fcb3ca9fb9@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PxOJ-A2ydQEdKt0qmFyVg6HtQmopTuxm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNSBTYWx0ZWRfX5y9IXh+z5pq/
 JIrHqYSBoUs9Aq7KfR/L4M4jL/A0JU628CUO5RIY5VTT789d5bTe/FkKZS81Jo9u5k2tpbffqjU
 E8qpWPgFOLLNQTcH5hZviTnSAfbiCoQyc4ujovsajvFFbAaUi7lMIPqLkmpkoFxg10WfCMhCW6h
 Vf++IDZqiKBdESTfzFL8mPVB6YWUEJ9y8pr792SPrggab7Jo0Vl8omI3mzsfxBXLPEe8lmJyZPv
 +hGOfUmXp2JEA1xKs7hfTuYz/ezlivSTGfrgzOuk7UhAuqaL6Z0tK7eN80d7vaTAIVux7nyLlX/
 rcFujGRgarh0a3P9ywhyMB3XXOHjDAvWAUbvRqdZ8+CGWvWWDlQNcv14mUvdfn6EQ+SiGkY/oGl
 23byCcbCeeo/tUuK3bQy59oCytXbYeBiZTBJi8BDF8i5ijJSvFH/VylC4RKQFnK5SvyfSh8ktK7
 69rt3OHQDc9PitDYGOg==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a5625c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Aw8qj74nZGWC8vGh1sMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNSBTYWx0ZWRfXwHyUXS8N7E5A
 dMNTiImYH+lTvWUy27VKDGRwcOqM08PvDqdLqM0xvvAHtdipI6QMOtqErvucDIYOah03cQns/qR
 sICDzJp9Ou7n1WFsqC8ZoNJj7ITyQxg=
X-Proofpoint-ORIG-GUID: PxOJ-A2ydQEdKt0qmFyVg6HtQmopTuxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119015-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:faiyaz.mohammed@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B630A754744


On 7/13/2026 3:28 PM, Faiyaz Mohammed wrote:
> On Shikra, the DDR System Firmware (DSF) configures ECC interrupt
> routing before the kernel driver probes — it enables Tag/Data RAM
> interrupts and programs error thresholds in the LLCC interrupt-enable
> registers.
>
> Set irq_configured in shikra_cfg so that qcom_llcc_edac_probe() skips
> calling qcom_llcc_core_setup(), which would otherwise overwrite the
> firmware-managed register state with redundant writes.
>
> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

--
Komal

