Return-Path: <linux-arm-msm+bounces-118738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ua5LClXCVGoLSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:47:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA57749F29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:47:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CQSPAAlU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ik3xfyT8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118738-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118738-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32F93300F463
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179FE37A84A;
	Mon, 13 Jul 2026 10:47:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC72345CD3
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:47:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939667; cv=none; b=HN4wH7dufYOFLESLITULh3BJe76aBMTCzFNmisTlgTXGAJJw302EARz+HUMozxr8XjyNH5unazQ1nksWYL83x83XBrNK4G8nO2xPu8VbOEIu8C4xKPreakEYtmpgGlbFKG26w6GFlFrb+zSt0+OM5b9CfQ40+7Fc4Fwf2/CedkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939667; c=relaxed/simple;
	bh=LHA0MGvnSeQbYiIUyIqWKF5b83gNqvEEHY2/ulyJYNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONKDR5vdBKeU8+f2AIJ1Xy1hCZrVZKb0V0HUzUAT0wMM5A5Nj/JIecLrem6dVfm8REDwa8m+9iHmU/WT8c6/alckYblDfq/JtgDgIpYhntKZfv3VwXxuNeQL82DYsruO7LaomMRPxJNmnRTkstXV2JQm+b1Ld8Nj96EvfqsGwO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQSPAAlU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ik3xfyT8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7KaVO774638
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6btB6dJhej2QcvzsGuKaIjQa+hcAkLMlewhHm8fby6w=; b=CQSPAAlUwDcax4AX
	4X5goqz74n0+lqKdO0aJV2PV4kgMvjLCQs1oI6Pn1ELDOLI+dcPpwV/cc2+MSu96
	Vf9kdLun+mPD3MNTRpGkwdyPGRdT84CUB9nEKA1T2nMyB513L/2qMEAdXCp6j2/j
	muzS3BSB52nixpkG3LyzwLHt35nqVdrFaSVO8ICETxsrX+yd5QGUMAZLX7cSdz5F
	Httdnc50HVpPNtTawX4Rg03nA2y2ExZQH8qUWS2DiXE+3AYfy60hPXcuKBngn1L3
	fMufrT4kcgJubjFidN9NT7ZK0WvziTaHwJ6myEV2HxT2UjmR6srKBq17fmLwgQ/w
	Mu8htQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj00s84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:47:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6415f279so37507485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939664; x=1784544464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6btB6dJhej2QcvzsGuKaIjQa+hcAkLMlewhHm8fby6w=;
        b=Ik3xfyT8cPGLGzo3oiGRl/ngqfeKl4rRMmlyOkRyEvNB0s3JKzeyRl+E/2wdiZrhBx
         LrPJDNryft8UIheagL0RJo0Mjrqbyxn3pHF850Zoxm+oR6mCqqvAlm8KlUxCI2MjM3R6
         14TspS3Q26FJIENrNsCqSSmMl0aRVr7s271Ndjge8v8IamgvqJ4w8v0NzXrtyDcV3C8E
         lnfrP5MDpTXUbxHpDjOF2mLZOighXOmMWvcGpM41vOBSswEoiTU0yOhRKH178WwWDuD9
         5JD4zid25AcVslJYJTvI2di0dc60Ymk9bosX8bq0PKc0tx9lws8sGr3NwPH9cdSPIwiC
         aXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939664; x=1784544464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6btB6dJhej2QcvzsGuKaIjQa+hcAkLMlewhHm8fby6w=;
        b=kfNYHJwAABY6OHySqErGa5DY7CvriPtcvriWceS1uSRyQQSm4y/r/Mz/F91xEYRJif
         tSZOPhzF4Fe18aN9MdVqCpH9skJDiquC9R4gXQC76ed8i9IdbH9yA/MD9f9NxTJHn3iK
         2fupRNVCGh/+PJiwURqfcWRhv7MIfckuKsTEHZQjkxcHlyFu7uerK64HisQL33OnTnfo
         Cv3fBfCBy6MB2VpWkaYZQVzARD+mzpVBv7bnuJWYPCpwKH28rOagKeCFkLlbYKwWJQED
         NKwYiBsj0H/Ea30SCo2cxgLZL9pNsMYv+iFkbw6woYkE1VzXFXTXkhz1DPKE6qHY3tHW
         KbrQ==
