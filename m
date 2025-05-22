Return-Path: <linux-arm-msm+bounces-59041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1973AC0B6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 574834E526C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A181289E2E;
	Thu, 22 May 2025 12:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYukeLYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8817E571
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916042; cv=none; b=VQHWK5OIT9S159QhSiK8hi+FRT0clPpQsSRpxXWezqnDR1OQDVDdVYyViSDqrpo4O8N2CM+ukmcoze3Z2V7PPaRpprjQ+l2n8A6PP1J11w8wVuojvuo1i7MSi54L8+zuYSv+33TE+GBBt2rJG8QJ0DPuZkbNEggyZZuBDh1VK10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916042; c=relaxed/simple;
	bh=s/P0VUHg69bQtnPWt2qfePIP7AEdB5qdnUIHt98wVBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ch/Z/lQ1PcNFV97B0n2Z6f7suNWL+KmY81dE3WfJd+u4xdleQ8vOCDIxAnzMMin+D8zVFicvKX7c7OHuYUedaJ9qFsZ8fgLnokucRNvks/vsJfKfScro/wSXv0sEMTrzLspyehy4hYInOJb4bcMxie7+4FJeX5f6M87kQjhuSBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYukeLYT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9FqHS004048
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5E1zkxcDnkBmMlF1lOS5cPZi
	XEh90TLOJgiaJfuSCt4=; b=GYukeLYTJ867gY27ytWcZZqWKLcsz8BQoYjfO6dY
	2WI52UWqH6Xvpdjgj7ux30GLpNwxdQHSi6Wyw3wvaqzk5N6oFfji7IpI97uCxboN
	LtrabJn8UQPZmMCJtlcob5/KBO2lWjwazzKvl8St4Y/RZYSuu1kuDdL8qdLXHBx5
	iOpRwmHL+EL2taXN/57sxsHTOMzpNl+MPaYSDKG4jJ8nq3txWGPgAt9xdKZ45XW4
	Kl1AL98Rt/x4TFhEwN2HfTXDbUG44OmAXZFwYVpUOS0+pChz121DZ0MyZBo7edfG
	suqbyRIVSrPYTeJMFyxdzYmMG1+Va4ZA6uQVygveqLJViQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4x77w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:13:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b240fdc9c20so8065165a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916038; x=1748520838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5E1zkxcDnkBmMlF1lOS5cPZiXEh90TLOJgiaJfuSCt4=;
        b=ZBxaRPN0CnZf8KgqNTmnt80Z6RGrMzUUa/anXdA+MbU8ahbnlFt5t4zfdS0UWBD0Im
         j0mHclJaicuzD5UYMjNZdHZ9CNkNdwK6RgL/ipiQFJ9u0KTkRCT7u9SkrZqmNHd6pPuz
         gmdHxEPwNbshZWOhBUhd04+bsf7RA16MUUs39lJDYU1OhuUeB0BpW6MulL9pKoRoFXwy
         WHXumbrHgV2oYrwU78vWHxTDYaYdK9UAc5cwQAJRWidbjqcT5j4h1er22sFXB1eMcVxq
         qQm+wSEn+ZTlSCm3Lbsv8TgSk4LYN+h8Z7sL7WECTIlbbZDQ5N/0SWTkTIgBiPew6lyO
         ahhA==
X-Forwarded-Encrypted: i=1; AJvYcCWEHrMtdMeCbh1NUoxZzfeptQQGKH4EZArZQy0O86c/UXpDHYH6gIgx5e+IUJqkSZHgwUcnmtNhuCuz4M6C@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjmiOjEtCX18rLHrLlrV6+Q4IVjLB6BRpiTbOgzRqCmkglfWx
	1JJ5b4wlWyouB+38Hki4ThfUXq0SQdVQ1geKbbsqNE0D7Z4RcdKI8wiWA72OB0TonCuyzNhTf7g
	SBSe1xjVwGTgpFJYwPovmsPGgaZjCpIQq/Ftl3Om/91IyOgetLenpFF0SrALUMWwpXsBjKiJ/ky
	RsQ/8lGEb2EE6wMxWX/SAgEsQmZXa5WF7HwG+72qLaNng=
