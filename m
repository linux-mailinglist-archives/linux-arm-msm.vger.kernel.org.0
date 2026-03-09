Return-Path: <linux-arm-msm+bounces-96211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HuoDyaormkFHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:59:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C0237783
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0A2A302B807
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B928E394488;
	Mon,  9 Mar 2026 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAxQJJIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e45KddOV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03BD393DF2
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053925; cv=none; b=tC2OTI2kpKcMihgXm/qooI3klGd7A+m1L3kiYzRmsmaqkXwdF240TstlDWTLkSdgbFFZhdAlzZM10RnTxkTdcSUo8v0Zwxyrzylv5fqPjUTO6P/vjA3IxX48oBuVlauzH5a4RAkScnznpvIE49B/UNsq3yjZxQfJSiH067JpuuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053925; c=relaxed/simple;
	bh=cPN17tanCuxHIPt66ZVlk+Nknuel7E6wQZegu2AGcWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBG12fm89Mr7ujWlZHEyU7nylIlyFTqHbGMQE0ezflKObu9chXkSf0AXn4dwvVPqCioptWMc1n0ZE6SFAIItkrWkur5UCQ/nhCi/kiSrhwDYa9rSrFkTRyZ/RUHkp995YsMyIf16CJQ84k5rnpmy41OqbtcN819VQZ6eFfpVs94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAxQJJIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e45KddOV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WECc3773310
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gUAH7KxJegFfyFOxkYyD1UGTu3CJ30xhCcw3r4MXq74=; b=KAxQJJIxo2SEUFx3
	PIATAFuPWplP/0xqsR6o2g05LgCnzHl9kaxNKIfgsCU+uK4I/whIQDjdXF4MhGix
	pleiumRQFVPUzzwek1pCojqUv+u73DAPEktn+n+cw7OgtaZaLWdoBq+MWDiOgRHv
	mq0lyr0AvL1g0clFYH2GWg8ZWBhBFukLB3A1KNUn9Sf/xqBOSCY9qWmC0s9Zk0g/
	K3HVCT+R0jhETNDRvWtNdDm2OqkXAo83jVaVNPuMeqPfmt/oebz7gmqIAbu7tXMF
	cyTQoL8YtvADq5OHxo/Xt7eZw38Ltm9rblDflcipNRhxSGThDfEIHhrCs7FH5Iph
	A5H6Bw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8gyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:58:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899efdcdb70so48730086d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773053920; x=1773658720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUAH7KxJegFfyFOxkYyD1UGTu3CJ30xhCcw3r4MXq74=;
        b=e45KddOVbH9vE7KM8SRyFxrDQ06Tlne5DoIol0NevjYybaFEyQiCP62pSe3YoCZ823
         fDttU4+YtIGk8WlYcEi+Ku9J0yOkNJh0AbOVXxwsKVtQpXX3GrEUYdVrs/dgZqahy3py
         AJjx2aC6xjMt1rrtnejtQtv+psmDKDIWcl9kLBi3FR1IzxinwtFpMVq3WE1jcoAeeoxW
         jWWhRYyCnEb8Cf7wnJbbnrTQXInIYpZQSjwtj0oJU3JF0GCLoMCtrHZq/e9+rBftThpm
         rqa0REAdG5CSIKxaDAo5yJVWc9ctAEEtA+dY8lvDxictXexsh5K9xrLaFbgQIeIeXg4m
         ZOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053920; x=1773658720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUAH7KxJegFfyFOxkYyD1UGTu3CJ30xhCcw3r4MXq74=;
        b=DLnw/NwyrmgmSOItQFYlOhLFUEFv5O1jzCUqui03jUK0Gdfr9RX32sM2npxx5KZemx
         6vBGdNFF+oHzoMAW6ssUeVshN1yB0H9b/t0l6q+IJhj52jmcCIlcOc92Ckec8GPjajYl
         3M9cB3//VKctHQUUyEGT5gb/+EMuqTGeIXuXSAS3ye5jDZTijQjJLVhq4mrzmHuD3hm1
         UfyzWdQbyhSeyaso19jd6v+sAbpbEYcW47/SYIq08HTcBCblQaZJWBCHPFYZNohres3C
         xYGBjKLv0VRW06qNUSj58AawWJi6/TMoSGxNSfnZoG1o5PgvYlcEQuYJCxjk0/kGfbQn
         pNFg==
X-Gm-Message-State: AOJu0YzCk0RrWKesxVT3dARLO3UQmj4vkxYOQ3IvUiD9DLOadjdl/KHC
	7TOc+mYBJZyIOrrGY7MAHkeuhDDVxeHfOu7osDKoKZY/Zedtq5uIpMBzhy/9uj3ZFGUS2m6soVo
	r5dA/lmwE00yhid79x8g325n7JxSSnfMsrndKTkX/n6WqIgfO8SNAt7arYgSg6kRvxw/Ilk5654
	9u
