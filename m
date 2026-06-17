Return-Path: <linux-arm-msm+bounces-113625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TrkzCPOPMmqg2AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:15:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1F69999C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:15:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l7DFG+4g;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="b2e/PgHs";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113625-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113625-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B6113020ED4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E0A392C56;
	Wed, 17 Jun 2026 12:11:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC757217F27
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:11:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698300; cv=none; b=fi6Ym1lUkC7CGcktPacnnbXIvSu+XjNctjMVFeWmd2Rxm33TWmnjDP2AL/3FfIp5zPHeTlTw5YRHVjy8IU+GsoN9uYhYxwJtCXCC8updvxHbyn9waAxaoVDlP6zKUhGa7vsoi9tNPWJGsTV6kxpSu/pXSslrYKnGg0dvAMADemk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698300; c=relaxed/simple;
	bh=U065ANd9oOx4xWRmwPkvwRyxcFd99MH11yA+2AkkyQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THTOq/NdgYE0u1wCjTVQiQ5HY0rbR4+ZAw5GMQWI11MZASuq6JROqEq34ug/Au3jVr+YjwaNNnYb4LcsUyWoRnfFOvBpB/hqkJ1deOfz1y/wZGQ68qU87k57kcbHTAeL7izZ2RZQBs9y2dCFaH1QcjvzBITp3YolkSg0AjJY1CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7DFG+4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2e/PgHs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8W06H2056636
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvYjcqqwjarNDsMWrLD79SnsXgpWqHBe8tU1zyG2q0A=; b=l7DFG+4gfMlKacwE
	AnEXuhB5QIYwdpfRSS2uRr5gcaA4076kQgncB78jOKYnvoQBa4l0ajdMRBtXr3FQ
	mwqK7A3KFAIFPYe3QMv/LHu4EKD8VzXo+a8zlLNbn1Sr41yfbNMz8qdv4EsKx39g
	erM5gYTyrdrKM4rRoo3w8UXq0v4c2v8HFoYtpbCE6d8Qmmnv+OXSlxNHQmm/lLns
	JReE59GIZLK3izAPhYcMYG3Y5OYxbgz8Odkw6S+usDD/wpDC9ykqpG0A+jfoqwRb
	L4AAACcu5xrUwlYtwZtqy0QYMlsWy3PxbtNeFF26Yn72EppPp4gbpr2jlsR8rHYh
	XwyfGw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesb1xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:11:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c4271166f3so196207137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781698298; x=1782303098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RvYjcqqwjarNDsMWrLD79SnsXgpWqHBe8tU1zyG2q0A=;
        b=b2e/PgHsc1fcEvzpBUHHRcH76TzNSsrUfnCB95p2Wnre7zx7tR22kFa4PWZFm8aItG
         VPRY6PanFvIG1GITcr/IBVik3M7hJL3Jn5biuY0prhYrMQDtZUzV8g0AFSjzyB+lKHEU
         MbocZJ4MQqbsoCgjOnVD7xbRWVjv4H3GfH3AqNyYftKa8FUV5Wxt6nPdPgyVtsZIlwcg
         XgA0X6q/EPhExZHBhem/QE1Zn5xJD05zM72ehiFZDolBOS2U4VjLNR7SIJC5npv17yUX
         MCqb78MV01UNqeyhCpiQT6zMJiEI9J+TE7Jbjf2pFfCYBjJBJRWZfT2JH942vfcZovJf
         rtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781698298; x=1782303098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvYjcqqwjarNDsMWrLD79SnsXgpWqHBe8tU1zyG2q0A=;
        b=JGxec7EvlbRVweCZriPIZrEFbxmzwe1aSI8T5PkTjqnCqINsQhxbTH7WRuPc2rkW74
         oidKL2NNCHY61UtCYxeHQeLLWzm7nz0LaArsKTVh8mI9qydwrbrd+FptHv3jd48ZWQeg
         tb3bxL0UrZhzahlt0QGZGpcV63dBKS5Sh2cnoCFslik29MlXOK7LHKDQVSqIMoqRHuiK
         2ZnQf00cqka2bN8YYAeP31udDxgz9BPCJ7r4uvwpkR0f989BYYP4/l/DyUd3aAFBy1K1
         3rpOi6MrH+esiYI9dYLHegQhhjS1UkxhYVlMQ2eNd6zQrCkngtMvkkXLimi4BNDtSEO0
         xVsA==
X-Forwarded-Encrypted: i=1; AFNElJ/nz8kW573bovp9xpBZ7fjNa1/GzayXaWW9KXJxSoii9PfSSLNRWWKuas3zKBTTtzxnKl/XBsh9K8sWJosN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz3g1vqd5AP67pkITW+vNXO5nL5QDjTL32Pe/epAt4u0QUnmzJ
	yoFClVEuYGP+PZGb5xKFvW4bqikyD+EHW8F+awBo3messsQSeB0jUP7Z61npprlXZShvBRz6DcH
	D4l+G4IwMDZvnlgQOR0UKZFGa4NUDIxKycqaBxWUmfXVGirkjFH6xMu/V/ZQF48C3UyF/
