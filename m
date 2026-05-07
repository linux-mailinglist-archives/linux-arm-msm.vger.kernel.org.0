Return-Path: <linux-arm-msm+bounces-106389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDlREtyR/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:21:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A435D4E9242
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25A9730889E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4123F660D;
	Thu,  7 May 2026 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqTgoeQA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MerMOOVJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EFB3F54B4
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159755; cv=none; b=NKtiZrDqdrWUYhPblq8y8MLnhURktyjwYJ3by9o5BQt8BzahwaHzXhUzG0o81FL2or81xUtdf8u2X4gSnq8sd7AaFT3F9CCeQeGU6Ci3JuRJARnfDC1iQFhpNqV2/gnGcl0+Bu06EAhIFX6TVESs+lZphhEloacIbVTQXOGWCgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159755; c=relaxed/simple;
	bh=43ZNwjCoR/Xdai8NvV6N12RLoUIGmkzxfRExATYKZ9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdugNak8oUHNXeGRngtIHJwrv7TDfbKUt4gpmb7KUyCgJcAhQV09yepWrqfsI2XwEmvk2Yw9sYoVu1uk09MGMIVhXthyhyDU1wLxZZFv2Ggsr/lFsuDHcXC5M/zsjmB/nQgZX7HYz1OjrVpOIVqRUReWQd6qm2ySA3Of6n+UbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqTgoeQA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MerMOOVJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647A6EtI151176
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0CO2I5xKatSdKnYvy9OIeCm6tMs6uEinaGoRfuKUHY=; b=bqTgoeQAwCVNNsGG
	pWUSkhVD0TSIoLcUi2g4m7b3vltI2RLEymnB3+EHowInNh+Bk8lxOR5c5VPgN9cb
	NKc2iZEUfQ/T0b43Onp0MYOqIP4kAaANBjEFIUeBgFbqqGJwU1FtIGYA52c7hFCk
	bEeHOIUqS1sZf/PTTWYhMNl5bMEiO8ZMptbcrFeZtl2yosTYPtHYqgrS1IY10eKD
	gqgqqLQ3gHbLqk1dLzlj6dfnFXmXQzY4d0BIy0Mr4WMGOf6Cp/AQgX7EXkO0vvVv
	u/BpsFiCSgYmqESjxBL09ssAIt21Raf8jsHPh17ySaY8M1mBhd5bhwyoC1WRZ4QE
	WJctuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctsxp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:15:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35842aa350fso1582919a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159750; x=1778764550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0CO2I5xKatSdKnYvy9OIeCm6tMs6uEinaGoRfuKUHY=;
        b=MerMOOVJrEQzyRBScPG6WR7BZdNj0W/N9esFh+xJ//4u8kxZY9eQ/ngmE7gvMe6JsC
         yZNC/6lEF5pbnbJkGSy2UEd7yzu0rY7mBtf+PckGs7bpWj5/NH4VhpXj50rYDDL8puwi
         eRrgajE7/pPnDKBq8iy+Zx/DqMBkU6q9SuES8b1p3EainlDTSK/RTAOGdeokQ17dCQFN
         GdLEHKdK5nDmSaHUlrM3tCD/t5pW+uJITHXVppO1SR9zaXUw7t0/fcfWdKHTQXzrtpr7
         K/jCpezQvO1XQ56VrZvr5CZsE0sU2X/jg85BzRfG7sDLt9XVa+A9gwUGZju9QjRINYOA
         ax1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159750; x=1778764550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0CO2I5xKatSdKnYvy9OIeCm6tMs6uEinaGoRfuKUHY=;
        b=Cn3VvtKqEUV4xY1kuKm7vXMyvzFE8YonQlDHzyBM9/cxK9lX9eRDxIplA84hfsNqLl
         KKFY6T/39u9H09ahdllXEpZK3gIl3han68KtCUuOL4OMq3PNDr4wUYcUoRmXfzPSWiFH
         8vVzm3TuNoaD5wi/LGgg5kPKaV8b4YMPF8ol8d6S9iEpQ7gynjSPk4ahdeDl+qjhrwZr
         vhWRQsmn+cirKg6T/5T5esO8Xr/tQWkGjN+MTR6M9VX0/FliPVXtnxkh+OIO7vkIBI+B
         PKAPfZCMb4N8YuE+m6xSKftiVxANQ5NGciZTGyqHmF49nrT7Ld9S110Gk/rDJOyVsqst
         /vlg==