X-Gm-Gg: ATEYQzyv5Hzc2Ao6XFzBPDW5CDee0OcUsipWraV2jPc2MAis3CvmJ8YfjWR2zcIc9sk
	f7s9T3cBhbzW1h0KlQb6A4BBxQ/D7desEY5W0NT9lebs974otPMGIaA7nv8QPVHaIkRGrjEkjLf
	UdUaqbg/iHDwchxvxEw8Xguy7c9NgLJfJm3/A6/8Uyqi8+HtFT4p0bJaTpmoNVRZ1oTLAW5yTom
	i0Tt1yEdXtafSd4jZ8gh0FUx7zp/cxUJNjAdmNjW+OdpbhNO9K+VO7e+s++8PFBO0C1pmt0supn
	tdQwd6CpmmgDhrKeGHydYJY6VXufvT+nNF9hV3qt+55wHYg92DiBNyGvV0WK/HQtjOZyj2HCsQO
	PB1FzrDenZQ8ryeNHJfE3iUyK5GPKw8AVXUf+iR6rO/T4VIy1leaPWepy97zWxrifrZtZOYGxac
	Qj0ac=
X-Received: by 2002:a05:6214:8016:b0:89a:4741:2147 with SMTP id 6a1803df08f44-89a4741260fmr40404616d6.8.1773053919939;
        Mon, 09 Mar 2026 03:58:39 -0700 (PDT)
X-Received: by 2002:a05:6214:8016:b0:89a:4741:2147 with SMTP id 6a1803df08f44-89a4741260fmr40404486d6.8.1773053919590;
        Mon, 09 Mar 2026 03:58:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f18929fsm353834566b.60.2026.03.09.03.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 03:58:38 -0700 (PDT)
Message-ID: <f99e2069-3005-4a30-a4b2-ae89cfc6f94d@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 11:58:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected
 edge case
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jack Pham <jack.pham@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260306-topic-pgaltmode_fixup-v1-1-ec154b2d8e89@oss.qualcomm.com>
 <7fcbf142-f2c6-4b9e-bb63-befa553aceff@linaro.org>
 <f8c968d0-0668-424f-9f5d-8ddd1b6f3fab@oss.qualcomm.com>
 <0af1c6d9-2408-4111-8738-5eea2c5d42f1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0af1c6d9-2408-4111-8738-5eea2c5d42f1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 31NGS5m4bNuTqrExblzpSFd01b_8gUnM
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aea7e0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=mZ143PVFjIVEdXETRk4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMSBTYWx0ZWRfX2QeSHWskl9A0
 m1Htle7by5uluWRTcogTsBLdgdXgfVuFFZjI226nV6wmsnQExNZeNvlAVN8XEn0hOMvu2pl2VAA
 /itxbUaI7sAlBUVtEnMwW1oKxpajAFlMD7XpCt1Rdh6iAjsDmIFtUriE6qID1NDPk+U8bet99ot
 ND6XK6FZfVzg1F1krcvzMPsBNXUUIc5zSfvnrJDFt/WwgoCxA3SMvs70+Te7JXDLRm4wF2uO8Y6
 EA96HyvXra/2LoxaHAb8cGaqtTmrru+NrRwwZEStpSjHFIPFDqE+7PoeGFErAEqnHxrx6o6iCco
 7vUU8Fhv7k07to4H2uTDQcFR+WbxJULfy29Wx6+uz6qkqgGzlQmmlGPsBebPTWhtxQSSY/He/Ls
 5bQQu+XSOQiQQQ8GxM+sujr89zUTm6geFKehiUv0Qv0lR3Yvq9YfAISGoPUyfoknzx14UQuVZn3
 9g0ejB92RrAGm9rEP8Q==
X-Proofpoint-ORIG-GUID: 31NGS5m4bNuTqrExblzpSFd01b_8gUnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090101
X-Rspamd-Queue-Id: B70C0237783
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96211-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 11:43 AM, Neil Armstrong wrote:
> On 3/9/26 11:38, Konrad Dybcio wrote:
>> On 3/6/26 3:47 PM, Neil Armstrong wrote:
>>> On 3/6/26 12:20, Konrad Dybcio wrote:[...]
>>
>>> So what's the difference with :
>>>
>>>
>>> if (blah)
>>>      ...
>>> else (alt_port->svid == USB_TYPEC_DP_SID) {
>>>      if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN)
>>>          pmic_glink_altmode_safe()
>>>      else
>>>          pmic_glink_altmode_enable_dp
>>> }
>>> else (blah)
>>>      ...
>>> else (blah)
>>>      ...
>>> else (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN)
>>>      pmic_glink_altmode_safe()
>>>
>>>
>>> Before, if mux_ctrl was MUX_CTRL_STATE_NO_CONN, it would set to safe mode whatever the svid,
>>> now it's either in the DP case or at the end.
>>>
>>> I don't see the difference here, except if your desire is to ignore
>>> the MUX_CTRL_STATE_NO_CONN for USB_TYPEC_TBT_SID and MUX_CTRL_STATE_TUNNELING.
>>>
>>> But it doesn't match the commit message at all.
>>
>>
>> The difference is the call to drm_aux_hpd_bridge_notify() in the DP
>> case, which isn't very visible in the patch diff.
> 
> Oh I see it now thx, but with this change MUX_CTRL_STATE_NO_CONN will be ignored for USB_TYPEC_TBT_SID and MUX_CTRL_STATE_TUNNELING.

Both are very much intended

For TBT SVID, it can only show up if STATE_TUNNELING

In the other case, STATE_TUNNELING and STATE_NO_CONN appear in the same
field, so only one of them can be present at once


Actually that's why I made the mistake of ignoring the DP case in the first
place - I assumed NO_CONN must not be valid with any active (alt)mode, but
the DP path was wired up in this.. interesting.. way

Konrad

