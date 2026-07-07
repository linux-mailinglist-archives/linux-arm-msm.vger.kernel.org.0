Return-Path: <linux-arm-msm+bounces-117116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jyrOLdWHTGqElwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:00:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B5717532
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:00:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lcrxlKGh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Eexj49+g;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117116-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117116-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84E50302C5C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5443783D8;
	Tue,  7 Jul 2026 05:00:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8E35BDA4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 04:59:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400400; cv=none; b=abXqopBeXLWlDvU0oTQMhZoc3oL6lBQQ0lH3WnSsUmgD/7g19bSYH+hj/MCFgaLqA1do/nexZG/AbyT4U1vGBpnYQbgHoyMfUvLIFqKEI8NJnB/M3E9Y7sIeyybgnQYeShPJknjpt8t2bYwlk88e0XZ5cezoE8G8UDt4HRI9Cz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400400; c=relaxed/simple;
	bh=KwX6N+O9LWkDxNeUi08yjZDQWfzQgsZtK1Q4XY3MXu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzURu900APiF3WJFEW2BrNP9mRHmy3SV5nH8DI3CiIGITCiJkl1/d6sbuY42ffPVmu/53cioe1xA+H1FEgC9AvK8F0Thj77mMq2VNt4pKdUJzbhOGGNXQ4sC9v2z9gayS1NzOpzTzsaA5un79O2h5i5vTpuMzOOAmX0DNzqb8qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcrxlKGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eexj49+g; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667495LA2498892
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 04:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ju8/Dwzst0NBAMXt4pxpYSRWOuaXdr0l8OpHASFq3xc=; b=lcrxlKGh0t59Lc3E
	Y1r2zmQ7hfM54tmhdKFOo/fQrSDIEta3hZZNR9h8wEp+eZhfnlx/KiZLb5gMNezY
	kMfzoavvIT2Surpyt7AIBOk1CiSuY0bCyWjHXXEn+T9WBCHJ48rXo8sIccJJjVfx
	7lYd4evOX2nuSL2L4GhQmP5mQw7PFSyCwQPe3eoDoXWGau7Whz+jYvc7yookveiM
	KrIMbbC714oJ1dxAmU7HlALKojg8CTAVd4jcUSq5QU6Lyu8eFxfRpOLoNDMxgW5q
	qhsUeNdpSUp/378fIG7dTVkj6xvgmi8bE5F92Pe0NGl57YA9SETgRVQkLwx7aVCI
	76c9Ag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscmu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:59:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso55150725ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400397; x=1784005197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ju8/Dwzst0NBAMXt4pxpYSRWOuaXdr0l8OpHASFq3xc=;
        b=Eexj49+gjs64UAnpW2vRXC6wnGO5MQOpfp1kHssro45auCNq7/mAbKsrys0BUjQY3f
         B5AAwzbQMn8Sa/ADwjj7646X0/8pCFWDA1Uhs+bevfNsliowfnom16BZszYjKWhsTh4m
         IscE6uTfGyS6Isgptzutn+v+Az6Do/CLb6nnXWVM+aUhPFcUFgS5cuToBcpyua+kR1C0
         uaCmsF8mZi1O5VHQ30JD3OLSvxLQZmqHVipFuECvcbpmqzZ4mZ1tN/BhS0AmEvuUbFdW
         lfMZEj8Bgc2eBMElX1WgsZgZLxaNJoBUhi+MAYcKsEGkN+dWlO7cLT6sLAwJHAn7SkMy
         AgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400397; x=1784005197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ju8/Dwzst0NBAMXt4pxpYSRWOuaXdr0l8OpHASFq3xc=;
        b=ftI4iJKkP7JLG6NvedKDoElBBGCGFt1hfvXVnl6jx77TzPlUIsGtyyCoZ3WjlvKiLw
         tiOobE6IJ0jIF6ZKw6yrVtaCR66eosBV+9mte2SBIzQ0IDKlIRFN7mqyr6ZiNSB9LjfX
         YplcVT92tyIXiD41xsvWf5rkmrJkXt4JXJmAMe2bYmqd0X3PyBbGlhmFWe2OfbYRL2gL
         swesuah7Q/ukyhWVtFGX96Ke1N8nNVAO5aGR9iNYRd6sWbnhJbWDiiMqsz7igUxe9HbP
         9GfEMfr3bO9u2u0EcQevm5/u4P21aimQI9FlJ4xFigNBxxmxrPxAJSwp+UvB7EimHnS1
         L8+w==
