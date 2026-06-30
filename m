Return-Path: <linux-arm-msm+bounces-115385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IeOEJwqqQ2oregoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:35:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E26E3AB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:35:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bOj97r4D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OiGumuPQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115385-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115385-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C2773023303
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F4F3EF0AC;
	Tue, 30 Jun 2026 11:25:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6C3EBF35
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:25:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818721; cv=none; b=KEzhab+E4aix8JG/oxqr+5Yk/anzxuF9QhyMTHmhuGcEnZf+ib/wUpI0aN+8Aw8mv53xAZJeF50J4HfXTUBpPW/tMttmCqiwrZSvllDTQ6vQMzPN+M6mtDtzflySAOi8i7/RkleetGP3uLGyf2nMPvj5lI+LGc9bdukYd3sCuuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818721; c=relaxed/simple;
	bh=VHv0DUGnwaDZhACPYMMQ4MZL7D26mlLGcb12H916HAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SUEEuG1lC6DLyfxehJkT3QJxLjhmZQeWXvJ4zZClXXMsecDDRec64nz1T42KzwNtl7emLje9xs+LwzJirg/eVY9sQDMtDNpvMBH5Mpbz/p3KxQq10ZeX2UFFTnEnI/SGXyzFfPvHcUDsReDLJ5CCHIUvnqe+b8B4LyABerroyH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOj97r4D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiGumuPQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9muRX1604857
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32IH0+GhcMxvvSV3B8uT8krSKLLsXFNv3zLVkf5JJcY=; b=bOj97r4Dh5TpRPBn
	DFQIXdaZxi6EC5Q4QGYGKi7PgfD4SVY4G12bQxCCkwWx/uGwWY8P/HwfqfK9WcKS
	hAccou7nNNcDqcIpiDO2s9kz7r23Ao1UpOYTqQYc1zncDCtGrVY4Tswn7RcJl9P8
	rfKsDiVBSilIz3/ZEz9gzvQdOOtyEiPqSS3yjWInS18sfDLcO9tWQMAfbVc7QtAS
	9ey4eXvXuuafL0GCzIfPFeqAeKQB1TD+MA5EK8PtY6AR1N7s7+YSfRc843GyKNOi
	C9yiX4giO8rgKkuxS4OBz/zzq4ulAh+4OD2YsCHQ5jaMYWl/gU+rWtxyMdR8f3oL
	cA+F9Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfjcsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:25:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so3194011cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782818718; x=1783423518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32IH0+GhcMxvvSV3B8uT8krSKLLsXFNv3zLVkf5JJcY=;
        b=OiGumuPQRFxPXG8mNMQxWTFnM2bi/li7D+HqaGXqnEWQSwSO4OR/fhTLB3T/elJhbP
         li6ZNbYc/1uVkHWqGFQ5PwMQx0sFX3/5uf8RJxzQS5zt04O0cZWhcDRFLqgHu/04XwXj
         JRkwzeS1rtvVjD2yuE9CxQv1cDdg3OwyD+WLlOcX36meCFcNONOb6VZofn3EgNvaynCP
         7r4kMSsY5JLmEsjyTAf0ohyErps9UTR+TW9hbHDbGL0KHWevjkl5O2hbJPO3MoC2pDZ8
         7bqUN+7IQmL/iLpiMs0L9sWKvRyVies+eZ1tzNS75B2tZXo4LugkIRE7JAG8pDoL3DQk
         +iqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818718; x=1783423518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32IH0+GhcMxvvSV3B8uT8krSKLLsXFNv3zLVkf5JJcY=;
        b=FEy6jst8gonBPwxPVPk3n8Os4q4TqFMJmXqdakqWqodTRBQHOXwHhiHvK1Yg0tRTDn
         pEBt/vQKnxfsDuf2Q3yzr0xqIch8RK+SA/yEv8VQDN/6IdS+ByS0/inbGPIGlgyU+QjS
         /gcCcUXh6zkhMRvYhXMGdDSRjje2f7S/R+D2Yy0oLaXjDpg4OIgAQ2jLzSw/fprv6Y4x
         CY0FtSBHbqPT6zOojkxjUzFoMWHHmsgDbK7jbTUWwCxsmklHbWHqVXTNx9HPls7yzG7f
         ziU1dq24M9KuvOax4W0AVvPtwDafPzHiEOwTkx1JH3gwbIp6iIhnTf6kzEbsdTbvp6KL
         FV8A==
X-Gm-Message-State: AOJu0Yz95aZM3dYmNz7yPDkp0mMC3BtkfuVofMZoELDozfamfJhGU/t5
	8avK3TaAw3U3T2714SIn8k0e6vTPHuQ7Wg/i5jrRoZBhhlfCuy40bIiX1sQlxJZuzzej6OwzNNg
	cYozZnsHM4YpdgoV8fyIz0qNfMgfRaW8LrVjjDb3ArA/ry/BLtNFm+bXFcLU3y8D+adGR
