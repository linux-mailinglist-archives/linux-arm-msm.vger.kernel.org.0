Return-Path: <linux-arm-msm+bounces-116275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /DRtGt+OR2rFbAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:28:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D670137F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:28:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="c/snRQ3s";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V1va09do;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116275-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116275-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6ABD305E9D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202293B5837;
	Fri,  3 Jul 2026 10:14:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E53B1ED1
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:14:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073660; cv=none; b=M5UwaWKWFfyOtetEMSj9K0nZcYEbPc5WImRSu2h6wzgCh2AOb+7ONUDcTdoN94izsQ9XG+OPYATjesgBGi+MBIggwUJK5eVUqqKsgjyc5BQ20Aww3GDFe7YFu0L5KueB7VGDhZ8Sb02cvMP+OpaoJW2GJHm5FHBxLYhOXM4qO7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073660; c=relaxed/simple;
	bh=OG4yzh9m5tXYU7JzloUdXPR26V6HBgZzOX6TH+TU2F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phPbPc3wzncQGNgS/kWJ8fV1ssHXpe1c2b1HcOgbUSsXGcQFQva440WD8EeuXi5sZ88tTxYZaVo/cdC1nz38Du2SGQ07QU5aKuG5JyljG+LSET09wDPnKgswcuurERAgoBjT8pV6tj0T1XEfBVFarad8y2YOhlTx6lPeV4KbLLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/snRQ3s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1va09do; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rf6w2994889
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 10:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//3AgTE/yNQNqtCsn90+XdpffeOaj61Ucj8VYvhONes=; b=c/snRQ3sHra2mRRR
	bWBzcIEQ8j6mV72//Koy6uD2Ju1x5jrO1iAnaQrWhvcJ+3rbjIPMJJJnPJflFecM
	ZTEZpYiJsyX3VJoJZvVpWHdOhQT4bXAc7L34/hrL+mfME/fWMJZRrNvGVSnXcpPi
	leadoaz6z9KhD9wJLc5CDtXDj39GuFX74hTIEyH5jzmip9BWoZXAIZ4I8ZP+mh6D
	XK/vOpL15JCfXqpp47VwFsn5QlfUU5/ax5JFUTac7jm24pZp+cmTL3tiwnqnckct
	CysxPec5rjZWP+bVVV21kgUiljUX0W6mtLBAOAFB0xTEVg+OFRuz9E7LJPiqpJgi
	PlVT4A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1uer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:14:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88da04b719so391426a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073656; x=1783678456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//3AgTE/yNQNqtCsn90+XdpffeOaj61Ucj8VYvhONes=;
        b=V1va09doKOyDgwZoqhIfZMYo9N1KOmnLazew4C0kEtD1IdqTISOwxYrPCIX5F3KiTv
         QH3dUhXdmvKu+FA3xPBokNxpKzMGJtyoQe1s6l5bA85uszfUnwPn3KsZk9cYS50U7/Fs
         KmicSVRbiLVzIIiOG5npJSr/By5D/napWyFzWLIoHAkb7BfPh9VUehG8q5hhUeEBUuBv
         6m1uq8l3iAIZ0WIVIZsx/GBfZE7d1H94v/E0EV0cIGXzauvX9cF+yIh6ABOVThPH6bQN
         /g44yRbS4BjYJGWK4DbBFyZnmEE6DO8MXSvWKMiAu5vQarUeWWj2gfEkU9diWVRPMmxy
         8T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073656; x=1783678456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//3AgTE/yNQNqtCsn90+XdpffeOaj61Ucj8VYvhONes=;
        b=T+vbe+yBDiF2NAQJYXbFOzJ8TUtHOXmGdUODF0lfgHaBJh3uCCCR4U7FdwGJruxc2V
         67YnvxHvRlW53vq6x2p1FxA0pTz/ByzNr80FBWZhUr0gt173EXDIFKG8TfLpVEcDtjnw
         0GSQ9ao6b3dVYwJrf0SwHutXp4smMDaacmByN/nNP2akG00PyjPF+e7OXJpVkvBt+pdE
         hW4eJRu2ZTqfn+5OJrf0xc/Py616xDXGpwzZ2cutPCvu5qmditQQyTWJCeRwL6XmPj0k
         1/kIIRtPBXyHPVjhH1fYSbOLF6xoW5B4z+PGai0pkzjqU5SJsGjXUF1+zLQ/5dIv6aQ+
         f7Ow==
