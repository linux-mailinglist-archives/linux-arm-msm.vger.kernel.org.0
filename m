Return-Path: <linux-arm-msm+bounces-99983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACz3IlCTxGnH0gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:00:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73032E240
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF1FD30CAF20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC643803E3;
	Thu, 26 Mar 2026 01:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5U7tclx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwllT0gi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5C37B012
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489795; cv=none; b=opOJKX3ST6q42ZgpJp3CmCldthtSFOG65IXPYhlKl5YUQFEGisxNxaH4VpG0JFDkzWzMI2jaEKbasja3yQB5sCVEIRxhQcy8+ZzD786yurNko+GBi+SbaByo/GJOPMorruQ/+RSduTwtNN31dDkmDpzjcO8zxcnvq6fl0x6GpRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489795; c=relaxed/simple;
	bh=EeivOs92UFYicj7rost+GLPobGxernwG7JpYzbsimdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIVYbQ5Gjk6B06eJP/VojzDBgX4O374z85SRL3cD3ppfyLk1hY5CKNMXkpFJkAQCN904EpHESVC9fv+k+rJGoKPerwC7hQlwbdYSJiVLdummtAIpgz7vsEGmnoXUdkO+5uu1bhdYE8yc+XWO509U1LF5N8ovVkzWdJcIJf9zhu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5U7tclx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwllT0gi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKg00K1965152
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PUiEEnMAQ36ATGbtMZUbQwtivifyozOfZDa46WQkm0=; b=E5U7tclx2hDr+YDC
	gjqMEM9ME2gRZWrvHnbZOEkX/j61DDbv1gRCYG+IgEh2gcB1Ch3FkNh6uw1x4Egl
	2aLp2Ho8LUCrnvmLN4/OxPggkEoAzqUYW9kSd+cWGMbvDJv2pZS1e2hH1EkjJT9b
	2YXgSW6XPcTT3V8MCtWlj7N+h2f99zunWcMqaDKxzPZeraZelH9QWjgkn+UFJMn3
	peTGcHfLwrWzOt8hNpgGra77VhEBKJM41HRtTp3QUTF89nE6iu4e2cf3t1zAHMe3
	8hJOcGjfi5svJsRpkt9JcmiPJcGtDKKv/K67/nxW6zuKcg1+sq/p4nFeDZs3bGCs
	2Qxy8A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymgrw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:49:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so231904eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774489793; x=1775094593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0PUiEEnMAQ36ATGbtMZUbQwtivifyozOfZDa46WQkm0=;
        b=OwllT0giEugpOUTRS55VBUrV/9DQ3cP+7TvLu4AOUP/P/aLBwzsYaH5Y3Qnbz/2QAS
         cTzT5TvFAI2IBLcoL9uEhl61eq0erfaXHxOJYPDCl8jUDcJsGiSHQM0Veq2SDhGskvZT
         aZEu/HoT51kZ8AbOebadP0pzEDeAmZdMxmeD/ghnX2XFMsht+9FzPvANMeIeoPHd5eF4
         jHd8M5d+1vVbWaf8O3vibqkcioQgdlx21RV3UBgEDT7DRy3QsOfnbVwpJFP2ERy1GurH
         xi6y6nceH/RailBEVaegZcFCOIBUMw8RXpNoE1L8CALlKDzUl7gmQcksWoryiHAeSDcf
         lt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489793; x=1775094593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PUiEEnMAQ36ATGbtMZUbQwtivifyozOfZDa46WQkm0=;
        b=E4GrP/3+gBeQ/Y+svPjRmP91O71Rn8mVtYQRA0BGSh55UJxQhWHXYNG5hF9iZgnk2b
         JoVQl+JtzRB4MnlvaEjrEij58Mt4k07fE7ldmrElsCjT+07zE37quIFqWkBSbixcc7fC
         T4T4wRWAlSG8quP515LBvHCvJTg7eZjk8Xr/Rf6f6pzmDG5HcbKblQSXNg5JoLh6jej8
         kxFd5KR7KYr5w7j+3Jyl26xoZR2MXmTESGWb6eUhP0umnzV/mPWi0OovxCRjSNuydH/O
         t/tBbYf7mk0kXKIYTWIG1F3W6E/59JOC6mv94jJ0EkDGPDdl6rW7HK35/8U3PnXE5Iew
         55dg==
X-Forwarded-Encrypted: i=1; AJvYcCWDQAMm+i5dZ0mivVpbqBaF/qyLd9FCIexKfUio5BHEUb5qxBUxZnWokXZcFSdWyIBuroWfqtm//eD1Km/M@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZIx8jEdG5/rtlMNYzLAfMaqRyXuvfkXGPhlxxOJcYlUYBJLe
	oF5L88NNNkktIPKneS9ylQQ1VcpJWwKkGG/mnVuTIoWRbdPiFWM9K3FSzz4sHgFXTu7O6qXzXlI
	VvZjUZb7220xn8RG1BzGyiFO9auYkOTLXKPibBKossOm/SyCv0heu+FvSBfpAauzBv3iT
X-Gm-Gg: ATEYQzzLOjoDuRsLqrKjsbNhPEm3Obl7xKFtOmDfaIhApAeVCKAkPV2fAMEhlyCFW8e
	uNQtjt+tuw1veLppN7HE7HvqloBW8xKi8taKg3cS4N+f47PABcCbWHGDibqW7nwunAea/2GdwdG
	lTJ3BShANtw4a65mHizueVCeOCcJ1yFfuyFfU0N/4mLogLT4CHBRedaqLrVSZ/bb9n4x7zW6FIz
	qYNC7jMQTFngMuyNrX/eDUBXARCodrGdYQZwLmJ8qedAUOpur8rkc0KGUvvRsFActFrb443k9bQ
	5DcxZ5jAKOevf1+TMFmo+ftTJwj5xFuQ5ypD64c0hvEn+j3GU683Aolf9q1tFakvneOmXiok+UQ
	InXFWpYoyPEHKvMGT+3qufrnIpfIOR975l4Zuj9W6l9xlo8LEjT4=
