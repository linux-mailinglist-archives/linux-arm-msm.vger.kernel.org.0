Return-Path: <linux-arm-msm+bounces-106385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFwvJsiQ/Gn3RQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:16:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 261CD4E913A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CF3B30F3F44
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753E83FD150;
	Thu,  7 May 2026 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GAyfpSzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjfG3A6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F993F23D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159096; cv=none; b=JhvzFBqXJWY9RUHv2zBgVGcw5ayrwE5OI+458vioXKBkHLzr3FPi22KkrVCMTiBmMFl3HqRygMwkVlRNw8SiSbjDUoFxGjlSkv3NDf9EsNiVQd7tvDHPuAADg7ph1Cs55VNfNy6JpjWNtIfRwrQUAsHxz4NQqAA7LoRzZJCfb+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159096; c=relaxed/simple;
	bh=IJnRaCCRGFSqqcN39JLCOYVUIk6OKKS2XdQzkMVtaI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2vPrWFZ6BRPvkSddKm2IcE5VsS3JUO8ihg714VGEESMszf0TYzUyqMhfFXEXIVD5RB/W8cuY2v/hGCpz4g9c67bbUhZyWBJptN6qrVN6Pwwae3WYora34jkjnyrR3LrHonrw9YhhkNcIqShxWeUFWlSVDLlGXThcLD+e+e20rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GAyfpSzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjfG3A6r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BtGNZ3157859
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEkLRSZuxa15Rr2SajLmdLXU1nO4MBhTedwZPt5xFCo=; b=GAyfpSzpUbrNQ7FP
	s6rlCu4KwSQiyy8o39Xwe+1CFPsFsoDrV3TjVnMnuV/m8k1bgHP/n1H8HNZF9Dyz
	LcUujS3e7AQvFjV6TC4PQApadwPl3OU/O5j/0w3poixSU+pLMJoV6w8k/ZVT2mdZ
	Uwp1HClRlDDnIqyVPBaVGoIjyAai/HZeFflsJiku69JHXUmYdKjlMX9B1i98hjNx
	NCSZL21nXkVC2rlYrlP+65smU7zAaQ2lo3gH3KLzCC4VoylUTyvudi4GYbJZzgEp
	zrugHEMl6TtTy2XPiO0PdtTjgi7uPBb5MEIUykfGgxUwgA47lpSJaGu8nxm9hb6z
	rs1aRA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf1n7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36529b265cfso1166271a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159092; x=1778763892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEkLRSZuxa15Rr2SajLmdLXU1nO4MBhTedwZPt5xFCo=;
        b=MjfG3A6r4L+Tatmloo+NhiDwS+uRpI8Fu23byrcMmtjdkCAsBOdqAMtmFwREiGdoHS
         7xu3648xcBiqHtsBnc9jBM+FZmFHpnhMqWeq93FwG5Thus5pvBraXi3WaXPvRVtK2ydm
         E2ffS0bQ2N5zZoMWakJkuKzMT6ifUe1xEvXRwF2nQFIFg48kt+VMo66x9gYNqAx2Mcmf
         dMqZu0KQusdIAKphKaCp3CPwzNGMPDB0KIz1dxFITWU7WK88/81SD/UlRwqFAVyChAzW
         DGF+++DlqtkE2TKAFo90/8LbP8bh2y4yywSqF3CaaZufGlrlLTOAMHy7e7DS5Imwr1r2
         MFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159092; x=1778763892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEkLRSZuxa15Rr2SajLmdLXU1nO4MBhTedwZPt5xFCo=;
        b=GAd3uZQOnb2a0pdyCnEHrAcsNo0AZ/N3tHEHLin8O6XNdMM/enDi5Zxv+0eG8e3GIu
         vme/P9sPRzeFAapXEmaSJ1YFhbr3oIzxnGTXw5WskxPCahj7PClB6BHId2FPClUnlWEu
         hGv+Bd0uPU8yZO4O+YUiGd0rXZ3+EcgMoHmaGjfXy12FHuFrbxkryU6jKyQwlZKg7sp2
         IHk01gwmqxnLfbQzR7H4GYgHrN9FpDt9623nHM4zO/Oya1shQvWqSvcHOmfXY7Hg7XUy
         PPaJhvL5oyiMZ5hdxdYLphcDSDxKpfjecqFsUDuskNgCwBgOYoAEkWcXwgCoB4HkDEST
         +hvg==
