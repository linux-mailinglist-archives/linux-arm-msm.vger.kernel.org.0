Return-Path: <linux-arm-msm+bounces-59040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4A2AC0B64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 084D31666E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E129289E2E;
	Thu, 22 May 2025 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgaVWke/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF391EF387
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915919; cv=none; b=dOPu3zLKfnvUzVB0ku7QewPW1LR+51JWXpi1q1eoDwG8I27PVf2n7+DcyORmk52pFKMjGFkC20j69+9W42Zyh6kj/7LNkxpdy6i8bU/ARRDzIcc/vPW6hV3EBpIamDM0JUxD8mHzcmyUJipTofmA+BKifmQAfBF3mJ+qiu8BntQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915919; c=relaxed/simple;
	bh=oqvrcC8YRASsnI6iNObCy8oJhW0KzispMcJhTnvLQ/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euaui3G5eg6DhCf3vwS/7lHXD1eJ4F/kBLK1EjQfLWuCm9/99ndQNOog6O6sPr4NnPw+qmZkED2BUFOcwv03hNRUkrLbDWBsA8nML42Rd1GJ1ukaXXEto9gDCIzu9zV6Q+osVztfd4K9a+msHycaRpAQzctr4VujYQPGXCAquIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgaVWke/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7ZjEv020598
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1OvU4OaQPAAxsTJt9AcdgBDD
	Dut4RQiRmCJONEEZXas=; b=FgaVWke/p5ieGS5LDE2P/OYFDZd72vFGr1CTI5Kc
	+ZdfaaElguxJ0CEye1JaW7EY43hMvLmBbzZUdMh9LOowzK9qJw/+IbBXgXZhHyYi
	yV3LQDPV/IUGaikhVzjJnsi/bKD+Ny5Ov4qUkUhbsKp8aF1HpQQ/dDqFfph9bAUq
	yAgf8cduT0NC3AHJak9km52QXudDz24OlBlkPNveP9EG98qIjM8bkQMULtUdLjuQ
	DXTUSOd+a4F9gTpL20tdX5NagUlE9DCLqAYbs2NRkdpqgx7JoE6Fvhlkb0YPKK0Z
	2x8sKsIL7fcbILh+76tX0ZI2EOwIHoEeldX3Z5/Cx7NEpg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb4kp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:11:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231e8ec895bso48406715ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915915; x=1748520715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OvU4OaQPAAxsTJt9AcdgBDDDut4RQiRmCJONEEZXas=;
        b=PnCM/tE0rpQWtG2dDTQ+6/TJBFNYmTFw6y9tliYapdot+wcvXu+0jSR+h1ddkiY/ep
         UFDtp+YM2aDO9mU32Qjbor1TKUmmnV7NW+Jn8pehiTPqlsAAnYK3KpxotnqV2bOJHnF7
         NujQUaDie2EM5+TGfMhPYWtYdRLWx6+29cCp5uV0JULfHq0D8YxlE30CcEc2NLIZoFhJ
         X9ekm3yzr/XJJTwk+Z0Bl5UsZV+f5PIRFJhdT3CRb7IYM7Zz6AJ+JfPs0sUASunrTeqv
         N76mMFkZ6IZUvMcm/PH4/Zje/24N5iz9MHsy2pjj6C9l5SxTfry0WOASnW85YkoE+cgh
         PAmw==
X-Forwarded-Encrypted: i=1; AJvYcCVFYWk+pZVpacUjLQuuAqdzXordxrW/HRUL4WC7aNNBYxuilIet853w6UgUQhAIiJAg7FioyEHhQ1iGLwLk@vger.kernel.org
X-Gm-Message-State: AOJu0YysSKff2FUt+cTzrOreMvnf7lS53oOaIiTNZ6qjRCNuLX50bJbj
	+w2dz5eWNZEF96+MZGhX6yFuh1w63gSuxClyGYpC+gRrEFSJlHT1fnn5f7OzwG3tV57QjZ2NA33
	CqgO2nT7utgMD/kPj+kPKgJhTj8J2RREKHpqPG8x268DkmO2shOUhWsKnGZbj10HsoYjI+nvEw7
	bYfbgkUlcWjSvRVRgs1cLQ9f4XnQarIl0DJavAiUVJF8I7DhAKEI8=
X-Gm-Gg: ASbGncsi8ZbAjOocOajxeB3IQcyYI+Omn4+DsdP3QK4JVHRIrGRigYjFUc/mY9rwfsd
	awlhUUSBPT8GC/PNQctBPppGt5ieMlHrNS/a7ekQ34u5LdsohZYEfSLA1jr76gBM5Bexw9JZEXn
	gL5mOZ8M8=
X-Received: by 2002:a17:902:d4d2:b0:231:faf5:c1d0 with SMTP id d9443c01a7336-231faf5c3ecmr354091975ad.24.1747915915329;
        Thu, 22 May 2025 05:11:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESIl+YAA+LmGGozI0lWLtu1kBwk65N5SNlCdpiBMOASwRP9Ac6amhIibfmRF/Rk9s+GFOqroMlir5kClZwazo=
