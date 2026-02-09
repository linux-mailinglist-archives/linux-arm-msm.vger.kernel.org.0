Return-Path: <linux-arm-msm+bounces-92250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NWsKiWwiWndAgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 11:00:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A90610DE6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 11:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 416F9303FFC7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B3636607C;
	Mon,  9 Feb 2026 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knuPHvmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OApkki3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456DB366051
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631003; cv=none; b=mCFCXKZUHWfaukgS+VeAT+Nq3U5tuB+SHO9c/kQUAJpe/pFdvxvYxMewmwEVQWdB/aC6MheMqqQU6JyD22VwRR5r7cfjGYgm8aof4O1CarIcq4dP8AKdgFLYqoh77ggv8Diyk9y969gBGQW3YFoJOipgxIkk6FGvbTynk7q84xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631003; c=relaxed/simple;
	bh=7mapK2X55WbIYf2UtRc2j6u64tXfI6q7JJP+8o/0gZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLf2Ips09H0ktK32P0n3uXeba0UpR7s2oKo3kLnmtoBXsvyGCSAGykftGi1J8kzS2biaeh1hL6pQFb7y2zuY80hLhz4Tyts+cZIGiBfF+Cr84oUlYBaAdXxyRQrvVUqPeAuaHZdaQKF8wQatw0621yGmuIyV2cxw1nGV2PmOTtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knuPHvmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OApkki3y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195SC9w3252630
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+dT33J0qsy4bIwiR8JxdCIwandYipwLy0Sqp15mE0M=; b=knuPHvmxJvqOtLrV
	tEo2ugSXanQl/crUS9e6zIuKxuU3NwU/O+9BD9SNArqJo8sVuMhUG1DtG/1uZo1p
	+gesCRJpk0fo0gjc0ZY/tDe0rb93rEB6FI71Z4BwLt0SfuV4Cp/eqgo/QOkaDjCs
	nS0XV017yolo5Ho+9lWPKHMyZ+yuzy3G2Z5EnTGBEXBEr5UVnL4NRs/ORN6bQyUI
	XYndVVotaGvLdaerjxiG2+E/HkrnRtKoO+37FeDN33ayHz/frJb/C3M3bnWiP23s
	cB7Ku6o9FipWssxmOYKRGfvY66nKbAN0hIYmVe7B5DjHgYeXk5vShkKuqDfEJ1Je
	xY9m4w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79f68x1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:56:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7a98ba326so50058585ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770631000; x=1771235800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c+dT33J0qsy4bIwiR8JxdCIwandYipwLy0Sqp15mE0M=;
        b=OApkki3yvnBLta+UPbMuCM0UC3yOU+0FubUaO8YaWmNgCLY1BIrI4WhSSZa5GMWeei
         ofSU/ddUiiP2cOJNuTi6lH4UDcRsQGv0kNhcJOAMoJh7nJd/YGlbZ3k/KGHyyutw/n/9
         LeEXPaI9RhpJIT8pooiG5vbdp3RMSHeaNi84zSb9nQeErE4XyX0fJa8QiflkGej6vhvt
         bP67x9LOakrdlwLRLP2fhK4zmmTGrEfdop9lJLsh7+bUCwMfuOpHvuxGMLXa71jQy5q9
         Fe6blPCPO89VqkFhpPg9sw2Nf++lqbjDUewme+PkAA0EEz0eH9Rz9NiLdDON/43MlgyX
         hn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770631000; x=1771235800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+dT33J0qsy4bIwiR8JxdCIwandYipwLy0Sqp15mE0M=;
        b=KK8fqM3rPyPCx8eSmI+GOJUVpzDlQTry8dbqlHSfDAJvLQm3W6K2hePu/L64zdsW0Q
         3wKHlJRJqKZ8AuP5xcdHzwPW4rAYIfuGdqi61w2q4Ns7tCJYB9QLGB0Ei+3/90oFLRWZ
         qY5sA084VFmAI/0lXcVXVp6YFNC2wEs7oYoUJwQyHHeznVLmol0/W/FspUx2nUQZ8/2Q
         DVAJudCt5bUsuw0UmD9QHPprsbYRg/3PcMThkhOt/MpQ6Sn8Z+Mgm/Uay0j5LUmEiLtN
         +ARdKFTmtKDgFm98re2dKxoQzjq98VZqc/oGmv3/I8Myi6Bl1q75hnmeIXR3aDr1eLVK
         nQew==
X-Forwarded-Encrypted: i=1; AJvYcCWqe22/MQiI9b9lbuN+5AbXfvbFr2tqi89I7mAfSajvrN0iMVevLKwezk5ntntajCjkrQocuSQLdiqzXT3S@vger.kernel.org
X-Gm-Message-State: AOJu0YxcFRtm3jUGUAKFQMIHAGAk17+M7LuNxyfC88y9Yf1L9n6GMbAE
	7zIJjwC7k05fG+uZlqKGqTFnYpZzvOh1mOFPvcxXN9m82KxEA1RYlZfphy9k4CV78AyU49gdteN
	Pq2XXwtx/hr37e2G8gaWjq90hkUXc+572rbb+6MySMjHl+3HMUrIV+aH9usIe0JDrmeTQ
