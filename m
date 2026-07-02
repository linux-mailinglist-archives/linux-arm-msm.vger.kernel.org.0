Return-Path: <linux-arm-msm+bounces-115947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9Mb0BrJERmoJNQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:00:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E74DA6F6531
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:00:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Kc0kFa5b;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="kDiHHH+/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115947-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115947-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7172D305B455
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEE23D6CCE;
	Thu,  2 Jul 2026 10:53:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCF33CB2D0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:53:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989596; cv=none; b=plZK5pQZmWe/vJBMrJe45blgPu2uta7viET2Q8R+3YbL29OWc7w/iXUqN8JHUNVWJPWlKkqXDZFl3cHXdYJAGIc59CFYEysOR0NPTwubMONBK+X8tZtPKnKMquXTy9H4jo2C2qlp6rQUQuuSLUmZjAOHdNUuCcawhDJ2KpXUWLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989596; c=relaxed/simple;
	bh=6U6wDTcPfBB7WCZEXQJ3tm/lEteQLn1NIyqW2IV28qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClMBq0FqWSZyuiuqnDuoxf+MV/lmn763IwwsYlTEuQu5HQ7xXxi4a27ldfsnUaNmFU2qFxpsC25OX/awCgREIj39DAkpwyfZURiqvZwLO4pguw5xG+Q8kTgsgDmK64CksrgGd2wIX+KoTB5/YbNWX/P5VY9qreGoP2u6/h1qiVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kc0kFa5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDiHHH+/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sTZP4172791
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eCfS2QL6sqR3JAm60+hzD+iml/Wt1WkpXB1sDtuyys=; b=Kc0kFa5b0Rr0n1+N
	CPGUizMo5VTQGB7CRMFllSvXlO7MWQOY7rtnn2GcFQtl2FtXqPwMqfq4Wo8CzuQx
	rAjwutY6EZ9gIT1gqcxZM17mPUufz196G97KqjCVb8CoiHkIU4kwjdeFL/yRf02F
	NqCOhgoZ2TURweEyV/6Ime6argJmikYqxJvO+9yK8COAY2whj/GGNa5aVbdrlnkK
	xnWeYG+U3D6KPQw/KA1nbwCmsLUs3r0Y3xZvXaSqNkSnO0Lu+VCGaleaEcDR4WdN
	oK8XqnU52IKGmzi/SNqSE4h3yU9Krun1S4nUEdM0k9orFpHlaXomdE+N1HqLqetJ
	Ef7fbQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwreth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:53:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so3386451cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989593; x=1783594393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eCfS2QL6sqR3JAm60+hzD+iml/Wt1WkpXB1sDtuyys=;
        b=kDiHHH+/OJkYXSox9mbHVcjc/6toUNDj+QKavxPM5QZrb4X976UUq89qMrWPF26DiV
         tARzBOOC+LBENEGwSJgUSg6AGeEkWk9+nmszH2GO4nDGfJDPwExn/ZBvMRMPB4PSxtC2
         x44lxmN07g6qQi3wP9dc7wYZzVFuZwYXrFA/0AwjPBVGjVSMY0/wnK55WEwxfRpYpWjH
         NfCqQ62f8U1wQ3SC05ic4a/QcYVY2XGotWLAwhkHCIc+iPGsUJEeFl98+0Fx99+/Reth
         ZJLVka0PUBno3P/OWILZpwktqCulXq2HhAyj2qgFVvk/opS0FzhVphGUqh3RzXfR3F0s
         tGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989593; x=1783594393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eCfS2QL6sqR3JAm60+hzD+iml/Wt1WkpXB1sDtuyys=;
        b=BqWXCJlKVoD5YT7dfycjCRhGZz6l3R9P97FNzLQu33goDHYnQ11VfIGuJr4whJZF6c
         ndqujzEg1MdRjnUQ+Z6cp2+qn64FqLP3efr9fy024mV5uQwXTi6tWsD1lIKUxtb3uX4Q
         5DujJxOK0Zt/7VNhVAFKqlq+CBrwFqxctHy180XXI5Dj32H5NebS6TTQ1zxRaONDBNN6
         Be1K3F0EpIZMk8qmi4pIvr9EwitCt2EXcaKDAt5u36q1F03PtCtY1z/FVwOzIAbUixJ8
         t6PzNcYCNZVPSt1Yj3jcc/dvVLreBUm1bGVZoL8dd+ISsSvkFuej+ii7pml6HJJJXgyN
         bi3Q==
