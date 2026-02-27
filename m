Return-Path: <linux-arm-msm+bounces-94420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEreNxpmoWkCsgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:38:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 492741B5713
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B8503180817
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1703603CA;
	Fri, 27 Feb 2026 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pD49iwOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjpwP8yT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D823803CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184919; cv=none; b=lYF0FnubgqwJ1THvK52SJEnodNq2iMuT0xSrV68doIWQBr60shueHDfxA8W9Hb+RJvBb0E7Hx/3fTYkcCoKoyMkcSJu/1EuSFRrORIrGRSCPdeJCNP3P8ASm63x1jwZzZz76CeyJ3Bb8hVIp5qiytH+ndyr+ci1tLajRW9Bzzas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184919; c=relaxed/simple;
	bh=/D0gi3aoeLq+XBFLUHEjo0XS4gE6a55Euh+WzD6ZeXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsSc87WOc9Vi0GrukyXS18NpDIwny6s8G1qYKZOBIL+RV9wtR/W52YAAZfEacMUJM4z1nZNofi0hMeohvm/LiLKAVP5wDM4O6Fx8XVGCGDSWRD1Dtt0BPcYqbld5FrBC0VotBCBXF2sy20bE+m1nowmYwdBuI5J2U4s6R/6/EGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pD49iwOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjpwP8yT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2Jx6c3747010
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xdyDhKWmYiO2wmW9pxHVpHSeSQBV3OpLENsiatFnmA=; b=pD49iwOU8+PrxhJM
	CdDOqIdJBJSHcH6DPSrb4XDEfUFIHlkk+HCYGZ5xNkf4OExW5QYSYJeg6fhaT3gp
	NOUTsjLY6XU0yb+EuF0KQBWqW8dtHfWkj7hGM/S3I/GZARMh/FL3jTaD+b569Mcf
	wm5DUf9ESPRuqHrQvVXLAeUkmz5DM0UDmeulnnx0fip6/d0DqhsfBff8v/e4gy82
	+2PB8U+OSfesXxt9oB8CGbTlVq5BJq9KbISS17ZnTDB7NNXVKCllurdp7xH4V6cv
	5RHmKu3FrZGCYCQXjkrQlXPzWCmUjK+TF5BXIBa1IoIWXbPmKPusQgtwmjYMlD+K
	IXvdwg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur2ekr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 09:35:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70efa3b730so1029106a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 01:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772184915; x=1772789715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xdyDhKWmYiO2wmW9pxHVpHSeSQBV3OpLENsiatFnmA=;
        b=GjpwP8yTkZYMeAcS2v8zfVU7xLVP41mwTcYBVrvgnIC1iAVwoOU+viNkuiUTS4ZUzn
         jexlr0dMW9jtrCXvpdb2TTA/rpUCI1v8YsfHTsSFuTdLDWMlGx7PspMIv1WAVFzFDzFI
         DwEAJSI8upZmfSc77Dwr0O4r0bhQg4NZhInSLgMfCGCqJrlaXCuat9eBhkbs4JCr2sFg
         APxq5/kc8le+8dmT7cyf+H74KBdn+oy4teR1HSNdXUqm3q6Pl8MjqkE4iV9GGi3nURqS
         nFQtc4BWzhm6p6FxlIgnY2EDAB9PXsdLKvPunczFCLcO9KrdElFkf13slQajikInIfiB
         4d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184915; x=1772789715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6xdyDhKWmYiO2wmW9pxHVpHSeSQBV3OpLENsiatFnmA=;
        b=DkQUlPeliywKUX3zuxcrJt2hHG5j7ldfhTOZIxWrhgIGOf3wVmQN2wmBGPOca5L6Ur
         jrlxQZ9WPCrO+WG85a8ntaMTfpQNZmYTSwl2NSspCWvfrQDevae+NQOV7wmeZQH1Rlp4
         BsBBM3FmMkSIP4M32A18NMXgEZLwtLs9GdxGtcKCeN3gyiDlh+q0ojlDx7y72P9xWOiP
         Y/Gp0GWdWRTm1JEtbsJ2QHcaG+CKLhouI0b26S4MmpcsVNZTeIXYGs45yR7sGCMVhcKB
         ZdYoVQJpB6M4QlarnbA7F/eMoQz3U5s7WE7DbXbZ1e+uGAPg+9l96XO3DjWZOmUY9nku
         KznA==
