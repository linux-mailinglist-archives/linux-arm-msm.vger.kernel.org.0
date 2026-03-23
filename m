Return-Path: <linux-arm-msm+bounces-99174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MueIXYOwWngQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:57:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF32EF7EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71D03302C76D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7213876C7;
	Mon, 23 Mar 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6KdeWwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ShFecYVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C0E3876AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259761; cv=pass; b=RQdjCpkZAbK7pInzwycKLbZTZiFTTp6i+SbOSVdA8npXXTSr7SgOuTt9cfXUBmiBk8Bo3Fut+nPvgk6uUOUrTDAXMvNaGM6FPgGSzzbGuP8WQuCApHSmV4IBnycBVRtLX5vOFZvoZcZnMj84tybNn6L1Jn16LBMQFNpAm6OKmjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259761; c=relaxed/simple;
	bh=vuyi6u3g1TVBvE5CfpESILBnT4CqfKc/8nok29acUuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6XlJf7/EFYiksQ9P4V2lw/Sq3ACXv/v2CEqsgrA4JOh4pgPa0d2OdX7/49zADxhctcLUXwkbxMdbyU/rM27MeS/FcPUhOrmsZIF5HHflQM8d1NNbf9AHd6DI7IqJZXflJUg12fo6k1fjm1+GE5gwbB279FOpOvXmXbnOYrjkY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6KdeWwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ShFecYVq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7JkpQ2048872
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/5OrkfASGC1sQzL8d0fgcgIgmmLAPuzkyduEqTwi+I=; b=K6KdeWwHVvNkv3XN
	bMoUUuP2iuvzZPJ04KaK5BBZxNhW5wTTx7Z8fpbe+qGGW4LC+Wr2XUCdv1NveU/Q
	CNcms+Z98MUCo0UJJxrvS8ygoW+5ubkn0YYM8HiuLwhHtB60uPYN4zaH6x+2Nn2c
	0rKveWpi5aA5G/+bCuE0Eni57gVw7vQYn8Ec5srgvRJQ0iriilTYd86n0uuv6sU0
	T6twddcZ1xYydgJ/2NVryM3hOJ7lVXCNIg7hoNPgpBKLbmdtOKpHuaQnAOi5pKC8
	k2fiseWjgcmtev6+287hKSaOL5mmNf7tnCzX1gH89IT980/M6rxy78VyAL6BlBhH
	i/zdXg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kducsh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:55:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c519dbafeso376208086d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774259758; cv=none;
        d=google.com; s=arc-20240605;
        b=MhtzOPYZcmX5gf1uENsx6w4HQrdn9B6IGjoyt/9WX+POHcLkJQe4Im7lgWCFJmLBEK
         dLkc25o6Bf2Fz6NGomXV8RRYq+0gtVyyyvN0FjwBlabFSLNcC6M6a3AoKFVdyV89NB95
         fQemE2rcAZXZqypupPzwAxvSIQvhVjRUnRkt7H6eTbFkklh72D6w7nhbR5qGJkAOJgnA
         h4s25eiGR+vS3Rrzbt0wgowDn34iUnNjITBQijIhB4gof3elUEgR6qsrj92RYhe6s3B3
         UEb1rZHv5Ugx77H37/2nkpJg1unfYdf0OF2RNqxyIBFquIMgraMIC4PS/mNNAywq/pnR
         vSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U/5OrkfASGC1sQzL8d0fgcgIgmmLAPuzkyduEqTwi+I=;
        fh=QxqFrx9fJHR0+L5HJUfZpFVwYK6cidADlE8/0LQ+R8w=;
        b=DnuQEgj/y5C4iFi15+TxDScCmF0RVYL29jEcJmzQSlmdOB9ylZga9tLmJmeCIoyLoZ
         XC5LGkcBmrqM4dNgLbpWe/HkRCI8Jp9Hugl5thSmS/4296nI7hJ7fuob3yCmUBzIG0t5
         UfQKcwOw/oeHetNvFYrS2zRORvTxSho7i47j42gkA4hYq7mjtUm64GgkaScSoAwxyIPF
         NMUEKuXPzQv/tRPKmnUhbWoIgex/xJ6hpDrk5kPe3mWOU3fnGptE5mOLAnnozkH8tkMc
         4hBs2fYo5tdV0DT0TG4F5GMh6qC5ATeBIsc02ZNJKR74q2MDyv7v2tWUBFojBXDoyYZr
         AAGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259758; x=1774864558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/5OrkfASGC1sQzL8d0fgcgIgmmLAPuzkyduEqTwi+I=;
        b=ShFecYVqOQJXtIoiR7MD3VXmEN6+yEqPhAXcEM2BhQPs8aMGd0JZ9UNfUhKXJBIVkw
         OQuS5B7FxtIhSraVF1IBgCXLpWwjfNdPN8Wz4dZwFuo08Ss/OKQi7ZSKHf2sOsA/RWeG
         LAd+JHBdo/VHD2BtMywFyb746pnuyarNclnyk15QVgv5PivrQ/29kHRorWtTbgJcX/Fp
         CqF6KOGxZ6ZNIa/wjTk/LgAdKNHNo3w0cBaFswAZcB9B05cf4bWMhs7fhtrSM4Pva/dC
         QPehUYRyyycFuWW2G9XuE/k6VHKVaWMsXptCgtq843cMFUuzbsnXInUWU4OR4Qv8jNFU
         ju7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259758; x=1774864558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/5OrkfASGC1sQzL8d0fgcgIgmmLAPuzkyduEqTwi+I=;
        b=pEc7XiBbU5sWUSkTNFNsJTK7hO296chZIWBRX2fHHeRFGYmUf8HNbWNDmkO9kmF5+V
         ojsyaZGIbGB68M8pIsoUnqluLMYy9/BNbEQYlTykf2yYSnDt7dp4flAIhh203eyC/la5
         cwOxaAWr/lgrw56TsmoXOEF2WJocn4xbSNUCIBgUHVQDRJX9HS9jjNdaqH6kKyjbG+RY
         yJF+TM27SZng7Qe2phlxMIqa8l6ijBD3mqZQ6/g5anbjgJaT8ZsDxY+/J5LtuTXtsaOr
         cJOwc+D7KxHu4hX1YMJS2UQx0UvOfYOWoHaHwWu84BlkZiQDd0j7wDpUKhdeU4HdoyJk
         FhCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz3i2h5R81cboSzqleE/gjv1NfS+8d1tSO05/iwG3pCAUmqCYibOgWe6lEaWaXtUujjuznq2e4LuYgkgeX@vger.kernel.org
