Return-Path: <linux-arm-msm+bounces-91654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJtzA2bOgWl1JwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:31:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D9D7ACC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66B3930A28C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 10:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98407318EC0;
	Tue,  3 Feb 2026 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0XmhYZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvqPrB7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B071314D3C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 10:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114401; cv=none; b=kpTcAc2jGHFDQHTxf9Nm0FxF7dFf68YeF9E7pC0LG7svMFMCtU9mxsNG8DOSWUPMXBifx3WCI/FjYo+OqhsDBE+dTm8z/B5iEMn4OCegwiZrfxHt0AU9AHhn8oTeQg21cPxnviA21zQmncF6Bnh4mdKSk1oJwIJ4mXUgNUhKmHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114401; c=relaxed/simple;
	bh=16/GwJbSkE5/JP2RAIxk8Yz050uUv1ntm4e5GtYsgUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnwmYuzeQiaR6ffNyBgpk+0IwlxETOCYyAXcCfBFbjlfWvqX2/EVI6nc4FG249qrCFj5LgBZlDL5OWb0QFVSOzKCKuTQms+rAsPxDOToEffrKDp3bZ9/C9V3+Oul4/ao9uTGyJ+LhuP9t+W1iwtwvvWG5kA10QNGiQMatjEPfUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0XmhYZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvqPrB7W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137PO9p1322365
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 10:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOypfIEDDwh9J504h/zGHB9o7DyYTIn/LffTBkpBEtc=; b=U0XmhYZj3nbf9OSN
	W79UFKkL84xJCjYSMhMJDc3gJrp9FDSnLcIbl7u8XsJlFeK7gkY971tifCZctRKs
	FQJF9+QgPpFfTVqWLRJpGD9uNU4+FTGrGx4foE2DeguRQMw3/We2B67MYVj/KNOB
	0pZ+ZLvniCy6/8F5lALer0ZZcZJD4bQ0gIZYS/SkQpzbjZzNnfKA+qDCykATFyR4
	cXNQaoPNjlh/PXATH5Ns3CLyDTQAawlysr7jU0Ein3jNVVcglyQj4gasVk7mhUXB
	pWMAWfrXowWwo/THv5thRNK+sdYFQMnKkOTwj55qtfV6nl2sMmslhA9JTmXT6Bf6
	1IoWwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3cm70ju7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 10:26:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso127603885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 02:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770114398; x=1770719198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOypfIEDDwh9J504h/zGHB9o7DyYTIn/LffTBkpBEtc=;
        b=kvqPrB7Ww3Ke+vb+xC4i/T9ncwulZR3uyn66xyDGKOv4N6Y7At4Xp/Y1tXUJ2CwC89
         d98Y7YTMZOLdTbt+dja7lRbQEjvP3ENJ3NU3aIidPt2tuWRvQ0gtQke9u4G6zzyw2kW4
         o8k70xjzbh6s18c+7CTBT6RTk8qmATndUVYiiy+TLd6iWjMhMeCxbPfsZEj6cw13CfvK
         xbOjsOcl0HCQdWmMog7z656k6HJrecq/491XuHB534uHD0N4YhLTSWfs560eMEI41wPd
         Bl3f55KKT+MDaSDX0DRhcuqSMVU/GkAvycbL/ah4VVHmrtH2JuI2u1nKCxhlY2WdQDIe
         0K9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114398; x=1770719198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOypfIEDDwh9J504h/zGHB9o7DyYTIn/LffTBkpBEtc=;
        b=vAbMNyGzs5POZWOPs+U/9uQbWEK3k+fkT284dLLdGtjBg93ufXma5hKYG1Veu/+Po4
         zAAnpulBPidRqx/56zvw8uTtvPRC2AUJRtQ4h1M+Unrh4qqSu0ZXigVyzq5KD4BpKHmo
         b2RVZZJ7IRLJBJhfh2u4pUlQzgDqIVZh1Crwr2rhmVybNNgdtKZ94lrw9p4QUBkQ7hvm
         N6wRE08MgowAVuzbl1n2wCumrQkLsaE3PhJduVK3FcqvYALgEMu27adZ7vsWSmoGTgIc
         bS/Bh1Ywn60vkxtJa/72pCwMfzMSkDByoqot/aQxW31qjDaR3p4nZhwSJrqNKEUpLBDN
         5M6A==
