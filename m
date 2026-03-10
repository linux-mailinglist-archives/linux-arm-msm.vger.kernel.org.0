Return-Path: <linux-arm-msm+bounces-96696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GJ2AjY4sGkKhQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:26:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CB32535A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 16:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FA21318ACF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9EA39BFE7;
	Tue, 10 Mar 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqlckCd1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjlqwoYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6673F38D6B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151341; cv=none; b=QbvH7xn+gsvS/wbi7hnMU5z18vkEMzOpl7hfeEJxwEnMTfB0vMkAB2oa1ZVCiJqZhVuHrHWKCTVxLkg1nVcSp/gIA2ouN6M5/tvLwNce59CFv93IIwnv0yo8U1s1F37OfttSg2RIO4fUhLchBpaTxbEHXeQzgkqq9f+EtIX3H88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151341; c=relaxed/simple;
	bh=tBteI/mutXmZyThXvhdT8dnMV4Nt/9HxeKVEnFff1e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojdgizyYXTHtw/3JbaTfZJC+MXUZFACfdebVBhbjZGFsRKZeOmYZRicj7gVj5178bNHiVLF2GuXGRUnNqqA9GCu/QXnU+ap9UtpcUJNhCs2hQrFvK3zvWYP9HZtSt42AJd9X5vSO1Kqw5dhVTWhmAczDuD5zWC/+OPWeyM0xiLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QqlckCd1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjlqwoYU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACab6M1503208
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RZi0JQZxdJqUQRh774uAQgi/Oyy+Zwrke+zXe1doqU0=; b=QqlckCd1vPOzuA46
	zpic3jIR4tqDzvDub1gY+sRYalG4gaHg1iQhpMCEA+vt4DIYatra383d8FdjWQhv
	AJ12+ve+HNAHmR+J1NK+pVFCUKRZxf5XbI8D2xITUbi3vKous7dWLkptiPX9fCj9
	FBTb99bNf4x1hqPtpn1uaGgwDZJhwP122hX6HF2otrQOKpbvpZNrBjNAUTke3BVG
	jxZ5rd1HyICXqPEXomNLLneUQ8Yp/I32DZ6kTLuHg6sgDdw93r2zMR1DEeie+YFz
	WaYJOX0tKUzkZXQpept7DVGESpnAScSRq0OyJ7T7DmPea8E4KU6F6ZosEoqvCINV
	uxHZEw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8ht98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:02:18 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-417490c9e7aso1859145fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773151338; x=1773756138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZi0JQZxdJqUQRh774uAQgi/Oyy+Zwrke+zXe1doqU0=;
        b=JjlqwoYU6+3zxdOrvdCvIpjVJDN4WltBheuuoypOgNoVY9z7cCuydBGipFwlkFOZH8
         I34XZYjqNG740R3yuJJ35waftw4i8kUN/0ogV+oeN8HGsFjf6I8sGTCrQ68Hyihy8nOH
         VaVn6CXh7+bl5XcrtwBjm7ouBdRzN6w2tjJzp/EwvR4urpePSD3wQAtgtfqCd9RsUZkJ
         MOaj4wH9ohF5ysiJtAksb/YVrE9OEKlIv/vZeqV87BODyN9eNlwlgzQNpjMiV/jogv+I
         mi6nNtAD94k0WklnOJDYrE8sf8hzc1hX5RAVtS/qiZO++1sQE6UhhSSQ0L+AOUKAfeQ3
         1x/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151338; x=1773756138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZi0JQZxdJqUQRh774uAQgi/Oyy+Zwrke+zXe1doqU0=;
        b=fmQNa2Th8aok+rsqTLSyZfimk3oVOCuQ906meiEbvgbgMeRhO/YR0yxsYSZcas66a/
         2FnlizZgSwsgGVeAhB8eJWUqwF/fhJw5NhMOconzXtzOWaHsRiE3ruB2BCLVTk72pwmp
         gJXRK62nzko7MAhqe9k7Dat60Yd3KIx0cJUhbZkUUSJhtIzZtpS7qeY2vYWpZd+G6497
         PIyKH6pQd6C12MCew6YP7x4HWwv4byezgKksoZbad5qQFv7XuPcSanLjBh4fk41+T8T+
         xu3SvC3vsDK3usbYIQYxLeYV5123PatAW++FBdR66QDBT7k+gEV2Vj2SXwEg0RMQ9G3j
         My1g==
