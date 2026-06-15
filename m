Return-Path: <linux-arm-msm+bounces-113103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WJ0OOmOpL2oKEQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:27:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57941684327
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:27:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eElLavAq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="c9/ptSjL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113103-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113103-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71E67300E256
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E0E3BE148;
	Mon, 15 Jun 2026 07:27:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4493BCD32
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:27:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508435; cv=none; b=Gbnjcb6o2t1jv98UYkWQxvWE8mnfa3w/QGIvYD4eQUHMM6x/Ch9Xj4ueSfgWOYbDlEll4YLcPOES8y6Q9JOjsmCxNtCgkHZ+oHpiizufYZfqokZL3jPt896TgFrt/cWjgFixMYyKo5RELLJ4coJYxN+EqabHX7x4cOnVj+cl5zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508435; c=relaxed/simple;
	bh=pu5aKp2dBY9Z7bUFYMTRFGkF7Auzc9XTr1kXTHyu/yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGRilqFIR8I2yH9yZaoVrUhg3DapGgknSlHFfNl7YZ29R2Nj9xcbcLJDoq12KJc7KVfRqs1X9AqLTpO+v2eVePtUKqRsnnaZsC0Ah/nSiCNFZ3GpCTzXsrp7duq7OS0oNMGxNZzSls4CNgFlSLkYge8oNdQDxlnGc6P/BKlW40Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eElLavAq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9/ptSjL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KbkF3910878
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=; b=eElLavAqty18WPNi
	akQ78LNkjS1KxXRN/LcVTT5t5wPm/l36I16VVcthNtebm+bPUaEK9t15p8plA2bD
	R+HvKJNLEAE1pNlOCGEjdMT98sV8Q1COUBZHwz6rz65MwV1NInGBJIlfs8aF5gbr
	zfd/b/hWYOjSSTNJDoGJHZ/pHHnfwCZ/KeHT6l81oMWbC4jhmW7E/+gzRRLer3UE
	592gLtW6W2UgRqgBcnie2KBts4aiVgZX7NE+BtbLh/f3AvfsEkYyu5OHwnl6HQXH
	m13TusyKegmMK+/Hj1xXXPguNjjSIUvLEp2jgScNmkSJp74M3Zb8NWGmG3TskK8M
	kJPhTg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6x7r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:27:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c857ebbb0easo2218172a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781508432; x=1782113232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=;
        b=c9/ptSjLtrxW5vWNwPIY1Tyxtz6xepfCnrib2SLzZsh79qxh7wga3I/LVKlH6tb162
         GVem8OgCDQBhqLJbNWWZPPPaxuvrb8tgOuTqiI3PwHIhLfWAvOo73G9AzqglcbjUx/fQ
         2O/6zXkd2zyD7kdN8aBnV/MDtJklJTxjbV0fF+j0MUkVrN2mJ9LhmFbiXgSU3LntMpyF
         EEKhSZ9QcBi/wLmaOvOv4vgMXhj2Xjqi3apwbygNRA4MhNrqc07sisAKMg63YHojIPeX
         oZAZzM8zJ8qjl/KYOyL8DX+CzUWfTDIy5gcb5dBB9qO8LK3hONA/vCYvusMZRCsvoYST
         VBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508432; x=1782113232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=;
        b=qBu991K8bC2AFYShZscjg7xeS0N9Mh5cO5WZHKZgZQ6hn5MtnLcJzVrfE9xaJS5nb9
         ZEGiN9sfVdd3qH95IQCl2E/vdJxVAEq7o0m07lMdyAmg1RAd0fXh2mVy/DV54ikBBXsf
         ruGqDysQQC7AkEf0XCW+Inr+EMsUPmr3uOvIZIIqK8MBfUKFOFAE+kxlZSd5lX6KQTiB
         P1nkJO3BdA2SLjHf1B2jXJuEOo73lRx7Bl8sppEvrPDwT7d51t3Ub5YPrcB3RTSHF/7A
         2qpOqEjJPEGZY/OwRHwl14euP7P4O9UcQPJ+0RBTnpCbEXblTzBNjPelkX9GY5g5h5M+
         eFDg==
X-Gm-Message-State: AOJu0YxbKZsfeDkw8/0mElU/K7KMgKp6wl2xAyaYvTNvUjj45xs+R9mg
	pmFjrjuVvilucz6WnWaDzpSzckR6+HtXV75I9DKdwrUQs3tLhByYSi19VzP1mU8NtV374ra8E6s
	6C29pexV9wLQAz2yvLvTFLk37jbDpPdq/RE+3ZT6KgETdJv4grSNT+YeDD6jqnkxJ3Djt