X-Received: by 2002:a05:7300:5721:b0:2be:cc8:820c with SMTP id 5a478bee46e88-2c14b63d560mr3983000eec.17.1774489792960;
        Wed, 25 Mar 2026 18:49:52 -0700 (PDT)
X-Received: by 2002:a05:7300:5721:b0:2be:cc8:820c with SMTP id 5a478bee46e88-2c14b63d560mr3982974eec.17.1774489792110;
        Wed, 25 Mar 2026 18:49:52 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ee2a41fsm1250065eec.28.2026.03.25.18.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 18:49:51 -0700 (PDT)
Message-ID: <fc406873-74bc-49f1-8be2-4b089d0c8010@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 18:49:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_1/1=5D_dt-bindings=3A_connector=3A_Add_?=
 =?UTF-8?Q?role=E2=80=91switch_provider_phandle?=
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
 <20260324172916.804229-2-elson.serrao@oss.qualcomm.com>
 <CAO9ioeWxk_=HowH-FcEakL4EXFyAz=dyPwEpqSXPQfvmuvfPHg@mail.gmail.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <CAO9ioeWxk_=HowH-FcEakL4EXFyAz=dyPwEpqSXPQfvmuvfPHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YgG997ohTAMQACWLf5YpTVTAS_RnSngp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAxMSBTYWx0ZWRfXx7T0puFvJN/w
 glOiD0YN0Jv2GBgNsQF88aib1F9WU3NyRpMrgdQ6gBVtMlljQWy74bpKxrlJar9uAqCcqai0uZs
 dsRl6rXnPfnKHL/uaqhn6mgEaFcVk6tPKxTQCk1BIdL0IUcjre71TZz4Gvp5J2hrnzdSvjWQEFh
 7DDv59Y3bFzegL8syUMCYds3eatSSnfHfQlXS2KBJ6SBzyqDHSdmhRKumEcREJlgMD+k/1OY94z
 DO+uol1bYANillplQ1RXcV//Dq+44gD8KMl/EzB9d9xqPe0EGuE05cp5wppX4tDLJQeUv0+dUKB
 JIIqqsmu3tbyRKSfEZ5Ib8DJkwoh3lhMfHMnCiW6Vs7uwvDk3A+sjRIme6Pe1Gy/Tlv1C3yzOc0
 vRM9G+bh8ICdYMggbl6istKSdqOjd9sMLwmzuSxJXMdwZbqcgDg1FmjwlppZ6aNTmjCWL59hfSn
 SiGPybgROsOqtWk6vtQ==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c490c1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vfXj0wn94qoC9zwMpVkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: YgG997ohTAMQACWLf5YpTVTAS_RnSngp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260011
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99983-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF73032E240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 10:57 AM, Dmitry Baryshkov wrote:
> On Tue, 24 Mar 2026 at 19:29, Elson Serrao
> <elson.serrao@oss.qualcomm.com> wrote:
>>
>> Add an optional consumer→provider phandle on USB connectors to reference
>> the USB role-switch provider when no direct graph link exists. The DRD
>> controller remains the provider via its 'usb-role-switch' property.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/connector/usb-connector.yaml      | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> index 11e40d225b9f..ef8d3d26461b 100644
>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> @@ -95,6 +95,14 @@ properties:
>>        - device
>>        - dual
>>
>> +  usb-role-switch:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      A phandle to the USB role-switch provider. The provider is typically
>> +      a dual-role (DRD) USB controller node that declares the boolean
>> +      'usb-role-switch' property. Use this when the connector is not
>> +      directly linked to the provider in the OF graph.
> 
> This kind of properties has already been discussed at least twice:
> - First for referencing the DisplayPort controller from the AltMode
> node (USB-C connector)
> - Then for referencing the USB-C muxes / orientation switches when
> there is an intermediate chip
> 
> In both cases the agreement was to not add such out of band handle
> references. The solution was on the software side, letting drivers for
> the intermediate devices in the OF graph translate and resend
> necessary events.
> 
> Previously we didn't have such an issue for the usb-role-switch,
> because there always have been a direct link between the USB connector
> (be it gpio-usb-b-connector or usb-c-connector) and the USB controller
> (implementing usb-role-switch). As with the EUD this is no longer a
> case, my suggestion would be to follow prior art and let EUD receive,
> interpret and resend usb-role-switch events.
>

In this topology, the EUD hardware spans more than one independent
role-switch relationship, as a single EUD node is the direct neighbor of
multiple connectors. This introduces additional considerations around
role-switch discovery.

One practical consideration if the EUD registers multiple role-switch
instances is that fwnode_usb_role_switch_get() ( which relies on
class_find_device_by_fwnode API), assumes a unique firmware node per
role-switch instance. If multiple role-switch instances are registered
against the same firmware node (the EUD fwnode), the lookup will return
only the first registered instance, making it difficult for a connector to
reliably bind to its intended role-switch provider.

Supporting multiple role-switch instances in this model would therefore
require extending the lookup mechanism to allow additional disambiguation
(for example, associating role-switch instances with connector context).

I want to make sure I clearly understand the intended modeling and whether
these USB role-switch framework implications are considered acceptable.

Thanks,
Elson
 


