Return-Path: <linux-arm-msm+bounces-117838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zWyoDJ4wT2pjbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:24:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 678C872CBCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:24:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a35GQmGs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xmko6yvi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117838-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117838-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E8213028B6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 05:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D44395AEA;
	Thu,  9 Jul 2026 05:24:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7238E8C6
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 05:24:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783574678; cv=none; b=gT69S+kW3ehoSs6hzeQHGFPA9Txl7+ootGtNDVqdtHrzcXLLh1slanh+ktZdjnxZLKlxLe9C5JsWGMYg3zMKCb7eHXuIz0CIQ1zs3GuCWBA9cIGtXdQ93HlYgXkBvuZbAudMxglm1w+JCaVzYgxVrtr2Ze4kq2gFMeLSLvg4zxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783574678; c=relaxed/simple;
	bh=eCEmFNBKDCUgi/XpzjhkSQjXE6ML/LWB346kaTFfFn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tXgIy7/TgESLcoMRUnZlYF9FJ1j1yjMR1ajZktAn2E2HhRg/NxGXN8nr5X8nc0py15sQxU6lNAZ97v+fbmhukhZJS6Ror9KmUQklCx8gKjuOW5uq5M3cqeACZMpTr4rCKqYmc62zn7w0yQ/CWebUac9YdJAVhbLgPrQlC+qPX2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a35GQmGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xmko6yvi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N9GbB4055658
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 05:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VD1AdfG2BjNXiv/VHQwI0Lnl5qw+Uds4QKa09TDo4ds=; b=a35GQmGs9wr7rn+0
	ZhoGjA7yyYan+76zASJR+jiS752KDbhgRM8t7qeoBOi20HePqfqTSRypLPDCpRAd
	cDO7i2YEaOafS22jzgsocg2l5OCEh7Q6VqxI4r+DhrQ1IOMSrh7qzpzrMsTVLMaa
	jtqtK5e/b5in5sCvRTAHuwrQq/kBtbUZWA5/oaGtm+99M6SPaSWOI3TDxBSljlUm
	S9QvOav5tq6V59VvbeilyXBY6UbYSOQr0R8IAQ1L7Ga1E7lpz0abA1Efq3GW+8D7
	wHdIjX/wgLt3XeH1j1TDCiUDCD4QhXNa+GJfecbvFsWjC5kNA/0q1SG+LQ8rJ4Cf
	MZwquA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfsdwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:24:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482b95574dso1720687b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 22:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783574674; x=1784179474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VD1AdfG2BjNXiv/VHQwI0Lnl5qw+Uds4QKa09TDo4ds=;
        b=Xmko6yviZxwnc0Y5jFf8MudMF/CzgrsLOlhn6AlGCDY+oxfRMFunB1tixTiaM7In96
         C0v6xkXhLg86djeXv5XqcaZNjcyWZUE+f4bHYPSDwR9+hFrufDlC11sS91eFV4DMK2xJ
         MM3GYdBN92glMtUYIe6E67S33Ue9zHxARTilQzIzN7lrB1PUHqGsCRoLROcY+i5UCPKT
         kDq692v2Tsu1Dxiq34HupMBSVAeLYWAQvMe8KwsGbskIqORb0iGyPikaT7Ln7KXdggnT
         DzQ4vvPOg5Km/elKl5AyY+VqM0rhYfYaPcImkDZtYhfHxTzi5uzG/mVf86re6UphnLG6
         ZSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783574674; x=1784179474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VD1AdfG2BjNXiv/VHQwI0Lnl5qw+Uds4QKa09TDo4ds=;
        b=pUs966udkeCxmGZRaTvy2BrC5Li3fsnRWmSW5JyHI6XbVIV61CGAa0pOTIR7MxnBbK
         oGpHuyEboBYuDc5fms2tgXPI3mPPTmq0QOn414/AyoEnMQByHwlVzGyJyg8qnNtc5GpG
         EUCpxtjy+kqZDjunJsCfoMKpMJ+wSgd2cGoJfQOp9sfS+IDEYU3P6rPWLVsjDhRA+5lC
         yqGRHopxZJJmVxZYYxBNVVIUEZ2eQemRokUHwDlc8EovSWQb9GCfvfW9aktJ/9lyVbA0
         4VkQRjbVTdDbOoMWQrHmOgc+GmrG1zkNF7aazPiNJi6u6Ow7BXFwhkoGbHDb/yrspsBs
         M1fg==
