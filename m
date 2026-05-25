Return-Path: <linux-arm-msm+bounces-109609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPKiLwwYFGo4JgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:36:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC485C8B1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65E573006B1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D153E5A38;
	Mon, 25 May 2026 09:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ig9hIB2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cD0C/mkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B543E5EC1
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701747; cv=pass; b=GDNg8vigLytCLmwILUVcG2Q2+Fn/WbWJqbo1ly75emeSEc7NmsN9+UCQjoOp86m9ZnnRS4obLuIE1rjAWwvNnmbHEDqZfB2OeVb3HhA7A7TC5fmjxzXG7HqENT8uOMdY/3X32DIrk8payDpY2V0Sk4Y1kEAwG/DwX0+APMB95N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701747; c=relaxed/simple;
	bh=gv0+OBeeKDiUSaAIuiPrjNEn4hFjITbz4dCXiJ3aziE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcUuynQVcPMhcyd8ZARxotZqxwLNyzhmphbvDkLkoGQ6gqpQII0M0QyyVlxd+R7HTZGrUq3BLXBDZIomwuIeZqm/8D/9XZnQJrQmihgHDukB6VL1sRDgRUdyzUUGLQHri7XzxLXL5fr+1Rwxnme5ePcHf6doSCoxXS3eemPPYFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ig9hIB2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cD0C/mkd; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7WJTe2244701
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+jiBA7doX9rURskYnz5ej3I9
	j5hNMPLyAxStOrC2T/U=; b=Ig9hIB2SbuMDIfLikSuKvKm8JayiTCS+DwGvvLPi
	FAEecXskNhIaaGe4xc16cIfgfUq1ZQ0N7UVxoXIQz8+Gdt0PbUVxgEEo2dfv2FW/
	46cr/rfy8bsW8nJzk3PNVLIvEg3vxpwjM5qnahdgXPZ/hG/xqyG9HIsmSbhOpyBM
	eRv3bh+RZ8leedyP7n+NeF58zIiS5w0ZCjjEBT6/vGDh+Z8M3idOj8Y4D8DbAplq
	4edXFbiREj+TrhvvdPBHfA7jFT317OZT3n+o6cXI83WRov2CWkYa5LbZvyvNXNQj
	jPcAn2GjJKRAQlTmUGAS+jxbx1Z53UKFu4Ebe8736Vj2Ag==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7p1ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:35:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83544d05c5aso4622527b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779701744; cv=none;
        d=google.com; s=arc-20240605;
        b=JQTIo/zcoVYbzgEU62d2VaQ+io5pwatBl+PuCU8pu29se+ZbxUa0jUcsY8CGfq7sD3
         jPGvwJur/NBo34DF9hqtJtrQgEb5HzLqJOJatnhRDXv3yy1LJq7H2TWaEFqi06gEd4NX
         TWlMTmoaSXhQA0Kp/NrvUnrj1XPvZl3tFPvAJxX9zm5Yqw4OcOtcYX4UAmzcQxUDjMf9
         jGchU7sjrAx7Hr8hm5FqWDXtfKYwE6spZlWtR7dz2LPynWaTa23Ofr8vtZiCyXHeLn1q
         SnUBlwnXW2XpshaUz9JFDCeeFC4+xRTZpbpXaBz7abq+iUqglsnIztr07tdzeujNmfz7
         38rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+jiBA7doX9rURskYnz5ej3I9j5hNMPLyAxStOrC2T/U=;
        fh=GYxZaPkzZ7sVq3l3oTGwS74SLBgvRp+K6bQP5fshuVA=;
        b=AgLL8faJAD5wnJzn3rCEbwj1QU2wmb9UF7hqtHK8VdS7oPThe1i1cfG4fCdTZ2qCbm
         nak+8JRyrhtPLzgGRxIBPlwZQ6WYLcVhBSnyaBMpaxqoxQfr39iXTsH4s8VAlCR+VGCz
         X3sOU3LPm/6GZDeY3EkSv/7c7UAh0H/ZRF+wiqseenm3pk+xlWnaTo95BkvGO5aM/PG1
         EfBuJ9trb3L/lC0Elksu/8SytYP7rQTB2cQqMKIG/KaI947QsQooveeyT8PpKWd3jfBP
         ceOmmuf54Om0tz6mJoKeLbXjuYmHiL4kH0cnCQnfQAN99TCNf+ReA9olDNrd8Jg/sG22
         hryQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701744; x=1780306544; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+jiBA7doX9rURskYnz5ej3I9j5hNMPLyAxStOrC2T/U=;
        b=cD0C/mkdSi5vxDKa8qG+wE4W/NOYDxth4POxnDc0LpUtSYVvym4HS+ZE+MJsojS5Z0
         6XMLls9vy/QsJPfw7Vi3pvaepWiv3RHknJyk8KDmRjVzJJTZEG3CdaeMjUp3SL+c4eed
         UeZIkp2kg4C5yRJdAGkc2i+E/1PUoAUUS+HRQC5CG9INjEJ5yTn57oSGO7I6IwhEVc8Z
         Gy/F/mRlc7evO3pLbzmB8NyPI9eBFJSIw3xfWwzXfggG7iaD173eGgIr0nuYuqCtT1gE
         b6Wtx/+tc6pAYmwaCdVqeIktxyllAylDVwHrdCCBcEmRK+AoJA9qjhsdPEkb1OclB5U6
         Qa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701744; x=1780306544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jiBA7doX9rURskYnz5ej3I9j5hNMPLyAxStOrC2T/U=;
        b=enYaz3E9Fcu931BJVxjXXxxesGfxynsIUvrUxOVnRunJnkFiQ9yp8PD0LRzEJxNYrB
         VCVfaHtKDAgn6b3Aeu7PE11f717xec3JnEJ4WW2FN6TavQ2H9mYT+i6A9ZhkD4DYpbTt
         wmVEDlH2rRl2dtkMtxZyY+I9GUvf+toZTENHcM+QKv0dbdHnwPqceQEWXOOV85xf2SAp
         ZVO+LGg+Vv305puKc7Sm+sBoexLuNlP52apBMlWlo7Uo2ILLy9UrJnyweYFvW6250bJw
         S0z7qbyyEgrc/SAu5aFlcu09gElJso+wyAvQuQypNpHcYMHJE7mh8lRauNXn9cqET4Dw
         ebmg==
