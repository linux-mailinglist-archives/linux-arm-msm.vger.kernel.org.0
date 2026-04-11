Return-Path: <linux-arm-msm+bounces-102816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPU3A+Ga2mkC4QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:02:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A53DA3E1665
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E65E0305777C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D5D3BB9E3;
	Sat, 11 Apr 2026 19:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OP1m3gjg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8RdQbGi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BF832D7F0
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775934064; cv=none; b=XfaybEOvdZhR/7zCQHyQSYrvM51hxoPO1qaqKr/cVebgdLk0ErQJ9HIffaZiLwPlXlseNV+7z6xvl0exFa8tWFO+2Ldgp5WRPZ1qgFs93Kf1D8PCaUlKHZWEh7ZpR/xyCmD1WCPBTxNWi8vNYQW666klSiBZzKGgoyf+D/1WbUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775934064; c=relaxed/simple;
	bh=/3Jz/Re56tU55WwtJFcRq9HSeNe8As5KdayXahB2h0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aN+/zOK8JgJD3ywwKU0Xzd3Vc6aPXEjBYjG5CwRsmY1lLyjNFCBv6uo/aBMS2EwT2Vrz45LmZ1wYzpMOLR0qyKWfi65gMAR44kI9hy+yq5Rzwtk76MhonuLHRxuPMDXSDJvfW1TRNP/gVm1l/+SGvF7dSD33anXX2tsp9dX2elo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OP1m3gjg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8RdQbGi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4dcV33873567
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8lAecCydU/DEIXarx6eFr/Hq
	1NW583jqB5z4aHiYQvQ=; b=OP1m3gjgVAaf1Yv2CQ4FXPdmg07m+l77vT6lX6tK
	muCdax8rr4ZU65ZaEefWZJ/uVvTvVoWrDnJ3MOAseZD8Lzeq9VQr7CdATCeW/GeB
	f++qlBddk2BRhZcYJ/3EL/UjKo5xZtY2nkVnMLCfaGfWiGFwPdSH1uYE96DKmf3F
	GrMAm3TY3k0Arv423IgqhBjxDJx5qBE9JeOq+3No+KfMdbbTElAjsLGDz4TIJXUR
	qRxeY0aUHU746OsSZoySQ1Xk0Nbbwkiz++3Wpk0gcmlLcqJv8zKUWFRKUPJ4Qlv6
	rPsvHxWnrz0SpGpDOcwyKjV6pPO5IHw+f8/rn+AA8t++NA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhs6ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 19:01:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso27049621cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 12:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775934061; x=1776538861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lAecCydU/DEIXarx6eFr/Hq1NW583jqB5z4aHiYQvQ=;
        b=H8RdQbGi/2Pudl7/CkHobMH9i8U3YSC6j/F3SEyjG8wuER2y2tnyIuuKIBzIaPKpRP
         zdBnaajpLxINYACDzYs8P0sJ2GMfZFNEzoSmf50yKd4NNN0NQ9s0oxYJuIJCL5kfiFzR
         IeFLgHLXVaVugUxxNkSLehgReSs+UNZd1RlNN9AQoU0LfoEoL5uXDIwLMttBGXKzX7k5
         JpSEldCPEbSAymKVaXlGEZoibDt4pPHF/CMuuPcx4nthbzF0IktCCSgJckvyDhWfZBTj
         XOc7zYFzKWcNVp9wuqvSoqNp/n1/nuGfvKCpu8HkbREMLUz/WO8RXV2cqo8Wp7Ssvr5M
         gtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775934061; x=1776538861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lAecCydU/DEIXarx6eFr/Hq1NW583jqB5z4aHiYQvQ=;
        b=MKsS+hoFhXEJYYgSqz9KvF6zDtemCHeiwwDaJbaBhVuoWvPZtsfQhPipeJPCTlRz8L
         T4FrGtaUpSRtqcQ0WhCKTSVS3PAsrhaWAeZ6h3OKSZRvUvAeGjDvnOUTYyqazye2GS/Q
         nATOJmyLMIkG1HBTcXwxJ8tepB/jF1LjPXJTHjAx1CtAiQ7Xte2EuFki8U1O+wg9kea2
         je9xalAS0YqQaHYw25qIPiOlEpiFS9i+ag497SHOplTcNCqqvL17wdusamAKYFlnKr8h
         q+NWq4tmKP8c4yb4LwvCSJ8275LSiizMG/PmXn5pHQmRhxeESaiOwV20DXzI+KF6LZE2
         2xYw==
