Return-Path: <linux-arm-msm+bounces-93090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APvqFG4zlGlAAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:22:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640714A544
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C7F630333C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CA2303CA0;
	Tue, 17 Feb 2026 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gT+7y+9G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIMXUScE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234AB305047
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320155; cv=none; b=CfCiFH9I+Cle2B2taSoSqsQ4oV2L7lYoqXKxnngVrYcJgPE2CRJnO4/AQEn87Es+ANihjF9F008T+YWgVtdrHsuiE2h+T7bDOq24qEv2SimZ0FhEZ628xeQcRqopQxnTKbYzEnqWN/dZACtDJheq0BAuoF1s3U1brRwDruQy5Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320155; c=relaxed/simple;
	bh=6Dt8poNtf+/65HeetBqu1bzCoVvA9UOD4jN6mLRIESA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gf2Nml6JqJvqIkV0NKmvhZWpsE74KQ69eSO7LZDRQ5Or49AHwGi0uPVcTZ52Qol0t+ZOmwYJnFojPrZxztmIkP3zh2WfqzCGz7OQI2OQOEE3/O0aTE45eBtzzMjwOY1Enk9wvvSzlnwSMXB4lwpFztn2Q5ylsXBwGIuTRHg1wN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gT+7y+9G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIMXUScE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GMjmMs2331800
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yyu0G7HrJVDwCvrOA+klhPNw8TlRjknAabjrLtabOA=; b=gT+7y+9GTnovw/Nc
	mdUy/cAomGRFYk5N/EmTWWdW+v9ZOitxwH8Ffe61TfbPEtofU62KxYad8r7tqlDq
	uRcYei8WEdGX3JUrbnU02i8/JYuKA5Uz6I3r6s9x4Pxd9rc0MkSM3H3bMc97P2VY
	CBY4by3l2I7Zwv5rsVfX+5zAR3XmFSXI+AR6Ti5jyRxO6IgszfeY/t2XKuuhHjkk
	l9iVUmv9j7rWdRn+qiK7VoHS135vjaw0nu/FLggHuo8TschvKspq5BLAHDGhNpN2
	4sGJ4sjnHhU8wBM6aYMiDLm/5Z1A1yOF4bkzICK5h2SZUsvH+rXt/J17ncMk0sP5
	k6Tk2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tm9pff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:22:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70c91c8b0so321059285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320152; x=1771924952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yyu0G7HrJVDwCvrOA+klhPNw8TlRjknAabjrLtabOA=;
        b=eIMXUScEWWcQOCdSXwaAQ9BUEPlCBwnIXLXG3vRJMOMzK7qnkD5sTADrVUj2IxvV60
         REUy7vJ8tSCjKJo+j/o782kGaLhD6pcpaORyrCS7V+Vgz0LQZFxmjBiWZdj1NUWlPjKj
         BeQl/oIv7fRterHSszurF3IoDaly4H0H9S8ZsgWJlwsMBj7nlJhHXa8DMVAwrHLpyTXi
         zxOQVVWuIbR6dkTy30y+zaW1dQHtBEO6S3RD2oZuBw1UKq2KA/qMGHuREP8aWs3rX/Ok
         49w9rlxg3mLYUAuKqOVfLHyTWfcNYJiOYNN02HaAJ+baPGhGex1riFeEGT4LR5ROI6o/
         nG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320152; x=1771924952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yyu0G7HrJVDwCvrOA+klhPNw8TlRjknAabjrLtabOA=;
        b=alpUNlb3YEIguUAjok1Js/l2ja94nStsusVuhiUFgSEZy14+/QPO2Iz/6m5DsW/3cv
         p/CiINp3WU0VhLkLcg3PY+YM5hwty8lci0Eez9HamP0ME1us5CyOeeoTsw4bBmqNf/gw
         He0KtE5MmcJAvP8fQi+GE2EbFhNXoduk1Frtl24bnqAyLzaU6aFhxdvdrTtCBbDfx2ft
         Z4H7ScWNWESXB1rGg7fEABrqfwf+aHfHwQkc+NLsfDKDAiVhP2VJomYme5MkCZviZ1Q4
         IYBRVXFMPvLQ8rgzKF+pHLKCtox/19BKt/aSsLLLrJyUM/dY3cQKk/CjiJGY7qNTnEJF
         dIMQ==