X-Gm-Message-State: AOJu0YwLusJU6ccvb6CyZ8tt6rzwAWDYeno8gfruSs6M4lbQDpz+kAuV
	LgJYDMP3tF08nSlE1QHNSUl7rvrno5baMLFMDOFg4Zx9IAAvfQi1HSSQkbjJPiTb7nJta52lz/C
	x5qMj4foqWkrtorPXZJlDNiEHNg8G1vqOp8NJ6DN2wYlZWQtot3iFSPB+PeHrnPKAuQCOhRewHb
	H7btKoNd3zHbH2buT4F15fiPhyuyXNvBxosrqEEBsumKQ=
X-Gm-Gg: ATEYQzx/hb6+4SeccA0lxtTpw6igSyAXK63rC7oYJj6y59Cb+cWB/8TP+qC2XCJ0Y9b
	ZqVRAu9fzqbh6eZfCHe3rljWswCTOEaMkO1aX81CzNTw6Xyx3U7BQSZMTIcSrfJv1wOQepcIos7
	2dktVDsQGZjCevEkdblmJp/rRjJbBW12v1Z+1l2Gpfcavw+I3beJo1LHVDLrebAaijVmGfnlnnr
	DpFKQkZ3+dSls+/arEXGKsknp8Q4NzC5GQKEY0=
X-Received: by 2002:ad4:5c66:0:b0:899:be2b:68fe with SMTP id 6a1803df08f44-89c85a377d0mr185802146d6.33.1774259757925;
        Mon, 23 Mar 2026 02:55:57 -0700 (PDT)