X-Gm-Message-State: AOJu0YzoCvJLiB/mPbDYbCLRBYC7GRT4z8Rrb30CyAo8+Lc4RLGA5kLl
	KploEpG+/DWNses9DULlzluJOgPZunkVfFKdebrJYvpcemwYqEdMyKKicEZ7iqYrKbmTId4BMtE
	GMnCJczla09U+1FSSmObCGo3NxkilzYSoMzMPFh1NvFBhqw2V2li4hG9Cv/BLo4YY2VhI
X-Gm-Gg: ATEYQzxiFOMSOgUC+46CIS4341pRWkp4FjazmBmngUQU8RU/RyIvx1cTC5/YFJOjZDb
	bvzE2idcNy3lwqNp0Lo7agyiSq9AXYb2ZGFV7gL97PcqP6/EEqu26xX2jwmGIFUGF1S4dNcycT/
	3cefaa9SucjzhOtocvY/C0fXJYdK9BWSbz5C48QNU+X3rJYOjU926ku2PkIuNsCbRpPWS1rgJsK
	N0Zv2KHHjbQlpZXKARvQ9uJDR18hWD7g3KHwLL4jF8zTVZLZkEmu4VZRfU89MLhOFAzqS8t4uHA
	BKLbzRDpoBPFVbJ//vf8IIO//7+MXlN0gZb/Jqt6nDPzLvNPFPu0Z3sGYAjIxfBONEK675BkHXk
	mS7MSGFF64eVZ4RD3zA05ckkDnJweB/OOEM9FqrNKQWDkbGXfQgInKESxN9kMPs3eO5EhGyY/Tb
	4S5WM=
X-Received: by 2002:a05:6870:7309:b0:3e0:de76:31da with SMTP id 586e51a60fabf-416e447104emr7118295fac.4.1773151338033;
        Tue, 10 Mar 2026 07:02:18 -0700 (PDT)
X-Received: by 2002:a05:6870:7309:b0:3e0:de76:31da with SMTP id 586e51a60fabf-416e447104emr7118243fac.4.1773151337199;
        Tue, 10 Mar 2026 07:02:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b6a1sm479982666b.18.2026.03.10.07.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:02:16 -0700 (PDT)
Message-ID: <0e48a074-d6b2-42b6-abe5-8644ba1f1096@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:02:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] drm/msm/dp: Drop EV_USER_NOTIFICATION
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
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
 <20260305-hpd-refactor-v4-5-39c9d1fef321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-5-39c9d1fef321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyMiBTYWx0ZWRfXx3SylJpFaI9V
 2DXV/wJtNK0pU1WctZiGiIPn7jDLrXqBP5pswYOdni4GqFDsbtJw7SN/vaFUSxUZnnAv8Z5PZ6a
 oFkTqSGk6G+t+tY+WfhVo/sJmXcvsBnThuJaeTh2F2xaZeRJqiCw3qz6po3+35uP18P/jHo5CYK
 RITQ3lV0MvYPU0SgqZjT2n9O0TORlsgPur5Z5q5RSYLr72RnVquqkCTeAnp26tAmHcR8gKSdw5p
 SBVtdXKe1K5hk7TcTKiTHPh06guXMJIhHvbIh+kD3IFgKVP7eevW2p9dP/Ypm9BQ9D2FvKa5Ngh
 catGDsMV8DgbuOAqm0/rA9oj6eyj6GsIWYeDejXx8xWsocz/Yv1S5UPqR9LaaVUOkrq78+DBnAj
 X8ZR36w6mmBEJKsxrnFbmPUSkdA03ffWC7EIBcxi54IE3pbiG25ngBstpFgPfsRhANPBhNLc/V9
 Px5KZ1qyxx3WypTsIHg==
X-Proofpoint-ORIG-GUID: QTAMJ0h9f_x05yHHRyPZVRBH4NqslJBi
X-Proofpoint-GUID: QTAMJ0h9f_x05yHHRyPZVRBH4NqslJBi
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69b0246a cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ls25Rwon0kCaizU-UYAA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100122
X-Rspamd-Queue-Id: 09CB32535A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

