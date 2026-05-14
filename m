Return-Path: <linux-arm-msm+bounces-107513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAEbOPU7BWpNTgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:05:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 453D953D3E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 026873036607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 03:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09882EB859;
	Thu, 14 May 2026 03:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLYatpBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ag+MiWhp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D41E8826
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727923; cv=none; b=mAKTUJYvRv23b5nW9RzjzzhkqFN698/EsVuHPhC+8Fsli2orEfOu5WXGDT00cHmO3p/lHWagIsMGc/cEPuCAGqtWN4RVJnr+j2vQYi1gslVA7U59WxckqVGKFJWOflxE7zA/PtBs7ysd0p1u3UtVz2/JBXoS9bJUxQlWH6w97O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727923; c=relaxed/simple;
	bh=GhnqVwGAUzXklgWYGPSjoIVm/BxPlZtdjSbNzxexg/I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eHMvpMa+98uvByIXXSyK5SfCJuzN7UmkhUKg+AUigv+bljkL468HXNL9XNTWtDk9EpUN1g+sHViyuOyFD4y3L5FTh38KhG+00vcaq+G0tKXf2+GErkly8TooP+1dfrNGBTxwLXT70RfxW5jMdfghuAIKDDaZtEB0goFcLALfLmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLYatpBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ag+MiWhp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DLHu7o359453
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FtABQQt2nTIKgkqgHnSu7+DB1puRLKU/SwnvugbIasE=; b=DLYatpBtV3MIxOuA
	pQ0KxBgF4BYmmcrFM0mqHud6KhmLBy5vDU0Y1DQXW3yDBBSEtQJmkzO7RsdOVa4W
	/KwyceWTimXqCO5ZqgmoocyyIkuP0hP5mNNWNtbcK7ePiw7iX6b2FqkTF4FhPaMY
	NRrqBnyG3VGw+vyj/n/ovk4WLzXUM7CWITLEogKTWKtTnh6r4E9Cx2PAd3xBXLGR
	1QvbVTKMaWlNkz1aH+gBspnVLfCg49sxP/QdfqnNcXLxrWJ7oTlob1ld/2JzvF8d
	CcGgBSCDatTu+K+NvXwkurkd+gyD9rl4hG8y6AZrInynuSHkcnVbWVjfPd4Zdfo9
	dYx44Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513g8u17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:05:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so1770819a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778727921; x=1779332721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FtABQQt2nTIKgkqgHnSu7+DB1puRLKU/SwnvugbIasE=;
        b=ag+MiWhpr1n66AGvLKsr2UM0c06lYTuoCKIj/Q8fKPkYCwwud0s7/NydbW8IKwaCSp
         a+gX9YRIjSfftuU1zPN1w60xdhBndipBVfeB6RtaU4tMXiePuoTWfmyfUNtqIS1z2C9+
         t4T7NqOz2kGexukumxIvtNcWUVa/4SNEXQvGagTyrje8B5CJ/UWnhxLepOX0VBjagJqE
         bysuiOATwaE6jbemDyOaEomJ9wovwjveu/QH6nriE7NBuavB36peyOarVVgAvPthLc9H
         YW4fVcV+juIGc6qJ9czWI5DmiMv1RI6aAu1gSLoR/mnIvF8BE9RZllxB+T9nyxsUKuzL
         EyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778727921; x=1779332721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtABQQt2nTIKgkqgHnSu7+DB1puRLKU/SwnvugbIasE=;
        b=rj6eaeg3tSz6E0fDW1tWisjyPdMGkJsyhvRR4U1sTHISyOwVHr6lb/qOCSsA/+vFNk
         cINbHd31t7UveKh0nmZnJCIAxElTlGSyqdIVCksOUSacGOTWGMZXGy7qgnn7i+tA8E4J
         qx19v3RNuCLxSUbKcBzRU9dcR26PDyB56iwFokmEqyMP41Yikw+eMrfWJmXybEC7elSU
         PDG44N2CwKRLUVoqg02qfNtSZ78xNNha/sMoxVFh5I5LBb7mAAevkngL8FDstYfjxvO5
         k6bz/iNeras2oP2FpvQ1a39JaxTNCYSP3d3ban+C0v1lPizbLtAWLa+lm4m74aZ8IFEf
         xrSA==
X-Forwarded-Encrypted: i=1; AFNElJ9SaXxoCuP4R9Ig79GJHedoqF1F3B+8jxtaN3+pELwwhWnE/2P/lm0/WL+XZNhVvvwxNA5PbBZpCs6dunDQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxWcQ7PglmFkaSgaO6DZ2+ExKuzYcBivOcKRbDrZ2PSRPSLv+gZ
	qqcCFz6r7YP/ouwqtgipR6MgY3ALTKa0jhsPrwnga/ZtdxyffeTGXdlxEyy7meZg2LugVFn9nFR
	3fD62lK9gHAZ/g6lU+0zUpPGvX416EtPcSh0EsXOBNIvoTbIwF594KchszAae1dfTnpe1
