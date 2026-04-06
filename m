Return-Path: <linux-arm-msm+bounces-101923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J60YFhFM02nQgwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 08:00:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E13A1B68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 08:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9140C3010B8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 06:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0086D34A796;
	Mon,  6 Apr 2026 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/ZO6os2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDWs9sH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B573A2EDD70
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 06:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775455244; cv=none; b=G4LQ1LLKioG4Ufxwi35PR8KM53gNXK729eKfIlsRWgvf0WtuKJiJx2x8PQYO8v2tVNla4/kDZedHNzgyaGeFsyxzsfrjgj/Z1gLaExC57HLxV3LPgC4Raxbo8rI4CX9nn7Cuz2uheEo+DOWzUShPhkOobEYf5yPCf4p1fZLxJE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775455244; c=relaxed/simple;
	bh=W55SxH4v1TYu1d/lIxR5OvKL1AU7gdmNdXkaMEBZ7gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sw94DX1mnTjXfihTXOBnxoPpizXE2LMpgJNuLTv8oEx0gRuGOi12p/D0pTVBZ8qmAqpEiiYbuJ13zZdO38VYIkfkkJxG1EtrZlKAw28W17Jrz+I05daP3+WFduHM6PMpsRSJPdm4UWhhvVB7pGZ4k2Kj4ZxrPRXJ6plijCWmzB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/ZO6os2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDWs9sH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635LUtda3130292
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 06:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4ibk9OYoGNB7wbo7aoLoa43aOqqOGyAKbKoa+PEyXI=; b=T/ZO6os2gecjpCj2
	qWg2xD1/uYio+n/Pp+azKfiTOtLTMahJgHu6kdvEFxxSbZZUD/dx5faJnxLIrEey
	4yRZiiKE4jfq8UL2UoivR2VvqFHd20qgfs6UDy5xGjVb8ybtezBYeg/ysSQjnc+n
	Xoxgbl+fdfRMqGpPBXYFrmYBtCMuVVIl3OERMIhHFIXJNykZ30bKfhn9en5E0cCO
	Z38cUdmpTw3D5tkWk8w+MksXQLNQJnduyab5mdtmXGfecu/XTbGmUwyfol4KP7RW
	CK0bo0GuBgWLPtpFt2V8jHkfBgR+xxn7cTn6EEpnfaJyqdJNIQNH8IApzpeOfDUg
	MeBRCA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7uc1nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 06:00:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so3218263a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 23:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775455241; x=1776060041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4ibk9OYoGNB7wbo7aoLoa43aOqqOGyAKbKoa+PEyXI=;
        b=JDWs9sH+882bxzRLDpK/hxz6M7EmIdUDP/QrrD3LK0tQJElkP3OI+yWdpTVy6Zsufz
         kTzN03vo9nasJZAJ127AoGEb5/5yon2mX1mNN+faeSw6UoWLYCt44VgWXxXhqxa5zSfS
         W/qjkYGjJrhq29LvL2UgmHhO55pOgJabzpLrokLbqJyTp0OLJdj1EgqzvPVgs6PDBhwO
         t/ufor8TTHtiAIAPNGNlWvwxJrwfCWM46m0z1Cgbotd0nO/em3ZA1JsOkCZc7i4yU0gA
         STf6qljoZWo+lpt/8yKzDjFkoLR7fzRZSEePdnUuM0mRZZ3VgsMrX9lfL14YV95+l+dj
         6K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775455241; x=1776060041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4ibk9OYoGNB7wbo7aoLoa43aOqqOGyAKbKoa+PEyXI=;
        b=Zcd3zGD8+rtvEAF1xpsWs551I//TsBieLk6KTHVjJH//++Hk8eWBSyoHoawMYHfVbZ
         2hBwkWM6xyBEC5gtq89b+VzvTkB8Mha7Ol1n64A0WLb2dCGW0aAEgwT/tddV0murHozf
         pHNOo9J1bNlyAT30HiJg7HppqIv4Dvoj3Vqf7/XiS1xHYMBz+sfLP2Clxw1Y1xXD5gWE
         pIL21x0Awo/coU50v+Z6NfWwv5kZGT3zADKPX4qv6ZtJcFmE/IglCnPqXQ+3HFQo0QXw
         wBU8McoMrCzVllKB+CBw15wgjm+cYGZYnJ5NYksu2/xyqAJvzpKBNFMp7NLuNwUN9R9R
         3/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVEDZwIY7GxQlAAYnR9gCcQmD7O2QU7eoHzuQm5O5DW7A0R5r7DkwXd2ebrn8qDPNV1A2w/rBw8Ip0jafn5@vger.kernel.org
X-Gm-Message-State: AOJu0YzPf8cmlW8RQ0E4mAEQKKs4qUD7l8kaC1Iss9eArjcpF1oq5BLh
	H/VydUr5R16UH5AfHNcWk3iXAIL13XEPtxOm7GNm0z37W3q/aydyXBDlrgGyP03KEKih276Bc7x
	ccwXFFjz+uCoiAeNCkRT0czQEyIjI0aFe9wdJr13N4EfKugX50kwP5rDzq/NERRh92u3s
