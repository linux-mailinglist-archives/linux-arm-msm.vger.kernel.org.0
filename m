Return-Path: <linux-arm-msm+bounces-106336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P5GNIxo/GnzPgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:25:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72F4E6C07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 12:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C35330068DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 10:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A259347FD0;
	Thu,  7 May 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TqKvcUrv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhV6p52s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695AA3D648F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149513; cv=none; b=cPR4THtoBWdwwlhsg24281ZbDERb9LQ2gcAq1HDiemfBP8OoK7+Obm/34MpDaLv8hXK1sXALxhjJT2ojJW0uKI+RTcS3WdNUFDWbRlNzE0eM9mxzADqsPoyeWq1uR6vSnrdbnsXiFBslqoXy+aWTEwJ/5AAnwCvvaWOJth5xvBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149513; c=relaxed/simple;
	bh=VhbGeYmolv44vkYRUvkx0A3TF3VNyUxCamoOYO3j6WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNbFa5Wamrnrn1jEyq4MdPBFimfSCjpIehiwUDGsb1aPVC2JFcX4k6r6I/Dibfq08hYRywGmyeAKD88ciFFzGZ4HfaUhQNjIsLfK30OLV+SZ7RFyQXxCEK7ileZg2cCEJNHPLx8lb3+NteT4FvpQcar2eY5lAzfycyuVb9B93wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TqKvcUrv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhV6p52s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AHZch151728
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 10:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UQDRk0q0QWS/zSxYXlfjEJKx
	TwFS4cm8rZqdd13L8PI=; b=TqKvcUrvvYRFAKjai4nvZ0mwySIHdw+sZVi4WNvA
	9IvTmHK4Gng8FnCm8xB6hlozlcCI/j+fPNnfvAg7grdakjcQujb7Piy6hu9APGTW
	1k31Q/YOfaPs2/maSHgmlSmoYJq5xmdP8wo8wdBcd5wn5tV03zAFZWg1sTvlUmd0
	0t45lEeqljgZWTF00P4U+3F1Bx4WPk8qO4Zap4STtGh8FfncPL3ZSVRFhbBUrrHu
	q+pMlVXJGQvqsYYQTQObsmczf+tO0x9wSj3KzjeH8BDiSMNrHwNmPy6TixwnZ3IS
	jTmr1a9p5+1Qj7kaYesmB7RbY4Wu5yTgq0had4L/v/H8dA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctscp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 10:25:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51009190feeso13922431cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 03:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778149510; x=1778754310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQDRk0q0QWS/zSxYXlfjEJKxTwFS4cm8rZqdd13L8PI=;
        b=LhV6p52sDLQMacGz5PH1MocSH67aCbPtHt9wTeox8hZbsN9+o1J2Dmf0M46typL2hU
         owEmYNhDYcZrH8EnrHJXtDdBcpZKd1J8VNaZKAEqyBk/f8QNc6GVPW9V6FA4QZS81BpG
         /WBjVExCPaw6PugOogrfl2AUbkZO9LwqEqbxixC2n3/wgCRBQ46ieJ6QRVNVfXStSe3k
         cdeUbGCjVcmmLEs8Ep05APpfEsZL5c3blSPnJ8B6zrOr5zgEWOo5y94gci/voEtnzcut
         Q34JJxbeizIpSHef002GE7TgKlS9sLKwbg7YhjNbKXsKS6w03sSAzVjkY0I7+kBVaAfq
         2XIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778149510; x=1778754310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQDRk0q0QWS/zSxYXlfjEJKxTwFS4cm8rZqdd13L8PI=;
        b=Wav4M10CIK65n7wXOXnnPUC6CSUut/gY2yBe+2HNj/aQGnH3VWM7jBF5tT/aVA/Dv4
         PJiV4d1UlgPP8eCUm0ZCTk/qsgey/Lw7YBWjcTUmzksRB396TJXwBTtsn9eOdx62WYKX
         WGFGvFo4rE+kRLGHmv3qF90gUhmyf3WaLzElclf+vUBT4/WBeSV3QLiqFqem3mFzORtb
         ttrENbqw0Ap91pLw0L2Lxkl28Z5lTOtpRaxHMsVfA2POKhWOrt8C6KsKhrDBZJ/7x0co
         KWASs5NQnfx7K1aoLilckzWXr7RJmD0AdmMp4Lh5+12+HPYhDEZJoT6eghShPEJcgv/j
         dtGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mUnJ3U7S7Khx46fhn+AfUwHv4SwYfE2vmfR/47Fyo2BOEeDvieSBExxo1GD9pmulfD66B/YD9dKbJyjbd@vger.kernel.org
X-Gm-Message-State: AOJu0YyDurH8Vwk59a708QCC0K0ICgW0g30pcFKNAzvKsFv/4mkuV496
	qi9xjDnn9klhkCQLnjEycdWvpMaTuaFOGskBrGDuIMmp5NYKUdqH6QfYSzqi4ydztP362s3vXjD
	xe4CTY8fyLU2s+q7pJBsrXoX7LKrcdU5hZqiLzCNcI9kNPIvtbPo+TofXDDIaa4eTuEFQ
