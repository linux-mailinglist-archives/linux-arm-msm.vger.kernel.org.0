Return-Path: <linux-arm-msm+bounces-115434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8mCINe3AQ2qeggoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:13:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4236E4AD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:13:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CSUaqot4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g4lyBcqP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115434-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115434-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF4BE311FE41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AE3426EB7;
	Tue, 30 Jun 2026 12:57:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0FF40E8FD
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:57:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824247; cv=none; b=bk4FLakZKR33cIsnm5MECJyXccQzL5XQYg7+FpPKR72xkSou4orhQxgbGveyPDZNSbUhYJ/DJr6oloP2IbRKUZnPJ4tkgvrOIaY4rD74nNNLdK8EMY6s2PQ+eCZzSAYrMtUirc3nEE4o0hWi/h1AezkbAlp+iq6j7qJb6jct0fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824247; c=relaxed/simple;
	bh=pnI7R/xMMC8JZIFxsJK7PSD3LbRqlyz8dhLEqn7HV3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZKWWi2smgBjJP/6xsQijkmLnr0JnIl1sSMWl7V89ZDw4n0nJM8BkjUNyoRfrHdfKEzYQ6M7qRfMgGsLP8GfloAH/unRBAoNOFbnOKfgIRNPU/GGCIQ3lfHCa8kugV/48VCHdMqKHG29KpYsrv6Kgko0EoNqJVuiDZlmwXTZe8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSUaqot4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4lyBcqP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n3AA1605245
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJO2RpNQ8kCH+24erJ/udW/2aUgTpJLDMSalLdUaCtM=; b=CSUaqot4rG1+Qoag
	7JeUKJQkjG7CPWAKZWG1C9Z94uUK7BnJspSqdX86AAseWfYyfguPZmTeDzRPDf/f
	QiqjtkGUp/SegO06vuybmvUgLLOcQ5Bhb7xo7Ztx6Yt9FsN05nXMqCzoK9KRH7qa
	W2z4m+LNWg95lLzHlnKvPQSzF/FU2EpJUOGGpH0OlUYA7UP/y0R3TrUxSTCXFMjc
	N8reu2WPv9hd9QIms9NUcQJg4+A2/XGyYAKR+2xlR/MOMCeI3yUU38kuAiAVcF7C
	LZ/R9t+LP25C9VrCsRfiVG4a6jwTfzgpsMpoC71HNNnJYRaVexHGYnhHbiw9pOQ3
	+uQprg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfjrbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:57:25 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd88c79dccso121039e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824244; x=1783429044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJO2RpNQ8kCH+24erJ/udW/2aUgTpJLDMSalLdUaCtM=;
        b=g4lyBcqPXkHuLVrkMUrh3X1wytvjtp4mloUk/kJ8Ni2J7bLk+J48e6ywuDyE0dsb6b
         woj7tvc1xLUb6g+YEtHbT3vRfbAyGlIFTyXPsi1ZpSUmWZQDtUb5MsbzzMJ1E4BSURlh
         mBMh7q4Wj0QlBG7R9j+YrngEva6DWXCbstx35LeVgPbt4ZItS/IjklynsjykgyGHqbJO
         Pil0RWLXO248JQy7/5qzqOs5eBqcgPooYH/0qJag1UNU8fuOP/TMN3Mrq5d/OIQ0THKZ
         rmCVNNZB7dm5yrIAQ71RXbjRDXEcyhpQsDI20Q/5LLQA/T06NcJP7+khF6VXVFczoEXs
         vYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824244; x=1783429044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJO2RpNQ8kCH+24erJ/udW/2aUgTpJLDMSalLdUaCtM=;
        b=Po+8cmLOvaDunw0i4ttxwoSGRRdJ8NB6lgeoyZfplei40UZVFjaJ44rxXj51LJL+xz
         m22SX+nTXaml+6XDCKxZCMZmRjwQW7Q1cnzd08Wdmo2lcSQUs1Nuyoqc0A0x/YGuJ3xB
         JMmpdCmBCO2AHZTPIHDTzgLsnRLkAsDCBL7yqr4rQOZnNixITAMY14uF0DjYW0xqFQgL
         j+RChbzqne/UFdPFgzrg1e5F0M7jPMoy367S5uwfPq25FnD9t+2y5zjOpG2PJmzkJUk6
         GwXuZIdBoSCvaGAx5fQlYSEPpDX/ryi8T9vaQd1968xMblvcVv1hI5IBZnEkIAbagcQv
         7mzA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5UZhWxNNZ+60xWP5AqGTWM/KTNnE/xX4isJB4l3mDma7CwyrdDw9j3o8gKBRC1RLQT/u70cR15IHdYhsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyN4XG5U9GJzm9IXGoLO5h8gQuirhc29walWIzYjxdgQ+NRDBbm
	t35wvlGch2HQSa5KdTSDoC+ijXpcr9xN02QebMZ2riXlv0i46jIVfwOKMkx5JO3rRJKAu1Uw95T
	4tz2Hc8krApaMRiwuKhFL6/jEiz2SJg+4WHvc45jN3RchIa6KVeLkUX0gZrelLVZ3pSjl
