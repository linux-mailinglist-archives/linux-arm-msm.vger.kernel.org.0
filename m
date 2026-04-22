Return-Path: <linux-arm-msm+bounces-104160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNK4DNwF6WkGTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 19:31:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB244949D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 19:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21B833032DC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C3D38B135;
	Wed, 22 Apr 2026 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1h4iMsP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEzRhg5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47452383C86
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879012; cv=pass; b=i+gw7/1yRXvKOid9rS6/CMgukW8XV4CNXNc3iJccd2MogoWUr8994P0udXy/Teajbdjh5dsfB6G+2S/UZcP3PTPYmvK2lHgxkY4IhxpMPPJy61+RDkC5Q2CRVazCQD4PAcAIjLnhhP8arDBCXlSxJg9V6NVGdGzh30Mciet/ZqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879012; c=relaxed/simple;
	bh=o+rhAip9oNP1x3wW6R0UJRqzvmXDibZ1KLwtlgtklvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDpjDvOVdjX/GzL4XC8pvH4rBE8q40x8kAUxpIKun3vH7Eke+4XT2xhzObv2z5fRvZ0hf9QkxEwBmyz//V9WeBNajAJwx5CiLiz07YgfVZ4AKw9JaN5jn6bvsqj6V6XLattSQGmgotx7HyzcgVn4BASnmxYoo7zVzIjzUTWzfIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1h4iMsP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEzRhg5S; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFfOBr2956213
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 17:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=x+kv21v1RlyCw+hD9VXFd9bZ7kOUY5AThNH33zvfHGY=; b=V1
	h4iMsPgq4ohwYar4O+VpywY2FI7J5ZECADkWOVMLPopYZvebSw1IHfw0t3iWFuYY
	isDy5835TfahR5GnFTT6gr6khGBoDe2zNZ+lPunsbTLNvF0/t6FsRQDOOcsy/4D/
	6exM2InrWIiAZ2JdbU5PgaQqwKen0a7Ll+TnTgXcADs1tIvbp5YR7T5Z60rabcfi
	p4j7CK005eklkj9MvCaBfDrJZOq1onJd5b/Sk4z8PQN2dnSRxxMb1EjLO1tvIWIX
	Oc11cbGAxEXLgeLuh4XTdJbnOnohIPLmaGSmtIIjTSyMVVK3oEHZ3/Tp3rfl4vKz
	hqcoGifjKmWPpCyR5+ww==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q0daw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 17:30:10 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-415583a6862so9755079fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776879009; cv=none;
        d=google.com; s=arc-20240605;
        b=Wtr2VCx+pdafhkOaMQlO1Yw4W6NcY45JWf3iVdn4j7Dk8gAx4DaS689N10tT6OOOBm
         qoh79xWtd3/5qcBC6cpd7kIwXbkmyYdotrKpZNMkpIR55MTpa+0P19Kz/MhuX6TxKbsi
         mV5cnoEQ0kT9twEg+16h1nuUtj5+5PUEK/NqIO1Va67uspSrYC+ghJ6CZkrN/vwxAclq
         xD1c7XvCQamvKv7FuNYCYNOqqe8vyT/xYAoYKNSX1ZQshK3JJEY7prHoBwb1dg4+UTbD
         XUC9pn79VY8jrr8gXWREo05YGAtmzrjKPo1pakLQPDe8ZBlgdn41TV1QyH6jb3rWSvmx
         u2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=x+kv21v1RlyCw+hD9VXFd9bZ7kOUY5AThNH33zvfHGY=;
        fh=KUQU6a7gEJaBKemrC2CsODeJwUhSbcUZa0ST2sF20to=;
        b=LhA6D7DqAwZK/y9Kmdn+sREek0o55qEx73csYQmkrPxZs9yBX6OIiFvspVJaCJlX61
         jkBh823iYiWPzXzmtF0jGfqVzmb9uHsxdPxjEjG9Y0ywnsPA77uCrUeFkHivLTjeODOz
         Quxlmup3/2OCOZmVnRwdBbPPGZKLDdreRXx1BI1y+VVQfBX/jmTnYQj7A599dX5XzV6c
         1zcyQP8TMzdwCaIjBCXFxW+3/BNbsOyeplm4IQH5GoDy8PMJl6zC0tHA2xZ6MmC9VXTx
         yb0Ul3BX/2wrM7/QKiyxRCErW+7bM+/YRyqX/uGWr11SOgNCsooHL0lpjEDgQ3JKx5SX
         +5kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776879009; x=1777483809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x+kv21v1RlyCw+hD9VXFd9bZ7kOUY5AThNH33zvfHGY=;
        b=OEzRhg5SOYSpjcU70/DrMFp143KeoSCjWr6hFqXwshuDFCZOUOMe3sIjUuniZCq4UB
         efI5AST76w+cd81ziXAvizctOLoZ0C8hJAgHUx+URnQCTaCraOV9Tqa04f1AlQ2xGIIK
         +X6KxXIPAyJTBFvOVP/GoSZFihnYstZPmlHAzUayDycfN+nRfwd5WWP6PkXMMaOq5XF5
         2tbG74RMb9pKgUKBawiRgb1Z+AoY09Z68FvaTG0s9Tr11a92VVvll2gDuM7oA7PW6jYA
         cKMOc3RQln0VgR9t636pABe8IuXxBJqKA9ovktRw6SCOA2NEl8jrN9cdCj27C7eAlDrJ
         jYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879009; x=1777483809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+kv21v1RlyCw+hD9VXFd9bZ7kOUY5AThNH33zvfHGY=;
        b=OmSmDmt0nSLShScM7Um8LSdgdDLjzaWiiASTGuDV5VX7u7cC0eFjkofKwViXkrEC2o
         VgGS/X8UgqV9mnMlwg4DaR1XkcYldLblRmdXg/Ie1OA5DKdELNFJvPOLArdC5Dfcs3nW
         ixFCps3FlAtMENNewvsXvn6woxb6GGxIgz2Ogp+p/whkFiKNRN8LQUtaKSvk9P2ka028
         c2r9n0pM8+BVZTQ56XwbicjR0ZuoIApBmdzX0Eql8q5rjtIYrkha4pbyReKxCYP5V0Qe
         fXpXWeeDEs01tm37di4x6NVyFFo5qsvyKPh7AqmmXKYQ6teUFxHAM9B22GmGfsEj2AtB
         IdbA==
