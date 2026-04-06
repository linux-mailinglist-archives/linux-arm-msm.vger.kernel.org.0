Return-Path: <linux-arm-msm+bounces-102026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ/eCvhE1GnVsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:42:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3A63A83FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BB44303D703
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 23:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60E232ED3A;
	Mon,  6 Apr 2026 23:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeI5ITP2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htpoxX0T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D66329E40
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 23:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518933; cv=none; b=pnfWEXODfBCfUgG9gJONqDfgeovCCJqMBqOQvuD8fNolOvAsEW6GxOFegAx3u+6NVJZ+XyRqziH7/yJHsC82Gn+QO7g25Ts2GZzXzjOPzpys+zJ9s6YJnnrnZw39v2x2LvT82t8Q1rYQy6yyGRtg037lLKDML3+zb4ke7CpYF14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518933; c=relaxed/simple;
	bh=A/ZC55BX9AuuO8JhYpJPV+aRzj06JPz4hs4aCF3FLTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JF5DRA2uYB/O3qVBXsR3DIVwrAgjJhLToYnNPDBi/el5vTaQXXmMzQ7zfQBKspuGLrSkv6ZxBAXkrwTrvCFcWFyXuWRiBfPwS2Sxf8Uzc5PigurJxjK5hs6rK6UFefHxPVARSCoaX2G+emp0ENQqkGk6VqLinNYXcY5DB7UPa1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeI5ITP2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htpoxX0T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LSfFu2580030
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 23:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNsoqgn0qsYo2CivFYV4W61GsPhxl1xr5ncIUdQYOj0=; b=XeI5ITP2ibIhprO/
	d2WcEa+/EkEbfZFdLa6qvGWt+wRawuASQFcnHwWdERHcbot13k3gNC7NdSGkCFSS
	peTTMsq0Tlo8qs7dIQCbU21IEaAMGTI+AmuYOl1MibAeQlx4T39DAqlV0WFi0h0H
	QOPncSey3xZUuLT8bhUbHkcEImGVzylW2Mv9rtTUsUJpX/NpFp+OgNfNthIS2CPS
	vzvVVhltulKyZphZqPCvZawq+x4IuJ942nXTnOgjggTw4J99oI+pmr9Qk/g/yGC6
	gHUFGVlfELJrV3vn5WiiLbEWuQnyM8PaspfrKWIR2sznRrBQZuPOvURyh1kQJ5b4
	e5iSVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf08fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:42:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so201974301cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775518931; x=1776123731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNsoqgn0qsYo2CivFYV4W61GsPhxl1xr5ncIUdQYOj0=;
        b=htpoxX0TJuIub0BBQAyULNM8gbxzdnfZvaMcC5YiTSXWPzEZrbJFVcFDFPlNstHKCt
         /Bdc8G/29Z0UDKYBIoG67wKJ8J9beQgTZ7A/ZX0kQ6VF5NbMmahewGH08nmCNEm0jB+B
         YG7CqSNgfjVWjF5a6dEMQ66Zmng9MUbKwdH6puAAzUErIoT0cC19uRozYzTAiQ0h6lBG
         jW0ufLi+93CmEH/DZhf845LnsfhyYdKGI7CqA/ytlt5hJ8umIb5+0UX64uo81iQnCopY
         VS2c/HPlEzoWxZvaJ/XG4w7KZJx2yY2TqEaSVxgPwzGzVJ6k0mZ6p4CF3d5OjvodVUla
         7HVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518931; x=1776123731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WNsoqgn0qsYo2CivFYV4W61GsPhxl1xr5ncIUdQYOj0=;
        b=lHOlEazhPTQsFONsepemPEu01dukdsHPtPEFigbQa4ngIQE9iG2UgsvTZ39+IxH+6b
         4kqr73CaBpSPnjmWDkYU960Vurg7Uszm5aHWCX+c5xCL4wJcgbJ+q0ToWp28CDhd456Z
         M+OGkxqKvGR3EhRp4Bqvzn8Y4GIMoC0g/4F5WBj0fzKxR0CNWJ8itdIbv+qiByuAfuP9
         iyNLSEr8jzB2pt4BtTQzh4PRJ4IFzokn3WnicT7XOaPI+2zX9Qgtuysiw3Dtwm8GU1tB
         yRh49NxpOHFWktAmJoVWJKK7d35+suRrsgtJquqXENra0yT3cI1pa5TOJX39QLu6ecw/
         9HEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1qmxIedhX67Tca7/IV8aIV31VK2sOHuZJdNDSilOIgc/bW/4qTk21kBXM3/HlQ78SYWpV4L9nZzTfpVkD@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/3ZvbjuicRdE4RZdiNdvVBcbPGyiA2dEJgI0h5oldjrQIblr
	HUfTqaYp97++bXyZxlvjxOTy+1tzDnWYIK7OCPg0J2RkmMfs88Zk2IBwSz1ZRbt/C9VgCHcjJEF
	wvuDIrtcJJBZwJB4t7LfwLWuXAZ9y6J9+tuWbNehCRFZzHYdJ0Svz4n8wlYqwXVofUGrl
