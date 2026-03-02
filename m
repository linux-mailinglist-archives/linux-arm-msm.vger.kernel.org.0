Return-Path: <linux-arm-msm+bounces-94914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDnBKduGpWkeDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:47:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAFC1D903E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B67A7307709E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EB037472E;
	Mon,  2 Mar 2026 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gmn8gQjv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRL/KY2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A9F375AA7
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455221; cv=none; b=LUbaYiIYjnlypEmne/r+433j6LIBsxuGjRh4PzZgIFyMOW7oD+yWQt9WzLWCK8FghJD2+Y3diJ0DT57CPMZKuDUX2qryGvu2tP1IFB0hS0GyRdUoIY9INh7sTnfl9nImKmE8v/gWj5XaRnxd+eRPtNo3tvfguZHDSFls/uQmd78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455221; c=relaxed/simple;
	bh=V0uHEu7Zl+ULf7KZZNig1TKSgF57KonH2rrLY7MT/fA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPpTUJ7UiWnBVyuEhMT4kIEITPiONwo1qWP2xDTdt9EcgWSYpaLEKVxhZtnWvx8jC6eCNftE+drNd3AB67gcIpR4oSv7EMIRTvl0mVoFo8SyQPHZAmnJ23Pw2DFbmKKn3AnPQynAiPUtiUra/ptowGzZxrPXjQQNNQoDNs16IrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gmn8gQjv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRL/KY2h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294kn81291355
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dag3nNDunEg9So5Os8FDwl9iPASFDaDEp7Yv9nrSbY8=; b=Gmn8gQjvPV7RgiQQ
	l/W6sb5vm9S22KpwW4+rKScxxNtlZG/MFZaPrW2RY0nowZ66MrMJWEWEU6C5IsOp
	0aXYT6MazeeXf1ueOYX3WZQJ1kQu++d5LnO7AzXOziK7EiP/7BLNkpQN2Rww4jyk
	BTm+tPeoWVMTf++FmgkRbc38D2Lu26SzLuEAQDOecnSTbA9MKcWtMkARl969w5m9
	iCLw8MUPUGdu8FY5hXvZA9be8b3kz8KZVaGwOSudHBlTyUtzJ56GFYYpSAfiy5dV
	2KOxN2L/oxu+DRC17u5zne4ePj+ZG/yZHhwnTM4biIORjISCaZKN5e3RPgctam8J
	5mhw5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku0pun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:40:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c7177d4ab4so473496885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455218; x=1773060018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dag3nNDunEg9So5Os8FDwl9iPASFDaDEp7Yv9nrSbY8=;
        b=JRL/KY2hjRMTFvUiVJxzymPPwzwC5Omcdx41uJTOUGOYCw0oFr8fweUODkLRRXZYcj
         t4ATpOAkaOEsZPShAClSrSkk80xXXhTe0qdpIG+EJw3rpmdKCdrQG+knk9fngd197KTh
         //yeYy+WxjF3U8pgbCBZrdZXVKKFsL4wgQzOAML5u9SqrWIVGudFhlQkrXRCgzoGEXG7
         ZHLtwDtoGY9IjS+NTjoTaYvsEhBBPVE7dL7gGKDrCcgFi3IuJA8WPVFvGLZqH6CCbGJv
         5Bai0RJPgaItdHiZ5ZUvx5Fa2JBpiYfQAszURAClbhQsXJN1CqK6eawBJ0oOrE8FYQTw
         nGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455218; x=1773060018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dag3nNDunEg9So5Os8FDwl9iPASFDaDEp7Yv9nrSbY8=;
        b=TXst9eBByLIC0TDCzbqaBxAo89QuB2AI/lNI0Ck/FQK6iXXt9S2r7pkrQrUqaXmn6w
         ht94DIS3k+74nBfl43IaYo/WhEIqzX4AWh6aHvMKV+aExe+fWtoTRcWbTnZOV1tJQ7fI
         tm1WNoxX6l+b5EbyU8oMMPsWmu0B4qVoCr6qZe/xDuuNJBinV6BQd9SZYlPRGLfEbd9p
         l7F3TV/VxFEDT1Q4dVb85eovG6lPB77e1bLt3AuPMnRogZiLfGyZYbOoLj5qCe8qe5E6
         xLbzu08vdMYpns5fYIrDRb6mg6ACZosQJ7u76fQBNIqnnfh9VegGlHoD0XoVbN+qG+5M
         bmjA==