X-Forwarded-Encrypted: i=1; AFNElJ8jLmbh4lis+k6X/zdi1oKgqzx22+A2PlbtL1f7S6q2Pvc593OB8PSD84Y+CAp3qVImhcGjwc57ffEHF9fi@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSTRhU57xKWePuFei3kKSxD/C0KqxqkwbRF4+6HDuez8MCVce
	xGKRL48LcNqBmw342cl69f/HrMZ+Bn+rOpvX+FPh7eR2XS+hnSkJREDWxKD7lL/DDlAGZOsmzDW
	s5rZBKM/jL5RcWfKNz4ZkmZFrdy8/WMsuVR5qqUw6FAJ5x4JDpj4wZgmWjl+yTMDPKFSl2WrAOc
	uohKFYzWq+x0k7NpoybJJ6yh9+CE6E9JT+/OlRNjzqD/Q=
X-Gm-Gg: AeBDietEaUaUrrSPwF6hr7pDyfz+1onRz1qU/Sk5QuX0A0ZBKAQuRfv3Ql/7ksemTMc
	A3IJjo9nxsBUbgFqaUl3USX8v5P/j+1upKmymQLdHpN3tCtg9V8X5KvU4Npyve8t2/lYtL31bRl
	IfBUcHaSW+0ZR1xHiyjtVlhp3kErH7xkKQR3u9+gqQuGC4sjxVYEyHP/5pNUfeeO6uTgm8K17Cr
	omrInbZEUfB6cJ8sIfvEM/deIfUf6Ldjkzyki/Wyq9LRoH0
X-Received: by 2002:a05:6870:89a8:b0:42e:9bd8:479f with SMTP id 586e51a60fabf-42e9bd89791mr4009256fac.3.1776879009413;
        Wed, 22 Apr 2026 10:30:09 -0700 (PDT)
X-Received: by 2002:a05:6870:89a8:b0:42e:9bd8:479f with SMTP id
 586e51a60fabf-42e9bd89791mr4009236fac.3.1776879009015; Wed, 22 Apr 2026
 10:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com> <b4hkax45ohmz3dk4b2wgfmq73px7er66wqxixquxhwd64ngboa@zu4frfofekef>
