Return-Path: <linux-arm-msm+bounces-118692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fom/MySrVGqRpAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:08:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFDA74920C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:08:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jgi2bvPh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qz44Ch7n;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118692-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118692-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F51A306A6A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832383DC871;
	Mon, 13 Jul 2026 09:03:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031F13DCD8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:03:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933414; cv=none; b=WR3G6782Z87WPQa149sMGCAfUuC3P13jvCilpyJafsfNa8/2BT5O9ytyehLt7ZS0fQqH3eOAjTjFmMdzDoVixtbQBxOaEaCzWuPXjk1sdWB31HmAVaWV3YMmEAsPyNcSjIZjIUXnZkxy/+h5VSJa2ujax+eJMc/3HPYebqDC5bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933414; c=relaxed/simple;
	bh=Mk6Pr9pZ+0s2FVgXI1qCNsSEBnRy2l8NrzYpE6dsRFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lcbj8ixFPtwNzoavv3V8N4I7GFE4LxAbGKTx2lNnawXk4BPqQo/My/at4BLDQ3bYcsWT7EWIiPwo7+DPf4GlnRkksDiNCneEA8zbv8wlL8eIe/2q6VpMk8hWjFc+RLDDdkZuxJ1S+E2tsIhnKoDRR7YHnSheuUgN2ePqcYmP4Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jgi2bvPh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qz44Ch7n; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7KgHS774881
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pyKO5h2KT4y+nMFknlIM9KoIRaomK956SubJCpkN344=; b=Jgi2bvPhDBQ6VT9N
	xKAzJgIuTiNDHKC8xulpEbdgE4hfxJI0mf4hI6nXROfiLLi25IJ2ORjxh/oGRkqV
	6q3B/gm8QcX+xBt+8XU8FVxedW+uhsRy2ZnGCDs9rX8+GaPajmBP734+9CrGDtW4
	8GiQ9ViKTC1JPi3Dt1HtkbdBf9TIRkEIOozF9ZyZsZsHhWQbP5DwaG3mq342plE4
	lWQU7MONF44fJs2QKzphsViA3xZzmzCjHJsPzHY/qf32PCEJjI6/or1WsUs0ffVu
	LZ/qceRxQ0lKbr0CmJu3P+hy4HYEtjkgRa6cyCNV2GyFyPLBL1Ah/jQUH8QTPi4S
	hjgZrw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj00csv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:03:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3841303a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933411; x=1784538211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pyKO5h2KT4y+nMFknlIM9KoIRaomK956SubJCpkN344=;
        b=Qz44Ch7nnkrDLw/gL3LZYcZVYDSTn/H0o3TxR+Ee8DY1aFc37bzEyJffbFfinJgZu5
         hEbV/I/8UvvN6iPsanUfUi8KnE6GD0jS5p5HlY50l0PPjUEG4nrbDnADGH3YIViHcUrk
         kLZoh9GDxRq/ZloujVOzPIamcnlByyTTCsASJYUdPiZj9CCZH238kwvu/pTpZDCIxi1j
         y7HZCAOX6Wi4esrCfp+gpbaemchkyzvrFpBsvfZJkKnFzLpkDJBtlRKcOV1QcK+lkuUn
         fuTJr52oMc1otunh/+R+3LbUCDJeulkDwpRTjAhX+Bae7bMjFePTgDuVA5MmXub865ZW
         cKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933411; x=1784538211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pyKO5h2KT4y+nMFknlIM9KoIRaomK956SubJCpkN344=;
        b=FyVPuyC4IF6Ja1aN5Q+t5CFITgbfOaukTvJp4vb418XkbdcbkPKi5DmpDLSfqOlPsH
         MQzEYC3A8zUWhVSm+ha3HNICsGvNY00ApDdQrgGauaEY5+b6arFgaDRnDnhYDdqMSAvM
         Lo+6wqMENEkeMSonS9vCE1k43YMX1OgGoycyf9vMwNdaVmG5qUrs1xoMygX4VSB1N2wB
         IOZn/1Dtl40VZp0XJAJ+yN8cQ4kaSoRE43tOzAa36sNg1ef1j0dcyRkbLOfmWnBkECxc
         wqp69rnELYDGaROX/7ZcXWPprlMPPBBwa/p9LDzLt17mMUSyfYMmbV3/c+lrV37MxiJP
         O79Q==
X-Forwarded-Encrypted: i=1; AHgh+RqQpa7FNVZy0LBHn1UFqFPieZpMwteeXPVomrmMJtfWtWQtYnuAbN3A1L2MPKBTJRr1g4sKoGlEpXycG/+D@vger.kernel.org
X-Gm-Message-State: AOJu0Ywplad5fcP5yvfNbTxYBc+w+Sv4BK25uCD7BI7sNMeGCqAjC7tm
	P+CunMK2QCGQLe6q3NuZpkbdMOF/vu/1NR1mqPgCWOqNbZrwYM9xtSXrpp6YFDwOp2FSC0jM9eQ
	VCgOYS3nuUWMMX3vUJHcLILibr3+q1U01TI2U4pr7vi4uaM+pimzDGxCfpd2I2Nik3ZQ4
