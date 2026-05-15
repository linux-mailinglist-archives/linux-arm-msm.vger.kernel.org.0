Return-Path: <linux-arm-msm+bounces-107808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Br2HRgBB2rSqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:18:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC63E54E45B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A010310D523
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3E846AF25;
	Fri, 15 May 2026 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohAo0TdI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOAkdXAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E5246AECD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842508; cv=none; b=t7Ii80aIWZFvrFlk4GvRRv5OpOm7tgO03xCinybRvuRU7ZdJ3QWHXX7WMDWZHqh5jgE8sLWsaDNEGIdJdkdubtoX7pjVGqw4j5eYOjVarKIrl0bF+ddVAeIyt77KJeCtojUkrZvNlvAvXv2R17K8pVAM0Y4439bjO+Aghavl3hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842508; c=relaxed/simple;
	bh=yXfXXimA8X+vL4ZsKrJ3lcwCMHkt/q4ZW+DDphNis6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLZHdvIJQfWnLFYJn6MkW/ZsOgx0dK6MTEwfG4vM/bEvHjvn33XqQUP3L05Y+HySZRixlHGfmyae5Kz8xKlBxZbIVLzKirwBYWz22yKK5BFtpAgaWQYnEyAof0XeRXWS4EQFKfaxPJS6El+TT4luSDl+dg2ArAJoGy9RO1ieA0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohAo0TdI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOAkdXAb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4wKcS3219661
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	An1TIxkYX4OS8z3Aw9x3YixozpJum7wSln/a2elX8wk=; b=ohAo0TdImNvYhX4m
	D3AF7Wtn+gfgHgn1VclkE7+WnyJzUrJcf6clQkwwL+mFL4vesUyyQAk9Tv1CS9Hk
	/7np2AgTmAD1y0AEQTzYafKPrqTCWrWFBu+ylky8N7TtLiEore8197Li8wytw2iA
	V+pCve8TZkw0YGutOzc/JueJ95MbDY3uisQbbDa95atjcPyJfmarPhxzT77yYhSJ
	AWZVIdvoLzWJcEEwA94cVQ7doDI3xdAt1Pz3WhFxX1vK/ZxuQVi1kM+WzJ92iOGb
	kBQGq/IHQF+KcYNq25NXBQFshEf/wlmphudZp516SOsyT+I3lopQEfcKRQ97NFQc
	80vteA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2wj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:55:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d840206c3so21303191cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842504; x=1779447304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=An1TIxkYX4OS8z3Aw9x3YixozpJum7wSln/a2elX8wk=;
        b=WOAkdXAbiy/9xELEBS2QbpJQqEYb3iK08mJALLZxJ57i59ZXSHmhoth4ntK+BWwz1F
         fCQPFThW/2bRz5+9sVEWqO89tqIBPa6ONu3Dtx+cww5oiMcau3H4/KI21l9YjTqN1abi
         O+kv954NFaHhg3b3XFWR0Y2bJQYJAD3rRRMOcmXWx814appZL8BFeJ9xw6u8f5IUjaL/
         +2TWZ2VxIxHVDuDBz20fD6yczyc38R6e0DAcDbxsz8o7s2dIQnAmGxEtFiBnP55mFvTw
         CqDpG1f85xZlAY4G6y7kyHGxDa0T6PIctILx2d/76mpa0e/PeKkKMQEX9n1DjbJ4s8+I
         mjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842504; x=1779447304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=An1TIxkYX4OS8z3Aw9x3YixozpJum7wSln/a2elX8wk=;
        b=Pv2GLHCEl1uC+w7M3ZNroWuENtU7U1lL+KZ2DZtlYhcEOkkfbrZ7Wc+iU6lFGU/Dga
         ePahtYT9C1PC8rOK1Q+TDXBBAmO1y0nmxyUH5Gx/QR1VE9eTMlHirlndLAZArVSWvvSk
         lDmlA4dgydSWMV4oauMpSAXpWECofv7cLNMGYdbxZM3CJ/W9i0kF8ibXVvYQadH2USXo
         Z5gYA/Cg4xcRz1kWonYicvxKNEsK6QU6hELVwqvEKXQSMYTboC7zp1bCQGzZfzBsNBXV
         PKhfi9E23Shf0PINPqLhSEb+LdOuOrlhNhWSDrALsrJVmRSC1LMS/yDiYFPFSMfbBOMV
         CRyQ==