X-Gm-Gg: Acq92OGbDIU5U8Icq+xjVkaXtgfr9y5vMZ6obAAuv0L7OYC/T0Gjxutf4C8YnoclHA4
	6aqzdtVXpoQvK/ZhTsMPc8ZTSgwH/ZrpQWaCtwBzZdLsiyBM/9WRw0sMCLNWkTJcHYN2t3SES1m
	CeadWX3lznaUewiixsK8T34U2uv6C6vsnSvGsFzHv7zX6FbY/uLtci7oZTzQPhA+UJVmiHpTY5S
	CBHrF5eORkItydNhEqek36IFB1BTdlGViWFVRSeSH84w4l0nV3VJo09dFrzQL8//4bUfFOvwxUy
	FF8mVcfEdBTcBceg0Gqmu67uhP+lHBwMkX2UKNHqCtlSw7FCZtSKyZunNWytpgxm/7nfdbtVTb/
	RxPfX3nLDaz2+rF1Z4IXaDfGsgBRG8u3RutiCXQhxd3C/+pfkLA==
X-Received: by 2002:a05:6a20:e290:b0:3b3:bf9c:7c3b with SMTP id adf61e73a8af0-3b780ec2f0dmr12418320637.8.1781508432275;
        Mon, 15 Jun 2026 00:27:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:e290:b0:3b3:bf9c:7c3b with SMTP id adf61e73a8af0-3b780ec2f0dmr12418274637.8.1781508431779;
        Mon, 15 Jun 2026 00:27:11 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.27])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651af0edsm7787406a12.32.2026.06.15.00.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 00:27:11 -0700 (PDT)
Message-ID: <b11a9de2-6bc6-4345-8d81-5befb2182a7d@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:57:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NSBTYWx0ZWRfXwNF3xehuNYDR
 s3zNjWd6ebEHw0STf8Y7O+HjEWhxy2Ur3N4I/W92+61QbqQMjYBAAnRqCvILN3T/y6i5upYan0v
 QOuL3ITk7GBk0blfdvL8R9b87gzmvgM=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2fa951 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6rJd4luAlhGbPPINhpk/8Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EF_2yGccovn9CQtFCckA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: gHNfAcq6f2UTV1vmZqTsPu4uY-C6L3VX
X-Proofpoint-ORIG-GUID: gHNfAcq6f2UTV1vmZqTsPu4uY-C6L3VX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NSBTYWx0ZWRfX2QVjDUtMjlEb
 Ck6qYgtertNWQxzWgpiyZBnMDWpuowaNTBg/uGf+UI+dP5frc5EFH4+UEXpQQQk+nmWtYtHapY8
 hiU8EfgTpfV+daMOeGYd+R0w6F44UM/JE0JX6COwynMwImN5/N3KFkAfMENiHHOuqqlE7iMLR99
 spbb2lW7tMG1rxQpuaZUySqOh5BptrA84Knm0FKTmABr+qTyNdgZNgBQKIJpLOhK3aN8R7urWBp
 vjZw672+UfjTYKnpJIaVAnH2UNHPoYLZxT7KlCC/B4TQ8kMHllkO78okoE59crY9IhYoNTO9gWO
 mjCkjEGPUAs/99Hs3Wb0zdxz+Rg1Qeod94H7e2pLyVl73uGNBwqTwpVGJTC3u3XkhKvTQdM8Wjm
 jvOb12dEZ4l6+nt3o1fixiy76nRJkVy45uVavMJavqAuIo/3nO6OpjDvDeVHbr2J8bpB1nmQ4N9
 oXocW+kJFNQOAmN1E4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113103-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57941684327



On 15-06-2026 12:42, Nihal Kumar Gupta wrote:
> - Add blank line between iommus and power-domains in CAMSS node (Vladimir)
> - Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
> - Move cam1_reset_default pinctrl state from board .dts files into the
>   mezzanine .dtso overlay files (Vladimir)
> - Collect Reviewed-by tags
> - Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Hi Vladimir,

Apologies, I had tested the changes with data-lanes = <1 2 3 4> 
but mistakenly removed them before sending. Will fix and send v4.

I've incorporated other comments.
--
Regards,
Nihal Kumar Gupta

