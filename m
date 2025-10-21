Return-Path: <linux-arm-msm+bounces-78201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD4ABF7928
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 18:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D275319A4015
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 16:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBE1343D7A;
	Tue, 21 Oct 2025 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HK+8mwlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2680C2110E
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761062630; cv=none; b=Y0TQOIQyI6lGVexPGFb51FJ3RrHCL8a95depM6zPCk+XPQGGBrnehRcM3n3IYdsl7wYnBRHFb5GeXyp2m7734zYIv2wH5E3LnzkSD4JB6HKbZZLZ8WtVP8TNrwYuZwWcsPFBjiGWxG1ZpyBaDVHNexmzMf5Iz7GkD1LEROq0KOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761062630; c=relaxed/simple;
	bh=FdMPHl3VB3gwOUTsuVIDtS4P3HUy6bOcA7+J7N0rWYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/D8tQSPwfDCC/gXaFvRG+ojtbUUWmni7bz9CSkITsyg+fSIzmy2hvMN1AtkLVAKLQbxjXXoBoPVPIdVi7tLRvLyNFfQQtCYN/CoDeuvGGvjR6ZQsGHxuBaANjh+O/T7Umpc+19rU7DTkaNKFbYHGxA8k/R8+tBGuCg25HTiJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HK+8mwlg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEisxc004415
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzg1b+V2MbCM40QMIXspKGkDVVwpiA7CintGa6Jk2gc=; b=HK+8mwlgoJU7oTEE
	IbusCqNPwFBls5YLROCvLNL42FPzsYKLQw9ABWRPEkXYs9E5cM6N6T5RqHrPAg8f
	QwDiBvOFF7UA1cpbvYoxlAwrQ0zydK+7I7bfP912BwIdWDwd2TQemy7datWQEqiS
	y6yaYzWGhUkkzB2m+jm2KI6siaQUOXWxwv2WTr3CTSaXoUBn6oJqNhzyYULS5e8/
	6pxeadxX1qagwJ7QR5ScIgplEpMLAWOKnrUvY/QUIhwUZW6HIMcOn/a3lco0Oub3
	kx/2RGyW8YKX+GMOS7Fuyo3TdeSe6qRCZgTM20vtpv8JFpS221v78X9ZSjgFcOpU
	hwckZA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfhad1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:03:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-54a86a758a9so80584e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761062627; x=1761667427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzg1b+V2MbCM40QMIXspKGkDVVwpiA7CintGa6Jk2gc=;
        b=vtSc/htlZBo48/d7yCjV6x0fgELttLqJrcl4LbIuEx2qEfFP/ysXF/ubCCcE13wdzo
         hRHbZMktaASBXHuZ0VR5bhKbfla3c7CPJiiq80srchBL026JNLaovNPo2lpmAkYHMVyT
         tRt9yVjct3cZBLa/QjVSnc9FI1owS9rW7+LPqXB6MC8IeKqlQBbTRDo3NfOF2qXstB+L
         qjHqx+NLoXTkExUGdkx+eXOZ0hHsxCvuTEju4oyenzzS0r+bGAqFUjmYrqe8QAFpi6hd
         F3iqDztRbRCazPzlWHln1oL3OEcmX0ILVmCIIZzouWcDaJdeVfVefffp383wp5jvMVJZ
         Sfug==
X-Forwarded-Encrypted: i=1; AJvYcCUHh0UtUOzW/ZRoHurNx2RAL+Cls0DyuxiS7tqgMgmdHVtykPr+U4TIbahSTJIZHsgHLgTjC5UAWm1rIZmx@vger.kernel.org
X-Gm-Message-State: AOJu0YwgilP89yTYXJAyHNxNuMX93XgY47UlkzwjzYKTzY3C96tHdcop
	7RItnCG+AESFz1pdRl5BxPWeHLx2JneUwLu+K11erYMdQxrOWTE8XMChQgMe3Pg0wWAEenlyNcT
	GTSf6KNEJ+F3EKDdAwEbnr29noFH5acPZfmmWobpt7kt5/7RGynMX16fgrbq9HM+p8i6Op9yYPn
	iTmypTKbjj4FUvHantrLYFsVvkzpqnI1AG3DbFnM68hvA=
