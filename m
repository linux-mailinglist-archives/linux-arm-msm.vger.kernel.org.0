Return-Path: <linux-arm-msm+bounces-109692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEk7LK2EFGorOAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 19:19:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 990DC5CD42C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 19:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7C263003838
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 17:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F924299931;
	Mon, 25 May 2026 17:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9LzIX3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQCCLneE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB53C2D9787
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779729570; cv=none; b=AHDitCyGIiLm5gS9tdGzFSmUVcBGLXS3esds0MZJtddV3owZdyg7heVmEEOPCvPoWwQ1L29YfsY3rwxikWDLKTfA/BfZ2k5MWwmUDuYNvc3DniPh5aTX1aCqs0uanFwftd0aohH1+quDc64UdSaIswd358eNOkhaWijsyOeUTCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779729570; c=relaxed/simple;
	bh=zkiXMJywtjomH4ExA3n9dnkhW7Al5fabmbNNmU6ozYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7zk23G4IIBLyFv5s1TblQ+mAIiSP2RDOCdQzSDxVehbqgyUOlpL5uIjRQ1xidRmh55krXOJ1Z//PTJ4ZrZ/39CKa+XuXRHPSMXEmWBlHDSF3B73OF5jstLIQWbW8PIofHxpQ7H1wILSYOf3x5z8h/VDcyvnVr7D+KqrNiAW100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9LzIX3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQCCLneE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9ceUZ1802339
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 17:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUOvn3MZp/wvYfz05jfdn7SBbQ984RFb/LCTbznHnzs=; b=H9LzIX3lQ6ZM9Mkf
	BO71saemv1DolZfqttLvgjY5Wlr36zPWYk7fR2jjsjQy2DNFU22czPFlygWhBlCi
	xs37o3MICpASRq0bma/0zeCFFMXeuUNitzX24vsEHpGm+tuDkXl8kPi2u8FynyDq
	LWQV6CkEDW7w0tvdxzMN7gxEfYDUSf/sA8/ufgTdv0G6QMiwQ03maFMpNhdmeA3g
	mJIBzNw5UIxlPiJubERRK7LUDqFKdeROatQ2CM6kmkIR5COb1IQ90dgkWkMGpCDR
	/1Rl5dQdK2V9/fNrMdf1wuHXIeYOQZcF7AoVkbNTYJyWC2ofThXkr0KqLm4rLXS8
	B4aPJQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqhfvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 17:19:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8292a9605aso4617347a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779729567; x=1780334367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUOvn3MZp/wvYfz05jfdn7SBbQ984RFb/LCTbznHnzs=;
        b=RQCCLneELZ4gKaQ495slG4BRL3NDQBXmwfFdoyv94ZnClPd0GZ+N/NWH6sO0zBV0aK
         dfIlidfDc0Ptz1m1LnRUcAd8TxiWrq/HVm1jyTvhMZPhveEj6QkJ0gQaX6AL2ABXwXvr
         GI7CuQD+XWPfNoWonfTksGPgEvxs+/W21OBE3C9OGJAgwaSlYliSa3nwy4Ny4+iwFpW/
         zIp/adEiwuOW3pglhAyaSrYO3zp1iNjM29NdDfyl8FR6YV53JtswBCFHU6V2LNeJH57d
         gklLAPQDzvVjQNdhVh9Q0jYMPNYdXw7TF2cNVuu2axPYah/FGlc/VqMOdx0ZTxJ9xQDT
         Y0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779729567; x=1780334367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUOvn3MZp/wvYfz05jfdn7SBbQ984RFb/LCTbznHnzs=;
        b=ZezBEjuDZCuDsOgnQ2WMz1qLRGMG0ffXs8G7HyCxieKsgO6VVqoy0uF2TYm3U7RE9q
         Mhrcd57+5ehqKG7ShHH+VDR/IiYQVRZ0lEEYlA4oa6j0Egjj5nvULm6xvO+Ejw7ZfduG
         xhNvIGubg0RVqrCWWbuJSyl/lFWseWHWqyWpzlJHqLlGrla2GMByDO7O4fgapeiQa9Vj
         sVrOsXQqdx/N6nZzI4dQRJLZjw+l0VfNPSMeeagD3RDtZmJKMR2blyfMZDQXyPiDtS1v
         4czF8rbIas9z1sd/jYo7j2WTn0l4/go5lE0ti3gRlZf6H8WqXhSJEaifLMTeBcAG4Lxg
         /Enw==
X-Forwarded-Encrypted: i=1; AFNElJ8pWWNXwYZf8UZzGHhI4dbrbRLj578Esy0nAufjSavxfqicd+bfQZsUai02CB81QPx7VZdNMoyUQcBORjpp@vger.kernel.org
X-Gm-Message-State: AOJu0YxE39RSJRMIl3NUqRpw0kQGE3ZRgl5WdOjCOhwi2E7eCgeBns1R
	WDCfIduNxzGpwdxVFUUjtLTgVBtSwNWbgTc9wHmENXnWfGLmY32roid1ZixazxQKHdlnVWsv9Fg
	alY0zZSkrXqBy8G19stOSazZ1KwquBaPRTf2hX4beJ1XpqPN/FcfHLS1J5/KVwCSHQdIo
