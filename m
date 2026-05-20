Return-Path: <linux-arm-msm+bounces-108740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPO3H9+qDWox1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:36:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F2A58DCE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56C11302AE1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0221A3DBD5C;
	Wed, 20 May 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Red52nK/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9jySy82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89583DDDBC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280241; cv=pass; b=mrnTfV7WvrZwKEcQS0kc0+CzPEb+jgLp33+QfCmHWUZEEIg1BdUnrNyNZoPPB8i7TYGP/vUp2X+mSZFo/Plx9lX6A+rm89loRlN0E7M5lSo92y8A7ET8XiQLPDL5y7SaGW02g+n3bn0ceR5C+ghDfd8IaCvij3AdjYvqkrxb8F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280241; c=relaxed/simple;
	bh=LN7op/v3EKo2CUBqiG1+j8NjIeoB1EpBlmih40gE22k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ga+0Jv4E2vs+t8OnRKnGqx3q9wDjK+0+Mi//4MlfMoJ/ujwpRO9WidKrDYpqWeM2rEnHy4EEXc3xUFqjcIFdOKm+dIegZ45SkWDfFM2dEXPLKptFVdya2daAlXManUH56quNLe2rjMceJMkMHjr/Dw6ZRBrimzcQ4ZguegK0F44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Red52nK/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9jySy82; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZgPd3085144
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=cRAlnpjqr6bgUfKkNAu3ISqsa9AjttBO7qAkv5Wdtl8=; b=Re
	d52nK/3A0saI9eAg8ShXQyCcd6UfbWKoKbDAPtuLpXkFtLsnc1xms7kU1Jhsj8T0
	2NaTLk5bHm+AJOlkMAS06jSWL/mBqBsMf8WgREy4Rts3vplU+jGxr4LFYMrm6irA
	I7QdyKL9asWuKNP6anWMEOM50eMLpiB8oJVqhnh4fw6jL+NJepaPnID8sRT0s/Kz
	+50ZYCc9RWkk48X130TfSdQgeDLB7K+3TAdaQk4GQQ1oQ4efQ4+yM6jLqRKYSyRr
	ismdfrr+YhAjaIkHUReCWBVlSIG0tgzbKUTgectRvggPttaalmJAf/LNWT80TSMm
	xTutpvKlN8ca5RCw5+Kg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f0680-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:30:38 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69b3a3c798dso5572151eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779280238; cv=none;
        d=google.com; s=arc-20240605;
        b=cnO10dU9ReIqTjaY5m3V+H7Gl7kJ4F5JJpHZ9n3HcPY+2G/jtSePhMbRe5cRrQ6nn0
         b7azctfiz8MlJxuGvTHAmCPFRq53ofnTB2MnIDgEe9kXp/oBH72Blc21JCo6Wx0yMlkY
         c4Qg0FrQbYKiFEbth6giz4bgo/zpjdJ5pOuAmmr7zEZzrxH+GuCxVxftZByhekf6H9W7
         Ni4Fxf37mNgO13kGjN08rqJjdNZmOwn9/kgGA7afXMKAKz8wamWHmbsl3EMjIoOQN8Ww
         u/ciBx4Ir/+fftJePU1fdrgw7QtPlf6/dc0pH4uBQb0pQ6WpnaWmku7J+MFkYoChxsZg
         gglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=cRAlnpjqr6bgUfKkNAu3ISqsa9AjttBO7qAkv5Wdtl8=;
        fh=GThcAc2qvCbk21nqgBNAvJkFlcZKo3WraVZslXEl1DA=;
        b=M3ywR4VR9xsUM1kMLzLUvzlJLH9ZxoggHPbs38izRa6VaF1ZWhxOxy9Zi18i7U9/q5
         VXeErftJLT2D7NlZxhFGk7tnIwtMa7oNKuNslNWYlauMjcPRWEQvkZy40ykwzOOJCgGM
         WM7U+x+PrSGFqsgBL8M3AKVpKEETdDIjZnZu4ItZiAJ9o835evVmZtAKKlHM+BtAV1kw
         5srDFjPawd4CAgf66pgpJ80QblRS+n1Pw3sYJRV/o3l2/3ZY0dXfMjy6awKX4ZfOh2WJ
         tF6DuShOBcTyQ80l1s9FHkXBplfRi8P7SFuJq+Z94Aq8drRSOWoG5A3po106trlNeyYG
         +0hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280238; x=1779885038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cRAlnpjqr6bgUfKkNAu3ISqsa9AjttBO7qAkv5Wdtl8=;
        b=X9jySy82zKoS3PKHPFWFOLEvnJRAUheXO63rrQRSls87tSqt96hzag/vaxXfhz2j+a
         vQjptug9ktb80EOdOlbhekr2+zq+UO4XlxJ/WigevEHEnsC2CDtIeB5IU3JLwK40XiQ3
         hIC/6tmLpYKMK8Vk1RMvDh1NinJOALVoBh1J0UigbDWMQo+Hz7gbHylfzTaQCRVOyll/
         jNDwVmVn7wXsjszGaBKfAuriKdYyU6QH/1N1z4g34P1I4XEpOKTxRUi5KuDMtWuGljVx
         euD7SEjdkp/fSPt9SjROPDNkKTC9Bf+C09Z2dg4+MOXKa5GmVWfEQ92bGO0U8udoEwBF
         A7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280238; x=1779885038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRAlnpjqr6bgUfKkNAu3ISqsa9AjttBO7qAkv5Wdtl8=;
        b=nGIInVEnZR945LQMjFSTZFyF9kXIp+l+tVsRmVSP9gXUqW1l8Cw6HBrfqxuhC/cU5M
         9u3iJsVGUF18pGcLbw9YpsU5U8HQZaOVCx+pPlryXbrXPI6zdtNiXirNx5kcKkwct5B/
         +8jk8l+Ny4cr3VUstFeQuvDTT4Hef4gjQPqElbWEZ+uiqA2LWoLMtmwq5xM45hvEBhhY
         JZ7Ho2BexQnkq1IC/AAVYVPDVQf+Ht8BqOQ0tH8uurI/URN0TH66OXCN8aO5KPkh12QJ
         Rgt/z1t3UDToxnjFURi+6vvxnRqV91jJ3eCKRJpZm24o+h55VDo9cr2shBgnGMyRtlS3
         F1gA==
