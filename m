Return-Path: <linux-arm-msm+bounces-98673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHnYAZK7u2mtmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:02:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD72C846D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7958530078B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD5737267E;
	Thu, 19 Mar 2026 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYoDDQZn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FB4ZYUhi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4716336F41C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910911; cv=none; b=hNydGLoM8SK9e7DYiCLianA8ginJoPlcVg5SZlUop2mgnryFHbt8LqZqbQN8gIuBkwcSRFfQ3S5ggv6+CdCZXThhnuwn9DtAbl9O94+fXgq+03Tu+SuWfaNC14GM6Djm68S5NexIkLVCCmOi3ny+bLMMdFmmhABtRrnC7y6c4fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910911; c=relaxed/simple;
	bh=pUlPuby5FCrzzhCXAiHAq5t1s/9M+vm39MPiJ8gJFOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTHvH3XID8H99NSDcSpxKZWobdlHiNvhimnboAPA/ywLaehr6sV6FuTiwoR7ywNq1+/mhvbAfOhEOcWH+LL4gUPlNzGcq+5rqH4HmqWaVO4YEs+xS6LcYwyOYxpDG7UeaUQ3RG5cvJEPH93KxaHMbl1fYcpIHrVi+PHOPKogL2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYoDDQZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FB4ZYUhi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J745LU2666596
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTxZNUAl/xRiwP3hZFey+yB2ij2EK2jS9EK16CmBvWA=; b=NYoDDQZntaVHBa/i
	h487uDegUYYevdXfM3r8P8V21xgAUfi/2QfuVCJKHJQdQa6ALrZFfLUCftfm0Pc7
	b+pOY/wLApOD/YkPN55qdvS4OPM7P0F47qADbcLUNyxDNHCDRqAl2jwfUTDE0MPl
	z+qKrBeXKn3nnPzITzw6CiBVFhhm6iEVo3sqtBmHoxCvva7RtxBSGAJaNZ5MwGfq
	S9hjg/0Wd62BOMqrFG7dOYNTRXBkk2qwISR7US6M3qTaavfkvvrZIciN64vx154B
	CzpihmPVUTEajzdPbS2iuzMkoMRrqP8lqw1zwey4dj5gH9VfMvoeSYFAisrT4Xby
	jUnc8A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj54240-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:01:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b8da51b3eso1429636a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773910908; x=1774515708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTxZNUAl/xRiwP3hZFey+yB2ij2EK2jS9EK16CmBvWA=;
        b=FB4ZYUhiu9jBBu2TBw/nDe+1L7Ho3NGgFYqQsXSScFi/8JJ9TkO2HV5EVOQJ2gEoR8
         j+tSeP2FrZ5W2SkTVDEuvZ80N4bF6pw4FefUDi3urqeGJV+XSBIu6Kcy5NNUmUkAhuVv
         ulowG8fYua2UWYv6TfUbg5gkQEb+JZ35d4bP65kgDCgL+OF8NxOftK7zFPda3Sa6l/Sj
         iBa42ZmrXfTPGbUWjpbHGhmsWFmbGLeri/0nCzvYp+KZJz2f5Sm6GFM7QZ/f826b8ynt
         GHRBRPy2QbsYKAoW/TZcuGZdddvltnmAYks4+AewZfw5XvbtX8904p1ccLRzwKcKEq70
         xpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910908; x=1774515708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTxZNUAl/xRiwP3hZFey+yB2ij2EK2jS9EK16CmBvWA=;
        b=q9Ak65feFCyBCeA33pVZXHsSqvjkbrm930tQ2/xfuw31TbuYndQ/hTEjP7/52BMUYT
         vJKPrqOQiooSON+bSySpbFJc2RWiCx/XEl4DRa8LA0w2KowYxxIIkN7ptqtfNljzqZHe
         SlNOkvLI7N5+ykOPP7WRQe9SKDTkmYlQCHFnjNkow9ZsNrkH3VCLNohXW3RxhyMMgX+S
         AX9dBthgJVXC9Vg5iNkqTA7gCXcAKpFI23/6BFTmeG4tX1uH2YC/46xu572McGmD9Id1
         S91d3u6QQIIMX6K7jug5Gy1xBeFR1IzTt63lv2rTlx5EXqO7Viwmd2XpWf5wYrm3sIIo
         OMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkotsaFe347ByqAzZFePM5Lkn8+knZi2qKjwcaW1mJUKnlYC+qTEGf894RDcYC2tau0afcMcxwL4T5Dely@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf426FQp8K+wLYHUZwbNcQwW/FG13SHaxdjcW0vlcb4xkeJaC3
	dW9TPC3YIoKChfltNfR8Gw/QlQM5BDMPr8QOq1QGA5W8KW4RPwDHcGiTRvrk44G+QakHsxb+tfn
	2jtbQ6YBt0i1Udcxm2Z/b4NJYh+VriLqgv5rANUrh2tjJTC+YU73Bc1oDsWp9pxZ9r/Sc
