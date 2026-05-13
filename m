Return-Path: <linux-arm-msm+bounces-107444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO/bGQ3LBGo3PAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:03:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F853984E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82CDF30DBC85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36ED53B19B3;
	Wed, 13 May 2026 18:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ipli4z7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cnbi6zYS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFB63AF674
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698539; cv=none; b=Re5MB7rLrpG2wDBRyZwzYBtybuAuF9eapQ9Mh/wDtBwnMWIoNWHkYBnfPWvHoPF5VATuX7o+woX7UtH5kGChKZ++tKutQyq/0uiJR1pNRWRvzt3VRNS3olxmF8+eT7H+Sh1CtcCPx0jPoFUGk7holOEZQtBGishqu6MphAS0yE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698539; c=relaxed/simple;
	bh=7d1MCfAVLf3Qy1Ocyr+tLbR08cmldGisnRLHy+zPlU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/pjiwUtTaAUPaaP+Mf4f7LBmzoQgCYm+DXYRWvoAHiUvHRudh7j5EnGyPp+bMWlrVSLcD7HjqPnRKCGv6ptqE08RTbgKPKTRGh/TWLcodsYVcXkc0rsjPSeHSZBxiIk3pkFBunrgsgno+WtpW6u0vWYjC80M7qQU8me7Yzf8bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ipli4z7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cnbi6zYS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuv783996773
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzeRmqZFTja2xkxb3awaacB0WgZ4dRBKwAgkhMjHsPE=; b=Ipli4z7r9MYmSUKv
	Uxuw7+hnFKKWSrdcYrffyUEdeZLsqZlLB7URTNxUI6WVvEg+pCoJsKg9vsFsLGtq
	1ymy6NlJ0pgME+JDUNEhMl9zbLid+lZ/6p0E/cFX4qLsWek7RAEQIV9RyFuJ6QiU
	c5ILbA0+JzwepAdqAySkAXV/zKzLxRUsztgseuBjcGbset0WKxtn29XWtVmBPG/h
	5R3HxbDG8uH9jI/w1715Q/bkJT75QbTI3UUWHx3Ml9jm9NOVzHstDSYGCy6BW2Xp
	LkJgPjLHNcBcU7RlB/px8nEK+N5iMX26H5YS/8RQ22yntkINW4WjK8LMCvkSVB/Z
	g77zqQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8urgtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba838d3fa4so78791085ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698536; x=1779303336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LzeRmqZFTja2xkxb3awaacB0WgZ4dRBKwAgkhMjHsPE=;
        b=cnbi6zYSANDtHdsAgp7eej0Hlt1vrSK5pPOwMC0ATKnxQdpROh0v8AetTesen0MEaz
         DPQ7SmOPJ8/keYaC0PnUMOZ9vszUnlsC6fr4/nvEerkMgeQnvc1j26CDh/O3K4Ty7Qat
         4WbGZNQ4KsWY4golXquudfB6+Eaotun7uObQK2zsnGbkocqe+PoCSmB9X9oDmON5HAzK
         fJcF9Aa0K+5bjLUbxF3QuXE2wHg0SnJO8Zhvl5/mNbFXkMciV6jr53msCTyUOxxr5OiL
         DoUFwotmaRFDERApZFI5WlewgCx3AIedbI2j85kY2JHk6cux5OId6mCtys/EkrrswsZD
         ztaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698536; x=1779303336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzeRmqZFTja2xkxb3awaacB0WgZ4dRBKwAgkhMjHsPE=;
        b=hmD4NFX4AcyvitBtWwkvTNAJSPYSjTGBZyR3HPbMSA84wKfzBBn5+kmMAcCnUc1qvR
         behCHnXdT7jo2YsoLINnq/NkCyAdaT5hdBEw91w+z5eTvz9JvtnOI5TjlmdJmBSvJxik
         Tx/aJ6GzD+64xvJUPj4v2h45QufQHw3QM7xxFLk4aQIZ6TNLImWlp6/L6NNPfiDJrqhZ
         fqwL27I0e+issHDXMOYAdH3dTGHHn2JKGOqfNoJ+xerF3yIndJ1vFBH09qEDlWcOgzdu
         Q12RkGW8DVi6u4e3EHIN1jeWGSxRC/pA1SOraqMc9em/yFhUr2zH01etv7CIJkKWQ/gP
         DFug==
