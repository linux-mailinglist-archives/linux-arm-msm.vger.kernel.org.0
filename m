Return-Path: <linux-arm-msm+bounces-114527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gSnOJJAcPWqnxAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:18:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F61A6C57B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:18:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fxBlgpy4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DxjGeJHN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114527-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114527-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0FCA30581B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BC33E1714;
	Thu, 25 Jun 2026 12:15:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413733B6F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:15:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389736; cv=none; b=LLavtWUWxuzOL+TsuvcqptMY91/jDJf9p96Z5Bt9I38BbpLszJxHQQOBOqm4Hcb5+g/xQI6150No3SQbHX0hSAjy+03PEKM3m2PqmVbvnA+afLkBkWvhf9K4j6XCgRUZ5gEfa9raYecQB7BWB3dg6awWJtMDeLHFpN4Mn6Y6Wnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389736; c=relaxed/simple;
	bh=jNUUgutEMGVU/laTDo9JXbIf3xhGR/VCZHEiY6C7ios=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyrCtyczbLcbVqDuK4TYc/HiKd1VmYoYUbCmpVpNLRNR1TLWoWX9PlYOCOgP3OkZjYt1Duzlsk12ap67mKHYYk6HPKrSrtpvajtLQNENn0ZvclWHCeFfqMRgNdgo5ilesd7xlgnlxR8S08NTwhl2b3r6xzzfdPUPWm5v6oQUvY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxBlgpy4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxjGeJHN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jxbQ1397992
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rb/80XH8/avAPwzkDU+fMndBP7mVVj7x7i9sz/Ay7yQ=; b=fxBlgpy4gt6KeW0e
	XYxNkhYa8uZ42aGP8C4DFNF1+gRZhDIsi5R/Z7u06rs813fVxn7gzEgly7N2MzrB
	2ZaJfK16b1tYVbq+xHdTY+dAMuM/ZVKNnKvMBrx3cDJcYlGPTzMGBDHs6EpnAUt3
	JYSMPqOwmVHFCwHa/NOUxBvYzmoolRcMD1/KoRv4c7jcJ9wd5SlqabnOb99gUkFi
	lHBAKa283EosQbpE7Ry4DzPKL4pdn34eSruVpV2A+C9aq59nTe811roqIvftlwsq
	Q9i+47oQddQf2fLfuM9yk+MQznSLFCCM3VcvUZhXQ5SbpAdoebfL/WndXdv1i2me
	kYZ0TA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudj1e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:15:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915ccc2d4d2so60611285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389734; x=1782994534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rb/80XH8/avAPwzkDU+fMndBP7mVVj7x7i9sz/Ay7yQ=;
        b=DxjGeJHNU75P+w3XWvooVUYrgsdGGg3qdqUwE/IV5k7gRDEaZV57JLsUxX11NfTVVt
         lwkeq4EupX5K5IN53IVdVbAMb0HBtnoXWPJh/VFfOsmiah+phBvYifhI5GMKtr3kVUuk
         SpVmu2GdDG2OX3+JdQBOVCRk/4cgIby3xow5u1qcSBw8mOaEkGdiIlotOV2DR66k49om
         72epaWTcphJwC6fmWvFUEvx+erXqOZM84Ht3HCt5VXahNjcsUWzU+WqnFaZk7MaYqCLY
         QkvodFle67/FRQsSSxtvJBW3wOy3Hlze5moxUB2f4UjvZk8FCetj5Rkxq5C4q4TqPrS1
         mSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389734; x=1782994534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rb/80XH8/avAPwzkDU+fMndBP7mVVj7x7i9sz/Ay7yQ=;
        b=K698MVh5sgyKqGuLYWYcONw9FLBei7dGB0y26cyScNcX5rLS30dyVyX1N+jFDPb00d
         cPY+6F2NE6oZFuvWPjgS00qskVbkmodvSGRQ6tiN4O23/BZLHQF4fAcyaE+LTW8/aTu5
         VSPPeroBjrKtnSGrnpPCX5ID6AaQPF4XUhYHt42Fsl+Qe8lzTo5MVkz1C8rnR5KlXDdi
         DEjsDPaZ8BIE8WL690rQWr5bee6tZ2PUX2gWbARdMx1tjZIAHhdbaZy3FJwahzkzwrx1
         rZDyZOmj1cwPWqCyHMifZ094hpP9t8x9WQGoZJOF3+8aYKbrkeUEQg3erIeNCHqizul5
         9zAQ==
