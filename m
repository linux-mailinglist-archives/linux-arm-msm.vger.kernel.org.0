Return-Path: <linux-arm-msm+bounces-92194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAmzH7JWiWlQ7AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 04:38:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F85110B66C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 04:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 311BA3002F92
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 03:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0317729B8D0;
	Mon,  9 Feb 2026 03:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdqxhDr8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RdcuF0X9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5F9271A6D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 03:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770608296; cv=none; b=UGnRd1fPNY2hjzDivS20j9A/dfTVHSB3OJ60SQzBZrKfF6MSnk41U6xXnokUQWvckaUxwUBCNX6AO22Plmx86ebOMvkeWjibMpI+wq1sEQQy+A8gWZKSBxBRwzoPRmlXmdwNzaqlxnwfgs7O8dGS6WveCnYbHfSWzLbOtTfcKbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770608296; c=relaxed/simple;
	bh=ISb808vuzcpKPA3OwlRkFVzN0FTdHkQxWYYClwFGfqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/MRdlgdAQaLqYH19RfKk5p6sP9CkIyDOrfUGIqyFa/jqUwUMxdr8z2bTRrnpuK5+LpNzCMvy0ZnaYdEHP7xooWr0ubTS3WXK2dzdM1U0TRWovbFDTYocfTWgggB58mHfUFByIfYOQtscQnVPn3/bjd2hbXKyZk2/LSP+7vUQSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdqxhDr8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RdcuF0X9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618CRRm64193293
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 03:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7dkTSN+gf84Pwm7rvnKbFpbCB/IDANZ5nDGXN2AIpc=; b=OdqxhDr8i0wKDN49
	Ujf5sgKOsHRc2UoDcz31pQSYZwE+XPww7/3rhMKRrxHtQ0SxMn3IJB9Vlr5ic31J
	F45DRY4/wVgDCutsYQZS4CfmJQ1/LwIjXOFxa1rziz4WFa+RjE4J+vZuLZ04cLwt
	9f9XMpjoyLs0tAFZk61Tf+tZaFJHJmOgFBOA7zYWsHkcBElTLEJtMv6h7hUTBMl+
	8sxW7ELQrKeV87FkEeUzZZL16xLkXbmIn8hbwW+y8gCFW/xijIMdZj7JRuqjA1KD
	e9l0hTjBjU77nndgBjxzHWk4CpXWkp54akECd9XpjHYuJHCAbD26QCTHURexey0M
	xNslVA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4uh12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:38:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8243767ce2aso1323078b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 19:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770608295; x=1771213095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7dkTSN+gf84Pwm7rvnKbFpbCB/IDANZ5nDGXN2AIpc=;
        b=RdcuF0X95p01VRkhHtlqrbOMpotwto/LzwDDNnfUjf2Az9tj6Ft5h2m6UajAoXBQnD
         Ga5ROsO5DjZ/Q30saQERTa74PbMNqPCIoK1Y9wFuOlcZf34GwVyM8vuk4mHpZh0J9oAE
         Za3hYBOCefjIZrDstGBSq+7Fl6eZV+PUGN+zGQDK5G5U6t58qBCV4A8Q16k4WPmrhBkU
         S5VxmF2i4ZTO8OnKKipnnjqt47Rc0gaiVDNRyeLwP6LLKneuJhEk5QlTASDdO0WHmP0w
         d+oiF5u3Rl9I05FOJrnsEvBewLHFibPHlBWsBZv7lqqbkue2s82qBBlkR0fgrnsX960/
         dmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770608295; x=1771213095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7dkTSN+gf84Pwm7rvnKbFpbCB/IDANZ5nDGXN2AIpc=;
        b=JzHB1JwHqQzbwXJLlcNbS6y0VDd+kyZmJYUEfyQI99si+2fiuX64rCnH+MmbsGMkRQ
         J0tp0eBP3ve9lb1+9ctCSv0ZNvoQSCmQOLQ8+co2L3CiTp8aw5PQRoefkT0+p9kqcg/J
         2NoJC3sbIuC22N2blxEHT7NzKZgvU6OI0M9+IkfizCzdiNrogdnVkHgZMUeu/QJhHnSE
         FHSqsO9esPFQJzyT1P8hq2NBr+EgPW7vF+42RyVKQs5SY7SXlbsV6yDQPiylMhDhrLnf
         STBe+Jc8/ddDPOg43fXrHFM++QhTQytQ1L0zq2UyFlQXLgYQGRj9I5bO27hp5ksdGUii
         kMZw==
