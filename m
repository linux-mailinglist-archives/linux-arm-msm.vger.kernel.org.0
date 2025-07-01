Return-Path: <linux-arm-msm+bounces-63281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068CAF0267
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 20:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87C271C07C79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7CF1EFF8D;
	Tue,  1 Jul 2025 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI6jlCvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD92D1B95B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 18:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392943; cv=none; b=GpdHr34g9SymtiEzM8dqf+GrCYEngOj6LIpTsnvWPRhLCsWZ6N33rn6llJ7NUsaua5PqqR5MkxZUOKHJThtLyINHuuK9ZqObWrDsn3esA8axVVMJ3RSWviYS+XJWrCDVwlJPXfvwc/3cq9YSxm3bG+vMPlPnlQrrbAk3AzvvzfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392943; c=relaxed/simple;
	bh=AGx4es3QEJk0A3jHFs7HSwzuxOjRzJkN5gEt240fJMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RetHoghRFNcG1Eq2lpIayYuoqkenVKXAW3kiYWSNfSiuNLLb63XGBuE0BaRjqTFZcb0j2stpEdC4RsR7H/6oVgQvjZDa3ooQSGU2McPVc+8qGP1blKlKFGk50zs/eahGB7Mr+S4pMNnbqcLS922MfUUpHVYfMmQtxriXtBntfZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI6jlCvY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561HNTRr024738
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 18:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=CQ+/zsTAqe6KKzt7JNCR9p0ICYFm+DFlKaKEBaEu+A4=; b=AI
	6jlCvYlE+IeehXlbRWz1Yx4zT+SWuAf1UthgpXjnj9yMX7rZWanKAPmhm+kOIADF
	ZMzp2HZawuaM9y5uoj2uVNe/hZHK0KS3IsndPwKHB+E9YLE/007JV/9gXfkiGPQ6
	50cmxEml5nkG28gcXacFmjo4iyAWaTR3QOteooByb+5+nWGTB6fGUzuN6x6UAusV
	Xj/zlLEbUjrzN8kcPfcYbO943vhjQuBsZle0Ow3WGGiEqUJsjZklNCE/H5KBSsjO
	m/qKTFq0WEJuQw3JBnAhl3h4ubg22meTge89aNtHLs+kFG7I+zie3y/KMcLiXvuy
	7KBtBXrE21IX23l/WOSg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9hvnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 18:02:20 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6119947095fso513506eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 11:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751392939; x=1751997739;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQ+/zsTAqe6KKzt7JNCR9p0ICYFm+DFlKaKEBaEu+A4=;
        b=h8KafGSfXhyXSvuaV44QiIKpfXSxcojPryeyrd46nrCOxW4yfknocXiBwEvfcON/u3
         NxpJTZCS9NFM1r6zDcwORS0LewoibtuXyn7M+2c2AmPbOcHPnKoMdkJSJmYUygouFH1T
         8QA6gf2oySPRVwHWQBDcll+QojermFogCAGL859z1mjExhsklvAgxA2LeKF1Y92ip22R
         RiRR59TA/gh/oLHY2lFTmuEUL/v4C9tP6b/pLWlYnTl0nFxa3WT7+lWIJ3+10o0Pv7pK
         lepYheBAzXa0hTdt14A6i/c9QoVt25xkfVgWkZxzWS3mnscYxBRJlDDT9XwSDJSPbgqL
         UZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCVasD1eQoaoVYxp4dAyiAc9Oe9VNI6T2k7juhvBGC6HxhvPcHU3aGXy/Bf25jZXuT2GbR1lrJL+ZJe8fDyl@vger.kernel.org
X-Gm-Message-State: AOJu0YwmE8cBjt4uTqqeEF9h+udY6EynvGew/FisxOQejA+gvLN35+Iv
	MjnHavhDyXuyQyxZuqp7d+gxq/wY8JkYI/I5Lp5W7Anl/lF/Ir+klIM7gef3+olHFGKuoaj9gTk
	mhOSzyO5tHcY4+lRwUDyk+YI2P/ZfMhP1T3TI9o29AQrDAz5Oq4IZgPBrVx+aLpx+GZxrf1Ku60
	TZThkmQ+kcRFOCbrAasGokt+U/hHsiOJV18WYffww1X9w=
X-Gm-Gg: ASbGnctzRsHXjcDeA6Klm1t1xFUV6JpUUWN9SSLVlgWD+0k0Tp1Pt/Axp7Lzygcx0F6
	0hZZnl6IBvy0TlCZ6GyVQmUm4du5NcdljGz9rT8OcgMjQKjJIczVimbM5a8dYlt1IYXrmork1fC
	PfHDzGLm9T76HUI1ZNgEFuvxHQIJOgPoYI694=
X-Received: by 2002:a05:6820:2089:b0:611:e30a:f9c7 with SMTP id 006d021491bc7-611e30afbaamr6002768eaf.7.1751392939212;
        Tue, 01 Jul 2025 11:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGLLMPx8gOzV/UHxJmHmm+YJfG0GmnfPmwSBIgSo8SZCDasmY6x5pEdz1Xvh7rP/DSNZL6VK6+oNWw7imEboM=