X-Gm-Gg: ASbGnctCo+IjjgmBe4VhTFjJeh0DaEiBhy7n642lEO+qo2IbM6Oyh5aco4fdXllhoAj
	nVgpb/lkZXTqZHymGkn/ubv7IQva7CN/7aCiPmpwY7ICtHVwpwGDSJ2MSSnoCvpIjMfspUWdzRI
	++Fw3t+3k=
X-Received: by 2002:a17:903:3d07:b0:224:a96:e39 with SMTP id d9443c01a7336-231d438b420mr365147175ad.9.1747916038341;
        Thu, 22 May 2025 05:13:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ5VEoVz3hCcxXDIMg7e7/ldmBcjWGXTHC2i7Ve7pS+CwS16G0aa/76B8J7xj+tTqcxPyl5jGE/2dZG9ipeR8=
X-Received: by 2002:a17:903:3d07:b0:224:a96:e39 with SMTP id
 d9443c01a7336-231d438b420mr365146915ad.9.1747916038028; Thu, 22 May 2025
 05:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com> <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com> <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
In-Reply-To: <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:13:45 +0300
X-Gm-Features: AX0GCFtWixz9LfvZ3e0FxkpEf3O0Wt5ZYxeW1nkn2H642fUOmtSlAQNXYBwPcWM
Message-ID: <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: gVTNaB5AplMK9LS-QpZIOmOnyGeaZckf
X-Proofpoint-ORIG-GUID: gVTNaB5AplMK9LS-QpZIOmOnyGeaZckf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNCBTYWx0ZWRfX+GuTYh/TZU7D
 auO2JEG6pksRO5At6GX3yCfI17iH0P4fkBQg/G9pN+r6WE/1d06suRrZD+LB9WO1tfoHu0gSvS4
 gmeyyQtQZXJyU/aD4lmpVKY5N2K+wDS9fOyiGOcua/IWHQjpw+K3BvlK8XAL1A/dAczdDVuoUKX
 oqsui4F3RVEcfCfoWNyHQm+y1VEK/Iu770jOpyaWuTse3my/keyRmTeLAb749Zjsbo20ribyWS8
 oQe13EJcpj9dY9b91QZ+OCHZDYz5spXRY2G/hYaxV1ZDwz3xKswl4z7gDD/iYAcnCSq2m6U8UzV
 escMwDM39tCbl6dAmeGK7t/Z8BkK66t2RuP3b6ypUzFdLZw39OmnAzUXvgi6HjQb8THwaUreTAo
 WqtDOPmyksQk20UEFxN6X7EGJiNGcDOECnN7f7qg53Fu3AC1f7llCgwcBszvwXSNB6ZlnFF+
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f1507 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=kP8C-QOurGtaE5Th5NMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220124

On Thu, 22 May 2025 at 08:01, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> > On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >>>> User request for remote heap allocation is supported using ioctl
> >>>> interface but support for unmap is missing. This could result in
> >>>> memory leak issues. Add unmap user request support for remote heap.
> >>> Can this memory be in use by the remote proc?
> >> Remote heap allocation request is only intended for audioPD. Other PDs
> >> running on DSP are not intended to use this request.
> > 'Intended'. That's fine. I asked a different question: _can_ it be in
> > use? What happens if userspace by mistake tries to unmap memory too
> > early? Or if it happens intentionally, at some specific time during
> > work.
>
> If the unmap is restricted to audio daemon, then the unmap will only
> happen if the remoteproc is no longer using this memory.
>
> But without this restriction, yes it possible that some userspace process
> calls unmap which tries to move the ownership back to HLOS which the
> remoteproc is still using the memory. This might lead to memory access
> problems.

This needs to be fixed in the driver. We need to track which memory is
being used by the remoteproc and unmap it once remoteproc stops using
it, without additional userspace intervention.

-- 
With best wishes
Dmitry

