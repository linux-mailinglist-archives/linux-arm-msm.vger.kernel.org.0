Return-Path: <linux-arm-msm+bounces-113147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W0M+G/TJL2qaGQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:46:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 70331685296
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:46:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UymCYjNc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YPYqjjW1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113147-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113147-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A24883004C96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8093DB30F;
	Mon, 15 Jun 2026 09:46:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E527C3DB655
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:46:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516784; cv=none; b=fCT+0itSbefnZ0Gx2EiZnmHImr4ZdB+gOgXJFBbSca4eoTcmVtt1fedzc6wrl7AU0z1SUd5zfn57XPMcB/7n0BegEB0hALDYQ+c3zH2Qn0RwtGcTVXAYE5r74zl/gdG4CsX1wLLll7/+KEWY6l13cu/Ee3Yme3NQ3lnbnIaRXus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516784; c=relaxed/simple;
	bh=RfHlJyVY3qOQ1gvEl60Xwl3FcvFNo2dgj1KhjcIFKxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rO09oohN7DhiFA23l5BAJ0fy8wQZMiw0HGOjyXkl5iHdIOFI78Sbu2uyTOaeakTL0xiOG7CMBWmmipgitEIB0bF6bdkBNIPcexOEgrQ0zMWxNQnUVsslUlTTVPqWge6KJb9XVzix0CmbTn5G3VEcfFuBMApk9Sn1GCX+G216Wf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UymCYjNc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPYqjjW1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F9ZB2i3819054
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7cxzz2bMuaIGQXwrnW+Ls6KtkN6+BZuFlXPJCuStfM=; b=UymCYjNcWzxqFDi9
	tF0Dk421TzOUACQRVE/wKL7m0+ifqJ//5FDRjG4cHfwIF14ZbFEVJJSuYweeLNbG
	aIeq0qaFAnRUTJwxE6eGggfC8QKBIsSNBc0jkVdXzIkyqttrShDP9bK3A0/rOenI
	a0fWei7+NviBNAKwlD3F13oyxEfKxmu6J1g0OrTsQg1t4yKA+qaSV/Siup0zSzYb
	52uhAUpkY7HFKXkOFXBZlVmIOHkcPnWmsURr+wLbuPlCLkB/sCMQrtHw9b7yCq01
	6/oA5pBYYb9qBAHnyimGMwefPT10coRmA4B+xSGMDHzK4ifCrXwSonnmUqErhccb
	zxddeg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0g16r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:46:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f424d5bso2337409b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781516782; x=1782121582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7cxzz2bMuaIGQXwrnW+Ls6KtkN6+BZuFlXPJCuStfM=;
        b=YPYqjjW1VxI3e4KSSqegI86duuwceFORdG9dm14cfVO0gjV20kZ7ByhFL57EPLY3h0
         RbQb66vmTlbpX+jB9TgEbc8VZ9yWp9UU1tXYA60/TQ9bamEI0foMALr/wmy1GwZwDCBl
         xbTYoccOJrYYSfYRJ/rW54xWG/G+etCmaAkbdRglaoyEadLpFNQq7HBNUPYFqwRtnlEO
         odnfEoStzxlS1V27NVJDcGS/tbXrMlKXBYw+ElRDPNFnaPz0kyeledmr2Dk+QkJ8Q/q1
         p7Qv0H39NLHKoezoMCP/AjjporkMwN5GNFBpLMf41k0bcCZ7POWJxnqrq8bT7Wb3DONO
         vbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516782; x=1782121582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7cxzz2bMuaIGQXwrnW+Ls6KtkN6+BZuFlXPJCuStfM=;
        b=J1lutKIwcMXogMQBGkT2H7UABlvPBJyq7eaW83RNe09Y7lILfYZ5yoc6Cy2hsXQrIz
         SasJeD+eGudSOhiDz4dd4fWBVZPMF9yFHeuwUmm33CLbC60mFpJ8Lo8KIHLiVXbYsFez
         7CaLklLPUVy7VyQip6uy2QIxT031y8HzoxPcYMzNSkpuvT7Y4E95EBYJLCziCLVcruyu
         e7I2P03uzTatg9GT4gJ5i2sWvz7brkywB27S1Bf1J/CkkoYNedx+bAheABLLRRRHOpa0
         lNUN+ErNKXssYPS3p/usy8RhdvVPVgbKarzMFPzPop3+ShKDvtxQEw65bH9KvgHA14Zx
         mAIw==
X-Forwarded-Encrypted: i=1; AFNElJ+3pAeNH0CFywQ9rqyxF7jheLU70F8YGVmrYQcABFNC5GRau+z+n+BttcY1Uex2+ouSIQDc0iQu/iZKd6Rf@vger.kernel.org
X-Gm-Message-State: AOJu0YxMz5KA9sNaFhY7HD148CGiWCQJVZ+2tGt12QE8BtCBlqMl63vI
	6BjJ8+heKVJrSu6aTqUZq+IV6Co80OlqqRW2GGnWJtsEXoLd1ux4vOaJNvzEYERqIoFuLNaPw+N
	JVZG0CbANiUGwRs6th1Cv1MkpuXY45IZP9TY+cE9PQe6wcQavwZBEhImMhvJtXbKNBcgl2uoMcR
	CK
