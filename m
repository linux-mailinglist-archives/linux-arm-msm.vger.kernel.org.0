Return-Path: <linux-arm-msm+bounces-113619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0YZzCCOEMmpm1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:25:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C9F6990B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:25:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LJDS4R9m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YK88d7Mu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113619-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113619-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1D7B30DF63F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274C637FF76;
	Wed, 17 Jun 2026 11:11:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12FB273D8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:11:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694674; cv=none; b=rYtuVBwubkEWl+Fo4+f6vnfDNYcLbzYI+LQtfF0exW4pv/cybF6DNt0UvaG4dcUDvko4LzJXgxINndtKNNjT7+2bLI8Kfx6WmIFDJ39sDaYvVAb5WdFpehafokvUanFHAc/g0u9Mr+ZI+lm49+LSZTuX7K1PDtbk+sz9a8dJmWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694674; c=relaxed/simple;
	bh=abJxTJQHPpctPsOEEhz5AIH65tAnkE/T7tTw5wzbxKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O83aVJitE3IcP2rE5cqhxBvLp/pWyApQZLCiaXJqfPSmX8vFUjYS5+uueBCZvel2JJ7NZwHv8sUgIaaoz88P+7se407D7E40BGmGBPwqZM1xAlwCfFSE70Bbark5htu8QlbaFz8nxo4i9rKVQzhXWJwN3c9JZRLuWiUaUP3IyH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJDS4R9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YK88d7Mu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UWEZ1703608
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+CAlI2mC7CrECZNWLB5YtnzVTHMZtiM7ob2HvOlYUAs=; b=LJDS4R9mZSghWY4D
	fHGoHIawVq0Djy1sXXZU0oWqiD2KCPTpelkOU0txt80njTc/hG14s53TyAz4ZkFg
	uQ65qsdXemJFrQcVaxMX+uQ+liwJbKrX5DBwXaaTjSSZitScauVMRtY4DqiWL6Sl
	gyHBncxufhkJ8f8siKowiF+X0MTX+C5a1RivEl9Wwf6jpTTENiwXapwnZKA7uuMx
	X1dXLNM7BvzKIkQon44VwQXlVGcO3yYjjEV21R4Z/mbiGbVk9aV0kPhH3EhY72P+
	z0EVrc5lS6RRytLS6o2A4k2/vMn1qNa+LmoWrIET0tH0OgNHrfN5PfblvhwhDo/c
	moqZyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet2qxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:11:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915756c1407so40083385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694671; x=1782299471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CAlI2mC7CrECZNWLB5YtnzVTHMZtiM7ob2HvOlYUAs=;
        b=YK88d7MuV+zpT+3JGwIkC4qio2zDsvfmcW0+iJes+1eqFQ0NgdfDbxDG9mW9fTX8Wx
         NicwjIkMTJ0lf+Cnjxa4wLnWxrWrO5/2d4v6pYpENAArnRDCvlUOqoSgbyIiiskKeVkL
         PXcifaUyQ1xkb2N731Br1/Kgb+tEllqPhvaFC+O7q7xkLx309EtwIULfuCya8YolBBWg
         tgBYfxhuVTXZVJ7ldkRslDEt5ppmJW1KaUmx02hiGKPYVCTimfLiNvpGmlvGykTJ/4NA
         xjsMZbVN0OfvGHJSWeRHlG/aE6qcK05bODXqiV/jx/g6Rhq1RrMvL0GOjioI8fvQxY1y
         52gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694671; x=1782299471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CAlI2mC7CrECZNWLB5YtnzVTHMZtiM7ob2HvOlYUAs=;
        b=etLgiInqxqAWSdy3lbu44W8b7LGxD2EF+QuBAc89xZDLUkXveHKP7q7NxjbssI0yOh
         LNW9sFN2vFS7LW9Up3r5cc8CXsDk4fXM1qg5WrTKGX/t047YhE/hNBHYDYfPXPDlsezx
         UdnCtYQI/Ioe7ryHjbCSh1N7ffwnPSa8OnWkDQOrheU2xb7Tbrmz0ciQpaQvhP3LX/Ro
         ATLS5zwvQPNl0RHtTLWaXXzSXP3rVyN2INpqlmlEt70j7H8vvhU0T9ok4zCq8Bz3Z4y4
         g3mR0UIHKVZyEwI+GRIeWnmylq0yF9OFCWi3fKXD8IEsGVmsbYnGsSko4y4OJRib0arm
         aeJg==
