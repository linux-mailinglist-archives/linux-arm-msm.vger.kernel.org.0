Return-Path: <linux-arm-msm+bounces-95225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C/bCxBxp2kEhgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:38:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C271F86E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 00:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AA9A3061776
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 23:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCCA366561;
	Tue,  3 Mar 2026 23:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5rdZLB1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWmtCVtL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFDF30DECC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 23:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581130; cv=pass; b=uwpc7zXqfEp4clGGDz7wktmpBckH6dUNXMTGiwTgkjIH/MnK9FEyyIq1elBgrwhtqb7rJ8dr5GCNyZdROP7QElqz3vSQywQYFyfKjNToDe9iKDd6MgPJPVRz7gi6QR7ZTMRxrwRNadUqqkjJSKeshPTlb5fvBwBGGnFdcZlLhv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581130; c=relaxed/simple;
	bh=RH678Q6CNaXpWLZq76cueaiuZzfYi5zsG1lTltuIrmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oikCwdXuPpMvfJXRML3sf+N3VKNTbzPGYO09cEMnUdq918rFq1IW9SET0MlSEaubRFSNTeciOpdvrR1rQApPWch3cn88BEv/vArn9XKQeCtYI9cr454beQrSXCLGik87vfO7PHRBl8W3110fw2jXo76uKT4hzAMRB3SLF392RAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5rdZLB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWmtCVtL; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0SM23669972
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 23:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=; b=W5
	rdZLB1os+9BHgXdvpx6KEzLqpVv1IQbZ8ACWO/kQ/gYq2GERHZZiRH/kXmQRsLY+
	MgujQvEeXbQJ+OA2Uvdpi5Kix4rnprxp1rgm/315N8tlZTkcF4Eyp0mDrlyzIfqw
	qb9W1jlK7RQ8yEt5zG+Rb8LE9A5jXUqPRrwo8A5FyYGL1CMWVXaF8gCp2Mb/bupk
	O2NkZrOhzQkrC7r/VRc0Ixp3PvmEzEMXLe4Nwl2ehSpvukotivsg4qys0R/Q4rpq
	UmsSbWyeWPTrgoEBssFF4kUh3BgfCPNk/Ur8zHCabb0h0tmEqWgX8ih+VzIdbsgJ
	aL20QY1W2ii8CgqW2OpA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe3f3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 23:38:47 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679dda090fbso118361078eaf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 15:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772581127; cv=none;
        d=google.com; s=arc-20240605;
        b=Yqs+NSfcTt7Skc+oKcEkhIHiWwGQhWlPQUzqdV1qkPVFSGpMmhiR/tx3RpqdR8tNxB
         3rCoCARYMxkttAjjzIP0ORxdakTugnhJ0MzKA1359Mvt7zZdWllf894zqumDnnnY92CH
         xILrcV1kNfsr3rk0GKKpS44nzC2tT00fzsmbkmm0JY7KCJ8sH9yuwJhxytjx+Q1Cz33Y
         BUXQi+8jSyiyfPBMQh2fV4mjSor39D8pw559CLtQ0GKCWYmZ897dLakltUdl0DUomU15
         fpzvFmLGY24q/GmUeMivXvfOKWe20U6FbGZMyt9gYtoLHHr9Py7xdWEqn87mot5I27zL
         oOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=;
        fh=x80MDqUTCkYDXknSp683DAzNZDkKN/DhKdhJjuGsgwk=;
        b=gMAfFEPFoau+JGJs8XLvJZ6bnylTVJ/ZJp3ZgcQJT/0jwvvp62ZpZHsKvnkjA0CAjK
         W4IRaltWVBtsgH6oHLItsYClqO9EHEZcz+ROaDXW+L2bEwXrS8x+x1CCJ94rq6h3QVMH
         +T3J0tlDQ2ehxghjWqBAxC4jiFFZap+hPexaorNV6GydP0zq7xoEr0cRKevt068rs8T4
         Nl9yQOZes6VdwdutgP6x72PzonS9wXaEukCVXZWHw5WTQrpZQbDg7sN47ZU+kWmHrns/
         PGh5mpZlZG7WY24FmbjZK+p6sq5a/kkCxBSCchW796kIPucbgXt5wjV5f+m84iwEhY8h
         FWkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772581127; x=1773185927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=;
        b=QWmtCVtLSMwE58ZRWgkHWgunuPjguo6mm9H5iTr1Fb/riGOJx5Mob8KL0Ft9obgeG7
         2MuNX86Ife+fk/K1vjENeiUd1t8SnwTxgflz9SnmctNorzoi0adNcLdXIMX4h8DP2RmA
         4NYYBAniyl9WPF9AnYiusTMBcq/H3sxb0ag+2PKCuq35IlZAWC0/i9HHv6hWiAS6fcUU
         LVfO1i4KVU/07D+d8+Iwhqb0XBQRlRWIK+nPDAUlRDWU9jBmGvmJO3luKtwRXBBoir/F
         Skjzz53Kdi7hR1nGCz5vH/2q6kl/QLF7oKfj92Mv/BT/+I0PjpGs70MdZdl1VWB38Ici
         HBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772581127; x=1773185927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=;
        b=rlJuh3aeQ1xY1queSmA2Y+NjflxK+c2MekPLHY4MkhgQ6whRIRpLVwWVlP0XwhmEBQ
         iosy+5usWkVjLDC9w3zcJaMjYU1QrJVUYNQbeXC88+zCCkYLuyQOsAoivgi/+aShy1sm
         zV+eT0F5NpVWZrVfLNIlfB2OI9CXdKnMPMf+HVHigeofxbkIo1/qyflLGmjF+jBWRmFr
         RFTbbodemLcgvorg1h3YHdHZk7SJDZ4mvjoLN2H00WhQhqLkyY6FO2gVG1LKTYwTdy5m
         4JZ/zoeTTYZGvKEemR41NDXgetnWF0964HDyr/FTVDIgM0jsGwTel6kTw3JIsWyYSu1J
         6JRw==