X-Forwarded-Encrypted: i=1; AFNElJ9qTEPKHnmmlgi2XSFNdQ12pb/FomEiEFr1S1nYZAzbLO7uWtk9Iy5tlK5+O7PGoSQ/4K4oo7jY0velsnqi@vger.kernel.org
X-Gm-Message-State: AOJu0YzE15yqlFXg/NzgEHDys/OTRZtL05fSPx5gEGAiAc8vP1sSG2OG
	5Pu2cfbilYFpMdBOlq9Lbd/SEqU5YlORq+xTq9pOgWTwwhJ4QaeH4R4AruQCOdrm3Z3t9AFty4E
	R1gqF30mmk6EOzIul3SXORyFSKeLfUFUBAvVjVr8etU54mmAeZu+6tAY7nZrusDLrBKw4
X-Gm-Gg: AeBDieu83xD1s20OwnHjbvg5AdYl+ba7L8fxeewgVo72JAbqqW7274rKdlsV1LO6Mqw
	5VDqu4F29vb9dj+grwa0WHTVi7zVsf1nQ4KetRf58DCOoXVTFjrOYPur9wqiIpvEBQnVp5sfHyS
	dqUt/hRldr40OqYPmG31O/Ifo7JLi60Axu/2Jh8qfNvV2duEYmPTTx9G0RX6VN5EhVH2omamyEn
	nI7BaeBCX411uYroRoRECoqt42qkpEC45RJyxwKwY/LOBJklWGo7wxcxdlkBo75puQ7GzTAVWss
	Nqot+pDH4NOguaCYphKEndaaq82nkVm9gJ7AJ6X0eTm6Y2NG5SmHIOEbZqAonXTf5K+RoT5YiKT
	kvhMTXyI/IVaYoNcK870BAAECRnJ/S0EMuWoCiwFLQR+MlYmozW58DJGhF/M=
X-Received: by 2002:a05:6a20:5493:b0:3a7:1d55:b634 with SMTP id adf61e73a8af0-3aa5abc6086mr8626737637.38.1778159750495;
        Thu, 07 May 2026 06:15:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:5493:b0:3a7:1d55:b634 with SMTP id adf61e73a8af0-3aa5abc6086mr8626671637.38.1778159749922;
        Thu, 07 May 2026 06:15:49 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253790c29sm2220707a12.11.2026.05.07.06.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:15:49 -0700 (PDT)
Message-ID: <63723178-79e6-4339-88cc-c0fc4c4d7b6d@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:45:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-1-61ad7c57ef27@oss.qualcomm.com>
 <20260504-romantic-smilodon-of-unity-71d7ce@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260504-romantic-smilodon-of-unity-71d7ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc9087 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-pAn52T9RjbIQf_sGhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: vYt27vqE_v6D9izqAkgUfW4yoTL06UcG
X-Proofpoint-ORIG-GUID: vYt27vqE_v6D9izqAkgUfW4yoTL06UcG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMSBTYWx0ZWRfXw2oiuEDrFUZT
 l21TZnlLdMpWP7ESxtyvo2D1h11bQNoZ73CGW6Ybmg+FkLz9OOr3Ga76JWlNWgTy/GErV46gu8b
 +PL45ddbMQXM0OM/oJLnBITJHkruIzKouS2UE5wbsUW9vi5D5iJkf3eHJNSJv9FFxdyrJ5K7OIB
 FUXvTBeeXmWzcHg+aY5WlELrPd5+aFEWsVGv/Cl5bk1JP9/R+oyKbNjtu/j5ytNLf/SZ6nvpe8S
 n1KT0r/9l5rOhf9kFhG/Fge+86hHF2DKTm7PiX+lCkxZUI+sJyDJWue/vxiM0MtPSwYAKGM16WG
 r1AdAN8mY+fUiGeJU5GaXpPuSUO1hvYKJpPX6Y3wARMMgxm+ubY5x0zWoi9ElkKgrqLvZm+BfGd
 PRSVRG0LhRchfTrBFgn8soAH5ixabcdjUIL1VLEnWw37gpf0Yi4ZvjIZuXHRMGmcBFTN7a1PVMB
 nAOpAsLHu1ECLUTpUog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070131
X-Rspamd-Queue-Id: A435D4E9242
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-106389-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action




On 5/4/2026 3:27 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 30, 2026 at 03:14:56PM +0530, Sneh Mankad wrote:
>> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> Add compatible for the Qualcomm Shikra rpm-smd device.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> Folks, please organize your patches per subsystem, e.g. all SoC patches
> in one patchset. I saw you sent separate firmware, separate cache,
> separate sram and separate SoC ID.
>
> I was already asking this.

I agree with your point and will send patches subsystem-wise in future.
For this time, since some patches have already been reviewed and
don’t need a new version, can we proceed as is?

Thanks
Komal

>
> Best regards,
> Krzysztof
>


