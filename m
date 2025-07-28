Return-Path: <linux-arm-msm+bounces-66942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6558B1443F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 00:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0800F177150
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 22:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D66C22068F;
	Mon, 28 Jul 2025 22:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOOZcutJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F3F1A3165
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 22:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753740924; cv=none; b=YIE/ChPVewwzWV2mMqj3diiFaknY2Rjz6paeVKFcFmwOhv9ejEEJ1crylS2IBK6cUiZv2kigPuAIqYUVpvZ3/Mf5FEq/ZB/eXFleW1EHyPBCsvoAVbnRx8cuzw9Ch6vlAFNUBBNvpiqCX2SIVAo4DykepaxwGpqXf6bDE7ooIXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753740924; c=relaxed/simple;
	bh=zLQdrVxX2PRWd5WJQiNUkj73ADxmmzT9JOuFxjTOoyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tK7bmT8FLIqQtdWfi/XFHYCK9cJbqUCDkpVwNN7HmgdLIKcYpkounkTEfPHTYOKyE0hQthyxAbqpwfuxew9UvlBc4yN5aOtMOzTCP6nFhVCspf0UUZPURnjzA9s74hMJuEDRuF9f//U5H1V0aehow9e9hD9onY6ZJbJP20uQn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOOZcutJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SM5Y0c018302
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 22:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Lll6iG9jjiafodgAXUYVjtDfwGIt1eByg5KgSum8/2o=; b=EO
	OZcutJvKonX2omZ+NL3a/EO4wrH3sBDazzrQasl0tJGJfX3rM5H/MfDm6wuLZED8
	IHpt8lRWYwOg8B0032HGRNnWtJtk0aawEsSW8+62FzH52gaYRgIUruNCbDHdrFOc
	8ZtJhGkU8lL1qAxQtV69KZpJj8HoKBEWJf6ZaalGWEifUrtRX9hdirpKeWg1iLdP
	Qrx5RIwEMFRimF6enBlXmp17SYatnZuQtBERhJ+Z1i8b+AGAvMLJSioAiVuj6QvO
	k+wpN74hwyunZ6Jts6uat0/Klco639TMKUn9x7DzqAiz4ST1GL713384m337aTwX
	ZAXgd5KkpO7uV3U8KEsg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkwy2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 22:15:21 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4211b99b7c7so1902082b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 15:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753740920; x=1754345720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lll6iG9jjiafodgAXUYVjtDfwGIt1eByg5KgSum8/2o=;
        b=sJvvK58pNDhrt32nmT5qGWZ0LxUONr7iGej0H/HdmvhKdpVLYtOfvOtar+xAlaKMJh
         vn3NOiYdOmqXeVmwfphWSnmAN56Iww8K6QsGtxCn8GOxb8BASatdGKR8k1ssD8qmuKOf
         DerxtOelGxDFF0CzOHGqBj3DU9CzRg72IokhA2+cxMPZoRNRERQuuay+NwvZPm5uSeYU
         8IRpBKY2m5qqINyNZpauUvM+EmbC+8seDJi0QpTqwEXHaBuWJLu8bdSMtZ3NyUvKOE3A
         c9BE0YKcocU9q6dKupFEluRQE5HelUpkiFKg+17uhHGpz9CuFhyUIBi4enn5m6w2gJMW
         1jlA==
X-Forwarded-Encrypted: i=1; AJvYcCUMW6IilvPBpecVS/B3c7717eQCyRV68CHYeMXGvlKoVyfwE7FHG3cW09Kb9mY7VpTZRcXCZpCH2PVwQXXd@vger.kernel.org
X-Gm-Message-State: AOJu0YwVmbGXxLY3D2B7zVhyxj1dE1YzEsrzWeTwy87b4ZPIbP0neN2c
	CFXevjfKenclSmAe+RI1nOezuSOMzoOCTTb3XxFniQ3j5RZaPT4mrgr2Ne2i/TOedHeW7p7foAB
	ZO/Mn5VDQcqOs9YDtLYbGYeUZbgY16++5qyyhfmwvDybtleiLxOSpxmVLEClTfU2PQFiVP8ZQJ0
	qCsR3u8yIsI1D03INwIDG9KUmSS179TjdGlkUzeXJ2i/uaACznETI=
