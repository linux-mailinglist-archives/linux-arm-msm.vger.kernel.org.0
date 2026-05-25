Return-Path: <linux-arm-msm+bounces-109675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LOsJPhYFGofMwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:13:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7C65CB9C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E2F53016EE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D871DF26E;
	Mon, 25 May 2026 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nT4JzVwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gkvsNYwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13BA265623
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717860; cv=none; b=DdZFidlXwPXl/WzfLlJ3KM/eJjty7f7+2oSXlxPmEutc9HecPM32z6P54KkLfZftlNr/ndGI1Cvv1supPGFy6rgmMPhcOy+LRvCDWGJJ8oFZ6ldx1Lq2w37pioWr502ynLqb1Y3mW4D2FEDrsru2Owx5WhgqCVHBA03+VL3HRj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717860; c=relaxed/simple;
	bh=yhq5Zjs1CQtFPh/yQki1vkwk6itMPrzRig3VERAktkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsYQ97saHVo+gNlFEE837tJNcC6q+neBXH4CqExEA94JF/QQ3oZlam80Ggh26gft1JQX/1wEaItPVNc0FPQw/3Vcp1FUzRyXEkVYlTkXv5MdsdHicA70Ysewg58Z/lSR2fVAcBMKL26sy9JpSybxUeZUIBo3K6BGIUUlr4BHjC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nT4JzVwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkvsNYwJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7QSpA3063492
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 14:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j83G7OBZi5YQwGrAtApyl0NYyFzj1V7Sk8Xmu26hFNA=; b=nT4JzVwX3bXdYDBn
	S/SpFHumX6xrvglOTeBEafIMlMStUexPJfWo1SV8ND6qsohhGmne0q7AGPLKJJ/6
	0TFAVV6YRXrfSt9C6dS8U5RtB18ED+QjP+YKBSIzifWEqQA+vxXvv86RVFxj5nex
	RU5cZaD3phWpP0Mu29rmL0fqchVLztx2GwXaJkxQNoo3RfN9BrdfxDqMLoA08vS1
	9G1dCa8F9nmZXYsW5ekXwt1wh/7MsQDK2qW0DosAU9Vh1vxYPfCWBQoMmRmTT1Oe
	mIFDaXKEC0KWBlaIJ1mGPf/qx42DdtZYRoX+4+hS+f35wzCIFrLaqK18uwrc1AW5
	ylDF9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1ghda5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 14:04:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914aa01cc21so70142285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779717858; x=1780322658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j83G7OBZi5YQwGrAtApyl0NYyFzj1V7Sk8Xmu26hFNA=;
        b=gkvsNYwJgCpIrhSbzaUF82R36arMSrOagiZJUmFBhbr7mz4fMphWpHdXZcN/ds01D4
         dm2qbF5KeocBi23Vlh3TvdLl1bEMnNMzuy2MvkViHtGdFu9ADP6DulLsfVEWVnc2zeit
         TCl1RuqpbfvqSODYKfGz1O6e9pH3x5hKmbAAptRuEg37mXO1TJaJ0zrxHfWcrrZrypwu
         AtA9dxLqLMfeKLsrL6oEDHFmIUBHNSvn4nVtmjgoJXVMMk2yZzPNxm6+DWYXwCPcdLo1
         T3SDoeyfsKwKWUnkFBOgOXxeSe06LN/4lcfAomeGSLO+gUW3dXDp75TPYvA/D649T4Sy
         /+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779717858; x=1780322658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j83G7OBZi5YQwGrAtApyl0NYyFzj1V7Sk8Xmu26hFNA=;
        b=nzgHVpYWunaj0aj8vi7OnD3021vKhVRr+P5r8j1N/9T5lTg744P3sEy0crIrN+JSn5
         zgR08G5AXs3ro3h3TXxERqx/v9qz3WEdCba3N+NtPucBnKW19o3acU8r1R5OndUN8cYB
         INTbAWfRhQdyW97MV0/E9HZzR0LwSJBRk5IAgSruCYrHkGHvp/67cCyfpomZo4IYViqx
         VzRPnptNMKbRXXcOfhAzF0iPQ0PUfY8ofjpQD9N9qai3vDYeITI5DPJdGumdeuk2+7Rk
         5WZjqV9C4Syvlj0VAB/71ULtW5hvrajwQ2IIEJcN/pAr2xyeK4c8pX2yS3U18kL0raXU
         Vqzg==
