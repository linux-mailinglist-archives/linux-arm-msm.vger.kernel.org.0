Return-Path: <linux-arm-msm+bounces-106392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIFnO+eR/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:21:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF74E9262
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2E9F3004F2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC4F3F54DB;
	Thu,  7 May 2026 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0A2tmoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRl/Yiqr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CA3F54C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160098; cv=none; b=ZPMifrhRNGDVBoXe19gLUeJb1iHOJLrt/NYtxkwBOoyh1jE86s1u9i362Iqr522FkfxYXu8PbG8II5gOeUJpXjtGiDbPn52voFzbtC2tQr3bIl8XIr+NtwQ372Gk22hBP3tbQGyatYCebON+oatSeKsYwg2C9KzOJP46C66v0zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160098; c=relaxed/simple;
	bh=lrnPnFEbAQ71qKyoRi/oTl/odGj3BbrIpPuyNquAcUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1rl6o9ltbChwFVYN4lNlGNyQaWLG2gz18EttLwazuN5Ek7a/z/NC/yLzH9ukPp3SzO8c2F2kZDfSENKUhJcTYJomEOLyz4mrjE03WPkDVVuox1NJlDWRKOKP+JXI6b2OCDfQBQUlT1kGH++FKtqJ44cmyAe32WxnyAhh1D0w4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0A2tmoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRl/Yiqr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BEgWL3157318
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5vv1I/V+A5zTMBuWbjN/T1XXIXllvN0Icg53W67xC8=; b=X0A2tmoZwkN6rwYc
	Cv5/zWMrESzFiRugCw/fCcoeN138BxC9BkM6etNrh6mT52XFjFh54C6mv7oZdZ4o
	UE3SYwnHZ7zlFsQSMZlE523RtoTObiSlrtq4Ksj9ViuQ6X9uTZf5XP5iFeUCmBhH
	AzWYffXFH+9Ht+GFIx176H04CFHjCqrbhtDXmxLgJSEUTsMOIeqmI/bAo1oeXPEn
	QkgLTCF0Ky5J77Gtw+xxHPpwy0w30OdZouQOOul8G3Duo8kTmD6Ld/BWz7oWSYuv
	tSdy1wZxZlWZ9khBuiFRHoqq6ZtNUJHev/7t3eOB0Paa4Cr2nEiwnrQjD/ezr2nh
	LQkiaQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf1qqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:21:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-835444b6ce1so636610b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778160095; x=1778764895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g5vv1I/V+A5zTMBuWbjN/T1XXIXllvN0Icg53W67xC8=;
        b=YRl/Yiqrcc4kIp4Nbupxgq9lI+G1/EhqH/GQGuPQqZXTr4Fit5tKzygPR+tLs5agFv
         3QddUx8eWfNVhSvYcK+g4Sg4Hg3VwXksGNtvQawrv9z/2J/1LCgy3vmLCkc5bq8Ojcgn
         BOE2ck4JoOvjFqkf8xEBSdZ6KGTMm+jCcbM7gquBG9MBH6b3PikO1gicr6PzN08xgqZP
         XdE1rfGvwMv14tvfMJyzzlnV+HzS2Tt/BG5lHwHit/123d5VuRjqRzsXIKiUpK5AlQrO
         XMOH7M9aDdyzGzDOaSvxYyozJojJ2eVFrML7FxdU2Td+4ig6zyMzo/xQcBFYVs4PSrb6
         O/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160095; x=1778764895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5vv1I/V+A5zTMBuWbjN/T1XXIXllvN0Icg53W67xC8=;
        b=tNWPhcC3DfUvpRQvViY8GDx/XqijsDjVzx+EzoxPHsjxlw/w0kaT5iMvdKgZIYRH07
         rerAHqcxhC/WYs8qbVBVMja5XcxNgOAfDGnLw68GQ1oYFwCKqRdIW/tFZhtQGufK9Od2
         Uu8R56fHVVPsK2xsyf853S1nfWH0ks+qffmUoQKmXvxntZ4sqb/DaG9Z9fDnKNyIrCFx
         xOBVGycj9vWPjKZo2uOPgO5h/2lIgkDsuTyYiQR3HqYCHDIDzarsbWyB6HBLcoB/K2bj
         OHw1VB1JVi8tNgKFedmQFmZD2FDI6Fy0fiZqw9U95xCv9/ekACdmxv0HITSPwlK/Wp1G
         STXA==
