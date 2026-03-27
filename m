Return-Path: <linux-arm-msm+bounces-100240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGjNGQdUxmkkIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:55:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D24073420E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5AE23085134
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3C53D8904;
	Fri, 27 Mar 2026 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0B6Lc4W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVw0ZRuc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1CA39F168
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605151; cv=none; b=aaNmPBkb/up+j6m0+/yAjRWPedkSW11gRXH8y7P9yCgZU0lpePvXK0hj6cDuuTeSwR4AoJXA8pCC//Ci7SzLZlP7Yen1+PKG6v+1T8X+C4rfBaKrJP3oASdxyEt3piY3NoOkDa5bN0PbbIw6v4EzLabuTldYcUctskuJJZwbZ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605151; c=relaxed/simple;
	bh=hqhPthe6G+Il2/gcVS31IUAzLoRITu8+8efFljJuZPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flO0Dc/ncUL2Z4TOi5qTl+Mf9J6Q79/OPz/DMc68Bi5kppOAVhYWI7FMzYyypENiwvOB+RTx8SlJ/AM7iWQs4I0rr87Rif+BhsEeTleGUB6+8Mrv7+0QVX3zUobvbXng60phi0Fs8HkONHvDwLoMD2TcAEjmPlmtTk97IrOuGfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0B6Lc4W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVw0ZRuc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vfvN1749076
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eJqhLdSz2TFniyH6etXPWrvMGTOsIWzf1qZeyY1ybM=; b=j0B6Lc4WfuQBBEZD
	qRaJGq9TSJrmTrD4/toh4rRrWl6PF3EXokn9W7QZZvaaHWcTOWVGp5b+7u/jslLy
	Pc2QWN2uGAJ7MyzC16AxYMlphs9JaUivSIa8srPtP1GPxulnOa5w1ESQzjMAwGRX
	3ipoWWxIGIeZujWvKcYGBKRHlPSKqWvZlEyPAuG8M/A2NTTUeR0BhLgE6S5TkdKy
	AP3o8O/BAIkrqRshHW5hnujgMwqZfp3L5ZrDd+jx7saxkVvUxA0IGG9U59Qg8v3A
	A5nOektHAegTe1ceiyT9ZQ05G9n0PX7I8aLiOCv0XBGT6sFwrvlEbYaTEm9iNOqC
	6YtogA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn10sfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:52:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ccf10567dso8287986d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774605149; x=1775209949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4eJqhLdSz2TFniyH6etXPWrvMGTOsIWzf1qZeyY1ybM=;
        b=IVw0ZRucAE+tIE9xvfa1MtOpKQeRLUY4pJF0XV8ev6dnGs1B/L5SPhknG2ozE+vwe2
         uSkUu9y3QbJ5LYe3K2q25GuoypnltEb1RIHLJ3jfAucJmFU0akifdRKbVJPDdZ2e2lGs
         9sBNir4pQPoniIn4OjSZVv8AIekm5s+2kVbuRB4SQcTmiGFj5HOzLY3Kc2XXn3xL1vX8
         IGWM3Ljo/H5FvkoySWrx2xSA5OykfRd/SiUIBEpmnYDVMAicYls4GbJ0JE2RTbscMWPr
         ve5U4NefM9I8wGN8MMv0rKReqtUGUZMn9w1r/NYSqbNE/YMYTWOfkSEu827WyMJzUGbp
         EynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605149; x=1775209949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eJqhLdSz2TFniyH6etXPWrvMGTOsIWzf1qZeyY1ybM=;
        b=liuV23LoAxUZQHsr1Ea2ZidS7Xnn14NAOpL15zAJYy79cmmcWUjcm0j/V3vT7iUd6v
         g/s2xFmc5vJJ2qBYN636bmJtIPmZKP44sYmGL+fk/6i6XPv+V3pBmqEsK2tQ+fqbx6B7
         7u7Q+LfQsifZ+IcgAiSCE4I+MMu67YAk+TwWfNXSvz6gzd77L+JmIDpBVabAvYFmGrBV
         OtZp8pYOw0MMMdEebxX42ZwDOyCM2E0BZmYHjA0aZ0QCriBvasUfjj5ZbKG7K6xG9Bam
         BhATUyUKOTUYwaHeAv2o/raExP7iQ50jg0ucV5/l3gGhqHbqnfWM/QD9VDfqCJl8MtB3
         McZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfyMrIJ5tGWV8lvCau03YgHb+mG3IKZEAYceI2to7RXC7M/F48yi8OYIqVxJOjKx3vZshxJNc2mtiajUtM@vger.kernel.org
