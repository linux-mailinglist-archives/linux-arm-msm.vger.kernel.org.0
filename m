Return-Path: <linux-arm-msm+bounces-106125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIzjC1lW+2mrZgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 16:55:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 213964DCB1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 16:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA8A23042C86
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 14:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67013480325;
	Wed,  6 May 2026 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfTmOtAX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2rSghIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340C4481677
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078577; cv=none; b=WB/gx2lkB2P7bk0ci4UooUBanlqlpk22rgWDfGxOQWj7WbbstD+l15h3349QsQt5qAx9eU/cyXmqlqIX0Gd9AbjwXFk7Nc+xOaCAN5PSbZ14XS72CleOQMDfOJxRDORHTdsVKPcrAqcvisfj+5FsDuq1W1ZZKOJ98vV+J2C3zQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078577; c=relaxed/simple;
	bh=7xdBxUBZ3lcN5J3YExFEy/pYiR+GDtAc2KfJFebVAlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QABXltQAqAAW6rBmCi1poGqpuLZq4p0O5Blb+oZ8gnQURf8jxp0NlqkWqwrhAwdP43sKTVoXLDRQtzngDCUgnIeki6OuxyoxrobgpWhf8DNOd7YJ2A/rLaRgr1OK/ObqSaD+xKkzVwflUEhdF1SJfwKMQbMaPtsvAdokbEnPiaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfTmOtAX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2rSghIt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EGDv03309086
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 14:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyV+NsfUbKRpPF/fp/3F8J5Jj8lRx18O6qDLkdl/xpI=; b=MfTmOtAXC8Ic6Ykf
	j/xClSdgcYtwkN36SXrm2olPyJXKIZLSnsmA9P5iWHLYpe8gkgC13UvDJIuxJFbp
	kgXjegjKGXC5kvB140BaMj60aJJKMFuh78B13koLPviQVa2vt7mry3XXR758Mdvp
	Fj9lE2HNta44qz/tmYA8q2wSEiAFzpanxa5NMGaHKTxPAp0FLh9BwORGhPnqFK1C
	1wLtNXzlHfGchTvr/0ybbO203pV5FFvTIBG7zB5qSLAekfsIBDVosacQnvWYNu/w
	RQnHmW5O8V3dR4zsVXwuRun0J9ILKY/VIxDrkEOI4docvkI7h4+YEja2C+BuHxYa
	7hVw8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e078sg3qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 14:42:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so67186095ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778078573; x=1778683373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyV+NsfUbKRpPF/fp/3F8J5Jj8lRx18O6qDLkdl/xpI=;
        b=K2rSghItutNm6GufN7Of5HLOnYdiXzY0WBwAHPhX9MpUFrx65MKSX0E0cpCRvjKKPn
         aQXjDVRqpcyoj1JvH88P7OwuztAuUfhAyShWOFfRJgJCuItuu8WrF3+zdnT2klQfwZtV
         5wnFAXbPVDaRqd9DGaUVM5AjXdAP48+/KFLHvdPjGZFcOl/Up/e6U/yi/t29FeCKzMyo
         hu38Bdx49Y+GcSNUW2t9m/KW69H2kTZ8bllmcCD2fOiYZMKVNNdpuudVCwdFon7yTrUZ
         GKzIXL9BntddYySXg+84yZk6Bz+BToVSC8WdprmYsVBEltXp9dbHzoHO2+GsOJEfYuN/
         1BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078573; x=1778683373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyV+NsfUbKRpPF/fp/3F8J5Jj8lRx18O6qDLkdl/xpI=;
        b=U98AgKcIpmxUIHSYGAu3coUDZVBs7ALORtgkT/ixT9el/tMAXNSNLuZLl40ZSpXWp6
         DIkwNAM5/9ARIaRrebjMWSWV+pX4E2+RdNAT0tIKQry+yVweuExJlmqVwrZpoEW1qeQb
         vVcltsNieBKKl4esKEGH4nskbdDt3ZW7Xk5/s64z1casGTiNXyZBhCMriK+wqwzIf86d
         DdlX3GVrhMCPT7Lfhk49CNY2ErlFVw9b2eNIL5BWYf1DpqiMw+hqVHSPtoIh9WwIBBSD
         0uVq1WXoPsKRLO0bQiNGP4Xj2EM6Zl6iHmsRwBCZVvnt66AUvqoZWzI15vDa/UVQyF2c
         PN1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+QmWqnlsNdkGdPFLZxHl9/ffT3JGhudqNvILbgGfwG6+Tv3hrIgES7844Z+E54xAFitNHkaujPsHODSr65@vger.kernel.org
