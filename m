Return-Path: <linux-arm-msm+bounces-106394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIriB22T/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:28:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 753934E93EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D80A3003638
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BD636998F;
	Thu,  7 May 2026 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3CWqQhr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YS2gq9cK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303243939C8
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160243; cv=none; b=URDgu5YO7LiFbWHLSMXhaCBt9Dq7usEzyfUQLHZmAtHNO0rjVQiyCuqp6LWkeF774WZfaWX61ANrhcXUfZUulD2lZOLCnC4yULL9jCrGausFIXD5lADP1FA0M9gV+tZsABCooPfRVUIa9b9uXI7egB+HpS/cipYlXm0MeCXaUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160243; c=relaxed/simple;
	bh=0LvcMjoBI/iLO7V68fpoO4iG8nsPdfXEpftRhNV1pXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imolf6dAjozUG/rUHJO2v/WH0eR0aKKkg1V5lJeT5LofTVkyTg+6jy/KqjVWMwEv/FjVWRCFfSmGaIRqW1NGnGlCRpYIFiRQCEvIrWkG2ufoD3m7obN9WGCEdWBN0Podyg55PyIYonmiCQGBS2CM4Myf2PPuaYTKxbMIbN6sKpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3CWqQhr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YS2gq9cK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pT6a1424447
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjVkgLFZHJoObo1IoKJw5EE44WHc0a/C8ljj3j/Rprs=; b=N3CWqQhrtnDd3i18
	cPLRB7z15zvLTAZcslKYrQ9CTjOk49R/5P6uBnkImFcJNPgkMhStK/Ne7HCNjajP
	rHLjdDlNWIBgy6Tq8rCYsre6+J5Pa/rB705RJEDVjrhvJ+33Hc+6uuom1asT2AnA
	hgiA7G+MM9BqvoQeM2YiYPdD5qhhlhHKNd0yEpD9WY3+269cdRGYWPcNTKChkkT/
	AzDovWoWtWJDZdT2jNg6F53yGViFhwa2zrX+tEXZWyiRHYXTtNEcDQEjJ+qdnVBU
	kwJ/b+K71FsHaQtdQTP1EiYyT0Cxrq+tzZfl0xm54rl5AZcg/Nb7WN4Lhk/GwgaI
	sKKzUQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfs75j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:23:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so1819863a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778160238; x=1778765038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjVkgLFZHJoObo1IoKJw5EE44WHc0a/C8ljj3j/Rprs=;
        b=YS2gq9cKrr8rpgGKN/fFrv6pwKwDNfJ4Nx6Pwj9bQOJNPU99tBwp49hczP4yFpf7TA
         9f1j0IqNdJ59DtVPChF6CgHDa6bZ+K80dvPl/7IQRKq9R/7r16vRGE1lve0ckezT/7iY
         4pI58joKaQ7dSlvrezB+cL5qxgFB+QEIHnobhgCN9Hn0U2g0PrvzBV9MCUfPx5WC78qb
         YTc47Dzv7DDyyiPNBvXjy8msweqw6WXz6zXy1ZCF5MEqYp1PgqR6MSPltoPTeHhV5r0x
         4itgUZODo2ZxRg80R9+rGvNDEFA8SwvZ9h7zhzFSiVhVdcXIdUdXeQ/VsmXGSIU4Ztcw
         hEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160238; x=1778765038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjVkgLFZHJoObo1IoKJw5EE44WHc0a/C8ljj3j/Rprs=;
        b=S224is8k5Ezmv1kX4fqZZ+DTcSXMDSB4ZKrraMVG0rVMzES39sHK6eHDn2K5Y8VARh
         U0znpMDdxdsOesDjs3Cgu55TCt/lLAm/OeQLkjpAgIl3wktRzodjpzMabfprOB/1rFQE
         u9zZY1HzHP8piSEhrDpcc949H10aHsY6Sj4DSHbjMLsUuCKn3xbK2Y0v+vGIjhuzXRuq
         1GJgu13XW5Zqs0ZLRjoZlVGxwd+SLwC8cpaldBC0bUH5AWylspkxvdriY3NB2lbLAsyK
         Rw7X0ilVugMXCRYF73uYfq4uAoUI0UJijuBYgikYLSpaMJzgUQgaubdQ7lzXpTRg3/n0
         SLjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+w5SYc6E+wP03wZSx0JzJrRJDAfZZ4YHHBk4ZRghTw0+P0dzZGi8BkSSMh1MvwfO+OLkbwBUqe7oToMM06@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8hhDZEvcmHzwadIsVTzd0KTeZO/eeJoY+hqeqh6dK/U8GMvO1
	Y0vEMvQWRJOeuEZ268kY5Pwo5o8f7p+rpSV1B44SVOcbmCuvI5XbLy1N+3U9GmXByU8Zt94sYvO
	le9Q2PB/fQRRFJ79C5qMGLsTG35lBoaS1QKPkH7BVG7P1IEEavoJGTawgvvAnlfohNps3
