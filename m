Return-Path: <linux-arm-msm+bounces-96270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBfqA7PDrmn2IgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:57:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1082394A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1212A300F1B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532413BED55;
	Mon,  9 Mar 2026 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqnxo6iF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgIZxtZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5933BE17A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060957; cv=none; b=f2vbE5h7xLSDrCUfXVSM2Go4FbZBdxaLIEvTKf7VLuWkM5ydhlArGiljbOPC5AiziQ64VrU6w/6KNarJxykMrzXmy5ABWk4IQ94T/nSaYZ1JwuDuqk/6VEOfXVw1ChT33ko1jRVCg7dxt/+S4N5xGluVBIQ5deliL3jLRIoOAhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060957; c=relaxed/simple;
	bh=7l9aO65EcTRGU9RFNHMLJuCfsf0K5qvwAMtDy4ezTQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdADynliH//05KiBCDFMkUeE4eRs842zyjgCoGiutMKbnCHgs8EhwTkEY0Uv7z85NRy8JMiszEGm+X/pKkvXD5+wnkiKgDNXWK1RpSoaIlOeCfoZjxlAs5niDV+6KI9HPbhx4HsXyRw8xvI9jjRjgiJhiucUkZjXHiqT37rVS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqnxo6iF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgIZxtZe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629CZ2nY3050056
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY6MMt9NzfzjlUmoi5wtd94wNXGmWs2VUQczc3QwC/w=; b=cqnxo6iFVBoSK4JX
	+05Sxo9eIrYt1hn2pOv2VzAxE0w4m9V6NBaZiw8k09psHlMNA1xqdRPyr4hl3umH
	XZzCK6WvyJBkvcVhWCAxPpXCD/gdvsa4X3Et2HxDO+cdUl1Gxh4J9ayAlGu+AkBp
	9l2l3ubaOcutlpTgDRFBS9nnDGubAtiYn4wRggz9/gz+pxARweph+p4nCKLoZ2QQ
	8v3JOZTMJ9neRRaMxGnNF9Q8BMLLBa9S8vatEvfc8nuTjzATW7hNoiCGiLYF+3eg
	ULwD+gFDv8fxr4ddx9RHZv11bMcwiQrFcaygtCHnOtdRBFfu9KAK6+2BAakF/4pV
	91pjJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrnk1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:55:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899efdcdb70so49200596d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060954; x=1773665754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yY6MMt9NzfzjlUmoi5wtd94wNXGmWs2VUQczc3QwC/w=;
        b=jgIZxtZe+uMqFNvrSmqXtFpWZ4tZX5G7LfjKiqK6mNnb/RdEcKt1kq0nRw6xbhb2Mr
         CHAhWzMZ92nVFWalzzUUhYG/TXyJg9UVa9t6ztpmyO6+IOvbUkX7+EV3jMFQgcHKYv6a
         8q48QkzADAOyCEa2ovVHB9Zd4MGBKf2xL+ZDdflyEf10l2dIgMQoH58nz74tJggQnXxb
         0Xj/HUQUqeDp37Eadm4GEl0yEI4uJc0r9vcbJ+r1MusQDGsgoKydMn7fOqgUDHdIyE9G
         G74WDlYcqzFdwnMI71asPFjMbJCBjeusg9RaXQDgMMdI28hUsyIllIRMheQ+g5KG9gUd
         lyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060954; x=1773665754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yY6MMt9NzfzjlUmoi5wtd94wNXGmWs2VUQczc3QwC/w=;
        b=oDblVF0458/1JNRIP0NwLpqn+eXDw2oMfmdKfluCn0OnVCTWYjrmA9ftmcYdivuDUk
         p+ssdXLQEcjuGVQGvMYodrSRQhTpHaeCiuChC8MH963xQOqPCJtnGe01qDwlCNYGvTvW
         RVNeoXVD+dwCmDdzW/psGO+VUNYC0teq9cz5VYFr1rpRxNUJYF0CKxe0FLRAeOtAAUiK
         ysYdVV9taQPrmKZS0NbuQUZS1OPQF1jq+RH4EDLse8iOpazTZSgt2krF7uWhB28qSEM6
         xeFvoWT2okUNmruqmS0dJkBpDMPejKqLoZBGhqXOCcISTwkKk2ZJd2OLsJJTm+vYP2b8
         jz/A==
