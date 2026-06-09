Return-Path: <linux-arm-msm+bounces-112170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q0IsDWIRKGqo9QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:13:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CEC6606D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:13:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hoxdPeW6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X89oXK4r;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112170-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112170-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AEAB30417B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E8641C31B;
	Tue,  9 Jun 2026 13:06:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590AB41C2FF
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:06:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010369; cv=none; b=AViKalnK9W06SmAoT9peW+9EV3YnZ09ma2VtX6pM8rlt9uZE5hMtT/hQMYObpKKdw+/Y11ygRciq00D12mMpnafGrt2HcVgZiXi4DfAp0HXZKVmpYl2tKackXva0XjMmv8Fg8a1YZpc4IiTSRkQTWmhaKLFLnc3Xlii5VVsf4xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010369; c=relaxed/simple;
	bh=YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRSzwnz443yoFTMxTidPF4iI3ODCAlqdB8/rUqpcGa5CTHYa7w9fU2B4PJ3v54cfreCLBM0BwM83jquWbK4rykVCoB1lSONaya9MtuYGeR2c4y2EzlVqhSA49aHK77Lt7Q2QSRGaQ1Cyou1RvxKwU2qYf0EY6UwZmGqBXX2MHa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoxdPeW6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X89oXK4r; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Cla6Y2694056
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=; b=hoxdPeW6aHqFtnaR
	l8W+0aINbVu4xZX3CM0Rq/jD8Fl0pB6R3k0Sw5ZetfRQnKFAaNrltJDzMO6DX7N4
	npHb2RgPjYBZqLrhpAa9EKoI71gGZqau/I0NcGnnDDVHibfGEMoZNa9JQ7tm1Ke1
	F3R5HvHVfbhh/oxo3ESoiPg5I7U3qK3nzaGLMR7DkDBbADZGkvuiQdO+E4QoC0Fa
	Rjh8Cl1y8DY3jkGCijmlil7QRvxGluW2pXMkxDjkOeZ2UPTdtfzhDYA9xFhBCB3+
	576bIExdKzeJBwWHKELIZc/9yq0Ozu6SaOKb9PPR4biTj3wW7vh6q55LVZ5aOAKZ
	qC4lLQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v0y6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:06:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963d7aec431so220663241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781010367; x=1781615167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=;
        b=X89oXK4rIuYimIN38b0v7E10elc8VLnXA1izI/YoBzndccRU7N/iIrFs6b06MjqwEz
         NR0+jLH6ESbu8RrUy1QRsOI5JJXrzDTJUX64n0B+XiQgp3hrLTNH2x+R4NKLiMTxIj9R
         xh1oWhrhXKiT+4vti2cCKkI5XoGTv/B/PoSJItkbd1sypGTYHosOySuOSx1lJTyEDE3a
         G639K9pOK0iczy74T70qGuVySzOdkcc2H6ITVQzTIaQTYMOTGOthiUXViylkclLOs+qt
         7C8YZ7xTEXnrzHmY0TeZQOk7+VvVU70lOhoWa8h1vBG5n7rIaPmBS2HTFkw2V/YRkxbc
         gCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010367; x=1781615167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=;
        b=Zl7lyftHvSllRVbh5tafrUYBJrhvTsRAJeECA9GXiXScWkw6syqCJxXnaBfqxTDGta
         EF3XGmrUkq4Dw4gBy4XE32wPTdCqA8RObSJzj4QMpHKSiKQsNR+lY2eqbQbYGcdFR4Ik
         Rvpuq9rnK35sECRzKStrHs0IbaVw7sLW30VWTSjUr/Cq5G+jSYa9u0/RO6hCE3r7Jqy3
         RDgPiPv2/s1eagPBmJEijD4mPuobvv4ifiG4walt6hQgS5npxwkxNBdgefUfCEKnhzKT
         2pcp9bGnZfeOq80u+seVXJtFGL1eGfu+qCQWjFHCs8gAxizLLIEZnbkeweujup807dl6
         qWSg==