X-Gm-Message-State: AOJu0Yxk9yC0j8yqpvtq5Vrh6ZMO5e32VEXx4+gYxPK2a9w143MBqULi
	j0IwYj8Bjsgx3RLfTUNWQePYAukEy5Saq7UlBNk57pnoWnv+98Pi+oUXb9HhxLILTVm59CSWIIp
	XP1ewyTFvgWA8dwgsWtzLfTh7Nwah5zUkErjrajErv81yydCktthsfKejIE1BY2u4+/p0
X-Gm-Gg: Acq92OE1AlM+heq/C0Ih1YaaFbup5Ac3CaNtYhpGJafQPPk93SQAghaPHoE36/GJuaI
	8RPzdXQVJa1niA8mjjIwfSQtsP4YzqUSl1YxPvJ5lE3PCPGWV5d+bc80tKd/8NrQyFj7Ir/LizJ
	LLvUL6o6MUZQxHstww+2jG/nqHarKypSVzRlz6DDSEcrAkIAckr+XfZmmq01Hf5lZzsJ57HuF5n
	R6M/Npu+7epl5y5mqWyqhw9eU1FFhzlLeCkz0iexN5xTQOWzht/zP1ZttrX4PmQdlPDpF1SAORc
	/IQRiUdWYHqERDCPsthNT3MArg2sCbSrQW7Qop0vwI4YZf4TPkoYN9rNmczxBiT9+fXPNWOXM1o
	FpLfCkTohXkhk3SbAmsUPMNvTG+TCQNpubUvxjV4KVvAE8g==
X-Received: by 2002:a05:620a:4494:b0:912:38a1:1273 with SMTP id af79cd13be357-914b48c0d3cmr1405936285a.1.1779717819395;
        Mon, 25 May 2026 07:03:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4494:b0:912:38a1:1273 with SMTP id af79cd13be357-914b48c0d3cmr1405771785a.1.1779717738422;
        Mon, 25 May 2026 07:02:18 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdfda7f3bbasm209718166b.28.2026.05.25.07.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 07:02:17 -0700 (PDT)
Message-ID: <5d6a60f1-0f3e-477a-87b1-dc7b2393f08f@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:02:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/10] drm/msm/dp: clear EDID on display unplug
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
 <20260524-hpd-refactor-v6-10-cf3ab488dd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-10-cf3ab488dd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xJ29BjyBV1JTQ8NxTcAQXGCxqxn_oo0e
X-Proofpoint-GUID: xJ29BjyBV1JTQ8NxTcAQXGCxqxn_oo0e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE0NCBTYWx0ZWRfXz5n7ZWNxlOyD
 oLvK4dtBSmdwJfTnoEwBXz2jl6/1QkV6bo/Rvut+34jVEVfyIqPcdF+epgmrBoQM4iyEAHsi9Sh
 BjVOaiiTPO3OD58zWhDJLuU/Yve+2YRWAzzO3jdxdU/szWUX1hN/Be4TqajgaCVkV4R3UQ613dk
 SMrf0nf7JlHTyRZ55xrr9bnVQwER2ymtdKXFmeIARcID2qtCv8+7WRxDLLUpAAeYIlxbmNVeS/G
 r2I+qiAS45WFz59orEe4or4XtpwxvuwKS7wKdm6zp/tyEiGtUttZB4OAFpUGluhRDJj3A6PlTgz
 iI73Ye31kjtM4a4cXvQMrZV/XZSqMxtnaqy9wjr//yXllvbttapt+ETEyc9xVTwoTZQtJkUCb6H
 OAuQPHvVYRHfMRtNRzXgk03fTFrIdsj0QEkfb1uhZm9kkBsDo4Il05OeDxZGvT6oWC3xcjvaecp
 ADCr6FXmPgTuOJ9Ve9A==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a1456e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gi8-7LNsYNYCFf7QGhAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109675-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,packett.cool:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF7C65CB9C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 12:33 PM, Dmitry Baryshkov wrote:
> Currently the driver only updates the EDID when it detects a connected
> monitor, which results in the connector still listing outdated modes
> even after the display is unplugged. Set connector's EDID to NULL on
> unplug to clear the list of modes.
> 
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