X-Gm-Message-State: AOJu0YxuUvMFxZtJ+//lUt+s5jxNTT9tIFj7lQAy2ZpWUMWXr6fwxgbR
	nAys0NPuCZZ1yvzXoXj3CUTlds5xi5PpqC2CIl9I47vyUmflCczUt8xVI4d0RkQ/TZLaAfLizLf
	18vH5qkCtaAmL7FK58duFF+soSByrVad01kG/YFbUz4r6I6qqpsQgFWf5f4NO6/pHGWlF
X-Gm-Gg: ATEYQzxitQiMOYQFYNl/cpyoHNrNCxh60RXtjfYSXVKfChBa367DZpZl4iYFXsqjjI9
	IVzuFAehf4W0osfp4N9R1rLH48qPW/1+Gt8pPNH4AOmh7jChHf8ADh6Tm3q8gjtVFNV12PRSAni
	4bzwcljoppyk27KfGrFCl0W7JkuB6ryCSSIDGIaR5nwaIFdXK5bL0paiTFdfmwPOrpOo18qylOB
	el6c8s5ZVp+M/4hktHhPQBcXIDj945l5AtbqXtV1syPyqQEuYQZjjwY2aKravN/Q+YxXRUzWh6D
	rVRd7Z27ecoYwuBYnhzvLFxNgoQ202adKZ4yxbmJAANI4nbmYRRlE0ik6+mPpFHsOlpBkHat4Kk
	b7whTO7SkcvCKGigkeITMLeq1wk62cDjE8qS/pR/DaEeVJydnVHDhpN0eOQ2aeOetxjSrhHtKPB
	Cu748=
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr89037485a.7.1773060954478;
        Mon, 09 Mar 2026 05:55:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr89034485a.7.1773060954089;
        Mon, 09 Mar 2026 05:55:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e87sm3224131a12.18.2026.03.09.05.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:55:53 -0700 (PDT)
Message-ID: <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:55:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69aec35b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=K2AvnHgvSaJXUkDQH10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: -fHgtDJrvkpt4HhWwv6jTK3YM9HRA_GJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExOCBTYWx0ZWRfX23Le0F3lCcTJ
 p51P4IPyIrysC5YuC1VJL44xGGE2eNOmRD7k0rPOZaNDEh9I8ExYBjK896F7++HjPyQTDD8/vcu
 RUUkjrosq/JCwjYYTZLhzyO0bVPUIW0RZ6Yt/DJwHB3M7tghdbNaWW8ZSPmyTmO7Kjyd4hk5jj8
 nwN49eXa4ibxeaFb+Upqh00qr5RaADsMxOXODHTYoI9H1POLtow9aERRnlepjUeNV7YJMPGeqbY
 TUxG9imjKwulSuDzYroPmkZWUn72RA0ZlmRXCgUXLFX+6CpVvLUV1bzdDzVFsCztx78cwDQu969
 ri+VBzBLRHj6GlXbbXhtzV5CnCDrRCKePe0XuZxZEfEi+D9DgIaJYX8IRdaj2A1utRWuSDj9Z1X
 K6yRBeKAXS+Ua6WImpsSdo0SY+ALc8KVZ3LEyzuZMjGFqcA2NMCiFlnsURbXYE1l5oaQv7gM0QS
 v5O5YZrUS2eegu51Y1g==
X-Proofpoint-GUID: -fHgtDJrvkpt4HhWwv6jTK3YM9HRA_GJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090118
X-Rspamd-Queue-Id: 7B1082394A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96270-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,mainlining.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.954];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 6:28 PM, Barnabás Czémán wrote:
> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
> it can be commonized for avoid unnecessary code duplications.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Could you please try adding the following to your gitconfig:

[diff]
        renameLimit = 999999
        algorithm = histogram # or 'copies'
        renames = copies

and see if this generates a shorter diff?

Konrad

