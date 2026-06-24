Return-Path: <linux-arm-msm+bounces-114318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vgAgBFerO2pTbAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:03:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB8F6BD2A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:03:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i912ImYp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hsYswRdY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114318-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114318-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B3B9300889E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C8E31326A;
	Wed, 24 Jun 2026 10:02:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166CC3AFAFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 10:02:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295339; cv=none; b=fJud4HtQ1xJlIWoNOriWLX0rZ9b03dtvE0IyiNxoPfl2GVFTfIPcdTYCLnnmO1laMkNz7qFMWu6O4T5YwomRU4A4JHllZdLFRQCjIcT6wSQG9EYBqTQrCqdK5EtZAfqUnTJHxU5xJVNWQ/vgDCpxDOzpYmM+nR3YZp1hpFzEMy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295339; c=relaxed/simple;
	bh=c6Ala/LN35OCe8hXY+Yh9WQlpumX9jDypGqOUneSwK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLBKihh9QFVCEMAfy98JUO7lIr5Pz1CWwr6PrlgNqi98UW5vw7TVxFrdDvJQL0TO4ol+hEJJER1Iia3qF5tkJKw1r3xdfGAD+D+MoU7nBEXfQuJ02fbIjGn3KsdLestRxkqcnQGw7BjNJ31zoJIOVS/IHMyFentdinjbLqKFk9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i912ImYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hsYswRdY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tsT12522394
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 10:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twxRHsMOf0HD8oskwLQ/k7b4y9N/FIiZfGPn5dW68Qg=; b=i912ImYpBHu7kp2O
	IUm37zBlMJo/sNrw+cbrakYxJLUEbSvSflXxqtWSr+EkV6Lhe0GOQpjJF6MHgCJE
	YV+jTLX2ocfi6gh5PRNQn5lPft8N+RkGP2NYMynk4zYa7wtSzpjBaqROSOiE1AeY
	zIjFWeWoeakxflp/4Q6wyPQA6vSHx+65LNkQqucbWPF1KjZUNcL+JoFFaClKEtGq
	EWya2guZc6WqYO3YDTMa1zZIcYP+tV+DfW76jj9S7ECG9C41vpNcj2eioF2kAvfL
	JLugNKy80fXhcYcgpDU3/2E2+H8p3x3TGLTTRQcAmZjb48TGLmuRd6+eJ9/fziDF
	o7DmCA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajhqnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 10:02:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c889d1eebafso1141717a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 03:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782295335; x=1782900135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twxRHsMOf0HD8oskwLQ/k7b4y9N/FIiZfGPn5dW68Qg=;
        b=hsYswRdYy9lJqy719hH9y1QJKMd4xE8wUEcHlQ70HzVmds+OJkiARYvyazL1Ax6pCP
         nUazQ1cS7ThznZa4iawfYxUhHdKaYs9AnIOtAXm97f5i5R1DfqCPrSmuOvAuhstphoMW
         MZHCkZ7WAjEF4gi4MHi6wJBMFCe6sQWkefhvS3BHC4ZjzF7DnEQSk4QU0mStLoe1RVD7
         F/+x5XplCTa+B2/aOfWJryZVuY0RTEHE2cq88H2bQVpefkyHcy8aMTvvQQOjnX7Yvgr2
         xwK7WjLjVZido9BKEFwRH8Ujurb4rj4mYwuSXV2EYaMZ1CdBldiJqedytq5Ewu0Zvc9+
         9/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782295335; x=1782900135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twxRHsMOf0HD8oskwLQ/k7b4y9N/FIiZfGPn5dW68Qg=;
        b=WBcCANMtjEFY80yaxzS968q2bcPbNdNqMDHeIcoIZpaHLdJLikSH1EaqZB5zEgX6kr
         EWgd0YcEkRWKNFDoK5NLbYYuR5OnArKb+7xr6i0F8t67POGTpfVYZ54XbHWdBPW57s/G
         I179ii/38nMfO434tidyJ3Z+JfQ9W3ZNm9lxFqtw9DDupiB6pG9mRHYpF/fK7gJd60eN
         Vj4Oyh8/AlPDZusG4nuRNssAO4s6CNAdcW8uH1ctU2FgB7FhLDyZoiZYspnMBB3strVA
         tuCyM2e2eAaNF+TPK1vFnxA37LoCZZjj3seD3E7xC/K8zuZONU8Xk/ib22Z92A4Dimyi
         Gxow==
X-Gm-Message-State: AOJu0Yzi9kCskX9r+ikPPxEmssVpyaTx8uVSHRfZCsyT6brmixUboRZW
	S2/SXezFREZvl1CxiX6cVv3qbZHjOF8xIsRJjaupOf/MAyOJIBbPDRSTfIUX74ZGWX5z9lLZrRx
	RPUXUEiXXL4DDYqKnb09VREplfweX53e7UknPyL9ZcM48mN5MncB+Uc6LxOldFerPGFDA2cKfSi
	bX