X-Received: by 2002:ad4:5c66:0:b0:899:be2b:68fe with SMTP id
 6a1803df08f44-89c85a377d0mr185801866d6.33.1774259757437; Mon, 23 Mar 2026
 02:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
 <CAFEp6-2XrMkKzA4KAEkYF0v7XzVefFpUEG98VYa7wNuanbZ-Xw@mail.gmail.com> <02ecbd98-01dc-4e56-901b-41783c55d095@oss.qualcomm.com>
In-Reply-To: <02ecbd98-01dc-4e56-901b-41783c55d095@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:55:45 +0100
X-Gm-Features: AaiRm53UrST5G3xte4ZUKcxDWQNHeLye6lZxnOeuRdchWKx4Vidin0Uq67nDsR8
Message-ID: <CAFEp6-39tUEBqX_FWLdohE2jenoj1ot18Gnhi4Aop9hukGoGQw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: vfe: fix PIX subdev naming on VFE lite
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX34Ip3FJQeUf/
 IO9v/MSXj4OVxxFM5JpscPxU4scuiPE6trC2oVOVUyAdZt+KhSVwR16GnbteYZnbmj1oS/4vQPM
 j05ZXOneozwNUOgMIlGVSLNembuc2hj0n3A3jAvuzpV/AnuRan/A7aqhiQxoXXmaAOOr6Tm2w3W
 bVhKWLHFEQwx+/3v2c9xu3TwJqd2bfuZDs37P5nAYUF4o+c5z2PBxoVqncGZajiLYqLZWeq6kck
 TZSW40dND5ogM1F/RVZ91lDBsGmNPWjJo8jXt8+aH9SmZ+816VVjxZGs1cP3FNB8R+yWjmpGWLk
 we9RluPaWgeDT104sWPyLPK875fUTNb02+5DHimbvhKGxTAyDsWAhj9HTFuoVEu9cXIOTJXZpuC
 rC4q+ZL7q9sGOOvdLP6u3L+Y3UMHZbH3a0uHrRWQtdtdrWLAuL1+SJNgwrgNZtMOu2hRkiBxhTO
 dQzcj2D/54sRlTzt2Iw==
X-Proofpoint-ORIG-GUID: hZrf9ELz7qWl-bBSQxWQkHloHfioGZIi
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c10e2e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=ZFdpS9VYcODuzQBujkIA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: hZrf9ELz7qWl-bBSQxWQkHloHfioGZIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99174-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 20EF32EF7EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 3:13=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
>
>
> On 3/19/2026 10:44 PM, Loic Poulain wrote:
> > On Thu, Mar 19, 2026 at 10:11=E2=80=AFAM Wenmeng Liu
> > <wenmeng.liu@oss.qualcomm.com> wrote:
> >>
> >> VFE lite hardware does not provide a functional PIX path, but after
> >> the per sub-device type resource changes the PIX subdev name is still
> >> assigned unconditionally.
> >>
> >> Only assign the PIX subdev name on non-lite VFE variants to avoid
> >> exposing a misleading device name.
> >>
> >> Fixes: ae44829a4a97 ("media: qcom: camss: Add per sub-device type reso=
urces")
> >> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> >> ---
> >>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/m=
edia/platform/qcom/camss/camss-vfe.c
> >> index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..2ee4f9ae0ab50e22f91673=
6f1d1664767bdb6a36 100644
> >> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> >> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> >> @@ -2053,7 +2053,7 @@ int msm_vfe_register_entities(struct vfe_device =
*vfe,
> >>                  v4l2_subdev_init(sd, &vfe_v4l2_ops);
> >>                  sd->internal_ops =3D &vfe_v4l2_internal_ops;
> >>                  sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> >> -               if (i =3D=3D VFE_LINE_PIX)
> >> +               if (i =3D=3D VFE_LINE_PIX && vfe->res->is_lite =3D=3D =
false)
> >>                          snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%=
d_%s",
> >>                                   MSM_VFE_NAME, vfe->id, "pix");
> >
> > So the PIX path will be called RDI? Doesn=E2=80=99t that seem misleadin=
g as well?
> when i =3D=3D VFE_LINE_PIX and vfe->res->is_lite =3D=3D false then vfe na=
me is
> pix, not rdi.

I mean when is_lite=3D=3Dtrue, we're going to name the PIX(lite) path RDI,
whereas it's not a raw dump interface, I guess pix-lite includes minimal
processing engine.

Regards,
Loic

