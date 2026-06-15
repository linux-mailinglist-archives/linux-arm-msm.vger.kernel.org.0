Return-Path: <linux-arm-msm+bounces-113075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5AjCE5eNL2orCQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:28:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4553683767
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:28:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l4GImhbw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h3G+aZ7Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113075-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113075-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98CC43005E9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA69830D406;
	Mon, 15 Jun 2026 05:28:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A8030BB9B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:28:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501331; cv=none; b=h5XBTGLAMPn8rk3JiNK0cw83wCm5cjgIY7B4YMmy8dCU01qclg90LrKWF/ZAd6ZflZKmJ1F6wdd5hegqOr65WGQDc3F+iysYAZYip7GoW3Ohs4whI5noeDl6JW1KtXReT4uLAQQvXoDyThlinrCueYk/qYWnYUwFweIX5bKqsDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501331; c=relaxed/simple;
	bh=y+9qGGf9I7M0vXpGsLYvrL/yp40vASpNdDvaPz1CKzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRjMtm02kYrYZesYGGYtNCvUlCWPd8m+jZdyR9B8+JbW/vOHyQH+Ik93GvgkaKkeENX7mJV5qgfOz5xoUixOKsUMZKhY4eBUJ7j3mvPulXlTdRMtym6GVeBkI25H/MJmxb4rKiOv/qmwNZ2eX0YIc4oZxVsBHXlEF3fJKO9WsJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4GImhbw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3G+aZ7Y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kWJk3224660
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xy7PoIFIEAfKj2xhVR5iaBKwFGuA4+3dDr2MGzLFWsY=; b=l4GImhbw5tzzh3AS
	90I2DPhx4eJ4I3z3JgqnQFCIbVe5VgiBfm1+nMxLFVTl6WHDfCFrrE6yV+F92pd8
	bYxgfHAVorAmoHO5SxxGxktejjGML7bgtJe6/F9e4PVpBz8C9vCybG5PoDeAyT0u
	1J32o2VgJLJP9yXjRafe5I+EJatKQc8biLWr2wVpOSQQ/2jSesjuQsd+7tA8Xt73
	Qu1EN3ykf1fOOAUvwpteXLJ/w4L9Qt+qbkdACIEB/9Z2AonPL3UQIjnOTMeGOx0D
	iqXumfyKooTkhJn2P37wGLn2hf/DZ1lzifBDu7gByU8oFHs3RJUBGLi9gRa8La4C
	qisFLQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u5nt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:28:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-308004a2c49so824351eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 22:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501326; x=1782106126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xy7PoIFIEAfKj2xhVR5iaBKwFGuA4+3dDr2MGzLFWsY=;
        b=h3G+aZ7YJS8ki8q3eiraSigBGhLrftUpZ7K1U8nbLHowxZ0WjZ/Rg+84lp2iS7+P0G
         +qOM9NOLBFOOFfp3773gYsIq8KTwDzkTsa2L15L5mOQxbZD4JyoVm9FZer/pB5GU+cxw
         RQoKrIvfbIpaS40U6N3rr5ArEez0auQ5xREi3mOKFsAITskQdw88MCUdivYyHgKQtcgR
         TUG+eFgFE9ZbMcgljyOG90ygcxKO5efajTelewyglSOtgg85T3XIAAO/nhH91rcdeYB/
         jko7wrbtAM++BAh4+zj2bBVMPYIUWx7oAFqNdT+VsLPozGDIWdm9EL8A+hIdpgoEs9aG
         dKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501326; x=1782106126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xy7PoIFIEAfKj2xhVR5iaBKwFGuA4+3dDr2MGzLFWsY=;
        b=bjoCuTkJJhfyPY+VkbhQ60vHA6IezO+hETc1A3firF2SSe+UOQXzhiJwU0D/khrgVw
         mZLCkjMTmO4n0GX7m5ESxbHPPgeSd8+BToMO55Qp+VNmB1vIy4Wn0TfZn0ITaLgWTGwm
         3evulAHqT0NJd+isDJMHnkD5WJwYO+VWT0DLtbmPznHYSAyvMYeT/9xDoevtkStDtrb+
         eQKj/qh27CsRnYErlCTx1h0+QhbzDmS+7CmUlDnFN0caNp0y1RwFN2FAmr+x6YEz/fTv
         1BaWjSqKdb3664c7LcpHIe8/bKTylaq1HXTeytZftvsXp6i7IZp48Rai5TmE1tWYNF0N
         Uobg==
X-Gm-Message-State: AOJu0YysQJLtYNkaibI53l/V6v6+mn71gZNp6P6eeACVDLei2w/LnjE8
	OI9kcpEIMZeDz+e6uJAAxHRo84Qc8KmpNm5mOrECF6BKa277Xij4odYDdLdGfv93RXcDuz6sqM4
	V73avYemEE+cMXfj1aHFepBem/2F2pbo99ALjDxSJxvVMYpqgVyp31bTUFnOFZtTtbjsqUEG4I0
	xR