X-Forwarded-Encrypted: i=1; AJvYcCWVCQjO2M+DhP2+LwC4AOMyy3Vo3oMncvM7dGkcOmi/jsyMJRuBRO/mJUv3ZEzEj57KHr5CcTsczsst6Mbl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3yAXGPFy+bRZR244x1equhm98s3VsXVGOkRxe5so78onxGm37
	Q7fyYcclzK+vMJ0vTc2/Yi/rjJfSae+WG6N5GpjlPWx4JoP2eEfQ18Nx8MpnUwdQqf5UdEoPLE1
	8/sCotmFgtGCNZzY1qB8KDvYk/e6kiStxjJdRQ82l4PAc0bhnps1mZBzy1gWVKdv9f8fvwna/bm
	2EZ/AzNZc8fRz61uyzG0mpWLDT61JlZI9D/RLl69CkGN1OUw//6io=
X-Gm-Gg: ATEYQzy0lKpY9J1OFZL95rkvNhesavHsTHJnwiyXjCyPADKRfjYy0x+lTt4Gut5IcSo
	I8hud+6AF+Aa98dyGT3XLvXjOr7dL1dPBcE6vssIu6v0C/4MLlIcshBaxHMSnLAKJLqo1F1vYcB
	CjSL1GBQCqt+WlRxwroP6ls93BPR4hjataAGEs3UAURfzHeEDoppc4R+MWNTLZR5ZkBZqD0p1x6
	rQ/l1BLlW2V3igPuPf+5S0dsR38EFdbI7v8dA==
X-Received: by 2002:a05:6820:480a:b0:679:e85c:10d0 with SMTP id 006d021491bc7-67b1775532dmr136162eaf.49.1772581126723;
        Tue, 03 Mar 2026 15:38:46 -0800 (PST)
X-Received: by 2002:a05:6820:480a:b0:679:e85c:10d0 with SMTP id
 006d021491bc7-67b1775532dmr136141eaf.49.1772581126306; Tue, 03 Mar 2026
 15:38:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
 <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com> <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
