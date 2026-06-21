Return-Path: <linux-arm-msm+bounces-113902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4vRwJm/nN2rKVQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:30:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C1A6AAE7E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:30:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RwESrxfL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iL+Auq3W;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113902-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113902-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2A043002538
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 13:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F97288C96;
	Sun, 21 Jun 2026 13:30:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049A21A683E
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:30:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048617; cv=none; b=KlHAtkDXHYtaG9glSBvHzfiALskuneTQLIZegpT+6XaZp058hytS0fLdEOPLC1h65dbRjXQoDY+VZi7HRiRHM+ap2CWTslFQCCA6GgeOJjCxb6utCjWvyJ9yr8/R197BqA694OSSYa7+jlg5ajNUidxeUVbO801lcOmO4J0r08M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048617; c=relaxed/simple;
	bh=8cbUGgsxKSC1MosOzLSv58OI0oScNcI0OsWE55RtOVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R39d7FQaCmH4bzv2Alu0DtdRMJpz0odjCa/SbAvXqt3GXfxejHMScgjwpPAhWrQs1SdLG0VWtYaGx7F3FcVL3wMBkZZxRbvqIliCgK/IygaNETNUp4PiFzBU8ku5bhHCBDTBawsq5FCM32+oLhg3ADgbtn5yCYyeE8/a1B2L1Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwESrxfL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iL+Auq3W; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9uVjU1807700
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcGFFDhIT8I2MwEThVaHfMmLB4gR8uedol/bFjJD1CY=; b=RwESrxfLLAWZnKhV
	F0wWz1x+iRvrtEs/NucURh27ygXAkr4I2W+HtExNf49hIa2U/vH8qHbeaxWRFWXe
	WBz5flDCqDcqVN65c1/2OXx4hQw+4YlCEUjRe6+tZ2qx99LY/XJFPeBOEX1aUzHF
	rUwhzuUMaidJbDeKwjno/andMMNquZPoU00+nTa0hrl/dzc+imkmTbdBynJCdwIy
	sod1Frarz/7lCOq+cTDq5EYPMFN8vk0jWPhj0hbYGgN2DRWlA97W9+XSV0cLUqMH
	4oxJOBC7gVlZjS0cogQRLV4PxNZP5D9fwMoOxqi4KcbfMLA0tfI00tLoM+cPQnC2
	J0jHqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk8830re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:30:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6a48fb4d5so30947655ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048614; x=1782653414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcGFFDhIT8I2MwEThVaHfMmLB4gR8uedol/bFjJD1CY=;
        b=iL+Auq3WnLMYw/9GTFsBWBTfukUg1FmOTzlwLVU2/AhuKHHlvZn+nycs4NXyd7vSb4
         R8utCT0UXINZuJUeRqSZAcorScj5lN/7VwuQSSR5KrhJnDrZ8rq8BFUJavGQxnElZgTH
         hJeOzVB0U0+goKsZgw2eYpFsaZXQgNPC1LpyxZ2Aa25/Ob3WUUSa2s//r8nhcvtUxJo1
         G5cJAj1P0LJKQ0FsdJrMOQ05BO1SJTdo8TBmVpSKP0EgFUVsbj0qxaUeQg3YVLj/Dx5/
         RQwpX2SftDQJ+qPqTUIv4kMi8xR+YtVPZ+HrOt1FgWoNbTM4CuTceCnkKNHJ7eaKNwGR
         S5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048614; x=1782653414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcGFFDhIT8I2MwEThVaHfMmLB4gR8uedol/bFjJD1CY=;
        b=lx4E5km8NGJavGqYQZDdOMgUHbd4V4y2Csla1AUWDmbXcXzKOZgPeBdc+3GgQsVM9U
         705n4ZphLmy+K4ZciARzd3Bx7EaTA7iQ1bwVQi2TubUJPr7us7BFvFS329XukSXpOOcm
         43gmTQZIPixGLPacIpXQhhxDBZHoTUS6f5wEH+NRuWkFmgWITJeddJyAIhBpJQDo03Xk
         A1Qq0Q+Jf9dQrMfdXgiKgev0CrxvuE21HlvcKu1VBolQ9v2kQMCfmaX3KD4aB68ff318
         aJ6dxVpnJi5XQXKqrIZhEstf/+2iwZF/+a0zHG2vIlMZyG5fp5SJiErtZ4CLFioncuc+
         3G+A==
X-Forwarded-Encrypted: i=1; AHgh+RroKIVeg+7s7qqn5ejdf6fIhuEpbqolP17X2kIewhexu1cSpjvn6iazjDwCqWGLLay14up6kKEcvtB05VrV@vger.kernel.org
X-Gm-Message-State: AOJu0YzonRLFjdNwk/WuYsoQ4T0hj1H7RDM46WeQsEi4CfrZp0LFcJ6c
	/5Ag7m3BQxBQaYWGuo3X/HD/igqb1+n0FZ2JYfw/AqiS7WZ5quNHaHWwudD7m4PP58hExV3MFxd
	F2k2keT5DLhMuvRs8L+46jDcrQwQ4frRJAIya+fnPdTtrOy/6AWYISSQ2c/MZXOXtyWN/
