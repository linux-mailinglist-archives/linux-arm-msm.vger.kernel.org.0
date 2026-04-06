Return-Path: <linux-arm-msm+bounces-101938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFPuCn+C02mjigcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 11:53:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7628E3A2B2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 11:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE3B03013D52
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 09:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F41D31E849;
	Mon,  6 Apr 2026 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHmHAxlB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBayKhZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C87F31D759
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775469180; cv=none; b=DWSQdEqY0GX5pisc2tBqvfcKdjv6rpt+sRZR4rXgsnoQJDjjNImskntJwQ3U7qB5LeSm2c4CvsRpolQfZQzToYp0cRffJrOE5F28eI+FDHlg56VKjVckxipyjb6m5d/5+vmg+tdsRWfwKPG+grO5ovonpVffGQt537gd1phRaUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775469180; c=relaxed/simple;
	bh=R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ly91qYDuv/1bAlqly57dqgQfyjQWPRd2NjWj+4FRsMMQMhHQ6VioZZv3gFCp01C9z6fdFBxKcndXZys4w7c68Uq7a8+5MchV+BOhjIKMP7JpsbiQHXBganpTjPFUbyuCOO1nY78WozKDck7C8LcqD/ChurzycCwBjiyzIdMfYCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHmHAxlB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBayKhZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6363WnW52973403
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 09:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=; b=cHmHAxlBtVEjpSe+
	sKbNkMUhUAx+Of9ES0K0BvckXhh4JfjMhrAhgCuveyNrUMGkNhWT3RptHLYM9Hic
	ANPfRPe0GUuOTAcC2fyyzgwKgWxlW2CGT92LBtguCzXTLgCzMWYyGPaaGmxhyK03
	0QMqI5hkDmA//yIdXoRjrGOWQNPQLFwblRIZz7IigzCKDRSQ1jvyqZc1Z+CUnbQF
	m1NhXcB222hHpQshpFWLzncWL1Lr3g1LPoQbLINt4p8jMLNHWFy20R1nTlUUrttU
	7a7HAefbREQfRke+Tb8phPI2w5ezLuyEbFF+qDMcT/1tJF5P/vHXbLsAY3nZQJfV
	1RLpug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauthcmqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 09:52:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so4153868a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 02:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775469178; x=1776073978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=;
        b=GBayKhZRONBCOOkM6vUHCfDjEvhKMdPSDWFIDB27zl+xHcREws6xkheXgcmuT9R5a9
         LQPnqzX7O66TYV2U8OGklh/scCDf/cSx+kSONGLLdJd+/MT3NXGJPiC1/GFL4KDRVChy
         TrTEuyUNpNoxWUcAakeGRiftUoJvYxz7hN9hTFetqOGWknRPpqFChYWWgoo4UXttkugE
         Saa81lJnoUkM1C+9y4vr1X4LX6Li8hDuuvbJlkSU/t2Ozupx2omsLaH+Z2vNi5udMwy6
         D6u/8mFt7ZmlqL60Gk7a9FvxyZ4IXaYz7ha1EYMmoPOHWGoJCZuqjRwMJ+poV3tzuLBM
         b7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775469178; x=1776073978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=;
        b=Ob6ptvfZU4QH2l2Z/7VvkHUZfNyE3+eg2Qw1+9wYgENbCeNwkndVYGDnpBWB7TiRyQ
         CA8+/XTbmMJFRzdGBTywNcnL7arJH59VO3GvmT9NlhePArnEw0O+wXFs8eN21Azq0JIT
         sO+VUXQPY0x13VThFhlnQ69y/mXV4LQHU8u4Eym/zKN6/8I41Wn3nZdo0T+nSHc3Oy/g
         HT3FnpZMIgNcfY4GzZCcSaZftx/mlKohwnUh0EqfvXEqPwvUG9Qjn0ZyDlTfEwXTWbE+
         Zoh2oQQT1s5X2DJEv+KnGtDX/ve8D+IoKM0nxFxU3UYcXi86VK43awaj3gmpsV62ItIM
         LZlA==
