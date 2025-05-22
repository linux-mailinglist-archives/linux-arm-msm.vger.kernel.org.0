Return-Path: <linux-arm-msm+bounces-59039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88FAC0B5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAE661BC7319
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586A828AAF6;
	Thu, 22 May 2025 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhMa7NUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A731828A715
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915804; cv=none; b=Y1ijgGrfMsFtZSVLDCpw6VqEvypIdVyUAnMG3dfuZ+NlP/mKVGtjutssKeDlkP/ryCY1ev3TMFtzAwK5uHrdnJ1k5T8zzPoihxK7LNkDTRC3rDHC/6jSoM/lz4EoKj8rk0eR9lNM0QH4gOujovEAkkx0ihirgbmVxFrQQ+2fo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915804; c=relaxed/simple;
	bh=lnm28Rpc5lq581XHErrZj8GDudLHSBmNCFWcJ2epunE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrGxSGs4hTJl0JmD6+L+jVLDIOeJNfSKrN+7lETHmunzFfB0N8O3ppnz9uMzJoDho4ZeFxBYmmjNoV8miegMd2KHK/z7yfyE0Td1B9EPmc+fIJsVs+V3i8yXyAtaxD1zcIlw0YmIXAZbCnT83gyZD/S5nVAjDHhU0EA7dGS9HMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhMa7NUv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M76obk020640
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BvoQG4hxN3v9pTAKmz1SDn44
	poE7d7zcfXIMZbDRh+w=; b=KhMa7NUvYXtiGvcQRGxQKGttbjFCq3st5bxBgLm9
	bXv8sAxKKSzHr76mykyJWqpiFKwR/VcgtuzKMxzI7qP3CpdBU0OU0QStL++NH9HN
	XB4OM9hRHXx66FgbsKSlT0TT6MimbnfEBs4GIw9D8F5wM4DC/PyUeRk/g0tnLmRK
	9BxTDglpF+98INIs0WFy+6op3UjBtILbpVRcTv/3iKwKcT7lzFLNpoH7hqSyyFVz
	VHJzTKy6KW8tMgiHeT+tZPZtmvlykCmjCwGEctb/evarY+gSEIAh/9bkECwNE2fm
	Thvuc9VOHeqC4uYNSh1rpO6bH3mX9ogMVZk02ekXCA+bMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb4kgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:10:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23209d8ba1bso50154615ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915799; x=1748520599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvoQG4hxN3v9pTAKmz1SDn44poE7d7zcfXIMZbDRh+w=;
        b=KMMsCI8S4jREit5L1hrgAr8EkzS1IBSfRjC0DnglSdjmOyjtW53O/1pVutZq70mpfn
         Y+xFNgrmMShY2Tn4tY6eUIuzc6BtTrIM1W2s1UmBtrjAvoxA8OBeCnNvDZytQHQ17jaw
         tZnD1cMeYCGb6CQOwkuf4ac+stiLA/yOQ9N5ogyA9M2d62jJd5syNTrWLfuXIaKckQ13
         YSFf6XRQ5KJcF4Goz8zpsx/y3zDbsJPGkx7lvzCCjaa//mPqoKpbnclbxOJ69FDzY5GE
         /69FH5sp5rz/8BJ2Px00F+lrMGv9OOW7VXWrw8yLemRiBRPmX+ThAKKzfprVigQpqs9h
         f8cg==
X-Forwarded-Encrypted: i=1; AJvYcCUS6wasIetjd9qIpvX6pnxC8ThTWkK78oXbv4p7p+blxV5kaVYRf5FA3LKPuVWfw+bD9jf+W9w4DK77Zo2g@vger.kernel.org
X-Gm-Message-State: AOJu0YzuhKQA5BH+AXpxGQbqpJ03gD7/NzgjGyGXROGYup8DKzL66w14
	CjR4tHSpN0iQBZwSkt2lWtXLEG3KAbTa0ECZML/KWhf9s9XhO7A5q7/pOFz0guTvdbgo/8rDcWe
	lg4LCoOnkvvXNQMzEshrIkRm2sMxClvFKcCTGcLZvLXS2Xc2xKxc0U9D3cBa3rODytEk2S7uRx+
	T/MdKBf3JZwH1o76m2uq2BWBWEqrOkRGVcaHUpg9l/KuqujxQtICw=
X-Gm-Gg: ASbGnctSUVTP6qKnO44Kvw7HVjQZZnjwAgo7gK5hDF9lrXjVCHS7HOxB+7h5fX9pBeN
	cpz7bhOdP3jXnLV77XGz+iW6VcQkrfT0OPmD+caNosDHNjZOYVBcGdNFTlKMhoh7fe1LpVAR8u+
	GmGhgrmSc=
X-Received: by 2002:a17:903:2ece:b0:21f:988d:5758 with SMTP id d9443c01a7336-231d4596fe8mr400738435ad.35.1747915799380;
        Thu, 22 May 2025 05:09:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdCEwriPVhJPw7aBmQjyQWGffLnnxmkS+nFx7YdAAALnEIq7gGUgxBOtu3WCTCH7z5TqwWGCJc6wYpPvnz8mw=