X-Gm-Gg: AfdE7cnyXjnzFA5OQA3mBfS4LLlchlOsaGz1QOHhZ4bN87c1mCrub2jcCQxC9nNikUP
	IN5stA2fi03srdEt7jXELQQ/XLJStDKs8CA+40n45nUmdDgotf4wOqvgRxolL2+jr0MtJmazkFu
	bZHRj7EEpnU8Odwt7588DH+zH1WgEcLFKU6IEADSlNwx9R3TcAlgACD3wuS/sF+zEe6tIpLsK/l
	jD38fGBRtgXZAbWOQQWP+avykkfUCjEvcNGmmul50QVUiSbMgdG7RxDoAWQN5suXETtawKhUTic
	2YTcKrpqs4K78LFBVnULHlEGSg6lM6zyUG1wxtigjTuIuDmlL5r/xYrgsysyY4XLfXEVtSnaIg6
	/QBUf1vfQO3iNV+es9TohgOkBH+LNr+gDMsBO+66n
X-Received: by 2002:a17:903:ac7:b0:2c7:9b17:668d with SMTP id d9443c01a7336-2c79b176c3cmr2748485ad.2.1782048613800;
        Sun, 21 Jun 2026 06:30:13 -0700 (PDT)
X-Received: by 2002:a17:903:ac7:b0:2c7:9b17:668d with SMTP id d9443c01a7336-2c79b176c3cmr2748165ad.2.1782048613351;
        Sun, 21 Jun 2026 06:30:13 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7435bad30sm48870885ad.12.2026.06.21.06.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:30:12 -0700 (PDT)
Message-ID: <b4fae057-08bf-459b-a482-33ec81d88c9e@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:00:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-6-8204f1029311@oss.qualcomm.com>
 <20260605-aspiring-ambrosial-squirrel-a7ef63@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260605-aspiring-ambrosial-squirrel-a7ef63@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfXzOk4IEbU06uX
 HTH4AMEYX0QMFGYMu5ULz5w+cgnq4FMzyRJmsbghjmXSnm+Yt7M8gsxW4zHNGOxBvKrOFOsU6Ng
 KxnJglJfkaqQZZGn8NNj92F1JQpcN9mdnQHavvUeWgYL0xJMyN0iLjy/Xs408cq81FvsuTNE1S8
 nj53/95WYK8M2gSABuLrq0GBa8KBoFw2V2wyXwVGP/IEfEFgl7D+cZ4feTF99fewfNraK530aNa
 S4FwE+2WSRkDCGhWa3L91VXo+AXenetjU/rCZrguNUbsYdqxDnhwLPxBh6GAI9Nja0BWjlSZrxa
 bHGseAcD8uZgPChw6AMCM77kVXfYDBjWIk2/L7XSUs+oy+9u7wVFwNkxG7RCnRk3JfyvLZ2L5xY
 P08enSrAuZ3F5AAuiOvGvgxyj+cpXyXtfQo3jFoNt8/yJS53GoqL7QV9px8LEigi12Jvqg47+UU
 J6d4AmhCkOdnbSZIOiw==
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a37e766 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BjiN3Y7BKkz1kp-VNcwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: CtGa5ilGXB4vE3_JUo-2tKlcKXYLKUhg
X-Proofpoint-ORIG-GUID: CtGa5ilGXB4vE3_JUo-2tKlcKXYLKUhg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX+6a+fEVsNepn
 ri93faEYqkmQn0LyCrElcb7k58rQ6B/wcJg1IXIk1RCyFyFHS+R9fFxfho73ul1tkTTNWtgm4im
 iwhBe32fY5CAXdr50rzQTqz2U92kVxU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113902-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95C1A6AAE7E



On 05-06-2026 03:58 pm, Krzysztof Kozlowski wrote:
> On Thu, Jun 04, 2026 at 10:56:12AM +0530, Imran Shaik wrote:
>> Update the QCM2290 DISPCC driver to use the DT index based parent clock
>> lookup to align with the latest convention. While at it, fix the parent
>> data of mdss ahb/mdp clocks to use GPLL0 main output as per HW clock plan,
>> and update frequency table accordingly. Also, add the DSI1 PHY PLL input
>> clocks support.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 44 ++++++++++++++++++++++++++-------------
>>   1 file changed, 30 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index 1c21267ae0f7a86c1de88e888c2a990c35f0a0e0..f5dbd19d0a0334362a44f91a69229cb0f018f309 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -24,6 +24,18 @@
>>   #include "gdsc.h"
>>   #include "reset.h"
>>   
>> +enum {
>> +	DT_BI_TCXO,
>> +	DT_BI_TCXO_AO,
>> +	DT_GPLL0_OUT_DIV,
>> +	DT_GPLL0,
>> +	DT_DSI0_PHY_PLL_OUT_BYTECLK,
>> +	DT_DSI0_PHY_PLL_OUT_DSICLK,
>> +	DT_DSI1_PHY_PLL_OUT_BYTECLK,
>> +	DT_DSI1_PHY_PLL_OUT_DSICLK,
>> +	DT_SLEEP_CLK,
>> +};
>> +
>>   enum {
>>   	P_BI_TCXO,
>>   	P_BI_TCXO_AO,
>> @@ -33,6 +45,8 @@ enum {
>>   	P_GPLL0_OUT_DIV,
>>   	P_GPLL0_OUT_MAIN,
>>   	P_SLEEP_CLK,
>> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
>> +	P_DSI1_PHY_PLL_OUT_DSICLK,
> 
> You just added new parents which looks like clear ABI break disguised as
> "switch to DT".
> 
> First, don't mix independent changes. Second, ABI changes must be
> clearly documented and your first commits even tell false statements
> claiming there is juet "extension".
> 
> Did you test THIS EXACTLY patch on existing devices?
> 

Yes functionally it works, as these missing external DSI1 clocks are not 
used but present in the DISPCC hardware. I will split the patches as 
suggested.

Thanks,
Imran


