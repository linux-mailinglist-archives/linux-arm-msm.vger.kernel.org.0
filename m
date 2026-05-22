Return-Path: <linux-arm-msm+bounces-109281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBjwDjZAEGrzVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:38:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E77EE5B31B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18A22302CE4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559D93D47D9;
	Fri, 22 May 2026 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aj2L2KfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWTVTAmd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2628536B07B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449800; cv=none; b=cog8KAxMmT3YiXH5K7ISq1G/aZUqNzeZuPvwx1NGdMJkDsXP06n3Py9PAhbFAUOyZrx7XSwDK4Vtz9hfeOEYjdtk4UsZxd8drN+VqkiLGrrC8xF2IYsdEM9YLK9Z4+uzICIpnOA7T+SzSCaw3saTBS6NwqviH4VX4k4mM8Vb/QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449800; c=relaxed/simple;
	bh=lKplka5Scom5Skfp9VxJAV0QJUx0cJa9rJvkJEEmRsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sko0h8OickyrED9S1gv3Xu509TNNV1NutSFhq1sNLIHT0UlMueaRjVutrPEhWWJ9HhwFdRy6auYixKRhePeuwmQ6E3ZCLL4AHwot5/OiA/zzgxIRMpfADNOLkL1M4md+fX2zbz4KhEylI+3p+R8whBDxkRLnfa2nxhuCD4+RdYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aj2L2KfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWTVTAmd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBZUUo1297958
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Kz1PaqWwTEocBZajiua4OjXbfEzHPpJqKHCbrC3ujY=; b=Aj2L2KfQaFaxDwKh
	uyLL6HufEkARLLv45DffTT2fIHAQ37lmu6axPOK4fH4DDwbY9p6AdohVE3qFm4Z4
	ZXHxNmDJ4lBo570XZT2fN70Ohc9J1LDdEscWvvX6umXsoP2Bo+1GTibwv3qP3PEu
	sE4AdZzd9NOaW/bbEih0wrNwJbpWM+oss3OR5bJfg0aHwfO9QCRurCYlk4U3U+3Y
	je8BrKri+9YBzbCrhCcr5RbrLAMuqJx/lCo0U3oP3bxZP6xy6kW4eeNT3rB/H6GX
	6fxjBlcoG66CHTChld5+hDdTGOyySLGt+MuhwL6FKfgmrqGlgsMqkAb6GE0ZYOS5
	TvxZVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0ar8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:36:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb98b09d3so22934071cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779449791; x=1780054591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Kz1PaqWwTEocBZajiua4OjXbfEzHPpJqKHCbrC3ujY=;
        b=HWTVTAmd8FF3unP//maMYfQCTOVBpRBfd+Pi2fiap067b2ielOhNUN3G585h48wdgX
         N8k2O4gDSFJ5tRaOozvqtburZ8AmlAYo9PCgSq4Qw4jLC1aYD38TS5rKx9dwHNgVzcZQ
         knJrEJL79uYBFKaufaNng4phjRkXKVY6rhIdPujjp/Nzbh0Y56Hwsc5HzIQLBbozj2OO
         nrQE1jHdxnocyr5G0PoYSSvr2IlxJYvZzHQhs7ZQ6fsHlsyPCsTQpxsQBYE/AnzoQ7sp
         eMCZg9t13XtlP2JmeRYg+scXyAVM/iOnjq9a1WtzdfglKztEhrSZUfraF7CpfTkJRq8G
         /egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449791; x=1780054591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Kz1PaqWwTEocBZajiua4OjXbfEzHPpJqKHCbrC3ujY=;
        b=Tg0spRCjfd86/pFxahN/zi6r8BTEXtiyszpFdz7WmR2t4Oxx8l9S861xfMfTC6QkQG
         OCPmo47jgAIj0a64mhaO3WZBCaDStDcgw0Rla0WrmPQo6uHZhHnooI/jW7n7+TI/Yy+q
         2spIkjbz/dMTkq07GJuGeavii3UuIFuojX+i3uQAHjny06v2bavsEcB3oqMSA8+YdZX9
         aE5oSUhzYKo2HnZN/WGEKwqMiQoewZN+T469nvMM6ngmXESxOYtMs5MnZ+Mxvk5Q9Brl
         IwYX5W+wR6MsxSloL53rIlf4fQQ3P+IZhv+npbobSn8xtAlE80s4C84Z+auwHeSv6XKN
         EFJg==