X-Forwarded-Encrypted: i=1; AJvYcCWQSiiiL7pShI+nFy7q6pHApGVMBC2wvh4p9uJDdHh1u9hO4KNQscL0+RW4rD1GVb3LnUND5SwxH1q66VYb@vger.kernel.org
X-Gm-Message-State: AOJu0YwyZ+uKVOxgEEYgtReImaFZDMv5b8E7LMikRexJLSMbOWmj+c1R
	QDrbTMlZ9pDl1BspF58aH93anYiknrMQcB18BCh+UtLjCQfQ5yIVEl/jYL2SSbNgiauBvio5sCb
	zmtDitk/9tiXzIdGBiovy9UXkjz55mca9nYqZCF/YGUuUK/PlJbaZn5tskuuVdW5FKE/j
X-Gm-Gg: AeBDiesrL1u/2u8U9HcrlRzu7MS8K6vxrwiRZqRijuPK9FcAnNM4E53TBi3KOBhxgvZ
	QK2zEbe5Y0+eirtIu8nbRfTUwoWZdwlumYlrAYB1ULzdbjbDNdi+VDSR/qwKZc5YygDzKVQ2JBu
	ox5H1XM6fDbxaNE8PiFucPJcCtRAC2MpvuEm0sBdt5W0ruoK4N34LVYeHLmVO6Zc0iv9rwfos7Z
	vBXFY/72NonLqD/3SOrzT9qIoRXOnNIrspLTRLQFIgvGs0dG8x2b4I31ROQQCPpOBWseQElrqrZ
	eEhLTUCee8OpPkKIp+lVu02Dp5RHRCkqAELFn+NMYvo/4Qi2vMVnhDoiBMUY3DQbUgz13aNX4nH
	lOb5HdJvASkDr29W+i8ZTZN8vL6tk3XwOJr0KzOetCvFKyIF5Gz4/kSbkQ8LsEw9OFEQM/UCUoI
	Lys1NlGx0sK81wwpbU3u3onK6/EdoGyKesHxk=
X-Received: by 2002:a05:622a:568c:b0:50b:48a6:6ba4 with SMTP id d75a77b69052e-50dd5bdb955mr88685101cf.48.1775934060431;
        Sat, 11 Apr 2026 12:01:00 -0700 (PDT)
X-Received: by 2002:a05:622a:568c:b0:50b:48a6:6ba4 with SMTP id d75a77b69052e-50dd5bdb955mr88684381cf.48.1775934059916;
        Sat, 11 Apr 2026 12:00:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e55804ab7sm8921471fa.30.2026.04.11.12.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 12:00:58 -0700 (PDT)
Date: Sat, 11 Apr 2026 22:00:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 20/39] drm/msm/dp: no need to update tu calculation
 for mst
Message-ID: <gicn27nkkqtlipetgwguqrobf34einjyqywpab5r5qdlnuya7w@tvlzlanzzg55>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-20-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-20-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE3MCBTYWx0ZWRfXwQN84mINqoU3
 sY4KJ17X1zJiV+Quf+i7OPD7AULAcg6dB1FDT+z3C1/bd+XgHyV1+mcEwFwbNGfsWwHmzpJij8p
 vso1QD/Ig9T2GMidPVKKqDKOGPS6cuUnOr8cz0/xIBN3OuM6CXaQStx/R1ukGoICKC4OHpz9JSm
 rubhz0v5xuEMkkHodmLWxT8YgYJf2saUitJ8QcR8tg+jKevtFIdbDB1HTVeD+3g0azyxOZubMX0
 SFpPVeQDBBuw/P8i5V4n57TOwj9Uo+RV+S6KGs+BvtF2qe9zDFUQgiV8W6jsHlM7xupCLTA7Tz8
 dWZ92t2i8KVmQloFXvNrmsowy5snUVB7rLNQvv5PqoFoXPsVKAwZPGBJa8dUf11Dp2Jq8VzV08Q
 tF2BNP7Gt6RAwRjTo3umFR8/Q1bVJ8Mw8lZjyEN4iHLtFEhgMplv7C64ZdopmDWdNs4bhEj8aze
 9PpZaTX5Gn+39IfxKzw==
X-Proofpoint-ORIG-GUID: Nk0wq7v3E1_2CXqLzQMvak6Trld91ZZL
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69da9a6d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=u993n8tJM2PNW2rZaDkA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Nk0wq7v3E1_2CXqLzQMvak6Trld91ZZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110170
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102816-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A53DA3E1665
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:55PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP stream is transmitted in transfer units only for SST
> case, there is no need to calculate and program TU parameters
> for MST case. Skip the TU programming for MST cases.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

