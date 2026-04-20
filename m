Return-Path: <linux-arm-msm+bounces-103696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOb2Bf3l5WlkpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:38:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F9428405
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B70D306CD1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E66388E70;
	Mon, 20 Apr 2026 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYA5jTOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGtTKbDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CA3388364
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673988; cv=none; b=BVb5xjGtY3ykXI/z6rMnwQjTWyn6GqHzbVrIDqv7JrkSDfClpXfwNYBfUgLcq87fhcOcSQliSXUYecCg8imHUXNp+w0G1/suW3b5s7Ns1QpAFvdNBLK4Re4T5eJ1xTNxj9wDoYxROFeQ/I4183qwWImdbw+aBZu6eO9yJ79Q+II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673988; c=relaxed/simple;
	bh=qCMhl8v23mKSySIuzoFXuza/KKVO+dL9EsOEBALwnLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOwhZK7/4lPQ66RFnlFl3YGaPyGBwkc1RjAuAkZCCEtNCWwSIGRvkiMcgbvl5S71cUciWyRD50WE9OWo0/hyNCd/PQTGBdlo/yrivGbhHu63tB2NRxIl/KnpJgn92akZH79MSnBrx4xmTxsXcHOELuUlrVBP6mV53QECeT6wz90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYA5jTOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGtTKbDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K79CSv1598128
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O81xam1nsGBvqU0gdhFfes6fttpoZWd8T+X9hUECIeQ=; b=UYA5jTOilVCs6BKR
	c5XgYT1dwKRawwilfcV4+RziOQrQGwDQSaNfkBakV4ahU5oLeuKON16t6QYCo9qG
	0CPpCnxkX4Y+WeUcWHqy8AWIvA2NkxkQyVHtBaIir0QhxzKQPTk3DwlPV7RY0dg/
	YcOeXJP6Phnf6qulYtdDBOvXEof3jU6jhGm3jEJg7mIJ8eRJ5pdT3QMDi9ymjvcd
	xfIrt1UMyM5IqJAgVQTrWZFDn8O0tSyttctHuao0DVZcXVW3qgoiHz/CXsrX91fI
	9qyo66vP6PeNmhcdraBTCzggnbzc4ndUVIFPaKciHhJap54VCIKLBpBH8/1Rdhh2
	r06AHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnge99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:33:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d59968444aso87173185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776673985; x=1777278785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O81xam1nsGBvqU0gdhFfes6fttpoZWd8T+X9hUECIeQ=;
        b=CGtTKbDaNibcxEGwz8q0VX0szQGe4qUAj0mx7oinnc0YFSB4QbK8P2YyIMxp/C2TdE
         E48UOlXHuBbbs4/XkColhKMp7ciZAKNjJekh5qJapjV72tm3wGdJlbj+oGZ/VAtykren
         9L+q06LU9JAY7aQVMCMkB3HyOThsZnlurm3bIlMNitDRYQjRxviJoCtE9NpJdlSTsPCc
         6oOe46MDOkKuxCSAkWE9K19JqaPhPGIZ8NY8H6ABAKRL46Ou48Iw5LFvwYqxhFFPB0Ao
         ByR9IgHyyVdmZ7KUJyJCa4V0KlcLHr27GrRlOO8k6p2dHWR64M0BoPVrelKwh84Efa+A
         k7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673985; x=1777278785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O81xam1nsGBvqU0gdhFfes6fttpoZWd8T+X9hUECIeQ=;
        b=R2A5ZNjTFG7WNSitA8gKHoJpds2YQrp5y3ja7bYNufZX9Ed1BhMr1AlxA0kHk9UXpP
         i9r1d2j0Yo4F3Gh2T/LlUzj2Usg6mZnVPsCdq+w3K1BJJEJMzjQKW3kf/JGUwBa3wYIZ
         hMhzZSF+rRE7t+RLR2R51Gh/AjOInvjXastItTMKJQPmGqo4XsbqNCdG+ed1wjH2LhFC
         ++jJCj0bMW/dp85OP/f6bq21BxI2Gf05XcWkyQ4HNCb4Ls/ndVBV/2iTc+8SxmYOR816
         00V2YW9VJv2cRtTZoJyUrUJbRW7UWTWUngHpq5g0zv24hQkInAsCMupWDWZ6fsyC4XaK
         4Utg==
