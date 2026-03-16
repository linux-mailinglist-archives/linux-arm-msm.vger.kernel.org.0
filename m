Return-Path: <linux-arm-msm+bounces-97843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IyXAJyht2n9TgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:22:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F0C295102
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7032B300B9E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 06:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2049E329C7C;
	Mon, 16 Mar 2026 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldxslXR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAUnADRI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ECE347539
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642133; cv=none; b=UTc0FLxsuEcOKvcKLLJS8U/tYN9f46gIfTKZZOjONdrvrgEeCG/eMWSaR7JGDfLwn3scX3NXyytaxT+BGen7+R3yRresQ9wkoPMOaZgkq9g9c+x20OnC8LKIcE408lFbgcpPXyDL5PGwNvnLn4k7vTq6xjaWRFGoZQ2/5agerkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642133; c=relaxed/simple;
	bh=CkQoYU/3FLq5DhFAEBY9fWpZoWx/jSQ2m/aJQfoJn9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYaDvt6UOo/VbLAfiSLcqT3qrtjKqKQiNCIfCPsCX8E0AnFw9WaMF8sAaf+5AwJELDqPrQy4P4t1GMmqDvmL1zKO4CLmMeLnB0a/c4ymWU40yOyIfoUM8bBg81iabcpVf3RIBqwQcUw0iNtWuQ+jKYFMaD8SXrxnmf3e2JY4PhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldxslXR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAUnADRI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gVB1282148
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3VMQi4qVPweJ+FZbd9d/UOKcE9j5sX+9lxTGG+iwKs=; b=ldxslXR04sKoDz5C
	OaDPXYFfdh+JK/57bOMG3yJ8rnd4slqvBh/MDDYenpdQEO6GpQoj+umQibEOA101
	ZWbB4ECpv4KWW/utuPBMRAnf+0zcOw6HSCjKiFSGfL9Cqp6IdnWgvMoVwQm0pnIZ
	PxuDeJjFLhtzzRg6Umi8tI5WGr9y3pWunE9dxIz1JsEflgnY2s2I7a4oOobYUgBp
	1ZIH6pKoDbyj0Lt+Nfrt1/oN1yF00j2DozdFQBCdDC+VKtt+daw1EzP4wOihFZtC
	jy25STlu2JjHkrqyVIJZAnn7sYyYugr5UwX2K+cE/zDcOOxZwwic8PSbqoGkzuoa
	0tER/g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc49tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:22:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62da7602a0so2962832a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773642129; x=1774246929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3VMQi4qVPweJ+FZbd9d/UOKcE9j5sX+9lxTGG+iwKs=;
        b=SAUnADRIIKYN+6ei8+JmHUM+Dy0+Glibgb17W4m8QlImd0WPGtnWiuK3VAa0O/EoIi
         s/6IcHOQ/BuzMPdfNIjhMNVg6C2qLt72R/OivK0WYd/btCwf+vHnswhlTaT6JCORwLzv
         6ZUDkpEqWPKgBS8AvZfiByZRYp82ij20RJDMe7oLxj88vWfieOu/uikj8LsqMrKdlWxN
         1YSZ3Jkw3rUqBwxZyD498io1lXmJ5yokdh7/ZdI7cck0JziEGRI/s3GC+etZ8/7CpR0Y
         kqzI8K9Jhgjr75+zvx1zIKrFTbdTTDSCKN4LpILjAvyp/GJwpbE8UHvPAZtd3ui3aNcy
         qSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773642129; x=1774246929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3VMQi4qVPweJ+FZbd9d/UOKcE9j5sX+9lxTGG+iwKs=;
        b=IOjp/pxvmXU9p8j31a+WLKABJf+T72TsELIJTEqGdIjgmWzlcHHs8s1TOFgkTma8lQ
         enDvG09n6QKj9xzYygLuxJBxU5mm5rV6AWsclg3A09JYNg6L3hvm7BI0h7txY70PWBNZ
         DdVb32jZjelp+Uq7srfRP4oND1vCIbXnEJydynSud3yCgogTEpZ0DcoPSBGatpJtlAQB
         44ZXvXVdbn4zZC4yTIgNUfwWHIDgngy52qpKypAfOfV+NBhzRppWYBJR0lvTX1YdNjGV
         ig8SV+/fvQaVuNupKUSNr8rzlHoZcbC8pkHitTFnSogEvMXe+F88OZ3UK0vTFRuiBXnB
         awaw==
