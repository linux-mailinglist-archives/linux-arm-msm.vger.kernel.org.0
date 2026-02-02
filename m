Return-Path: <linux-arm-msm+bounces-91534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGZ/EafOgGkuBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 17:19:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1E7CED94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 17:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 456F9300B584
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 16:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51684277C96;
	Mon,  2 Feb 2026 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDcSJ/Nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBOpXLFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE05926738D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 16:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049189; cv=none; b=B8mHdf9irpKvbqozl4Iu2e/TGVYkHaLuiNdGdXsXkfhO4adWHVFMRNlKjqvuB2ZTxFRwNs0RJS+C/ThxJSzZ9TG5MtCh6fQ8w2DsnolAp2lrpoFDaI5HyveuFGBnG9GWBrbYp7Gs+7zikr5oMi8IaxUkaLqGMaHw7yktJhP7drw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049189; c=relaxed/simple;
	bh=UFH8ZvWyHSTba8xWUqCDIvROSjipa6gDdEYCeNskEv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUo1ZtpF1W+adXiTUn98d2Sy1mIwJApEZa3Dr/xMm44p2Wc1+d5u1Tzh9uwCs+8N/uuhb2LmdCxP/i71XaL54kmYEdc0FHKAY3jCMnKbgQguavME4jmM1EdcMfa/JACUlZUiEJHuzmTDjFjSNHO+6qX+2p/vr/O/rkWC9EErces=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDcSJ/Nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBOpXLFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CJbM22884466
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 16:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJlWcyQgA0RUZL60b1mwd+CQ0XW+iOLXGwHWwdBbB60=; b=TDcSJ/NbBSbbVQBY
	tTXLlJV4wDO+vOE+sQzJd68CBXWy2JFr8kPkgf8ik4pF6FSKopQahpajNe+Q7VxL
	0orjd/shEZ9exSn8vcRQPjnLxsQmY2RAXKXfiu/0EDuj56CIrc27+eUJPNVPAz3q
	z58hG6fgtR6MjjCU8W7ANGB5tk/pwWUbMvO6NUF7rUeic+ecjdf1BaaZWQHdnLk4
	1RuK5I/eX1qQaQrchmiJDwyX5oBJrTd5I9Vp25YxhWXfCcifVh7sL2DkXqTugASK
	GJjebjxqiPiOFxBc0yWo31pZdIJurDUsHDxWzIN4L7SqY9cpeU0M5NBrq1JFnEiN
	kFdAaQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3gq97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 16:19:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f29ae883bso33534085ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 08:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770049187; x=1770653987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJlWcyQgA0RUZL60b1mwd+CQ0XW+iOLXGwHWwdBbB60=;
        b=kBOpXLFJvgEU9HwIu4sewowVPJJOStOcRScpzttdyLY9eQxL81xlGI3EYIE2mEu6FY
         UTdv2agIyNvbLYH7MDuaKeKuvPkPY1WjQgtcXTP8Kd8VxvguouOSpiw8bJXMI67SiuA6
         TwXtbsU55bgwwGKGu7lPKLIZfGQIOIzyCkPnasN8FlJBjd978tHFbnlBktPXl1zN4ivj
         PixiXAwqyqoUMOpa0VNYjWVhrAgE4D71wts1PlPZDrxsTwcNEbHCRI71k1SRO3/YI7AP
         1TNstO2hN1Q50H4ioLK6TTV/3ybQW4P83kNzGeJBpbWy7C3jeAhX5kEh0fVVoAvWrpqi
         7zWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049187; x=1770653987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJlWcyQgA0RUZL60b1mwd+CQ0XW+iOLXGwHWwdBbB60=;
        b=pbt1LVUoeQOdHnb3jIeQCHvmwjhGnRyORXgQJpvP3eR7D76IsuOh99ZzI4KDD8uWzA
         2HaApbEqRWSq0a7Bl0pgKek/Gr0c5hkkrN8BoDQ8eiv5KVhYBLwT1vXlpVIwWbaHJY4j
         sxdXkP3Fj3pBOWnxlOyCWrVipNwwyjwa9ec8Vqv/io2SpZ87W7BmKo3rEBwthpyhqcGQ
         yDIVFbgbnQ2NgnUprKAiyt5zk3JbeJPerBCx+xyrFqIARl4EmEEmNkP9q8W++EMV1Ese
         JvmHSS2/jSe5zAN9XLtim21msooeizEU6yJEOd6+kI+1uAM/bMpSY1bwuHrjC062jRM/
         e4GQ==
X-Forwarded-Encrypted: i=1; AJvYcCX10BHRISSs6sYjDTdZiBRFq9DeN4jcnzBFmqc3HsNUzgL0UD3x4fyvv1La50H3pBFJhhL/Kmp15XVZS+9p@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8m3MdqYieGUkFlanYhsmaHiu/gmPn059ueS6vYAEI8D6hCh8y
	GscpYsU6Z9QFTOUTJ3Kq23PH1R7r62PVMix5N1Jtgke6knROsQFC2pqJu8iSFUKx3o2zkDrgas+
	cwocdCD/vFH/Lya6rwkM6GSobIDRPk414xJ/g4dnU1BzHlXNGhzD59GtwUYeCpNvzFQog
