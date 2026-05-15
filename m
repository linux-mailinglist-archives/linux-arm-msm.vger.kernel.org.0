Return-Path: <linux-arm-msm+bounces-107826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N/P6DHUEB2pNqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:33:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A16FA54E85C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0535431A2805
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9158477993;
	Fri, 15 May 2026 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+JWJ8m4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="boQyZilz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9576747799D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842991; cv=none; b=cE2QZbOz5wbKXhVD92s/3sEcCDfvXdoxzP+YUzQgXWdgsI26Ag+rRBCl7NqrzCFzcUec4sIRcL60K62DmmCP6sxHl3y1VL0wkduptBI5N17UNHEfykDtGQF5JIhASBzgP+GLMstKGh9jn5O4MN5YgQBLs9H7elqUjQsYoO6WTts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842991; c=relaxed/simple;
	bh=Vl6zDtFGs6rBBfIFaWe6v3rORgX4I6E/hb47YTcF9vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yb2TVtAEZfiXXKNZbrcL36JCFLzho9onf139EQUxjhaOsFnDYei8TR/Kse97/WKbMoRb+5f2JWimjAy7oldbwO9TJg9tI0hgrxXhvkyEswAMkCpsV/XCroV7Ww5LQO2U2xoHXiK7vg8BPSbvQT50MmePiEuJcHkV02w1X+W0ehE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+JWJ8m4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=boQyZilz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5PV2s3200273
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OenjSLxep1NG29TfqnLhRK7XF8mVv11G5tSLIAuqess=; b=K+JWJ8m4sK1oAh94
	q84JD7XqLEfRORe6lrz0A+YoYwgkSmwAVGrQQ1cHakRrrjUZLGQYXzy+Y/7F8Qr1
	qje7iK+R2RSvOPTv+VlqM7tLnhpoTOVXFMKDMaCIOvke6rtPgyFfnyHVNJN7d5Bu
	JirZrDXTo0HenVTbJE8tRm0SzwT6pWCPjvsHZjGPszLIxEPgf5UyKdBOqCUvz5Iv
	dTU9DY7tJ+eYJJWyM+vHKytOcTCo148gjNzBrEdjt/A9smrFKvYDYkPCdUSObAC4
	6VFhYxSCFNRt6ZoBaoG0EEXdwZ2+YfC8YZ/F2xIvywVZ7CfuNfDD3Nngybp9GCmF
	t5I6aw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtwe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:03:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cd67d9a7dso371964241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842989; x=1779447789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OenjSLxep1NG29TfqnLhRK7XF8mVv11G5tSLIAuqess=;
        b=boQyZilz7Gff+uAs26z47zNEJInVlGrpv6Nt7QJ3bmduoFNjABy0p7yQSqu0c67pIb
         uaQCcFRUsbfGireIfbKVzgAX9NoNiIjC3NOlXjxqw4zD1i/NbST+yQUq2stYDyY2u/ng
         o8m/14yyR/0xZXKnJYmysdwQLHfXlgKkQrqXis7wWq+HJQDMCq3kYCh75TM5SQB9iEZ4
         GAvgBpI5Ik3MDzswbutZqB35lnoAFzgNbfqPesTzFpNYRVM0VD9gsckUeqlNZPq0bZK9
         Xu07nk/WNqrQoCFcEc364bnHnisd5JG4ntpepwCl/aUAcaQZzZIQAxsdDXi/Y9syLRp6
         jhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842989; x=1779447789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OenjSLxep1NG29TfqnLhRK7XF8mVv11G5tSLIAuqess=;
        b=qZ/hc6ZStEjmVF4Q9p8YAkWTyPaXA5s8B7ZG5RN7txGQfFyUzdl1bUrqM+LLfRYVRV
         +Ld4rZaI4RemdVWEnXcPcsw3LYON1ZE3qsWshCQ+wg/VVoHwLAEZDtItM2eTP0pukTmP
         lmRu4PEVD8KgczIX4V37Vjtgmrr5f990YC2i3c2ixGap7wAR9eceQggMFw0xAmWHH+ey
         qnrmzWBKm0X1xRbh20qupVnDptZVChWRGnrSd9p+9F8YodlwoPCqkA52BtsJnZh+cT5N
         KMQNHnTmfdogQBPmUMpyH6uyxXMgnegwTJ/Rfmr8xFH1SoCVkxjrd1AzvYXfhCAo0qZn
         gs5w==
X-Forwarded-Encrypted: i=1; AFNElJ/1LWbcYBVX9RtkOfwPFDf4WzvlV41sSICeJPBsqg75j6tcd4+NEqHe4HIKHv3v3zV8vpBObEY2y2JIeCBO@vger.kernel.org
X-Gm-Message-State: AOJu0YycMnmkNrITi4V+eYr9wBZdBL1l8pK+qDshWazK0P45r3z2Tq95
	EbELZGsxErY59Qk1UHGAWMox1jr7833UY+HV5jNgftJfg3X19K6EKWzlj+S3/qJMELiPCd9aaoA
	Ev5dS1YRfP9NgFMtMRsDuqF0v0U+QT+n9LXrDdt1FI/co43ZjO31H0wGNpNqgcqtbbsX7
