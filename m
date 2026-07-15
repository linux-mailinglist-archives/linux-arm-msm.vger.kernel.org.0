Return-Path: <linux-arm-msm+bounces-119124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id at1NLULZVmqzBwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:50:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C2759C2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:50:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UxM3n7GH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X0LhZ66c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119124-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119124-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1BF3300B8E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BC8233926;
	Wed, 15 Jul 2026 00:50:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E302773C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:49:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784076604; cv=none; b=Ze5Y2Cceq90/bQswcUFtvxuehanf4P3xWma9UAGFXxltkh1Bo1ZOwMqccsoRBzvaGJ7fm0/oLh9SXs8cdCM5oPg6TwwTzZTPVtJzUiGrKN93/SOndAEJc0a2iRqWztEEqVe2EFrXCvoxSj/HZba1Okuk0MFiR2v9hQgsM7zWD+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784076604; c=relaxed/simple;
	bh=Scxki0cCgtbTNftpXiXAzfdn3ER1auatpF60F0th5Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+KDJeE4tDChRzPoBJcMCB0HVlHUZEsX+lFK1gWaEWwqZ3xr55aUTUCNBglsfGjGsLkxaXXbpoKtGLXLLaxSWyc21Prw4SmhAeAdFnLtukXaRTFk0gpgbdOitwcIHHFAohPDdPizrR+lOJbpGCnObPAiiK85ur/dsSJ031mwurA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxM3n7GH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X0LhZ66c; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IVkJ1954807
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUGR1Dey91RMv6/UrlIf+RTVS0A3peDLMNZcwXJR00o=; b=UxM3n7GHhTu9Z4EV
	DUFuDd7MSIHmG2bG5x2S6YD+v/a9tM2U4acC12QxZ7kmjWhrpIBCQukUFJDwEeAe
	67iqBvmEbKl74UqYpxohEC5VH5v3EdgYK/GBvmkZIvf6WF2pmDTuc5tyK/kUGo7V
	wdwB17KSKIZ2eI9L4z90BfX8ghTH0XILKLdFfjwympdgJIPbz4FPseDypQq+rcs0
	hhBO0wBFVaYdpSGjGkTuRbLe1HZ/NMZBuwl/oG/4HQ6ESw7CDjGYuVdEZVdvSoDW
	9oiJ0Q39uzSCTcyCOUocW7mubJ4ZYCT8cBsPPePgfDk/UJrOdmmOoVi8wPFOqEI0
	ALnHnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g1b0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:49:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9667280edeso6072581a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 17:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784076598; x=1784681398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUGR1Dey91RMv6/UrlIf+RTVS0A3peDLMNZcwXJR00o=;
        b=X0LhZ66cbAztIeKTG6lrcsrrpsOr0YlxjbfqZLJlEe4GO9H/3BdlBxUKdh0czyBxnT
         1kJ8WTgtK3G3TBWUzGiPB5W7m7g/XM8pauZEJZzyM1mBsy9Oh/N/0PxK5wIrJ4LHPspv
         7LeftVymW36hfD8Wzj2xQ0w+RTET0v4eYDUzC9hB1pZj93c677aeKg1aZbwsiagXvw/g
         y8bFkEd6hhgtO8cOW7Tl9fCDbTM0wbdMS09ilTRTQx5v5TYZ+6DFr4KkyeWhw9F6Wod7
         uv8hHd2gI/vWKhPrf9tyCzS52SCfsHelgD7AeLmALHO2Rt1hmE6akNSC6VTG807nYPa9
         7UKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784076598; x=1784681398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUGR1Dey91RMv6/UrlIf+RTVS0A3peDLMNZcwXJR00o=;
        b=guWNLK719ntSutIQqlKMc+2a4naL+nsndN1uj29yrsH+9NqY3qeyYIFJLWk0mgRUCX
         crH1kTiqZQ3pWh2MhLOApUViUZxWb7t0pFTeHY+eyg7fAmTRzbQ1UtUiFlaZUPDgzRxL
         rhssCLF51IBd2B/mFtqoeAnly5hqL0HM+cdWBP1/Lqyko0DKilstgSQfodgbKYqONy77
         0svjhdY+qyb+c6zHomjXU6VNvHgzsS6ASzStncga69Bn22LsA3n0NLyk2XGZ8GjRhktl
         e6Zr2fo19Hi0LmFy2PrjYkY3eyVGH8nYXwCQb3cUAuhyXkXJOOgMx3LPTpTo8ZOvagui
         32+A==