In-Reply-To: <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:38:35 -0800
X-Gm-Features: AaiRm51_hWr4aVxd4N5ut8lsjNQFrYU8njlJN0yxFr2wb8YZM9tMut-iMO_Jk-4
Message-ID: <CACSVV029s0xBDgUXp+g+JjKJQu-jv5n_nSCQHyXdtfDgyjzVFA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 8GKUrKvl_OK-VwgiIdT24J_6_AzC65K1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NCBTYWx0ZWRfX2T4AsOmcuoOy
 /ry7aP5g1gC7ajQkMC1/6w0LPvaI8tJNg2lW0xpUIXVA2mDonVNlRT4M6c2Ntqur4enLZfIo0Mq
 R+4uAn7beizAIgFn9kEZ7tvL2RSX3LXP+2TS+8CLiv2WZu7Ikm0U7ApA5Xgt5EPTW4VYd9hJMrK
 yZyuKMGGeWgud84czFCF5wPTrDahHv6E7eLcadJORvXIETIc54liFhmkZuMU6UTrofClFIZDyUB
 uTbFURQWFnp/TI8A6OMpsVV6Ip3aSUiutTI0/jdBblaPoESsdD+jtiGxxhDuRXy0iyeif5pLAIV
 mQXyeInTMf+Z8IEf/mrhR3zPlYbxgJpKYzABnfHDWthPgFcL6Y/0d7CiS70ymJlwK7/voT26uQe
 6GQO/eFTVxNZdDALAay391jRJBR375c1WCtBHEaIANNhN2/9dLJfrqLM5gEAJU3T2hAdTUfZqs5
 lpfBqfGrNygYX3SVvGQ==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a77107 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gJtko_qlBpcEJjb-Y0AA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: 8GKUrKvl_OK-VwgiIdT24J_6_AzC65K1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030194
X-Rspamd-Queue-Id: 88C271F86E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95225-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 2:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Mar 03, 2026 at 10:35:46AM -0800, Rob Clark wrote:
> > On Sun, Feb 22, 2026 at 12:32=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > > > On targets with multiple display subsystems, such as SA8775P, the G=
PU
> > > > binds to the first display subsystem that probes. This implicit bin=
ding
> > > > prevents subsequent display subsystems from probing successfully,
> > > > breaking multi-display support.
> > > >
> > > > Enable separate_gpu_kms by default to decouple GPU and display subs=
ystem
> > > > probing. This allows each display subsystem to initialize independe=
ntly,
> > > > ensuring that all display subsystems are probed.
> > > >
> > > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > > ---
> > > > Depends on:
> > > >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-=
1-9c2dbb2638b4@oss.qualcomm.com/
> > > >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma=
@qti.qualcomm.com/
> > >
> > > What exactly depends on this patchset?
> > >
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/ms=
m_drv.c
> > > > index ed2a61c66ac9..65119fb3dfa2 100644
> > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > @@ -54,7 +54,7 @@ static bool modeset =3D true;
> > > >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don (d=
efault), 0=3Ddisable)");
> > > >  module_param(modeset, bool, 0600);
> > > >
> > > > -static bool separate_gpu_kms;
> > > > +static bool separate_gpu_kms =3D true;
> > > >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for th=
e GPU (0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DR=
M devices)");
> > > >  module_param(separate_gpu_kms, bool, 0400);
> > >
> > > The patch LGTM, but I'd prefer to get confirmation from Rob.
> >
> > I prefer to be a bit more paranoid.. perhaps switch this to a tri-state=
:
> >
> >  -1: separate drm devices if there is more than one dpu or gpu,
> >      otherwise, single combined drm device [default]
> >   0: single drm device (matching up pairs of dpu and gpu if needed)
> >   1: separate drm devices
> >
> > This way we aren't changing (or breaking) things for existing users.
>
> I'd rather break things and hear about them being broken.

You are assuming you'd hear about the non-obvious breakages
immediately..  I don't think that is a good assumption.

To be clear, I'll NAK any change to the default for "normal" hw
configurations.  If you want to change the modparam to tri-state so
that "weird" hw configurations get split devices, I guess I'd be ok
with that.  At least it limits the potential fallout.

BR,
-R

> >
> > BR,
> > -R
> >
> > > BTW: have you tested it with X11? Are you still getting accelerated G=
PU?
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

