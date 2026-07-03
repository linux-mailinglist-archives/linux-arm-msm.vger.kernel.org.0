Return-Path: <linux-arm-msm+bounces-116336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HREOKtnHR2rAfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:31:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3D77036DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:31:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nih+aH55;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Eb4evn1j;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116336-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116336-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF6D130EBAC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 14:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172D03DA5DE;
	Fri,  3 Jul 2026 14:13:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EB23D9DD3
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 14:13:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088032; cv=none; b=rbMAAq0ye8zfMt9qkaH2cHje0zmx6aRjqP0VHstd/2L7LtViv16ioqg7c0m+Afn0nZM0qobhFizz2GEnSVG8jgkuJhvX+Da1cmFvQxNsoy9YgG8yvojsJx7CgLbKgUWSJtv5xk4AZd4kyfu1prLWBgKkrZQO3qWzcdDF0nYLf2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088032; c=relaxed/simple;
	bh=jZH7Z/Hh9/KA7OFIOvJ+Blue//Yx5ANVh8OHRWIHUL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wg9za2opizaLIJv43HvED9aBYY/IW37HO1doNNw92BIukAbRepF0auw5xKQ0S1B7eKMfi1/h/jZRXCIVaoobz5GcFWm3Rtz+2+5kYPO8ozbUg+dhwMxV5GdEgKHJ4W/dZOoHM3UqbqhMZUydrpFL0yhAu1kOUlB3y2X4JYf7Huk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nih+aH55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eb4evn1j; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663B04g13108915
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 14:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GHZ92YcdPWa0r97qjH1sqNLcd4z27ftXzdTvY6KflVg=; b=nih+aH553/jrJcar
	AKW+idlmhmgME47w/cwuMueRhmbaO8B9JNsBqMR4C/Z8MxXFGlAdQsUERPv7kFzq
	apt/yG0BKz1j6weTVQh/2edOBnAeV9blSk16Owz7culb6ZvvpjbLjQ8sS/rZ1pYD
	UueElgcDlxqSbqaAz3FpuAEjQfcDbwcrTc3zLDSiGnsNsF0jAdMBMGPv/OO/xUwf
	O+ztrxHvkolXC/oAg20uqZRJ0anFMH22m7p0uksWPiLpw4Qt5oio88vDEb9EwkLs
	1hEd9Mw9+sPBNqAT0oUw1xI0DtS1Dy3b9gVV33BX2ZwTL/ZRiEA4KwQiZb7uMq5B
	KTkvZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eybd37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 14:13:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9960cf96cso11268005ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783088028; x=1783692828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GHZ92YcdPWa0r97qjH1sqNLcd4z27ftXzdTvY6KflVg=;
        b=Eb4evn1jP6AXqJy6AodiSm9En5UNNizCsst9IYF4h7ZI0sJR5mvpcUEoEjiJkvT5y+
         ur7XIH0PJhqnhLEb+22apuFgJsnPukD9QwJWa4zHX9sOfyCUIdxP8D9q9gv3sQPDgjo/
         i4/OrBbZp4Ekz/dNyFZfCE3blZXGtV15HhKXFjLjmQZOKhT7Sag4YuTOAqxbhA6bQe3z
         Os4eRd8nscR3lQuX8KKCOQPz9P6pfJHBrRtnYp+tNNpNjqTcafSO/L+2lwJVRkcp5PyA
         n+zGoyrPBaea2Eu+ueULU4Za4f5cGP8ntNIIFqYRlvWH9Jnpx+G9vxrvjNASQWUGK1yq
         upow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783088028; x=1783692828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHZ92YcdPWa0r97qjH1sqNLcd4z27ftXzdTvY6KflVg=;
        b=EwYoGJ0N/VPWuRzTtycZun3n2A2RKTXTztFclq/FpPnFXYkj9WVSTQSAHY0BaXq3F+
         2CtM1BtXXK5PPTdmZn5/hvWgDXaaY1vvOxSiJvPRcqdO0wQBlsY6vMxnVbADqV0nrWu7
         CDHne9SJtlWToOVOPFgKULSD3wrIhV7QF22/5fxcW+Gm3ilADJamdfFoeBg6UtVAoQSV
         CmCASca9geHMSgpGObVB356iPkXD2OZPe2PmDw5SBFN5txGmne+sTe1aPnDN1Ft3/Jdr
         Ezawm3qYxEpFOY7/Thfpc9fHtdN8jf/QZFfski88IVqmhOIR9XA+UzZDnRmYRWKxhZm4
         jtpw==
X-Gm-Message-State: AOJu0Yx6oy4AhGFa5uJNfRPbFDVJkhvyIyCPvWpS2C31vcpaKb+Jr8hH
	CByfybvrt8jwgQ83hADalx+JHTP201BL3cD261WpHhQJdkasUN5zahulpNPUfa1QzokyqQgDnvQ
	HqmqQ+uV1qwWpiE/w7uxT6YYNBK8en4tvasUjUjvFgWd4wJ5LXcaE8zoQm61BvQ2cxORhkRGsQV
	om
