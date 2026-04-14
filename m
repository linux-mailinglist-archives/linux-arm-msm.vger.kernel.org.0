Return-Path: <linux-arm-msm+bounces-103108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDN4I80T3mlBmwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:15:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E78D03F8850
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A03CB301700F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05F13B6342;
	Tue, 14 Apr 2026 10:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEE2iNU+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0iXop96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D253D34AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161738; cv=none; b=dqL2/xJeBHeVyowxTCStJmyFUiPlD001QjTLT/3nXVC/r2aImzgcbRWKhz5s+oIK6FnxS2g2Ireqd5IQcpU0Z77PZFgyTwXqLMzT5S1cltvoR9ZGo9EYIF8yNvlJ5Hxaet+YdOHsODK3BNzk7VySdFkbXzBHnNvGm5Rhf8Zt+uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161738; c=relaxed/simple;
	bh=haVjjjJfbw4p/bj2YwUWhOLprsRoHljMqCDD04fK4hY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwOn+jpWfAkwmLCMD/krgLxmyQA3SdkBAQHIoBP0qfoj4wUxOXMdV0OvgK+Jv1ib5tLekPypD9quwjnMCRcoZv5RB2P29Qh0i+5Uxv+11bsHMSW70hFVRXdXcYQYy6AruDye/g10XKGeO8vbh5xzROH2fsZ8mnFI1LHVcEx3Bx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEE2iNU+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0iXop96; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6rFMl3681775
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmI3HB20Mk8H6+sF1ZHDz0ZUrPr/fmSvEjq0l993sDc=; b=TEE2iNU+EESFipYg
	42Kd6w2Qmi137+uobhO87GYF62nUfNHBdTv+urdGqTJgVSQclBxdWdYM8R3iCr5Z
	3UDhRDji13n3GhAc/YaYMg9flpFmq4ciXpIDhnI2HDUz90vuBMCyw2+SSRzoJjkl
	7od1xGF7PLmBiPP27rd0UekQa9R8g28wTTcR+bdHUvXcxZBoHV9WVIlVZ+KK35y4
	4ruaVh0Khesezs2cyvrzZR96/pTIrS2R4IEk+4r1SSv9LNjTlJHVMboa6vFlG5YV
	mMdXXEBu7kIVRKdAY+HgL5I/QBRZo4nH8vOmVEeJNfoA2YqlvuRDelwXtVaeoESj
	4AGd4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d28ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:15:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b33a19837so16778361cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776161733; x=1776766533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmI3HB20Mk8H6+sF1ZHDz0ZUrPr/fmSvEjq0l993sDc=;
        b=V0iXop96G5FFbb77fu4lvZ57tqrEPNqx1S0+MQyNrIIMY4J32a9cROJZTSHIpqdLnD
         zE85je1lnNqI810K3ihEb/Nvse71g+tiEUZPvqn0btunuNY5XdRNDQFVN38iM/UPAoFS
         5+ArGviY7Dr6JlXcCHczOZigm6MHdgoKdC3/cmmrgR4OqJxW/ivAa+p8UtCSo8jztLG4
         NJitf5bI8e7RWrBLIMO/YhxABP6Srk7b/SBs1SBz220iqBwZ+3+lJqmsd9qt8R9cVjyo
         iEO3qKumH1we6E9+mcA8SFTP4sRhko3Dk3PvXTtTR+epMMLORZIzhmNw6SzRabq1m37w
         wI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161733; x=1776766533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmI3HB20Mk8H6+sF1ZHDz0ZUrPr/fmSvEjq0l993sDc=;
        b=dw7eNZgXlLGUwELRKsbMjsEPnXroIbCD4P+pKG/faux9gvlVn2TdnUkvDnCvl2rEpM
         /CapkhzCluuu9hQiTxNzFcGnulOikgbV19QthjZlMlHlld2tZZoTTnxs3CudDzGh4SzK
         lB9vQLKp51m7hQSCAaVTJIM7QEB3064CjcTIuhqqE57pTuD3zch2zxLGNZNwK0mO+/cH
         oixhPLYzIBXAEZcrpasMTX/1Ae55JXRA/AZKi90v++J5vnOfD11IZsd4SKBaAghXtwfs
         kC0skVeOeWmSeNOGIaTKNfszSSDPqReLOirS3GXVEFl5nSUUbdG1GYZhQjG/j3YLUQHt
         N0KA==