X-Received: by 2002:a17:903:2ece:b0:21f:988d:5758 with SMTP id
 d9443c01a7336-231d4596fe8mr400738015ad.35.1747915798973; Thu, 22 May 2025
 05:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com> <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
 <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com> <tdae3jb7zbkbzvk546j5jnxnfkeux2bwrbz3i5gsehecj65n7v@2hseuptlk2a2>
 <999d2ca0-b3d3-4fa2-b131-092bef4951c8@oss.qualcomm.com>
In-Reply-To: <999d2ca0-b3d3-4fa2-b131-092bef4951c8@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:09:47 +0300
X-Gm-Features: AX0GCFsNC0SwHmC2cAOj9-xXlmg4In_ViGMOryv4sEh8pgb9XcJxs6N1I7dggY4
Message-ID: <CAO9ioeUW=v_CBUchJEt3PArbzBbUgznFO8TK-j=2yUkv8S1Baw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org,
        Alexey Klimov <alexey.klimov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f1419 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=mJARKV2re0eqfElz6OYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Wq6xpouAK0dYOoTOesPMSOyBnIxeDBK8
X-Proofpoint-GUID: Wq6xpouAK0dYOoTOesPMSOyBnIxeDBK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyMyBTYWx0ZWRfX5FiMNLXK6+F2
 Lb4mSIeEFwqEvemaUoxDkfDmwSWhZ9c8+PRe1amXY1eDW/3+P7gIWc2X4Uw6+6IPG/Hw4VQGjAj
 OLdqaZhKFzcyB6mGy+NBPzZMsXzP17HMRWU9lUOQFZ1lxjgRaKhyLCd0aHszRsz6yGyRA9vcDcu
 UmCTfOTMW5p8YP0PI+N+GDImBvMwqOCiCnuQNXY84ulHvAlG446VBE1//2XxYZ0W0cmtDo+joYR
 HEE/ImMqee+t5GwzwqczwgYxXi7wpgjlvjnYKBbMPYsuFEIP95mMechgyF7MbGv9zoi0JPe/GZa
 vJC6/orhv6bmW6quMMGd3ldojRnoRs3QqrH8gaYntSSAaAT95pPShEvnhzJuFNfEMDCCxp48IU+
 yatJKnaR2vtS47QN9y3R2DpGE8UfyN9F+hnsmD+8Wt3ms02O8sUFaeaxmSamloSDVRk6URL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=922 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220123

On Thu, 22 May 2025 at 07:54, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 5/19/2025 6:59 PM, Dmitry Baryshkov wrote:
> > On Mon, May 19, 2025 at 04:36:13PM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
> >>>> Remote heap allocations are not organized in a maintainable manner,
> >>>> leading to potential issues with memory management. As the remote
> >>> Which issues? I think I have been asking this question previously.
> >>> Please expand the commit message here.
> >> This is mostly related to the memory clean-up and the other patch where
> >> unmap request was added, I'll try to pull more details about the issue
> >> scenario.
> > Thanks.
> >
> >>>> heap allocations are maintained in fl mmaps list, the allocations
> >>>> will go away if the audio daemon process is killed but there are
> >>> What is audio daemon process?
> >> As audio PD on DSP is static, there is HLOS process(audio daemon) required to
> >> attach to audio PD to fulfill it's memory and file operation requirements.
> >>
> >> This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
> >> sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
> >> daemon as it is required to take additional information and resources to audio PD
> >> while attaching.
> > I find it a little bit strange to see 'required' here, while we have
> > working audio setup on all up platforms up to and including SM8750
> > without any additional daemons. This is the primary reason for my
> > question: what is it, why is it necessary, when is it necessary, etc.
>
> This daemon is critical to facilitate dynamic loading and memory
> requirement for audio PD(running on DSP for audio processing). Even
> for audio testing on SM8750, I believe Alexey was enabling this daemon.

Could you please point out the daemon sources?

As far as I remember, we didn't need it on any of the platforms up to
and including SM8650, that's why I'm asking.

>
> What is it?
> - HLOS process to attached to audio PD to fulfill the requirements that
> cannot be met by DSP alone(like file operations, memory etc.)
>
> Why is it necessary?
> - There are limitation on DSP for which the PD requirements needs to be
> taken to HLOS. For example, DSP does not have it's own file system, so
> any file operation request it PD(say for dynamic loading) needs to be
> taken to HLOS(using listener/reverse calls) and is fulfilled there.
> Similarly memory requirement is another example.
>
> When is it necessary?
> - When audio PD needs to perform any task that requires HLOS relying
> operations like dynamic loading etc.

This doesn't exactly answer the question. I can play and capture audio
on most of the platforms that I tested without using extra daemon. So,
when is it necessary?


-- 
With best wishes
Dmitry