X-Gm-Message-State: AOJu0Yw3JzasewaSAVNoMFFDKU0nmehP4adZYfWApEQzknyIfK6Hjh/9
	gKKvXeOt8dywdoCvKUNBzCaJ8SZr8Wwu9zzZY/l4KFJ/7dQi4Lw/JHqA7nHISDrWlbvlxE3a8NW
	TwJ2xZQ0wxalBSMiNFmEttvBZWg0/atou8YqLcs897fsVM3ryBznHX/FFvMs+TxEM9sZP
X-Gm-Gg: Acq92OEaN0m6Aw3+gynIIITVRbJuXLW8a6ftkFFEuj0CnJkSVfrB/fi/fOHQ2+7r/xw
	mKxh51zi3qQodJQvDzWfpm3Oh+plmPW+/UXGGJEmOSy3D2uj+d17zGuzID03btdd/1xEUYU/dgJ
	ERFsuyB+qWR6CPBfQBaiWg2jjiAqN8pQjzbrEntBOtHAnJPEi5vbz2xqWLWbJ4OJ3Xqsl+qHvyi
	dS0ApSFKnLSi1E7Znb9USFKSIy+k0rxI1MnjHg8TNnCY7X3ZCkV3fgOVw1MiG2RsFshzraHjS+S
	Ikgyy6mRw0ulol3Gw6N0Q0Gwi3yvp/NvODt/e+nz6SNrZyKy7vf16yeJzw2ufguNryuXmlwUj4x
	doMnbxdjGbf2RHEPDltFItDlezC8OvnB5El5SxHnrYEPAHy6XUF1UrbCBrVtK0xb0/FfCn7xP1b
	pao7M=
X-Received: by 2002:a05:622a:11ce:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-5165a202f87mr32475801cf.6.1778842504100;
        Fri, 15 May 2026 03:55:04 -0700 (PDT)
X-Received: by 2002:a05:622a:11ce:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-5165a202f87mr32475621cf.6.1778842503694;
        Fri, 15 May 2026 03:55:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm1859986a12.31.2026.05.15.03.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:55:02 -0700 (PDT)
Message-ID: <f8b45439-fc19-4a4c-a2df-93f9071ac77f@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:54:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add watchdog node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
 <1b741127-18ef-41f8-b645-707083d7a921@oss.qualcomm.com>
 <3a6f613b-07ff-4efb-8bf5-71e397b15876@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3a6f613b-07ff-4efb-8bf5-71e397b15876@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX4T1o6FLmQG3Q
 f/RKYdSZmQFS8xJHpovtXlf3MnwEJTLKdNnU0Fl/Ey7y0gIgokz1HwNDGrjlovyC7mzr6WgvWBe
 C8Q1FfvWaR30mZlJQnIKaZriBPSjVnuSWL5KDS/+uhuCrRyWa9+zSuw11IByLZg6zFcv4puyUTT
 tYmj+35iYpnrVwAnRnx/GVafSYEnmV9sLymLzgBVu3SvxFbUz33eGbNKK/8n9MmGUiNejf3U/Zx
 r/seN1S6E42iuJU+5Ul5UxXKvF1ow2tPtsoY2/GZqBvig3kSak3mQ3ATlrMrTLOY0FIHMiiINA2
 XNs+qPyd5hGqk4U6su/qOh7pIWVpo64KO8PRsK6MEYz2IuaoxisqdrImXBRVMpSNg4ZXxGa0X43
 tNmoiUdCFmjMOJbluoNeAXPl9CJhgbeMh5eMCXxiQkjCJ15WpltTtHDK2D7esnLw6VJ18nsqKAK
 9x1cHOLQZvAdEGvLdMA==
X-Proofpoint-GUID: X7GsbM8XSfjxdsSz0BAyNHFpydvWzLzh
X-Proofpoint-ORIG-GUID: X7GsbM8XSfjxdsSz0BAyNHFpydvWzLzh
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a06fb88 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=A2fHVZT_t9Wzl9UUSvUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: CC63E54E45B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.7.208:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,b017000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107808-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 12:53 PM, Kathiravan Thirumoorthy wrote:
> 
> On 5/15/2026 4:20 PM, Konrad Dybcio wrote:
>> On 5/11/26 12:56 PM, Kathiravan Thirumoorthy wrote:
>>> Add the watchdog device node for IPQ5210 SoC.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> index 3761eb03ab24..2cdc10529c48 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> @@ -236,6 +236,13 @@ v2m2: v2m@2000 {
>>>               };
>>>           };
>>>   +        watchdog@b017000 {
>>> +            compatible = "qcom,apss-wdt-ipq5210", "qcom,kpss-wdt";
>>> +            reg = <0x0 0x0b017000 0x0 0x1000>;
>>> +            interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
>> Are you sure about the interrupt no?
> 
> Yes. If you are referring to HW doc, it is incorrect. We are working with the HW folks to update it.

OK thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