X-Forwarded-Encrypted: i=1; AHgh+RqXq5zigGNsV7tRMbDLIyV93ggv4gbTzMclKbVMbyHF0VucL4xhHlxt6bJkM2vFdHAJ9uA5Iq8znokb6B9I@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxtY//HNcxU2+OE6h7YJJvCil8Oq+kCzaX9GkAYp2CuQdA7Vt
	NQyJGRFV/enDlnIMUIDitfHN9O5bSbvlp5Ego+fNl65XHbD5aJT9Q+HffqcD3pSjWt545kAZWI9
	/4i1ax4Z6KEGIhICCz5wBDKYY+Xc09gkeyEvsXB5EzLEF9c/pFQGaQD8ZYofbGPrtsw+o
X-Gm-Gg: AfdE7ckY+wPyWkuIZA3VP5un17QIJQv8HBVQjlkk8pxISGxOEtJbgFISpdB4dtKgiOI
	coO7wg/dvakrXvqsuCBgAvBLncfOZM7tdKe7R1vw9Soso6LaexYihXaibjxkAC0gvBw2J3SCwgl
	JHCYghCRG3ddHhST7pzF8hSMRnwD0mLWLfksAxiEWI6deEdabzNdzNpDdQTeUEvV1wyoS0sBqGG
	Zem9XUc02neqms2LKe4s/7JrLQ1AvM4dDA+F+VSyt6KO3U/uVuYLgpIPyQNINcRgigA8TngIw1l
	1ZcR9RGdXXklWz371JKecz//pk4Vvqe7Fy58//DgWWN6zsewQW9qhhpNym9n4sPbWxJlUfevlVn
	suksQQyUgYwhhiwDqt0+VKe58MC5Qfl+5+l+Xqg00GA==
X-Received: by 2002:a05:6a00:c88:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-84842ebc27cmr4969623b3a.3.1783574674322;
        Wed, 08 Jul 2026 22:24:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:c88:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-84842ebc27cmr4969596b3a.3.1783574673765;
        Wed, 08 Jul 2026 22:24:33 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8483d117a1dsm2382038b3a.37.2026.07.08.22.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 22:24:33 -0700 (PDT)
Message-ID: <6f179f96-fdd1-4fa9-b26c-df7372eb6d20@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 10:54:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
 <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
 <2tu35aavp7sc2npni33ky5bve57idzy3bzp2pk7eh5lryq3r4v@gmm3dhayu4cf>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <2tu35aavp7sc2npni33ky5bve57idzy3bzp2pk7eh5lryq3r4v@gmm3dhayu4cf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA0OCBTYWx0ZWRfX80W1Svl9cf8D
 RABcxHjSGFhM4ToXoE0bzsufcC+ioSkLzQTCMniwKIT/7+K5YiNbpdxg8nmgQypUuVOj4X1OMJS
 WCnFv6fbFJqXOQ7/lTyJ39DmuzLqDcRSyDlXC1fmjnHa/bApsg9+4JFoXjd7aEuspGpY1BSW0V9
 5EqBwC7ugsLFQx98vzKxRCZ0MHK/IytMhoU8TpGWjTHP+tEIQu9vSykGU2wY4HiHqb2h5X8O60/
 lt2Azl7lPwQ8Spd1ay4nqAPEADlHvJTwSgYjEy/OWf88LL+nfVyWEcs8T7pbqJJPxSp5lN7i9Zj
 /BAwWB3DS5OTPKoE/Sf5QEGWVuQehlP+Ueo4MzPey83ToBjrxCQekUcAk1iynbGOlxqJqPZHBAI
 6Kep9y09tw3DWox3g/xWqvcWRhnUiz4H1asDyrM/ktleFfEz6rK4+PAufun/IIovkBhQ79MUvH+
 tqm5mks7V1nAw0cDLDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA0OCBTYWx0ZWRfXxJIGGicTM0oc
 gskYJo1BzbUlBTp4aor1l/9oes0Wb8kLiCJ6eHhjzIJiBx1J/mOU5Ovdr05vbD+7flAp5AA/X/r
 69snw2odOuBR/3CW2N55jgdWSYtvIv8=
