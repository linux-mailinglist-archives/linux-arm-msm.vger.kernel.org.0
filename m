Return-Path: <linux-arm-msm+bounces-117430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EURSJ2iKTWp31wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:23:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DE7720610
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:23:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JaKmF/A4";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f40nOzJR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117430-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117430-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F28893034DF4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 23:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C432236A370;
	Tue,  7 Jul 2026 23:23:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E542F6560
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 23:23:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466588; cv=none; b=Z1Vfaw6LeRY+5qzI5N60K76XaGHeaQk7oZ2D0TiOk45D+/tU0e8m3V5D4am+2TrBPjRNQnsv89dFTo/mDZKY7RJX1C4Y+d+0Op7wHoJtdk2raNdARPD13PpZ4xUFCv+gtrvwP9o6pcrL3vkx71osUlkszgcp0HUy8iVigRfr4D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466588; c=relaxed/simple;
	bh=SJa3pQ8h3Kv91gDuryXySxmy3NsotB0qcSocnnfjDdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfJZHPKuG/OWEPAKeJvlag33+zTmbr95sebAFERtgeHhQ3rM26PPABN/h7P9aZWBl8uOfXBrewcW8S7kMD8cRYFHUKZmWXLGhhY2TKP4trrKJYfUT3m3RX6xWe7zzHiJxQSR79FkOnkt5xw0JNLJwEBUErUpp9+CekWqfIw3ilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaKmF/A4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f40nOzJR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Mcx1u961816
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 23:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qcPbC/1smoMIhS6pthmDany4hLubp0OaErXI33GxI8=; b=JaKmF/A4ybzL+k84
	G/bjkBIdnWPmluT5B6mXJIwZzA2RsAFLCXR+yPPxIH/P87FdbvYoG+6rxj/j9Ll4
	LlpInFwxRGbInHqT/2lLPiD5e0j2FuET8bBs5HZubWoSuckejgJ0XKZWwMTRqCkm
	sIg4kwvSrwSlpiwRgl8YvVFHUrE97z3q9z9U3YtguPlt2+8dmvgzUvTrsHTRDh3h
	azbJchmeIpYpW1rV6yyh2ch07OsnP3xrwrtQJK3bGkbpYVBStqHPOyTgKsnlGKMR
	Q8jSsJwSmqUHUNW12Lvsou9f/n5TmM1Z4L1O6LNmNreMufl/jbhFWzFaeAq+r++d
	2d+yMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdjc668-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:23:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so2598095ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783466585; x=1784071385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qcPbC/1smoMIhS6pthmDany4hLubp0OaErXI33GxI8=;
        b=f40nOzJRKt1oRlDRH7BraqpGq0Cr5NTHuHJuM8iJ7qOhL93OR4wkmBhkUEf1mXMJ9o
         E+tynEawlwz3XUi/ugytlQeWMVi4ptXOSgnelJ9wP+RI3YOAwLvAGKYv6bGREgbcNIVH
         lfcS/+yLjHWzbQe+kHWP0SgHmm00I52hGdVrUPqFrOWTOhF0mCUNDG0XuIlL0dJ0BvGu
         wZfVdYahCc5MEVRlCozdy7uEwCWWBQnY+u6/T++BAdRMmBnYlCsbBQbttFcyKxhq8HkE
         JxsyH8Kfn1Bl3lVUg6jA1Sl5YMf3A/uFxu8udEAk3uDynXNYipv101qHnAr1DXTwYuDY
         wuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783466585; x=1784071385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qcPbC/1smoMIhS6pthmDany4hLubp0OaErXI33GxI8=;
        b=s8zU/QUAfg/3daOBE9H2CZU6RXE+YieGJET4C7nm54gGFPTS2+zmfGuDvOfTl8e9Aj
         4UH2y22BxFncO75MNlYqJMXKfe2eZA+YstFTjVEw1XWEBJg51uACjRqPP45XdIDlQNU4
         c5Bj/EYfAOqoxiUIR+tNlgLj308dAYykOweH7mFMhioygL7WbBfKT8TXkVXfw5v2kjFV
         vGCYmWmiqhyihu3VV7bFovu5pdfNa5S+ISyJBbjpa5jb3bRa4hI4wNRtFIiuMXzN9gED
         c5cXD2ZPzh25mRdHOhrJ7RT/0jroHC5UMjkv+7DOpZCsXWoHNeYTSJUp1dRZPROumCCR
         sMSg==
X-Forwarded-Encrypted: i=1; AHgh+RqIqlH70y00pXUH15WpAdSV/oBbqJgWjJgQlXIhrCofQUKVySOdHeqpMestIgpbBU4pKJYp4qSl9TAC8KTq@vger.kernel.org
X-Gm-Message-State: AOJu0YzSM1/2rCUtzy+7QwZ5B098MHiTxabQZ3BFU+ehYy1TA8rHszCJ
	/W3lsa/4bDhVHLuFpKzB7uHMrwQqp9OwbORQtyYGpPG393orPA3o5yB5AD9RMMTcGfP9Mzzn6y4
	JxKVjwFTvaeY9houa/06ggakmb9RTHzL3PtW8SpYb0fo/r30nfNQ4D2vXm/Dn7uk/Or+l