X-Gm-Gg: Acq92OGP9zIvQ+BgLZvUmInIMPsUy7LahP/Vpfnfeel9P/+lMs/caoLY+Ci3PyhvM44
	wG0mMzHgR4hDz4lprUVz6xX1+yEXRy1Lm9HCsBriNu3krftkVeS3V/po6vTjLmdolaHXKpQkLg5
	nUZm8jLhtv+h91CIYOg6Xpf7vqNur4nSUPcqMogIzO8KG3+2yVcj8KqkV+3hTL5XnxCOiCBv6V0
	EHYddMwQsMUiW827iNW40Ajrugjur7yXBQtTwJLqz78/KtHnLef97YQKlrJHAYArtYzv8eQCh0t
	LcUlZlv5ggOZC9sLuU6mAsN77xwNt2QwNhyFLnohARqpk6+6FtbOlbjjrRQTdU3/Wuz12GK69u4
	QLT+cTAq9TFLRkYrX6GKA6cARBPz6yFlZa32ANdmXFVZ6ZYqkPtVNw/+MkwYPRgOA
X-Received: by 2002:a05:6a00:2d8c:b0:838:9e25:f128 with SMTP id d2e1a72fcca58-8415f32f29dmr14561539b3a.26.1779729566593;
        Mon, 25 May 2026 10:19:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8c:b0:838:9e25:f128 with SMTP id d2e1a72fcca58-8415f32f29dmr14561519b3a.26.1779729566092;
        Mon, 25 May 2026 10:19:26 -0700 (PDT)
Received: from [192.168.1.6] ([122.164.82.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea09a9sm11481158b3a.31.2026.05.25.10.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 10:19:25 -0700 (PDT)
Message-ID: <4358d0b5-48ae-49f2-a50c-115a54958505@oss.qualcomm.com>
Date: Mon, 25 May 2026 22:49:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
 <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
 <005d1637-ec56-4f4e-be99-04386efc2524@oss.qualcomm.com>
 <sv6sja7rdwz6ke525e46zpfmtp4wht2vboxwwpyjnmiezibhhm@pbuvqlpkjpb7>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <sv6sja7rdwz6ke525e46zpfmtp4wht2vboxwwpyjnmiezibhhm@pbuvqlpkjpb7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a14849f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=oxN+qIFH97EF7WOLwtTw/A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3oT0bc5pQZFKanLxOPEA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: MYrv1EnjoUamV4t7W8f6qXQTLc4qX5pX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE3NCBTYWx0ZWRfX7q+mQFv9/Quz
 4W0WLggNF8Sc4ChshHYUFrQjyas5XeuVrs/KQPc8nxE/ohYnWbX6+zlkSLSOlMSeAtxSo8riTtt
 ege48tD1S5bMxYUK8ZmEuLzPHQvsO+PXUpsxJ9C48/UXGb6rXxzM7XDE9bpP1ZPHXWUgIhpIkRj
 klcau5ymFc6BWEw57hQScZ+GeMxk/E66Zf9cAD5KhpKxYCgxOYUOx/eyhfwZ58+5h5j9++M1ang
 hkZM8g8KHfw3F/+suMuQYzUxcDoB7xRO4ePu1IDeTz9ePHXawfWq2Pvvv+g/oWANSXiXw51XZmm
 cG5sfjwx/dTEsm+AMDS57H60QYuDy9ROv8gyAl+KVvZxClyf4bZL0H3O9LCNeH4LjdGsWDS0u6n
 dt3yuJEOfgJJbSMPwM5yWDRlZRnmoygD5pVjTkhZ1mIEUobGxOjNggnnA0LUh9E0iu9sUDxWhSc
 +BMgWaaHENKRiys0kYQ==
X-Proofpoint-GUID: MYrv1EnjoUamV4t7W8f6qXQTLc4qX5pX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250174
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109692-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 990DC5CD42C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/25/2026 8:55 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 08:35:16PM +0530, Kathiravan Thirumoorthy wrote:
>> On 5/25/2026 3:39 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 25, 2026 at 03:07:17PM +0530, Kathiravan Thirumoorthy wrote:
>>>> Now that Linux has the consumer for the GPLL4, drop the
>>> what is the consumer? When was it added?
>> PCIe and USB are the major consumers, which got added with the below commits
>> and landed in v6.16 and v6.14 respectively.
>>
>> ab7f31a3830d ("arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller
>> nodes")
>>
>> 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
>>
>> While I was revisiting the code found that this flag is not removed. Hence I
>> sent this.
>>
>> Shall I reword the commit message as below for the next spin?
>>
>> --
>>
>> Since PCIe and USB are enabled and consume GPLL4, there is no need to
>> keep the CLK_IGNORE_UNUSED flag. Drop it.
> Yes, it would be perfect. BTW: what happens if both are disabled (or not
> probed at the boot time)?

Until all the drivers probed, icc_sync_state() will not disable the ICC 
clocks which will in turn keep GPLL4 in ON state. If we disable the 
nodes, then system will go for the reboot without much information.

>
>