X-Forwarded-Encrypted: i=1; AJvYcCWxYIRSR8/RhDkwWZVtXFdP9BgjmWcKA+6nB06qyDV/1BvLWj6O3KCuSL65M32XyIujj3k4WhiDsiYnMgVv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8WBJsyZPqz5B0tWb0LZiVbkoBVyz5d6I5/zz3JcuHL9NPeUM5
	XTkHxmXS8TjAxbMh46ob6QmnerXinxD8RNMJZlGS2F1lxII8oMvz+OJFxqwj5nxItRbGnpwSZ0s
	lUl9LSmhNn2M9EYbKRW0NK2PDvRoA3DwmARGRg0AKk7A/9+bBxLa2cfjoFqDoUoRLxLRS
X-Gm-Gg: AeBDieuOICmGWKQxoSha6pnuME1r2ZeLn37/ilLNAxQSMq7rjgdJZ4gYDcIqD3LWPg2
	X1MuyvXdZZBRnCXKHdI95B0EZ6lPZd2NxwNqC1fVKp8VVO/z1i9YlEScAHGmKPdI9F7JUfGsbn9
	rADQlFepLQgSM6wymo0ImobwLP2txnny2A7GWLWNmd9wK06c482tWDXhQLbLFznJIEcLX8c72zn
	7YSeyZmTOocgnwjw7CM1kBikmfcugEP1pRSiTN/Uu6Cdq7zm15EOF/OCj7cJI0NvELB6W93a3TJ
	P8siEpDkPVI+ufDkLgCW/wRr2EAS/k3rucomb3v525HoIN0CO4nnB8o4yF8ufzHOS2brTjDWy2h
	Il7Tzs+fTkttvZHurDGCDPQVktDfR5U8nAbM1OSEY2M5cQw==
X-Received: by 2002:a17:90b:1a8a:b0:35b:9ab6:1d59 with SMTP id 98e67ed59e1d1-35de5c64a15mr9012115a91.13.1775469178002;
        Mon, 06 Apr 2026 02:52:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8a:b0:35b:9ab6:1d59 with SMTP id 98e67ed59e1d1-35de5c64a15mr9012105a91.13.1775469177538;
        Mon, 06 Apr 2026 02:52:57 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9709b8sm17465992a91.16.2026.04.06.02.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:52:57 -0700 (PDT)
Message-ID: <b54ef086-60a9-4d33-b63e-6fd6499c909f@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:22:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
 <ee23daf4-8181-4ab0-bd21-b2ea636168f7@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <ee23daf4-8181-4ab0-bd21-b2ea636168f7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA5NiBTYWx0ZWRfX5RVmmwjMDxjl
 PwEDWZKlUjfLMakG15+FXmucBle7w79uFuhV9WJ1K514G4z2UvHJw1j+5SCGvITUGBlrlMxC7bU
 eWbGg529604AlUvZS+KIPSb24PrfUeV5oXsyilluFyOx996QDZYNf0dYmDyD5Sr7uEM8UakAkYz
 sL7LDqL0pyb9UTi6LzEnWNAfvF4qUqSIMX9ShF+BMC7CDhDd+MFICSydydmwNIWdRk4lpGOwuAl
 yTkhGw1NfMSix1gt8sjMUfMC1XF/9N7q94ScGElV69N8p3gCZnBCDds0QkuLjkjGUd+ZdpLGSiH
 Sr70nMl2gEnyAI9mrcLju4VApQJzrU88YwdfydCTIncLcT12/OfvUKBs5CNJt250K7w6fUJxRcc
 FiAA9+AJfI8szZkyLsuN4CAd4mDDXgcXRRcvs77V1BIaI00wGE0fDWRD9S4PNRPqackjGTDsBZ5
 rG7EZvtf+Ni7qBunGig==
X-Proofpoint-GUID: H1ee7fDs6YUm_rXH4CKzqRc5OMo4shYr
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d3827a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=cIAgj8qr3_NMcBLshucA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: H1ee7fDs6YUm_rXH4CKzqRc5OMo4shYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101938-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karthik.s@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7628E3A2B2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

Sorry, I won't repeat this again. will take care in future.

Thanks and Regards,
Karthik S

On 4/2/2026 1:00 PM, Krzysztof Kozlowski wrote:
> I gave you review within 5 minutes and you send exactly the same after.
> Without any changelog or explanations or response.