X-Gm-Gg: Acq92OEJbMZInQSOeiCv2htPKNfQ/ja7Qwrl6f46xjACdQe8MQRP1/uZHX+nrPjBCkV
	O+i2B36JKiU6kUvGAwkQ7iFhkpnot1H0dc3gTZpgZcH9Ttf6KqDS0U7a8uPsw/CdFVBqboJ4Yn+
	bjYU/blOlkE7pD7fnA6+nGbvndle6q7472g1z62gUcAAvCVOyzUO7UPhE/ltacPZMyPMjLuQTRM
	3XlMLnt7dhChQoQwruThFJbKAT/g/OKM0qtO6sYtniL+NCPn4o0xPGCusZ8tQgsUtULN9FDLYKv
	ENqn4qk7hTp+K4dIXlLkq4IW6FZkWhpLzqR8mAwViWjb3u/ILt00k2LTus5LLg3Vs8iesuYbyRu
	Kwq6OI9HljqreSjRRzj/WW0JiXa/+7lhQU6hh03rqPL8QwGvVYOgYqjmND0/H
X-Received: by 2002:a05:6a00:1f04:b0:843:497e:b392 with SMTP id d2e1a72fcca58-844e1939fdbmr9893055b3a.9.1781516781505;
        Mon, 15 Jun 2026 02:46:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f04:b0:843:497e:b392 with SMTP id d2e1a72fcca58-844e1939fdbmr9893005b3a.9.1781516780914;
        Mon, 15 Jun 2026 02:46:20 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm9597116b3a.59.2026.06.15.02.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 02:46:20 -0700 (PDT)
Message-ID: <970e9449-ef38-47d2-8e77-9f406722afa9@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 15:16:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <8b2318ff-d07c-4c2d-9c2d-ef7c5c763096@packett.cool>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <8b2318ff-d07c-4c2d-9c2d-ef7c5c763096@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEwMiBTYWx0ZWRfXw8Bbs75FVB5m
 U/KUY3UNlEzg4y8tZaHwBwjO423lhUspPgePp9zY/fK6gkx09kCE7S8oLNvDeF872AeYZwzL4R3
 glB0Cu7yKFUy1Ehl0Cx54E+GBSpTjbM=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a2fc9ee cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=wLQ3rIZANEYmN962rggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEwMiBTYWx0ZWRfX8NuVs5pZcFql
 tXnZMZhcsOjCZ3l8427tUV4SCPleyunAH1TnHiZElBcTeySK3OzCauAtoPmlB57SP9sPC+hRJWJ
 V1E64fLPLd22yy8US0jECq1ovbYMTVd42o231SIu4ozTDYPhH9ZwbxvgOOwCjt2FODMxf/Y7WdQ
 WRzkjV5WBrKh0b/bEporBHie6Qhk+4Ix8cvk0jOgJsgVLiBnrgo5CeqevcP3dIUuf9ubgOcyeaN
 0+Kx1wykuttPI5xe8ILzyz/raTOu1mh2uzesdANDzfGYyIAUBo64IRh5xLKbOVsgVb8yL2tuWIA
 9axRNJOa+T3FTPcSL6ZO08OBDpBJz1DBrRV/w3ZjgxZlKxz94uY8UiwofE9kjQ/fBdniI9jNsp6
 p89Ms5Z+ywFl4zIJhzPk8v7e3//cM7Ym5evjdbHUCmV751GS9JNNyG8+/z0NpNIGwbxPgMbbJ2m
 8OC/x1V4o90K/kE0v1A==
X-Proofpoint-GUID: wu79QTvIUhlxqP8R3_tXza-j-ysO_I0t
X-Proofpoint-ORIG-GUID: wu79QTvIUhlxqP8R3_tXza-j-ysO_I0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150102
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113147-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70331685296



On 6/8/2026 8:19 AM, Val Packett wrote:
> 
> On 6/7/26 11:30 PM, Mohammad Rafi Shaik wrote:
>> Add support for MI2S clock control within q6apm-lpass DAIs, including
>> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
>> Each MI2S port now retrieves its clock handles from the device tree,
>> allowing per-port clock configuration and proper enable/disable during
>> startup and shutdown.
>> [..]
>> @@ -297,6 +373,59 @@ static const struct snd_soc_component_driver 
>> q6apm_lpass_dai_component = {
>>       .remove_order   = SND_SOC_COMP_ORDER_FIRST,
>>   };
>> +static int of_q6apm_parse_dai_data(struct device *dev,
>> +                   struct q6apm_lpass_dai_data *data)
>> +{
>> +    struct device_node *node;
>> +    int ret;
>> +
>> +    for_each_child_of_node(dev->of_node, node) {
>> +        struct q6apm_dai_priv_data *priv;
>> +        int id;
>> +
>> +        ret = of_property_read_u32(node, "reg", &id);
>> +        if (ret || id < 0 || id >= APM_PORT_MAX) {
>> +            dev_err(dev, "valid dai id not found:%d\n", ret);
>> +            continue;
>> +        }
>> +
>> +        switch (id) {
>> +        /* MI2S specific properties */
>> +        case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>> +        case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> 
> SENARY is also a thing these days btw..
> 

Ack, will include SENARY dai also.

Thanks & Regards,
Rafi.

> 
> ~val
> 


