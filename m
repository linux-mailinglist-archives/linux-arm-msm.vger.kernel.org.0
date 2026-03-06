Return-Path: <linux-arm-msm+bounces-95757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFPJIFakqml6UwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:54:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8264D21E42D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 896653009829
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6F834CFBD;
	Fri,  6 Mar 2026 09:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCIKXyz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOI+Tlhf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2181734C14C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772790865; cv=none; b=At2tmLUflYVC+GA9uCOzdEkwzHlgPl6Jjpio26VbTQJVEpHiGWcp6DHyjKH2PL2wN23zMwh0Gb6k97ex2bbdiqWoDDBpMzW+ZEH5EtJWa+FYwmr4pXS4DVyhpzD+F0JDBfyz+4PjDKt67UsDjFTrQz5uaC0gVYeJDDm+w1elq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772790865; c=relaxed/simple;
	bh=3X0Ae37Q1fLK9VO0izuDFVSUHv18wq37/WVrPAqT1jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFS5tWXTRT9viBxkNvOjWUK5Vwcdq3BAZCrYKxw+S+gz1rGTmxQ3TSq+i8hRjxEiQTnZdBj7p3ycOFbe8Ei/2zso5OXDGtfPDZZGn6C0OIDfbPIHeWG+DFWXPS6o34Ml9zyxyNmM7w9u/gDmLrT8dAPCpE0GeBsYwc5nccnHO2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCIKXyz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOI+Tlhf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264akMI266397
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dAh9VqYdtu294ZX50sAgnmUzh6qMAf/0j1gGwUeK318=; b=XCIKXyz/0x1RxUOG
	G9wEGO56LhiP1txew3/k9BmJBIMZ+VWvqSnNWMifpoGWwfbwBfI0uqkaEK9gRxVN
	X8it5sYE4Tx7Xsh21Mpa5HnwLW5+3tf/3SO7hJlxAGXbunsiUkDmyBviF5GzOBd/
	bXRn0yudPbGxZtbzLbIexwXnDXEhA+l9nQ8VZUaN2vo9Om9tQ7tcSJzhXfGk16c4
	DzYuf+HYTu4pOauCpnHuCXCL6VbB9Uk9dpCPsSwXcgIfGh3eEzPSWRnfLL9rmOxv
	JhFIyS/g28xZLS28V5cASGxYvniq4Qn8xxDYmykywR/yxOpTj/VMZNTlKp0kIsO+
	BW/TOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqdvku337-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:54:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae5031c6c5so246171785ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772790863; x=1773395663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dAh9VqYdtu294ZX50sAgnmUzh6qMAf/0j1gGwUeK318=;
        b=gOI+Tlhfn5RnbCd54h0DOt4kDO0qYthF45+FFOl0XgS3qnHSJJ7E0lUe8RmaobBgp4
         R4tNZ3ab1G4feRSvMzqx4PSj0YWDLxOakBHoCJ8DNC9bm+NHGKD1wzzEv448tnHFNsr3
         3ReSRZ9ZhatTZm5vue/lCGUPYNxc0sivDJ0fOpzgOXDURJGu+wnZ0ub5tOcpFaglfyy1
         aWTdPZy7gQ5SWe6JDqq/Z+JSGT51T8BTen2sg+aqsgDdNPNKQGW2IWsICdJW8Va+dGSK
         bIzS4gWbPPAP7GU/epD744aKMYEo0OeDxiuZtKXr/ednxZM8aeX9yFxo/dcDNMqwFk1q
         k+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772790863; x=1773395663;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAh9VqYdtu294ZX50sAgnmUzh6qMAf/0j1gGwUeK318=;
        b=VWA8yVoxroALw0YhqyBBk59g0uDTqmLEn43lfHFYwiJVMxyejL3iprIoH+gdO5B+nM
         9Tc5r6vaJnoCqxZI1+RmukFhEeuRx2E6XpudoCltxlX+tNPCMaDj5Q+jXygcgi2e9bN4
         QTwQVatZvSPj9gjk3Q57HrtbGKulEWt+mCy9anrYUEmJ/GO9ymFQoF5kplNWfAlvW57f
         MYyo1odKzAWA7VG8B9vawkhdscImzmn2senrxps1Dg3o2KMAynS7R7V1sX1iKwa0eOet
         eTdrMOMJB08x1XyqgOGUeDCFQZd/ic91seS7E/CVH6J99lEnjQIG5gldVWvFVsp1oMlh
         G6oA==
X-Forwarded-Encrypted: i=1; AJvYcCXDTrWDIyfL5d3jjkXVDd7Bd+5JkSaLP9TWalpcKm7pVYdYJlBeCPJsINbkK/gkTjZGSn1Zn6ex2B+98FFS@vger.kernel.org
X-Gm-Message-State: AOJu0YzDvfM+xq8QePuaBEzPWnT555Pa43GTMYA1EZ7GQbHitJFnAQJO
	MrzdJJ6hn59IR9M7ex15q0+ZBpSofRcwNWme/8qJj4BJmz0gArMwzdRwPAbSaq7TB3WIaaAyH9A
	8NwwTklZYcTk4zoIqj8Z6cBAgjerBM6sBoD1tT41GANAyy4HDOSlm5svz7NCMQ73irv1M
