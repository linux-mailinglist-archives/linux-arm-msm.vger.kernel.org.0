Return-Path: <linux-arm-msm+bounces-99602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECMuML1iwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:09:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE6D3063A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 302AB305857C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B63D35F165;
	Tue, 24 Mar 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OE+Autr9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqSAohCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60905387372
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346636; cv=none; b=p9YmPa34BY4KLaIZ0u4hFyQu6yRUCXb+C8zG/HMBFCwm2yvnWnryJ1tXasWUVVkh0sCW6h7YUEodyfzDkX6sxUWg/TYXRfaE4778n1yduHz9k3n+qHtnPCb2WaOOd+gtInxzV2Tk7LrEeHMGMwWIyjhI5c5o+Ks6o/v9v7GYA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346636; c=relaxed/simple;
	bh=jd2SLG0BU9tK0VyKdbrPhOg6Ml3EEcXoi7GJD02AaXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xp9v04mTKhb1nLrtg4WaeEqhxF5fnk3Eng4U90WhqJbV6Vz1YexIGERP8BMa6KswnOcp6DkchNgqSx4A9Sf9Z8O4TUPltpcC2igHfikHQyY8MlVulxwiCmS/lXxq+XBcBGLdu6QUm+eSvbIm67QFxSeMb/pSKTKDgw85vBnNQDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OE+Autr9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqSAohCy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9o1Hx4059895
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8EZiHIjdanBhV8KTPPr7I3cX1eSVsJPrp525ZWH7N0=; b=OE+Autr9v7guW8zl
	VLY9gXRRjWOMSINfds3CEYmeOzsXFjz20hHJSmbOX2FqrXorJnsyGK8wYrSSzE27
	qoRhWFcF8Z5fw8XTwBDhNBx/0mFrWEJfnU4l7++S9T6sQK+3XF2Y/sWuMJ/k/1hW
	uk7eoV1F7v2Ygye55/AeTsnuIlg7yjTJfguDAh87LM4FNVoBldO9mFcXIeLbwssH
	fCPIU/4+zGFP845+XLyTBXUrncRL5gS0GtQ0n/tFTDbUQGowIrzo+tK5Njk5ugH8
	I6nKiDDSW96ES7rfNMFkORel+aOCZyJ1P8O1X2MpUOP/3mFLCm9M+/xzQ5sH1Y5/
	D/DioA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jsksbpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:03:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c867b7d6fso31973656d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774346633; x=1774951433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8EZiHIjdanBhV8KTPPr7I3cX1eSVsJPrp525ZWH7N0=;
        b=SqSAohCynYUmJIP0S6RDaQPlFePoF6YmHXjGXBWd1gqL2diFZgAUG/9fcNJb9NNRDM
         GQ+1nAKKyHdDP7+cDAHvaLsf8qLfCmoyAL7cRlFrNzU/qUVZLRAQ7P47BXhfPZzTNkOh
         F2ghBsEevgYsQDlYoRXFxvWPqdPmX4+0FcuFTDSvlMPrwaa0h6D9VZZADUoHqT06It7h
         X7k2cRbENcsf/y8iMLaiXiKix+J6EpzT/ZQ/gWQALeOb310iWUnkXoY6Q3vaPNl0gOuI
         RTvP54JWmbrDa86H/LHpMnBORG6WaXiQV0Dm0Hn0hcLtVdOdBw1xvsYVOz0I3B1pNt4o
         zjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346633; x=1774951433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8EZiHIjdanBhV8KTPPr7I3cX1eSVsJPrp525ZWH7N0=;
        b=N7lzhXAHBuOA2M9TuXkNK6i/Vfbuhz6CkADnfZNbZ5oYG4eQP7ltHwLGchCtEBgJ3X
         gsW7tvyHfYJ2ZwEvX69eY9mEW2TAnIfPiGMnicbTh2dlyUZ44jthMsDzTFB5GRivCSh4
         su+Jxv0GdHKUV2sgDtoxcYjXC52Ctd7sE9woRoJRkMu3HymQSyIANRQLW6eRthcthokl
         QWRnuJ0Sv29YcZNzQT+yVsnx0IMmSUVkccA9DyponVu0QEBQ3oORqsKfwo9zCLC+vjQk
         7Cl9ry310hFu3RCsqiFbWKnak85biHIGrW/4oIM/LlEo5H3XbaQMWU6AUpa63aNdvfnV
         WISQ==
