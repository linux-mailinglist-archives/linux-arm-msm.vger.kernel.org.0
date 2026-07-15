Return-Path: <linux-arm-msm+bounces-119202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qs3iB8lbV2piKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:07:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D6975CC36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:07:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hY5OrL08;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GOShVOV6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119202-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119202-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C78F03026AB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8917D43B6D0;
	Wed, 15 Jul 2026 10:06:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9F435A92
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:06:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110018; cv=none; b=gEYLtxOMZQlCvpHa15hOQlxO2AwDWulCMpXsb9+M9+lg1XGFn9EYzDazHlXOcUMUgDLt21QRnDGg/mHqAXTQCSK8fO36CWBrWYEIb/quwnLi7vgfJIoTTVP768xwiX1NGZNnHFK8VOP7wrWIynItE/jkZtx+vTplB2vmAAUd2Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110018; c=relaxed/simple;
	bh=Z5xLZqUFy+nfVFbwz53H+l3ATJIjWnq/bVWkCzWe2pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DJGfSelDFmSiSxTNeOT9VuGS6L6FORfvND16V5AcUaS3aMVBi7u8QcyQJz1EQqJOjh35A1iKhelhwqrgy7uBv2UZ3jNVe/9M8zY8OP/Y2VsW9XtAUXDHTrAyi8NQFjghop1qtKPC5JHzQHnWroSykEJJxXG/22sWZac4zBGPc4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hY5OrL08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOShVOV6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FA5Ytq2621249
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tu9xnBEZVIchVJKkF19/QBESyjHnh5Atdab75SDY6T8=; b=hY5OrL08ZVwbyx7L
	O3YSNNolYHre+Yq78hm8AFoRXL82BSQqBGr2eaXXMpZdN7ejWn7Xq/JfgJmgF16m
	DCxksA1LYS4WkYRq2EuXlk2d0ah2RnIjfAgMZkO6hg0n70nCz5z65oeSxr1cruvp
	dtY6d0lX6eOyJswR6HolD1uwshrb2vjrjX6zdKifyvD8HYbkbOjDipMpbUxGcCMk
	taZA+o3L94YdZezdW9PqdhuE/mRS9jBSpchufkGgpgJ2pY1NFI9ugdB2ZMHZNyEv
	I2MzDiNV9uc5+kNNmLXVE6ZF9cHIqxUL5lAdD3Fp2dLGJT1FoTICa0hi69hIx1i5
	aEg4ZA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vhqts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:06:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-901fdbfc3abso26139526d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784110015; x=1784714815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tu9xnBEZVIchVJKkF19/QBESyjHnh5Atdab75SDY6T8=;
        b=GOShVOV6MEbkEcDACrB03RYsZLPc+7Kbh9zhSuqdOwbvjLBiXQfxh9DVitx5aGO/9t
         J//elQYhxEHi5gc4vxePfEBQ68Tb8PXscpGUlVucwEf9LV+zDtIZ4qcKB45atkxugFtW
         qJvSjfQ46D0dJkLBVkpba74YUnDU0OPjxu4wPTN69cZS0uhbQlk8EfG6ZARGGoac905Q
         1Oj3H7YADO5PVvVHfvXYVlSpQjBqWrx8NEgSaHEH7uPrYfbCYr/qUOs6sajtskb8Qx/H
         81GJaexltaCyZvy3L9+9tXb+XtDiUaidyjSsYy1Q/bZwM7i90buGXWR/DwSpj3lR3CNW
         Ca4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110015; x=1784714815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tu9xnBEZVIchVJKkF19/QBESyjHnh5Atdab75SDY6T8=;
        b=D9KOdxo7lQIQCb6QxoPb6BebiyuMU/HGargJGwfwMFv3XZZ8aBw+XJ6p+WQo6YWa4i
         BwOzMw7eUKkRcJ7Qj7LxPbJZQ7IdhFa1q97Rr7Np7Rub89wUnwme82Lz4fwCe3qeKEuU
         sfksmRumfA/BpNYabZvNajAlCAjIDWC8IfEWXV5II56OUH8up2wchkM0geJtPHiJvfcx
         BU5xC0E8N8LKvVFh14xKPeGEx+Gx8qdPUZQHE+D6xxViubcG+2u6h9a+bt9nvTPO86/6
         JLHXM2GXRwaDlTUaVF1oRCa32d3c+/+QO+v1ji25oGFZRjJjieuCqqcXFQ9EQL3mtMEq
         E1+w==