X-Gm-Message-State: AOJu0Yyv67Kzk5Evp9eh2yCJPEBiJj8hmNAKogTKsl0Y6CLrtkhOAJc8
	wEU8v5SkMk207NhKwwFTh1r17iT6zvk6YGWOveIUTYK8iW3XyjnkKQ21XWU6nqAIRwuwlnTsCIr
	tKKozD96vBU2zIw0G1vfbTaENe/FDZxFXio9ufkF0zZ8pmqIC/FXqtM1xQuOMl3dBgHo4
X-Gm-Gg: Acq92OGQ2XWQdLogb0+veDgPWn2J721i7k9dk+9suCkFFFTpCwwxhr/ndbumF9Rt7OI
	LizxJDxA1du8//R8g5fFHvts0f5cbdWl49N7HiJL6niKn1y5QbzRkhfe3mjwjBImpTIk+xHVses
	Ysc2f0ryeRj1HX2x90K6ABtdOHApi3leCIapPi4ADpvaAahD0BhHDSNQslYRdgTNCwpB0UtSSD2
	shL4F31RWxk8cBYi+PGdS//bKdmI3KM20HZSSTAQvrUIP23+xY8TRZ+Abmu/MHusysFxvS/e89i
	VIRFbk5KnyUSUoZWiW8NxBUK690HK1WmDY7owMYs4jWG/ECTwKMKsoKK+NFnLO3AgAidARdm9Nb
	vlRea+stDQncA219hiOZH3sU1oTKgPHPdiXIAR8L/UkIMS+RckAx/JdJH
X-Received: by 2002:a05:6102:5490:b0:65a:fee5:ceac with SMTP id ada2fe7eead31-6feffb06cb0mr2878502137.8.1781010366634;
        Tue, 09 Jun 2026 06:06:06 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:65a:fee5:ceac with SMTP id ada2fe7eead31-6feffb06cb0mr2878459137.8.1781010366181;
        Tue, 09 Jun 2026 06:06:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbc9esm4578992e87.22.2026.06.09.06.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:06:05 -0700 (PDT)
Message-ID: <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:06:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a280fbf cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VaM7kzH05nLpQn4dOD8A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 25bU5kvLeEeNP9fLYPoO457TlTZLgumP
X-Proofpoint-GUID: 25bU5kvLeEeNP9fLYPoO457TlTZLgumP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNCBTYWx0ZWRfX/ZJSCoyGydrL
 t//zr+lV95Yrx5qhEOZkGL5xnOqbBcDWcmFgl1zJm/pSj/Ot7ngX6ktkbuzGnfUhi3UKw/MsI8U
 QVRliViO5O+b5JPPX+BCI0MX+ha+0l6nHoeBawXZ70+CqmZFtVOx/o0jsDN1C2avm8pH3OsCJKm
 +972YKt2XQ1fjySLZEjDolFZANJ2ue+RWOs+IRNTKHoe8cU2pHGHLHatDZALdsPXzv6VbiMtgcZ
 hrO2Q0NoSrmVroC4Hg9gQR1uv6JU0EiBPIFvbskPYK/LOJBBdiQ+93+DB0I5uJbRQzxDbzTZYvz
 Rg1NeZBHjOFHMqo7aFH07H8IX1tHYgkKHdG1fGTzlkOzJXWTborg3jppfPMBGu2Mf/c/VbxxS+v
 FOhO6LrQdO1DbRzASB9r2l69yKiFkdUt6Gvx5trWvCbh9rW0XkwZ9cSoHrA3nOcD5tophv97kne
 4RdviW8kk+KO5WqHaXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090124
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
	TAGGED_FROM(0.00)[bounces-112170-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: B0CEC6606D0

On 5/28/26 4:29 AM, Qiang Yu wrote:
> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> directly instead.

This is the last piece of the puzzle that this series is missing.
There's no QREF clkref_en, but there is a refgen that needs to be
powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
(1p2).

I think the easiest (laziest?) solution would be to add dummy clocks
in the clkref driver and only toggle the required regulators. Another
option is to defer back to individual drivers (such as PCIe QMPPHY).

I kinda like the "one central node to drive power" approach, but I'm
not sure others agree, since it stretches truth just a tiny bit
(although not as much as one would think since there are *some*
controls for the transparent-to-the-OS hw pieces in these paths still
in TCSR).. Dmitry, Krzysztof, would you object to that?

Konrad