X-Gm-Gg: AfdE7clKzaMS8p/B827io+eyTz1AKkLgXqChGX2etvmklafAJUwAV+eNnEnSF3o6SYo
	Qne/JXokriu9PtmS64VFnfyAspyj/8UjEXNsAKhN7sHTWYNTxpTlQJTuI6YxtEqRqXR75g6yYhk
	kXnn5Eaz9ZTfdLHX0zXNBTmZq0IgB5msihm3iKVRbo7fKHTeCvp9vZVbdNdtfcGThaNgCZ6Z+FM
	Lt2nsutRaYMKxaNn0BZneX676QK46BxTX3uuVDkvI0fMtwgsRSDhECfQEAMvoN7le1L6g4vQgsq
	8KUooEO0Kh1oUOclka5njTuS24x5TX48Sg9J6FELEvSN+G2Ki1JtqvARrB0boeLv9wembxM79i6
	j74qI0e7xS/qqEPYqtO15W15L4RdEUi3+zPc=
X-Received: by 2002:a05:622a:2d2:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-51c108c0a75mr26146221cf.7.1782818717962;
        Tue, 30 Jun 2026 04:25:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2d2:b0:51b:ff1a:3d80 with SMTP id d75a77b69052e-51c108c0a75mr26145891cf.7.1782818717294;
        Tue, 30 Jun 2026 04:25:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d16b06sm108856866b.8.2026.06.30.04.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:25:16 -0700 (PDT)
Message-ID: <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:25:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
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
 <ffca92db-a3ac-4345-8477-1f53ec61ef16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ffca92db-a3ac-4345-8477-1f53ec61ef16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fwyHq_ROJKGfwYmURwf9VsYa29jKw2s1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNSBTYWx0ZWRfX6unvR0jDCAp9
 8ZXwJS6BRCBty6e5YJx0IZ2CCH8FowhmgHg3SgMv8bOP6YCChFlTg7kUuGcFUnpfIVEKiSgsnKk
 K8oTsD7LqDkBL/440PzobGjvIlnc5bFREoJkhjdpsr1HLqCp7+vHm2s7HT4PiMDsy8yxuFm7jZO
 a9y6Vxo5cV3Z8L+3dpt9wuUYrk3ulN9qqveTqmJPxJPV1RhsSP3Oye34Jec/xHdpW7/9TuCfqg7
 7MS09ZCTmXTFV49bUU2ZWxNpt6bXxmkzxKscOWCWjCBxkv2EPOtpfJOiwcqI6jFLmAEeUvuawn+
 JrpljTOCPR/vImjQoY9PrIysHSXdRMmUJSm3esKdBJ/v9tRGdSGbZljPFPMVTSsN8QuM4wmvZrl
 S/FTNpo4Fi3JeDgBXkwgciZir0D0w+3r228xSQE6oaL6H91Ka+o+UDfHYVzEW/qz42KnRKyQ5B3
 dAcyuueMSepRczp39bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNSBTYWx0ZWRfX7Uqs1MEFqgcm
 bddJcUPutzSrN7zNjDD/FCMFhq1/VvjHwZBxz7adHez0L9wnoNYBit8rja7Or9K6Qizs3+6TWZH
 lF34GawSXQWbUFfB/YO+1yTsCOCIpK0=
X-Proofpoint-GUID: fwyHq_ROJKGfwYmURwf9VsYa29jKw2s1
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43a79f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YUSBgXEUuFXLcjEF3eYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115385-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D5E26E3AB8

On 6/30/26 12:23 PM, Kuldeep Singh wrote:
>> qcom_ice_probe()
>>   -> qcom_ice_create()
>>     -> devm_clk_get_optional_enabled()
>>
>> If we remove the _enabled suffix and put a ice_resume() in ice_get(),
>> I believe this is no longer an issue
> 
> I see your point.
> devm_clk_get_optional_enabled turns clocks on, whereas using
> devm_clk_get_optioanl will only get handle but don't enable clock.
> Please note, clocks are needed at probe to read ice hw version 

Right, but we don't need them afterwards in the probe function. We
can simply gate them. There's a parallel effort to enable runtime PM
in the driver:

https://lore.kernel.org/linux-arm-msm/20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com/

and with that all you'd need after getting the clock is a
pm_runtime_resume_and_get() before the version check, followed by a
pm_runtime_put() right after it


> and then
> later ufs/sdhc fetch ice instance using of_qcom_ice_get() and control
> suspend/resume path.
> 
> But my idea is, if storage itself isn't there(like sdhc on
> qcs6490-rb3gen2) then why sdhc-ice should even probe and check hardware
> version? as there's no significance in even probing ice.

On the developer/customer experience side, would you expect having to
manually enable what's essentially a sub-feature of the storage media
on every single board?

Konrad