X-Gm-Gg: AfdE7cmZm6OcpZweVqhxnHlXHTZujE4lZ2oHnsC1rRoDivTuem8/QQvdSdGMjaNDRov
	+t0+0r5VQpl2orV6BlKRudHEUqhYbH6rhaZ/Km7KPVOUJuTrXAwpqOb5QPB2qc/gxpxTsJrei2E
	ttmCYWyo6uJe9Ox1o4DSBSUf+vO1uBzDJzS3BLvT0kC1KmfjRNzKYkWYr6anngA1IrD7HA4yv6s
	tobTl68CWJBWhU6nl5t5N7TAu2vRWVRAwnfN5qldSbiPuDlHl0biCkERw/riAZX99EXy+HpBMGK
	o1o1N7lg4CgvwtTfb2VSI39A9vDHtyUri4i4ColmvZvdZS5UlghHVEuRnJWXXbBnGocj5oTjSFL
	Kr9cIyaQxjlptX2PtSECS3nHWNTsidp/4vvMvFvX5aPDk/XGABqyrk4tUE5V8ZMiXSJzTjhz0bE
	/nWME=
X-Received: by 2002:a05:6a21:3295:b0:3bf:a36c:5498 with SMTP id adf61e73a8af0-3c08ef78172mr8408715637.48.1783466585188;
        Tue, 07 Jul 2026 16:23:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:3295:b0:3bf:a36c:5498 with SMTP id adf61e73a8af0-3c08ef78172mr8408679637.48.1783466584626;
        Tue, 07 Jul 2026 16:23:04 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:b897:54f3:b10a:6577? ([2603:8001:7f00:fc12:b897:54f3:b10a:6577])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm13112035c88.0.2026.07.07.16.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:23:04 -0700 (PDT)
Message-ID: <088fa4b1-1b5f-4991-97b4-9654eab66253@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:23:03 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
 <a8ea64e6-1808-43d0-86c1-e71d233f7846@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <a8ea64e6-1808-43d0-86c1-e71d233f7846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d8a5a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=euQb0ivSr0ruaFWTCHgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: s3tZj5CtgdTNHM0NSyJp-y85oQ3jC7-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIzMCBTYWx0ZWRfX/yoiwa7U3+VW
 J/SCVzp5gUk8+PKGRNq1mMyrpmfU0MeKcECZGG9waoRboJI5pIamHchNDFZgS8loroeeMnUSRtQ
 19n6Eu531MBrxiaWM0AUeJgTyph/Vq0CJVZp8KWRKyPl1BN51P523ZopLqQ8n56Mafto+wC5RpP
 wwpNNoxzb2UaTs8RKFpH4ZipaezXJmFiyX+cSa2ERvWt6eFstM9lwHee1/K2DD6qB4LFg+3jitN
 3IpMjI9Gw5OsEOWLmsyMFRW+DweV75Onfu34209Hcun20cio2IZU40BFCQcE8wkAg7pQbaH3fld
 tYpqLtlUEC8OJORmyFtT/C96IfOCUMKk/oxsjMEAoDqpkI7ZMWJgrsBiEq8YdNIqF+DsRUztciP
 fFpTTDFDshEO5YUa5hzOxZqWJsM4ywiK0FeYIQcyv37ClFI4EREt4NV6oS6kbg0tEYmCC5VkXWQ
 vzWk9qmpoU0/AQcgM4g==
X-Proofpoint-ORIG-GUID: s3tZj5CtgdTNHM0NSyJp-y85oQ3jC7-6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIzMCBTYWx0ZWRfXzxW84XpKT0sh
 4TXRXhoSSBn94B13r36wqvJklhslxg9Mb69FTHNbcAIUkj1tdsE87wqjWi+G2jDLtEx0vP3gsNv
 zBV5CikmEDacLvKAD21Mbaq92DLo03s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070230
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117430-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01DE7720610



On 7/6/2026 2:27 AM, Konrad Dybcio wrote:
> On 7/4/26 2:05 AM, Dmitry Baryshkov wrote:
>> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>>> independent High-Speed UTMI paths, depending on the SoC configuration.
>>> Each path is distinct, with its own connector/controller connection
>>> and role-dependent UTMI routing.
>>>
>>> Because the EUD sits between the USB connector and the USB controller,
>>> it must relay role changes across the UTMI path. In device role, the
>>> EUD inserts its internal hub into the path to enable debug
>>> functionality. In host role, the path remains directly connected
>>> between the PHY and the USB controller, bypassing the EUD hub. These
>>> hardware constraints require per-path role awareness, as UTMI path
>>> roles may differ.
>>>
>>> The existing binding models only a single UTMI path and assumes a
>>> uniform routing model. While sufficient for simple device-role-only
>>> configurations, this representation does not accurately describe EUD
>>> hardware when role switching and/or multiple UTMI paths are involved.
>>>
>>> To address this limitation, per-path child nodes are introduced to
>>> describe individual UTMI paths through the EUD. Each path includes its
>>> own ports description, allowing controller and connector associations,
>>> as well as role-aware routing.
>>>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>>> +oneOf:
>>> +  - required:
>>> +      - ports
>>> +  - required:
>>> +      - eud-path@0
>>
>> Do we really need a separate eud-path node? It doesn't represent any
>> particular part of the EUD device. Can we simply add more ports to the
>> ports list?
>>
>> For example:
>>
>> ports {
>> 	port@0 { endpoint { remote-endpoint = <&usb0_host>; }; };
>> 	port@1 { endpoint { remote-endpoint = <&connector0; }; };
>> 	port@2 { endpoint { remote-endpoint = <&usb1_host>; }; };
>> 	port@3 { endpoint { remote-endpoint = <&connector1; }; };
>> };
> 
> I think this was originally born out of the role switch framework being
> strongly tied to a single OF node (because the way they're found is via
> graph traversal and not via a phandle)
> 
For additional context, the rationale for the path-based topology was
previously discussed here:

https://lore.kernel.org/all/CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com/

Thanks
Elson