X-Gm-Message-State: AOJu0YxcPTjpzV7FdyFOnkk5aSjfZ7KjggdZhoJUxwkcbOyrk8OwhBVW
	4MhvgCNoIAoEjxmZZ+9HcY64bRfsEEmDozmimnTkp9Zh7fY1zjHrI56AUtyeDadZpZs0pqmPrnr
	w/8nHmFGJqIQ5JwK1shaP2iXJX6CkKlUpS/bTmlGHxeZuLphpb2u0yx97rNUhPhTgY8YH
X-Gm-Gg: ATEYQzyyU0AHV/Bzvxyt08RXARyMsf5CMqzfrJN7nu63d1mwuhDyDt85+gd4oHI59GR
	mMCzhTJa4FLahkqYICJVFfza8OuoHp6owRUshsMQmp/WVtiOeUfMd+RPEcTioB3rWp0al1fx3xb
	j/qlNbLGkTbt5okH+TYupDVxlmtNDglo/wIQUADUcq/J+6JTLr3tVeUBiL9oi9L6pRIchFp6dmo
	+jwlo6WG1L8wlsb5Pcsr/FsmWrmIzirEhTEYSVCWDHpVk/7xOnUFGK4gNdmsc5/SFJwPGaQ9T1i
	Z6m/FMMjlWKGnVD59vlFDkjj9hwy3dQOAgML0gsBO3JNhmBpSby1GG3AymHBkfFJ7m3EZZwbKsm
	BOTinLGoBTVxtD0tk3O2nSIIgvnktNFsqOHXvXq3fFyIt7sFJlGlBeZPWDogy2/Utw8b3m23Ogw
	sJ7CY=
X-Received: by 2002:a05:6214:301b:b0:89a:595c:b805 with SMTP id 6a1803df08f44-89c85a421acmr188082406d6.6.1774346632625;
        Tue, 24 Mar 2026 03:03:52 -0700 (PDT)
X-Received: by 2002:a05:6214:301b:b0:89a:595c:b805 with SMTP id 6a1803df08f44-89c85a421acmr188081806d6.6.1774346631903;
        Tue, 24 Mar 2026 03:03:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98416ac27asm493991066b.59.2026.03.24.03.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:03:51 -0700 (PDT)
Message-ID: <b64447db-bbb0-4457-b803-ebb3eca26107@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:03:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] drm/msm/adreno: Implement gx_is_on() for A8x
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-9-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-9-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4MCBTYWx0ZWRfX+Roy9zNyfgGm
 H88vGIvZKEmLx8GEL+B3s0PGkSbQUjxcKiTTp+JyYSIxSWBCSYMQoAskwI5YyHJkHofDIikHZ/l
 GVpRk2ZlvXFa8J6+psa/8EBycQLvsS5pfskr8owjCmqK/HGsw4AhmpBVX3MMSDbdumWxET1SLVu
 7wouo7ggjsf/PbQIz0+3Rg7kxW3dUUgQRFICMMdv8sYnPQqxYBdJgvgeETH+vgMWaXbGNYnfYLO
 qQ0YzRyoNw+31MVVM66tyBbLd4rq5QQGQN5MbFAYkd2pkLHuwZwg9jHx7f75zHgiEOuAKXg9i7I
 LRziqKF2bivs7ItheXxAl82wX/ZOHgX9V6IwfmXjk9qCyUkgEDtgInbvZPDO8M8JdHnOI/FxQRI
 zoIbW5sMvTtNTUgAvW3VgK8B9edg9HgjjOgCiTGYgzOTGhRQRf++9UeZrju1IIMKXBkWBYI4zjd
 3GLFARuu8FDRPgO1CfQ==
X-Proofpoint-GUID: n291vp4lSNrf5BnHaUG6ZiiA2FHOFZlN
X-Proofpoint-ORIG-GUID: n291vp4lSNrf5BnHaUG6ZiiA2FHOFZlN
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c26189 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Kz8JN9e6_yQgur5BIIAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99602-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1EE6D3063A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> A8x has a diverged enough for a separate implementation of gx_is_on()
> check. Add that and move them to the adreno func table.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Fair, but then it'd also make sense to do so for a7 which also
ignores SPTPRAC and has a different bitfields vs a6

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

