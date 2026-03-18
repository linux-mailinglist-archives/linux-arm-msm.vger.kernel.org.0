Return-Path: <linux-arm-msm+bounces-98421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOdeBhaIumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:10:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB362BA8EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D63931F2ACF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342943CD8B4;
	Wed, 18 Mar 2026 11:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCXeVVWj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgbgQ3Y6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A87E3CCFDE
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831725; cv=none; b=rXkgXve+5PA3movDzq1XwjmBdgjrSOX2NbgURhcq7sU7kqsxviBN3Gf8dcjW1siCW5+RQAtTktCgZ+jXjlsknlI0jHxdT3y3WALCAJFg4jFEq0OSad77UldED9YJdP93sbc39Y/BYtLrJkXbzbR300DtyVc2pUuD4YkTOlTYU0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831725; c=relaxed/simple;
	bh=mXGG3fi1msKr1rqOQEhDZU3z+5KSHVjYfE0PBeEdliA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCGAgVgm9SPrvn2vluAR5iprZOX4a1pgSOicchCW0GvPQySvX77SiKhBhWc3XghqReWruc9ZTZyxOP4+sWGhigtvEdvMfhMFtYeee3Jb+H9hKhucFzlBjx2Ag1ksUjiX+EMAau3swAG8O7d4QgAMJnImdIyIH+DCuBdD2kQKL/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCXeVVWj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgbgQ3Y6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8HE4X1050213
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QrvGnIZXPty4XETU1uqiYV3wUNDHCuw5A8GY7KhrLtc=; b=FCXeVVWjn8MH0Txl
	zLd+DoQhHIMImA0493MCbUW5ys5fc+W/Zn9K2t8BTBNxu8cZZW8DP7kivsTqexzF
	sFg94IwvGa69YScvLtzZR1vSkdqTYaSKJZbM/cIuoQIz37QrntVmQCwKDRmqH0/I
	JW6kt/Q35IWGYfZm3PC93roCoioMTkxsFwE2hhGOUnkD+jfP56ZIJJiav5LCUCi8
	dg4doBc5gHytpfBLjyiuHI1YGZG9RgD35jIzPFuKtN7zb+aw/q16C3cYcovCPAl8
	yS7is1nbkqQnvewuD/0uL+fZ8kXUlabT1ZZW17yXSwibHA73hXkTlXRJkkh8K0N0
	w5YuaQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ej69c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:02:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c73c065dd15so3642813a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773831721; x=1774436521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrvGnIZXPty4XETU1uqiYV3wUNDHCuw5A8GY7KhrLtc=;
        b=MgbgQ3Y6aEikGVWYLrAgXHtQnapwG7fDDvwNL04NG7Lu777HTgslXrTL+Wiv89osFV
         yWF++Ph6j42rd+WUIp0am3qtvWmbBx2HwjWWE65chK7tguQRKCmFi7Uw5Dca4VVjyrFw
         pxzhjyGWqjnDXQ6REBEkCYB8RJS7PPftUHI+2WNHoXgYxbxHej7FHlKW8DyCJnj4ZJeQ
         jvm0yVSXuO6y8mfQjd99q8WEQpYwy8aB7XcsVp5EjwBJclQ8PHb1nPduMijNcR1TEcqf
         s/azdexbsxQZZHZeRGYvMV2uuLjqtt6q6fd68t5V3rhZg2qtDgfutvaNEzouSdi3AmAx
         Joow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773831721; x=1774436521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrvGnIZXPty4XETU1uqiYV3wUNDHCuw5A8GY7KhrLtc=;
        b=rpRatFhh1bgL47V0oCrRYORJmsF8IYGhJYIll25bX0nSc/6d5XTxnpCui4BxMB3E0f
         dU616WKaxDpX6yI9qrVK/Nm7CuXSh3DDW+l1t4eue5/9pHpW4Squ3Eaeas1ErGC1ziGC
         eHtu/rKXVfPyIv2YNKzu+DgnZ3WihITULayMBRm81loBAFay6iPu1L9Axvkb01yQSEHZ
         v4Vz3qQq43aUQiBnPUdG2uvO1SyRdU5HVZ0JFqHPWgr5k+aoR5WgL/rLxHLUO79BNZ4B
         hjU4U2fafxXu+EWMFTk5r4oh0nwVj0tkGTvej2R0QOwZ3CMjsKutx9mqhxwuRQYMPtgk
         35CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSEWuFGYtiQcIhwUWyvdLr/6cD9pWlcFRFEoSDgXJye0cegz2Y/9w538cRJ4DXtnqdrWW+FoL8roRW0gjB@vger.kernel.org
