Return-Path: <linux-arm-msm+bounces-116741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mcaoLBV/S2p7SQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:10:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 373BD70EEF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:10:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XLRY5U+j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IyLROQIR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116741-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116741-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 798533001315
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EE2371D14;
	Mon,  6 Jul 2026 10:03:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC59305698
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:03:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332202; cv=none; b=Rkz06hTk6OzMV1pCocUIBdyG3mjdkVA3wXi9lFS9JRPoEq9NIcjWjPxXZ6pWyip8iLUoKQSBf5EMktJqAlEerJFwW+AuNSurJir4NrAMDGit8Zfo5d83tiSxue3cPtrrw8402fjyK0WO2ybw8o/bAwQZbIokyYvKRjS1W9/avZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332202; c=relaxed/simple;
	bh=j7I9FJXLK61qC3Hc6JfeOMWvZiX9lNEoPUMZtvCSydQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhPzB0vHmWjdmlPFKnX1CNTj3lkYWvYeWfz1alXrhbOUw5wwtOogqv91Ilu12mwWegT86rt3FGFG79i2pLRPcasqf1WTk9+Kka2o6KVgyednxSmKq3lvMs4ZkQVemQP/N5eRKliydnO8x8t/X3Hc44iZ7Y5hmy0EnRZaoOTENMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLRY5U+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyLROQIR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669p5vf250543
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 10:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6y5xA/sY0H8rxmBY7v6P2nx5v5uK8DJodTOynLPQvqQ=; b=XLRY5U+jtsVRq1B0
	KE0axftAWwNHaWcA7gqtBQpcVJS4j2maia0uusa1hjL16uiH9/WzFe1o3F0nHIe7
	J/qAzLVUGnk+5pcUQEKcAN7VDRcjKkhvW7UlnxD5VAlRq5hI9VetT/pN3ryhge/H
	MBkQYTK0CLh/tMsV2KJRCT//dptysD1AEw3koHNVTAR8YgRer0UFUDEurke7TjtG
	o8gBP/zKd8mfTf0Pwu2eSh11qhtxDU1NMQ9uHhIOLr3XNSQgvXshhdrblRMcOzzA
	wSfdaVSL0Mym2x/bSIolJip9woP2DXsotTtqaDWf0nBNrvIUeTkEP1QILqs2BFh3
	0dZNqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gr1n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:03:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c298a1b20so5959941cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783332199; x=1783936999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6y5xA/sY0H8rxmBY7v6P2nx5v5uK8DJodTOynLPQvqQ=;
        b=IyLROQIR+eGBe1RY5qwzbFHIAygpmu3IT/o1Za0J+hYupaLCmj1WPJA1AfqY47kbtG
         8zes9ICUfAYKc6pz+8AK80a7P82/GUDkeqqOY5fqqug9yeKL9YWpl512Dh1hcxVRe4Eo
         CGJnwcVDMC6HXl/bn6eof0wfg2OoJjFMJrcGnAgDlAoqOL+gH6YDeQKi3tfj6cbeqZr6
         vvMqpFAGAlWZkR9t0DRTc8l6VpdznB3yuHntUpWgo5Uixb8DXn4G6UaA0cbeSTgWfSsR
         Oj/4G9/rmKn87TSN0KZm0BjAlXEMtACLnDaXfgbXFUsguRJ0tnXOesg/H+L5c29TdKWR
         Z28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332199; x=1783936999;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y5xA/sY0H8rxmBY7v6P2nx5v5uK8DJodTOynLPQvqQ=;
        b=V1bxjmjst8xO7BC6aKVB02joxAnhHDOpL9w2UKpPPhzG7//iLfm/cBLuJad1+WIaMa
         H2OTjeTF1V9ZbEcfDh3hZmnECM9DY1IPBIdkiBD24b8IeSyWXwgJJ+heJ/AukFuL7dEg
         54/G0VhOMsGufrommYAb+POoaYtxsdvG2oOiJuPHqGfSk2KfywOikryEDpYGfkdEU7H1
         1ckPmTwMw7Kx19S/dOLP8IScE28m9E96goEfklF8IKXQEUUiEfyu78Lx8YZlO597KYKE
         jm67MJpKfATWJwmLmowSqGRMBCCKFUy/PEZkBG4TKELLYH+wuLbuEaBc7KAC8xH5xk90
         NObA==