X-Forwarded-Encrypted: i=1; AHgh+Rp9DPFDLIhJT7qj29jfKiU2puxbnLyMlSr2wphYG9aJk4U71eTZZZbyjAUCeX9rF3S780Utv3eF2PeQ4SLx@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUzOSkij2VTibk6xGzDQNOFW/Owk+nnweCQYc/92zlCFGcA8V
	2P+/vZtHlkroUXNxqD2XzwBPx8GCPDS9YgEQbX3Y/ZOS1zBABnf48enMEUquqxy3f0JXTa/pu0S
	Xq8Md8jsayCsEMvD8SXlS/9zBZQCuS9xykDDpgwkqqRiz7JVygiDG7pYJCy4nZ6qvIDHz
X-Gm-Gg: AfdE7ckAyNFGblZ0FMfiku2k4P6yHRikFttp9v8aInLO3YDUaAuBGMnZQhtU7+LHlRJ
	2l+2sdZE/aVrIWRxD+BlUtBzhuFNGCgRQa+2tRYVQIYwoxS4ZKTZ2TaJYdoPbsPLKWSkTWlFQhZ
	UPeuEHpYj978UfBIIFx0DLQGux+LnjDHGFPAHC31P9iraxgPFjwXARzEvFeYkgpZj1yKKHkSzy9
	OihJIN11l6Dyflnq7StqiPqp/j2qTFHJHNiTsNlvXx/HbqSASkEqqrcwWcWpEaEZA9PE3ejGDhW
	Wp/vvQqQoAOrnu+xmMux43e9pVnTQ/oHTp/uFJyFuwggEvC/kkoJxSQkea4uRh+SeQYmBRYmioW
	+SuEy4C0ldifXkEEz0Nq7JvFTzj2pIvUNzWqNz74=
X-Received: by 2002:a17:903:3b8f:b0:2be:3850:297e with SMTP id d9443c01a7336-2ccbee24a98mr42439615ad.31.1783400397177;
        Mon, 06 Jul 2026 21:59:57 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2be:3850:297e with SMTP id d9443c01a7336-2ccbee24a98mr42439265ad.31.1783400396769;
        Mon, 06 Jul 2026 21:59:56 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb6e2sm4874965ad.3.2026.07.06.21.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:59:56 -0700 (PDT)
Message-ID: <e64504d6-648a-4cf3-83ff-72b9a7f77979@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:29:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: gpucc: Add Nord graphics clock controller
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-6-860c84539804@oss.qualcomm.com>
 <c462694a-d48e-4e05-99d4-b2ad1036baf3@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <c462694a-d48e-4e05-99d4-b2ad1036baf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vkma37RP-XDI3mAWimG4_2cmBTCpcagQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0NCBTYWx0ZWRfX5HIF03+7kpq1
 FzX1dKzji/WmXfmHNx8P7KDLNHt5DOt1Q2sQ3Bz9rDRZGaFgaqgoMKAYWPxpE2TslGjk2/Gu1b9
 KIXiGMn1BMMDLxDPdkeXd+Jco+dJ19C96ZXV6/MITCdtwGacrzUW3LRTYdVix6oqZFHX9Fdm/ea
 fXKqVzmc5EwRq15go7Rf6Z+WmJY32yiY8HxujAjI0UgvSZ4nfeAS8QHag9tPWfQD4tm7gX0/URb
 dva0XgU9tT0FE8yG8bsVlAP3emlphhLFFdHoe6GxjCk8uMoSPD7ug00Q1fJJ/HshGE1IlKiDk+S
 VkBnG6YvlSWO/r7H0ij22kNBtllFNDG41mPoXaftrC1kGt2G1C586LbKeD6Yq5Hee7fRM+hwERz
 GJlKdpw0Fh8Z94bNJ7wH1Z7AkXpVG/wejbu5pB98Ks2+pqNszjLVak9FlwhwxJAVdPjDdD3pEr5
 xOps2VoTXZDw8hX/3xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0NCBTYWx0ZWRfX3uGXfyPfPddn
 7eoM9nx8hojAufRDunfjYzNI/aZm5BX0DxQwBTESKecu9VSc8pjUo9t89sp4NEpiQoIt7zaHDNp
 N5ZZmNJXqpLGQCgXhqT9tSt9qUq0xpc=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c87ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=CnYZe4LDIn5mUAQqU_MA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: vkma37RP-XDI3mAWimG4_2cmBTCpcagQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070044
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
	TAGGED_FROM(0.00)[bounces-117116-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B9B5717532



On 6/25/2026 5:39 PM, Konrad Dybcio wrote:
>>  drivers/clk/qcom/gpu2cc-nord.c | 546 +++++++++++++++++++++++++++++++++++++
>>  drivers/clk/qcom/gpucc-nord.c  | 593 +++++++++++++++++++++++++++++++++++++++++
> GPU_2_CC and GPU_CC seem to have a different set of clocks and
> resets. If that's not physically the case, please align the
> lists. Otherwise, please use a separate bindings header for each
> one


Sure, will take a look and update separate bindings.

-- 
Thanks,
Taniya Das


