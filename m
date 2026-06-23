Return-Path: <linux-arm-msm+bounces-114142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3asvOTVYOmpq6gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:56:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 506336B5F92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:56:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Hy9+CsQ1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DT5ACLIn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114142-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114142-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4ED3130156EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2C7369D59;
	Tue, 23 Jun 2026 09:56:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B32369D6E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:56:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208562; cv=none; b=q9eOoWCE1QKr8sbIfAjZjib7rzyeOvHdhU2Ftut7fMZ9JHf7s77DQEBlLxrUidHo/Ap5GMtLwfV8rXdr41xV58zk3n5upxVHLvWV2O/UwZPrzZEyOS7jktxTCaN8zNMyhqPhnwv5DrPGzgTZFSs1VAwtRTW+KasJXTFY9ZqKvQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208562; c=relaxed/simple;
	bh=TuuVh5rWDQJNKeCix9U0TUROxQoIHHTcGQZRv4sVMRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAyFV3xYm9YXTxaLZffaAwKZAIdUA6Z69+uy6s+JLJd2BOE929HRZ8kNoHkfTUxSvDCWnMQx+L69d4/j2FQjIcwrwo2YCidaulH58B2EjikxiqPnG7Zh44OE2YXVr5qohPPudmmCNpiKHUM6HT7EJfPL63r33tDVPgoBy+p5wPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hy9+CsQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DT5ACLIn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8k7tD3354644
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQg1GucAyJTsYEyGewOcBVX2rr60LtF1mzWX1fFcj/8=; b=Hy9+CsQ1WtvXWdVT
	cTv26O88rGKF2e5vnsuAkoW9mBSoWzMtuF+0LVpShZzLYyxpc/LTvO8YhzmHvics
	SaW5wK/MfzoQBl3V3mbWnlvnhQWNhn5yEWdFAyISEJu+6mPjG5RJV+LAwkrtfWjI
	4PzCe2sbjgmJOaCkPcjA+YKBGwuZ+4KhW9tejZdzOGwv+AeHUT94RDlb0j79/B3Y
	Fio9GYRFl57e8NHG/AX4rvRU9XGF1XbhkS+uBVXwz2KVt4vQoRfCxWfO+6HH0Q2Q
	42I4pM9Eqi8VEfr0UlMh/EWAKHT+tQgSWfRvMRGbHfn/tGq7qSr6rpQV+ZWxW01Q
	LfVSVg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx38b98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:56:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ddad618405so122957666d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782208560; x=1782813360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQg1GucAyJTsYEyGewOcBVX2rr60LtF1mzWX1fFcj/8=;
        b=DT5ACLIn0c6+QKM5AhapbSQrqqfgKMMcsql+F+sFCkAhFagDPf+9ppU9BWprhSwbE8
         HHW/ABIbeh4mGeS+3m4k8muZWWChTdjcYffZhrOv+OM0DMwMlxqEKXKK52jbKej5991L
         MCVDyXSGc8byanMzhyuO383pYYxKOHZGeV3hpFjGkF+djDyxw/Q3jiB7snw3C3ls3opV
         AxQ3Y5WzNVjBaCYISUCTRlsXABP4q9KvbI5qRv6QB8RE8unWy/bWrNfNwJnOyi07fwv5
         WNalVybOF507WBVWaNH/hFa7joNOBJ086ieo0jnsdgEJpFni2hpmFhEiYwDvzWcVuu6r
         o0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782208560; x=1782813360;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQg1GucAyJTsYEyGewOcBVX2rr60LtF1mzWX1fFcj/8=;
        b=ma3tLXE0wrtQ2fWpq+TKO7KUertkVnP+GP8B+9vw7zF5fvbEAjBV8PxqLyTvpWdBLo
         nabWk8Todx+T2Wc0bZcEI/X3K7VbuQWl2VAsqoeBzCrD6BeRHtZMPWWpexwNOwJkTrQY
         oQc2AQHWo9Ih/+mhh7hK2SotzP3ZaUcRfA1fIcVmA0sUnhEdHnnJ58X0UVgWvIAIUUB/
         EyjmQQpi8uH9pbTC0OZ54EI+I/Yv0oRltUPLhi/DqIaxr6Ki+ZlR6mgWUSW2IC5vqorS
         ODzqP8PajSwj6YuPIX0hH1HJLtAq4htohsMxALN0Z4/zOzfukBY9U/FpJ24cAF3aVGyu
         rH8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/in9Adlkwk4N16ERcyUnu57RduOB7wpqpRyrW05ipbUX0gKwJdhh0VYlkv/VFhUagseC6iyQmrbjqUJ328@vger.kernel.org
X-Gm-Message-State: AOJu0YwPFYAYMt6ipJwmpssqKYqiEFdiCadmNw4GKhIF3RT52/G0Zpje
	7LjMAMkL+G6HLZjLYdrKAi9oJZ9oh30UT1wg2QxDeXli0m3eQQQbztsXpjUAxm/lCNpFHPWaFOr
	XU7FMG09cWbTAji2vJB8YqUkYoU+E6Gqb1mEW2Ul51T/CIR9KhrJiVfGzMlh3/5pBufyV