X-Gm-Message-State: AOJu0YzZpQ0Hk6cMJ1Z2b1yxh8rr6E8bc9/0cvBTfJ4TSy7SQqvoYtri
	WFgsMkTsVmdaC7GnAd2cOzwVQVmqpko0xEuvmAJC5REiXdGsJ4UzigsLYA1C/5MToyUuGzn+sI7
	Slg+xzTwSMelPlqtKFvRNIBQFYhTsNYscF9rZLEOckiWaDceZjz8vKkEVEwfCTxFhFK4i
X-Gm-Gg: AeBDieuP1qalTmDrcR3oBO2dg+Fedz3rJkAmFQc2ZwwHslBqr1GaRiuggsdhgJtJdGI
	mUu5GSFvgwH/OBGIAJiks8r0MuIgDkYVV6I2GzIUre2gzRiAfSTyOFw38kosfSs/TxTXoDTIkJq
	uBcPz2OybuMewWhBP1OqaE41f6LRypQKBNfurOkA4+l3r4/3sLFJZcorpGlnVEJFsznZCVnmsyq
	Hn5hPkomIjEvjJx+K8+J8CTK/ESyoyqROYdaQLuM8O7k50D2DK2iHnHPvJ40fvnL/ayUG0NBZet
	AzumH4eADadSIPxQ9/nEz8MBm9Z3ATXnlntm55SPdRhJQQkC35a5hkcLcMBJunV8/A3MON4QQXC
	Gs8EQmO8sQMS34dqSUCrhjbJ6bIEsZg1XdYL63EAY3gfVcewoiDR3t8f6IviyvVpr
X-Received: by 2002:a17:903:187:b0:2b9:fb9a:1103 with SMTP id d9443c01a7336-2ba79ad08e6mr40451885ad.38.1778078573435;
        Wed, 06 May 2026 07:42:53 -0700 (PDT)
X-Received: by 2002:a17:903:187:b0:2b9:fb9a:1103 with SMTP id d9443c01a7336-2ba79ad08e6mr40451375ad.38.1778078572916;
        Wed, 06 May 2026 07:42:52 -0700 (PDT)
Received: from [10.204.101.47] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7bf2c6c1sm27899755ad.21.2026.05.06.07.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:42:52 -0700 (PDT)
Message-ID: <b24018b8-8c28-42fc-82da-7b26d3175ed6@oss.qualcomm.com>
Date: Wed, 6 May 2026 20:12:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] media: iris: Rename clock and power domain
 macros to use vcodec prefix
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-8-17571dbd1caa@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-8-17571dbd1caa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lc8MLDfi c=1 sm=1 tr=0 ts=69fb536e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XbLICjIVyITgExBpphIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0NSBTYWx0ZWRfXz4+tQx0++Nz2
 sIaLSTrfX4zVAzhUvmyNbJmkSf5jxyI6imwnqZ6KGBkpBmtkEWgqYwKkF6TP3qVG5MYKmp5gk9B
 ChkGm9tbP+URGwOEIX9TTTjhFWu6AGxu2qkRwjtQvL2dzteNU8ooZgERB4HQt1xqJU7MvBgmHC2
 Mqtssy78fLZi01Dre2wSFWhW1a85C2p7XyvgkVO20mrhUmqhgUWGQvHO+KtRMKj6nDV10g8fBTy
 sK0jMYTpQ54uDg84UurwHEvngdFtpXuHxVE1QCOK6s3kXubE/Z/p21HCp2aIXMDpIAXmMr1fn8v
 4bcWsE6rqbZ50GhoYBfOg2EXQM+1F36nL54sqsQLFEyuHBX/MeWKoCdTTdMdUPdTgO+ggFyFp9S
 JaOgFWXjPdz3cx2UA+FrNjstAODZAGfyJdZOM0mJ4lEINlLXocEUforIF5wt4hAHJJ7OOUQa1L0
 zoPKJU+dv8HkHSn18Pg==
X-Proofpoint-ORIG-GUID: N-sDlzBS864UM3H0nKOxj6F16sJnOTnK
X-Proofpoint-GUID: N-sDlzBS864UM3H0nKOxj6F16sJnOTnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060145
X-Rspamd-Queue-Id: 213964DCB1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106125-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/5/2026 12:29 PM, Vishnu Reddy wrote:
> The current clock and power domain enum names are too generic. Rename
> them with a vcodec prefix to make the names more meaningful and to easily
> accommodate vcodec1 enums for the secondary core for glymur platform.
> 
> No functional changes intended.
> 
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

