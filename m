Return-Path: <linux-arm-msm+bounces-118768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EBPEI+jdVGpOgAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:45:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DFA74B0EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="XD/6HwFY";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jYhuJ1ir;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118768-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118768-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CFFF30B2349
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC4140B6FB;
	Mon, 13 Jul 2026 12:41:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F024A3F23A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:41:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946490; cv=none; b=RmOaeHl99H2FoSwA2cWzwyYH+AHgfJ2kBdNTKWvaBs0ZhGlyqeC94G69xiHacns6+Jpp7Nmo6CWTpb0lDIoUQZtrZBO6YpAhimzhU5OfxJCV0oHjXisrbjv3VQkkC+UtjuHvrYCldJh9S00/d5vd24rDsqswIlN6mlOMYajg3D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946490; c=relaxed/simple;
	bh=UBOxMe6snk03H8KXANWmz7YZ42iRMomXv9GvPgDwznM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqz38vyEKtRGBAySA+ukC2gMbfI6g9wr6wrC+sHRSUW7xO29cPDUgNKWTC2wzhHcAghElbgaKlx5dO/0kdEbFvPaG+2yvssz8Zyp2iSZdGWLqMQ3By/r3PtXt8yWQuSWhexZjpZrKJCvV+75LdcMOYTzHrUjIMtVlmdcH9QNp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XD/6HwFY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYhuJ1ir; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE9Nh1210746
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrGlUkd1t4tn4Lj9oMaWKZVCqqsTJkCgQ0/5kZcq5/k=; b=XD/6HwFYjr5XH9MY
	nCpy+idC6tc7IkGGKKiZSkY6zTI/iBuPAjUjCAxKmcL2/wSFS2N1lnMGk9sZcW5e
	Y1yxI0yTBAUim9RCAj/LalEIoO5Aq0absAuzLb9/IorXvhpyFg9MtP9TijOcbfwD
	bu74FNh6W2aEpwYhkBDbsNaXvaJk+YukmqcakHnHeZYf/qLIsU2Lxx7efYiP+ehJ
	yYNeZlGGCUwWBgG9KQJyloGou4LVJytUQbttySqsCiKQXYNOYUKrNugE/zpbAUR3
	t0Hqt0qnXh+sHeZsqLQOFq2K0icAa8l9vxnJqIPYbLzI9RS8v3pprPJSGqYez9um
	ljgYJA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrr38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:41:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c33f48ee4so45907991cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783946487; x=1784551287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrGlUkd1t4tn4Lj9oMaWKZVCqqsTJkCgQ0/5kZcq5/k=;
        b=jYhuJ1irf6MaSZEceCPTwAyvaTMLGJpdy3WdNQfGFfsQuxBhvAT/9bqyrvcWmOQ580
         kKhekHkG1I0rzCdIlb9M7LEm8pPJAwbSneAwQA84ipHxlmWAf7kp8JpultYU2cB1smk1
         x/9Zx6pO7bXG02Kn2yJ3Zh8uLa5Gq4wuUaiZFK/afp1ohvOva00adHm2g21Xq9Da1AgZ
         c7+SJaCX5QduK7gOLfZhIRxVL2T63dblDAPbNhPjI5JiwBDkwVX3oR1khe+uvWy6DYiA
         P15khJMJil+G5DVJP4R/OK7oz0hADj62LAJHH3bPysM3ZijLQx2+zwyugN0GsOcrqyAk
         HP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946487; x=1784551287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrGlUkd1t4tn4Lj9oMaWKZVCqqsTJkCgQ0/5kZcq5/k=;
        b=bp0rSUzLj8Y0vQWmFschdV48Nm7Z2R0R7Ve20KAneZ/bZUNnlKQNoSMMv7x37TLsx1
         Qr+v/9y29jibrAv4J2C7XqqUv2cDygxVk+FgkVWSVAXvl2k0g5gy8AcUEdIwBqvWTEcV
         DNd1wjMPW++kMbbmPVgHcZJ/1rR0wpyMuDWho4tLLH46D7lwHbS5GzcORN5dnWQuUgQu
         ochSCY2C4nxt5lFAFFjDG/H8kkgE8TQGGlHK27C8x5tBICQR0sth9t28y8wX/+YJd0Cl
         dCYSEef1glvp+84TIDeh6YOrpnqg8Yq3Z4JDFNLPyrI71PCb9lpKRgAMJwtMYmRLr3Aa
         znxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsBENzpb+t1/yhBCgk27cIU+x8rEWzOIAcEckf+rRUUa0IBCQm/UcpRppJAo680oS6SicKqlxO2xRurT/f@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhs6oXR0lHKcj7W9xZgFORChlyFIAEwyeHiBl5xSYB7fzs7maj
	vpm1uORyDUryO3v3ThZTw4dnOyTCuDxr1aZaksOGBD6FsTq0+OHVKpAx5uuVW6FlK5YZBZDAqF5
	djAu7uK3GxaQFGojFUJ7ug7o6urXIRbm4umdN3nImc/Fpz7b8No9zGn4s1+Cv4z/V2iwu