X-Gm-Message-State: AOJu0YwapnPO3Ec5BJ91FWBqaQsAHSQF7afWCQGnK0ouzZvTjcKJsun/
	KCw8+91t7kGNc5BaaeMDSwDHtOqWwWXeR8PDckKjNiKvx4ePPAeq5nVpCt26UpufEl2iFXtv6Yi
	MRZVKTQjGW83NPn+28m3aR0ncGNeWTcz1ALG4zXRaAkV2SJxJpKE4j/35gD1P5bTxCXCr
X-Gm-Gg: AfdE7cmFweUDBL1wBm1MiN4kzYg+RUKLLYYB2FnjY8pX4i2e+bP9ZPg6r+iuld2asq9
	RoqE0HRnpv25M2/7AHN6IVkDBNiWTalXnlBJwDoAeJNr5SvvOSoxYx7bAr8rAURlIUVZrVTgqPY
	xDIdQ8Sf/EJ+KaA7RRetudhMIFKukRxFz7CnIRr/WKT02i9OSyi3ljt2btng0etqGPwMgSb5vOp
	eCLpXo692Q7iSs0MLtEd24c05wW/PaYj9oEvHKgd4SufE3eY2NgpmhG8V59ZmfDmoUbre03PuVL
	2JGG17qJVJhFuYG2k7JcwP3/JP1YewtRJAZiuM5z4TVFRUOOz+dP6hsREGGKJk5DETG8Lf750e4
	VVoTPnbFVvPfTwR485aQPuMpIaeim8nALJWM=
X-Received: by 2002:a05:620a:44d3:b0:920:6579:bee8 with SMTP id af79cd13be357-9293b18b593mr200143285a.1.1782389733709;
        Thu, 25 Jun 2026 05:15:33 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:920:6579:bee8 with SMTP id af79cd13be357-9293b18b593mr200132785a.1.1782389733119;
        Thu, 25 Jun 2026 05:15:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe0742fsm167225366b.34.2026.06.25.05.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:15:32 -0700 (PDT)
Message-ID: <f30f09ee-a474-4173-a05b-0acd32c16927@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:15:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8250: Add cam_mclk3_default
 pinctrl
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_D4AB219A942591742C3A6DA4DFB0EBA49505@qq.com>
 <tencent_47473BB31C9142449F8C7C1BE69D9071510A@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_47473BB31C9142449F8C7C1BE69D9071510A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNSBTYWx0ZWRfX7KdfPydUKmFM
 2H43wJiwDlanRMCDTQAuwl5DXQvO7FhMhuU/xVNj67k0jKFYFWQI/G83EQpHKa5MLQLhYRmRnyJ
 k5r6gYjUpTpYk0s428urkSgNq5KBIxY=
X-Proofpoint-ORIG-GUID: 9igc91D4VHzkoG1WClj1LWw6r84V2yx8
X-Proofpoint-GUID: 9igc91D4VHzkoG1WClj1LWw6r84V2yx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNSBTYWx0ZWRfX4ocJjzP7J4tj
 m7N/zHJYDsxKvQ89nkhJub1BZlQ4f0J15sLWFNMadSvfuMlKF14J5ldDy8y19/zBxgx2sUiZQ6S
 nexZJtoa2kFynSyJg80vsLs6C+UlxXGKH8360+WKFQuKE0KZcVvObTNkLMA9goYOpT2mI7Th6TL
 5wgnblTsGJwQnnDp1BzlM0/NGoFpgZmIJSk6/TOaBhaehrtAcfUt9iEPFCJ+ZETlCgQlVzegMHt
 CVI6hWmyS+myrKHWZLzhBRM/qq+c5oaZtxLOSd6w1ocEa3vlV2pMAcNs26RwaFzFjhxN+axTxK6
 bjVoojQVZHMJbl4MgIT8JXBD/ghjP1zL0XzJ+fQ36XL82tjrRmasuY9+1HNzhsAjOP5ddUbh3bl
 QEAAepgWsD5NIeKESMQGyMHSsFHu68jjX5PpS8eh+NZvTlulImJktGjyLO+ASfBHgwSdPdhY7eN
 e7SINi7HJBkCw2+0gkQ==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3d1be7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dZbOZ2KzAAAA:8 a=EUspDBNiAAAA:8 a=fD-KZaBPAyyIcL3pXmkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114527-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xxsemail@qq.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qq.com:email,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F61A6C57B8

On 6/25/26 2:05 PM, Xin Xu wrote:
> Add a default pin configuration for CAM_MCLK3 (GPIO97), which is used
> as a master clock for camera sensors on SM8250 boards.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