X-Forwarded-Encrypted: i=1; AHgh+Rq1FMBFteaOAj4dRHFJpDHCbvr0HVzSeib8MjdttPs0yFIrjczbyM3KaBm33VJrSmNGVW4MfzUrnzD8iRDa@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvgG3bQigquw4xyNpiOJb7P/3GRrhBEFJ217ugvuCbN+rMPVT
	lVAuJf1uTVScXZTeDMkyNYPgcujDCrB4LJdX0MQ1U9PA3xSkNUVrdMKOFNBTcYFW+q3PK9yNIcT
	9w5GWRrfva4OHB02mLI3vD4cLBXUpBBU+d1QUSsKXtqV+Z4hzlA/mf7qIHqnWgMhy4Xlh
X-Gm-Gg: AfdE7ckRmMuYmt//dBGt2hlNgnCp5mXImEuzX4eM9ih4bIELnKSR52N+OyBs01slgVl
	n9qpKMu42zexjoHGsn2uGdh41gBr4FKkItUdWrRvRD7C94eP80RsYM4qV700aDNimqgjSbz7a+0
	E25OWGjGR26YlTxUsGRDaeNf5t5Ev+96dvvUybyilklsWH48RpB80ITDj/UoMzST/eZgd/UUesK
	mf+Cd3JasgDjnmHoew0/y2f7NlNpa7zSVSV4E7AlyMTZbz6eKtUFulxbxUtkeEGOn/omrx0TfiB
	MBS0ikXDwuVeXBWZwCCEYi/rhuL4TA3zRWou+S86vV1o4+gXsuLtYXU4pS+Xd0duzsB4q13t6C9
	XMpy7Xmm6QcqVvQ3pMgI3qvd6WsfTgfAhOf4=
X-Received: by 2002:ac8:5883:0:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51cbf217c25mr134538881cf.7.1784110015216;
        Wed, 15 Jul 2026 03:06:55 -0700 (PDT)
X-Received: by 2002:ac8:5883:0:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51cbf217c25mr134538501cf.7.1784110014601;
        Wed, 15 Jul 2026 03:06:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d4bffdbesm1081919566b.45.2026.07.15.03.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:06:53 -0700 (PDT)
Message-ID: <c13890ae-5a1e-4f35-8713-91eb41654d0c@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:06:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-wsa-macro: check clk_set_rate()
 return value
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
 <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-1-f0c713ff0b4e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-1-f0c713ff0b4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a575bbf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YT72Ugdk_NjNlKIGY0EA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 7L_twohvg-dshXKBHdD1BCv8EzbDStHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5OCBTYWx0ZWRfX2BXtzhcnG0ZN
 Eu6HrySEzdsPZHZEOj9gaf93HqFm+1NWm2GoA4wStjMVjwiPuZrUeqPHI0Fb93VPrQwScwaRM8h
 kd+UM9Y9BdUSHxRLPE3cGXLIkWjyq0EoFGtvVo/tT9a+bFweQhRl+GRx6d7j4lEnHpQktM0Be4e
 8BNCsiWDhZwvWifeLdp/9dXepESxRlJzCKplsa8I1XSfpX3iTuCRaKDrTBONB+Nlf37LacdPTOS
 tg2kUCVjiO8jK7XoHmfpsoM5VNU4I3MJ61EFX6MHb/sv/2V0MKAVhpKRJ8UDN62ELaHMU5v5tjU
 dAF9LMGv8HDn6HRk8Odv728cyzOKDO4q4OfYNHJIGRwmSJCxGZy/5x99iEyLA93g9bDNydMJX+s
 /VprSE5v35+9WiMbCRwri6URb5m+39H+9eH3giiouqKgrqx73b/9Nx8vSyLwMtipbcMB3dtlvYt
 dlvsav2ux5ZIFcQoJrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5OCBTYWx0ZWRfXzduw6TVLUDj6
 bZVcbkebtrBOyXxI2BpEg36yWb4ZINVp60l57oXWxeIn/3ILuZy5Ll/vZryYXkFPUOjtf2e7wgI
 y28aWHpa10lMSigOCf6pdmjfmjIBc3k=
X-Proofpoint-GUID: 7L_twohvg-dshXKBHdD1BCv8EzbDStHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119202-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61D6975CC36

On 7/15/26 10:29 AM, Ajay Kumar Nandam wrote:
> clk_set_rate() returns 0 on success or a negative errno on failure but
> the WSA macro probe function was ignoring it. Check the return value and
> bail out of probe on failure.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Please resubmit with the commit message amended and carry my:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

