Return-Path: <linux-arm-msm+bounces-116722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f3adBJ6US2qxVwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:42:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D4B70FFF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:42:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MDp3WOPB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=br+uPvPC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116722-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116722-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B45935F0EC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519FC414A09;
	Mon,  6 Jul 2026 09:27:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FABA41DED1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:27:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330046; cv=none; b=OuuY24fYtuzb+qH5nEx782l7R0by3VSIiO65w08N/QSNtJDgMkZy/bxJFy3RhApbc4ufj9k34ewJGq0h0H8kArpSc1fg3NXZX6rcBRjOg7kv19YDgZkKZ+kUX+OaQNe6YKJ9ZkLcS4U87tttJasC5UOBZSFuoRFgp1t/EBDLZGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330046; c=relaxed/simple;
	bh=pVIzRx7/3pDzYwRBGmmo6zbIA5I6GEQY9Wi2ilXolNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GmzLvaMeymvGHP7irPzAVWGHncsl/PhM5WxnsVc9ANSpHZDqCfYxbFp6wx+BU1Twnw+8rzJ47CTrSu56KugN4uBG98uVTAl4RhW1FKlDyM97VblDyo7U0q03CDqbNmgJinYinEBc3FgBY04FHEGTHIiknveBS7ufMMVlMdTExZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDp3WOPB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=br+uPvPC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669GsQ7160049
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rmx68FLc+1V6u5fO47chg4Oulq0rzzylrxhog42HTMg=; b=MDp3WOPBRFA1Ic0G
	hpoo9y2k2jpKfWuOQz3s2HzjAT2oWoyUBmNocOrS24wi48B8US2L1Jud/304G9hr
	ZI763VHSeELLNU+Iqj30SfWi9/Q1N+I7CwRkjjqtAMHSI514DCJPvFqpcKE2axhP
	1D7Si13pxWzZQDbIVj1lkvXEjHsGdvV3GAZehBXAL63MqwDx8NQXFztYsOUn6ap6
	O59v0g972amioxr46itmTskTEB1GM/NjaPvX4Df/h0v8K/x/EU1JpSRAjNfUz3Tl
	O0XPqUeJZD3RwsCq5sFRDxKGaWmZ0aPCrPWo+jp/pWr4/tihBNITEqOBfuPyWoq2
	E2oXFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr15f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:27:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e9c0c4492so65005785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330039; x=1783934839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rmx68FLc+1V6u5fO47chg4Oulq0rzzylrxhog42HTMg=;
        b=br+uPvPCeVg+g17z97He1w7yo4EgQZ3cCn47fhxwwpa4vs3bI2pv3PH23p/CqMcHqF
         V8xrVIYhqIso4U0BemGSGuy0HZ/us+9Up9rRMDl4N19RVayqzVFjr1qWdb/1BZM64AjB
         bpjnKhkIRw/Q+6Yvjdff7FgWsTGsEdbcVdKgSu/wch4lCFHvRpVE9OzyKTBPngiDqpy2
         7PTpRtO4bY79bjjSTgHv5KC4xZIv+uq5zZF226LkZNkUxD/PJI5QIG3J/ZIARFQ/7RVu
         3H5uJ/HwecO9i/4iwTMUHf+0XCqPDsfsl5XDAg8FMvW98wzaFp92cb8Vy++1pqXmm9zE
         wAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330039; x=1783934839;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rmx68FLc+1V6u5fO47chg4Oulq0rzzylrxhog42HTMg=;
        b=sl6kluQZKimpNoDa+W1oIRW/F9srcwY/ZeCO3f0GRtKLgUVVNh/sT5x20kHCEAhLWi
         VN3flYMRrGri7QW5xORBa34zwd17AkLAc8TY8E/odlwR2jD0eflGSrhYIPycC+xueXAf
         k2TSHYa3BzpdubI2IRs6v40mzoNCfBBfkrGsuio1B5V2kc6TC86xiciR6tlqrzYz9rTJ
         WGHjS1JZVbAsYWYd9av6gd9GCqedPCMllGXHqbBSOTS3DfnTsmubjDXB4jD8MOmrMali
         6buBGCnS7xt+v74hKg7P/Zmy1w5K54W7EsoNrbN77EiF8bfJ8pWHlkxL+XAvXdF95pwN
         8G3w==
X-Forwarded-Encrypted: i=1; AHgh+RoZ1hkKJ8uoXNMP3NHPvUQ4HPAdUBSowSIm+3QJ1IGrJ45RZAjczwzWV4AkFVAD5P6M/fBTpyqLf9r5xJm9@vger.kernel.org
X-Gm-Message-State: AOJu0YxmgMaeEtVKR0a7XZ/RqAaKjLqm2KUeD6hfeFYRl6V5yUJaQozD
	TBsaFupiIkix4PdKf9qQWTmCjCGrS/fxNJG7wXtSq44WvE6Fm2TssOCB4oMfCl6q6O4iLkY0zqT
	FvP7foNJxVTisatmbMj7jaFOUInr9AD92cEil6dkBmr+Q+e/NovwdOaeYY048LXHqD8Sd