X-Gm-Gg: AfdE7clHAA37HR2fqeaP2I8n+jQjFaZ7zNV5kYKiMcGcEmJMbLO5ud7E9oaw2cKssvX
	wa+J7bbTqNuhYfLM5UukHjW9C7tgHk/TFb1IOJIu8ECsvLKEt1VV935QZaUhWhIWk/zxbvJNGPd
	9EL7bC5KAGbCDzx3Y9t7LXJEyavuPkFbAaf1HQIRXo/77pv5deBvVB8lYJUcd03aZVn2aQJTJpL
	Z45b9PUkVzD9GEMFmTy+uO5igdSoqHRK0C0yvfEI0FFGDpi+8esrngjhQ/M+7lbWxOjBZH34DmV
	HZy5mlUfhqZpz+4VFcFYD9wohD2lMI3EIXi9DryniaBODOR5gdYWMSLSxmB2yiRXtJDnCB/7FCu
	x7FHEpllWdiAxepczeq1sjkkhpo8YayqDs/w=
X-Received: by 2002:a05:6102:8499:10b0:726:e608:6651 with SMTP id ada2fe7eead31-726e617ab08mr45117137.2.1781698298067;
        Wed, 17 Jun 2026 05:11:38 -0700 (PDT)
X-Received: by 2002:a05:6102:8499:10b0:726:e608:6651 with SMTP id ada2fe7eead31-726e617ab08mr45100137.2.1781698297638;
        Wed, 17 Jun 2026 05:11:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm781731566b.27.2026.06.17.05.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:11:36 -0700 (PDT)
Message-ID: <a956a733-7bb0-46f3-bf21-142d5cb8fc3e@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:11:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
 <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
 <ai+9CYntPuyEEcLX@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ai+9CYntPuyEEcLX@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX4pjz8qJYq7Rr
 5SQcgRqxqOmX7OU2sZu0VUigyeglRFoqtc+VERozqYMTfqICAqtwgHRwuPuXvWTRco1SebV5XYd
 yj/0X1eICByDVedQfKxDf7E+INTg0BA=
X-Proofpoint-ORIG-GUID: -RZXrjUTgY66O6dVYLuY3kABE6VHrnXW
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a328efa cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=kmjxFz_dt4H88yzuuMsA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: -RZXrjUTgY66O6dVYLuY3kABE6VHrnXW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX0+9Uv6YnC0R3
 Vla8NBvLh7RXb2a/bQXSporpk15sg1owHc1WUxfa/jBT33UdSN6YD4iF4o/74w6rpM7cR6bRAEK
 E5aY0fKQAQtOF5WM8QbhsM5bEBcyzZ+m/xm1gbpW9wsq0fpF6bLvHaiS2oygYJQ9zy0IXQm+e7B
 9Vev+jrfGT+HVr+v1AoB1XbdpyB8zgktcp3HbvCu3LokMQKomcvYVGhUhxfg0rlc5gyZU6Um1x3
 DksYXaW/+jgmfs3p/IHqMMMlxv5TkZa4rI7C6WfYTgI2SawcHqmf9WsD9jpCUQTQbbPFY6LdZOi
 8myNUKCXXuI1MgxKOPBDT9aHRvYuGNBo7vZp+DzABFRvEg114JCC/OZ8p4XKEe9C55AyH7Dd5N4
 vg1eaX7BjNyOKhqgDxAtKfB8iArPTJEGPLTpHg1LV3F/uvIyvYiczVu6hcXuiUq1z1FsptJJz3b
 MMDYimGQ9BlyUIhdezg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170115
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
	TAGGED_FROM(0.00)[bounces-113625-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 86D1F69999C

On 6/15/26 10:51 AM, Qiang Yu wrote:
> On Tue, Jun 09, 2026 at 03:06:02PM +0200, Konrad Dybcio wrote:
>> On 5/28/26 4:29 AM, Qiang Yu wrote:
>>> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
>>> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
>>> directly instead.
>>
>> This is the last piece of the puzzle that this series is missing.
>> There's no QREF clkref_en, but there is a refgen that needs to be
>> powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
>> (1p2).
>>
>> I think the easiest (laziest?) solution would be to add dummy clocks
>> in the clkref driver and only toggle the required regulators. Another
>> option is to defer back to individual drivers (such as PCIe QMPPHY).
>>
>> I kinda like the "one central node to drive power" approach, but I'm
>> not sure others agree, since it stretches truth just a tiny bit
>> (although not as much as one would think since there are *some*
>> controls for the transparent-to-the-OS hw pieces in these paths still
>> in TCSR).. Dmitry, Krzysztof, would you object to that?
>>
> 
> PCIe5 PHY on Mahua does not use QREF at all, so there is no refgen for
> QREF either. The refgen supplies you mentioned are for the PCIe5 PHY
> itself, not for QREF. For other PHYs that do use QREF, there are two
> refgens: one for QREF (voted here in the TCSR clkref driver) and one for
> the PHY (which should be voted in the PHY driver).

Okay, so in this case we have the refgen regulator hardwired into the
PHY block and we just consume it from the PHY node&driver, am I following
correctly?

Konrad