X-Gm-Message-State: AOJu0YwIadXfHJz6iPlfvA7B31TaA3XdNZqzHr3vDNR3TnRkSGgFWnDw
	I+XioAf/cR95lCNRrDI3h4T4pwsCc4QCS07U9FVTPb/tYEC0J+UT7TpYe/T5kg5SEIhtcbQcUrE
	vzZme2+2JKRjjgLUbI3dlxKulR/R6DRVA6DqPPT+KWK43078isEBxXc5bvlui6/m3YXV4/QUdgA
	T9
X-Gm-Gg: ATEYQzxCNux47iVkxM54hb/pbwOOwsFibKg7TS9gTDFAo2SBbmsckFonYXJixwiWFcN
	rJkP98BgdMn0q1nEtH9X8NAZm/3JQnB0OHceecvuEQJJNhTqPEBv2SX3e4VCaW3+HxDKQYGRLwg
	CcpHg1o+6DDw0m3i5my8ByLmEULEDZRUxglPQBP+Lgo3nRR7jPdW9n4Nzg7h//843alNOLJpFLG
	SarXqH4ew5j4cRu54HT3+sCHKOVLjD0N0Wfg0UGZ7KmArjYap1S8oRIKwlc89TgcZUBIYUTTy6e
	KK3c9r3Y1PG2Tzcz0+ivTbt7Tlp+mvHFrqZLDDAjYul0j2KLCUzwWrdSJvg/AFwZ7kPxCzvwwgw
	AOcp+Vu0IiOS/sD80Fv6j5DfaoPdBqTxceVp9nbZtEOIXE/GyGx0ZRA==
X-Received: by 2002:a05:6a00:398e:b0:829:8c23:f706 with SMTP id d2e1a72fcca58-82a6af3570dmr2770313b3a.46.1773831721284;
        Wed, 18 Mar 2026 04:02:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:398e:b0:829:8c23:f706 with SMTP id d2e1a72fcca58-82a6af3570dmr2770265b3a.46.1773831720697;
        Wed, 18 Mar 2026 04:02:00 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b531f35sm2450860b3a.11.2026.03.18.04.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:02:00 -0700 (PDT)
Message-ID: <3a2f25b8-9859-4bbf-a4bc-996194b73fae@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:31:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] media: qcom: iris: use common set_preset_registers
 function
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-2-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-2-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba862a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xm1I8ePgU3ACQa9n1MUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MyBTYWx0ZWRfX9mT18S4357W2
 xpyJ2CRWWMT9gXh4ixuk/C1CFP9DaZTtTHzGB9sLVMkBzkG3KI4iH69HAWlmGEbi7Mv4VrOODLs
 wXSHm045J2Bzt6o85ZSj92KjkE1Gztq+ssI7uDucK1jad+yoHCmvBcYFLWaIFLEWx2giAjvemln
 w/3cR+dQapp6fVH/iyUOHBiNTUP6QDfwa6jw0Qf2gsVLMoeVRQfvY781Dzb00x/hjJmxLW9a2fd
 vQKnWlBTQ56zF5+gBLjS5AphWsOy9sKWSVdyhkRqSdnyoj/SZ4c+yxbLhlirX+G7G/EF3RkdAd1
 bhF1ghYzagtHnPThxxMst6axounZye34lCZYLmVRsgYDRd09atuui1C3i4q/dfJ+k6+H1W+sH/B
 tEH/UloFsNHj28h9g1mRQZOR2yybDMl6YRGBw8D/N14Rc2CAcKjzjtz5pe9lUwP16mCdLFISeFU
 dOYfE6dlytcGE9aY5mA==
X-Proofpoint-GUID: RTbLMgS6WQ_W-eYQgrTUlvDVJQWg6Xwi
X-Proofpoint-ORIG-GUID: RTbLMgS6WQ_W-eYQgrTUlvDVJQWg6Xwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98421-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AB362BA8EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> The set_preset_registers is (currently) common to all supported devices.
> Extract it to a iris_vpu_common.c and call it directly from
> iris_vpu_power_on(). Later, if any of the devices requires special
> handling, it can be sorted out separately.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