X-Gm-Gg: AfdE7cmChJPQhuECLrgEaBd+gMEdRYE+j8/K2UDoTpai+aWV+WxLLPi7oiOXHrPsUli
	jg2RzukkKqvfuWcTT9GsYKXtwRdXOnJcAExSJeNsqTiRWLeBH4rLMUjduzT6pJKI3IAy2oDyxci
	qp4KT8cjhEbUouAbajOZ9kFSjAvGXntPVCNLtNby28OW8kiW5KLj2fqjGmU8Djn/Tcagzjo1435
	l3IMEEtV5zYz9XPRq9MTeJ69iAUWjwpO/9pjCE+yPew/f4kjos3bhvjlFkiXcGw7Puo8Liiy2LC
	GzrfL75rzC+4c3LkS841GTV7wmbE3OBvh1SvDsldIkFq2gSC5d4noJ8xYsdgpg9PHOrLxHWvMWk
	qmIfOBoIKfPU+5y3fRApYeg+2sJ4XIejfE9//yG4yCA==
X-Received: by 2002:a05:622a:1f92:b0:517:6508:e1f4 with SMTP id d75a77b69052e-51cbf213d9amr89229571cf.42.1783946487166;
        Mon, 13 Jul 2026 05:41:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1f92:b0:517:6508:e1f4 with SMTP id d75a77b69052e-51cbf213d9amr89229381cf.42.1783946486759;
        Mon, 13 Jul 2026 05:41:26 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82279csm1024472466b.13.2026.07.13.05.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:41:25 -0700 (PDT)
Message-ID: <eca9432a-f633-464a-a94f-fde20dc61ace@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:11:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
 <20260707-maili_videocc-v1-1-ef0828c0bf6e@oss.qualcomm.com>
 <20260708-talented-refined-kelpie-a68e05@quoll>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260708-talented-refined-kelpie-a68e05@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzMiBTYWx0ZWRfX/zUUiA1/ndFb
 8AzVGSDuLgTY2y6Aegaav5Xc0xtgURncz+sqxA/2UnFZzOCY38pt52oo6lBuFaXO9y6Jo4GOW+h
 tgnff5UE0EDPLn5iqquU1qIEedulUyJy2Q8IgxIgRWZZIHZIzFRqcsFl70bjz2QAwZRMjLX/94o
 ImnzrL9yH7JDa31AthwI0rzhHGnR2e21gZl9T7XoLVP8U0xkkIoM2DeukGjo9RCuKyQ1jfRM+ez
 YpfgDEEFDdnF7gjIZHNirO/4Nuv1JCwBzg9habluOQ2VCFgO9uaOZFxRGhuIVzcx4yFqUyZcx0i
 5/biGKddbuVYpEMDXLSOVn69xAGGeoy22ZwggJPFWHauNjinmpo0pgEA2HNWLXTGRS4KNstVnUv
 QpxGVsrq7qqx33luaSYUj4qLhmUaVHJvfDE+DzZcs8nTbFpZ9PjgpPoMB9+Q9icfC0WydyL/jZ6
 yloPXp/xbf5Gdqo/TaQ==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54dcf8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kJqTnYqXC8In28SSDhYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 3MLjL-xMxhsRrIQrAIajnIrvusw_SIef
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzMiBTYWx0ZWRfXwlppQhvLKv3g
 2NiDCQc8DMZ3xuk/eSAzoPnTlXCVwG2cA8r2W6EmMN/JrSZ4T2KzsytwCFkzkqhxquylb17GbVC
 zE2j0zqbuv1eK5soGEgJVOuVGj3Rvl8=
X-Proofpoint-ORIG-GUID: 3MLjL-xMxhsRrIQrAIajnIrvusw_SIef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118768-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2DFA74B0EA



On 7/8/2026 4:27 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 07, 2026 at 11:43:10PM +0530, Jagadeesh Kona wrote:
>> Add device tree bindings for the video clock controller on Qualcomm
>> Maili SoC.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>>  include/dt-bindings/clock/qcom,maili-videocc.h     | 49 ++++++++++++++++++++++
>>  2 files changed, 52 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index a6fd1992d6d2f9c05751de2dbf2b53fb96de2958..6281e5ec8036b99ca21740c7f679f4b55edbb87c 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -18,6 +18,7 @@ description: |
>>      include/dt-bindings/clock/qcom,glymur-videocc.h
>>      include/dt-bindings/clock/qcom,hawi-videocc.h
>>      include/dt-bindings/clock/qcom,kaanapali-videocc.h
>> +    include/dt-bindings/clock/qcom,maili-videocc.h
>>      include/dt-bindings/clock/qcom,sm8450-videocc.h
>>      include/dt-bindings/clock/qcom,sm8650-videocc.h
>>      include/dt-bindings/clock/qcom,sm8750-videocc.h
>> @@ -29,6 +30,7 @@ properties:
>>        - qcom,glymur-videocc
>>        - qcom,hawi-videocc
>>        - qcom,kaanapali-videocc
>> +      - qcom,maili-videocc
>>        - qcom,sm8450-videocc
>>        - qcom,sm8475-videocc
>>        - qcom,sm8550-videocc
>> @@ -72,6 +74,7 @@ allOf:
>>                - qcom,glymur-videocc
>>                - qcom,hawi-videocc
>>                - qcom,kaanapali-videocc
>> +              - qcom,maili-videocc
> 
> This I plan to drop, see:
> <20260708-dt-bindings-camcc-required-opps-v1-3-ae0871774210@oss.qualcomm.com>
> 
> IMO, this patch should be rebased and come after my cleanup.

Sure, I will rebase and post next series.

Thanks,
Jagadeesh



