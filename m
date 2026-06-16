Return-Path: <linux-arm-msm+bounces-113392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kb98EP05MWrOeQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:56:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F13E168F021
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:56:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Sbwks8Lx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jhI2EZ+T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113392-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113392-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 542D630A624E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AA343C074;
	Tue, 16 Jun 2026 11:52:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EFC43C05D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:52:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610757; cv=none; b=DvFpXsTii6dWHDYsL9+tKEVL7moZBNks2UZ9OUePzTu2O0p6jO6xSa056kjmabIIBVRt3Tv0nQ7/9vnjvMLDUrJV6OBHmdoDTP9eMi5RMvqBsRlTsswjmVcOfVM6pMf7W5w+4vw5KzaX1zK2Q7tGF2xjJt2V4w5/WghggkZ2Ly4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610757; c=relaxed/simple;
	bh=IQKIBUWJRljbzFuRZD5swT7UNFw7zs05w6Zor98regM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjleOUw7684NnS6rBAEsQ9mHLb8/BLqA5BYxtjuGZ3/pfUsP1/znBz7DMdLQoF+gRvWIynYss6iBpp8y90wRRjn52Dbyi2Zx2Ex31LFN6T4LzwKSvF9uxyTiJVblkT1zbW8MKtK050Qf0aXhTTphuuFivQslWt/vCX1TggK4Kv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sbwks8Lx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jhI2EZ+T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9Gf8248271
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZQPWjj7slAqgoZN9nlRgXxKY7urHNPS7OlUM/w31FM=; b=Sbwks8LxAPsLwcU/
	ur697lpgyRLak84Bd9T3zTc2Qj/W1qcUyEU0M3WqP2SvcjQcvUyiq29571Tn9kwe
	cuWUKg7hAby5j3Ms3IJgu3ZCXJ3zu+EW6RxKIMtVdpqvHsieQzS6sehjYgq56N0h
	rwQB4fTgaxcqn9R4lysGh42Ll5CPscbr7pvLZbFbojjH2SIXNGLIai9KJyu3pnL9
	n+ROH3FB5PooXV0SS1Hp1x8f9O78EOn3nmmfVazJyBZ2LkydY8phmuQtFMwZJjTt
	Ff+uyHcMMtT9gR5OXGdb853PY5AZLlj2JXx1sfYyLjBxHxFzVGoNxmOiDtQF6TV8
	YujduA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs8us7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:52:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccee12a34dso10198516d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610753; x=1782215553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZQPWjj7slAqgoZN9nlRgXxKY7urHNPS7OlUM/w31FM=;
        b=jhI2EZ+TullhXnmmI/JSQN/spGk/BOjo4y6YsbVxR5YOVQ1Tp2rpj4fBbZqqITgUg7
         K8qtnV0d+1vTE2Som4OSX33L3pPQ+6W5VY7imKJIa2iO8SPQRXq+AhT8aC3+O2NZyhbc
         Ve64FkwCBIiJIcb12aBXVq3Y72c8bikxVmmCYrYs3tSo8wT8vZpo9lx6mcTn3wZyQLYs
         /GZHQNYXC/574kIGW67+j/BIR8ct85/zHYOalrIJ5upmV/T+15mcEt5Dln1Pqkeer1Pt
         Jgjkf8QrJ3SKmurUnmS18FlB8aHdoFzbmh+K653zGDcj3NTTzREAHU4HY0K5Og598x3k
         x7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610753; x=1782215553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZQPWjj7slAqgoZN9nlRgXxKY7urHNPS7OlUM/w31FM=;
        b=q40CR9pk9EvnjqikNJ9CwA3dKBYvmz7zmhFyZ235SotZCI9F1/ppCYTqZUveVPAiwZ
         k3Nynr8yJoLNYIX9YmE6UY+GwJJV77DnwjPi4GK5sjNgK2ma4l8f27mfPKdEByrKfR+l
         RdNOsEr1wFgo9+Trj28ZbTghgUlqjULB9OV6jbhMr9nQrf7wUzgqDw9fRSVdo8/rVcux
         IesJBkijnIVWRtx/5bWbVckw+kCctwlCCtV6mxY1R1+r9d0r+6ncGAsP/utYNVTrkavT
         yG0oLMX3lXIVsipuou8Ei7z0nypYAV8iRfxUElz7bHlaO/mmarLXiqcGqxCjBXVir/Qk
         K+Pg==
X-Forwarded-Encrypted: i=1; AFNElJ8YiSKY68OtKgYO4iNv2+D91gEj0e6rmkxfcbwBPizrc2pz1HMACJ4G/oURx2CLYaoaX0NlOz9wAW6Zp4EC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cs7KwMQh3fMUXyNyXSlG+TnRn3O21FuoBsCZ1yngSOBqfpKW
	x6vlwO0UCZR2v2STEEOHyShCKshWuTjGrQz2pZEFVgU2O4rGQS2rhLAFYl38L1k2763UdoXqds8
	YBJUfeByvURacImoEE02NgGpIJ2gvwYKW59UqgkZj43rKmRXduOTplAvZUa4AYkwYpgUv
