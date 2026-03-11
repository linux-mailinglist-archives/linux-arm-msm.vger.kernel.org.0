Return-Path: <linux-arm-msm+bounces-96791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ARFJGa2sGlvmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:25:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF29259C2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBCB73092324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4359327C00;
	Wed, 11 Mar 2026 00:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvwjBsyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6r6P3Do"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F233EAE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188623; cv=none; b=CJmPzmoOKBKFs5YFEw4l+HY/tCTC039JqroOllncA8lKmIf0ask9xM0VAgTN8ZFS7DBP6ufNwFyNt2tdX5NxrF0sxMeUydO/AJmHM8IYT+6AtIx+Q0E3wRzx3UsoMXCwTwV3aaNPZX9os+mV7ji3t+om4M2xToyr8rO65IjI0Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188623; c=relaxed/simple;
	bh=yDKABWnMSVKExRkVfuX4Vy3AGKf9nb89Q5HuKRcLQP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us83hP+dwg1fpf0+RXMTRW4Vn6A+PkUF9V9Je6MJEP6WLbs3AEGRjKQFDWITFX65STv+eUwGrkfq+srxrm95ZwP5QUYbnPHaZZgc2JXSMwnb36BSCXFldb7yt1MBfDhhwjTzvCb4vJv15LtzfK9VzdVVnIQMgMC3FwXgWXhgl1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvwjBsyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6r6P3Do; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIRwv93760660
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VPhjEtaeT5qzLf3ImkfiJTTXmU3WJ3dDLVOAxUk4GsA=; b=VvwjBsyoZDRm1N76
	FXt1v7YO+jeNxFUzceFZrgl4g0BgfTMbnLZz6inan/hAi/n/P7+Ln89yd5YTj6se
	GJRbJhUisrFZXX7Mc2Y+KMBmBDAXHjceiM6serwI8RFbYzD+ZMAejF4/XpZyZ4FR
	sUXhYzYGD40WYX8dmyrak7jpD49VkXUyz6DJvtPg15iJUu8zq5MRQjKCdqf4OixO
	KOBL2Mce4r/I3Qika+zZf9iTB5Js7l13l3eiug+9xA50VKHVumzCRlgB1NGCkxa/
	Vt8KJxAsrmhq6PzdwukV/TtNjhF87zGpTZX80XHqs1A6JNRbQLU6njghwErsNuwY
	fVH4DQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ujhu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:23:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd858e8709so2634687685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 17:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773188619; x=1773793419; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPhjEtaeT5qzLf3ImkfiJTTXmU3WJ3dDLVOAxUk4GsA=;
        b=G6r6P3DozdH+YwxX1IP+i9tV4enp7OTI6u1jM2FZ8CuX+xkb6U6NZwRxDFbLQ0cnxY
         Y9jmoLZicc7TM3JLpwzkzUd30D8W0awlkvn4D8FH9LBst5xHhWLXMsuxVU6sDf4PTyas
         gD1T+6dPlK/ptth7SMWnSF/aFlEh/4PaguScnzIntoLwOdHnLxJoStLinXnFkJ7yhqMv
         c+Ea+G7vVJTuys6gBU0PwNT11b6KxfUUOKzwIcXtHWwJSMs00jz18eGCee1fWVUvVoI+
         U6uftuR1QiF7BJGDViKDclgY+CEGHDsvppO/BPG2get3UliHSTnck7MVqSSqU82qjFrk
         5yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188619; x=1773793419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPhjEtaeT5qzLf3ImkfiJTTXmU3WJ3dDLVOAxUk4GsA=;
        b=j0qJRcbuSroerP9p0B7W0JaIoLtgswcl235oVI6SM/YsRd6t2YcRsYX+ZW47B6TFdF
         NHwr53D/4IMQhKseIK/IAMLh1sBjK1MH+rQ3WgYw+Zvb7GET6g+n6bIzYiqbwwQkp84J
         853/Qyhe144mayH9VRa/1W94KtWbyCrPodovObzCegAxDmQjIjl6ZfdG0I1OlvSe2O22
         31oEGFog/pXxIFPtY5PYFaK+mdm7oYU4LXUPqMtqO4s/ahwv4ydfjswhcTWxlj1eaJ8I
         c0nkyducoZhdgSWMW6PIdvLpJQNahNe113Ay6eE554sh9ab9J8hM6sKo39sqaCUpYYM+
         /23Q==
X-Forwarded-Encrypted: i=1; AJvYcCVemOn+b0paXvAdv80ZxZgdAKy14FqfCa85b85rsWyW6IMwnBllEelJBSPwK8VmC5F/zmDIoz/aSh+txO5A@vger.kernel.org
X-Gm-Message-State: AOJu0YxgvlJR5RMdgELA9vxBLyj7AzGsV2eAUjmSRoahHRhHZiWxGquY
	UnF4xOxrXSMYQr8lWvyIWMf51d5FwW9x5bNQnBZZSsl0uVodkADz0t3/KIqwGNwRQL0lK2xjw2v
	AEMehqSnAAzqRuEoPgHWmP42ehFDbfbfsNHd9rInBsimMo99SmSK4kHD/4cpCoDr0cC6M