X-Gm-Gg: Acq92OGeyenMLvy6WZN4UNyHJCO1pKoFmJ98eVPETPxTdiPiwVml6zJcrzmuDLXWonk
	YaM2Z6z6lVMxG+EjaK8ql0jWIkFif9jyZvW5xufZijx4pzYQE2FFXiv1u121dxyvXmwiLVhUWQv
	MAjV8B8MIcYX5QC2wZz0RiCcAONrde/lHwnAFNW3AO2uurby5hcqcQXlK96t2Sds/jRcboHiRCR
	uJBYvwslttGXghMsahsTl8Hi4nT4oqe4Bprly2Ge0WBZ0EqqslBxZEbTWxCJwPwpo+3JL6//20V
	XxSejSUiWkUvY67uGkhj/jjVgik+hPy51mkdLQRqoYi877+sTXyIU1tONb6f0hwiLmkTQ+aMcHt
	F7Z0YbZtg7cZozwKLj5HT7wq8D91fWcPO9x7KIYLOt+pb+k1u+C5dS1I=
X-Received: by 2002:a05:7300:8c09:b0:2ed:e12:3773 with SMTP id 5a478bee46e88-308201edd23mr7493779eec.35.1781501326087;
        Sun, 14 Jun 2026 22:28:46 -0700 (PDT)
X-Received: by 2002:a05:7300:8c09:b0:2ed:e12:3773 with SMTP id 5a478bee46e88-308201edd23mr7493765eec.35.1781501325528;
        Sun, 14 Jun 2026 22:28:45 -0700 (PDT)
Received: from [192.168.1.14] ([122.183.32.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm14678962eec.8.2026.06.14.22.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:28:45 -0700 (PDT)
Message-ID: <a8abd808-7b78-405e-9290-45052ab1fb5f@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 10:58:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: geni-se: Increase MAX_GENI_CFG_RAMn_CNT to
 1020
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com>
 <09fb9e91-2585-4cb5-8bfb-92df304e9d6c@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <09fb9e91-2585-4cb5-8bfb-92df304e9d6c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2f8d8f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=VoxE8481/GqLGjIQlfxg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2tl5gsjNwxIOEu-Ph74A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ErQr5u24x_zWxW6J-GAlhJerj-xq-CW9
X-Proofpoint-ORIG-GUID: ErQr5u24x_zWxW6J-GAlhJerj-xq-CW9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NSBTYWx0ZWRfXwFex2gtglA69
 38lWuzuXLQZ5vIaRX3THUfh3oWzX34YTqO5WAEj0i31I8ci/WyfXVz+mvolfhMPkpEsgAmsXhzd
 H7S8NuFq/b3qpnO1SnTGUaUHzNHJpZ56nGEdx9/4hqn0dyar0RSiCJSdAN29S1kPmxzIhi90QrK
 7t1isgQCnzQzQYVYO2jkxIGjF5vtfBkmFrnyIpIA8kBwqLigWQNCqIe1EeGbSBnXOMHqnLCyCgt
 upQE2/yI7djFe/e+vUjIPMSADe/lmbHncw64/CbqxMmBVJ4uIRWM4ARjhgcj5kLkGzdTmUT9CP7
 fiXWI4tAR4xeHZQ9/TXKMyBfmYGn4Vt+4gi1UcMX/A2TomuUUSxmSOMmXk6vRFNocWjdiiFGDlr
 XU0Gu6aZPvxIPnpxPXYwGq98+HlxpgSAhxXT0PhH178xpgEXtytGvn5g4tStNd2nFgHwMuBfSLY
 YRjfeQClnICyMaInAZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NSBTYWx0ZWRfX0yWXtV5xdsJy
 Qs5hU6Z6rCsfQSroOVDsTghAo9HmrG6hEzrtVAul+R9OcD89Czb+w27sI/WCB06FqcqGBdL575d
 SmLp8DoXzfkpJCS7uEtcRG8bS8CFK5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113075-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4553683767



On 6/9/2026 8:40 PM, Konrad Dybcio wrote:
> On 5/22/26 9:21 AM, Viken Dadhaniya wrote:
>> The current MAX_GENI_CFG_RAMn_CNT value of 455 is insufficient for
>> certain Qualcomm SoCs whose GENI firmware requires up to 1020 RAM
>> entries, causing incorrect bounds checking and preventing firmware
>> loading on those targets.
>>
>> Increase MAX_GENI_CFG_RAMn_CNT to 1020 to match the hardware-supported
>> limit and ensure correct handling of configuration RAM regions across
>> GENI-based SE blocks.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/qcom-geni-se.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index cd1779b6a91a..d0810960f3da 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -152,7 +152,7 @@ struct se_fw_hdr {
>>  /*Magic numbers*/
>>  #define SE_MAGIC_NUM			0x57464553
>>  
>> -#define MAX_GENI_CFG_RAMn_CNT		455
>> +#define MAX_GENI_CFG_RAMn_CNT		1020
> 
> Is there any SoC where this could overflow the register space
> (you say "certain Qualcomm SoCs")?

Yes, on Talos (QCS615), the firmware image needs more than 455 CFG RAM
entries, so the previous limit could overflow.

> 
> Konrad