X-Gm-Gg: ATEYQzzCmwqk6YqiYMKuMeVha678kRjVcPYThYWBzAkrDN2G4RM0JdmLbxk0z+louLN
	K0DkCAUeknRdl/snfNreaysJK06zbk8XtQShTnLbzftaG6thZm0QQAj5waC5K1mMJmA84PiNiGT
	fYmTVGPKQCKJk9dSRGKyyRQiuWsDpGTlcx0GtkG58oQyuRT84cj2eY7wflZXiYfy0G3kMFhHqO5
	/WqbauHn8XqaggSyuR7JDKKu6Je8FdQOJToXLKk/JTPfylY+7Hnwt1eUETa92xo6kM6qtAKxExl
	ul3BCkZgMgxbw3T1W7gIUtcEz//PR+VtGmGlLONk99PiouVGT9RM6gTgFoR3nYppSx3q/Cq6WO9
	EMjsyJaTf1VAmYpWm9mz/pRE3bLPXlAPH92RLSFXFrMySRPSpvpAuUUU=
X-Received: by 2002:a05:6a20:9d91:b0:398:9099:6079 with SMTP id adf61e73a8af0-39b99c8f8c6mr6353199637.7.1773910907749;
        Thu, 19 Mar 2026 02:01:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:9d91:b0:398:9099:6079 with SMTP id adf61e73a8af0-39b99c8f8c6mr6353011637.7.1773910904582;
        Thu, 19 Mar 2026 02:01:44 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.254.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b56791csm5213281b3a.15.2026.03.19.02.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:01:44 -0700 (PDT)
Message-ID: <bfba4e6e-94d7-4968-bae6-4beb3b01eb9f@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 14:31:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/11] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-1-55a9566ebf60@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-1-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfX8g38zzcCJbJD
 Jbp0oNvszNNJSuF2BuoFlYaT2mtdQpNQkBvFqa2G4mq5WpB/1lmLXaeDoYyt18B0Qlgtke+iup5
 rAKVKcRZwOvSs74SzivMDmHbk6j0YVaC6TS9I1uG5Trcji2lPhPh9A9kC/VUiqclBkCy8WoPOll
 drUghDIdeSyWv5TzyicTXDMN4HvPN3evy95g09H51a4YjWIJvhvv7U8b8lmEWCf5gZQbYhBuZ9Z
 pmVV1DIL5iTPMZPBJPK+drMSVTwhcDeJJbZTE2zJGMv6E7Hf/UWPh6DWflLF2pcU+Gml8Uqp3wG
 WFu6BoXH+crehnZeU8DDb5LvlKp5c3nIMICKyuPY0YpRMEpgQ7CCrN4tb+wSsDWbB77RlNG3XXT
 pz8EzlI1UjK53+tfV2ddjLhBGwd7yT7U5iRUKSx7JbqMztvH31srj4fQdPI4dbly21NpWfmQvBF
 vW6pTOLhHEtURJ+PBJg==
X-Proofpoint-ORIG-GUID: vhFVg9d93wNi1SAKXIdov36MXjjS0_VU
X-Proofpoint-GUID: vhFVg9d93wNi1SAKXIdov36MXjjS0_VU
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bbbb7c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=vmayvKaVtNuonzR42S3udg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OinizHH6AUJIbddlOokA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98673-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EDD72C846D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> The PAS ID, the authentication service ID, used by the Iris is a
> constant and it is not expected to change anytime. Drop it from the
> platform data and use the constant instead.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio<konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>

b4 trailers -u ?

Regards,
Vikash