X-Gm-Gg: AZuq6aLQH5osCAWq0ZwgCCWGD9IAgM9ZQUO+UJEZ9Spg2QsVx9mMXJmL3kkDEhzYrj3
	1wvpNmFUKxm8P9xw7/ir2/nWKbI86fTqA9O4J+mUy+JgqMWtft0ABeQGSPhXYgUxwrRZD8UmOam
	v5lJDlUBGC1fbkt/hWZOjdDHrKKQBjBkcpqVaRskA/BjhYMnwbhSgQnB3yo8P+IVyIbyFLTAkqp
	Ekwl+5o36i0vpl+a7hHUK65P4gDGVAkhkmT1AGLBQ1jB7SswdUYVciVFvbp8pkTqBjUfQkl0VC7
	s7bGkavWyIdTvSmzaFEF3Ty/rvmvTZOColAmPgfm48sskDO17gL8P0R8MMttyRVdHIQCdrLAjFZ
	FpX9OeGOdbpXqGGP/9kVLRqWumitsSstRcBq7SkXI
X-Received: by 2002:a17:903:298d:b0:2a9:34:eb65 with SMTP id d9443c01a7336-2a90034f0c4mr58846275ad.26.1770049186505;
        Mon, 02 Feb 2026 08:19:46 -0800 (PST)
X-Received: by 2002:a17:903:298d:b0:2a9:34:eb65 with SMTP id d9443c01a7336-2a90034f0c4mr58845985ad.26.1770049185974;
        Mon, 02 Feb 2026 08:19:45 -0800 (PST)
Received: from [192.168.1.4] ([49.204.107.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eee4asm147472785ad.20.2026.02.02.08.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 08:19:45 -0800 (PST)
Message-ID: <61ef66ac-3919-48e3-a78e-eef54001ae6f@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 21:49:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] soc: qcom: geni-se: Introduce helper API for
 attaching power domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-6-praveen.talari@oss.qualcomm.com>
 <d13d1931-c6b2-4f4c-873e-efd45823fa89@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d13d1931-c6b2-4f4c-873e-efd45823fa89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JbPbu-5Erf4v2V18rGtzPbVByxhg-tOX
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6980cea3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JMgISmeAsz0pT9/O8qDBbw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RFm3ULBN9CpRR-2xPD0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: JbPbu-5Erf4v2V18rGtzPbVByxhg-tOX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyOCBTYWx0ZWRfX4DQn/H8hu29/
 HyhH3pFrtFJMVoGxIs0RNUOAIL+pNIAGeZ8wO3+1/tW73IicMl6cgPjGSboVP2IHnjYzlSe/sbS
 S84LF5hVvZm2XYL3DWoSHUh7hoviW7sU66+7WE1hxt0GShdk3EKuCn1caBlhZBBlxWUTEaufVd9
 Uzu1Zo4cbvqhyZDrWZBpYCu1UZxIhIX+f7RdQFBXdn5urePDQZlMVVLK46rTyoM5jzKY6Jszldl
 M8Goo61mLFvHB587uexA9EQs38NdgjQNcjhyMNFwpTH9/X5K2ZGPmJxasU4/ZNj8IIBYxjiUZ3t
 xKRPe8GbddsGmEEqYpQIj7mYCmgLs2GNqXL4uTL0w4mEoiZehd06cxuxPymZpyNezjaMrJymV30
 tinoqk4iCOfIiajbiCygdtEKsbGWJ1KqYqktka3++ae68aOCjBAN2DguQRsx2q30LkIH0dpFiLG
 fCAPruk8K1/68YG0sfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91534-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF1E7CED94
X-Rspamd-Action: no action

Hi

On 1/30/2026 5:42 PM, Konrad Dybcio wrote:
> On 1/12/26 11:47 AM, Praveen Talari wrote:
>> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
>> the attachment of power domains. This often leads to duplicated code
>> logic across different driver probe functions.
>>
>> Introduce a new helper API, geni_se_domain_attach(), to centralize
>> the logic for attaching "power" and "perf" domains to the GENI SE
>> device.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/**
>> + * geni_se_domain_attach() - Attach power domains to a GENI SE device.
>> + * @se: Pointer to the geni_se structure representing the GENI SE device.
>> + *
>> + * This function attaches the necessary power domains ("power" and "perf")
>> + * to the GENI Serial Engine device. It initializes `se->pd_list` with the
>> + * attached domains.
> 
> Please sprinkle somewhere into this kerneldoc that this is specifically
> for the SCMI-auto-VM setup, otherwise "the necessary power domains"
> is at best confusing to an external reader

Sure, will do in next patch.

Thanks,
Praveen
> 
> Konrad


