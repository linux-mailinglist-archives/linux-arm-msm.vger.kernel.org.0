Return-Path: <linux-arm-msm+bounces-54840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49832A94DD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 10:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 076F91893618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 08:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062E820F07D;
	Mon, 21 Apr 2025 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5SV/fwI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28A713C3F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223290; cv=none; b=TogFx9bWw15C5EWrZf3RKqdhrd2UVIUz/DV05/aLt/krGLmRvS6ASgZeas7p23LeNCY/ZSjF3BmJQQpYsqcn3JWBMsB+HgLvtMJ+w7zQ3hMojsNyDROPs40vnH3vLNXoqQuULvv6Cv3uwh3ZgDkTfejqUyhgEI3e0HV9x2TUGBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223290; c=relaxed/simple;
	bh=N9DaZgYXK+0d/Nuiuh1IHz88k809DklA0+m3Vn2//40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Atu24Wfsg1Xe+fXnl2VZn/3EifNVWmwcZ33x8Yxpt2jalLnDC00kDEuo1CpRz5NO5Wqi+IoL6FYGQ3Wvad1UWsPjbX8EIpzy0y9ZwoEbms9yNBpZx94Ku0xuopA245H3EkOb5xni4R6NGYfCo+4qp4Va34ZWCMxoHCVHSEnrS1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5SV/fwI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNTjEE014438
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 08:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oJBUh1wbVCHpxTY8vmU0g4yGRFNNfXgJ4JOTQRarZs=; b=n5SV/fwIMzTWSOJA
	mHYvKZQlCemNMo7nYLA8BZynjKR1sDG8T7bJuxMBXyu8ezYCuemK+nfY7Go5HrhT
	lQH/xy8qfoQv4R0OuION24Wi7YN6qJs5pp8sTmrePufVPYHSUmd8QG7DlGyQaMZW
	tPXir/DrO+TbMrRseBGlEhY/50OibexnRGal6HnbIir2CFS92E19o9JTuj/1Bc9o
	sd6tuf5D8tH6Arlas4eSz6efrRxJI73hS4FWFxZgl5aoJC41IKudHoW+nbgsdJpi
	7Gwq5FymCQNcJSaV1e+pmXQ8/tKj0Dd1y1nu+3cxw7DBdQGWMn4X2AuSFBHtywpH
	+OdoqA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jbgm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 08:14:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e917965e3eso54238246d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 01:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223285; x=1745828085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8oJBUh1wbVCHpxTY8vmU0g4yGRFNNfXgJ4JOTQRarZs=;
        b=SMo7GA5QkqVqJf7xkqWmC4DZaQ3EwoP/AfMyQpxJeX5SKZjaBN8sqDscuN7a4dfkDY
         gcS90GfJJyLvHtxDVKzkMH1c4SEgL2F48PU6U8tJu+qj5prcfVqHBv2hfKhGq+dbhH5S
         1JuVahEJBU9ChuNZoCsCcTFdAGDFptOiZrVDblAV8psBE+6t8yqk+KF/3ScqBVEaAkUq
         ltEjU8FYlrZrGNl03padsun/xCcGLJJEB4AWrxfsOrVG8sW8QpXSeiZHGItSBhjAhdPt
         EpM4oKV/kvh/ef2ISIYo1lHqjw7A0PlJEOa/zi6k6KEQHsitIbcOsHf11ZX+V1oNk1/Z
         jWIw==
X-Forwarded-Encrypted: i=1; AJvYcCWk6xLu3sKDQe+05BHFEn8ZHaj9nSarJQjYqknPFiq8dW9xoXaeUdzn6YUgV1oc8dduT79xHlv40dTvrXrI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7nHOdRLMS2IhNJDw6EOxM5TALA9QdZX1mCfWx+p7UcgwiKMNI
	8Usqnebo89gkvl8g0hLHpLfUsU0yJoHkPbJ0aWwPG8DPM6ZARtucje986nyz9eYCc7rgK6UaQO7
	6/yiXf1lkzn9MePZnXp6GYWy2bPjFjfV+7Ik2dQl+dksQCqupvfDfwFzTkbvIBidY
X-Gm-Gg: ASbGncsN3HBUJ61poTEcPGXSf9Dipa1j7ie3uE5dOqAdxMvOCtsiwY/sl514FFY8cB3
	rEHo9Rv1MkvWBlWCGYQVLi5XCunx3J4zfNjNvdRWpz2OJmfqI1CoWPI8ACKXULhcbBT4S4ewQW/
	RMsZyM0pjQv7PDbFGMzOkjFx0nbft5QuH07OO07dZg1/LllnnST8AiwLcvh4QYBPWAVnDOeBdoS
	eZ8kCaFTjMsU9ACpB7BLSTOT5B0R0QJQNklDKaUjvOPt7YfyrLlJXFXYBo4dpH+xNknjmihCv+e
	nKvxOoCZVF0AyN0tU0wtYcBbA8kMaTCnOGd4w7scZ2BmX1q3P1Xq6Vf1xZ5I5JuR08jbUGexHSk
	=
