Return-Path: <linux-arm-msm+bounces-95708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 55q3AuFgqmkGQgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 06:06:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D22121B9FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 06:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45DAD30131E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 05:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030E936921F;
	Fri,  6 Mar 2026 05:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZ24hLmr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jjMH7v+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23C91D5141
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772773592; cv=none; b=jgQ5xaG3ObIv23FSW6VoDg7J+RVNyCiiv9mkQLo3Gp95a/Dhe25xKUjDL5vgltJXiMiDDoTJgsoX5/99cZ2w7dkvd+4i9dvJUszPBX8Af7M1SROQ8OGWVTJMBliGoXdVU4GWHYMGW0AqhUF60diMyqAMIIdg/SefIZYGSOCL8Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772773592; c=relaxed/simple;
	bh=eDd7Jy/wDCMVfYDbBnRTXZzBT06TKsGUGJVLMdOR8y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCz6N1vrYUoiGEFMKbIqoVwXdi5Wkl9Lo0Yg+UhCEfxr8FcfSFpNsO9mXkC3ickLikPf7AIG6XLpSTO5cqQvW5fGTbTZZSIarfuRoaSZ5arJNza+7flbPooDza/HTSodJ2oH2k1aMWcVfJ77t9edaKNzlzReSxGubbcMaJnu3WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZ24hLmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jjMH7v+4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264adX92483582
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 05:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+dvZANCK81P/V4ewEJXn2P4UqbdifgP9hgVbJb6HSY=; b=QZ24hLmrhA5GPVVy
	91U9EHJ9m/q5ncoX62GapX9KDqLCd74sZcm23j6F59qX5uWLCtMDwXY4Q0wO5wZV
	9m1lV2TNtnvbZCgUewrw9um7og5iHSib9oAe/Y9h5NQI9uINYmLtto1EIBKWtZq7
	Iv5A3RsA1346ufovPgIlAtTAk71xd6aY+rWoyJTBkTk6vv5PhDp16mQg69EvWPcx
	k1ebJjTS/DPQN39j0xQ5xarJ4pIvAbbyoW1dEPJ3e0NTy2H+bfQzA9Rpv53WobOD
	gk8bOUPYAFaKnUf75GdHVC5Z6VVjwyRdAPEP195O+MAoig213Izr/5p9QXXp+cw5
	WP8UfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84wb84n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 05:06:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-359812e4fefso3912174a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 21:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772773583; x=1773378383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+dvZANCK81P/V4ewEJXn2P4UqbdifgP9hgVbJb6HSY=;
        b=jjMH7v+4yn1jvqEwltHSV4Ab37kJQlLbMm0m7IJ8EtI7r2DB6yQ5SalHYyCafV2fRq
         F8m6bVuekU8HQgDmF4jBGDqYGqQXz3ip4jOcKMZL9172kWwUT1mfdgduGtKHnWKThfYB
         HjTknPr1F7XD9CxGoR1EOqKmSDZG+sJBV/QnlmRT8HNpyypD4eL98ZDYGltTh1bu0j+M
         pmuNvohB5do2MvHlhwYa5knxtXwacs4mrkqRd1hvNEPfOqn/b1J/acICTDWCurqIUIV9
         cf0o1Bd/snknyoWq991rc2UM4Tl7rjcgrHT8hjE+BW61FCt5Ank9TeG1t8HAoDvwcEH+
         NQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772773583; x=1773378383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+dvZANCK81P/V4ewEJXn2P4UqbdifgP9hgVbJb6HSY=;
        b=ct3ueDBae7hnGt8BzrRwD8sb3iP/z4VpbaY1+Wizi5m7SH39B8CsC/JiRynVnzsR4r
         zxZcaRBwfHEWXqrUvT7EdHbEz1o6+gcsfUCxvaKDR/LugifCIgJ22+obKwZuPRTkEAx1
         5AkxOuWpNRvFfAQW8J0lKL5HyiLAARKDUgxl4Xl+uRFkUiBCmA0ppFNr2mRsxgT01gp9
         aN1bVKxhPdgm4NMYlDcOqk+WpGlbbdgSguBas163+GNsibyJXUnF4xTtLYIrJFLKUJZE
         6cW1uNQiZgc4XHudalLjn+DFEY3k3XpMHSlM2ITm5AnYmQSZQBXoTRDC4on0jwO+sw0Q
         DzzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAneLV1ctwEWnIl9FrTGL6EiX6O1DbraXEhYwKCkK9O+MO35CSlWXssCRUjFnUTO/C6Vyck2ojsRJS7bJ3@vger.kernel.org
X-Gm-Message-State: AOJu0YyqFv0S3dig3LsmJR6Zp5+gkdTHWotisAHRG1F3WCo1FYrZpHXq
	h+Fv5rDf4zTfOyiDSdCvpJLLc4nhbcsTUKh6ALT6VfKZS/ExWBqNtZ2a6tyL1B1n3cOvOXrrPTB
	pgj1YXLVTV+9gI5XD6m+SaMiCdRpvA9KsYiWoELFAm+DKzTKlDpuX/lULlh2lJ7Uie3SP