X-Forwarded-Encrypted: i=1; AHgh+Rrazp/5tnO0xYmKf1wEBFQXbAfxFTpeM2IkJ9gYwhpJVWcRegXiIiWMu31m3Owel5EMWo7V0vQVF3SALPCh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9+bocN/nTPbhqn90q/0/fNEGHWLWoCketvjQ0kjKRTQ6Z9ngI
	RDz9jruIqC9lq8hxJ83CY0K3QFrj3Q3gXnCTipk2FYoXJA8fZW3pM3XX2Jtji4lmUfrX8TFwXxa
	ExFtk1QsIMOUUzS68TMcEj8a/ujXLTm/iZg2tPlXrgjA7prMo0TuuYSwtJlmPMJ0XHXn3
X-Gm-Gg: AfdE7cmfx9D45yNMM0Qugr44BrYgLtsCBc2zjncoO1RtH4DcWb/fraKCBHAFavVWaXw
	V5xhI/gKjkEfpgmXs16g77IMLlN0vZOeaQmIxeuMai7Ae9GbBXb1DvyY6wF+4VwaMx+eutHuc7j
	ib1M6FLUi3bZJSc2efTMlDwIOOUjCLAln+lcrEY7ZVin3RVojnP1EntoaAw741EWRE7Nt+QwXLa
	mHSh4ZJn8mVu00FmmFiAYklY1NxDE/DbCOFmbJAMpoaQV6gbLfssVFVpwiCzEYiMOVSknc0bVNL
	7NJtoSdfq4P80QTPlF4agn0odAMbgt4AhM5ihgVdq/nVWr4VByw0la2r9nvzb8pnagN3N7E/sC4
	C2RWKyTPTwfZA9W+DhMAjNPJPdpOrnfzG8I7Z1ORcoBxGdZ733aNMmqj1AIHf+GIvNh9B/dbalj
	U=
X-Received: by 2002:a05:6a21:9a4a:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c3570141a9mr5161167637.24.1784076597667;
        Tue, 14 Jul 2026 17:49:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:9a4a:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c3570141a9mr5161142637.24.1784076597207;
        Tue, 14 Jul 2026 17:49:57 -0700 (PDT)
Received: from [10.133.33.53] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3c1f77fsm10602524a12.32.2026.07.14.17.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 17:49:56 -0700 (PDT)
Message-ID: <603db28d-32eb-4187-bd10-e77e663f106d@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 08:49:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
 <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
 <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwNCBTYWx0ZWRfXyn0nTEC7JG5O
 X9Fd3+jFchbQQ+9gcAD8M1jYgovBExRBw6uNNy1slpT8HJ5hBcbuSEtRVxc7MqH5f797PpYC6LD
 ZFe2UlDj6mrpwM8VvGK/TfetibMbIMw=
X-Proofpoint-ORIG-GUID: yNxjN9fy9urWqfSutH96_9_iPjDVmtML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwNCBTYWx0ZWRfX1tGqdPN/8d04
 py+J/rIcizJOV+JaG4GebViTK9TXfWGniXvWtAKgpu1txcFBgg0syRaDyAOkmXGZBVHWKbfPQwl
 wsUnXdD0wXKivCgnWAJquwqnYendoh7kjAlczV67A7KNs34LQ2ABP0RMfi2S6POjWXPlviwZpdz
 9E5L4g5o7bEKGPHgsLOGfZU5tARnv6BeXFH4Q2XetLpfo5kTfooJ6GBDuNHFyMp1SgxUrHZt5HU
 2WKUavkGneEPZ3gyB1PX9EXagsi+krcMj995riqgkbji+3y7pdNWGg0hKvJIXGbAQn8elfsEd8l
 2ewZM+u+R+wJ7psJr/yPbGpTo32uQ/ElieWHrtW3pIU+g7TSEYjKuymeAh+P6p+uNy+3hOLiE0Y
 P1Uonvm59t5sLzci50eCYJIh7lI+3PUps5esJsEmnnbdnt6ivhQmywlMxuilbNftW5mfGgLFxeP
 hwO9s47wVEXJ4sRjoEQ==
X-Proofpoint-GUID: yNxjN9fy9urWqfSutH96_9_iPjDVmtML
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a56d936 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=miRBm6SHGmt7Tc25g28A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119124-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A92C2759C2A



On 7/15/2026 6:13 AM, Rob Herring wrote:
> On Mon, Jul 13, 2026 at 8:58 PM Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
>> Shikra SoC.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 1298 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 1298 insertions(+)
> 
> NAK
> 
> Fix the sashiko issue.

Thanks for pointing out, fixed in next version.

sysreg ETM should not have MMIO but added by mistake.

Thanks,
Jie

> 
> Rob


