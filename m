Return-Path: <linux-arm-msm+bounces-91364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oF0tIIjVfWngTwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 11:12:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D11C17EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 11:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09062300DDDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 10:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC92533D6D6;
	Sat, 31 Jan 2026 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXjeDBOr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+JfPaxy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C77A32B99F
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769854331; cv=none; b=UZmQazBcqQ97myMmuaC8WpkIfvwDvWdRD6OqUsEfcyyL4yH5fOtY3ttsH7Pcvc07zTgChxsxCNdEDgiyqFxzgeFc44l4LCiyUGD7E4DA13ECELlnHkwPnP+pvC01rt3V6zb97W4BbqpnGfqVstgqwQVvu96YwZ8+e/u5mYW1C/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769854331; c=relaxed/simple;
	bh=VEAe+X0FB9vXgAIQSobQOgIUGriG07alQ3j6JuJdLgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilgyA38OmWlIrcYUi95QRLbfIk+Cn5jh27DsrnUp+xkNmzfSOjcEGZloox5C/2tVVl7dSRimBtcuRcHzlLt4io3Do8guZkgE4ibR0g4Qex9iHoU5BXr/Y58ddc56N7nuNVkyjiSC7bQ0/OyQcxqcXlxzgQK0/mNlK/Q3L6R71aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXjeDBOr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+JfPaxy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4bvVB1061873
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 10:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6puvbklaTf3KTbyOtju0g8M5/JWaZ7LLZ6JZVfLJvCM=; b=CXjeDBOrd+YGpxtH
	3vqNNlm00ThaO1HBbWg5w5Q1NKvSA8z1TZ62ZCM24X1crs+9MAIPKzIhJz8XXv3L
	D4hK5vix0F+kVlllUa3CoBI8pP0LQ/Wsp1Z83U9bMxOGh/ckGp4iSJAjRL619Bcn
	kcWkUP1Tw7FM4D5Sv65yM5TWJOpmO+bF5808MR8jzUSzLfvd1T/fE1nPxdZvbmwC
	zNm2ZY3CEIRHVoyblN/7ZWIw0yQZypOzdmzCoUKSADs9ujEfU0z16GmffJKOpIzV
	1BnMMAkIQMaJ/JS5MXDjitIKfpLnzxH5hwaUGf6xsFFDCLpy1lTMBfLNVi5Mm05E
	rTa0Rw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avngjxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 10:12:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bce224720d8so1766699a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769854327; x=1770459127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6puvbklaTf3KTbyOtju0g8M5/JWaZ7LLZ6JZVfLJvCM=;
        b=c+JfPaxyuw6mPVQKZah3rNiROahLOGJZ1TS5Lr2MrWeMi08E35S+jFgumfRV/Nl9Lr
         22p+PIvAat39IIF9DhKSgMdf6lxRA+LS98DPSakLuv19kaeJag1r1iAQoTL2GlOINX7Z
         LkRAvmZyS1rVM/udtr9CZKYqcM3pSANEvzg2eC2KyFr1VblDnKzmPGxtD0RfOqwdQ1io
         je77sv6AcTbFc/81MQIgKk51SFEP0TqKNGDfT2wOK9P759lsBvPrPEPirVgyw0RYi2Cg
         A4o0gsTH7UhIVXKUOxIs0ZP2ew1coiY4bv2FMlqEv7aqLPO9L9c7gtyCMTlX9eCtHHan
         XQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769854327; x=1770459127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6puvbklaTf3KTbyOtju0g8M5/JWaZ7LLZ6JZVfLJvCM=;
        b=poxZEcuIf38Upbl7eOn2bcY9VvMKBVOC3U9jhvbMcgEwGSCt4MwyGdWirpfZ8gLhRQ
         XW0YZa9hzbXf1KHxzmCN+sfXwkDXPWm6PRD/G+6pD0URp5fbsKOsSvtBGqsEcYJTkjfx
         AGNSR6SBIzCYOooTjvtUnHXlqwVow3pm4P6x415BGJ5CcnWXjaOPbjikjgU84q6XaLem
         5PbfeZpzNrV3LrgZSB+673S7vfztW4CBwnSFDGczEtnlEKAGnWLfdJaI8mJKG2n3XgpX
         4QbFOFpEMa0zSqxzIqeCAownCMfUXGVmvxLKIsJIV75sHexUy+C3Q9y0KMSjde4lD3fb
         rOfw==
