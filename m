Return-Path: <linux-arm-msm+bounces-95846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA17HzPrqmmOYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:56:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3DD2232BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2243305A966
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DEC3A9DAD;
	Fri,  6 Mar 2026 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fb7/MBaS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bl7LUNUZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984A139E190
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808894; cv=none; b=TO7hhI7Gqb+FRbEdA/imXqd/2xpFgcUQvY0M1qLLxc8zzyq0s44NDkcalQVhuAC1H7bxdb/ik5uwN+DLPVFoxnoUD8BmRCIU5GeTteqzMMAG37Iwve1nnAALBsEUZDy/+v/8KfN5RwuVE1WbNVxOkZJZaS7XnMJ93GOIWwIFDfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808894; c=relaxed/simple;
	bh=vRXA33YAyKWIWqUJnitNhk2Mbm7qTnSXtav+2nonONw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gE9+gbNpK/eDuWliCX3FvFPkIu3OL/Is4PAAb2qArqlume8dp8IAgSXVMraEPMmKO763UhFdP+2HBKYSVzWyrjk8DSxlXvu3YAeTRvAijE111tHWUrkHLaGiXsRr6O3ZEkY27dGO51DhDI527ywLeJUKIBrO3/h51ww/KPYpUK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fb7/MBaS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bl7LUNUZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbRQK3727616
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jo4dkOGKYzreFcxdLAk2wdt1wGBisTqEORae+est4I=; b=fb7/MBaSsRmjj+oY
	NbVGoj2FI5KdrLehxJBOqEEghYoQ1aLrH4D+HBHN5yNgzrX2av4m2+GuIYp0NlKM
	QmD+F8jPMGHMJGVQgA+K+yAQQRpWxUuZRLmTiz9DSwh54jNUKpn5ChPFaQjFyaY0
	1MIrupWuIoujMKjKJ70v62IRc33gpUnlIQXwblF4Ff6cOZtNPfJSCUaDng/RnKsQ
	DdKIj9XyQnfL1jcKzAA+o7yR2u0Aljtq4Z/81Yt2iIKk1LPbgd/gXDbO/TfV8Rkn
	XVs1PNL4gOywHPSDaju+0Bn6YZWeDXl3hX7g9djPeb+C7Oe2MYr0gtJX9s4OEHym
	Zjyk0g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp436yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:54:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a6463afeso348908b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772808891; x=1773413691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jo4dkOGKYzreFcxdLAk2wdt1wGBisTqEORae+est4I=;
        b=Bl7LUNUZ/IOmKVsYMz2Bzr7rBRtiC8RtmxExiZi+WXEfUWy5XKFfs3ylimhE87VRLM
         pX0t4Dbg1oPzMrdETqsYRXFO14w1ap0Yh4YbqBOXzhzG/isRVCGFIS7bWWqo2RYP6syH
         Hn02FVLs1bsWYvLzDKsMfvqWCdi+S9xx3m+a/wVcn04LMiQN7l8iKzu2NMMBFHoL0w9/
         sJCMYRCf2fIEcs4ocm0UXRks46zaGJfQvGDcK8N3zE0CddBTZhnDoCM27TyKfwlDU79B
         pmunR26EQtLo5Re9rZrGZSQJzc6uQU3KbUfauliD6JLe2P8yHvQAhE7BmRI4bINdNAOm
         mycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772808891; x=1773413691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jo4dkOGKYzreFcxdLAk2wdt1wGBisTqEORae+est4I=;
        b=rb3cYLlR3bWyyfFDUJ/kEMr0XZ2lR1L4qXv6EphutEUTRSodEkPpiq6fKCpEpIbozx
         YOpk05eCwD5UhcNToZJdqZGJS9yV696So45Wd5l103/ce6DnwfyOk/GEAA5Kr/XiI3Um
         v7M9OisTEVx3dxB19Rch4QlICoohBRaJ2JqXgKMN72OZ/lSibEe8avoh+DMDjsBsZJVI
         pifqBFQxI3fKhYjJKAvl5d2b/xOu8BH1iGO1fksgM4hqrRHvZfNiKRI6wifKLpah272g
         TWx8cUDgAvjV1spnBzvWR/Bet/J709fS8wuSx4SggcSYc/XkBUQ+Z4uRFYM3/Ef2nM8R
         XeEw==
X-Forwarded-Encrypted: i=1; AJvYcCVaJe0EPRg75GYdd7YVnYnIwB4E+fGocN8VarqGw79U8WQicaWxPjPZI+SRZ233uR4BUchYFP2FYSA0Q+u9@vger.kernel.org
X-Gm-Message-State: AOJu0YyXYpn9+cEwtZHp3l/o6y9SNe4P9yRd52gp9ycMws7AoFNAgb1E
	SXe+dhyCZoSQ9sAVgHYE83XseEhCgty4gFhzxIG4qRFrvbS5pYXTmn8tP9EGykKJR0qt3/v0o35
	x2lR7uTf+FQ3eorzt2rT1RMD5Uv5iEjrZpgcGJaRsnFnzZpBrTqBk0vUynTEuFe4W6cqo
