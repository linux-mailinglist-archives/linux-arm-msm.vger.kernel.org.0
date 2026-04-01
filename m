Return-Path: <linux-arm-msm+bounces-101332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL3lFi0GzWnhZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:49:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF51379C69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80CF6306ECB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BB63F8E16;
	Wed,  1 Apr 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhBsvXTg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5nxCO8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF733F8817
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043525; cv=none; b=qLkRRiXXaJvjVi1dGAJEKbVBu8o4pJIwbKMCtQa6AGkB/BU/Vv74Q+ttDHR+ItJDohtygWjhILlN5irHV3DAgLxel2yoqOkFIgxL6vZ4Tu8Ot0i0qBblIz09PprEQ8lJkYinPVBqL0YdV1vPy9icRQUu5+S/q4XEdHsjaOeKqyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043525; c=relaxed/simple;
	bh=9lF6/Z2ng2NfKefNCOj7h9ssGxb/NQ+cKBLJ606d9xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIBgpAa1dRSAEqKYx44jpfs8s5BahRycJ2JtHDVQ6E8/vHEwrRz9qHwEFRZmV8Cq7MrMApp3gSd+8jj0DvWJWxB0xPOKojiekNgeEpgAWKJ0qcSwEX1VYPpDzlkLj+yZtCEa7OTr2r+AwsMaOr9HZWF/nehduZMTm9uxshm/lWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhBsvXTg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5nxCO8W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631ADBLg1579362
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2YHUSDWpXQ41/aYcBpRP3MQ9
	m2yOueV672FiMPwKgK8=; b=LhBsvXTgVZhhuPUCWHlJmJt7vw7dA+9UP3zXTZfD
	gorHDku3dPsDnalbqOYR4I3LzACaV/kAUJfVtiezGV4c5Z+3vwEyHbFBLh4HAlMb
	0ypszBwaO70qDP+czIJVVhNf2wHjrkDQSuLYfzCI8aoGgNO6KwyJTq2wPsrhpImg
	PpAyc/zycQacjlVSYSRGdi4WBDzek/08hXpgHDrGlgz4sZOMMD6uj2cwxuqECu/X
	KXHAqt6Sb+lFtwSAwyKJLtmkkLbjpwM2Dsrd6wbSTCjpvR9pQOUp3unKi0Sw7gR6
	anVk+GzGvq4cXfx2MaUuxqnji5TXXlSR0yjxmgGTDJIIJQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2u9mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:38:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509070bda13so21046711cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775043522; x=1775648322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YHUSDWpXQ41/aYcBpRP3MQ9m2yOueV672FiMPwKgK8=;
        b=U5nxCO8Wr2xm5z7S4XzA35T/6exdrWMnheaUEsdivYRwwXvYixr+5Kl4OlfjCXF6f7
         VYJlnD34UU9zTNr+OhXSzWS+K4LYWci0QDhdkb/vvywFurzONl2mhKQkwRNgIEBy/XUg
         HpnG0K4tJ347vYSEr7Um/Hp/i555ml0J7fGtJHglujaZyU6JeYDMPI68DAqfIAt5vVdh
         Ono03ijFO3HtSjlwlpmPQaEELTOZlw9+3Y8GZwqH4Yins4JuL2tqispNPt4d5RU7p6Up
         e3KoOBEC/DKFRtByPRTFo8vVHhjhp2jsRG/48sx7o/rZvgTd47pzQYnM1cZie6DS111O
         7IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043522; x=1775648322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YHUSDWpXQ41/aYcBpRP3MQ9m2yOueV672FiMPwKgK8=;
        b=R+obju6rj85TDZoKoTJ3xa4nVXZUkTXKy2qNixNoy7cgVXIGCxyypch1aazYq3ZwS2
         3E/izNpZnZMSry/mMBC0RMTRQlwBwaY2dcOcfM3ng84cGQ0uCVHPoLNvjlQkilx/nT+d
         wp9TFtAYHhgdfWW2mve/rQYlnQj6D7vZq9CKjZrxD1dL+NaxWOVAPtF/t6a0otpDvw7z
         81eKMzbedxUIqotHExUAj5H/zkmxqu/F1IbeyQ0TKIXO/4iWyH4eISXASj43T3z8U/xI
         YNGnrjD7rvI4yPJ9Fz2sdfikpuoYAyYm8lZifkstmW9lVjT9pw02OgZUmpjcHg1ZGnul
         P0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP8H5WvQ5T47gYVM5F4vFXiAK8BSDvvUin63FIRg7v/G9MvT5e6HSrfFblAToONdIOrE18c19/t1nhJw+L@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ9ITUYzoeu2Ns1G6ikUwhOip2T4JaXozVXILoqVCWWpzL7BZ/
	V98YhjPMJqfl3GsDFjxHjgu3FM3XppY7Bys0dCMOWvIkBTUDRQKCyMEXyE/vUH7FgSCoZMede0j
	eTcK8znFMWYqK8+w3ID+VgG7NOxphL5oF/R26AK5ldwXR7mQ/b42jUhdo/rSJxeyRvafn