X-Gm-Message-State: AOJu0YyCrlNqtnl4Wgn2Gz6H69qj0BBfSSEC1xB8MNXkNC2rX4kAeaEu
	c/FIJMHY/xMyfJi0vtHIjSwgiqJ3jeJVRLdcned8a++TKtxpUlOz+L/ivE9Q2rDFyCTvbzjR9/S
	0ZzQGWUmdTTad+GuC7YSelZUjJjuCFqaX6Tpvyz1P+KCBK4XyfD+qQUXb4J+u6Efdtp4vDqOPNk
	Q+
X-Gm-Gg: ATEYQzzhi1tEpzz8210R4GlPJeBGk2aoVerm0vzYU0eYrmYaHkXGq+2tT3L2yH4gMQR
	rjmCUgwKQrO5aJJ6ydDIh2/WjHgvGaHWvaO23tx2EIFKZBGAEZqnfOUDCdVvfxvuwoBlTXX0b75
	XQhC/fb1sjmwm4nuiQSc+d5XGve5k//oG+fN6ZAu2J0ZlNs8z1FKNaayh5nosMqCTV8hOtPfJtU
	Uwe9F/PK885ys1HeY8iRvw6Tnc0rjyVvzfgz2D+6+S3GMyf/ITsg9OYx9L5VDBHRQegZ3pNCtpF
	5PBFerZ9CbZDgvYtBNvIDQUxd+WEpBI2v3ZQ7nHfXXNpVI73AaDOGMcnKDB3WjtlNkDpn0XW/Qd
	a5tYDP1VcR00qfeDQdxDXuVwA0wMtvbQOZ8Tnp2DlxclD+RD39oxki9o5nfQyY99jhw==
X-Received: by 2002:a05:6a00:94c1:b0:81e:7496:f826 with SMTP id d2e1a72fcca58-8274d9ebac7mr2340055b3a.31.1772184915535;
        Fri, 27 Feb 2026 01:35:15 -0800 (PST)
X-Received: by 2002:a05:6a00:94c1:b0:81e:7496:f826 with SMTP id d2e1a72fcca58-8274d9ebac7mr2340034b3a.31.1772184915097;
        Fri, 27 Feb 2026 01:35:15 -0800 (PST)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4dc6dsm4680574b3a.6.2026.02.27.01.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 01:35:14 -0800 (PST)
Message-ID: <3f236e2b-4e07-4487-88e2-83891388d352@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 15:05:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
 <20260226-wdt_reset_reason-v8-4-011c3a8cb6ff@oss.qualcomm.com>
 <52bf19af-7cf3-4e20-89ad-813fad8aa9c1@roeck-us.net>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <52bf19af-7cf3-4e20-89ad-813fad8aa9c1@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nnxizHHfHl2GSJKYK_l2-7_PEPi0R-QJ
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a16554 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=43ht1-M-mn3fQUkTlsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4MiBTYWx0ZWRfXxk42SNKghYmK
 YO44qE0wNRFrZk7H3NsWUOjSbO3RPItc1MH/1gdna1lf3+o3QIBPoWYO9ZzIL31iQvbgRtyJDr5
 qs822OpiETFDKcCfJoWR+wOO2kp2Gp63mUvUGiBrKGxLDRlk8GSk7p9BoDkyM0CuX1Q87xLz3Q8
 1LM2R/wQjLZtGvzeoFq0fqRpnljNLXgau7S9g7Qsr/DU/5QiFQuUncw8Wv3fEWLjkVcVuigOGzE
 b/4W8PnKM+nLfVKb7Tkf/CRPTTrrxRPalaGs90Lz+CBDwJn2BLkIteAc7TgXvh8xjWciFQXSxvQ
 m78T0Yg90WO8I3l4L6gFkPJoKBIhbDWusX44GVB9G7/fP95y+aQU3n+Fo5Exf2niBg9qFJ1Nila
 mbd6U6EaKcGa7nSZFWCW2zwjMgaiTVqKgk4VaqEERaU9Y3j5uWeJfF601jW8l4ZPTtp2oM5m0Pd
 lSl/5gGGpFEsmlsl2PQ==
X-Proofpoint-ORIG-GUID: nnxizHHfHl2GSJKYK_l2-7_PEPi0R-QJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94420-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 492741B5713
X-Rspamd-Action: no action


On 2/27/2026 1:12 PM, Guenter Roeck wrote:
>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> -        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +    ret = qcom_wdt_get_bootstatus(dev, wdt, data->wdt_reason_val);
>> +    if (ret)
>> +        return ret;
>
> Why is reporting the boot status so important that the failure to read it
> results in refusing to instantiate the driver ? That warrants a detailed
> explanation, even more so since it is not backward compatible.


Ack. Let me just log the error message and continue the probe.


>
> Guenter 