X-Received: by 2002:a05:6214:20a3:b0:6e4:4484:f354 with SMTP id 6a1803df08f44-6f2c4671b1cmr221132896d6.38.1745223285297;
        Mon, 21 Apr 2025 01:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnRnpxjNkHm/HUpOalIjA+qNX95H0QB8/MMo2v2tSzcpgxrTX1ZwIeu+SYDh7cGkWGLZqgMQ==
X-Received: by 2002:a05:6214:20a3:b0:6e4:4484:f354 with SMTP id 6a1803df08f44-6f2c4671b1cmr221132646d6.38.1745223284911;
        Mon, 21 Apr 2025 01:14:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e4f06sm869887e87.166.2025.04.21.01.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:14:42 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:14:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Deepika Singh <quic_dsi@quicinc.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <iedvsuzaltuxyjp6ug7yt7oprnhnthmi4dz5i3biyjteebuvqj@4zpcthyu5rpl>
References: <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
 <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
 <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
 <CAA8EJppbptPryu_O3G3YAapHT=Ai+MAdA38FtSU=YvWb+mqa1g@mail.gmail.com>
 <e1c23027-94c3-4fdf-b842-b154179aa2b8@oss.qualcomm.com>
 <a3addff2-1ee6-45aa-ac2c-693ffe804948@quicinc.com>
 <pczibldk4nzu2zvyca4ub4kxiyvismuy46a4rcxkqwy7ncaf4d@ktm2vpaejdmg>
 <57d58076-1d5c-41ee-b0ac-c2bc4658b96b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57d58076-1d5c-41ee-b0ac-c2bc4658b96b@quicinc.com>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6805fe76 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KrD4l51AmWsE4oWeEdMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qCclTvjMlGDcBjXY1TyJbbi5-wXx7rGN
X-Proofpoint-ORIG-GUID: qCclTvjMlGDcBjXY1TyJbbi5-wXx7rGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210063