X-Forwarded-Encrypted: i=1; AFNElJ/EJNAuotg7R/TzlbcdZXCkRnhDXXsQXc1qoxq2/8lG/dMzcixenpY/3WfT9coAf1rXSD20k5f/v7PddGlH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3fvizpMiIcWzgmvpZNE6HKfxQuyrWnClYpH/fd8WPVHk/vWau
	sguQz2lJPsshgcPd6VfSvXX9XaYsdpsbsANNaHc7BCgxwml9iL4l5+yHXR4gbOkWQTLmphtmngd
	mLwL0S2ADzk7NSgVHf0eAEW/yXiDphRrNsYx1qYsSj/EP6hPMt1atbrSw1Ql9DxJXCI+/IL4WPf
	IsPfNebLfkcS2zHzxySOECvlp3KgTtkeLi/UV5N+9JhG4=
X-Gm-Gg: Acq92OH6xHIcKjdu9qlx3yuNQejTAWHfIALe1gKEcnD0oNRkmvbTStiXvGsl8cjd6Ra
	Lv2dtpXAIjTDExHSvQDI2aWFUcLETTqruMPewry3qYdFcnJSrRe5z2TBkSLgu7Wxq5J2pWf1L/z
	T/whk+34pEWkVg1387lN/VfvXlKA9CMGVRbdMWNCuG93vCy+r/ydik6wDbEfCuooejadRsc/Q0v
	KvmgCebup+Y49jOFnZGnw4ADHLXzwiiQt7RfQ==
X-Received: by 2002:a05:6820:3103:b0:696:6440:9e2a with SMTP id 006d021491bc7-69c9437a8fdmr13632115eaf.29.1779280237612;
        Wed, 20 May 2026 05:30:37 -0700 (PDT)