X-Forwarded-Encrypted: i=1; AJvYcCU+MVFdioeNEz+E9rXSWkniMnXxAWE/uT0vmqSmUs2Wi+KegZKMejbgajDPLf0QGT37cM8ToHH6vWuV5hgP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0vb4H9Rz64EvjR6l9bUHgzdonnMVpJf6vx2wXDCe/d4+E7Iqw
	EgAdMuvo/ArsXoopBX55yCRGgxNUwtBQgP0Id8XbQEPHfCa4ujTD0edT69aYNeuXeQww6W2HrwW
	j9R3zXABuL0Zq9Gb9wamKGM5gQId0E7GlWiUbJFdAJI8RxD78vtFMmo1hBDe4hPktne91
X-Gm-Gg: AZuq6aIFFu01TfLs23W2pHpdwQETSRWU7pyPPvrg6FPD3BcIQ9VkucH4t/Chvms0HJt
	6WRZZzsJ1m/yO1jDcEi2lR/MOL6yuIImRe0fyTu+2YR0wNTMjMLoe5X4eIc/cYQVuDS1VO5hDJI
	s3FaVGMQsUTQTrvRIJgtDWln2GXHK+51c4GBNFRDXa6WWUu5fGHSY9g61MjnvfBEgBfSV+7xS5J
	bGmiPcZlTlG7d5a+ElDq7gInIZyovyv/kY8GxeacaNo5rQrWuoS0bmz+GY0RU9fQqEsnLuy90D/
	gGduVdbNQ6tSMNrM5CoeHGO8ZyOsm+IXJBql1HwU1LoU+D6HnY9Do9YNcuFFnMIUsFUn0VAZs04
	64MmCaXr5AWr/rZpjB90kgmChLwNDFNgcg4IwJP4=
X-Received: by 2002:a05:6a00:2381:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-824416f4c61mr9061279b3a.33.1770608294351;
        Sun, 08 Feb 2026 19:38:14 -0800 (PST)
X-Received: by 2002:a05:6a00:2381:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-824416f4c61mr9061261b3a.33.1770608293898;
        Sun, 08 Feb 2026 19:38:13 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244166f269sm9609675b3a.7.2026.02.08.19.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 19:38:13 -0800 (PST)
Message-ID: <3970569d-99c3-4f1a-9282-829fbee0b117@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:08:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ
 errata flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260207-qcs615_gpio-v1-1-3b3923a3bdb9@oss.qualcomm.com>
 <k2t4jm6vqkrp46reo3nhr4e5awthm4gu2crow3hnl254p33ywo@pbbdhtdq5ag7>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <k2t4jm6vqkrp46reo3nhr4e5awthm4gu2crow3hnl254p33ywo@pbbdhtdq5ag7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OqRuVVbMHvICCjxhBSJPA7BP2uabfVkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAyOCBTYWx0ZWRfX3MyD62YHmH8m
 U4kafZRZ7Lf5pDgZnjyInowYdu8B5ZTjjAOQqRKs89TK07zl1TQIDwIfN1IWn9i/8uJOd6Tnag+
 WXV4OE2EoEq9ahyQGVhVK4h/uucsnSLJsiTLWMDyrqZ70I5ISw6RoJgbq/9uXK93JpIA0jzQ8hr
 05xLqWvO7diXAUmM/lNXFFt7n/nN9Ozi1NhigG6YGEyJH0o3gPJ2g5mYw6ygr3CHUJZ2hxuKUH0
 YaJZQ2546djY9FlQ8v8dJziJqbHDLj/B4VnVzKfXWFiCv2ZRV+FRTI2UnhElKQjU5XxnzYB3Bxo
 r4ReRdeze5BBRqvXOVwLV/wcak7x1yjxGc7j9MBcWwspkXodISAw9sfwxfBf/a4ui4NT9g17ILe
 /PnDxPTIwBuP8v2xwdo0Uv1JtMXLb534ts72jinuAXxoZp2DmBIZofUZNXBR+jkPj5EmdHsDZiF
 AT/hR/qle9oqdVGe5EQ==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=698956a7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=0TJnWh_ibtJh2gTiH58A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: OqRuVVbMHvICCjxhBSJPA7BP2uabfVkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090028
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92194-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F85110B66C
X-Rspamd-Action: no action



On 2/7/2026 2:39 PM, Dmitry Baryshkov wrote:
> On Sat, Feb 07, 2026 at 01:03:30PM +0530, Maulik Shah wrote:
>> Configuring GPIO IRQ as dual edge breaks as the wakeirq_dual_edge_errata is
>> not set. Add missing wakeirq_dual_edge_errata flag.
> 
> It breaks because HW doesn't support it, not because the flag is not
> set.
> 

Ack. I will update v2 to mention older HW did not support dual edge.

Thanks,
Maulik