X-Gm-Message-State: AOJu0YyK3lTE+9yLN9ovw6xY49gmLQmHAh10hVnyNxEtPbJKz/1WqzI2
	rblRHTKfW9BsqiB5S1v5hhUKyV4TdqUZ6Ob+lbTCU+QE9SNCbPCwMW+sYIIAA/f/F2Mmr9tmgqD
	oYF7o87CLVzZRua8GWiCiGD6MbEeVmwFA3GPdSXYbPSmOX/9H2HfL9qFF+7INNVrila0Y
X-Gm-Gg: AeBDies+NXltnxKTlG5BAdANRjJgQ36PtGbd+O49khzVS7ClSPYmj3abenU8rTN8vzY
	S8KbCOGQKv6mmYOw2DiNYsNRN1ph4lwV1Tj5X3Uh1gzNspMXNZoH9XghkbZFfBFbZtkmCFBfT0Q
	eXS+p6mfHbaq/LWt5d3T80LSBTWInYvdv5fnibrNIatTZVWh4ruLQ7hLa+YZ26hOE31E4zEjLzl
	LOyLJBlodI0UxQ1sw0lKIN96rM6goumvNyHDtV6ydJEgCEsQ/xzoRSu5krTRcYxhGHK48QJ7sr7
	e2CfXkrafWaSbY3UAPRJhl/hpwdlaWq4bfsqaiT5EkVzenYsIQMd129TsPhvIkk6gB7lrCn3d+N
	dZJn7tUVNYlWuWDCnwXWOudjFA6fE3kQjBboww3QocZRb9kiVbFYe8PV+E6ljeYsNrXdUYeGDLF
	iJTFAa5SiFuOK98w==
X-Received: by 2002:ac8:5949:0:b0:50d:714d:e966 with SMTP id d75a77b69052e-50dd57f6e28mr168877501cf.0.1776161733147;
        Tue, 14 Apr 2026 03:15:33 -0700 (PDT)
X-Received: by 2002:ac8:5949:0:b0:50d:714d:e966 with SMTP id d75a77b69052e-50dd57f6e28mr168877241cf.0.1776161732724;
        Tue, 14 Apr 2026 03:15:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671fcb831f1sm179629a12.11.2026.04.14.03.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:15:31 -0700 (PDT)
Message-ID: <48afaa9f-006f-4b1f-b847-099bbc73a0c1@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:15:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: kaanapali: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-5-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-5-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NiBTYWx0ZWRfXyrIDp0qtMilw
 8MTetSzluq4kzFvomSpsD4gQGTLLzQcUFUTJOGvhBiEfOfAXeqRf9FEUwYPSSwC6w+oNY7LIqfS
 pzYqw0Jq2qbKvgiWXvAs5AjPkCKYsdZiSHEYfD0sIFfWssQ8dsEjOVWjcEkdG6BwRwI6sMkX1od
 G2iTZky8xKpAgIJeAVFyoptjO7a3O/GEv50yIZ7a3wFWcUgYDRANItwsgGaXvwvnCGfxiyPclgq
 R3Tp46+EvAB9Fq9kJ+QKSlgUy4C+tstIUKd9YwYnwlVSxmW6ne/C84QOUSSWgdAZgAG3fGnJLXE
 c6CebyE2cgX1YLIX+mIdAS1AbaYshp+2Lh+Cbth/DG9b98kGIk8TiVCIW3hKqOzbAU0aw8DDfLT
 coCHr2/I3lUV4avLdVegin7tmVvL/9+b/avuQU6IhCwKn4WdlnZbRiYgGXXy1yiQchTf6AfFmCK
 nDmowKFe+B7J3/78+Qw==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69de13c5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PZpb7m4AnjRGDnRZipMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: SGSppGPjf582JviZUKmtYmKq1BD31FVM
X-Proofpoint-ORIG-GUID: SGSppGPjf582JviZUKmtYmKq1BD31FVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103108-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E78D03F8850
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM nodes in the kaanapali device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