X-Gm-Gg: ATEYQzzD3by9qfstsHz/EgPHahATRbibrTxUSY8g1iUqjKUsCYhMZ7D9s5ea920sEq1
	j5bBBcCdOiwgGMo3Vnf0KGmjXKkFqt3TaXmcLsVQJubB7ii1x0vH/+rYoPFMiehdU1O5XFaqIs7
	SJgzpLlwf9GzFnuy21ZI3hDFvesEW4HVPrYRsCRI5ScYbgStI/7QAsj+ltwOh7AxQUkCOvuzQmj
	RVL1KQqCMv1OunY8PG9Hf1neWUBCZ7EtvBpwZMD2JUFNTC9pbU2pJ0LbRws2Bc4PyuqGBviZTBZ
	wUWgauai8t5bkL/TI2S+Gq+HJit5ve8hH7de2HnbnNNC0qGOjBLLsPRsMkjQOrZnjDeneog57v8
	bJT/+amT0ZXwXo5t6Fp22E3Pa5LSwc6is4s5Hc0ZCZOIC722S7kTyMw==
X-Received: by 2002:a17:90b:384e:b0:34f:6ddc:d9de with SMTP id 98e67ed59e1d1-359b1c34439mr4420181a91.16.1772773583232;
        Thu, 05 Mar 2026 21:06:23 -0800 (PST)
X-Received: by 2002:a17:90b:384e:b0:34f:6ddc:d9de with SMTP id 98e67ed59e1d1-359b1c34439mr4420144a91.16.1772773582710;
        Thu, 05 Mar 2026 21:06:22 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e195fc2sm323968a12.32.2026.03.05.21.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 21:06:22 -0800 (PST)
Message-ID: <61636237-a5e3-bd99-9610-1b8041d31131@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 10:36:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] media: iris: fix use-after-free of fmt_src during MBPF
 check
Content-Language: en-US
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20260305-fix-use-after-free-of-fmt_src-during-mbpf-v3-1-20cd61ca488b@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260305-fix-use-after-free-of-fmt_src-during-mbpf-v3-1-20cd61ca488b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N6Wyn3jRBgGqtQ54al3l0CyjWes810Hs
X-Proofpoint-GUID: N6Wyn3jRBgGqtQ54al3l0CyjWes810Hs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA0NiBTYWx0ZWRfX9H4lC/QQh7aR
 JhStuCvPreVpB244kzisVjtT3t5YEvX9202xfVWDlXlR6KROVgcCmmE6jzTFc7BIvUb7JcMSpEA
 NMk2YgWiT7rL3ES40Mo0A6B/36DB6x5+5nQvdJexbmOuGzf8ffQe9rEosDiCwJMm23V4X1WZolY
 HIkqpCwFayfmaotAi76z5JFCK2PeYGS4OUm6gmI4m4hVI82s+HAKxwJQJg5Zk8PqeEfd9M6IhQ6
 xisNcdWEcg+QhV5mCrFHb7cCj8o1W1uRqiH5cJ5NHr1xeZmB5o0ezAp+6KSSW02FVfLxs2Of3Um
 h9wO+O7UwqSy3sbOpO19UDNTYCIioyIvYEXwfO+dhdJD3/6RqGUEEBQtuTr18diDihh/d+ZgL74
 g9b7lgPQO/n+JCTEQ8Ax45y6YOXNrwJA5BaA37WckFK5popS9ut83B9ekIBBXOyVug+AXym2tI/
 4DzVDfrVaTbFdoP5ZRQ==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69aa60d0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IrIcjQS8YOhLhDNCWt0oYA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hoWbD-Tm_OpXRH-bEywA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060046
X-Rspamd-Queue-Id: 1D22121B9FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95708-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/5/2026 6:58 PM, Vishnu Reddy wrote:
> During concurrency testing, multiple instances can run in parallel, and
> each instance uses its own inst->lock while the core->lock protects the
> list of active instances. The race happens because these locks cover
> different scopes, inst->lock protects only the internals of a single
> instance, while the Macro Blocks Per Frame (MBPF) checker walks the
> core list under core->lock and reads fields like fmt_src->width and
> fmt_src->height. At the same time, iris_close() may free fmt_src and
> fmt_dst under inst->lock while the instance is still present in the core
> list. This allows a situation where the MBPF checker, still iterating
> through the core list, reaches an instance whose fmt_src was already
> freed by another thread and ends up dereferencing a dangling pointer,
> resulting in a use-after-free. This happens because the MBPF checker
> assumes that any instance in the core list is fully valid, but the
> freeing of fmt_src and fmt_dst without removing the instance from the
> core list is not correct.
> 
> The correct ordering is to defer freeing fmt_src and fmt_dst until after
> the instance has been removed from the core list and all teardown under
> the core lock has completed, ensuring that no dangling pointers are ever
> exposed during MBPF checks.
> 
> Fixes: 5ad964ad5656 ("media: iris: Initialize and deinitialize encoder instance structure")
> Cc: stable@vger.kernel.org
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v3:
> - Removed global word from the commit description
> - Added MBPF full form in the commit description
> - Link to v2: https://lore.kernel.org/r/20260304-fix-use-after-free-of-fmt_src-during-mbpf-v2-1-b4c78d1bf764@oss.qualcomm.com
> 
> Changes in v2:
> - Updated the commit description
> - Added Fixes tag and Cc stable
> - Link to v1: https://lore.kernel.org/r/20260227-fix-use-after-free-of-fmt_src-during-mbpf-v1-1-307cdafffa2a@oss.qualcomm.com
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 6 ------
>  drivers/media/platform/qcom/iris/iris_vdec.h | 1 -
>  drivers/media/platform/qcom/iris/iris_venc.c | 6 ------
>  drivers/media/platform/qcom/iris/iris_venc.h | 1 -
>  drivers/media/platform/qcom/iris/iris_vidc.c | 6 ++----
>  5 files changed, 2 insertions(+), 18 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