X-Gm-Gg: AfdE7cmhh4fd817kNsrr1Y7+hoEZbXc7Io4n3tlYtd8oGcgrzXzmEaPUkN6xzPzDOh0
	fysIA/HKLUJRB/QsN6yEBPcndi7WGhHkGWHqR0phrHzNQUOXAm602wJehP0GraSbvtgoWv7F8S9
	sYYCFJWv92rmBbBCWiywrv3Sxfws/EXYvlGJ+Wr3CUYDLhjP0GZf+IsQ2V5Od9tt8fe2EKmBWGI
	ag85Y7oXJPnfOzpVFcNGzIZrEr72WG28Sj9LIQE6B5xcehzutcK7uWgLoU1sZySYY5cuZKOXNDq
	zQDgDTj3bBBBOlR3t/ZIuUUuf/pYXz0wfEU/yibiBUHhRCiEV5GxPqVE14VITs+3PejYscf20Ej
	9cgp/D0wxoNnWYCVZmLLo6V5On32TYPXG6UPygShqzChLVhm59KG0+hTBtIiX2dojAfiGZ7wum1
	ZCFclCddVyIM6WPIiNSpbHXmEOVuYb8g==
X-Received: by 2002:a05:6a00:3a25:b0:845:4e67:1500 with SMTP id d2e1a72fcca58-845a2c82cd0mr3806479b3a.24.1782295335625;
        Wed, 24 Jun 2026 03:02:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a25:b0:845:4e67:1500 with SMTP id d2e1a72fcca58-845a2c82cd0mr3806431b3a.24.1782295335141;
        Wed, 24 Jun 2026 03:02:15 -0700 (PDT)
Received: from [10.190.200.172] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7casm1795041b3a.18.2026.06.24.03.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 03:02:14 -0700 (PDT)
Message-ID: <65362ef6-eb42-427a-8499-23f609621369@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:32:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Move common board nodes
 to shared DTSI
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
 <b61ec109-92db-4dc1-ba7d-a5ce79fea08a@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <b61ec109-92db-4dc1-ba7d-a5ce79fea08a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MyBTYWx0ZWRfX5Gv+RT+jmUUG
 80FnQ2XO6aY01B4JUirX7TTPpKQccDFouIPJFdAD11Z3xoLicBULaZA4XI0HCViWLMj0814E+va
 +B/yWLrqOwP5tNEUB7jo/pc9Y41s5C0=
X-Proofpoint-GUID: 1viiQHcMWNbPkKm-eb_uY3fIVKRmFPMJ
X-Proofpoint-ORIG-GUID: 1viiQHcMWNbPkKm-eb_uY3fIVKRmFPMJ
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3bab28 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ERXISu5ESIjULu5SvvoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MyBTYWx0ZWRfXxq6k+GhXfyDX
 mQlkT4rnUad70MNCY1Db8pTprkc7kYGlXsoC8jojsWXafU2ljGcbk1L5/yVQZ23IDmNY+qIe1gP
 mTU7XgHYQFd+Bs1X7PAyJlYkis4k5nLK6TMSmOkupRYg5evfDfE50tVOcbAHBTkcL8rwJUSE/Qh
 ZRRZXp8yJJLRVUMQcyBvRsPIjWvJIW7QG8HQRcMXfEBm8+6IFJ74B8GfGauQQclkSiof+hqwoFA
 /YmciXYsc7NEXiH1OjlWSw4GoClHRRShIUIwoCNaGyhp2CYCsglWYpxyJoLwVTvN/4S6KAoK1hE
 mOdrtZtGpQlF85emsd5LolPfzfK7o7aPdvu/WuuOD8al1yjuxk3ZlcguSXc/IPsKdBSFwvKTrxc
 0UjEcUFcGbZX72QOFwbIL2lGp/zgmyXIt3roQeq2MGFy2w+lEGWXqZpstIFZjcq/DNyB6dWYdbR
 2cwQNe0Opf6VouI4A7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114318-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:gopikrishna.garmidi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AB8F6BD2A5

On 6/8/2026 3:33 PM, Gopikrishna Garmidi wrote:
> 
> 
> On 5/19/2026 7:55 PM, Gopikrishna Garmidi wrote:
>> The Glymur and Mahua CRDs use the same board-level hardware for the
>> eDP display panel, MDSS DP3 controller and PHY, USB-C ports (via
>> pmic-glink), USB 0/1/HS/MP controllers, QMP PHYs, eUSB2 repeaters,
>> HID peripherals (touchpad, keyboard, touchscreen) and their dependent
>> regulators and pin control states. This has been verified against
>> both CRD schematics.
>>
>> Move these nodes from glymur-crd.dts to glymur-crd.dtsi to enable code
>> reuse with the Mahua CRD.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Rebased on top of next-20260518
>> - Updated subject to include glymur-crd scope prefix
>> - Rewrote commit message to describe the actual shared physical hardware
>>    rather than the code-sharing intent; the commonality was verified
>>    against Glymur CRD and Mahua CRD schematics
>> - Link to v1: https://lore.kernel.org/r/20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com
>> ---
>>   arch/arm64/boot/dts/qcom/glymur-crd.dts  | 399 -------------------------------
>>   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 396 ++++++++++++++++++++++++++++++
>>   2 files changed, 396 insertions(+), 399 deletions(-)
> 
>  
> Hi Krzysztof, Konrad,
> 
> This has been waiting for a while now and already has a Reviewed-by from Dmitry. Could you take a look when you get a chance?
> 
> Thanks,
> Gopikrishna Garmidi

Krzystof,
We've verified from the schematics the soc gpio and other lines do not change and are pin to pin compatible with glymur,
The only change are the external peripherals connected

Thanks,
Pankaj

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>


