Return-Path: <linux-arm-msm+bounces-113326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qz25NOjqMGriYgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 08:19:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A768C743
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 08:19:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I8oixFR0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Q/CD7hba";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113326-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113326-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D88D83008C30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 06:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC003DA7F7;
	Tue, 16 Jun 2026 06:19:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4643C9EC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:19:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590758; cv=none; b=HZg/5v5A2UeagaFzi2gLcxUykN47WInEsa85XmmEjj+3ERb4sdDhvBvp8FQvIpsI91W5n6ZIydsFqSS6CICwrTdA1U8AnLMEOTUqmLCJk2V2TXtXh+znWQmRM9Mv9mOO5k5+Er+x7hbqL9LNn2cYUEfA5M+tV6YtJqlQUDys3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590758; c=relaxed/simple;
	bh=HySDzHfG5PXiuMyvybA0VhJPAM36NZzNkcvZL+8XOeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vo0KNG9FrKEZrDY0Fp3JEhxXxI2+LMw2fyC8DQb26p8G/afzyzD8YKXtdVDqrFrnTx/GM5soi5exr2WuTI5j1Sg9+yzbRmCjX7t3D/eU6cootBhXE63plvNlUxnTKqogl7Vq5awIjNFdFP+2oRyw76YyDd9ECiMjqWzYU2t+Vco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8oixFR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/CD7hba; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G651rt2338144
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKQ+LOoANdSaA7LHIt4MW8IbeREl0D+4fa8Zcz6c5uI=; b=I8oixFR09bldnOjt
	4euoRF/q0kDmI6mTv/GJphoomU1Qndvb/0ysGYqEJ1a9H15TKdzt7xV7D9B2vKQM
	ka25efwQ+6oxLFPyoaDPPc3Rotfz6ObgF3BAwYLTBUJXgkW1ukMmxcJbU192BbJS
	lWzw+WTxEqLtfDGJMbSWAOU0nhsZoKPMkS+odltNpergTgbTizH46+AW5ZL0OeoH
	wIappONLaHVIdvO0SA34XYBbLHyqJJw9O+Pdi1cwiwDww33Sj/l6oJvYFyJR3Snj
	Y2tdStQ0xOvyTNPWNFCgUYz4wnzuALjpGvnWPFjxDIBbNDxW7i7Vu8qxnPhfbDtq
	LOmeiw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0n73x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:19:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423970cb30so2903946b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781590756; x=1782195556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKQ+LOoANdSaA7LHIt4MW8IbeREl0D+4fa8Zcz6c5uI=;
        b=Q/CD7hbaRqZuMkn6dmZgS7iKPPXPaVOas62ib5fWALCLYW/uAWNdCLkIB/4Vt6hCsb
         W0JDQBFGexxasS+KglYFs0JV5t1yposcAKxr2eJQU+2ZMRAOSyovhDYtpJDvxevJ7M+B
         pQggoClZBkElcBR062Zy7/qWyRQTaXhC/0E7KTuZLNsS0sdQYWF+bKtdfiNh87l7WsRv
         Smwv47HeThi5O/b/WlZ/juQKhJbvarUsC330PmNekn6u3QFtVEPNepFHJ1+6kiby0gac
         mM023WBe/zPY/ONZGT6GLOsXAeE1QpVPdrEvDw+R+Z0lYdRGaBLqWNy4mTabdVSzaFo+
         yC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781590756; x=1782195556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKQ+LOoANdSaA7LHIt4MW8IbeREl0D+4fa8Zcz6c5uI=;
        b=KrFjYtp/wwEGpRGd9jkVji8S2q4mOu4f7Yc3bFPqlJ3Du+8KN/yKI7CptvpAlLsX2Y
         kp1rLiR1zetPKDJ9JgdJ5ZVu6BLq/lGVh7uzFc0jpRg7dBmJqVlPRv08Y6dFoGdE+3WV
         8cGbxstnpKOy09LFvvPWUuwmbP6aQQUcAULOfdpyVCw6NDVQcTQRMt96PMkj+5+o9VOQ
         VnQ5+ZUjPQAuTE0/g4NU7BtS1TzPfzzrk4397WoigtpsHO2eMQvBfYcyiUd2qoDKpZyH
         BtqxUj633+IlDBm4usfkGUSoFe8c1EnTzfdiJ7Mv7YurdaVMpaq7dDFj/tIUGU0ZOIDB
         ibXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ahosRD1wxUH735uKTtLsb3hzcjdV23YcWdc2C32M2vaZ2DyXy34JWwXeC43JwSmjveguDktHXpf7mqCA/@vger.kernel.org