X-Forwarded-Encrypted: i=1; AFNElJ9npnijRO4mFv4H4ozM6SPgueTaKeXF4GJz3GLIpAqIf6zT1P3BNlCJdH3YVc8wwFvekJvN0QnDtj+Aix+3@vger.kernel.org
X-Gm-Message-State: AOJu0YzB+/HIcorPY4y9Uf6oFQKFFVC4BJxELhD+L67dNLjkGz+YtRn9
	RUbQS8d+e8uW7m6FIi6qcIErPTlr4laCYkaS6Vsn5d5Hsz1YmyUNcR9WvmrelZyMy54aUeSGdeN
	RTB/2BlEY97xTs1t1W4KnyrnUCIIdRXaLaNlnBbXdY1AyBx/ckaqfXBm0qCdcIQJJV4e8
X-Gm-Gg: AeBDiesvCvsuDGkGIVblIyrdZvw/QuKRAr5XhBmuxahe1L3jVYa3QZT8maTBn+iSIey
	CU7NOlBMH8Id9HtCoOiM9I5oUoRbbswjTGKUXWeySKNkibXZOgZM00FTcEmnUpaNbi3TKYD/Chp
	32dixt3JJAmVCMfJoUrZG2jMn9CCKnUwBOvlGWKJlVpbKdOf0eZc9ssWXZSuxu8CaOE3gly08yr
	mpQx5GNcBjW27Cb+lVClzjbkba+GqYr5tYKCQA5ZahBVXsYTJlfnKY7l/yQMzC8zbdZBuBn4VCt
	LW0eogKjc3cSGZF1TN1CrkXJpuNLe6MsrvpdVCvjagaZsw1YzzL9Ee3BC2u+/u86GNiFjUK9H8S
	ewb7JPvgyjvN3sdTK2XN+3C1IAiHcVC3v/CiOKaeraiowD9GELL8Len0EqZFmsJKOqw8=
X-Received: by 2002:a17:90a:110f:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-3661c9e9b87mr1075290a91.25.1778159090882;
        Thu, 07 May 2026 06:04:50 -0700 (PDT)
X-Received: by 2002:a17:90a:110f:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-3661c9e9b87mr1075122a91.25.1778159088839;
        Thu, 07 May 2026 06:04:48 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4cba340sm7857065a91.17.2026.05.07.06.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:04:48 -0700 (PDT)
Message-ID: <25ff90bb-a5af-4ca3-a5a4-60550a8f73bf@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:34:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfXz+BRWo7EppQZ
 yOSLcMmcJvn59EN4VdT9u2ZGQUrZvirbEzKHvpZ9bzZH7iC9PlFRRvoKzvF7xYsJUItSadf8qUE
 IVKbkitzBokhR4IZe5XWBvXFQZPF6/Iqu9DgnCsp9gV3EyPTu1q81Dg7mTR2evSgi2sGtHlia96
 tG+r4wQLO/U4ITPtkYrcTqjAoDC+L+B6wRpjbnXLqx9oRP3Ln2Fm6edqJY5J6619lL791lMHRN+
 MXHzO5EFpyopuyOvWYkY8L52oRU5XwXG9SatOgz7gqqP/BR68mHEK+zp0cjYZlTUbg9ql4CLDpf
 QsYE9566Wiz8N+xD195rAZGRHWm/2eeDykwC5J/0UqEgMo+sdszCNf9Cw45SB0c9IO9a041DRvw
 axTHJT/HnCbn4ywzvAvgSJMUJX1iuQud0wdOPy66QeqDWqRevr9kRz3OqIlD69B5YKPnjeTMsVE
 fl3sF6oJvolgATJ8SMg==
X-Proofpoint-ORIG-GUID: 1936iekVhQVpbqg_FBZY9xLovNM6CnKZ
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc8df5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h2Wfa9npekS_yxA4jjUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1936iekVhQVpbqg_FBZY9xLovNM6CnKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 261CD4E913A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106385-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> The raw formats supported by Iris were previously advertised
> unconditionally, assuming UBWC support on all platforms. However, some
> platforms do not support UBWC which results in incorrect format
> capability exposure.
> 
> Use the UBWC configuration provided by the platform to dynamically
> filter raw formats at runtime. If UBWC is not supported, UBWC-based
> formats are omitted from the advertised capability list, while linear
> formats remain available.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 9 +++++++++
>   drivers/media/platform/qcom/iris/iris_venc.c | 9 +++++++++
>   2 files changed, 18 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