X-Gm-Gg: ATEYQzwGzjrt8ioLjrG+IWwKWPTvyhhFCqP+g55MsnMfDuyiAfNd6m9dFMJIXVSWGE0
	6ef9l2ALalYfFg0LrH1DbrGkmzwncby4i359cyVuYgXhAy7E356TlQ70h9Gk2NSiC/x1W625efW
	f4ElXMezmV2KMmyUIFLKmDWqDUvnllu+qzWHJUpsDSnGIRAZkRxKUQPuJfNo0ArKVf17OyEUiDn
	hHTTFdQ9Yt7eZes+07BJjAoyvWAPWxRqHt3z665UBAPnk91381AdSewQMiw3+d7wWk2+IPy6aUm
	hYyXTo174m5O80T0dA3ZiCAx1AWcN29n/nyrjmnEMzRaYGqzZp+5fYQi5Y/5cDwwqnXcJaCm3lm
	6zruebz2V8y/BCgiCRZ4qUOtjeYk+0Pfi4Zuz9SmMKys/GD2dXpzJH1ZG0k2TopTfLuud22seJ6
	k3sddSy9rmmyDf43PIs+0L7vduoVXv46yNVvU=
X-Received: by 2002:a05:620a:c50:b0:8c9:fb69:e708 with SMTP id af79cd13be357-8cda19f7a76mr107204285a.25.1773188619187;
        Tue, 10 Mar 2026 17:23:39 -0700 (PDT)
X-Received: by 2002:a05:620a:c50:b0:8c9:fb69:e708 with SMTP id af79cd13be357-8cda19f7a76mr107201785a.25.1773188618779;
        Tue, 10 Mar 2026 17:23:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm107303e87.7.2026.03.10.17.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:23:36 -0700 (PDT)
Date: Wed, 11 Mar 2026 02:23:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] media: qcom: iris: split firmware_data from raw
 platform data
Message-ID: <2w4urjzvo3ccmwoggjzzxxjhfgmplfgd7ojj765yulnlkesoit@nfancaoqqvzf>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-10-acf036a3c84c@oss.qualcomm.com>
 <c9ab511b-c773-fd99-45e2-54fe619d3576@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9ab511b-c773-fd99-45e2-54fe619d3576@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ryRehU0PizWLvipYfREuyvP29BqButnC
X-Proofpoint-GUID: ryRehU0PizWLvipYfREuyvP29BqButnC
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b0b60c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Gqhk3HSNDyNpLDZ6Q6QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAwMSBTYWx0ZWRfX96t5W7SCIWKY
 FaaanGIKH2aEBDCvEy3wGsG1G+yrVgVzQotWU5eB0dlDfsoP7kQ0Vvv7+YgBREw+z3TevD91dCk
 xgYTSBg9hx0nKypNqWWY14hwXt6LHbU78fvBBnCim1E9tU5P8cd3VUarvONJwwDcnfr4ueEnnRE
 ghCzz/sVR5jx9vDez//HjbL1NoqgFeB7ciJZzBsjWH8zoT8qz4QgNcV7xhXgJQl7OPvQn1b0qTO
 eUIuthKoY0HLbhnpiOHxy0Y7Uthy/6ebX4MMIxpqrYwhsObf1gg4sCzntZ74/AS3167fYB4jxvD
 A684xX6170v2kPP4/V5voafCjsdIY5z1jINRDtromQEBRmr1qjMRkRuvJv2fglFca2mgXqwMytU
 PURh3EMtR9cH1NGIcSd8vJQhXpU9lRCakqUeTC24nsm6Urx8RtgX3tSnX7spzz2qIb/XqoyfG75
 Filu4ei0ZOXlTKQy0MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110001
X-Rspamd-Queue-Id: 0CF29259C2C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96791-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 04:28:48PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > index a936ab2aedaf..be3449861993 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > @@ -201,9 +201,32 @@ enum platform_pm_domain_type {
> >  	IRIS_APV_HW_POWER_DOMAIN,
> >  };
> >  
> > -struct iris_platform_data {
> > +struct iris_firmware_data {
> >  	void (*init_hfi_ops)(struct iris_core *core);
> > +
> >  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> 
> Makes sense to split firmware-related data out of iris_platform_data into a
> dedicated iris_firmware_data, one comment though, get_vpu_buffer_size
> should be in iris_platform_data since it describes the VPU’s buffer
> requirements independent of whether the SoC runs gen1/gen2 HFI firmware.

Not really... Your patchset to bringup Gen2 on Kodiak points out that
this callback depends on the firmware: we currently use
iris_vpu_buf_size() for Gen1, your patch have used iris_vpu33_buf_size()
with an explicit comment that it requires a bigger buffer.


-- 
With best wishes
Dmitry