X-Gm-Gg: AeBDieulie3BvaXjOFAgJa6dEELEE9G2L/mvlzg3nGxuUwpy3RS/Z9VCMVdO0yZa5qu
	lXhN2LHJKDFRhbUnE50MjXswwg5RfPEPpMuz4uc7wLI6RX07NDrp9gHQWl6mTzpUQk6S6usvcsw
	uvEvSa/bd7t0sw7yfoucqnkDGck/VxnlAWbFWAVjOS73QnezS2ZLvNxvmJjE/R3cuhl8IPlMbRy
	GMBcPeiXrryYrU3b4M4nWtYiBlg/C+BN/xrrtjN2xwmBemXxZqggaiEyVTjp/yu32IxXxy3k84k
	7X+IFeVmhVd1HSR+OUKtuUZJvGpDXa49lI2VYeqnzyvb2w9n9T/jX+qsE+rVVmykr2GGDeDxyHc
	LsNQyfVDW+7lnnp60QxTPPY8qZ9R2T0JThW+/1sFeQjq8VHaHNG3Jz1qg07UQCwbhe9qkw9YCN1
	ZkvBmhSRUUBGc6FwecRXk4TLgyif+HskIp3T/9+SFRhnf5FQ==
X-Received: by 2002:a05:622a:558f:b0:510:4174:5086 with SMTP id d75a77b69052e-51461fa02e0mr94750451cf.28.1778149509609;
        Thu, 07 May 2026 03:25:09 -0700 (PDT)
X-Received: by 2002:a05:622a:558f:b0:510:4174:5086 with SMTP id d75a77b69052e-51461fa02e0mr94750041cf.28.1778149509121;
        Thu, 07 May 2026 03:25:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86c7a1698sm4123047e87.3.2026.05.07.03.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:25:06 -0700 (PDT)
Date: Thu, 7 May 2026 13:25:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/16] drm/msm/registers: Add perfcntr json
Message-ID: <aigfthmrjytktawlxi42zsq5rgvhwus7saqdusjv22wodn7fuv@5chrjknkz3tr>
References: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
 <20260506171127.133572-6-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506171127.133572-6-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc6886 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=thqBxEDTGtn9z525fxIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: uLhNl0K7oZWg_eostfKB_FFjgQ1o2Coc
X-Proofpoint-ORIG-GUID: uLhNl0K7oZWg_eostfKB_FFjgQ1o2Coc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEwMyBTYWx0ZWRfX8xbTv3hz8D3o
 0+CbTYGLoir+HLjWoL2fPmwsvRmvhfdbHO7uX1yD7Gg6oHELtRu+IFx+Aj3Olua/+5E7gJdZ9wU
 v4LQtPmNe8l8jSR27RE9lLG0LmnkNkOh1Ezm9JlNyIvmQPuTLO3qNPxaQRYki9yELCP57KS4gqg
 TgusIc5cGQmK1yomSRiJ8MH/hXJvgIK6Cj0OE+oGT80Jo7TcYyn7Cx9Kbtuw2N3sAxWRX2aOaWE
 YsWmoExeEvMKy1QmtttB4EabWsGwTfn0FnBdi0K2AlEZO3qgYEfVleZdFr5XIb47Dt6J19bV9AR
 7K+fRFZapA8xr38xlUd5cm5kZ/MS8F3etkgFCAydEnJXnZT+DZyzcsaSHKCIMydH4kqBzpYrCu5
 Qq0XZ56+5eIPMvh1W+0n5MP/Lxj4mLsk3Eadl6MB9s6/P1YO5MyWYsyfAS/62vmbVuj9BcUCyfp
 65q6tDCtVHlFmjbp7dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070103
X-Rspamd-Queue-Id: 4E72F4E6C07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106336-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 10:10:29AM -0700, Rob Clark wrote:
> Pull in perfcntr json and wire up generation of perfcntr tables.
> 
> Sync from https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile                  |  25 +-
>  drivers/gpu/drm/msm/msm_perfcntr.h            |  48 ++++
>  .../msm/registers/adreno/a2xx_perfcntrs.json  | 109 ++++++++
>  .../msm/registers/adreno/a5xx_perfcntrs.json  | 128 ++++++++++
>  .../msm/registers/adreno/a6xx_perfcntrs.json  | 105 ++++++++
>  .../msm/registers/adreno/a7xx_perfcntrs.json  | 228 +++++++++++++++++
>  .../msm/registers/adreno/a8xx_perfcntrs.json  | 240 ++++++++++++++++++
>  7 files changed, 882 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index ce00cfb0a875..337634e7e247 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -176,6 +176,11 @@ quiet_cmd_headergen = GENHDR  $@
>        cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
>  		      $(headergen-opts) --rnn $(src)/registers --xml $< c-defines > $@
>  
> +# TODO how to do this for a2xx/a5xx which have different .xml arg?

Nit: the comment is now obsolete. Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +quiet_cmd_headergen_json = GENHDRJSN  $@
> +      cmd_headergen_json = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
> +		      $(headergen-opts) --rnn $(src)/registers --xml $(filter %.xml,$^) perfcntrs --json $< > $@
> +

-- 
With best wishes
Dmitry