X-Forwarded-Encrypted: i=1; AFNElJ86hTdjiFVghB0IoH5HyTpmoaFVcnhHUMFfynpDyu2E73E+yHxR6vWfDQQvkGo9KrzGy7fIMc6H4qIK9iuJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwwG+Ou14Yhov7yQUWci8n3Isi7XPDa5hPiH3QdurJUm5nsFfSV
	9Ql4tFP+smi5/b3sLWDsnW+nwgCPhfx+KnTZjhval5VAhlLy4jHqSprr11uCy6v90CYnXiHsd/t
	aKnI7M9PWa2g/2THqQU4lufbETZtKkp8tuQScyatBP8IDK9TRwU0RZv0vgLdvPaPqljIS
X-Gm-Gg: Acq92OFxe3yS7tWLRo7F53aHBdepnyGjeTZeY16QBAf+dhPW9aOUlRH5c3girD+SfDf
	3SNPjnw7uhASvIsYDcf8odB97YhpQ6zNwxedkG6fY1CEpgI4y7H+UKasClRiwZHoRw7cvFabOJU
	cTsBXvE/7ZV9zkWwQXlPkn0Lv4uUqIdq/gMkrSIvOYuctZoSFfp2QamarN7zig9Vzo3YucurAIu
	n5mD/EVUOA3Z8t6hR/kqS2PDRh7Px+3imqDQKnuYB1HIEpNh+nk7kGqyZW+Nxdf3oKhOBpn7rFF
	leXuTXXgGzKKEzZuOx5mTSnIOjWflxYW2z7ftZc5OjiFGqjLdnIa9qUrfRMwUyaap0CtCsHZSHr
	G5tOxaUHNA772Nk7D+K6LB13iWwyHJj/FyJ0=
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr355356885a.6.1781694671480;
        Wed, 17 Jun 2026 04:11:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr355354485a.6.1781694671096;
        Wed, 17 Jun 2026 04:11:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d934sm783135966b.40.2026.06.17.04.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:11:10 -0700 (PDT)
Message-ID: <cd0c493a-ac8c-4ae8-ab41-9fc8207e9834@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: Add Microsoft Surface Pro 12in
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609145906.40854-1-harrison.vanderbyl@gmail.com>
 <20260609145906.40854-2-harrison.vanderbyl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609145906.40854-2-harrison.vanderbyl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uUkA1UR03ehpFsG824UaZcfedppMzR9J
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a3280d0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NJ6gOXVS0vVz-tHME-0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: uUkA1UR03ehpFsG824UaZcfedppMzR9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfXwznhywx59+1/
 yDQbRE+R3SzM5dVfDZJPZzFHY0BF2hN5hs2yBTIL9M6kYjMYs0hMzce/V9IbXrC4aFQkRD/W4eZ
 7jUcU0fqDwf93iTy05t6Ssd4qqPnL/jHHIdNd6aX4z01sBMVEoocJgJQFZPu5cyiIQsuM9PlPCH
 sF3Wk6YQ+k54ejq3zesKWm5F7jFE+6q4gyZblDO/8bd49Ryg5agkeNsqCg8+RoB8nrJ6vL68ZOx
 bnlhXjG78/14KP0wHr5Gw7504CDlqZRRKxDTcNU43eH5JeVvW9k+hJwXVmnDce8x2wwlT4xg3EF
 o2J4D/hteVhwkFr/oeno3DycPnX9iIesKUI3EWOHqfBUZq3ahlRWW2x0tslaKXGMfewRjuCmZm+
 ZS04ww4hzbsGPzhM+it3ms12Dml+CRGQO2LrTtn5WVmejecDJrFaq0rLaxJiB3o9tZ5wOHy1Xlm
 obOClR5EEeMwf106HYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfXyTOYRtPIwALr
 PKwTQPgUvujNtlly39XCKCQMdfy6MtiX5aNPI5pe87StDV/FkZ59xE7c4kZbb8ad4BlBUbRDN9M
 qYcgzXaf7j6t8lpKx4qKl+r2+lXn3SY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113619-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harrison.vanderbyl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:harrisonvanderbyl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87C9F6990B2

On 6/9/26 4:59 PM, Harrison Vanderbyl wrote:
> Initial device tree for Microsoft Surface Pro 12in
> 
> Currently supported:
>   - UFS
>   - Touchscreen
>   - Pen
>   - USB 3.2 x2 (DP Alt Mode)
>   - Audio
>   - Wifi
>   - Bluetooth
>   - CDSP
>   - ADSP
>   - GPU
> 
> Not currently supported:
>   - Accelerometer
>   - Front, Back and IR cameras
>   - IRIS video decoder
> 
> Tested on Surface_Pro_12in_1st_Ed_with_Snapdragon_2110
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