X-Forwarded-Encrypted: i=1; AFNElJ8yrqjzgfYSNbCqM5fadfKFiQP+VbIPaPPmJ4oNEhZpawD1/FRu8L/S3nlK0/Eb3apkYc9vcp8W2kuwFj2k@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZEBTwUWEiTQP9suhPxlnaCpp/UtgVEF+yUZNr8JSvT+zK7ii
	eKiquUOvgLsnJySBdbRajnTEiQxcwsSB3qoLsqenCpJ59Y/ixuCxOcEITFLfd/Zdu+8cdJoFs3K
	+nwwdBQ8bSWDHFEiwCZtlrHABAReKI98gc9rh1GwTyHySMxwDRK1C7iE6eduTyprgcTmK
X-Gm-Gg: AfdE7cnb2mesOHMXv30X2/NaCH8XbEwY0OsRWnA6c0R7IP538J37trL/T+dx7f9Nisa
	UfYqltOdhmntkHU7n6l2p0MCYZGEoxMIohFtcDAXkEieOh0o4NSF/GWUQt5fIAT0V7bDNaXyTz8
	I0suziDSNjRzIVOaeiOO7iN/8f8i7q1e6hJd+qX9m/sCYho3s+z5ZNcwSF+TZF6rO4fmPOUjr9N
	rtPkBRTZM3WqxcuXpSGqKPkR2dTVO13lbnWVbsHZUb3w5YHEKFAyNnqK7c3yhfxqoDkENEovIuT
	haKvQ5Ar3llpAeX4LpaKejx9sjQlIXb4+sXzvvxDJdG27CqufaQR61n/SgNB/Q/jQQYBI/URYyL
	shlwenPNt01f0BhW3iDEOLzBgAynrDAuFHiBLYA+o2A==
X-Received: by 2002:a05:6a00:b53:b0:847:759e:f61c with SMTP id d2e1a72fcca58-847c519357emr9585755b3a.47.1783073656240;
        Fri, 03 Jul 2026 03:14:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:b53:b0:847:759e:f61c with SMTP id d2e1a72fcca58-847c519357emr9585712b3a.47.1783073655667;
        Fri, 03 Jul 2026 03:14:15 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6e42a3sm2824907b3a.12.2026.07.03.03.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:14:15 -0700 (PDT)
Message-ID: <54885628-ad41-49a8-8b39-33035753ac5b@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:44:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <20260703-humorous-blue-agama-4b668a@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260703-humorous-blue-agama-4b668a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5OCBTYWx0ZWRfX1LDOgdQ9sFuo
 /XbUIv2aomOcSZQ9c32iIbZG/LzbaXUPM6zMOBRXLsm89gIM8I7AQD851kFsf2I5cnzvuDuLqBu
 zp5XXVAiv09jOpPyih9GUqCjfD7RLt8=
X-Proofpoint-ORIG-GUID: -pgVpJJ3E-K8XBPuTY9QBCKrr1vRtIMa
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a478b79 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FDCMAMj9kxRoxUuqswEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: -pgVpJJ3E-K8XBPuTY9QBCKrr1vRtIMa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5OCBTYWx0ZWRfX91spaQ0hugB9
 76XNyku5HMqsf593wcRXz9/zWJNXek5c5vV9LCpF1a8gkWJaMD9dPU3iQyX0icl9eCSaCwWzPg0
 bmtkvSGEOqg5jvxZF9hoOMqLe16kl5kD674VYNP8wrhPlUOs8iUFUbylCJhPWCpN5aO5POByvyL
 SXYLZeW5v2La7g6WxrwDand/HFigwug/UmRftzCQ+IYuJdSdOM/sU2AJaczmJ9LGsjt2iRmiMXV
 PUIctefBjfp/A9NsnTVY9NueHUuRuqSmGNxSYg+iSsrgbeZa0FFvvr89PLkjhkc1etflAcUjY7h
 dsvDi5sVQAjuKYOJh/dCZnVWmm13yBe/ChxsBjmX37Je5bPgXNgVwTuaXDvpvMkvLSgWzNu9KgF
 gDGhSRBsV1lexm3yekUQfiYWbTwqXsdAbk43Gx1/gGjXYhegmuOtA8m0gzaX7Ttwa+8p7mhzDBF
 5h6hDZt7Ex9yijsp74Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116275-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A88D670137F



On 7/3/2026 1:17 PM, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:33:04AM +0530, Gaurav Kohli wrote:
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
> 
> As explained many times: Header file is not a separate commit. You need
> binding using this.

thanks for review, will club this with binding patch.

> 
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
> 
> QCOM_TMD_CDSP
> 
>> +
>> +/* Modem thermal mitigation device id */
>> +#define QCOM_MODEM_TMD_PA	0
> 
> QCOM_TMD_MODEM_PA
> 
>> +#define QCOM_MODEM_TMD_MODEM	1
> 
> QCOM_TMD_MODEM

Ack, will update like this QMI_TMD_<name>.

> 
> Best regards,
> Krzysztof
> 