X-Gm-Message-State: AOJu0YwVLzzhEaAWqCzqTjdUqfA+98txKnw8DmDsTOgGe8Ktj7Ilj2I1
	vWsRbLdIv/PwCod/8MWioqMM5cnI5Dwn0nyvxbRGEjKPqeDc3HE0Y2mQI4j/Q0CgBgwiaiwI227
	zR0SKoQuxOK0gIEgtx2gQCv+OHlOpgv98tmJiu452b9ufWJ0uUWMX+oWKgkMfEs1srj6R
X-Gm-Gg: AZuq6aLEzf0wE1Xmx20/GWO+q8S715A/1gCbsVh8PZRp4RgDAWzcTwaBz5FXyNYbR4k
	0geBqpGVxFlKefFSaa4RJ1VGNVzCKnoshnPXjQ+6W1tS2OE8Uf4Mre3ojQV+zcE2BrkIvRpZ96t
	bIq5l+bgNrTUqjm6j9Zu5W2IbdIS8le153HIeggc0RFeNqiByxCt6iT52Wwfu3T5PdaGAuqzr7O
	szuX6zTl/VIcqOYKjMEbodYxBxTOyFk7bNwaRXDK+ja+9s+DxusE/E78D6eOrp6q7EO0RMTTv6l
	SLLBNQMiCtjiKSdBbyC0mceogF0JB0OQS1SgK/quvO6G+NES8DYB4NOZlYdenIOM6y6pj1I5rzi
	FUGryPjXNynu0l40KhhuKCm+89//hJPXhhdhILwF0PGCMBBMVOKAG+hVCxJ2fT0m5IeAdosoFsg
	/wWqs=
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1233147885a.7.1771320152234;
        Tue, 17 Feb 2026 01:22:32 -0800 (PST)
X-Received: by 2002:a05:620a:2948:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb408b846bmr1233145985a.7.1771320151812;
        Tue, 17 Feb 2026 01:22:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627895sm347299966b.31.2026.02.17.01.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:22:31 -0800 (PST)
Message-ID: <610b3776-cce7-423a-8e6e-9db61f53c9aa@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:22:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm6115: Add missing MDSS core reset
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-7-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216233600.13098-7-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6k04kLBN5jtYmaPJ5yryUDe7l7_IKk8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NyBTYWx0ZWRfX4WwPmW11f1qd
 0ddjLwih9bqcJYRJag67mI1tQGaGGDb1RCs5Z8f2oBFLmYk1b1/PQk4JE8dMqRRHwHks1MVAXGf
 GjtyCKLIU8JOjIpvepgtxFq5/OL/zFIpBcRySlxeBK7j3U+2EilLy2keDtxRO0KsbvyNsjjTYGp
 i0sR50/Hfo0UrdhHUwiz1BNc1Rb3hdakAYrkiRlo4dHY/bLSh0g2ZMEzMo+lN00MWslwkrXUbXE
 Gz6zQ/2tfP24SyZq9P39SFXZS2rtiRbPdFPPXYLvWt4OLsXp3U2dAqxFEOGaNfd4CEIJ4qAaWtW
 B9+O1mlY6yDdKTZGGqGItEgPl18y6IAXC19pdqNryD9vLFuOh3cZ13bsDJwj24C9V6mD3jOcmc6
 e5Frka25GiNUsQuBjJTHYFhddW2P5r/xmXyRavs6w/7yrAQFyMuTxabRyiUhCVC2vcsurE+i+YM
 wqDHvBAd1GNv/TbBSIw==
X-Proofpoint-ORIG-GUID: 6k04kLBN5jtYmaPJ5yryUDe7l7_IKk8O
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69943358 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=NQfNVa4L0IZK2tGiTpgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93090-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:email,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1640714A544
X-Rspamd-Action: no action

On 2/17/26 12:25 AM, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. Otherwise, unpredictable issues can happen, e.g.
> on the motorola-guamp smartphone DSI would not transmit anything.
> 
> Wire up the reset to fix.
> 
> Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