X-Received: by 2002:a05:6820:3103:b0:696:6440:9e2a with SMTP id
 006d021491bc7-69c9437a8fdmr13632098eaf.29.1779280237088; Wed, 20 May 2026
 05:30:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
 <20260518190735.16236-6-robin.clark@oss.qualcomm.com> <b4787a2b-c1db-4c0c-8c58-fe60fed83cfb@oss.qualcomm.com>
In-Reply-To: <b4787a2b-c1db-4c0c-8c58-fe60fed83cfb@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 20 May 2026 05:30:25 -0700
X-Gm-Features: AVHnY4LzoFxkUnfiW8o2N4ZWSii52hKyNHpJEIfWcWyaWJPx5X2ycU2_KrwUkLo
Message-ID: <CACSVV01srddm1569SStsdBg_L_JG79sPgORokNUw8odgyix=pA@mail.gmail.com>
Subject: Re: [PATCH v7 05/16] drm/msm/registers: Add perfcntr json
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0da96e cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=AqeHwav0Fnr3ArOU010A:9 a=8f1wxSZkJpRnjI3K:21 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: d4-0jebB8U0PkhFxASi_j9LJj66cORzw
X-Proofpoint-ORIG-GUID: d4-0jebB8U0PkhFxASi_j9LJj66cORzw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMCBTYWx0ZWRfX34eZ+SBF3MIZ
 08LqlLywowgjjuzQiCxFAJKmRpMiRFAIkOZ0RiJP+ZO2X73O4aA6MopQyJ3G8mCUsTkBS8XSDpc
 AOEjk0gtPfFt0p28Ot2ETUxa2LXqotX9p6UYEkKEJR8/GzvBLm+6J18O25yz01O4NmL0ry+h1VE
 3Znx8OJWpkE5dF5zX26bZzUcprnyIssHVe38ALKMHPLQpAtq15cKYaNQVofOZ+Du7I/VnwXg8zI
 xPfJYcdKlb+KrujuTWr2PxwdSah0cxrJGC6AeHkfpaTBvlJ9tUmWOG+reSQaKN6lYrD9W8GgBEL
 kt1yLlKfRbBJTuh9J/mm2tQ+eLvhfqlwtGRsYYEC2qh26l/wYb7VY4b7WbDs4gYS2a2Fis7/GFk
 c+f2va7g4AxRMXah7jsUcu24twuf6IjWC5r3ACDiHT++o5pU7dhPvBOo12FB5JZ/pRce7/MURPR
 27dul2YFtzs2GChRUGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108740-lists,linux-arm-msm=lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,gmail.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: D5F2A58DCE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 1:36=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 5/19/2026 12:36 AM, Rob Clark wrote:
> > Pull in perfcntr json and wire up generation of perfcntr tables.
> >
> > Sync from mesa commit d2c4653ee953 ("freedreno/registers: Add gen8 perf=
cntrs")
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile                  |  25 +-
> >  drivers/gpu/drm/msm/msm_perfcntr.h            |  48 ++++
> >  .../msm/registers/adreno/a2xx_perfcntrs.json  | 109 ++++++++
> >  .../msm/registers/adreno/a5xx_perfcntrs.json  | 128 ++++++++++
> >  .../msm/registers/adreno/a6xx_perfcntrs.json  | 105 ++++++++
> >  .../msm/registers/adreno/a7xx_perfcntrs.json  | 228 +++++++++++++++++
> >  .../msm/registers/adreno/a8xx_perfcntrs.json  | 240 ++++++++++++++++++
> >  7 files changed, 882 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
> >  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs=
.json
> >  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs=
.json
> >  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs=
.json
> >  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs=
.json
> >  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs=
.json
> >
>
> << snip >>
>
> > diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json b=
/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
> > new file mode 100644
> > index 000000000000..8bb31820479e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
> > @@ -0,0 +1,105 @@
> > +{
>
> RBBM and CMP groups are missing here.

Yes, so far we only support the counters that mesa has been using.
There are some missing.  Although RBBM and CMP look straightforward to
add.

> > +    "chip": "A6XX",
> > +    "groups": [
> > +        {
> > +            "name": "CP",
> > +            "num": 14,
> > +            "reserved": [ 0 ],
> > +            "select": "CP_PERFCTR_CP_SEL",
> > +            "counter": "RBBM_PERFCTR_CP",
> > +            "countable_type": "a6xx_cp_perfcounter_select"
>
> << snip >>
>
> > diff --git a/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json b=
/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
> > new file mode 100644
> > index 000000000000..e60aab1862ec
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
> > @@ -0,0 +1,228 @@
> > +{
> > +    "chip": "A7XX",
> > +    "groups": [
> > +        {
> > +            "name": "CP",
> > +            "num": 14,
> > +            "reserved": [ 0 ],
> > +            "select": "CP_PERFCTR_CP_SEL",
> > +            "counter": "RBBM_PERFCTR_CP",
> > +            "countable_type": "a7xx_cp_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "RBBM",
> > +            "num": 4,
> > +            "select": "RBBM_PERFCTR_RBBM_SEL",
> > +            "counter": "RBBM_PERFCTR_RBBM",
> > +            "countable_type": "a7xx_rbbm_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "PC",
> > +            "pipe": "BR",
> > +            "num": 8,
> > +            "select": "PC_PERFCTR_PC_SEL",
> > +            "counter": "RBBM_PERFCTR_PC",
> > +            "countable_type": "a7xx_pc_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "VFD",
> > +            "pipe": "BR",
> > +            "num": 8,
> > +            "select": "VFD_PERFCTR_VFD_SEL",
> > +            "counter": "RBBM_PERFCTR_VFD",
> > +            "countable_type": "a7xx_vfd_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "HLSQ",
> > +            "pipe": "BR",
> > +            "num": 6,
> > +            "select": "SP_PERFCTR_HLSQ_SEL",
> > +            "counter": "RBBM_PERFCTR_HLSQ",
> > +            "countable_type": "a7xx_hlsq_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "VPC",
> > +            "pipe": "BR",
> > +            "num": 6,
> > +            "select": "VPC_PERFCTR_VPC_SEL",
> > +            "counter": "RBBM_PERFCTR_VPC",
> > +            "countable_type": "a7xx_vpc_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "TSE",
> > +            "pipe": "BR",
> > +            "num": 4,
> > +            "select": "GRAS_PERFCTR_TSE_SEL",
> > +            "counter": "RBBM_PERFCTR_TSE",
> > +            "countable_type": "a7xx_tse_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "RAS",
> > +            "pipe": "BR",
> > +            "num": 4,
> > +            "select": "GRAS_PERFCTR_RAS_SEL",
> > +            "counter": "RBBM_PERFCTR_RAS",
> > +            "countable_type": "a7xx_ras_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "UCHE",
> > +            "num": 12,
>
> A740 and newer has 24 counters

We don't yet have a way of dealing with mid-gen changes like this..  I
have some ideas, but nothing implemented yet.  The same situation
comes up for a8xx, where some new counter groups are added.

> > +            "select": "UCHE_PERFCTR_UCHE_SEL",
> > +            "counter": "RBBM_PERFCTR_UCHE",
> > +            "countable_type": "a7xx_uche_perfcounter_select"
> > +        },
>
> << snip >>
>
> > diff --git a/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json b=
/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
> > new file mode 100644
> > index 000000000000..503b113df397
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
> > @@ -0,0 +1,240 @@
> > +{
> > +    "chip": "A8XX",
> > +    "groups": [
> > +        {
> > +            "name": "CP",
> > +            "num": 14,
> > +            "reserved": [ 0 ],
> > +            "select": "CP_PERFCTR_CP_SEL",
> > +            "counter": "RBBM_PERFCTR_CP",
> > +            "countable_type": "a8xx_cp_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "RBBM",
> > +            "num": 4,
> > +            "select": "RBBM_PERFCTR_RBBM_SEL",
> > +            "slice_select": [ "RBBM_SLICE_PERFCTR_RBBM_SEL" ],
> > +            "counter": "RBBM_PERFCTR_RBBM",
> > +            "countable_type": "a8xx_rbbm_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "PC",
> > +            "pipe": "BR",
> > +            "num": 8,
> > +            "select": "PC_PERFCTR_PC_SEL",
> > +            "slice_select": [ "PC_SLICE_PERFCTR_PC_SEL" ],
> > +            "counter": "RBBM_PERFCTR_PC",
> > +            "countable_type": "a8xx_pc_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "VFD",
> > +            "pipe": "BR",
> > +            "num": 8,
> > +            "select": "VFD_PERFCTR_VFD_SEL",
> > +            "counter": "RBBM_PERFCTR_VFD",
> > +            "countable_type": "a8xx_vfd_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "HLSQ",
> > +            "pipe": "BR",
> > +            "num": 6,
> > +            "select": "SP_PERFCTR_HLSQ_SEL",
> > +            "slice_select": [ "SP_PERFCTR_HLSQ_SEL_2" ],
> > +            "counter": "RBBM_PERFCTR_HLSQ",
> > +            "countable_type": "a8xx_hlsq_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "VPC",
> > +            "pipe": "BR",
> > +            "num": 6,
> > +            "select": "VPC_PERFCTR_VPC_SEL",
> > +            "slice_select": [ "VPC_PERFCTR_VPC_SEL_1", "VPC_PERFCTR_VP=
C_SEL_2" ],
> > +            "counter": "RBBM_PERFCTR_VPC",
> > +            "countable_type": "a8xx_vpc_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "TSE",
> > +            "pipe": "BR",
> > +            "num": 4,
> > +            "select": "GRAS_PERFCTR_TSE_SEL",
> > +            "slice_select": [ "GRAS_PERFCTR_TSEFE_SEL" ],
> > +            "counter": "RBBM_PERFCTR_TSE",
> > +            "countable_type": "a8xx_tse_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "RAS",
> > +            "pipe": "BR",
> > +            "num": 4,
> > +            "select": "GRAS_PERFCTR_RAS_SEL",
> > +            "counter": "RBBM_PERFCTR_RAS",
> > +            "countable_type": "a8xx_ras_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "UCHE",
> > +            "num": 12,
>
> "num": 24,

ack

>
> > +            "select": "UCHE_PERFCTR_UCHE_SEL",
> > +            "counter": "RBBM_PERFCTR_UCHE",
> > +            "countable_type": "a8xx_uche_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "TP",
> > +            "pipe": "BR",
> > +            "num": 12,
> > +            "select": "TPL1_PERFCTR_TP_SEL",
> > +            "counter": "RBBM_PERFCTR_TP",
> > +            "countable_type": "a8xx_tp_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "SP",
> > +            "pipe": "BR",
> > +            "num": 24,
> > +            "select": "SP_PERFCTR_SP_SEL",
> > +            "counter": "RBBM_PERFCTR_SP",
> > +            "countable_type": "a8xx_sp_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "RB",
> > +            "pipe": "BR",
> > +            "num": 8,
> > +            "select": "RB_PERFCTR_RB_SEL",
> > +            "counter": "RBBM_PERFCTR_RB",
> > +            "countable_type": "a8xx_rb_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "VSC",
> > +            "num": 2,
> > +            "select": "VSC_PERFCTR_VSC_SEL",
> > +            "counter": "RBBM_PERFCTR_VSC",
> > +            "countable_type": "a8xx_vsc_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "CCU",
> > +            "pipe": "BR",
> > +            "num": 5,
> > +            "select": "RB_PERFCTR_CCU_SEL",
> > +            "counter": "RBBM_PERFCTR_CCU",
> > +            "countable_type": "a8xx_ccu_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "LRZ",
> > +            "pipe": "BR",
> > +            "num": 4,
> > +            "select": "GRAS_PERFCTR_LRZ_SEL",
> > +            "counter": "RBBM_PERFCTR_LRZ",
> > +            "countable_type": "a8xx_lrz_perfcounter_select"
> > +        },
> > +        {
> > +            "name": "CMP",
>
> "pipe": "BR",

ack

BR,
-R