X-Forwarded-Encrypted: i=1; AJvYcCWakMvXr3dRayIhq3FM8lxZYytJsIlBzNkfNvy6eXxlyYT8oaHjsHSmEplram2aI7qOIytM8YRdfx78viBP@vger.kernel.org
X-Gm-Message-State: AOJu0YyalCOR7QZTmOKzA3xMHtfe2teLOWAkwJJSBJkc+78UNC3rkNgq
	w9cwtQHvNzdNYA6QW0fFA3LzJboNPZ6Rkp+8zsEre8tT1KQnwpCtFp5ouzwvfIO8C8+1JRncjwv
	gNoj62pwc+QBCjWEInr9jHS2hXXQFEBO4oc0D+VHtodfpKZT026E6EF8Z/N+NTC/B7plFUzaKFH
	af
X-Gm-Gg: AZuq6aJsgfG3pOImjgboZKcq0ajF0sj2hFVTwM8xLXJfQU9+DT+vvTgBp7WCbFjTyhq
	tpFl86BcMW1mqKzS2YZ72cmDv9zOX2NhGt0mE/TpDF3uxVRCH2SvquOitrdgU8dFrTa838GhXAf
	wmFqhv30B1TsGzluMVsARXlnR/yu8JTaHx1ObJTwlTooMI4/yCaRwpvTRlX/p3ih1znkm8RiEq7
	oJgFIsoMND0e2iLwVSGSCC92GIPPM/aqxXS3Qqwvh/8833Ruq/AHoxDTwxYHXaB5GlfvxYVyTyX
	g1WjaD2353usTB1Mxo9kDuGpSG+Fvq8u03pWaSgF/GIXWY2ZL47NSqeHv3Pt8QFguoyqBjk9pYL
	0Ed1AYK3M0wcj0YI8MHQVfrp9O21z2OmJ/kLsuQc=
X-Received: by 2002:a05:6a20:2d10:b0:38d:f2a1:a44f with SMTP id adf61e73a8af0-392e011afbdmr5448824637.48.1769854326814;
        Sat, 31 Jan 2026 02:12:06 -0800 (PST)
X-Received: by 2002:a05:6a20:2d10:b0:38d:f2a1:a44f with SMTP id adf61e73a8af0-392e011afbdmr5448796637.48.1769854326265;
        Sat, 31 Jan 2026 02:12:06 -0800 (PST)