X-Gm-Message-State: AOJu0YzWDWNH2PepvDj3l1hnxrDeYHK7a0berU55SuzzsY3yGeyL6/kp
	ziathPm6OpoRMKknCPV7oHPje0YofrEz8Qg8lCOhDWE0aqL6CL0TImp6HRxUuGKzsY5dZdLtAGw
	Cv17CzeDJmlrqALQBONlGNztRI9ni5zsksBLgPP5WFkIxgest2YXcM4q02acv4Yyww/0z
X-Gm-Gg: ATEYQzzj37y9/FYmpssfVsdWamkr9b04JhGSDBKRY9Zmz1hHIIdQMN/ZJxKyPeQLBkF
	eNkTv91r3ZX73AsGRqUzktu6GTwSrWLWP1QYwpu2kvHCdFcZqYoDH7LCpXv6MIWYKDh/up1M/f7
	l4BlPhxVW44xeofLhA8Ielj6QD+f+dHUC7I+u6cWdfObGNl57vvjJAtMqV3nuuUgbL+gM336oQO
	yT6+K9LQ5erPe+9xHeAFoumd5l0QSnJje6ZyiJVN3ITjyphdVtInRFi/I8SEEUHqlzKi9QnoKcK
	qYDD1YRXx/xcKv76gpQTkYCXjQrYFtUAz1IuEdCZHUVi1A8FpdLRW85vEsdwVTlMz9AxysSgDOs
	1O+LzglT/Ms5+jW78Tg05NS+J3tRyFDPYHYj23cyGjfm6n2YcNbUlDVV0Jdqy/JZFQia2PI7PC2
	iYiVg=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1192646885a.10.1772455217960;
        Mon, 02 Mar 2026 04:40:17 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1192644785a.10.1772455217516;
        Mon, 02 Mar 2026 04:40:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac51431sm467420666b.17.2026.03.02.04.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:40:16 -0800 (PST)
Message-ID: <8a2d1157-4761-42bb-a95e-77a851d1f13e@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:40:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/msm/dpu: replace VBIF-related array with bare
 pointers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-3-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-3-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a58532 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5LKdAdAFkQmhlfp1ZXYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PYkRU5zAAZZEYMLqH1DojAMS93DIj_Ly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX8wuspda8dqUk
 SSrRqear/m6fY9ShVMY2xJ1/qMvxC0LD4TZMEsMGM08AOwBsgfH5QjfUMDqa+HXanXsDHZvJOv3
 HV88G/oUCrE4LN+8g84qvvUsT/3ZeCS+oHmuQieOBQtUkETX5z0OOzKrlk77of9oOFXR1m7qh80
 HL8HK4ewfosr7rRzdU594ZEExMQz5MyZ0IoTgEXMq6NEFeYBwekgf3C4V3t4r4iVs3SB64p3l5O
 Hj4t8cEyM62GKIDRTpTjO1RDVD6FnnZLn616YUbEk4hAKXy35XzwIJkjex72jjcxbW/d8qQ7j5+
 hHlvUGV6XISlm0QfQRW1uVTZwldLFv2743IEwswyIL/54jyRRg5/Cj+kqA2WC9PcolJ0hddnGih
 C/8hWKrc0erqaUmQeNSdf0kF1re2PGJ9F9X3tV3WPDM1rnQzYtfRaW3KXK5NExD+ZrQr/gCrjWV
 u3FC/NB8i4MIfVPYoPw==
X-Proofpoint-ORIG-GUID: PYkRU5zAAZZEYMLqH1DojAMS93DIj_Ly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94914-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BAFC1D903E
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> As we no longer have multiple VBIF instances, it doesn't make sense to
> keep VBIF data as arrays. Drop the extra wrapping and keep only a single
> instance of each of the structures.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