X-Gm-Message-State: AOJu0YxTbAwCPfNbyNkY+AQbHtW+BEESEGhCYA1gQqLE3WzPLpOHDBvI
	odLAf7w5PucUofRDEWasVazcG9S1qknsE1Cy/uXJPVYpQaepJJc7+hQAROSVJXTRgMlQg63+w1T
	2G+VmYwSF2u44LIU8T7Ox87UFWyTfA+gmltLcSaDT/zLibhK9fyssrRcw86sWxKQgKmy2
X-Gm-Gg: AeBDiesK+XFSfNHYIEK9jqVZbQFh+XC8JiG8arj2mDfgcFZWLEifg3yfeLbjZnZcmyo
	x0KY+iLfjdWg6kapcXCm88XEc7rqUPxWRGhcVQ8IywI1gOvLVwLcG8ZaZAXjsMhkP+CI6/bG9Om
	f6LolFjyllNEMcU4fEjDrBOIlJRkb2otQj3q6pkzQXGWaZyiO0E9HCjQglYuST/7gmMKefUZh9f
	VBlv1BdwI+r4g+me9O5jpPXII++z8wsPSUTQzIfMS5nhZRFHUOrIdYYYRFFLRkCnyic/rWbu8yH
	Zg6NkKXJqG1NJlbZFrywizb2Fio18lmMpBi185vWzP2IynGjBcEuUp0Of9fwBG5LQ+T7ZH24D6y
	rPsU2AMOQRV8u/ZT3kjTI6w6OLQ1fIDa7MUl15GoIwJU3o2olJDoFsfpjCWEDPJ9uPxaEzWyDRt
	hwvAQoEg3y2MvaXg==
X-Received: by 2002:a05:620a:4694:b0:8d7:a89d:958a with SMTP id af79cd13be357-8e791c8e121mr1183543685a.6.1776673985369;
        Mon, 20 Apr 2026 01:33:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:8d7:a89d:958a with SMTP id af79cd13be357-8e791c8e121mr1183541485a.6.1776673984903;
        Mon, 20 Apr 2026 01:33:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-674b7639494sm658448a12.13.2026.04.20.01.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:33:04 -0700 (PDT)
Message-ID: <014b2a76-074d-4454-8a58-7cee7e9c044f@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp: gaokun3: correct EC
 interrupt pin
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
 <20260419173251.1180026-2-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419173251.1180026-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9p96KPe6vTCqBZ4RH0U9vfJCnT-SGRy6
X-Proofpoint-GUID: 9p96KPe6vTCqBZ4RH0U9vfJCnT-SGRy6
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e5e4c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ttdWN3qaAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bcNnqL9biuxzk6TNqmIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MSBTYWx0ZWRfXw0VWdbg1yBWV
 T6sz1MpoFfkMA/GICxZasO+zXfO2oBMOkJrcFynn9l5D35e+s28nWWGyXkIKIRc+Tj2ui/5uX+V
 ac/daC7LpMoZXDLZmKtfUcrTSZVfNG/4/idCMxlCfGgeVjyE7pyaoUzF+wMI/ubfO+B5TisQRO3
 k+YQPYlCsBjNby/rbJiNIi2ui8nr2LcbYR+BLX8OqcDhNCl4zV59lkL45C8pMDHLIUJ1zMs0paz
 KOilJ38so79s0juMpavrlgA3PHAo/yATsR9YC8ymOBKHMJ8K/APAmFNdN2gxgzMU35JW28B1uJ3
 LbQOVMpAG8TPBQMGu7FN1ssK32Pnbmez++dedMsPBuHIQpfW4ipbP/w//j1Gq5xwYm7o94u6+VH
 P47tnIxNDJ2SkSjD+Gcl4s2rbL+DQbRX710cwdVYdoUKeitnar4anKW7oM2G7MkpdjK3SQZPKN6
 liSVZdF3w+awltq799Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103696-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 742F9428405
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/19/26 7:32 PM, Pengyu Luo wrote:
> Unlike other sc8280xp platforms, on this platform, in dsdt, gpio 0x2c0
> is not mapped to gpio107, it is gpio103, so fix it. I found this until
> I did a trigger track, irq is regularly triggerd every several
> millisecs. In the past, since here gpio107 was low forever, ec irq
> would keep to be triggered and polling the event every several
> millisecs.
> 
> About how to get the map, please check openbsd driver for it
> https://github.com/openbsd/src/blob/master/sys/dev/acpi/qcgpio.c
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