On Mon, Apr 21, 2025 at 11:41:15AM +0530, Deepika Singh wrote:
> 
> 
> On 4/14/2025 1:18 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 14, 2025 at 12:41:47PM +0530, Deepika Singh wrote:
> > > 
> > > 
> > > On 4/11/2025 1:55 PM, Ekansh Gupta wrote:
> > > > 
> > > > 
> > > > On 12/3/2024 5:27 PM, Dmitry Baryshkov wrote:
> > > > > On Tue, 3 Dec 2024 at 07:22, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
> > > > > > 
> > > > > > 
> > > > > > On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
> > > > > > > On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
> > > > > > > > On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
> > > > > > > > > On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> > > > > > > > > > On 11/18/2024 7:32 PM, Greg KH wrote:
> > > > > > > > > > > On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> > > > > > > > > > > > Add changes to support debugfs. The fastrpc directory will be
> > > > > > > > > > > > created which will carry debugfs files for all fastrpc processes.
> > > > > > > > > > > > The information of fastrpc user and channel contexts are getting
> > > > > > > > > > > > captured as part of this change.
> > > > > > > > > > > > 
> > > > > > > > > > > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > >    drivers/misc/fastrpc/Makefile        |   3 +-
> > > > > > > > > > > >    drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
> > > > > > > > > > > >    drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
> > > > > > > > > > > >    drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
> > > > > > > > > > > >    4 files changed, 205 insertions(+), 3 deletions(-)
> > > > > > > > > > > >    create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > > > >    create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> > > > > > > > > > > > 
> > > > > > > > > > > > diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> > > > > > > > > > > > index 020d30789a80..4ff6b64166ae 100644
> > > > > > > > > > > > --- a/drivers/misc/fastrpc/Makefile
> > > > > > > > > > > > +++ b/drivers/misc/fastrpc/Makefile
> > > > > > > > > > > > @@ -1,3 +1,4 @@
> > > > > > > > > > > >    # SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > > >    obj-$(CONFIG_QCOM_FASTRPC)      += fastrpc.o
> > > > > > > > > > > > -fastrpc-objs    := fastrpc_main.o
> > > > > > > > > > > > \ No newline at end of file
> > > > > > > > > > > > +fastrpc-objs    := fastrpc_main.o \
> > > > > > > > > > > > +                fastrpc_debug.o
> > > > > > > > > > > Only build this file if debugfs is enabled.
> > > > > > > > > > > 
> > > > > > > > > > > And again, "debug.c"?
> > > > > > > > > > I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
> > > > > > > > > > few more debug specific changes, maybe then I'll need to change the build rules again.
> > > > > > > > > > > > diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > > > > new file mode 100644
> > > > > > > > > > > > index 000000000000..cdb4fc6845a8
> > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > > > > @@ -0,0 +1,156 @@
> > > > > > > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > > > +// Copyright (c) 2024 Qualcomm Innovation Center.
> > > > > > > > > > > > +
> > > > > > > > > > > > +#include <linux/debugfs.h>
> > > > > > > > > > > > +#include <linux/seq_file.h>
> > > > > > > > > > > > +#include "fastrpc_shared.h"
> > > > > > > > > > > > +#include "fastrpc_debug.h"
> > > > > > > > > > > > +
> > > > > > > > > > > > +#ifdef CONFIG_DEBUG_FS
> > > > > > > > > > > Please put the #ifdef in the .h file, not in the .c file.
> > > > > > > > > > Ack
> > > > > > > > > > > > +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> > > > > > > > > > > > +{
> > > > > > > > > > > > +        char cur_comm[TASK_COMM_LEN];
> > > > > > > > > > > > +        int domain_id, size;
> > > > > > > > > > > > +        char *debugfs_buf;
> > > > > > > > > > > > +        struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> > > > > > > > > > > > +
> > > > > > > > > > > > +        memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> > > > > > > > > > > > +        cur_comm[TASK_COMM_LEN-1] = '\0';
> > > > > > > > > > > > +        if (debugfs_dir != NULL) {
> > > > > > > > > > > > +                domain_id = fl->cctx->domain_id;
> > > > > > > > > > > > +                size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> > > > > > > > > > > > +                                current->pid, fl->tgid, domain_id) + 1;
> > > > > > > > > > > > +                debugfs_buf = kzalloc(size, GFP_KERNEL);
> > > > > > > > > > > > +                if (debugfs_buf == NULL)
> > > > > > > > > > > > +                        return;
> > > > > > > > > > > > +                /*
> > > > > > > > > > > > +                 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> > > > > > > > > > > > +                 * domain_id in debugfs filename to create unique file name
> > > > > > > > > > > > +                 */
> > > > > > > > > > > > +                snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> > > > > > > > > > > > +                        cur_comm, current->pid, fl->tgid, domain_id);
> > > > > > > > > > > > +                fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> > > > > > > > > > > > +                                debugfs_dir, fl, &fastrpc_debugfs_fops);
> > > > > > > > > > > Why are you saving the debugfs file?  What do you need to do with it
> > > > > > > > > > > that you can't just delete the whole directory, or look up the name
> > > > > > > > > > > again in the future when removing it?
> > > > > > > > > > fl structure is specific to a process using fastrpc driver. The reason to save
> > > > > > > > > > this debugfs file is to delete is when the process releases fastrpc device.
> > > > > > > > > > If the file is not deleted, it might flood multiple files in debugfs directory.
> > > > > > > > > > 
> > > > > > > > > > As part of this change, only the file that is getting created by a process is
> > > > > > > > > > getting removed when process is releasing device and I don't think we
> > > > > > > > > > can clean up the whole directory at this point.
> > > > > > > > > My 2c: it might be better to create a single file that conains
> > > > > > > > > information for all the processes instead of that. Or use fdinfo data to
> > > > > > > > > export process / FD information to userspace.
> > > > > > > > Thanks for your review. The reason of not having single file for all processes is that
> > > > > > > > I can run 100s of iteration for any process(say calculator) and every time the properties
> > > > > > > > of the process can differ(like buffer, session etc.). For this reason, I'm creating and
> > > > > > > > deleting the debugfs files for every process run.
> > > > > > > > 
> > > > > > > > Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
> > > > > > > > the information(like in debugfs) here.
> > > > > > > Which information is actually useful / interesting for application
> > > > > > > developers? If not for the fdinfo, I might still vote for a single file
> > > > > > > rather than a pile of per-process data.
> > > Let’s say I am trying to do debugfs read when 10+ or more sessions are
> > > active per channel, then for pushing data of nth process in a single file, I
> > > would have to wait for n-1 processes, by that time process data might get
> > > changed. How do you suggest handling this?
> > 
> > I'm yet to see the response to my question, what kind of information are
> > you outputting? What is actually relevant? Could you please provide an
> > example from the running system, so that we don't have to guess?
> > 
> Debugfs would include information like userspace maps, kernel allocated
> buffers, information regarding memory donated to DSP for session creation
> etc. Other relevant information can be added in debugfs on need basis.

Please look at debugfs/dri/0/gem, this file provides semantically more
or less the same kind of information.

Also, please be carefull with the "kernel allocated buffers". I'd be
careful to not to overexpose kernel addresses to userspace.

> > > > > > I have tried to capture all the information that could be useful.
> > > > > > 
> > > > > > I can try changes to maintain single file for all active processes. Having this file specific
> > > > > > to a channel should be fine, right? like fastrpc_adsp, fastrpc_cdsp, etc.? Each file will
> > > > > > carry information of all processes using that remoteproc.
> > > > > I think it's a better idea, yes.
> > > > 
> > > > Hi all,
> > > > 
> > > > I'm adding Deepika <quic_dsi@quicinc.com> to this thread who is reworking
> > > > on this patch series.
> > > > 
> > > > //Ekansh
> > > > 
> > > > > > --ekansh
> > > > > > > > --ekansh
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