X-Gm-Gg: AfdE7ckBZy2DafSYObQML1z4Vw6kBPsRbg0W1XWkwHL0OJaZ0w2iHQxEULL3dpRrKVt
	TATBmkiQL1f9BL7Yce/z6cQ8wu6Nslscz1gn3EEc68J+l1v4HoPaZuBz/mtrv9u96V1gjZnXx+y
	jEnHMvp8L8MtsDlhWTTrlEbq88XuMf6X9JfuvIb0uWzJyZUfx6QRfFEWt/24Hj1sA+HD0xKRTYZ
	4gzSxE8FEHRFIazvLq4E3YK2NklV0PzHtBD1VUkpZYsxWRMbYFiZielsQ9OYiPR+2MwJ5xPj+dM
	PcrHlJ6GbbVXVXXjSLnLCad8B/F6VRJCeZvRQf0HShH9ut/Dbgk16N9xCVnWSrWjrptL5KS/kW+
	wK/DuxUBqkaQy2cO9ylV2Vc3c4IcYuA1SeB8=
X-Received: by 2002:ac5:c814:0:b0:5bd:9b95:d637 with SMTP id 71dfb90a1353d-5bdbedcf783mr411345e0c.3.1782824243749;
        Tue, 30 Jun 2026 05:57:23 -0700 (PDT)
X-Received: by 2002:ac5:c814:0:b0:5bd:9b95:d637 with SMTP id 71dfb90a1353d-5bdbedcf783mr411329e0c.3.1782824243293;
        Tue, 30 Jun 2026 05:57:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3a3ec9sm1170596a12.1.2026.06.30.05.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:57:22 -0700 (PDT)
Message-ID: <bb33d83a-58d2-4156-a7f2-96ab1a7ccd55@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:57:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] arm64: dts: qcom: agatti: Assigned clock rate
 for CAMSS AXI
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-14-bb1055274603@oss.qualcomm.com>
 <ae5d0817-5187-41df-89c5-0acded391fb4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ae5d0817-5187-41df-89c5-0acded391fb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WXxv4aYKkpZsrXhBRLIDVJOMhFAq9yi5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX+bLzGoRuWAVV
 K4unKy5R7UfSYsdBo2IDesx/Lgps3CquWTFGbax5udeVxa6SK3dpNfN0lF1YAuXCPiMx9UW9llJ
 fA1LIrPlIfYvM11Sk39mKPLhrWUYqgGNjPKF89TXIDAvlH+eU/8UOqpx+nlN1L6uxlN7r6be6MB
 IucFTMlykFd//5D/FFfJDBupNY2quIDhoJyitu3ITVdUiwYYpRQEKzQP/TgJjI3Gft+40GpYfVm
 UAy1KyawQlARa0cjI4bJYKNJmSz7RXAi/CBQWUPUMHcI58r5Ual+W3rjRvJfTxraDRLZbY5DTW+
 xzIiqsx72aQELGEMU54uwIQfuNvRe/eKKTRTE7yXAbn56eMDlkntBBRXLaSxV8kntdHY7Z6glwC
 5A4m05i8BpaPoBSSnAC6Q1AjXrOFwIXDqBB/4n1iESDag3KYR5N+mhR/qHyXcnsqlB13X0A0qWq
 MK48uUi8CINzWGwobGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX/3WKLcp5LNhq
 vSqzCfDxQs2YUdj8gQ+pts9Zclt2Oi3dS7FmNiip55gBMe9t/FJ55jHlYgefwIzIWF5t0YHsvi3
 n53Rqoh9wFhxu3jDgF5bkKd91B0SL+I=
X-Proofpoint-GUID: WXxv4aYKkpZsrXhBRLIDVJOMhFAq9yi5
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43bd35 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=jiSQzDTAzoC-fvH6LVUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115434-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:johannes.goede@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA4236E4AD9

On 6/30/26 2:56 PM, Konrad Dybcio wrote:
> On 5/8/26 12:49 AM, Loic Poulain wrote:
>> On Agatti, the CAMSS AXI clock is not managed by the interconnect
>> and defaults to its lowest rate (19.2 MHz), which is insufficient
>> and leads to throttling of CAMSS-related traffic.
>>
>> Set the CAMSS AXI clock to a suitable operating point by assigning
>> it to its nominal frequency (300 MHz) as defined by the specification.
>> This ensures correct and stable operation while leaving room for
>> future dynamic scaling support in the driver.
> 
> Now that I think about it, since the clock is already consumed by
> the driver, can we just put a set_rate in there?
> 
> This will avoid introducing a point in time where the DT has a
> suboptimal (power-wise) floor mandated regardless of what the driver
> does

What I just said does not quite match reality

The ultimate solution is going to involve some aggregation and then
a set_rate. We can just hardcode the set_rate today instead, I think

Konrad