X-Gm-Gg: ATEYQzyWw3Z3aLCpU1zmhYJKAaedfSFz/bQyz9pXkbmNJXVY3RubhA1e5dmnvdld+tj
	Bi26aN/TFMnDAKZo0lvT5QK0IgexCig0oud6EFUZyVw4jdbyMK+Ff/+l/WF8VAAdOrAFtENxHkH
	nrw0hA52SJ56cW7Aq+FKKiDSjeOkxeFBRFtUm0hfPq1uzFYMTtTenstVUnGpapRJCE9NRW0Dimw
	rsRDzkwUQpDoqYfrbARpKDp+xaAESL3xYfLOyaryNbB+JDER56VwhYDCsJ+av7LiHFH0myc7pAp
	w72gmyU5szG+nUDpAeAS8/W5EW4UIn6uwyqgONbT5vHKoMC1N9iBcNEF/+pkrgaRh6lxCDA9m/o
	YVRN8/9kqsRecppg3ual0qXT81ibppJ8bB4SjugAtzpvqWluR9frd7l1KZIwXzFPqeI9OFG51s2
	+0V6b8nHfLrjItwqE6gUNevMlYqXO2B9ivbW0=
X-Received: by 2002:a05:622a:87:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-50d3efdc340mr23635631cf.11.1775043522531;
        Wed, 01 Apr 2026 04:38:42 -0700 (PDT)
X-Received: by 2002:a05:622a:87:b0:50d:3efd:bd93 with SMTP id d75a77b69052e-50d3efdc340mr23635471cf.11.1775043522130;
        Wed, 01 Apr 2026 04:38:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b140ae63sm3193341e87.37.2026.04.01.04.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:38:41 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:38:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/9] media: iris: migrate to using global
 UBWC config
Message-ID: <hko7spuzbp4ac57nligh75vi3tmz6mfb3hzuq3pyvaa6p5lyqe@6k76s47t3jex>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <177499105231.956796.588474423586543717.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177499105231.956796.588474423586543717.b4-ty@kernel.org>
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cd03c3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=gYGmWrsk5Bp2t3VVqaYA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yMG25GeWtRIVU_ECtQCDd5p-4lpkmdln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNiBTYWx0ZWRfX6Vl5/Fgrh9u2
 0qcWQFA0jW03OiJ/RiVzgufo2GcWMcXQzGLoxX53fk76++Xe56t1XrQR5j/skiGSVAk4L7myfNn
 r+2AKZAAWfodwNbTUOcGMFqHZdXnNtQ/wJlmCkVpXCEjc1j4HT+jnoXaQqlVmDTDUWvWOvNqmiv
 blMATkeCpM8s7K2VgU0Y52pfAW3uf5bHYpvd8tFXUrE0DPS2VyPnvbFaa0VtqeWYkdVdfQM1n1K
 tu/X5KKLJ+bHO6yZhd7qsQef290GYOke8T9h73O/6ZEFq9FsIaAZozdlfAXMyJRY1WxaTgrVVps
 8r3A4r+eSGpOibAz0SA4xMyPqN8Cuj8UcjcwnfXopYLVJsUchmy2tS9A4qQU77c+De0dx8kcSfG
 j7ypfcKGXTrxvtS/8b5H/vjLFsqVE6cVERfdBmXa8/z2nUn3VYzMwi6NhDXeTO+F2oKTk5srJNR
 XVwWy3dOv4/Sx1ks0hQ==
X-Proofpoint-GUID: yMG25GeWtRIVU_ECtQCDd5p-4lpkmdln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010106
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101332-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AEF51379C69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 04:04:24PM -0500, Bjorn Andersson wrote:
> 
> On Sun, 25 Jan 2026 13:30:02 +0200, Dmitry Baryshkov wrote:
> > Having UBWC configuration in the driver is error prone. For example, the
> > driver specifies fixed values for HBB, while the actual value might
> > depend on the DDR type. Stop defining UBWC data in the iris driver and
> > use the global UBWC configuration registry.
> > 
> > Merge strategy: either merge SoC bits directly through the media tree
> > (with Bjorn's ack) or merge to the media tree through the immutable tag.
> > The drm patches will follow depending on the way the SoC patches are
> > merged.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/9] soc: qcom: ubwc: add helper to get min_acc length
>       commit: 68a66a44af6e196ca426d1250104d3018ed9e74b
> [2/9] soc: qcom: ubwc: add helpers to get programmable values
>       commit: b2571ef8d4ec9bb636889a9132090bcc3449792e

Is there an immutable tag, in case iris maintainers decide to pick the
rest of the series?

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

-- 
With best wishes
Dmitry