X-Gm-Message-State: AOJu0YxWpjO+Y1+84UQRVBWNoOGaZy6/ucLKZAs60TTxVWLMQpxyZxK4
	bjD000SmGFz3TRujUndSm8JFnMy2YkJpNBKxUHlGgTjrZiRTYPMsSx/w9zk7z/Efh4q4Wrt1TD8
	7Y3NS0NqD6KSAmHPBZ9jxFBWFabLbjB5QyfCgzTD4/RXWPNeUFj760cPirpstrFBszpJW
X-Gm-Gg: Acq92OGkyWxf6d/pIzmcF2OfmLELZUkARxGnQTIht2eV1dd5YB/Craib+dWgNZgr5Fk
	qpDonR8qWw9euz7Makndoa3zDA47jcJbhEtgx/ilVcQdzkxWpx1qbIygA1DXmBNExD3uLg95k19
	p6VgRHtrUSilIpiToU7FVAk4anTmKW5E2AgD2D9OQiX4wWBU3Zu4YglH+vfC1Hb2ybmOrNqSFmO
	7cb2xyfn1jrO1vuMXtasNybcNKg3zpvFZu4NZu0qZ8xbVaaDXVSd4Xv4cgaWWt2A0YNrFss3fVe
	JW/3n/ns3eczOtQ4gk2YtacYZU1gZPgLySa+QFaEz5VH9fBIHL9xhMR8XzLE+wnJYFcoz2AwYmH
	yvUqspNk++Egq2lWFTybVOb4JGFv6iUuedJcyw8yG04+Ph8ImyQ==
X-Received: by 2002:a05:6a00:2991:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-844e1a7970cmr15081632b3a.35.1781590756330;
        Mon, 15 Jun 2026 23:19:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2991:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-844e1a7970cmr15081615b3a.35.1781590755919;
        Mon, 15 Jun 2026 23:19:15 -0700 (PDT)
Received: from [10.217.216.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acca7ecsm12187454b3a.13.2026.06.15.23.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:19:15 -0700 (PDT)
Message-ID: <9b04b4a2-f3e1-407b-9458-1d6c061429ba@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 11:49:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
 <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
 <61353034-51a8-4be9-8f7f-b15f5d60fcb3@oss.qualcomm.com>
 <5d3cb141-bd88-440a-adc1-e4d722bbc3cd@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <5d3cb141-bd88-440a-adc1-e4d722bbc3cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA1OSBTYWx0ZWRfX2E7zLmbyfQg/
 Xv/Sq3xdtZE/Q0I6AkZKCepjbBQQ1Tc++/72CFhISLEruwPN+ICp73cwy52tYL3VqeDTOemEh+0
 taIdysJN0jmk/WgzkmyNR0v1DiqSQtA=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a30eae4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Qv26el8sPAtkdzQ7tU4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA1OSBTYWx0ZWRfX7bt6zsvwrl25
 TfF6fJWwuQIGaJOCuqW4rWvWXccew82dNHf8iM3sl4xgoHdcgaacGAUc4D9mNlKZxe9jDyMhCID
 twmcrppA5/R5wKisDGtU2/dd/vxd9aPZEuqcJtkOuGf8NpmewyFxr/qNx+4mevNTEWeWabD+NAt
 +Mg+aTSfUA6DPIVPxY1Tw10/vPothaJBiuLv1LtEIQtSXKpOjDtVOxWR5gcX9YjcpX/E5SLIQSH
 S4vyfXDeOohG3VGJzBT6t0wT/Z6w85zBbNprvvdBQu0gm7TMqtpXyHNLQTuYOztP8LeuTN9VJHY
 IzofeYPmis5V1cjnEPWl8bw5BsXwB2e3D9yxXbWxKYn7S/0v6zHgatCO6EfMEy3QSUPmBN0vU2Z
 Q0MqnxxxJkznDP0EICinh8rPoVSUE61Wj/gf8ccqf+LyYlNkObPG/3v2qwWTwDqhTVmTwqTv4bz
 nX9cDtf6IKWyVrUo0lg==
X-Proofpoint-GUID: RcOzHt484R9ZiHX4Aaf9msXrxlSrNr0Z
X-Proofpoint-ORIG-GUID: RcOzHt484R9ZiHX4Aaf9msXrxlSrNr0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113326-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 706A768C743



On 6/11/2026 5:31 PM, Konrad Dybcio wrote:
>>> If registered as normal branch clocks, they may be gated, which
>>> breaks access to the EVA clock controller during clock controller probe.
>> At least for the gcc_eva_ahb_clk I'd expect platforms actually reference that clock (as well as they do for GCC_VIDEO_AHB_CLK). For the XO clk it's fine as it follows other XO clocks, but please add it to the commit message.
> +1
> 


I will update in the next patch.

-- 
Thanks,
Taniya Das