X-Gm-Gg: AfdE7cnlkMtOJD1Xbn68Ku+7NKwADtoK1f8F2vXdCtVdOgbMSX0jik6inydxOYvrNdC
	kQsYTc/ODEg5qwjc7tzZVEWwCXSdRY1XO+Do8uWmsBGvHkzn8f6A9YUHaEbkPL/JIWlmXX1S1j/
	TBHXd8ifVp2psd0Cpd30iGMDcp406ZwfgtNWwjGb89Gvivkz/utssWZ/2DakCiJb6Q4OLrEgg1/
	xLadZhRij2h6A6Du2A3G1vGvJT1Ok4R6+7b5jCO3edK6VoHNNKfVtIAoy6mL+m1JDVORg1mvxbP
	1piUU8n0lqUk9GOO3LwYLTflfZDaeGCX1i0/sV5qYHuYFQdyzyoLjHnOMBAoTx1uXXj+RDcFCqQ
	YNUDnmVa+gYVLVUlv5ZC7Q1bgnUUSe94f47vcfKE=
X-Received: by 2002:a17:90b:1c88:b0:37f:eda5:5169 with SMTP id 98e67ed59e1d1-38dc75f1abemr8187955a91.13.1783933411062;
        Mon, 13 Jul 2026 02:03:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1c88:b0:37f:eda5:5169 with SMTP id 98e67ed59e1d1-38dc75f1abemr8187915a91.13.1783933410635;
        Mon, 13 Jul 2026 02:03:30 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm70947644eec.30.2026.07.13.02.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 02:03:30 -0700 (PDT)
Message-ID: <c8b78f4a-b7de-4798-8d36-ad24da241dde@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:33:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: videocc-nord: Add video clock controller
 driver for Nord
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
 <6pecwkpvl4inltqzy24hbhouuz3e4hss477xy3ce6zldk6qcvg@4vnvqxykmio5>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <6pecwkpvl4inltqzy24hbhouuz3e4hss477xy3ce6zldk6qcvg@4vnvqxykmio5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX8lIM11EVEFlt
 gMdJv5aLG3WGq0+j4vgPVps6fy7j/IedO/09Mgi4w9YLBWFiS8DaonxJCt8MVnIjzblNRwNPSjB
 zWlJlkgqmX//xsswG1P1CdPL9lZTkig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX37ZOncK+kjZp
 tNaytjBqXqzDwJ7vKsWxKr6T0b9f2ApfpoypERZ2C+8jfH9OlNKsPYu3f6FOzxqpPocMT6LAhov
 vG2l6MJMU1skvNa9AGk1A7Z6fVqShhgiu5V8lqf9D/NQN/HQaCn8qVgI6+40uEiX//IkrmKlug9
 x3wvPf+QhCTMQt/29bYWyA+FcPt2tkjO2eg1qZ9ufxfqRIxAx7mXZYvvahL5mu7ZdlDJWbNaLKm
 z1FvIuD20xu+VJhSazCXZSnpBeXMlvde+RQ/OtZihOOaMLKcZ818B5WLkw8bjWh5yUgi0A+Ft3w
 z8aexnRJz5Div+HolVdtlajEd1HGZbjfLIZKcRIn4L6dpQ2wIh8qN3iGGsvoy/2B63H7a1KjKAU
 /xL1iNCo/kSHCnydzhD+ZTaf8i/1FNlsNyF7KUz4+ksa8XKpVm0kdoACaL3TlTExr8q3Pb+ujJ7
 kfdn9yGB6YZCvCiiYUg==
X-Proofpoint-ORIG-GUID: tCWAD-ehjpfinY60cyGoFEYgEv9HS5Xq
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54a9e3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fw0g0I_whfq7NU55yUAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: tCWAD-ehjpfinY60cyGoFEYgEv9HS5Xq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130094
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
	TAGGED_FROM(0.00)[bounces-118692-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AFDA74920C



On 7/6/2026 8:09 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 02:27:15PM +0530, Taniya Das wrote:
>> Add support for the video clock controller for video clients to be able
>> to request for videocc clocks on Nord platform.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig        |  11 +
>>  drivers/clk/qcom/Makefile       |   1 +
>>  drivers/clk/qcom/videocc-nord.c | 507 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 519 insertions(+)
>>
> 
> This is almost the same as the Glymur one. Should it be unified?
> 

The PLL type and the frequency plans differ. There are certain hardware
differences in the RTL between Glymur and Nords, though they don't
impact offset and so I wanted to keep it as a separate driver for both
these targets. Do you still feel we should merge?

-- 
Thanks,
Taniya Das