Received: from [192.168.1.6] ([106.222.229.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d73386asm1734885a91.14.2026.01.31.02.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 02:12:05 -0800 (PST)
Message-ID: <998079d0-1c38-4a93-a63d-6bf9c91c4a83@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 15:41:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] remoteproc: qcom: probe all child devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, mathieu.poirier@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, amitk@kernel.org,
        mani@kernel.org, casey.connolly@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <evb5tn2cht7wk76fuc2wpsyxepknigfw37633n6ypuapstbceh@tn5glmi65bdv>
 <cb5430c8-12d6-4439-b1ae-c2f36f29a9f8@oss.qualcomm.com>
 <57493aef-fb35-4377-8cf3-1df7f53470c9@oss.qualcomm.com>
 <74h7r3vsig3csejax3eu3uk53mdiimg2hjx7ntmmfrwdai6s3j@eiztghclfcvt>
 <5db5dafd-3c1f-4844-b822-bbfe86b3eb4d@oss.qualcomm.com>
 <ctrpymbvjlchp3djnsqq4bghkq2zvqnf5bebszi74f3d36l5dv@icvnkdwgdxmi>
 <ef1911f5-2d96-428c-93f1-3d1815710894@oss.qualcomm.com>
 <98397a59-8ef2-4202-ae41-015c895d6bce@oss.qualcomm.com>
 <c5ace95c-6ba1-4ce9-b461-82225a9fc576@oss.qualcomm.com>
 <f461ca33-0892-4a58-a40b-6da2a32d1430@oss.qualcomm.com>
 <33kugspepphj3ywp642bp5ee4zd6pk6pxbooe4knv62coeofo6@5zqxy4n37k3j>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <33kugspepphj3ywp642bp5ee4zd6pk6pxbooe4knv62coeofo6@5zqxy4n37k3j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jleGnskecSSpl5Suu4lGUnRjIRgbS_0q
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=697dd578 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=EBd7WcfsMYPMwvoCMWz0vA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=i2r6_wRwnSb4ox3zbhYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jleGnskecSSpl5Suu4lGUnRjIRgbS_0q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA4NCBTYWx0ZWRfXyv91W+s23RTW
 DK8qwCpx0aBuvqac28RW7qXJYnKvhPNQf7EaKTUotkJ14iqiT55m/nnLX5Yzzce6hiQpPJJFDhe
 WSDiSNOm1nMv12xG8idH5OJUDV0G+hcDMjPKCqaQ3XstfmLVfphoYu+uWOL4H8UxBhcYp2eZcNV
 KK8ySJpwKnH35JdnlVV6lnoAzgrznVDmJSMKh0W5UL4IzdZJG8jnM4McH9CWe62SeBW2+Fj3LaS
 tgr/au9yUNnGxlCaFJcd/g7ffCRgLS9uZKxKWqsUxzY1cDYjvyUuRkMk2Pjfz2V3tmJgcPNG9uH
 +oauGD47Xthg657iWQcmNhzQJo3+owdyi9CHx2NATZXffDefM9S/9uZxeqv4HwMol1+/JqDdxkY
 NPJNL/IBLADIMT4Uqg6CzsTvwh7d78FGeJVQvoSNSCVr15FAQip1oQjqYM8gadUn07UkuuzTd4f
 6124r6RKoIyjoUNS6jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_01,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91364-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0D11C17EC
X-Rspamd-Action: no action



On 1/31/2026 1:36 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 10:13:06AM +0100, Konrad Dybcio wrote:
>> On 1/30/26 8:03 AM, Gaurav Kohli wrote:
>>>
>>> On 1/28/2026 3:15 PM, Konrad Dybcio wrote:
>>>> On 1/28/26 10:39 AM, Gaurav Kohli wrote:
>>>>> On 1/27/2026 10:11 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, Jan 27, 2026 at 09:42:10PM +0530, Gaurav Kohli wrote:
>>>>>>> On 1/24/2026 12:33 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, Jan 23, 2026 at 07:23:39PM +0530, Gaurav Kohli wrote:
>>>>>>>>> On 1/8/2026 12:37 PM, Gaurav Kohli wrote:
>>>>>>>>>> On 1/3/2026 8:26 PM, Bjorn Andersson wrote:
>>>>>>>>>>> On Tue, Dec 23, 2025 at 06:02:21PM +0530, Gaurav Kohli wrote:
>>>>>>>>>>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>>>>>>>>>>
>>>>>>>>>>>> Generalise the qcom,bam-dmux child node support by probing all
>>>>>>>>>>>> remoteproc children with of_platform_populate(). This will be used to
>>>>>>>>>>>> enable support for devices which are best represented as
>>>>>>>>>>>> subnodes of the
>>>>>>>>>>>> remoteproc, such as those representing QMI clients.
>>>>>>>>>>> Please flip this around, start with the description of the problem
>>>>>>>>>>> you're trying to solve.
>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>>>>>>>>>> This must have your signed-off-by, where you certifies the origin of
>>>>>>>>>>> this patch.
>>>>>>>>>>>
>>>>>>>>>>>> ---
>>>>>>>>>>>>       drivers/remoteproc/qcom_q6v5.c     | 4 ++++
>>>>>>>>>>>>       drivers/remoteproc/qcom_q6v5_mss.c | 8 --------
>>>>>>>>>>>>       2 files changed, 4 insertions(+), 8 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>>>>> b/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>>>>> index 58d5b85e58cd..a02839c7ed8c 100644
>>>>>>>>>>>> --- a/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>>>>> +++ b/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>>>>>>        * Copyright (C) 2014 Sony Mobile Communications AB
>>>>>>>>>>>>        * Copyright (c) 2012-2013, The Linux Foundation. All rights
>>>>>>>>>>>> reserved.
>>>>>>>>>>>>        */
>>>>>>>>>>>> +#include <linux/of_platform.h>
>>>>>>>>>>>>       #include <linux/kernel.h>
>>>>>>>>>>>>       #include <linux/platform_device.h>
>>>>>>>>>>>>       #include <linux/interconnect.h>
>>>>>>>>>>>> @@ -351,6 +352,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
>>>>>>>>>>>> struct platform_device *pdev,
>>>>>>>>>>>>               return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
>>>>>>>>>>>>                            "failed to acquire interconnect path\n");
>>>>>>>>>>>>       +    of_platform_populate(q6v5->dev->of_node, NULL, NULL, q6v5->dev);
>>>>>>>>>>> There are other child nodes here, in particular the GLINK and SMD edges.
>>>>>>>>>>> Do we really want platform_devices registered for them?
>>>>>>>>>>>
>>>>>>>>>>> Regards,
>>>>>>>>>>> Bjorn
>>>>>>>>>> thanks for pointing this, can you please suggest the right approach.
>>>>>>>>>>
>>>>>>>>>> This should not impact glink, as that is registering as rproc sub node,
>>>>>>>>>> And we need rproc cooling as child node
>>>>>>>>>>
>>>>>>>>>> of remote proc subsytem to create probe dependency only.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Can we do platform populate for specific child, would that be right
>>>>>>>>>> approach. or we should create rproc cooling as independent of parent ?
>>>>>>>>>>
>>>>>>>>> HI Bjorn,
>>>>>>>>>
>>>>>>>>> I’d like to highlight the impact and details of placement of remoteproc
>>>>>>>>> cooling dt node:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> ->As a child of the remote proc subsystem node:
>>>>>>>>>         In this configuration, the cooling device will only be probed once the
>>>>>>>>> corresponding remote proc subsystem itself is probed.
>>>>>>>>>
>>>>>>>>> ->Outside the remote proc subsystem, may be part of soc node:
>>>>>>>>>         In this setup, the cooling device will be probed independently. It will
>>>>>>>>> wait until the remoteproc subsystem is brought up
>>>>>>>>>         before completing cooling registration.
>>>>>>>>>         The drawback here is that if the parent remoteproc subsystem is
>>>>>>>>> disabled, the cooling device will still undergo an
>>>>>>>>>         unnecessary probe, even though it cannot be registered.
>>>>>>>> Bjorns question was different. It wasn't about pushing cooling device
>>>>>>>> outside of the remoteproc node. It is about not registering the devices.
>>>>>>>>
>>>>>>>> Can we follow the approach outlined by qcom_add_smd_subdev() /
>>>>>>>> qcom_add_glink_subdev()?
>>>>>>> Hi Dmitry,
>>>>>>>
>>>>>>> Thanks for the review. Since the remoteproc cooling is a QMI-based driver,
>>>>>>> it will receive the
>>>>>>> subsystem up notification directly. Therefore, there’s no need to make it a
>>>>>>> subdev node or
>>>>>>> tie it into the init/reset sequence of remoteproc subsytem.
>>>>>> But you've added a subnode for it (and we are discussing exactly
>>>>>> of_platform_populate()) call. So, you are tying it to the remoteproc
>>>>>> device lifecycle instead of the remoteproc subsys, which seems strange
>>>>>> to me. There is no cooling device if the DSP is not running.
>>>>>
>>>>> For the cooling feature, we don’t need to define it as a subnode. The cooling subsystem becomes relevant only
>>>>> after the remote subsystem is up, at which point it will receive add/delete notifications from the QMI server.
>>>>>
>>>>>
>>>>> If child nodes must be modeled as subnodes for rproc, we can move the CDSP TMD out of the remoteproc and add in soc.
>>>>> Is there currently a way for the remoteproc core layer to call of_platform_populate() without requiring a subnode?
>>>> I think the question is "why can't you register the remoteproc device
>>>> as a cooling_device, with perhaps #cooling-cells = <1>; instead of
>>>> any form of children?"
>>>>
>>>> Konrad
>>>
>>>
>>> thanks Konrad, for the review.
>>>
>>> As each subsystem can expose multiple thermal mitigation devices via the remoteproc TMD service, so need to define child node.
>>
>> I think you're stuck in an XY problem - you keep insisting that adding
>> a subnode is your end goal, while you really want to achieve being able
>> to register multiple cooling devices. Or at least that's how I read your
>> messages since you happen not to give any explanation as to why it's
>> actually necessary.
>>
>> In my previous message, I forgot that cells for cooling devices actually
>> represent the minimum and maximum cooling state allowed. But since the
>> API is just part of the kernel, there's nothing preventing us from
>> evolving it.
>>
>> Currently, we have:
>>
>> Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
>>
>> properties:
>>    "#cooling-cells":
>>      description:
>>        Must be 2, in order to specify minimum and maximum cooling state used in
>>        the cooling-maps reference. The first cell is the minimum cooling state
>>        and the second cell is the maximum cooling state requested.
>>      const: 2
>>
>> But I think it would be perfectly fine to suggest a change such that
>> if cells > 2, the last two cells keep the current behavior and the former
>> ones let you index into a cooling device exposed through a single OF node
> 
> This might be a big change, which probably needs to be coordinated with
> thermal and DT maintainers first.
> 
>>
>> e.g.
>>
>> rproc_xyz: remoteproc {
>> 	compatible = "qcom,rproc-xyz";
>>
>> 	...
>>
>> 	#cooling-device-cells = <3>;
>> };
> 
> Which brings in another topic. In DT we have labels for different DT
> children, which correspond to different handlers on the DSP side. For
> the CDSP we see a "cdsp_sw" only. I think I've asked several times, but
> didn't get an example of the device having more than one, just claims
> that there might be more thane one TMD.
> 
> Do we need different cooling cells here? Or would it be enough to send
> the same max state to all TMDs on the DSP side?
> 

For newer targets, Within the CDSP we have compute core(cdsp-sw),
npu(hmx-sw) core and both have independent dcvs and also dedicated
tsens on each core.

And For Modem also we have multiple mitigation devices based on
different modem tech, for e.g tech level side we have modem-lte,
modem-nr etc and mitigation at different power amplifier side like
modem-pa etc. We have not added modem node for current series target
as it does not support modem.

>>
>> ...
>>
>> thermal-zones {
>> 	super-rproc-therm-a {
>> 		thermal-sensors = <&rproc_xyz RPROC_XYZ_COOLING_A
>> 				   THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>
>> 		trips { ... } ;
>> 	};
>>
>> 	super-rproc-therm-b {
>> 		thermal-sensors = <&rproc_xyz RPROC_XYZ_COOLING_B
>> 				   THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>
>> 		trips { ... } ;
>> 	};
>> };
>>
>> This would be resolved by allowing drivers to register an .of_xlate-type
>> function which would take the RPROC_XYZ_COOLING_n argument and e.g. use
>> it as an index into struct thermal_cooling_device cdev[]; within the
>> driver struct.
> 
> 
> 
>>
>> Konrad
> 