X-Gm-Gg: AfdE7ckYnQ9GaO1yv0lvNgNW5IloGRxi/ueTf8yWKldWJTtA5NKUxJqIyVr7lxCoSMw
	eSS9EIxdgcQQk7/Bna9mU46jTQbCwikhjMzsm/3UqqaH82+65CUEH9JsnRg463uYKDhLmqLnOuF
	qTGDo9angGOv2REAF/L0NbUHlQEd8Fb6gYLGbvb+sznsu15MB1yqFMwdU2nds5JP9gooKJMexE8
	QRerrYF+F6s3vGayDums8ht4XTRTEPDB1UGXol+tC9tuEbdyWVwT8N3QbdnLgUOn4uDEDAXGE55
	xpMVhPnI67TST1eWyaJRk4O7cYSkE20twELaRbQX3ApyPeRyfUJQHaah8DogLbLofEobKoTNeWN
	mb1b6sorxaWeM9xyAmtK+3VnP8kTcFXomzo8eXRPhYA==
X-Received: by 2002:a17:903:22c5:b0:2ca:ecf6:9122 with SMTP id d9443c01a7336-2caecf698d5mr12018475ad.17.1783088028441;
        Fri, 03 Jul 2026 07:13:48 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2ca:ecf6:9122 with SMTP id d9443c01a7336-2caecf698d5mr12018115ad.17.1783088027979;
        Fri, 03 Jul 2026 07:13:47 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm32244894c88.10.2026.07.03.07.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 07:13:47 -0700 (PDT)
Message-ID: <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 19:43:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0MCBTYWx0ZWRfXzAiJwUiPNamC
 VfbgBKLNKFSV1bNYEYZXfIjmfd7RcMqAsXP95sEH9eRcqUdoYz+JIKOUWimx61MZ1aTtyJANROD
 sHyOtJmdVswrVqnb3hdnOC8pRMig8Ja+EstmxsIpYnhql8vmZxsh1J3nLJlCq9eaLZrHJMTH95A
 pX9CfIlrtWFaSKYav7klnHILQs4XSreIjTvZjN9QDPnSJJSay6EyLLUKNkNYGjx0T6eZzNZssJV
 cDbINYbIHIn4DDBsy7UdcNDEMw3MrU6lkRdHvlMTZdzAJgy9brh3NGto5jdHZVwtEWJyYyMtAjK
 YOETggpAsV6vEsCZJ6beEfRvjz5vXqmLRu2Cnod7rtBF87kxkxfb8kygmVZ2nxjSCKEZr26E1Y3
 esavHjQ/rMtvHpSd91DHLO/YvtXK1qltunXWNXCyi6tg8SE5gzfFWXKMqyzWRWCgiMjmBCEUH3o
 RPJuAYqm/nqVsh99iTQ==
X-Proofpoint-GUID: bugAq_WcxMTrqE2Lb56JOIKvZ10t9BER
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0MCBTYWx0ZWRfXynaLh2q/u8TU
 HikTBCAVata1GXewsjn3l/BM3z7OlmpdLdvayRl14piVRgGxWhWgGc5wXaODiHMEMYmOXC8erpQ
 WCmgndV3859mZSQdtdJYP96aTi1RvL4=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47c39d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KAs4MCmhXsdL-kvopiEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bugAq_WcxMTrqE2Lb56JOIKvZ10t9BER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030140
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
	TAGGED_FROM(0.00)[bounces-116336-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C3D77036DC



On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>
>> Qualcomm remote processors expose thermal mitigation endpoints
>> through QMI. These endpoints can be registered with the thermal
>> framework via the `#cooling-cells` property on the remoteproc node.
>>
>> The QMI TMD protocol identifies devices using string names (for example,
>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>> `#cooling-cells = <3>` requires numeric device id in the form:
>>
>>    <&phandle device_id min_state max_state>
>>
>> Define common TMD device index constants shared across currently
>> supported platforms. If a future target requires a different mapping,
>> additional target-specific constants can be introduced while preserving
>> existing DT ABI.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                                 |  1 +
>>   include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 57656ec0e9d5..ffd85fd1dd80 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3410,6 +3410,7 @@ F:	drivers/firmware/qcom/
>>   F:	drivers/soc/qcom/
>>   F:	drivers/watchdog/gunyah_wdt.c
>>   F:	include/dt-bindings/arm/qcom,ids.h
>> +F:	include/dt-bindings/firmware/qcom,qmi-tmd.h
>>   F:	include/dt-bindings/firmware/qcom,scm.h
>>   F:	include/dt-bindings/soc/qcom*
>>   F:	include/linux/firmware/qcom
>> diff --git a/include/dt-bindings/firmware/qcom,qmi-tmd.h b/include/dt-bindings/firmware/qcom,qmi-tmd.h
>> new file mode 100644
>> index 000000000000..73efecef0f3c
>> --- /dev/null
>> +++ b/include/dt-bindings/firmware/qcom,qmi-tmd.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>> +/*
>> + * Qualcomm QMI TMD (Thermal Mitigation Device) cooling device indices
>> + *
>> + * These indices are used in device tree cooling-maps to reference
>> + * specific TMD devices provided by remote processors via QMI.
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#ifndef _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
>> +#define _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
>> +
>> +/* CDSP thermal mitigation device id */
>> +#define QCOM_CDSP_TMD_CDSP_SW	0
>> +
>> +/* Modem thermal mitigation device id */
>> +#define QCOM_MODEM_TMD_PA	0
>> +#define QCOM_MODEM_TMD_MODEM	1
> 
> What about the dozens other ones that Dmitry's laptop reports?Ri
> 

Thanks for the review, Konrad.

We are only defining constants for the TMD devices that are actually 
used for thermal mitigation on the platforms supported by this series.
More constants can be added as needed.

> https://lore.kernel.org/linux-arm-msm/4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k/
> 
> Konrad