X-Forwarded-Encrypted: i=1; AFNElJ8hd2fUJYPny8xaobr7auouwrszZc9xeRLzF+6lKO34ubTK93d+aLvMLA0UU/uoGtkwpp91dZs+pZWxcK3m@vger.kernel.org
X-Gm-Message-State: AOJu0YxcnVACK0YWPYitxTWi+05kcb5yQJ/mfeR2tMpVFiv/rm+VUYlz
	4foZP+rzb+j9RP6pIzpjceI0Ycfr+PiTo1LX3kEeOiB8/RHtVlW7q6x1obO2B3HQZAabGkFfR9Z
	EcXBswR7oQzZU6lEObSqHQhzBzcXcuoyL1875b22jg8K0lSMQA63wZl41nxb1uLuMWdrAClJzGR
	IlvSJp5dxVFaNlynq10MJ5/S9Fp489MHZv4dyRqk09qAI=
X-Gm-Gg: Acq92OGYzDr158JhiRDDgVc3YSbQ6Fh19WZvaWlVEJjlCtF3c76ARlxsCCjD/Z7a39x
	rNvJmzOmVCiTPT43A2if+YIjNnrEsWEjX4nS3dft721BYL7x1EfD5+uXEH+4THxgjoUX9JB50dg
	6pyShZhOXIzb8OQNlaNEwWiWLJihprmGbLBUU6FMNdNBElZ7tK/AakuAz0IinjBCz1i/Em4gnDe
	+fY
X-Received: by 2002:a05:6a00:140e:b0:83a:4846:90b0 with SMTP id d2e1a72fcca58-8415f3c6635mr13228163b3a.46.1779701744143;
        Mon, 25 May 2026 02:35:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:140e:b0:83a:4846:90b0 with SMTP id
 d2e1a72fcca58-8415f3c6635mr13228122b3a.46.1779701743493; Mon, 25 May 2026
 02:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-3-jianping.li@oss.qualcomm.com> <xnkycubizpoe4rmhc3jt36ulx2fb3tubjybu3djovafkqqttmc@o6vw2so5ctxr>
 <37146a3a-b18f-40f1-b95b-0ac19bf6c07a@oss.qualcomm.com> <lvfwkplrktjldbvn3j3jqh7ds25prx723at5t5oobsvhgolngs@pme6jiac5xdg>
 <85c2bfd1-8e69-47e4-a360-10a2655bd43f@oss.qualcomm.com>