X-Gm-Gg: AZuq6aJ0w1UpYxmWgTY1Mr+97LMAzqbF8fL4eaXa0derEnSo5Fa++LT4itVDyB7VWpI
	KGo3TdwmfJRS9eHyhUKUP+akNMPpLxv6sHDTZmixF8OtZsf24xnOnrew6FUC1K02S/6AFw5QJhu
	hpn39nwxUmoL+ROqJ/gcpc6HzS2XoyiEYwLJvldHcgLWR6xS5ajICUJuZ3h++cyFYZV0vOGy2sL
	f1jsStegYr6eSznel+lmbbZIfbwZsKDmbdG2IA8FNPb8YqmnJj39YmWoAJBfIIePxKdU2ugMaA7
	7D1jbdyWOV2q+Cyh+zGLiWodGYdIhO5S2a0o8HRIfEeCkXdDdW8UwRU/ylAl1dHwosHbxkCKSXQ
	Ph58sgLpbOJD4Av4/m9iH3YpO3wPw0soWWdzmu6DwY04=
X-Received: by 2002:a17:903:2405:b0:2a9:5ac3:a925 with SMTP id d9443c01a7336-2a95ac3b04emr91548255ad.3.1770631000036;
        Mon, 09 Feb 2026 01:56:40 -0800 (PST)
X-Received: by 2002:a17:903:2405:b0:2a9:5ac3:a925 with SMTP id d9443c01a7336-2a95ac3b04emr91548085ad.3.1770630999508;
        Mon, 09 Feb 2026 01:56:39 -0800 (PST)
Received: from [10.204.100.187] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c4d8dcsm105331445ad.9.2026.02.09.01.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 01:56:39 -0800 (PST)
Message-ID: <33a7ecc1-9268-4178-9ce2-25cc69fa5bbe@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 15:26:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: iris: add support for purwa platform
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vj22tQ3PaIbNwPAnQc73nByHoJOwKzo4
X-Proofpoint-ORIG-GUID: vj22tQ3PaIbNwPAnQc73nByHoJOwKzo4
X-Authority-Analysis: v=2.4 cv=W581lBWk c=1 sm=1 tr=0 ts=6989af5a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UW35HsMoKDRfkflbz0EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4MyBTYWx0ZWRfXwXXrQLIyB7MM
 ngrr58wd8iG5GE4yyZD88oTwqudfRrXy0bSsnxPQft/TVX59aO7ur9ZU8gZPAoY0W8j60JVeeBU
 f8hr62YDM9x676uKpsmInxfo5+H37a3zyOGeHgIk2LHY3UIgs/hUA29dadEnMekdwPdNxTjlv81
 7XTgIAoZkWmWlZ40XhFPH69K2RWDqhsfc5UU2ScQQT2RduMh9tOZlGMXVKEtqIkXbj9P8oIArDH
 YPhgdoHbMc3gbOpkVUJ2Sw8AVDva2NiGUfeVFqJLLeSiBT+l9icCQYaJRMNcCfboNxmVCjwMLlG
 XB06uYRITnjVt0knDWtR06d9zvW45MyiwbCm/Mx13ImPnBkN2amc2gghCaJ6roSTWaTL12wGBSJ
 tp+1HQfCwBK9uREuM32CpieSblCSYNsnStzfETIPnu9JSZokwPV57knoARUtQYe+O1LXqqA2hPQ
 H5ij+Bc95S7B+KSFbZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-92250-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A90610DE6E
X-Rspamd-Action: no action



On 2/9/2026 1:09 PM, Wangao Wang wrote:
> This series enables the Iris video codec on purwa, allowing purwa to
> use hardware‑accelerated video encoding and decoding.
> 
> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
> except that it requires one additional clock and uses a different OPP
> table.
> 
> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
> and OPP table need to be redefined.
> 
> Dependencies:
> https://lore.kernel.org/all/20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com/
> https://lore.kernel.org/all/20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com/
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on
> purwa. And it does not affect existing targets.
> 
> The result of v4l2-compliance on purwa:
> v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35
> 
> Compliance test for iris_driver device /dev/video0:
<snip>

> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> fluster result:
> H.264:
> Ran 77/135 tests successfully               in 31.521 secs
> 
> H.265:
> Ran 131/147 tests successfully               in 23.490 secs
> 
> VP9:
> Ran 235/305 tests successfully               in 78.181 secs
> 

list the failing tests here

> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
> Wangao Wang (5):
>        dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>        arm64: dts: qcom: purwa: Override Iris clocks and operating points
>        media: iris: Add IRIS_BSE_HW_CLK handling in power on/off sequence
>        media: iris: Add platform data for X1P42100
>        arm64: dts: qcom: purwa-iot-som: enable video
> 
>   .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++-
>   arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  4 +
>   arch/arm64/boot/dts/qcom/purwa.dtsi                | 53 +++++++++++++
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 86 ++++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 ++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  9 ++-
>   8 files changed, 200 insertions(+), 2 deletions(-)
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260209-enable_iris_on_purwa-a000527a098d
> prerequisite-change-id: 20251113-purwa-907ec75b4959:v5
> prerequisite-patch-id: 2ea4d3d7fbac51bbe48d22b5c58935b3ac96cde1
> prerequisite-patch-id: 66cdb67c1bcc2519610764ccd90b551fb8713493
> prerequisite-patch-id: ca9086bbde147db45705752a7ae259c76659d988
> prerequisite-patch-id: 472b96f74b6d14eab239a551f005f601af9633e8
> prerequisite-change-id: 20260126-purwa-videocc-camcc-00e709474bef:v1
> prerequisite-patch-id: 9884a11a7a39ea49ea4c6ac72adb95240c6788e8
> prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
> prerequisite-patch-id: 2f4d4c5c118e057c76e6d2785479df01d5bc1c7b
> prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
> prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
> prerequisite-patch-id: 8732f9b7fdce567cdca57e6b8520d0279469edf1
> prerequisite-patch-id: 1162da1ca0a8467c41141a5a0bf58b85b7777c38
> prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c
> 
> Best regards,