X-Forwarded-Encrypted: i=1; AFNElJ9h1XXa/uthN03wwFCasFCL1dgT05otWL2IYQl5A9XbVFiWv8o79vya7LHWgTDEemEveYibt2x2CpP4D2+S@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+2KObSA2QOKVxMUhzM2oHb6J7N7rnmAzt4Nn6WJzix/nJVC2
	EfPfPBA6LYUkpEdluXJu2g03ftB6QxQ1MewgSZyT97xRaZuCeI5mHNAJMKPOJKzX60nQaIjFozr
	z/Z9isSE2d69y+eDYOQ1NjX8kWAnOsCLbQllSopYHZyM8HJeuSwyTTlXNqZClAjy1MjrJ
X-Gm-Gg: AeBDiesYXd6l/h7XqXgokmw2bnwHmqnqOPvXWfSZVIkgnxmZnGJz8Eo0jSbFANh/i98
	oaV6Ne0PP8OyoXkL27x14ew8PmmFC2wWlGsXUqTKcM3Ki9qdxhJgqPjbNXtLnCCUcsJsIiq/AbL
	KWvxhptVCiT2CxI3a5fl4ojx7SCqrPK3lvACBmjDkUabFq23FkMjaqXfmxylk9gsKar2Me41yIb
	DuyNqRsYg5aXcVIDb4ljkjYkLo2ZwLzmmt+zUcDvqbTF0KVMndJNaD3EOXMv7cV2L5Iig08qy93
	JDFVr0GI0C6cak2OxHiZ7brZ3U904Y/owVylklgMwLcxBFVFzDtKFa4q9oj5z4rjl4uQpogtHXk
	ol+arnRBT4cGOk6g3vl20hq53deav+OF6Z5WyBK0tlXzb59nlz14fwCHKC9h5jbGuIgM=
X-Received: by 2002:a05:6a00:12e3:b0:82f:453e:3863 with SMTP id d2e1a72fcca58-83a5c2b6857mr7738877b3a.22.1778160094550;
        Thu, 07 May 2026 06:21:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e3:b0:82f:453e:3863 with SMTP id d2e1a72fcca58-83a5c2b6857mr7738853b3a.22.1778160094005;
        Thu, 07 May 2026 06:21:34 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm11894566b3a.49.2026.05.07.06.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:21:32 -0700 (PDT)
Message-ID: <40c9039f-1f23-4d7d-b6e5-3f1434875f26@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:51:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-7-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-7-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMyBTYWx0ZWRfX3DrWvYIXifUU
 Z35CQiOAlKThykIQYh7IklQDhgg4kmPbbINapy9b81skpv61z3QYiqqycR4ZcZG9pgWV8apcdWa
 ifdjhivtq3wvErdkWt6qoGg7CJSS76ityzIYEyW5d62prIHgtqVH4sKrHqlqsFZY0xRA2/8aO5a
 aDgEtN7vkeSvrlwXJ6ThdTGcWJytl6NsEE6xOtC1kDC69IyDWxIGuvyaPjhD9TBAartfIxtbXwL
 +pTUWXUIIlqsL0MDj53OjjYizY5YgCOG03ci3qO3PF2IupdUpw4nhL20alKGSjEDOqWOEF/zaY8
 Le3w6h7dEX/bnG+278Evq8K6DXxI6TNXgoGfQpMOeKHVYqzTR8/lK7C7IsnuQFrwuySMHLDCBPW
 TOMrIewa5A6CXJdN5J8nrxf8YtWnRCNYolfPU6UjhufsQ4mFL6Y8z84yVmgdMLtPOmI5MK8tk6i
 OgxUL3+Zc5Le8IQED7Q==
X-Proofpoint-ORIG-GUID: dTcFPDRPawqQ-NAdJqYb1ihuGS6jruro
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc91df cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hIPIbg4ErQybsv8KxtcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: dTcFPDRPawqQ-NAdJqYb1ihuGS6jruro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070133
X-Rspamd-Queue-Id: A7BF74E9262
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106392-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> AR50LT require explicit instantaneous bandwidth (IB) voting in addition
> to average bandwidth (AB) when configuring interconnect QoS. This
> requirement is due to QSB (Qualcomm System Bus) 128b to
> QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
> which is not needed for other IRIS cores.
> 
> In preparation of adding support for AR50LT core, introduce
> platform-configurable IB multiplier and enable IB voting for all SoCs.
> Existing platforms default to IB == AB, while AR50LT requires 2x peak
> bandwidth.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
>   drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
>   4 files changed, 9 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