X-Gm-Message-State: AOJu0Ywky+B2+sH6xf3e2byAYT0DvVCOngf2B/Ilw1cOwqFnLUTsCqfP
	pzQoOEjrHOSFdFsJ0yrJfOSAUTCOkrvBoAREgBCKUpRQ1uooHxAfcKD5dE64BtuZQcZcILQ2zX5
	pTLhH7EiwyPsixPgNXREL8uBrbFoRIfscXIyEa9SCmnZeP+7dGrygHjetpxpp2CuR4lks
X-Gm-Gg: AfdE7cnH/HzuFV3qn09hpg8Us+RGqOfT4DHtX/uUxxtdipkpWZrRJ99Is6PF1MO4k4K
	VH0ff8xMl2uxN+VWua32aXm72ob+MedTr6iOAwdoxv2Zue9J9+812JHwdCbuJUwm5sNKLSaSSAW
	FeRhFY9uKHBbdJ4GKY1ura/H9eVDROqx5gbbIwlHe17W0U3vuU7QrBcs85gbPCoWbErJJfYacJE
	WmVZ6lxJzaExHWM7eyXEt0AqjUEI7R9YwLmR9rSdHdzFU18pluYLNfKsMrN1LzzFTvcZ704HBRd
	WMOjI7i8uL/AvyRmAbwIRhvYMgICVlJfwHX80JATxFa4KWDEWgM6EreYu0yCqmj7it/2KBF7itd
	aq3OY33DyBrJvg3T76ARjhzCiZthkXlMDJ4s=
X-Received: by 2002:a05:622a:14d1:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c26a76bc9mr42280201cf.3.1782989593288;
        Thu, 02 Jul 2026 03:53:13 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c26a76bc9mr42280071cf.3.1782989592797;
        Thu, 02 Jul 2026 03:53:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad13625dsm813217a12.31.2026.07.02.03.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:53:10 -0700 (PDT)
Message-ID: <208bb65f-d287-49db-8b36-2b07f5284078@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:53:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] firmware: qcom: tzmem: guard against IS_ERR() in the
 cleanup handler
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-1-02f5ce02c95a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-1-02f5ce02c95a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S5rx9GdOo1Pnn6HK0smQDYOpt4uyn5fx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX445LHtV1C2Iy
 LCJF0dXOl5MoWUbpVC/2HgQWYszWvBgnOxvQ89ADoqcJzg0qcty8HSRIRKMePV0i5ShrHm/zUJg
 HdXrPoU6CsQoSr7Jd6gRX6Id1yXsD6Fdao5iZsJPvzYmm4AigtJBryy+Ey2MxGMWp2TS27FhyJo
 2O6clspaJi+A9ParzL2Uk8sGxHNiW9Nv83ly8R30DN4+Pn/5Tvcf2a/ViRW0qvnNUUijiS7KiPu
 Y+jbCsCh/3PWy2Us7hNJl1ffgvPwzBi0GlbBLVUHBy9vU8aqv5gxjqrK3TzSHrzCkjklrwSZH9c
 bRf8hduJduhdpQ44uflhGb5D6KPDCZqqiMTRX7RJN2K90q29Mzttrc7pAU4pZPmbKjpuO32AJLT
 9t5VNqKxg5xD8bfBQfhuy/CjWlwkJcuvb/sXFcH8YD4w86lD5/6HoC5duvbl8Nehrea2bZHZpsK
 73lxFtJhE1KifFWLuNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX+2WL1tY2kuFv
 8GgWcHrBlrKnHStKgHwiotwMwW3QkZvP6QMJMlcOqKCAPhfpiSfeoHv85JMhihjJLEv2ByFrhJn
 vHKN3XaIuvY8UgnMO/DOUBA7JwhPrJs=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a46431a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2mVBGBvLARuhPHERpnQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: S5rx9GdOo1Pnn6HK0smQDYOpt4uyn5fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115947-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E74DA6F6531

On 7/1/26 3:38 PM, Bartosz Golaszewski wrote:
> We currently only silently skip NULL-pointers in the cleanup handler for
> tzmem. It's possible that we get passed a pointer holding an ERR_PTR()
> value so skip it too.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