X-Gm-Message-State: AOJu0YwNtQYQaXCMRs5lHYcFz/QOLrUeDBlKUj8B9dnDvLSSCYBl26QW
	kCxOno78uWMwj4tE4/Z8fK53PHNR6KLOioWDASUH/kBm4w+BDiAXnYulQLWULB7gKYdDxyVrkdm
	5IAh3plK/OkdKcZQ5iLSs/sMtgxlQO/yYNMue/+OyH1sF+k8m8K+TP5tBu7hU+So8RDBo
X-Gm-Gg: Acq92OH6ny2y6mBkFg4gMGrqyqkNZNv44VueCtFe6E5pAgeOWKcN5MpA11q4SxxtNOr
	Nf2lbEsPp8DuW4lPyrp9P7Uq4p7GXhmg06mfkCYYWs+mH81inwYfTSZUtYz5NfgCmAVj0lJITCr
	Ecn65kwOWxeH63rMzpx9QDbHjlJBXf3AR78qNkRMypaRl5Nzs/nX9N7bzLB6aaYCjgxNfVtgu4F
	IZba/K3XCxpyTRi9Pxuz5TPqgGhZZQgfV3X+lNzUBYkMFK6EZeBrufJYOopXgo+HtenNd+HL6AJ
	xm2hTHHHfZtipoAPlNLFppVnx3cqtbynsQkJZq4DKuic61W6ldM2my+930lDNokPXxbSKYtNuNh
	MZIN4PotoCGQ9KFZdVvCxW1tX+bekDXfyE3KF5RnOfk9T3g==
X-Received: by 2002:a05:622a:17c7:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-516d43c245emr35211701cf.7.1779449790630;
        Fri, 22 May 2026 04:36:30 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-516d43c245emr35211441cf.7.1779449790279;
        Fri, 22 May 2026 04:36:30 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f60898sm614332a12.13.2026.05.22.04.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:36:28 -0700 (PDT)
Message-ID: <44b80ab6-cc4c-459c-874e-8cbc98b82921@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:36:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] drm/msm/dp: drop event data
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-6-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-6-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNiBTYWx0ZWRfX8VCeGWiZgHyA
 HcTpYmHaotbdNnxgo8yR0AyXDwTkFTlGpVGeUzHjsxsV+VNxPgolIhEp83qZyKeEMg5VRsnVV4Y
 MExWAUGxbsMHOrruchtJVlnKLgy6/OkZk6wNMO1jzbaGtvW3U3bayeT0XbdYd893dJ/XwmHtsOF
 AG/dg96CNySPVmLTDgd1Of3Gz+5IxSvNJ1QLY+OcEC87M5YaMxnlFqyhVa1QHs3PFk6qjymd6ev
 B6r6q66KHd8mLJ9GgkKEA6XcFC+hD3yhgEPUk279dGC6QPVK8qFZhZguKyPz+Rkyt6zy8yxypOx
 q/mtBYESOl+M3xTh5Fwy63iymwC8y/wSicoOYkT6WDDONWUAuPSiZBRdsTrgweva0rxJCYTI9bP
 jyd4LYixsucZFodI6z9VX99GIR07A9Ul0KnPqvpwq8RMYm1FBrjMGLIPyreB9GLzjUeK8iKjyh8
 RsLxclL8Qb+e3nl910Q==
X-Proofpoint-GUID: g_ipU3qVj-DstYX43kb49aCIpt75pygX
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a103fc6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WKJx3f7KLcD3q_vraEEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: g_ipU3qVj-DstYX43kb49aCIpt75pygX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220116
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109281-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E77EE5B31B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
> it, removing also the argument from event handlers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