X-Gm-Gg: AfdE7ckWddxkcnBUxR1Tv85hCaFhupA1gBp9Ut5QWJK8TiiChoSpORASt1OIUjyxYTb
	QNAxrMju9wYfjBF3XIP4xF9HOosdGXmyy3+QpwK1cO32zauK7g3FW0K5oVOdsbSHZojenPHpXY4
	JdVuYK6cQ1ZUF+koGng9izd9ExphNNur7RL8PFC0YpsD2SCjzG7+mnN9FYbt8BHtl2Rka/ViV3H
	T2wCLOFdDMs+MqLQjIllD0NuVVS5kvdJitnYupCz40aO2jw1RNQ4LDGj5Tg1t530HTidf3jjzH6
	DVnxpgUSt4ZQGnOlawBA0c8//uY9FIQRp6cRKzVq612qiee3nkUB2c6vUp3oj/HTBaTW9BL7u1P
	I+Rj+pSP5A5KuSEkIt2mDM4ZbByyMYLf/rmJJe4sq
X-Received: by 2002:ac8:5dcd:0:b0:517:82bd:46ff with SMTP id d75a77b69052e-51a547fdaa1mr31502871cf.26.1782208560096;
        Tue, 23 Jun 2026 02:56:00 -0700 (PDT)
X-Received: by 2002:ac8:5dcd:0:b0:517:82bd:46ff with SMTP id d75a77b69052e-51a547fdaa1mr31502551cf.26.1782208559652;
        Tue, 23 Jun 2026 02:55:59 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c579dfsm34473542f8f.31.2026.06.23.02.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:55:58 -0700 (PDT)
Message-ID: <f8441903-c768-46a1-8f95-b1b25d420a2c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:55:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
To: Jie Luo <jie.luo@oss.qualcomm.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
 <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3a5831 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UHseL_0MqL1Ls2T-heYA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: NK7QyZwPxxh9tjkn_llg-1oT46_P3fqu
X-Proofpoint-GUID: NK7QyZwPxxh9tjkn_llg-1oT46_P3fqu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MCBTYWx0ZWRfX6oRJskmwMeNy
 iEvOMEeCQ+NPU65hGDlsUt4cr7Bt57gSwmNhZdiRdBryaJopD+ZQNyJqFPWfUsFJs+14bS3VfLj
 Zz95QX7KK4q5ywSZZlrxk8uCuIiJiAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MCBTYWx0ZWRfX9osHSAwotWPt
 Wjf/G5VuwVICU9COb3q/sUi622NrhzWX2ggyU3lr3ux4NAHXA++Drn4oRwsYDOSSJ+lEof59yuf
 nyEWKrKR+WWU4k8zNtQusCr8TLBsgTBPXsoaasc/Ou8OC9xdbhsUJVfhl83VA1l/PRMrZfBZ9iQ
 j9jcrjKFgIygrQfX+Cq7pDpVMdvgT+Cv4688Avyvo0Y8Y3JWMVEHiK62W1DmClUiu8unjIoSu9S
 OtSF1R/pZYXNqa/vlvCGTwkxEtEaKsHPuyXftfZgA9ZbkbpiE8ywn3nN86Ozdc1JaIM90g2iw8X
 oP2SeseukstRSJTXVywE7IywG/Uzn74A05dr/Cn8uq2xLls3n1BZSzj4aGDcrVQhmhup+Hg7tpq
 AeJaO0IBzY3TSb9komCYU198kxIDuWEDXeLYBBCqhMVTycVRdfarzMeafeNolYGBUuUkHz/pMa/
 WONe5YCRGMAwiq9mH0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230080
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
	TAGGED_FROM(0.00)[bounces-114142-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:jie.luo@oss.qualcomm.com,m:andrew@lunn.ch,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:quic_leiwei@quicinc.com,m:quic_suruchia@quicinc.com,m:quic_pavir@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 506336B5F92

On 23/06/2026 11:42, Jie Luo wrote:
> 
> 
> On 6/23/2026 4:10 PM, Andrew Lunn wrote:
>>> Driver is not supported - in terms of how netdev understands supported
>>> commitment - if maintainer does not care to receive the patches for its
>>> code, so demote it to "maintained" to reflect true status.
>>
>> Maybe "Orphan" would be better, if the listed Maintainer is not doing
>> any Maintainer work?
>>
>> 	   Andrew	   
> 
> Hello Andrew, Krzysztof,
> I will continue to maintain the listed drivers, so their status can
> remain Supported.

Do you understand the commitment/meaning of supported in networking
subsystem? Do you commit to the time frames netdev is asking, including
running the tests and reporting results TWICE per day (minimum frequency
is ever 12 hours)?

If address did not work for half a year, I really doubt that you commit
to above.

Best regards,
Krzysztof