X-Received: by 2002:a05:6820:2089:b0:611:e30a:f9c7 with SMTP id
 006d021491bc7-611e30afbaamr6002704eaf.7.1751392938612; Tue, 01 Jul 2025
 11:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-9-robin.clark@oss.qualcomm.com> <20250701162420.7dndnmld2p73atex@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250701162420.7dndnmld2p73atex@kamilkon-DESK.igk.intel.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 11:02:07 -0700
X-Gm-Features: Ac12FXyivs6UOMVJtoIllSHU4SZK8oXweiKud8YnoU_KM87ZfFJLhnfpNoVTO3E
Message-ID: <CACSVV0251in35dD-=hk9oy6USZCxHR-oWFy+Xk+YsSyy_LDYtQ@mail.gmail.com>
Subject: Re: [PATCH igt 8/9] msm/mapping: Add wait for stall-on-fault to re-arm
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <rob.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686422ac cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=3PguM2h0FNWI6asSIAsA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: hRTrgxCYa3DgymtAqWFoyyBZLcvRRRoT
X-Proofpoint-GUID: hRTrgxCYa3DgymtAqWFoyyBZLcvRRRoT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEyNCBTYWx0ZWRfX8Jwx5hnljnlN
 U6fJ5zTM/0V+Pdja5yZIvL85Ena76rcTgF4qAe+0koqCpB3skrhkBoUjuPPOwv8jLEg9iGBSorv
 88I5QkZXKyLLMFkPDus/P9ZuPG48rtKmA+xVr1W0axgZp3MCxKzOejvySKqKbx91VvjhamnnwBe
 4XvlG0pVSGb+zTIIAjO7NMN/R58GN/llTCbpuq2324N99WDa+qkY5W1PdL7AU+NRHI/B/+IQckj
 ddudQA7W16oz0h3RpAiBRvtrIioJ+Te7VgD04zLXkZgs0DHM3graTzM9s/5ct2+05t4kJ39gHmC
 Yu0wN9Uz9EUOgx1tolb5Y4RIxJ2+8Es90T3yJrRoy9Zle3J1jtHvFIWYMXiRfRiewftit2wLFZi
 ccloha4h954t3Q/1+l8N8NebD3Dxyr/eakZIj+7+tLrwfQtlrRGvj7i0D7ku+K2OOTwjyvIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010124

On Tue, Jul 1, 2025 at 9:24=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2025-06-30 at 11:09:02 -0700, Rob Clark wrote:
> > From: Rob Clark <rob.clark@oss.qualcomm.com>
> >
> > Newer kernels disable stall-on-fault for a grace period, to avoid a
> > flood of faults causing instability with memory translations that
> > the hw attempts with the translation stalled.  Fortunately it adds a
>
> Is it system-wide or only for msm driver?

specific to msm

BR,
-R

> Please improve subject:
>
> [PATCH igt 8/9] tests/msm/msm_mapping: Add wait for stall-on-fault to re-=
arm
>
> imho it could be shorter:
>
> [PATCH igt 8/9] tests/msm/msm_mapping: Wait for stall-on-fault
>
> Regards,
> Kamil
>
> > debugfs file so we can know how long we need to wait for stall-on-
> > fault to be re-enabled.
> >
> > Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > ---
> >  tests/msm/msm_mapping.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > index 978ea18375dd..7e2f5c7eadc8 100644
> > --- a/tests/msm/msm_mapping.c
> > +++ b/tests/msm/msm_mapping.c
> > @@ -74,6 +74,30 @@ get_and_clear_devcore(int timeout_ms)
> >       return buf;
> >  }
> >
> > +static void
> > +wait_for_stall_on_fault(int drm_fd)
> > +{
> > +     char buf[64] =3D "\0";
> > +
> > +     do {
> > +             int us;
> > +
> > +             igt_debugfs_read(drm_fd, "stall_reenable_time_us", buf);
> > +             if (!strlen(buf)) {
> > +                     /* Not supported on older kernels: */
> > +                     return;
> > +             }
> > +
> > +             us =3D atoi(buf);
> > +             if (!us) {
> > +                     /* Done waiting: */
> > +                     return;
> > +             }
> > +
> > +             usleep(us);
> > +     } while (true);
> > +}
> > +
> >  /*
> >   * Helper to find named buffer address
> >   */
> > @@ -224,6 +248,11 @@ do_mapping_test(struct msm_pipe *pipe, const char =
*buffername, bool write)
> >       ret =3D sscanf(s, "  - iova=3D%"PRIx64, &fault_addr);
> >       igt_fail_on(ret !=3D 1);
> >       igt_fail_on(addr !=3D fault_addr);
> > +
> > +     /* Wait for stall-on-fault to re-enable, otherwise the next sub-t=
est
> > +      * would not generate a devcore:
> > +      */
> > +     wait_for_stall_on_fault(pipe->dev->fd);
> >  }
> >
> >  /*
> > --
> > 2.50.0
> >