X-Gm-Gg: AfdE7clB3ctszFLc4OWiHdhg7aaNEf/AdqTCZ6IfXVokn2jCTFResraWriIFGW5ub8H
	plUItG9wmzu59TNbX29ndVUbRx7GACk8f7bxL9XYj9Hnc73O9xAf9lFjmxYzR8YHHn4PswQQKt8
	skntoPBL+niCC9yj3yvliXU7PZaOawP2Vl2PMSn70QaMYPx5oCQ9Ima+sPowLCYvuv77US/oOxE
	E+gqeBOw4AzkYy8tXWh1LlCGaR4Fh7hf3jOUmOQ7f5zoQ8LGe3o/ZS96FS423I4nhL/QZP1pCwz
	cJgvG9HTKcFq7n5DcwPVMuIUpV3fFg5PUrW2lUA2qkT4/Vn8IJ4qxm7Nn9AxtDe+tQ3hQ3XccY6
	IBMRx9W+N3aqEZERzgCFIqnZdzxnNvWhmJwM=
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86597531cf.6.1783330038905;
        Mon, 06 Jul 2026 02:27:18 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86597101cf.6.1783330037493;
        Mon, 06 Jul 2026 02:27:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b609382esm704610266b.18.2026.07.06.02.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:27:16 -0700 (PDT)
Message-ID: <a8ea64e6-1808-43d0-86c1-e71d233f7846@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:27:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cwc6a2d4fasizfe54f6yvpgzkczbygjzkcoo4jlnn6tjaw3pei@m3py42bcnooc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GK6LJSx2ZcUag9XdllYMuUXKH0jz1ftM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX2YJ6wNIZ13al
 jp8jlgznSUs3Esa+3w+X+nra9usYxuZTXA4U/lwMdYEVKf1YY4VLYTRCdD4UpzOMdtV0Pub8boj
 18B0kW3gNpsCjUpiTGhP1lWobbfylNRWbit48Wuv6LlhP3Y7duEg67+ldMPFeRkoE/SxTp1+jcX
 jsK5cFq4ixhZPu6l9YRuTRaFSm402PbYEZ/OI9CWBBkzvABng4nZTerFHNQUQmW2kPF/3iygUXO
 hnyXLWE/UzNvTEaoEWWk6jzcZBRfUFSsdK/aw0lMCgs/erKkC+rMp3aRAGLeFKxkYzj3UcaPjt/
 31wClRdBO1NSd9gsQJBxklt3v4SzNk/83YufYeX/CtlwpfnB39LLdupvwtOJM9VONb9yywHjN3d
 DIShyNxl1/eH/qNJg0k6Q70VCByuJ1k5G6pSMrWGWyK6LvaZDALXX3YWyjCG/cV2Nn0Q5m0dPDN
 tIyb0UtR9gQYmuTdSBQ==
X-Proofpoint-ORIG-GUID: GK6LJSx2ZcUag9XdllYMuUXKH0jz1ftM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX6Fropx/W+lwP
 4BAiE+Kc5rxfQe0AnLNZ8YFIb+rg3PCbfAuYgObeHYpSo5pWw1rYslR9m6wlIPO6pGbTpNnSU0B
 oAC1+o4w8nfVxUvOVn7jBJrQvfqCFME=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b74f7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iAF4dUnUG2d09B6YKoMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060095
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
	TAGGED_FROM(0.00)[bounces-116722-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:elson.serrao@oss.qualcomm.com,m:andersson@kernel.org,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57D4B70FFF7

On 7/4/26 2:05 AM, Dmitry Baryshkov wrote:
> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>> independent High-Speed UTMI paths, depending on the SoC configuration.
>> Each path is distinct, with its own connector/controller connection
>> and role-dependent UTMI routing.
>>
>> Because the EUD sits between the USB connector and the USB controller,
>> it must relay role changes across the UTMI path. In device role, the
>> EUD inserts its internal hub into the path to enable debug
>> functionality. In host role, the path remains directly connected
>> between the PHY and the USB controller, bypassing the EUD hub. These
>> hardware constraints require per-path role awareness, as UTMI path
>> roles may differ.
>>
>> The existing binding models only a single UTMI path and assumes a
>> uniform routing model. While sufficient for simple device-role-only
>> configurations, this representation does not accurately describe EUD
>> hardware when role switching and/or multiple UTMI paths are involved.
>>
>> To address this limitation, per-path child nodes are introduced to
>> describe individual UTMI paths through the EUD. Each path includes its
>> own ports description, allowing controller and connector associations,
>> as well as role-aware routing.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---

[...]

>> +oneOf:
>> +  - required:
>> +      - ports
>> +  - required:
>> +      - eud-path@0
> 
> Do we really need a separate eud-path node? It doesn't represent any
> particular part of the EUD device. Can we simply add more ports to the
> ports list?
> 
> For example:
> 
> ports {
> 	port@0 { endpoint { remote-endpoint = <&usb0_host>; }; };
> 	port@1 { endpoint { remote-endpoint = <&connector0; }; };
> 	port@2 { endpoint { remote-endpoint = <&usb1_host>; }; };
> 	port@3 { endpoint { remote-endpoint = <&connector1; }; };
> };

I think this was originally born out of the role switch framework being
strongly tied to a single OF node (because the way they're found is via
graph traversal and not via a phandle)

Konrad