In-Reply-To: <85c2bfd1-8e69-47e4-a360-10a2655bd43f@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:35:31 +0200
X-Gm-Features: AVHnY4LlU98vParczGXOu16cCLc3xW3kpnRgy1EhIULshOedjsWgR9G244QanDo
Message-ID: <CAO9ioeUgeo-MiP7pNY16wL9d7LKEi7PR7pJtH=1hMg-mnMSOPQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: xwrNeQ2u5iED7F-sKZotBf-MwUvsV_5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NyBTYWx0ZWRfX1hPwowrDgUxu
 H9UyO7MDoFTZf8AmCNoMv0C9AFAzN66OZc6AQUsBF/CnDO1j0pJ3tOhrBjpdNuhDN/rXtmdjmlM
 R+f4JrdzuCvNfFHYyR/6NVJ5+wkdKokh5yFIlLx5nWO6SU+JBfQj1j3Cscw7HYtNkGV9+VNf8Dv
 xl4EzKUnF7/OV9oXCb2nKPHzCjyvDaLJifBj+Lj7fMpuoDOvhl/jx8p45MRewAsTnTIff/1cS2S
 ztxgU6edEmTlF9e0MhPTpBgnmKyyfZe/2PnLoj6DBAayYVM0JwplJOvxm7hf4SOg9U4wEBOWG5J
 vyWW1rNuvlubfexyNXnTcKAjEqekfDl2L1QePJ8amoTv66dfeXuTd/ITlt6dqNDQ/BcnVR3+MAo
 qyt4w8Yl/E65o0rWwlt51CUsU34ddgZwO0ZXk4K2cS5d69XSEnz5uGxQsajHhRsPSx480EErxgQ
 PC4m1BOVEABY6TXmbhA==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a1417f1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=4YpZvLgTicFLWUaLNysA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: xwrNeQ2u5iED7F-sKZotBf-MwUvsV_5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109609-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3EC485C8B1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 at 11:34, Jianping Li <jianping.li@oss.qualcomm.com> wrote:
>
>
> On 5/25/2026 4:30 PM, Dmitry Baryshkov wrote:
> > On Fri, May 22, 2026 at 02:55:29PM +0800, Jianping Li wrote:
> >> On 5/15/2026 9:36 PM, Dmitry Baryshkov wrote:
> >>> On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
> >>>> From: Ekansh Gupta<ekansh.gupta@oss.qualcomm.com>
> >>>>
> >>>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> >>>> getting removed from the list after it is unmapped from DSP. This can
> >>>> create potential race conditions if any other thread removes the entry
> >>>> from list while unmap operation is ongoing. Remove the entry before
> >>> How can it remove the entry from the list?
> >> Multiple threads sharing the same file descriptor may invoke unmap concurrently.
> > => commit message
> >
> >>>> @@ -1898,7 +1897,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
> >>>>                    return -EINVAL;
> >>>>            }
> >>>> -  return fastrpc_req_munmap_impl(fl, buf);
> >>>> +  err = fastrpc_req_munmap_impl(fl, buf);
> >>>> +  if (err) {
> >>>> +          spin_lock(&fl->lock);
> >>>> +          list_add_tail(&buf->node, &fl->mmaps);
> >>>> +          spin_unlock(&fl->lock);
> >>>> +  }
> >>> Is it expected that userspace tries to unmap it again? Or why is it
> >>> being added to the list?
> >> User process can call unmap and fastrpc library won't call the unmap again.
> > In the other email you wrote that the driver can be used by random apps.
> > So... what happens if userspace unmaps it again? What if the userspace
> > _doesn't_ unmap it (although you've just readded it back)?
>
> If the same buf is unmapped again, because it has already been added back to the list, the unmap logic will be executed again.
> If userspace no longer performs unmap, the driver will not unmap it proactively.
> The Fastrpc driver will free up this list during fastrpc user-free.

It will free the list. But what happens with the memory mapping?

>
> >
> >> Fastrpc driver will free up this list during fastrpc user-free.



-- 
With best wishes
Dmitry