X-Proofpoint-ORIG-GUID: 3xgDcERm1kx8yIz7NutStG-jPySBbz8K
X-Proofpoint-GUID: 3xgDcERm1kx8yIz7NutStG-jPySBbz8K
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f3093 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=tNnYrs7vTIEjkU0joGkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117838-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:daniel.lezcano@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 678C872CBCC



On 7/8/2026 7:55 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 03:55:13PM +0530, Gaurav Kohli wrote:
>>
>>
>> On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
>>>> On 7/6/26 19:47, Dmitry Baryshkov wrote:
>>>>> On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
>>>>>> On 7/3/26 17:42, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
>>>>>>>>> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>>>>>>>>>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>>>>>>>>>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>>>>>>>>>
>>>>>>>>>> Qualcomm remote processors expose thermal mitigation endpoints
>>>>>>>>>> through QMI. These endpoints can be registered with the thermal
>>>>>>>>>> framework via the `#cooling-cells` property on the remoteproc node.
>>>>>>>>>>
>>>>>>>>>> The QMI TMD protocol identifies devices using string names (for example,
>>>>>>>>>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>>>>>>>>>> `#cooling-cells = <3>` requires numeric device id in the form:
>>>>>>>>>>
>>>>>>>>>>        <&phandle device_id min_state max_state>
>>>>>>>>>>
>>>>>>>>>> Define common TMD device index constants shared across currently
>>>>>>>>>> supported platforms. If a future target requires a different mapping,
>>>>>>>>>> additional target-specific constants can be introduced while preserving
>>>>>>>>>> existing DT ABI.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>>
>>>> [ ... ]
>>>>
>>>>>>> Why are you using only those TMD devices?
>>>>>>>
>>>>>>>> More constants can be added as needed.
>>>>>>>
>>>>>>> Kodiak is one of the supported platforms.
>>>>>>
>>>>>> What would be the benefit of having more than thirteen cooling devices
>>>>>> declared in the thermal framework and having only a couple of them mapped in
>>>>>> a thermal zone ?
>>>>>>
>>>>>> I agree there are more TMDs but if they are unused for the moment, why do we
>>>>>> need to add them ? Can we do that incrementally ?
>>>>>
>>>>> That's what I am trying to understand: why the implementation uses only
>>>>> the selected two devices, if the modem on Kodiak supports others. How
>>>>> can we find out, which TMDs to use on other devices.
>>>>
>>>> My understanding is that is an initial thermal setup. Gaurav will add them
>>>> step by step while setting up all the thermal zones instead of sending a big
>>>> patchset. And TBH, that will be much easier to review.
>>>
>>> In such a case it should be noted in the commit message and/or cover
>>> letter.
>>
>> Thanks for the review/guidance. Not all TMD endpoints are relevant for
>> kernel thermal zone binding — some like BCL and cold temperature are handled
>> from userspace when needed. The constants here cover only
> 
> What if there is no userspace? Or the userspace is different from what
> you expect? I doubt we have TMD-speaking userspace yet.

Thanks for mail, The TMD userspace implementation is available upstream 
at https://github.com/qualcomm/qmi-framework.

> 
>> what is needed for modem and CDSP thermal zones on the currently posted
>> targets.
> 
> Again, SLPI, ADSP?

Sorry, I should have said "generic subsystems" rather than listing 
specific ones. SLPI and ADSP do not require active thermal mitigation on 
these platforms.

> 
>>
>> Will add a note in the cover letter clarifying for current tmd's.
>> Please let me if this is fine.
>>
>>>
>>>
>>
> 