X-Gm-Gg: ATEYQzzl4r9TsT9bRD9poMkWirhiQqzF21d97BkP//5aBwOvUOd6wYktaQYBYVHVMNq
	gUQCVEqg6rH3qhod3/byki+0jEqFvjEJXn9nBX6j6eUdfB4JV8qDicu9AUE6+FF+eegsLLGsKPW
	b/az1QnS6yZbMe8jAm0Oospnclj+7kY0bCjJZ02hOGvhgzTRPLjhquQgbMz6eFOVgowO+c4EV6V
	FJuxxXZsbosZo3w3WGfE+dXutvAKOXf4uEB426hWXxaddIy74FuPdvQ/NLbjiDpdZSNb5TiZ8u2
	a1o4CAw1ifHi8uX4gqjKqMmtvyC4tTcdHx3LnDc8G0nwk2cvj7Ez1Wh+py5TOH/KC5ltxuPYJcL
	Mjj3YeJPJXyU2GXzMlZifH9jLA5ltC8XXwrv4eH0Z7P2nfA==
X-Received: by 2002:a17:903:2a8c:b0:2ae:8055:62c8 with SMTP id d9443c01a7336-2ae8243b575mr19020215ad.32.1772790862666;
        Fri, 06 Mar 2026 01:54:22 -0800 (PST)
X-Received: by 2002:a17:903:2a8c:b0:2ae:8055:62c8 with SMTP id d9443c01a7336-2ae8243b575mr19019895ad.32.1772790862020;
        Fri, 06 Mar 2026 01:54:22 -0800 (PST)
Received: from [192.168.1.11] ([106.222.228.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b1fsm19197485ad.12.2026.03.06.01.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 01:54:21 -0800 (PST)
Message-ID: <09e910cd-d0e9-4a05-a249-b0600705ac6c@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 15:24:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add Kaanapali compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260305-knp-qfprom-binding-v1-1-1b3effb09cad@oss.qualcomm.com>
 <dd14f8dd-254d-42a8-944d-f667153bea12@oss.qualcomm.com>
 <a1622ab4-d656-4015-9cda-4cee7f3044b2@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a1622ab4-d656-4015-9cda-4cee7f3044b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xA6iws c=1 sm=1 tr=0 ts=69aaa44f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=uL+hpB4jSAN/g3a/thif0w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VUY64QdsKBsrmivN9HUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA5MyBTYWx0ZWRfX6X8O6ordacje
 h1yl0McCz+aGoaY70JMWOgu4OuZ7uzT0eKWGW0A6On7AdMENFme4+PVRDdDQDVxTQ1xG3tdpwqb
 NgvjIKjj3pYxmLoV4/vSZrbuaeBzkPY3u00cIlkb8PYvcpmB32wPuSb1Wwt641F7+GqizMOQKK7
 EO40P0D+5zlz8oDEQmRT5pmT77Vj7PURabW6nAbZVRzg3KEyeYh21SQuQ3Jdin62iDLPaq2ir9d
 Bskwdze6EknfUdpK20ssE+mrmorsHotujUaWyjNOFFlJi1WAIJZ8N6s3ZTU6SKnl9mm7c0vlfuJ
 v5tsWPy3g2Qaf+eTIhJ3psJ2FYnXVs82mjbM6/lZfeV+iFOLmZ50uLBy26IeiE/JnfSvD7im9Ab
 nsE2JjimK4f6h8q13hW6d/Vq18woUC5jDQ7KSvmDnjot3H7n2/RyNwHr0YUDkFePgdT53lyvDNr
 9br3RSi73bpCliGcmrQ==
X-Proofpoint-GUID: udaOHv6Ug4ZUrK-fip6NPElLcsPunwUr
X-Proofpoint-ORIG-GUID: udaOHv6Ug4ZUrK-fip6NPElLcsPunwUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060093
X-Rspamd-Queue-Id: 8264D21E42D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95757-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/2026 2:40 PM, Konrad Dybcio wrote:
> On 3/6/26 7:55 AM, Akhil P Oommen wrote:
>> On 3/6/2026 12:10 PM, Jingyi Wang wrote:
>>> Document compatible string for the QFPROM on Kaanapali platform.
>>>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
>>>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> index 839513d4b499..2ab047f2bb69 100644
>>> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> @@ -26,6 +26,7 @@ properties:
>>>            - qcom,ipq8064-qfprom
>>>            - qcom,ipq8074-qfprom
>>>            - qcom,ipq9574-qfprom
>>> +          - qcom,kaanapali-qfprom
>>
>> A question to the maintainers.
>>
>> Do we need a new compatible for every chipset? If there are no KMD
>> facing differences in the HW, can we use an existing compatible string,
>> like sm8750's in this case?
>>
>> The fuse definitions (which map to nvmem cells) will obviously differ
>> between chipsets, but I am not sure if this alone warrants introducing a
>> new compatible string.
> 
> This is to prevent the case where it later turns out that QFPROM on 8750
> is deeply flawed under certain conditions and needs to have workarounds
> applied retroactively (because we're pinky-promise working towards stable
> DT ABI)

But this is a super simple HW IP, so make an exception for this? In the
worst case, use a SoC related compatible in the driver for quirks?

I am just trying to see if there is a way to avoid this dependency for
the DT series. :)

-Akhil.

> 
> Konrad


