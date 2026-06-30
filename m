Return-Path: <linux-arm-msm+bounces-115351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JmYJJACUQ2pwcgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:01:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1896E291D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:01:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fAdX0uey;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UJy2OeSR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115351-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115351-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C001D303E480
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D721392823;
	Tue, 30 Jun 2026 09:52:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F0C282F3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:52:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813162; cv=none; b=t2T9t7vflKxcMvY4088bPEEzk3etgi07LS98nyjSrtR31iRb3ih5GR24sJCLHqCzBw3FAccLQNiVadUUgNAWYHP+sBWTSNmEa3HrxYVR/NVIOUkRrh2OWSA10QDX4AchNIszE+BWYm/dinc0JxBSqhYPrWG+FFvzYtCiutzUdzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813162; c=relaxed/simple;
	bh=XHVFIYZdq7kDCqEYfKMHnS6JrUs1jlCfBepzpNlvLB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHEzzdaUT0hRmVzt+t1GAz/uuWrvOGZ28EjgAdX/Dda3zU4MyUJMuCmcgVv31A3hPXb0ZPniGjLmBSGhkHczi6QlBlKIMlOuCaLHUhThddBArhaFq2l7hT2GeAPCO6/zdqPXWngj9aGpNUxfwt8sdxV/GgSaiKs/gwbzh/fzyZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAdX0uey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJy2OeSR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nD5e1590648
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIHyDpjCFFNejxG5BaRizE1VIsC5hN9kk7je03IArLU=; b=fAdX0ueyfz13bzn2
	6yUJ3bg0/TouZE/4rHKQOVX2Ue+EOxMrSi4XgEC1Qy4+zKrjGIx7ZCts8OUIyc3E
	jR+fZbFLWAYzhxFQRoH8fW/kb4Ou1xFEaqQhXx7NHbZD1C4bCokGUTu3PUcY8KtQ
	AI7BFXAD2Ih0xxfAmWD0RuEUoFxtodj8bXnO7pWHIZO5kFAxTzqhgXLml2J52J7X
	yjJdPCD9aesd3moPDJxk7QAlWZrdNgeaCWFZKV15bBRDLv/5pf9I+QFzbMXe9tGl
	LPdKFqZcft94PafF+ZL45I0xhw4IJpMAfXLtAVqpcs8Rj5lZj0q+ohihB2+c1tHV
	U8o6sg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k2u11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 09:52:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so5787637a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 02:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782813159; x=1783417959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIHyDpjCFFNejxG5BaRizE1VIsC5hN9kk7je03IArLU=;
        b=UJy2OeSRRefYF5XXlUjN09KBQ0ZQ7e4W09Ij6EGfMoM0LAeQ7OzzNtRD3Jgef9ioza
         Q9xJ/e/8qKF2ngz8TddSAFCUG9h55MV/lbvSSe+9tyXD8zKd7IkD5czELgTlgYw7ymRB
         WuJKVFKt0wNGSaFZB9cQz9KmU1bxhzlfeIrWWcpDFuuJTPlyTd20JRv9x1EX0c7pWhHT
         yrl/xoHWwMxFU29Rb4qXBqzA8fbyo14vRZbvWjUCZg0Tr/sYoc5EcK39siECJv7yRmKH
         3gUQ4frJpv3T+9Rp9THpWuZtc/Nb6H9JFkNByPF57XE/yNjh29C4FbEYXP/ECGWzUpxi
         50eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782813159; x=1783417959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIHyDpjCFFNejxG5BaRizE1VIsC5hN9kk7je03IArLU=;
        b=DIIOuPXvYD1o8D4zEW2UmbA+8HNLdr+qKBig/gTtLmRjH9mdzZjpzNpWvBhruiBs8/
         rhSL738UP0tYWqk9kRTs0FynLSxjhgi9YaZT211WjpIhmJ6obFFM61Uen+OqhQlUutdj
         QPpijmN223u50yJqQaGhkM9wX2bra6u6BYzu4X1mHFGRgjmy/18YmLZljQu4XEl3iBzD
         cJO+KtR6Jw3P0Xs5fNsq47uKxcLRtKBCRrh+r+ZathADNQhzgU/IdbGFCaFK0IR8bm6h
         l06oOhdNI/yBEl3WJcioMkjZmoQYDkNc/r/8mAdJTALuoRInjlhRXHWUl0y9IASWPbgD
         5QCA==
X-Forwarded-Encrypted: i=1; AFNElJ9qmL8gWLfoigrNXpyD9CdsUBlunf/WaVzarSWodmHmawFPtCDjJbsYl8iR2sRwShKttgX1DViQUs+6EJXk@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhtxHTEapLK9OpNesK1Xdrw9VPF7Q3hARz1GagbcBv7dLrwFn
	UgIfn1dqsvPczml8PP/85vShgR5VYReIA+a1M3lZ/s7FTgnkS+47l+K5DW3o/ccmdvYg/s5FDKw
	cA7eiwdU2tSyUDQT3c7hbayQc2YSlJv7yBTRW+8c+jqqX4hUG065SfUvS+ASwtnrqkPDfCy+iZS
	HT