X-Gm-Gg: ASbGnctyyeorcYi1h5rAM/OL21qXNDwGzIeDk+6om8W8u6aPvrIOPVqIOrJm6GXCbI0
	PvwnzbqaLRjJwIRx8szVaFLrL4Dysk13LNN3jp3wNXd9iXkDSbyo2wIn2SW0sjz2UJIvqK+hrY6
	U/B44CbSOjFkBJjzy3DbHtYiU7/Os4PzH4rFdQNOB8ozC2R28BtBzp9qe9PA==
X-Received: by 2002:a05:6122:2229:b0:541:80ff:31a5 with SMTP id 71dfb90a1353d-556964b26f3mr71368e0c.3.1761062626660;
        Tue, 21 Oct 2025 09:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWHrQqbthjaETH/h/MGGEHvgjs3M08A+BTYpH4dPC2xN8sR4xqX3wTWxEEqxRw9eFyTrg6I8gqf+Cg28YZvHU=
X-Received: by 2002:a05:6122:2229:b0:541:80ff:31a5 with SMTP id
 71dfb90a1353d-556964b26f3mr71318e0c.3.1761062626219; Tue, 21 Oct 2025
 09:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com> <a4367373-a0a4-4876-bec0-d8a560244c40@oss.qualcomm.com>
In-Reply-To: <a4367373-a0a4-4876-bec0-d8a560244c40@oss.qualcomm.com>
From: Youssef Abdulrahman <youssef.abdulrahman@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 17:03:34 +0100
X-Gm-Features: AS18NWCidWXI4-Ma4SweG5OGrwWycP4ccECZXEXtreUEwbNh0eAnQ8MazVgXAcw
Message-ID: <CANyhwx2VQocQyidmQ1zi76zLzM8qmC7KTSDEVqRCgp0m19JB=Q@mail.gmail.com>
Subject: Re: [PATCH] accel/qaic: Replace user defined overflow check
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com, ogabbay@kernel.org,
        lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: wzC-SGPkLSA6PZAbocC5MLEhbqBHA5-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX2rJn7317RHlu
 y9lNGVM6rRiHf42LlWnL01WdPRCmCYFJJIo1ObALdPAVL1Z6M76pzQj9GI0GUxpSeQR+JfNW2Nt
 TXruTYFPEGJZKJRDSUbp5LuOc+JWOXJ/sfsa5BYvoToCtbiOH9VzFrg9McUmjRBaJzQ5M69NsAA
 QvFLAV3oJreD1v3qXdwkCjzrKzNoVCuIHm7bimyba/vRPyvrKSvlJc9pdK5gVK2xEPGC+s2Drqm
 JBs2tMKsWrS1gPXQEUlb/yslAEVoOLTdO+QAlY1DOl+4qnWh0xmzSTBG0cImj6N1Aw/L9avDCm7
 e/kfAVGjNsEoMacom8xudQ7XoFuOSSJ14P0dTX4vURN40KKdykQQzNfwRINhFU8pD02yFm1CKKl
 o32DRp8/ucldm+AIyuUjy/ssNbaSTA==
X-Proofpoint-GUID: wzC-SGPkLSA6PZAbocC5MLEhbqBHA5-t
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f7aee4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=v055lZ0IC0VJRkRHfXUA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On Mon, Oct 20, 2025 at 4:05=E2=80=AFPM Jeff Hugo <jeff.hugo@oss.qualcomm.c=
om> wrote:
>
> On 10/15/2025 9:22 AM, Youssef Samir wrote:
> > From: Sourab Bera <quic_sourbera@quicinc.com>
> >
> > Replace the current logic to check overflow, with the kernel-provided
> > macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().
> >
> > Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> > Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>
> Youssef,
>
> It looks like this conflicts with "accel/qaic: Replace kcalloc +
> copy_from_user with memdup_array_user".  It looks like we don't need to
> bring back the overflow check, which would make this change no longer
> needed.
>
> Can you have a look and see if you agree?
Hi Jeff,

I checked it out and you're right. It doesn't apply anymore.

-Youssef