X-Gm-Message-State: AOJu0YxY5eqBDj4VcdE/SePo06uZBvOaDwfB6Wf9iPqzuLVwE8LXJgVi
	4zBMj1Z/ehP4YwezK/DlgyP+p8axfpMJnhBSOiWWeznuWJZC3sXe6jifBNQDo/Br3xCCfaWvKTX
	YtejUV2gRS9Irynn7YAyiMU5rNlwkh0g6JECZzOmwJgJEKoXyJob4HAn9a5PKcnWfaPr6
X-Gm-Gg: AZuq6aJKqYX+hLICHtTGht6NsGH32y/pSS1oKKThD00mZ/ntOR3q0rUfUgec4QIAshn
	nu9856u8BZiWUBJHTikqK6L7NoDs+gIa6oA7rCjGBFYiZ56c6qAgzgqSq/J3hegp4fnlaFNKHGP
	NSVbBhR53bIEzQ+b424SH/5ROru1Wj+0APb5nLnTLIUBpa7E52kg1NP780Tx4YwQk0sxwtMO2Gh
	CFWJFQ47I1lN6Jbtx9+uDHQceU7/58qCb+v3FazodTRmZ2mOOKC/jXl+htG56u6j0NGRUdt8wm9
	YUE+BkEEAKsBHmaLMMVubG7JoEFzxtP8xiFsK8h6uDtw+RC1xQKZ7CCILA3YDILuzvxqZWBlHY6
	02UqVpmCT9J0igqdghbIyqLiif2ppm2zW11uBPSEwlN4Xt+o0T8v5sv9jVu49F5HmIxs=
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1413241385a.6.1770114398667;
        Tue, 03 Feb 2026 02:26:38 -0800 (PST)
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1413239285a.6.1770114398286;
        Tue, 03 Feb 2026 02:26:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm989184666b.31.2026.02.03.02.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:26:37 -0800 (PST)
Message-ID: <6fdee2f6-aeb7-4a41-83f3-57a3e458d0af@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:26:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
 <20260107-mss-v4-3-9f4780345b6f@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-mss-v4-3-9f4780345b6f@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MyBTYWx0ZWRfX5qKe4gmO45bU
 Jo87+jsCII6CXnBm5UuUZxL5j6vhPiFo1NDTwuWLAjVwlnyzrmXlBLVoH6LPvwSwOZBgrpmJMRT
 Z9x4z8MmWXkCgykjbzmKlNx1WSG5Xv9EcIj5Pz7mZP/ou7OLAvLxwFGkjP8HAx1JOGa9Ozix093
 VyksM9nLqeSLpUFRPHqxuxY2FmMQioNxoXxdw3BT2LpPBvH+RStPfhsiNt5OSdp+pu6FduV26Ou
 QDAAgO8hBqtJyCtTN4phF6lNAZgDcZFENwXIhRpLu1YbO2JfWbzfBREbum9P+P2WRMz5LdRQPJE
 gQzoL1kcd5fR1eZJAksxdgdGBRgeReUIKFxxqzImlldeXC714Yk7RP262R1Ijh3IDG7mQMfPMn1
 FZv07p8OU9mg7TUcd9UucUgGa9bIUN9AQ8qIv5E9TFjP5OEz7mqHERN2O6U1TLfVFxXe1397/H+
 /HgeoCOPAukUmUxuu5w==
X-Proofpoint-ORIG-GUID: BogldUNzj8xbseI_TU20SOuGH0JOpMyI
X-Authority-Analysis: v=2.4 cv=L4sQguT8 c=1 sm=1 tr=0 ts=6981cd5f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=j8Cu_9a8AAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=Zc5E96dWW4SpJKk7na8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=A2jcf3dkIZPIRbEE90CI:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: BogldUNzj8xbseI_TU20SOuGH0JOpMyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.12 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.54)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,mainlining.org:email,qualcomm.com:email,qualcomm.com:dkim,gerhold.net:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91654-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 655D9D7ACC
X-Rspamd-Action: no action

On 1/7/26 12:34 PM, Barnabás Czémán wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add support for MDM9607 MSS it have different ACC settings
> and it needs mitigation for inrush current issue.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [Reword the commit, add necessary flags, rework inrush current mitigation]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