X-Gm-Gg: AeBDiet8aAywwaSKOYOvI0P08zAPWMsrhogNeV+jsfdCM/KZwyzgaMDz+pCGFENcon/
	2hEmPyLO3Vv2yW3hi7aO6TP4W8utOy2W7+jsrMe09+IMANpZ2TZ1tNlbDRl3ioVYuffJKGCeteU
	IBtNL05oUqBRqeXOzcsngvq74ayt8gasILZ5mby/9xJChMQz+3Rr/hc1HwFScicef4xV5FySwYy
	FopMoYhcWvH4kUJAfd1Hbwdks1pgmJVmUA3hGGjJlNYET3e1h0RtjbPSI+P/+i9IvgISN+5Twir
	wkJSHy3OU4iuo16TI/wXCBQ7dEQdse1lSDKKyxDsqiBAJO0E6vsaBEkuYh7ATOAcsfm7IcV4t75
	8rKs1se4lKnwDc8NwEypaW8YcwxPME/vzJCree+svIhSnPYFaX2tIeXI3F2zu1t5TZCuQmPbeSX
	fX/804WuopicJFeBZqcdagFUPopv6us3ptSik=
X-Received: by 2002:a05:622a:1e87:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-50d62a7f7c0mr232213251cf.34.1775518930722;
        Mon, 06 Apr 2026 16:42:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1e87:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-50d62a7f7c0mr232212991cf.34.1775518930256;
        Mon, 06 Apr 2026 16:42:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm33512011fa.39.2026.04.06.16.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:42:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm/msm: Use of_get_available_child_by_name()
Date: Tue,  7 Apr 2026 02:42:07 +0300
Message-ID: <177551403335.616257.349939919049063044.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250201155830.39366-1-biju.das.jz@bp.renesas.com>
References: <20250201155830.39366-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIzMSBTYWx0ZWRfX0KqGETMVagSE
 pVNLGp6MzMav+TFqBxCeuKRumEncRhefIjYZo5mmc41tXHDKr3FaeQedTv8FLzvnrnhE7/Ul0M5
 lzqz4VAKTC23OJcP5hdfqqAQWyuiVXcH2lSFD4Cg44d7EK6Wiwm5m1kZdzvrDWt2yr+jNOO8Ksl
 nA5h/ht45FjhQ38s5lNy5QyRXO7YMKV2sAOm0TTnwj75zNGZMD/oA0lkq7cpYjC/bxh5ulZMuzY
 wl2OVSJW8Epi3j5ceCBtFi4qbl9dhAuNyEl69Ab+z0Ptj7VJzKQcL3A9NVjPS1HJO2KfKLpqFFp
 sHcFOjlmzibdpB27fGkx8kg4EXhNrFLK6pm7QLhN6f0eCkEhQ7A4rJkKSnfjzqt7iaCER7nm2Vs
 p61oUbssW9LMXLtdxOrv4t4dFEUTJy9MMIq+72Vr8wLdGDq2jXxFD61HhxfsX3VIQ0xgePBEX7K
 fvvSxjTv7Dio3bVSvaQ==
X-Proofpoint-ORIG-GUID: 9D8RuSGvtSbidxXB0Rr6n02K_L-bgRWj
X-Proofpoint-GUID: 9D8RuSGvtSbidxXB0Rr6n02K_L-bgRWj
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d444d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=CaYzkkbPpyWDItnn5aQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604060231
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102026-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[quicinc.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,somainline.org,vger.kernel.org,lists.freedesktop.org,glider.be,gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF3A63A83FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 01 Feb 2025 15:58:28 +0000, Biju Das wrote:
> Simplify zap_shader_load_mdt() by using of_get_available_child_by_name().

Applied to msm-next, thanks!

[1/1] drm/msm: Use of_get_available_child_by_name()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a972d1b864e8

Best regards,
-- 
With best wishes
Dmitry