X-Gm-Message-State: AOJu0YySEPFThkbK1ylDCD1Qyvu01wMUrVbtJoKeKUilDrFp6bVUV3w1
	2KQ1/453pKCK2N0Q2/NRePB93Rqcex+esCSNyZCjpc6kqUlrCW2wKcrz4ayQB5vaigU2T9vyZCH
	jg9uw2UDWn/ol0UoNORz3kXT51b56sLK0ko85sASfsvPQ1fexDLVtbc2t5yb5GnewnW5L
X-Gm-Gg: ATEYQzxhHhrSq43e2MhWi2LVY+OQqx1xE8AXxXQ4zRrfkGB15GUyUpk6RoqzjuwtyDZ
	gyNoewCOqaPsdStBGahLZXvl9Y5BreWwa3TrBBtGg5Ip2ZEDq9KRqDT7wUVE4uf4iDq/LzGNazh
	TdFC4e/l0CXya00hfcOYkZoZEzp2yl+vdjfFA892LnziriQzdkIe0UuJ1yDKA8vTGG72yxgXLXD
	Kr6ceXwKuOJQ2c6YpwXpuZs/orPm92gEbIsOL6s4nzPiIttctK7Z3KQbOEqNAvG2yvrtpf0OXey
	n5ijiGaTniLqRUZyzfZQWF3wF4lUn6CMW0Rh3wCHk1QuJhrjtiU6jcATtVjpXkTKyDmoXTXR4hn
	+eqG+MFx17+o+5NTJCWbafZlwu8h+2HC7SZVjYpZonDTc03VFAr1Z0ypBYWW7mpDS1Ka5RqfAc1
	w+3U0=
X-Received: by 2002:ad4:5aa7:0:b0:89c:cc08:c56 with SMTP id 6a1803df08f44-89ce8dddebamr17218976d6.3.1774605148639;
        Fri, 27 Mar 2026 02:52:28 -0700 (PDT)
X-Received: by 2002:ad4:5aa7:0:b0:89c:cc08:c56 with SMTP id 6a1803df08f44-89ce8dddebamr17218726d6.3.1774605148096;
        Fri, 27 Mar 2026 02:52:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20267420sm224436366b.24.2026.03.27.02.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:52:27 -0700 (PDT)
Message-ID: <ac75a339-ca20-4264-9295-d7290e218bc5@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:52:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali
 SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
 <20260326-knp-soccp-dt-v1-1-a60c2ae36e9b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-knp-soccp-dt-v1-1-a60c2ae36e9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MiBTYWx0ZWRfX/vdsSGnT5T8v
 6XhXGQNdFhJ3vbzC6HAZ4Rl4fHD2klTytYwKYxt4TceOBUBtlZFQIXiXZ80vD8X+LQA6zdzWd5B
 PGtGxIW4k6ElgSPpUKZCbEml01R7YEoPfW8Ka/39hGacM8BbQRxbzj8ePDY4O83YALDd31Gx9NO
 rmUL9B1ljnHkwN0FX+0KPvyS+TL/wxpu9xY2Bq4Sw/laEmvyfsqJm3/bXFwMCtORo9eMWv6q9iR
 n02PUJDNrGU1JsiN8EryG8qWbImu1o7DpvSELoTRJaFW6D0HaVGVFOKkZZgfsbrVkalsFZluSx3
 BF+FtCVv0wz+sKfMtPKAuuwq+L6QMmQ0ale7BNt8p3MkMFCpKH2m3CqFsRt/UKn8fOP2AQIV37h
 QoyEW2tT3ZSQ8GiivcpoiRYY+wsWkjKKaf/OGrYq/X06Nivf8NW+CHgXfuAKi2lP+oDhGbZQjJj
 8h/SFYCt5A0Gsl1Qi3g==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6535d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=hrcmu3upo-d0Drj8khsA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 1BrwSAakATkuG_EJKfn1r165_FHlxEFt
X-Proofpoint-GUID: 1BrwSAakATkuG_EJKfn1r165_FHlxEFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100240-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,d00000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D24073420E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 4:20 AM, Jingyi Wang wrote:
> Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it
> is brought up by bootloader, so set the status "okay".

Simply remove it, "okay" is the default if the property is absent

[...]

> +		remoteproc_soccp: remoteproc-soccp@d00000 {

-> remoteproc@

Konrad