X-Gm-Gg: Acq92OFUi2lQVRlLA1nlIjh+BfYafTnsipJ+nGYSOyVP1WkW46Jr8VK9pOpacmKu887
	QYKDOX0xTaCTW+Cr9+70VDDFozYy8mpO8TnOKMe5bELOnJKtmUTgeFxIft+HrOV/9j8gcflBon/
	hOUFlmxboCVq4oQ1Tdo+FUJ0V1cijZCvf/op6ZWYM77AbBOj3VxWT3IYwOh3E57ViMcxU480fOQ
	OozClHfnv+nTpyprPcE0eLqwjmdg7h/a8KrMEMmQqYvQJEDydHyoT5WYMrEsWWtP0zGYhhigqpU
	4au6n02uCySnUtXXAkdDm2leQc2DHSwCS/dPHp2UD3p6CbeNB7azU2hmC6oCdtIaXT/hhqUa3FH
	RsPltpPedUQJuH8KSs3jNx+Hk7T23aHIMjgM1o8C7uxreiw==
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1644856585a.0.1781610753648;
        Tue, 16 Jun 2026 04:52:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1644851085a.0.1781610753209;
        Tue, 16 Jun 2026 04:52:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm627583166b.27.2026.06.16.04.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:52:32 -0700 (PDT)
Message-ID: <1e6eac45-bf28-4ffd-81ec-b3a2a24ecaf0@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
 <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
 <73a30753-527b-4662-ba99-2ebc3878861b@oss.qualcomm.com>
 <ijevonu6ib5daesvvzis53qh5ztufrdlqdsfmx33kiajplqwhm@muhxbznlx5k4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ijevonu6ib5daesvvzis53qh5ztufrdlqdsfmx33kiajplqwhm@muhxbznlx5k4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aVc6-2H_CTjylZdmPUS7q1GlwvmkAGqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX78h+iLceVBh9
 FNaQ9bsFCNypalngrsb7hbeQyj/UCPLDKa4D6Su7RFn6zIBWEoSSq3adDH7pCaRX0DFVGlT2lj4
 0wIeLmQPagj1x4Tax6OwXTuSZsyKXjfRamhDjS5HIwgEUwMdbuqQvUu+8ydF2D6dtzsAXgLgGPO
 1T3hA5gSoU9msTjVvYbndm0kXUvsJdISR19uN08HqP/dZ+Q+Rf/mE6G7Bl+YBYIKiIoheAcYnpv
 92znGkP5Tq7fLJ/qd/ttEPCuo0AVZxFGcT+S+WWWGrZcqYXdEKlT61TiKLJ0UVXvmB9/4jvrSoX
 wpUzAFl0H0enUTW1cEolQLSUGO/AMZ1tONbjMboyFKkzCwnWVbKRMyTAzM3r/GeX+DEPZQTPwST
 +GAXdmH5de4ZgbqU9EL6J5YRiBXFHPn2FNaLAwwGrCtN27xl/MlQzZ4pbkktgE4xRWha88iZUET
 s3wSSA2wyy4P97Z5CwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX0Us0EJ8V2mLG
 LU4aZ6zSTc5xb7jrGMit6VSm/FMsoO8LcURGmUw9fLX09YenZ2jEQ88AqjM+bj5P1aJqa2JwlBe
 Z9GmeIwuFGlU0GEDUu8WmH01d4KT5pQ=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a313902 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-aIog7HT_t0rU9SwYjUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: aVc6-2H_CTjylZdmPUS7q1GlwvmkAGqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113392-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F13E168F021

On 6/12/26 9:55 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 03:52:09PM +0200, Konrad Dybcio wrote:
>> On 6/10/26 3:34 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jun 10, 2026 at 02:24:24PM +0200, Konrad Dybcio wrote:
>>>> On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
>>>>> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
>>>>> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
>>>>> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
>>>>> MMCX voltage levels.
>>>>>
>>>>> Add MMCX domain to the Iris device node.
>>>>>
>>>>> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
>>>>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>  				opp-720000000 {
>>>>>  					opp-hz = /bits/ 64 <720000000>;
>>>>> -					required-opps = <&rpmhpd_opp_low_svs>;
>>>>> +					required-opps = <&rpmhpd_opp_svs>,
>>>>> +							<&rpmhpd_opp_low_svs>;
>>>>
>>>> So the computer tells me low_svs would be enough for PLL0 to generate 720MHz
>>>>
>>>> Is there some transient dependency that bumps this to svs?
>>>>
>>>> Your changelog mentions you altered this in v6, but I don't see any related
>>>> discussion
>>>
>>> There are two sources of information. The "clocks plan" and the "pll
>>> info". For some reason, the clock plan doesn't reflect actual PLL
>>> requirements. See the info on the corresponding PLL type.
>>
>> OK thanks, now I think I asked this already in the past..
>>
>> still, both point to LOWSVS @ 720 for sm8250
> 
> Not really, PLL type points to 615. I've posted you the screenshots
> privately (sorry).

Alright then

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