X-Gm-Gg: ATEYQzztMcH2lWKux6M1lUrxoIT5uqLhUW6eMaxmeXAVD4cWrpegNy3Jvd/q8LGsXbe
	t+mdWHuwe7jtK80xGphQMQlMXMrhg+mXhblem2SeMBjUkJ4viOeVU1aNiryxz7900omeHC4/SCR
	v8GdWojQYPx6vKHKfkUjQEIbww9uJvu9wBw8JGqfHgpCyfQ+Eg1V8rzSADpBjBDOkO9TbU0tUqs
	4HHHT439V9OYYIoHqU/s/k0XOTm7pBw3fcVobsf1Q02sqivdosDaWKEHomtimJIYVY58tcGv3FR
	poSiP1nV8I0ne/tsLQPog+LiWFibxMQFHFdz0EtydkDRVroHu45/klAwhU+RxhsrSV/w6j3gupP
	jkIoZRrjTTbDnZbSfZTAQNNKpEPjTLO0s55EIOWKRt8s7GN9ai77m7fjh9tEbUBZ4WHDGlXj7B6
	UqUbrjsiDaPKk=
X-Received: by 2002:a05:6a00:b483:b0:7ff:885f:9c2a with SMTP id d2e1a72fcca58-829a2d81fe8mr2047806b3a.12.1772808891290;
        Fri, 06 Mar 2026 06:54:51 -0800 (PST)
X-Received: by 2002:a05:6a00:b483:b0:7ff:885f:9c2a with SMTP id d2e1a72fcca58-829a2d81fe8mr2047777b3a.12.1772808890773;
        Fri, 06 Mar 2026 06:54:50 -0800 (PST)
Received: from ?IPV6:2401:4900:88f5:81:e13b:ce78:7823:d9c3? ([2401:4900:88f5:81:e13b:ce78:7823:d9c3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d3871sm2054793b3a.60.2026.03.06.06.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:54:50 -0800 (PST)
Message-ID: <3e07a299-0ee0-4bd5-b474-b320502c5ff9@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:24:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-1-dbbd2d258bd6@oss.qualcomm.com>
 <20260305-hairy-hidden-stoat-5c1429@quoll>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260305-hairy-hidden-stoat-5c1429@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hYwDcTzGVwwKf_-s9oIJUa8nISZI7zG_
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69aaeabc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6d1n1Ba-E67CpG4V2ygA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0MyBTYWx0ZWRfX79JRuqy0r83y
 LvOWSGPk3x9je6PSQN3yLPHy8jsaZ3mwpy05cU3Y7YCThDJBz8HkJvtWNs9o5MAU5xt48dk/rlE
 Wkt/HAJi3kYJbB4sVN8WQKBzkGXil4WHWY2snq0NgicLxvtv0O0+DdYwTz+pwTQ2qsAsXUaqnwE
 P/mfl0a4u2xDr87tkz4EBSzwVqa3b4IUNuWI50hbc3i/yOEoJyAQM2cxYSaAzo6eqDVm1jZjdwe
 juknntkrTNVLYNLhvZICOGlly8P5ebMZJDTw/izebhDAhaURDCSU/YV4jJvWnWrXvdMgMR/owJH
 EHnI1/Z1ul/KawlkoS4H8I94s45pIiddcNzuah+DouuUx+3d+B7x7iR/Gt5ghFZ5wD1YZxl7uVx
 Z9/ku9qjpkWdzkAoR4F153NEAqfpNVCg+R0BeFZGo/nyo2IyKj5AM8YKe52fjQQBa85gOKF45ai
 aGD80f2SXzVhxva97nA==
X-Proofpoint-GUID: hYwDcTzGVwwKf_-s9oIJUa8nISZI7zG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060143
X-Rspamd-Queue-Id: EC3DD2232BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-95846-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/5/2026 1:17 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 04, 2026 at 11:10:51PM +0530, Jagadeesh Kona wrote:
>> X1P42100 video clock controller has most clocks same as SM8650,
>> but it also has few additional clocks and resets. Extend the
>> SM8650 video clock controller bindings to include these additional
>> clocks and resets for X1P42100 platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
>>  include/dt-bindings/clock/qcom,sm8650-videocc.h                  | 6 ++++++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..e8bf3fcad3fabc4f3b7e8e692c6c634d1aed9605 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -30,6 +30,7 @@ properties:
>>        - qcom,sm8650-videocc
>>        - qcom,sm8750-videocc
>>        - qcom,x1e80100-videocc
>> +      - qcom,x1p42100-videocc
>>  
>>    clocks:
>>      items:
>> @@ -67,6 +68,7 @@ allOf:
>>                - qcom,sm8450-videocc
>>                - qcom,sm8550-videocc
>>                - qcom,sm8750-videocc
>> +              - qcom,x1p42100-videocc
>>      then:
>>        required:
>>          - required-opps
>> diff --git a/include/dt-bindings/clock/qcom,sm8650-videocc.h b/include/dt-bindings/clock/qcom,sm8650-videocc.h
>> index 4e3c2d87280fb9a37cbc52330e31b0710ab63144..ba2d231e9dc8718bdcc07f994577cf68413dc273 100644
>> --- a/include/dt-bindings/clock/qcom,sm8650-videocc.h
>> +++ b/include/dt-bindings/clock/qcom,sm8650-videocc.h
>> @@ -16,8 +16,14 @@
>>  #define VIDEO_CC_MVS1_SHIFT_CLK					14
>>  #define VIDEO_CC_MVS1C_SHIFT_CLK				15
>>  #define VIDEO_CC_XO_CLK_SRC					16
>> +/* X1P42100 introduces below new clocks compared to SM8650 */
> 
> I don't understand why X1P42100 was added to SM8650. Last time I asked
> you not to include other header, thus solution is to add full list of
> clocks.
> 
> This is completely wrong because you do not have the same driver!
> 

Sorry, I misinterpreted and thought it can be added in same header file. I
will create a separate header with full list of clocks for X1P42100 in next
series.

Thanks,
Jagadeesh