X-Gm-Gg: AeBDieu6QvRXDQ0ER9fxyA2YyuF6gt/YtwAUVRIAJc88sF2ddaPLovtJBKQWaoHxBXR
	AR5PWlu2AtZkfvJyHD6evln6k8xU0NPiPZHJoTv2t7mvOoXc6kKU2k84o17NVem0kfpc0KYnItr
	w/uV8NaoqfBlp9TTwOOChLiDXEGAzeFXY0+pMlc4utK7aukjoDF728CdyoClOtAE56LuijyWUA0
	aPnnA/BBBo7l2FRxb6jAMLKIdD4mA4hDGPu3ljKchjd87t6R2ow72GJXs7JXsTxnyD+rqZ04qzn
	yfRqLDAqZmsACgErnCDI5RtyZEwD53d+PYi53ePVoXK2mttDDceQ0dcdg6+5X3KJYoNuLvJCUeW
	LMITU8/U33KUZzhi3xMlgV6q24794PnkluMh3G/+xjaISeQsLPYhWfA==
X-Received: by 2002:a17:90b:1fcc:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-35de689500dmr11473530a91.10.1775455241451;
        Sun, 05 Apr 2026 23:00:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1fcc:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-35de689500dmr11473454a91.10.1775455240764;
        Sun, 05 Apr 2026 23:00:40 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.228.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27479d0fbsm162722615ad.35.2026.04.05.23.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 23:00:40 -0700 (PDT)
Message-ID: <928b3c14-fd3a-73c1-5780-2b8302fccb7b@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 11:30:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] media: qcom: venus: drop extra padding in NV12 raw
 size calculation
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
 <20260331-fix_venus_bug_issue-v1-1-e4ae7a1d8db2@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260331-fix_venus_bug_issue-v1-1-e4ae7a1d8db2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA1NSBTYWx0ZWRfX9rx+/02lPrFJ
 +K89LdgvjQ/ofIOOGYxeZAZXt4axhLZTVBclbN2KNBHEEPN9HWnJF4EWN9wP/xi/R1Z1ykb+oJ6
 k5jQ+D8c59GCjLXAGEgU/YiLEeguLqluVFsKuw8/9y1HBQaQ7IqX1ez/Ry6dd59y9Xmu5E2ix2+
 s12mjLvgEBXA02BcVrdZtJPEPoX0f9kOdYGev8hL2OMI1672X7pGKu4lcZSp2cV7EJD40bPMz5r
 7H5LPl3ESamr1Y3U6fqINcWVFs+s0nVDx159OLUrYRUBvauGX7d9eKFscD/7aeMa0sAMhtk3M8x
 CO8EOWWQ0YyDd0NKH6QsYQvDI96D7eqE6qrhZt+yr5gL1MX4HMdfF3sm4h7hz8NCVCfcNdcQXlW
 xui2ePZYlCKMzH/QpkWC3aIBN9ANCZZ8bXOikSHp+XIgEgg6AWmcdFUYD0hu3UwIZ+DRO1Dy6ou
 u+rqr5WqUk8sf6bw9aw==
X-Proofpoint-GUID: acDYAQsQEKcG3kH59WRV2Kln2xq7V4sO
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d34c0a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=AZq5V9zQ+e7Vr/IEUKe0sw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OLydivoxJDyelnFudk0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: acDYAQsQEKcG3kH59WRV2Kln2xq7V4sO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060055
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101923-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,samsung,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B46E13A1B68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 10:07 AM, Renjiang Han wrote:
> get_framesize_raw_nv12() currently adds SZ_4K to the UV plane size and an
> additional SZ_8K to the total buffer size. This inflates the calculated
> sizeimage and leads userspace to over-allocate buffers without a clear
> requirement.
> 
> Remove the extra SZ_4K/SZ_8K padding and compute the NV12 size as the sum
> of Y and UV planes, keeping the final ALIGN(size, SZ_4K) intact.
> 
> Fixes: e1cb72de702ad ("media: venus: helpers: move frame size calculations on common place")
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 747c388fe25fa30770ac2e81d42f4daf83d74ddf..59eee3dd9e06c27165f29fc034d151eb13cd2349 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -954,8 +954,8 @@ static u32 get_framesize_raw_nv12(u32 width, u32 height)
>  	uv_sclines = ALIGN(((height + 1) >> 1), 16);
>  
>  	y_plane = y_stride * y_sclines;
> -	uv_plane = uv_stride * uv_sclines + SZ_4K;
> -	size = y_plane + uv_plane + SZ_8K;
> +	uv_plane = uv_stride * uv_sclines;
> +	size = y_plane + uv_plane;
>  
>  	return ALIGN(size, SZ_4K);
>  }
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