X-Gm-Gg: AfdE7cnU8pr2dtSnc54mIhNhxRPf5Jz4xBvXcKYT0fectMAO80rPGhMbIzhncXm1DUe
	LJEI/5RaiezFIzaNhQ6NGmJ6ZIyrbPn/cgx0YHFVreJ7L/jWQpE/Wp6jOenkspJJZEdNJm8YSsh
	6H98q+7F/ojBpHmjznzSR8rIFi5Tpc6vfs2kUhYtK8FCjTsTkDqCLJXdHzhzzXM8dVnAsbXdJkN
	G93QbmM6wautsNE8ZMdsiknstCMZYKId67pZFA9fPev/XNsc47xLm+M+242Tzk9K9vIAnhwigb7
	545lk5aasa0IhY9AvFnG4lMiQ5NMzdRGKkQyC+VdTC4VMQSizcAfkhs1dQyeRQ3Qjx/ymtlp44P
	IKr/ZHc6pF+LYaPjWwZsc36oSUf+PKO1UxVujI7c+pBMf
X-Received: by 2002:a05:6a20:914f:b0:3af:6704:18ca with SMTP id adf61e73a8af0-3bfc527279fmr2374623637.35.1782813159137;
        Tue, 30 Jun 2026 02:52:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:914f:b0:3af:6704:18ca with SMTP id adf61e73a8af0-3bfc527279fmr2374608637.35.1782813158642;
        Tue, 30 Jun 2026 02:52:38 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm1562456b3a.49.2026.06.30.02.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:52:38 -0700 (PDT)
Message-ID: <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:22:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
 <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4OCBTYWx0ZWRfX918otKAO3BbN
 hup4WOTgfAq2nrx5/kc8M65EwxXp3YaP7JMcwDefNmyhtgiM8/oPS44+pR/k2+lPqUzGIVKjgJB
 5/+7vDBbEpVVlcxgEQI+FVghrZi8oMo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4OCBTYWx0ZWRfXyTwN6MKgTdQR
 zSLD8b8D+CDUuecjGg7Fn2dVK0VLSgKVI3lx3GsSPcJXrKZqlKx0tTkdGLtGfAlqDtPac/hnMxM
 jVKRA2ZZxgMszVN3c1vLyDurutevIDKE/EVaX7bx8GgPfASE2lWylz8Hy7FKyBv0yqK44tPW9bw
 lmj+yEYO9YrbaNREG61zAyNYYSR7xPE6cg10T39b/WGlbcD8CDNv0NEVDKMll4Ucva1nEHU6KM6
 ZvOhUxMDupSsvT5yQr2IOJv7Ig6q8FYPbLifQOUOhoIc8CmFQYdSrYq15rcj2Gf9wqdrE8zyWa8
 1nqyF/HTVB3nyxI1j6dWeywXlVFSU8DQaLzRz54N08Gzccih+IjxcgNmTG3HxpZImJmiOAgwOR7
 qgKyH5mYEmJKY+m/SlZHfz7a2rKPa+XwhEaKXUhhbhO/KWJ00739MkPJYMx+Ex4aiF4zi4ex0zY
 wDPAKitB/Jo4duLD+XQ==
X-Proofpoint-ORIG-GUID: Vd3FajbXhd6bGwOQz9ZX-UHYIO4vwzh0
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a4391e8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=j4H7mO88qUtPRE6yNQoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Vd3FajbXhd6bGwOQz9ZX-UHYIO4vwzh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115351-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC1896E291D



On 6/29/2026 1:33 PM, Pengyu Luo wrote:
> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>
>> Hi Pengyu,
>>
>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>> also support GSI mode, which is highly preferred for certain
>>>> peripherals like SPI touchscreens to improve performance.
>>>>
>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>> the controller into GSI mode during initialization.
>> Why to force ? You can directly configure in GSI mode. Note there are
>> some configuration done prior to Linux bootup too.
> 
> Sorry, I don't get it. how? I know there may be a qupfw, but it is
> impossible for a normal user like me to generate one with GSI
> preferred.
> 
If firmware doesn't program in GSI, you can't have this working in GSI 
mode, its going to fail (and work with fallback). if it's programmed in 
GSI, anyway this will run in GSI mode. So why to add extra things 
without any usage ?

> Best wishes,
> Pengyu
> 
>>>
>>> Ideally, this should be decided by the SPI controller based on the
>>> requirements. Another option would be to prefer GSI for all transfers if
>>> it is available, ignoring the FIFO even if it is not disabled.
>>>
>> Yes, it should be decided in advance and configured accordingly for GSI
>> vs non GSI mode. Because there would be limited set of GSI pipes, which
>> will actually make must have GSI mode device run with FIFO mode.
>>
>> Why don't you decide prior and configure for GSI mode ? We don't need to
>> change the current logic of deciding FIFO vs GSI.
>>>>
>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>> ---
>>>>    drivers/spi/spi-geni-qcom.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>
>>