X-Gm-Message-State: AOJu0YxjljOM1D6NaqbR3R5FpkYjFuF5t913eDREWm8vDJRmmlm3QCUo
	Z1Qpgbvg+XlwmFu/hx7sdUauTashzS+JzWVcYGP9NGm2ncffysVMThYjKulzQiWGfAKZ25AqDl3
	YbfTTTgxFqolFCFu5/QzzV72CxsFcdIjMKjcmjoNdKjg47ZXD24xgs6CEY/viZ92xZl/D
X-Gm-Gg: AfdE7ckHvRIK2YrdDLWiX4oUVvki7ZPCZ6sD8nKGcfxNTvOiLZ0hz9Coh3EUrPBmD6E
	lj5RBZn5mbmB18d0u1+p2ip7r8GcC0PSOTqff3oARES+IbBchwnKKS1CePLJ8WZY4Fc/BTAISQl
	T77dhieYYxqv2F6+azqp84pf3TXgdrZDH7nGsqmF5BtTcYr36QQg/JR8rY/g3J+jFbucyeRVM7Z
	uN7Tg7H1nrK6BEMGr5q/e7W2w5SMagqnSqIQa8c6iw3EpfHv/YfK5mC3k2yl66ZjQL+/DecXyax
	g0Y4yBL+Su5vVLczE6fuTn4dXaMewkLO+XF+k+Gap90oATNxJMedsC23ouI1x6tNR4BhT7qxPNe
	Gv5r2hoEK+0QCtloAPS62bufedvjEhbPipDM=
X-Received: by 2002:ac8:7f83:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51cbf312bdemr65574971cf.11.1783939664133;
        Mon, 13 Jul 2026 03:47:44 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51cbf312bdemr65574871cf.11.1783939663765;
        Mon, 13 Jul 2026 03:47:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3e54e83sm762938366b.42.2026.07.13.03.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:47:42 -0700 (PDT)
Message-ID: <dcea3653-1428-49ee-9287-a1b27da2003b@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:47:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: dispcc-sm8450: Migrate to
 qcom_cc_driver_data
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
 <20260711-sm8450-qol-dispcc-v2-2-fc1a07ac5601@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-2-fc1a07ac5601@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMiBTYWx0ZWRfX69YDDcUasrgg
 aXLYehnUrz3duo5DZKqiGMeOqeDrommlOaXBulGwYKjXjNFn0CvrGweK9c8DJPy6i8hDGbU0l5X
 ColRX99muxIpj9pw6dMahGe1zXWktH0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMiBTYWx0ZWRfXzy71y2taEDP6
 qkytkAxHtjeVckaV9nRGeyIOXzGLId7E/ZU/A5dHJIHSWwsCHiGQdppHDRnlWVCSqGylKmOylws
 5YDBG/3FaVcJe7j/jmzDgGxP4l1Aq4b9D2XWbuyG0BfJ86CDDYKsQwF8JGln2wJk+tehe9P1zAR
 PDIPY87OgPRMt0HjVWyCbw0XH4qYgyp/KgWi618D/N2Gs7qP7mRn6VLgx8HP0ue4TGrwXXKVqPr
 YS8ksSrlq0R3lRzqesqjPoE/UvM2EwAiMVAZwhx9S7oOxxNTlBnFTiBdQSuX/qs6xrum0bo5awJ
 4lvjYnJX61CzcevbcoEKlfVZ9EKlR2UdtKLL3+h/41+abA4XkTHqZoUCicdyASOB9ZbBVxsQra6
 lONrTT7EPYFPeh0zh7rxJKz4eyVYwWpDbnD0UyuiQGgb8SXYAAtDPjU94HBxd4OC5YystwvYfzl
 sAANCkIsPzFsGiqMWUA==
X-Proofpoint-ORIG-GUID: c6UhRP_PEtFaaT8eBnV28d-TBjAlWGRh
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54c250 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Nrxj5gcjSbdtpE-AfN8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: c6UhRP_PEtFaaT8eBnV28d-TBjAlWGRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118738-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:lumag@kernel.org,m:danila@jiaxyga.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,proton.me:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACA57749F29

On 7/12/26 5:10 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Migrate to qcom_cc_driver_data, which is used by other clock controller
> drivers.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

[...]

>  	/* Enable clock gating for MDP clocks */
>  	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

This would ideally become regmap_set_bits(..., BIT(4)) in desc->clk_regs_configure

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