X-Gm-Gg: AeBDiesW16epyRqcdiuHV5GcoVUtoi6kXqexhOm47Kv8TboUxS31WTugq1Lh799VEaP
	dbnL7GyvQallEuZmHAL7NgcS0YtEYA6hSG5mliLGS52ybK8K86vAiUgkDZLfy8y4uAJ+JwgLkzn
	nU+XuukJ8F0jfo2prTPSsjW9f6n5DI598+f2TR1KK6YkjxGUNAZPthDBqh3WQHHAiILkRIQ36jj
	E0GrFedT2m/AOm49iRqDHXiQoysv9juZRDaJ8QnqYRkEViCFqjEgqkokAhwfj/9Cm2Gs0CM0Mp5
	cPVe6yj/foO5Nlwk0isp0dSIOzKZSfHRspz5FDzre7XZXnVyGRrJi6/NXVutWHMEdns+vuvT84/
	HFwziHGfIY6lxEk0JpEk0c3OYjWW+5K+OaeLxPsrX3sAdwfTha+39vmPnGWT8bMGIzkg=
X-Received: by 2002:a17:90a:710:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-36615b96cf0mr1223285a91.6.1778160238405;
        Thu, 07 May 2026 06:23:58 -0700 (PDT)
X-Received: by 2002:a17:90a:710:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-36615b96cf0mr1223254a91.6.1778160237937;
        Thu, 07 May 2026 06:23:57 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b06bce16sm3213237a91.2.2026.05.07.06.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:23:56 -0700 (PDT)
Message-ID: <30472fb7-dd8f-49ad-9c5f-fd9a7dc9b393@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:53:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] media: iris: skip PIPE if it is not supported by
 the platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-8-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc926f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=9TuWGWrZIemhly9L:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=J-ePHVnydm4htHqtPd0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMyBTYWx0ZWRfX3lyuqgzfU+p3
 qBhsZKBtObZjyXfxNyFguUdIq3yKqeUqts9BcqB38IAGCOTTXmu10dlWG8rZGJqnPm+hDmz9lO4
 B0lL88bi8yDuweM2sTmfohupJflTw9VYaypgkdIHn33iAh8933O29yqal0bs/8JOzLPBSpn69Yo
 h/fONek+WL1n2JtpcT3oIHbmg9U0kEGlkBSA1fIWdVnw4Ix7oqAZnVh71C2EArYIBkX4Jn4dCCT
 XrkY0VTkA6gf/YJmwoPTTRFh1bAlyKurhOjUJRctQzZ3yx+Dltx1BkvexqUOKAqtREfB8DZtbgk
 bNQfx6ChUmMjtglkownwjWA6sYOkOwNCdxke5T2UceilvVS6ERo02CxaMSdd9i5k1lLsqhqyPtD
 nNRKlVh+erNOASzeTSqaqh3/Tl39NHwt6wSXrqY0AcW9wyY9tpeeOBvsuUIsU57JZJWVGcdvuqm
 wQ9kNFntSj73Cq7JK2w==
X-Proofpoint-GUID: 4GEOUnVkqtEgoe-q-vpDoURWGtQrkdR2
X-Proofpoint-ORIG-GUID: 4GEOUnVkqtEgoe-q-vpDoURWGtQrkdR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070133
X-Rspamd-Queue-Id: 753934E93EB
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
	TAGGED_FROM(0.00)[bounces-106394-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
> won't have corresponding entry in the capability tables. Let
> iris_set_pipe() silently skip propgramming the property if there is no
> corresponding capability.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