X-Forwarded-Encrypted: i=1; AHgh+RrDKSJjFIwUYHJtwOXMKi4yLI7Zf/w/pG2S9Bo+nPJfj3NQtj/q8jHMouL5+Bsd4Z/qSvR1IMs6W110JIDt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4XCaGTQnh5zdJvMSudvZhO8FbtlokCL2ibBhX+r/PKArPEqI4
	ZambK+ztDs8PYrPzZxYJO8spz4p2XeahaV6N78bnOvmYcEW0pl9VOC283oEYSipsFYGX5UF1Xsn
	e+rfOYqnM09Io9U2iovxmoV3heJcJnH5iybTPWJcJ+ohrGE8wn5FDODlSFYTXiQcY1wci
X-Gm-Gg: AfdE7cmIv2HxvJWWNH0gFawPYsk7aFQ5HwA9vWesbNM8bk3BWCIJw7CqSrGed+wjb6H
	Jb+cbUOVGpQLr0rS4//NcXFJkXqtML2A2pNdLqgDt6xNIExu+tk41ysS33ad/IHWoMLnFqHHzdZ
	SafkKcr6A7QZatUAarFuUsBKESrvT1J2bn7XnbN1q2ajobS7RRG1fxCyyXPgevA987FM9cNiVP7
	h9CSGD4ojbH7sOmW8z0LrMvnzQDj0kDcVhKMtWxeV4bGndXOJHvW5yI+xsfKZlmDGHrRV0hFk5P
	rcJzyxnBHb3CdDrYNc5Et1MoqKvz1LR47+7+qk78GF50f9AfBumiTNYnD+RIWClan56HBEMTBBU
	w6WZnQqm0NaxzV7KNbEj8AW2i2DcoDht5K94=
X-Received: by 2002:ac8:5910:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c4bf4718fmr85760561cf.11.1783332198996;
        Mon, 06 Jul 2026 03:03:18 -0700 (PDT)
X-Received: by 2002:ac8:5910:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c4bf4718fmr85760251cf.11.1783332198567;
        Mon, 06 Jul 2026 03:03:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6099911sm706130566b.24.2026.07.06.03.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:03:17 -0700 (PDT)
Message-ID: <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:03:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sk08mlrib9tuQvwwExLyq7wJ8tPgJUGS
X-Proofpoint-ORIG-GUID: sk08mlrib9tuQvwwExLyq7wJ8tPgJUGS
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b7d67 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jq6lAVB8MRYJtmNLQKsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwMSBTYWx0ZWRfX08tQ/8YOA2dY
 mPgqkgI9j+gqwsT/p65JHFI6WiVwmLsEm8mx4X4xtzP3u4HuvAXKSWgmjNUCSAR75YVUjL0RIoK
 /GoQ7pV4MTR/VXy1S3Z3MWgyPXt85XqMr+S9rnGNDPykbMUnVgM6seoyeVo6E4tz4zESeOfU7WD
 5jrHQDr37/iEgfDYDJZvJzAhLRGtmIacly8MIdnYMDQe0RKU+I1VFFXFHW0HMm3i5rzRLy7L5qi
 i2wOKdKTfhP7LO5Q/JP9Tl0tdet5wb6HVOgAxlczlyI+2jeEcgRNaq4senW1QhDV9rbZ/mbww9h
 tWslMMtHzwumT4LD7vjBkNI+tx+ju7zUNURADuWfW9s4Y6xEEdIYj7gEbA8z7DVTaYNd5F1ezoX
 VmFcDQxIgFRC7P+PSDywVjCw5aVMpPpFXYIq7F/WmqDar6Rjx68LSFz5pKbrfAPdNYidzhap7nS
 lAKuQZsOG6G4X+mg2lQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwMSBTYWx0ZWRfX15qjm+XJWV78
 xcrYW0qoQUUDCAFNLESekUoAY1XIpmT2KWVHCPqkeVsaPFDmz4UsPbx9ORH03HUOOpaesvUXiGf
 T8sNAaoeRwqmPOiDhOfDQpjM7dbp7WI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116741-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 373BD70EEF1

On 7/6/26 8:04 AM, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
> board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
> to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

[...]

> +	panel_bl_en: panel-bl-en-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +		output-low;
> +	};

output-foo isn't necessary, the panel driver will assert it as
necessary

Konrad