X-Gm-Gg: Acq92OFvoaS3xZqxkmshmNeZsaqCQcAhkIJJ1oqavVZlxqXjsCH/+m9P72jj8I+61La
	qIeZBhzgmLcNB7vT3kaAycF6cyhFvvr4YNWpERWt737czhnmPQ9RK+gkKZAlq8q1G1x8/QPkBUo
	Bo9oJzAbbOoRWZS7dilf51FquPe+Is7KqrKTcoGtcq370mHEsOXMBm98AVbycvkgduJUCNiERQQ
	3GaDyLjwaZus3+jevBRjnYteNQzPanKKrK1/CkcEeFmcKpRtpvSXL2t8Vc87ztK9uOXB6FLYCv9
	0bFmF9GN3dy2a5uGioBvoIP6VEbPa+PHH4lAeVgOnhsD7y4u4IUYLbFbNONTM1Tc4rVpz4uD1a2
	Jh978UinsQrwbztyxoqk0Hg2u5rM6NiXG6tC5buDv2JWEoJuQAdE18hYpRCBTfFpvOH2A5Z8IyC
	hKtms=
X-Received: by 2002:a05:6122:4d0d:b0:575:1954:4396 with SMTP id 71dfb90a1353d-5760c09b062mr781995e0c.2.1778842988762;
        Fri, 15 May 2026 04:03:08 -0700 (PDT)
X-Received: by 2002:a05:6122:4d0d:b0:575:1954:4396 with SMTP id 71dfb90a1353d-5760c09b062mr781963e0c.2.1778842988242;
        Fri, 15 May 2026 04:03:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1116sm210293066b.10.2026.05.15.04.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:03:07 -0700 (PDT)
Message-ID: <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:03:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06fd6d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=grNNkQCBMd6X2WQm2_UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 6viMtambaPYbf3PeVwIu4Awb9hvHjw0c
X-Proofpoint-ORIG-GUID: 6viMtambaPYbf3PeVwIu4Awb9hvHjw0c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMSBTYWx0ZWRfXwIGm5yHm7W1c
 w5q9q5mGVK8EK6dGQxae2cnvg3QlreXTkVuUVjmpQxOljTCHTXUKUOAVetnQpjSitDG6VetQ3f8
 BBv6ltDvbag5tj2DFdYmftt/CgeXb7GG4dPz8gyg/5n+HP7oyY9gSv31C+f2o9OsqpxEiFr6lo6
 MdLfzr0nYFxJzMJugOOxM0vEbhEy93b5je227z1jOQIm7GXvxn7F/XZ72yZUZg/v2abExdSt1fQ
 GDsvxyaFj/1fJprHTtUBDqN4vKhZhAbeo+MzYhD3bVfv97r4x4fp+0l+R/tySwqiHCSx0oqN88/
 h7l2D+ja15GTlDiRyHgAQMacx8KPPNhTSVRo+5pw7D1XkBik4W3UxnrGCPVqBsXxnenzMoLMO5L
 a3TJHYE5GcVuYEuJIkU4Eq6FD1TZo7voo2pduZHSnw/uICBQ+CBgx8Ou3Zuw3vEJ4Hi2aVaaZY8
 65TTBRRnaSh5Ouw9VyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150111
X-Rspamd-Queue-Id: A16FA54E85C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107826-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
> On 15/05/2026 14:00, Konrad Dybcio wrote:
>> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>>> C630 isn't stable enough. For example it might reset if display device
>>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>>> value to make C630 work in stable way.
>>>
>>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>> index e41200839dbe..e6c67016552a 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>>       status = "okay";
>>>   };
>>>   +&cluster_sleep_0 {
>>> +    arm,psci-suspend-param = <0x41003244>;
>>> +};
>>
>> Is it better if you do hack in a
>>
>> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
> 
> Any clarification? Then I can try hacking it in.

This will send a message to AOSS to intrusct it to prevent CX from
collapsing

You'd need this somewhere early enough so as not to crash

alternatively, the good ol'

diff --git a/drivers/interconnect/qcom/sdm845.c b/drivers/interconnect/qcom/sdm845.c
index 6d5bbeda0689..2fea94618839 100644
--- a/drivers/interconnect/qcom/sdm845.c
+++ b/drivers/interconnect/qcom/sdm845.c
@@ -1786,7 +1786,7 @@ static struct platform_driver qnoc_driver = {
        .driver = {
                .name = "qnoc-sdm845",
                .of_match_table = qnoc_of_match,
-               .sync_state = icc_sync_state,
+               //.sync_state = icc_sync_state,
        },
 };
 module_platform_driver(qnoc_driver);


should give you a similar result

Konrad