X-Forwarded-Encrypted: i=1; AFNElJ+Te1VKDia+7ykkcTVyA5M7bAbOslJCUN7h+T5e8atSiEVyXVfCd77/vJcLa0wILTep+4+03z0iTOKKByvP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nBzQKZS5eA/Oj6yv2GdlrVU4huJpqCXwM1QqyCQ58fNgt2ux
	JtHJOZh9LKYQrnhVu4LlUQzotMcQ4hCB8Tpm0g9rOofgxDoFpF0nm/saLYK0rRivyHsphAxiLyN
	FNCpd5zLlJdo+JhslxKImgCXKhsFSE92JSXW4o+t5adek6XPtcYs/BGPdA8NLtwG+ed9v
X-Gm-Gg: Acq92OGkFNldMNLuVLvTAIgGXxiMz90Rln7jzfjXuP3X6bJPeCCtTjmtZvjJDKd8GJC
	bUaqyYVW7UCHUXsrRVTbr9/IlY/ofOcnF8/KY5PuqKg2JCOCYoIsolm0b4NMYvAgxtM+JvhsbZD
	Av7wF4ePVRnpILXQ9vMT8IE5yDHclB/CsCXvhkvzr8P/W+nh7HiJJZTJ5WD3eVloDCe9vWiEO+e
	etkSTCbaW+KqDx2Cqk2QpRRUPiq5OuVFLDnGNlb4QxxsERV5EVoAdn3m92ca7cIAl1sHGqYGwz9
	Z1tB6jg27oxk4GEulpQSsElES9f2jJSCWDo7CeHk++Npw5FeE7FFpbzGAEwUYkzmj7pnkyLTw0Q
	7X3hn+cO6SkniTZLQj5xDFdoMwSlT9xwxAMlISmw+P98wP5JhTAnOSTByLqb55Kgj
X-Received: by 2002:a17:902:d486:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2bd3020f39cmr43465685ad.32.1778698535773;
        Wed, 13 May 2026 11:55:35 -0700 (PDT)
X-Received: by 2002:a17:902:d486:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2bd3020f39cmr43465465ad.32.1778698535323;
        Wed, 13 May 2026 11:55:35 -0700 (PDT)
Received: from [192.168.1.6] ([122.174.188.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e99be6sm167582685ad.68.2026.05.13.11.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:55:34 -0700 (PDT)
Message-ID: <227972f6-7de9-4b70-ae51-c27ab5532c01@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:25:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add support for qcrypto in kaanapali
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04c928 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j3xDveksUu0zlk4lKs6shQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ha7b9SRUxfVPAdQjIlEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: UkqemecndaTDj9pbrtgg1w_wPX1mZ8wm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NyBTYWx0ZWRfX1zg3ZEa/2d04
 +48i4/GGpcjqQlwg7rCmXeikSYOiS2yECpxd3x6RbS3u+sh6PrfXOjVfSYUa/g5EJ9eBTlEgszR
 GyOHwpum/eJxrgdEoM6N2Ki3e++R9pHxGkzwPXfohC6sck8v9nFuYWizjhQolFnwhq04wEEykUh
 MNAFgWn4ibPYUuWSXtNpDy8xFwy4uJAjplFyBfpm6rMc2WXMT8FDCs3j0UChWe6nOXexFx3rYja
 qL8GX/Met9TRL/AqTHeJL7EOPpwGlujZEvJ3j+RZ2vUau0EUW+kUGljUJff5PR3WRsZHx4hVSw7
 GMIig5Q9FYH/dPjUlSywlY3l+aArbzzCugBFCGabMbeKRa8xSZiI3Isxhs743I4vfy7XtrrKQt6
 c5c4hU1mMQ0GIe7akcvi2EP5HdOGaR5adIKLaLm7y2pyVUbP7sz1HnS4mDzA8izx8EtW6qjJd6S
 c9Uzy2vAnarjsIv4zfQ==
X-Proofpoint-ORIG-GUID: UkqemecndaTDj9pbrtgg1w_wPX1mZ8wm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130187
X-Rspamd-Queue-Id: 294F853984E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107444-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 14-05-2026 00:10, Kuldeep Singh wrote:
> Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
> Validations:
> - make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
> - make ARCH=arm64 qcom/kaanapali-mtp.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> - cryptobam and crypto driver probe
> - kcapi test
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Sorry for inconvenience.
There should be v2 series instead of v1.

v2 series is now sent here.
https://lore.kernel.org/linux-arm-msm/20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com/

Kindly ignore this series.

-- 
Regards
Kuldeep