X-Gm-Gg: Acq92OGStYh1YvAPVPV1bmEHeRYu9o2bNzMHh0O2K38NLYry+wT+v2A3MFFpjXwX5sW
	4WAgeiFiKLbDmWBl2uy5KJDOH2AW1fG0iRi1haGHIjhFy6aya/6C0HXui5Mny5FNz7NlaTx3JRW
	n325YYn4l6XsQKMDm1EMmDVpKhrzzeL4SgzSfYPazOIkqlrda2norU7Aj0d40WCctM1Tyg8aG1K
	tUtrVP40XdL98L+PVFY/e3m7K6Eytct8ayJfUrqCGn+k1t/iguacsT1zxOj0Mecm2bG1BlesAt2
	yrCAEIhLApZcuHBK1Z7lcZ+g/6KNKGAXtt5oCuAiE640BXZCvFGb+LAfAViw+MgRWUkl94RxyJa
	/g3EE/9lVvVqvamYIYfLgVpvIHeYmSxUr8eVc0zDRAsRzLxNGWjE2NHwPKP6DmFxq4wiFghbXo0
	H2Or+lVJhpWXtcSde4
X-Received: by 2002:a17:90b:5628:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-368f77c87d1mr5487059a91.3.1778727921022;
        Wed, 13 May 2026 20:05:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5628:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-368f77c87d1mr5487020a91.3.1778727920438;
        Wed, 13 May 2026 20:05:20 -0700 (PDT)
Received: from [10.249.28.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf4d940sm4346167a91.7.2026.05.13.20.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 20:05:19 -0700 (PDT)
Message-ID: <dd1ac800-5cba-4fde-a1c2-45dbd2c8d033@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:05:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-4-4954e3b4df84@oss.qualcomm.com>
 <5kza7mdcjvzhfr32azt67fzsz2kqfxzywofqf75chv5otv4tns@4csfz5fd27yb>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <5kza7mdcjvzhfr32azt67fzsz2kqfxzywofqf75chv5otv4tns@4csfz5fd27yb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAyNyBTYWx0ZWRfXwguMUf9ShBdq
 RQvvTFpaWJrc4H0yWBg2WlseFnEVWIZiqDLqB7nCzpfCfDKOhv1n+5bl9HuwwSU/28Omh9u7f1w
 7eJggOGl7x0QQ1ID9fNihAigf+gY1uZViHVAEqPHPe88ZXnjl03sIk4Mp2k55K3cJ+x5/Ij57sy
 q52yIz/ozMzIOHC4xuz4YRA0LsullIbVEKS9STwZ/gtVlbgjmPLWD/45KDfUHWcTpT291lpiUw4
 hJ/Ef4he04U9zB9cU1mub8Iqk3lteNWI+lDkDEejmnBohwG32wYU47PDtVuTCZi6gyTkazPTmDx
 C1tVrIphzrgIY0es7KsIjEcid5axNPFYX4+7Sw5l9xvKd1w6Jwj84gD19PeEycQbh8qFcc56+Co
 wlqJeKstX8qDZeDHu+f23qRuah4youQaWjfbWxN9gs5z9vLqdxXIEDCTuE7G3s1Ycx11ZjEDhUi
 ltKJb6YuIn/nGoPwUuA==
X-Proofpoint-ORIG-GUID: 9r10our1WLI_MxP3E7pguZO4YVvkxmiJ
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a053bf1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qFeY41BV5J4peOxgSkYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 9r10our1WLI_MxP3E7pguZO4YVvkxmiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140027
X-Rspamd-Queue-Id: 453D953D3E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107513-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/5/13 19:07, Dmitry Baryshkov wrote:
>> -int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +{
>> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
>> +	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
>> +	u32 bitrate = inst->fw_caps[cap_id].value;
>> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>> +	struct hfi_bitrate hfi_val;
>> +	u32 max_bitrate;
>> +
>> +	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) && cap_id != BITRATE)
>> +		return -EINVAL;
> 
> Why do you need this check?
> 
>> +
>> +	if (inst->codec == V4L2_PIX_FMT_HEVC) {

Both bitrate and layer bitrate are set and passed to the firmware using 
this API (iris_set_bitrate_gen1), so I need to distinguish whether the 
client has set the layer bitrate.

-- 
Best Regards,
Wangao