X-Received: by 2002:a17:902:d4d2:b0:231:faf5:c1d0 with SMTP id
 d9443c01a7336-231faf5c3ecmr354091545ad.24.1747915914913; Thu, 22 May 2025
 05:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com> <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
 <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com> <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
 <36327516-3db9-4bc7-ae2d-162135466e7e@oss.qualcomm.com>
In-Reply-To: <36327516-3db9-4bc7-ae2d-162135466e7e@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:11:43 +0300
X-Gm-Features: AX0GCFvYuxPUpH8myXBy6T_C47lECUFkSMBFRBtjqAqbhfjKJulCyzwdkmj7MpI
Message-ID: <CAO9ioeVCU50YX8jYdCxTZ066GjpKW3kL+4mA=PMrOEROb1szuA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f148d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vDpd8R7RqsPVAR_k8fEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: F3sRi6BN5Zwv0Pno0CuAEXOFypIKMgkj
X-Proofpoint-GUID: F3sRi6BN5Zwv0Pno0CuAEXOFypIKMgkj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyMyBTYWx0ZWRfX0RxkSeSkW1O7
 ed6/bo8Qf37vtM5ifus09nbomkOPz9qOm6BdEN/VfgqyQeO781VXNB61DZUTHjqX/ydrHYAqdN+
 QOJjZ/3w5LsIE2ULyVLXEz9QNtEh6w3O5/7d7P73KaBSocLhTw+RS10E+WqvL/2Dj1HbuyqpqHx
 3Lyr1unj8CmYTKVc++k+BDOHFZKbB/qDKj7mCXMrZ9rfLP9tyuXCgcnFRCmdLFylwPO7w2ew5J0
 veOD+NQB94KyF48XGNHG4sLYSVC56vQJ3SkiOAX+a1IjoKaDa2PJLTxpMEPrP2zk+SuoSFOeCnj
 2h5BDBU7ZJ24DccQa1PW3dsiCbmBX/qVH7wjOaIA+ZwHClo7pnHsJCPSIF85HwS6z9Moih8Rlpp
 t2WrMRLQSvahGqkVmxl3iz6XrypGLj/onDNob+maYoGjBZsz/RdnRE5jVzncq71CWXz4PudA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220123

On Thu, 22 May 2025 at 07:58, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 5/19/2025 7:01 PM, Dmitry Baryshkov wrote:
> > On Mon, May 19, 2025 at 04:23:28PM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
> >>>> The initially allocated memory is not properly included in the pool,
> >>>> leading to potential issues with memory management. Set the number
> >>> What is 'properly'? Which issues?
> >> inbuf.pageslen is getting updated to 1 in case buffer is allocated,
> > Is it a flag or some page count?
>
> This is page count,

If it is page count, then why is it '1' instead of being calculated
based on the init.memlen?

> based on this count, DSP with add memory to audioPD
> pool. If it is 0, the memory is not added.
>
> >
> >> which only
> >> happens if (!fl->cctx->audio_init_mem).
> > You are describing patch behaviour.
> >
> >> Till now pageslen is always 0 irrespective of whether the memory is allocated
> >> or not due to which audio PD is never able to use this memory.
> > and the is current behaviour. So this answers the first question.
> > 'properly'. Now, the second quesiton. 'Which issues?'
>
> The issues is actually memory leak as the initial memory is never
> used by audio PD and it will immediately make a remote heap request
> as no memory is added to the pool initially.
>
> I'll capture this also in the commit text.
>
> >
> >> I'll update this to the commit in the next spin.
> >>
> >>>> of pages to one to ensure that the initially allocated memory is
> >>>> correctly added to the Audio PD memory pool.
> >>>>
> >>>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> >>>> Cc: stable@kernel.org
> >>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc.c | 7 ++++---
> >>>>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>> index d4e38b5e5e6c..b629e24f00bc 100644
> >>>> --- a/drivers/misc/fastrpc.c
> >>>> +++ b/drivers/misc/fastrpc.c
> >>>> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>>>            goto err;
> >>>>    }
> >>>>
> >>>> +  inbuf.client_id = fl->client_id;
> >>>> +  inbuf.namelen = init.namelen;
> >>>> +  inbuf.pageslen = 0;
> >>>>    if (!fl->cctx->audio_init_mem) {
> >>>>            err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> >>>>                                            &buf);
> >>>> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>>>                    list_add_tail(&buf->node, &fl->cctx->rhmaps);
> >>>>                    spin_unlock_irqrestore(&fl->cctx->lock, flags);
> >>>>                    fl->cctx->audio_init_mem = true;
> >>>> +                  inbuf.pageslen = 1;
> >>>>            }
> >>>>    }
> >>>>
> >>>> -  inbuf.client_id = fl->client_id;
> >>>> -  inbuf.namelen = init.namelen;
> >>>> -  inbuf.pageslen = 0;
> >>>>    fl->pd = USER_PD;
> >>>>
> >>>>    args[0].ptr = (u64)(uintptr_t)&inbuf;
> >>>> --
> >>>> 2.34.1
> >>>>
>


-- 
With best wishes
Dmitry