X-Gm-Gg: ASbGncshVNo6v+Kuo5Gm4ZZhTRjswaZLMc5v5Z8OFqax9w98zrqv/3H8PoW4gP1g9Ha
	OSmWpoX2Ca5XE38IapSXeoSXaGT5sCyLId/ZhnIXMZMG7z+NwHedT9URn5B5QjF4luKU6rlVAg0
	cePRRGhYvvlXIphmWg6/vXKV9Ph4feezm6hhcJxFr72cGxzxRcoIRd
X-Received: by 2002:a05:6808:14cc:b0:40b:3816:6637 with SMTP id 5614622812f47-42bb92437famr7502074b6e.24.1753740920062;
        Mon, 28 Jul 2025 15:15:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUWxjH77ANgUCz1gxut5vOzlfOsvuZGqBiRxeSnrpoSOaKr0Axu+0/yp56ejEjtW4vvXW/jn7lkoZRFSnkaJw=
X-Received: by 2002:a05:6808:14cc:b0:40b:3816:6637 with SMTP id
 5614622812f47-42bb92437famr7502059b6e.24.1753740919614; Mon, 28 Jul 2025
 15:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
 <20250728203412.22573-2-robin.clark@oss.qualcomm.com> <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
In-Reply-To: <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 15:15:08 -0700
X-Gm-Features: Ac12FXxKcQE-jGXesSBh-SermxAqmB7IQG6RNGuaqlm9uwFHrxNfWtJsGTe3B_k
Message-ID: <CACSVV02W28L0MS32J0n1PTpEsaq_6RxEPgb_6y6G=6TryGEPQw@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: Add missing "location"s to devcoredump
To: Connor Abbott <cwabbott0@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6887f679 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GWzUntYCYND7tZVuv0EA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE2NCBTYWx0ZWRfX776wRxKDZy4p
 x2NIWD82NFmvb9G+qgUD0NLDKyzBh1SoDSds0QH6GjKwRGD18pcFf4LdTHZMqLID12PjSgvz0Ik
 SJoW0xhT4XOQalnbrYBHI/fZOR9vhQCACa/2WxrO+fXoBu5/JFediUI9WvPGXgTbREIjz77wlC0
 YpQmX40KkdPB0V2Sg8a9G+JpmZB0VogoqJx60j8vGDxyR1pPM3eBQwPhDfZiuKMom5JBef66+H3
 aA5GtACZkrOW6MieJiqCBaEYXiaddYNyaLzw5mjOOzVsO8WjHBO9AQ2sF/FPn//cT8s4z6lEF7R
 x5ibtpK7ToCa9lcCogBLzA8513FUHdwxdJ8WcdujBEaRQtdrSb3u8VgDOYDL74Srn2rwCXH+ek3
 UtYN8LMC9Fx2sn11oJeTcXcfBndSfI8r09D4hBqCJW7pd2iLK0CTV3AM2JYhXHEPwMwQi2lp
X-Proofpoint-ORIG-GUID: dvVuLtmhkXkTTxk-sX_rFmwzGRpwtcOI
X-Proofpoint-GUID: dvVuLtmhkXkTTxk-sX_rFmwzGRpwtcOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_04,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280164

On Mon, Jul 28, 2025 at 2:04=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Mon, Jul 28, 2025 at 4:43=E2=80=AFPM Rob Clark <robin.clark@oss.qualco=
mm.com> wrote:
> >
> > This is needed to properly interpret some of the sections.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gpu_state.c
> > index faca2a0243ab..e586577e90de 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > @@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gpu_stat=
e_obj *obj,
> >
> >         print_name(p, "  - type: ", a7xx_statetype_names[block->statety=
pe]);
> >         print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
> > +       drm_printf(p, "    - location: %d", block->location);
>
> We should probably at least try to keep it proper YAML by indenting
> everything after another level...

this made me realize I missed a \n... but otherwise I think the indent
is correct?  Or should location not have a leading '-'?

BR,
-R

>
> >
> >         for (i =3D 0; i < block->num_sps; i++) {
> >                 drm_printf(p, "      - sp: %d\n", i);
> > @@ -1873,6 +1874,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_=
gpu_state_obj *obj,
> >                 print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pip=
e_id]);
> >                 print_name(p, "    - cluster-name: ", a7xx_cluster_name=
s[dbgahb->cluster_id]);
> >                 drm_printf(p, "      - context: %d\n", dbgahb->context_=
id);
> > +               drm_printf(p, "      - location: %d\n", dbgahb->locatio=
n_id);
> >                 a7xx_show_registers_indented(dbgahb->regs, obj->data, p=
, 4);
> >         }
> >  }
> > --
> > 2.50.1
> >