X-Forwarded-Encrypted: i=1; AJvYcCXobfZz5Kj+RumACMjlfyOu3qvh7Ph12m6nR4o6aeYdGdiqXJkY04tCqzXzBvfigAZwkMZc9TMACnreRiYq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2NggerHftP+n+bjnGzmHiHnAucjn38Job40QkcUpbu95C71XS
	9T9ZhCDxkFIEBS+hyiOjA0bNbh+DJZJwiyiTgK/0ksoWdpktDU5HnGraNSk6HgOTnWNekz6GcDL
	tUnE4AqdsD+vHTJvwVGArJRxyLshwVNYRAF0YN00P+BixVB5gkjD44uf3w0braKSRtX3L
X-Gm-Gg: ATEYQzyoeV7aMsszDzoXK3+O2F9oGRtu6oZF1ypOdR/bA9fUzM2mR6wys/2k5tx+fcz
	coOL/f4HDolHcofT7RGkVG0hp0x2mc9D+gVHqUloPeZso5wCVGATQofY5gI/6oDvcD8YP0AVwV1
	4N5dSVYwoMli4pGUhJI2gKPi4wW2PEYl++4xAWUQOqH0neilGi6ViW91S7gvOXtsplKbrvYWy4U
	1SpwYdMVBiWH6e6YiIkenDdbdVySj+FMFJbMveYNLiGKKArL090Lfco90weoghtBgfTzl4Y4l39
	KF2GoGVdXqGPYOo7KyajQ2iqudiT/LI6STPFdXF7HglHUiLW34HRdPHy9ww1ydHWETy9QkgIMvE
	Ib8d/CfIdyWKlSFRsHRha4co8c5PCLAdZvlEJN3tByl/kMeHW
X-Received: by 2002:a05:6a20:9189:b0:398:9ae9:70dd with SMTP id adf61e73a8af0-398ece25b27mr11086910637.68.1773642129473;
        Sun, 15 Mar 2026 23:22:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:9189:b0:398:9ae9:70dd with SMTP id adf61e73a8af0-398ece25b27mr11086892637.68.1773642129008;
        Sun, 15 Mar 2026 23:22:09 -0700 (PDT)
Received: from [10.218.25.31] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb9966d9sm7860787a12.11.2026.03.15.23.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 23:22:08 -0700 (PDT)
Message-ID: <7f165169-427b-4f5b-9bee-bb227be23d82@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:52:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: add new rate control type MBR for
 encoder
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
 <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
 <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7a192 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=mOGHD44pklf7LAQ1MEsA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: tiUKIZzDqdmmzqgeOXC6uFIJQig62UE1
X-Proofpoint-ORIG-GUID: tiUKIZzDqdmmzqgeOXC6uFIJQig62UE1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA0NiBTYWx0ZWRfXx2LmP8CKp3nQ
 3swHcFLnFxCwlClopqKFGbWp4jewMcHy8sx3XwFFE4SuykVUp86Yeuj2zCEWnDvlcQOKkwOveEA
 3fL8Br0rF10omD/23Yh3cPBnACkqLfG20PNSaf5PlO1oSu61X4GWZwirFB13iLBexRTyEqeY8TA
 S19gIy6fHJDl7/7BGuMY9mOdwGpMkDRZzOxJLuxrsrv8CNosI/Zy7GvQQ70WTWYSJGrKgeOdL6j
 u4r3ES5t2kXnjGuqAm9Mo8eQn8jBDdq4BtlkDO2O1+pHMPWOpVNW62RRvCTiFtrvPc5DA6VFy0v
 wp4u7m7kbf8C9/U5ec/NFbjnmV8UbvKcOZY4M1170GErJy22uFsg05Ju7MDC+i06DcgKaWcaaIS
 0unP4JZTlG7hTUU9qc0VmFfvIKKby14kdWthATp1lBZ15BXiQ62ipzL0S0mylPFM9+/VFid0W+n
 mP/lxNXSzM/eqVHjntw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160046
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97843-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sachin.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96F0C295102
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/13/2026 3:24 PM, Konrad Dybcio wrote:
> On 2/13/26 7:04 AM, Sachin Kumar Garg wrote:
>> Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control to Encoder.
>> Encoder will choose appropriate quantization parameter and
>> do the smart bit allocation to set the frame maximum bitrate
>> level as per the Bitrate value configured.
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      |   2 +
>>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
>>   .../media/platform/qcom/iris/iris_platform_gen1.c  |   9 +-
>>   .../platform/qcom/iris/iris_platform_sc7280.h      | 202 +++++++++++++++++++++
> 
> Is this really only available on 7280?
> 
> Konrad

Yes Konrad, in this series we enable V4L2_MPEG_VIDEO_BITRATE_MODE_MBR 
only for SC7280 because currently, we have added the support only for 
low tier chipset. MBR rate control aims to improve the compression 
efficiency of encoder for static and low motion scenes for extremely low 
bitrate use-case.

Thanks,
Sachin