In-Reply-To: <b4hkax45ohmz3dk4b2wgfmq73px7er66wqxixquxhwd64ngboa@zu4frfofekef>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 10:29:57 -0700
X-Gm-Features: AQROBzBaTNAnhQpwHwM1yr1F-gZQj6ZcnfACIOuyGg5pITZEduYhvobo34Eh-AQ
Message-ID: <CACSVV02a0tt83+G6svZ_foEuoZ=aag75z7D8TveQnLO74pTMww@mail.gmail.com>
Subject: Re: [PATCH 00/13] drm/msm: Add PERFCNTR_CONFIG ioctl
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bill Wendling <morbo@google.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e905a2 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=M9zKgLJNyvpdfU1V1vkA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 5nl9n9oyldnullJAOO-hRuJ-3cYUPMKJ
X-Proofpoint-ORIG-GUID: 5nl9n9oyldnullJAOO-hRuJ-3cYUPMKJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE2OCBTYWx0ZWRfXyQNAFJdwb/S4
 HbiYiT1xduSTNMXkHRuzYVEE/tOM4tJTpAzmnn31JXjCB+s5XfCbUof22B22yOdRQOLUVjxw9qQ
 Zdoc3uXgMto1Z1otTlrUBnM5+TDd0OBIYZUSIpJOo1FpqSBxAtgYMfOxdlkGVrniSj9dJ6/sr6Z
 W+28mGqJ7C51TqW14Y2LGoNByP8YiZGuvHJHQy1W9vQcBF3am8+2WzzpLQIbeEfg83IZhO2NjQQ
 q9p8KMcBShmQw+q4lvMJuRXJno/BVNGkWFbkA2LOkRttN04Vxep5xVGNZ01ybUfeAoMMJLs6UAS
 cM9St9w7cSd/dsxFQb24S/DEFdTyK+VhNB/kg7OknikBb0svnXShZLdAsjcUO3+skz5dAkamsVr
 IppsHJ2EuDlnJpmHccL9v4LEkrzNbq/uFOEaDwfcRGDXWm6XuEuoGH69HZKsQlae1O0zz6V+8CM
 +9ladM1jaNPIXqnHV3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220168
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104160-lists,linux-arm-msm=lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,linux.dev,google.com,gmail.com,kernel.org,lists.linux.dev,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,qualcomm.com:dkim,qualcomm.com:email,gen_header.py:url,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 94CB244949D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 6:54=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Apr 20, 2026 at 03:25:22PM -0700, Rob Clark wrote:
> > Add a new PERFCNTR_CONFIG ioctl, serving two functions:
> >
> > 1. Global counter collection (restricted to perfmon_capable()) using th=
e
> >    MSM_PERFCNTR_STREAM flag.  Global counter sampling is, global, acros=
s
> >    contexts.  Only a single global counter stream is allowed at a time.
> > 2. Reserve counters for local counter collection.  Local counter
> >    collection is local to a cmdstream (GEM_SUBMIT), and as such is
> >    allowed in all processes without additional privileges.
> >
> > The kernel enforces that counters assigned for global counter collectio=
n
> > do not conflict with counters reserved for local counter collection, an=
d
> > visa versa.  Since local counter collection is scoped to a single cmd-
> > stream, multiple UMD processes can overlap in their reserved counters.
> > But cannot conflict with global counter usage.
> >
> > In the case of local counter collection, the UMD is still responsible
> > for programming the corresponding SELect registers, and sampling the
> > counter values, from it's cmdstream.  But by performing the reservation
> > step, the UMD protects itself from the kernel trying to use the same
> > SEL/counter regs for global counter collection.
> >
> > For global counter collection, the kernel programs SEL regs, and sets u=
p
> > a timer for counter sampling.  Userspace reads out the sampled values
> > from the returned perfcntr stream fd.  Releasing the global perfcntr
> > stream is simply a matter of close()ing the fd.
> >
> > Since the counter sampling is done in the kernel, this prepares us for
> > not having to disable IFPC while global counter sampling is active.  Bu=
t
> > wiring this up will come in a later patch.
> >
> > The mesa side of this is at:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522
> >
> > Rob Clark (13):
> >   drm/msm: Remove obsolete perf infrastructure
> >   drm/msm/adreno: Sync registers from mesa
> >   drm/msm/registers: Sync gen_header.py from mesa
> >   drm/msm/registers: Add perfcntr json
> >   drm/msm: Allow CAP_PERFMON for setting SYSPROF
> >   drm/msm: Add a6xx+ perfcntr tables
> >   drm/msm: Add sysprof accessors
> >   drm/msm/a6xx: Add yield & flush helper
> >   drm/msm: Add per-context perfcntr state
> >   drm/msm: Add basic perfcntr infrastructure
> >   drm/msm/a6xx+: Add support to configure perfcntrs
> >   drm/msm/a8xx: Add perfcntr flush sequence
> >   drm/msm: Add PERFCNTR_CONFIG ioctl
> >
> The series doesn't apply to linux-next. Please switch to b4 and use b4
> --edit-deps to specify dependencies.

fwiw 20260411150312.257937-1-robin.clark@oss.qualcomm.com is the thing
missing from linux-next

BR,
-R

