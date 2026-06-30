Return-Path: <linux-arm-msm+bounces-115448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sMJmIxHJQ2pthwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:48:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 937296E505B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:48:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n4i55shH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WO5KcgkD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115448-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115448-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AD1D301AB66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA81140E8D3;
	Tue, 30 Jun 2026 13:44:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9974940B36D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:44:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827056; cv=none; b=e6IURE7qI+mH98uQplwxnJHSDyH67rPbvP3qR4HVoNV09DB0QHMebfCdp1dXq/oGm/9LjQEGacD7P2GEV7Pu0RHmg3R/diKIbwRDCdsKguD0PaxZxWhq5WdT72kYUL6Mxju1JTGyBWkMWgly8rX2blHNFDPsxUy5OIlXUYEM1sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827056; c=relaxed/simple;
	bh=bCUXH4SoAmjo/fUNC0EBxscsqnBw8aQx/4F/WK4AVXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPAvT2XeqHG74pRhdHSxuP+4M4VvuxQw86rcgCR7z6hODrAVAWegyrOdyAI9Iad5fC7bVTGP4qTMxdoDBNZLdSNNotKrixOML+LxJjAdB/QO2NhoWGeQdSf71fu42yv0noB084+3z3npKoxO3f4U9q+y2EJa11ZxuqXTGGo7kRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4i55shH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WO5KcgkD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1WC1573380
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTGAsdnDk3YDYOmMUnP5PozA/Se+PfLlWukFWbC/M+s=; b=n4i55shHAme8fsZV
	f6JiqSMAT2VnkPr1L9+xExOWVIXGKMW5MBAZjbUI9JRTFw1ekg8d8J/6EylyiMx0
	3hHQLbw8GS18tXhIhagG8VXc+62ACN1GmjcoPCrzZMMEcGgjTRI+Bxpr/5RzqW8Y
	GQiCYlDJ5puHks6dFXDmovNyu0OTrlzyXV7ILvkYlwyThN7mXtzf9EdvMXqfJVPy
	KyKQKfL0ayLCwwSULymunW1Q3Hw2qHm01wl3zLZcSxBkRgm6mKpEkPeKV8/Cz8Gi
	LpZnqTaKSQfxSZHBAkV3FtVVGfyhPjtNXxLW+4O/mCkr5rIu5bFFgNBe3F0RLaLK
	5Ps5rw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46862g35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:44:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso2507988a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827054; x=1783431854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTGAsdnDk3YDYOmMUnP5PozA/Se+PfLlWukFWbC/M+s=;
        b=WO5KcgkDy4oAX4+eEma5lbe87NYk2bXafjmxSK6F+4VAdk3hzvX/eZqc+0nUHsVUPw
         ld2qnNq9/xyhvbylYL18KzaNTS3HL/z1tgitZIiygU+qDE4GMQ+yKJJh20kiabNq/fBw
         fHRG7yeiKjtYwoHukuNTfWYgcsA24XHNSjgJWvSmB0aB5PZD7Em9R+tM9mRfP8cgwPJi
         /E2kcavDHPdG2meiYxf/MiU0FxXIKMyT64k/RunRrNtpBia5DcS0lSCU8CAgDNsbIOPy
         ykLZbp57NBdnJyBrbJYa9k5ntQJM3caz4FccI06o5UNHMJiF18r529xZX52+2xZGWObE
         +iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827054; x=1783431854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTGAsdnDk3YDYOmMUnP5PozA/Se+PfLlWukFWbC/M+s=;
        b=YP8sPZypRgocEGTblxKE/iWRDjXyH60L3k+8o9V6mix6yMe/J0fYbDChOzG+a2ttxo
         CZAYHYdxwx++jz1fLJljQ+7C+1G5bTH1cH5Mz5UITxZfg1RP9jfAfh8Ck1vRbiDbVPVA
         R2jfu6oHN3H1Vw6XggJ+py6DEfSlGzeuzifH9bQ1KLGE0wB4x54CuRNv/OMUitxQJkl2
         tKwjE/EaeS7Hgxvr5NkECfq2lq0ssjEvGvK5esEG0yP7pZkWslQZe8++T1QL+MLfaz+e
         CpL5Ai52h6BXYKTqgr8HcjTMvjfI5tpJDZ78RDaFpd8rxZeARmxWOuWW+By9tv5taQrG
         XXug==
X-Gm-Message-State: AOJu0YzbXaapOLscdVLfLP7kaDZHVDHxmQqx2zht2hfxUX11wrr4lEmj
	hwUUqBg02dEaFI+Wbma7fKz4Zl0OfliIMOVtrkgQ7xA8+CIMuET4SqrXSpcskfwloGktGCDHmw6
	rz06uP1C4DyexfEKvnWprE1wCYWMqsViororB7Ak+yejMnBCzB/T+6XSMAjfkRwpuIpg+
X-Gm-Gg: AfdE7cm2tIB6TiuP82rhz3jZt0uUejkeXzJa/4l2akeBvWntksaaIgYNRXziDU2RI1r
	P9IFOwASR4nZTfWPtC9ItxDESq0QPJbw3A9H9ujjo3zJG4P5mJESk1U40dPo+CFAVyOJj9sGI2U
	5PrpnBSLdvqQRfsuHWQRxKNQvxMsbuwa/PeaXpsPUXjYI3Tqd47itXUQDomaX9kxbprj3JdD2mO
	0e5xn+w5vBb0NyXpD/zY6dK89sCgtdyJR7HXy8WWSBKtu9xsrY/u/V7fkIzKg8wOI463bZWHWlU
	f+JcjhAOp5WHQHR9UynI8hqD6QRvXF/6Zoj4nCaI4LMlsTKpMpIL+2tjihK1PBF1VEICTZcDmbw
	UWUmvs0xcBXWlpQuFLgvOZkDCbGB/t9XHNW2o5/I7exVap42VBCUMb/zufSB559Z+fnbsXBkOfY
	E=
X-Received: by 2002:a05:6a21:4a97:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3bfc54b0b9amr3319189637.59.1782827053685;
        Tue, 30 Jun 2026 06:44:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a97:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3bfc54b0b9amr3319152637.59.1782827053220;
        Tue, 30 Jun 2026 06:44:13 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bc06e0b43sm1616501a12.30.2026.06.30.06.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:44:12 -0700 (PDT)
Message-ID: <865fcbae-10ad-4f6d-8b57-474626b71e36@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 21:44:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
 <a88201a7-0a00-48d8-97cd-300d6aa5fc88@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a88201a7-0a00-48d8-97cd-300d6aa5fc88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DeqKsa5n60vg9lK2jQmrezYA4Th1pWmc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyNyBTYWx0ZWRfX+LhaEc6GxrKf
 WRK5+O7kL9P0OQH926/Y4YpATB0NlEtcXVaFNbJM6fGWzb/4ZXLF/TmS71hSLEjk5HkA+t7BpY4
 0QLsbXiNXSO44LNwfuIGFB7OOEckRQqDP3IkAam8xrKMDSXooJ25WG83DLgHstViPaRGGMUIYC5
 b6NclOsIxmYVdVqW1cdI0zA6Cr7ggy1svRaXOe6bOttsmSTjUXQlpx5ICATe+M6cKpQcHpQ4nPm
 pTANm6ZZTiIUl7JSY7sqRHAFYnzZ6jeQHptP2vIOZTToZO6rGkIv1Gvq2XYIT0xrTP43cIMNs1r
 us/7cI5A2wV3fSA4VBbDCt5q6A7lxbfzZ8sbpYmTULfcttgAHw7jQI1NmR5EcHHFme1N/ATtV7P
 USsOTmTBYOE8dIMcu1n9TEoPmzLlEs+jD4yfEABu2aa0dnb7d0mne2b4uScBGrecG/8a5B77VFy
 8lTzJssPYP+6LjA8mFQ==
X-Proofpoint-GUID: DeqKsa5n60vg9lK2jQmrezYA4Th1pWmc
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43c82e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=v4hQ5fjKkRTF_-evxhYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyNyBTYWx0ZWRfX9Rra0hfW2Xg8
 eeOwQ+y5HV8NBRmloXIxeb7c5AjXoeBLNf89IZR6lCSXyBpL3BGnyGFl6qRMOnfl7UCsJZupjG4
 U7l93PYrj9UbQNV7R0uDa6o7eSYRwrA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115448-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 937296E505B



On 6/30/2026 8:53 PM, Konrad Dybcio wrote:
> On 6/30/26 12:36 PM, Jie Gan wrote:
>> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
>> compatible, which places the device on the AMBA bus. The AMBA peripheral
>> ID probing fails on this platform, so the device never probes.
> 
> An interested reader would immediately expect an answer to why that's
> the case
> 
>> Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
>> Dropping "arm,primecell" makes the device probe through the platform
>> driver instead of the AMBA bus, which resolves the probe failure while
>> keeping it an Aggregator TNOC that retains ATID functionality.
> 
> This describes OS behavior. Move your message towards the other
> compatible not depending on reading that ID register.

Thanks for the suggestion, will rephrase the description.

Thanks,
Jie

> 
> Konrad


