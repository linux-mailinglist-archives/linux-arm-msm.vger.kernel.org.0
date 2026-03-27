Return-Path: <linux-arm-msm+bounces-100365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJyPDzqsxmk4NQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:11:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F54B347326
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72F5B304C7A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB003446AB;
	Fri, 27 Mar 2026 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rq+LjPrq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFNRDG4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31F31717C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627715; cv=pass; b=Ahx7E+uO5ptVB/34BXNYa4quEc49jSFXKckQC70693rA0bALPKriSZ6RUpbRw9W7ghmM6jKm69C08ahzhqAGdC/RKIrQGa6717AGavXKHRUWCViPbGyIBEDD4rcOBcbdAZgOjmSFf18qtOpu0+9USuD5zJ3/e3zX7yYPtl81maw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627715; c=relaxed/simple;
	bh=sxeMJe90kDRIwQvnZOI7dcMtIkUbbCooQgTLJXpQXBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AodeThX703SDKz2GB1Yx2Bagpjo4dNf1KwkBS/tqScpXiFp9A8IGemUp/snJ0pOs0uHyFM5czhDtTy91/aMA2Wm+wctKPQteuGxupqIFKeNcYkrxYZ9I/LHQxQq/v8zBOcBLbkgWN0cUiqL55eTuyR+Ud0KsiOQtVeJGVFMqjz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rq+LjPrq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFNRDG4S; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhPis3701354
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=jT6N8avUUDlCXZ0/BPJN6GuGWXRGuNZJ0M5UO1nZZNo=; b=Rq
	+LjPrqgrf2iv2qyk5u9Rg0GPW21jIRAtDTHsAjMQ9aRgviBgE5av0EKpjAhozx67
	gT7kF2OJFc20rPSvhDIKDofwMOSBZg9Oi20jKoE2lFiyQPbV50SW1Vm0NFR1vJ6H
	JbzXpufKPwEP0HQq/ZbDFt6By9ZMasDlweoRs02GYRIf/acu3byyP3OI587MMFo9
	7GngHTtmEWeJsoftmAjEDfYTeJJ0xMyCu6GY1G87w4Z1i+1EzzGGkSIGgnRTzlia
	bdWGWF1oOsK3L/89RcrY9bgiZ8lOYqTyzMipsIqsAp5y0YlzkHQl2vilj4ncX94c
	cDZXMlR5KVD8JMfsDALA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx2kfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:08:31 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d9d3230cf8so5375232a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774627711; cv=none;
        d=google.com; s=arc-20240605;
        b=lAMQB7mDyczrB7djshXvkeqZE7i6PCISziOihXeQriS9e6KWfi2poG38DuT307moBK
         v+ybIWoNChYW9ujXgZs/Gu2+Z1NPLP5zI+BWH540SDbpeD8vo9O/V0z+wqKaEeOvHLrR
         jkmhVLxB/ST+jSknpPTYFBQmEkcr3Akndp6SlNfMa11nEriGdc6RvQrqcZzRsS5yj9pG
         lsIhXRxtomI+fYCdTlvzoN4ryGtPBNfeOgKY8aMMRm2si/3rzWQ/ECW4h35ZxQyrp7Uc
         izj1+eXcpjf2AeapPuREZYxZTCXRijM7c3KDATxNrHKnrXjDUvck2DSkjuK6Se/7Bn63
         SZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=jT6N8avUUDlCXZ0/BPJN6GuGWXRGuNZJ0M5UO1nZZNo=;
        fh=rpJjniOnSFVUut+MN3EsK2EgIO2/XnZa8j4AC7GbZj8=;
        b=PRf2pHnin/BOC9V3xD9BS1YslVo8qInk1oaIUqz1PkQ6bmYCcY1ANa4v1SlLXub3GI
         RZJYp0yuGB21i7vIcPg6/upEuyClRMMhXEp8Osm9g72wwBCzTYqg2xhIAuZV1dktGBJg
         /4eFQXu64JMnGZ0SEjQJLxPFLoAEug1ka8lZ3vUslfR3Fmakt1W+cXt1c942RBMWvCh6
         QUVzzpqphI08rEID4kGBirLhexCovTW3WLWkveB7eZVtWxxFVjh9bzfxKlxuU53gU88z
         XYA/JIFcAFycA9RwUycWlXLMefD01ib2SPB7JAx/y9ySuM1tOL1fuzAp0A+Vdd7JVaqA
         iLMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774627711; x=1775232511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jT6N8avUUDlCXZ0/BPJN6GuGWXRGuNZJ0M5UO1nZZNo=;
        b=SFNRDG4SEzjsRxAsO1cmbVJwY5duDjsCyyGWcBOnTQBhSu2f9OqG2IkvDeWNP5ZccF
         3N0u9DHEYv7+riVdas89B6A9fxImTdOSKcb1dlP8DwZFyLi55faPp/TqCQDQEwVVXBFS
         yvBHKuxLm71/mayKBRtG60mcAO9+yfY5UPY3eMTqhgSeyPWW0rjjQepx7vGfeYJgaAjz
         UJkF7yKyA/4SgJHg8YEWDALUsloEQ90g4p3ERy3mCREvstjNsIoTE6tNkQl214clbrTA
         QvSU00JjOsVCW1UxU8K4rhgthT+E2VJ+Ot+BUFP87uQUsw6/Aj9kk9jRy5+8rwRxe+AC
         obdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627711; x=1775232511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jT6N8avUUDlCXZ0/BPJN6GuGWXRGuNZJ0M5UO1nZZNo=;
        b=c9MjxeYol9O9I1sortbSHGTgItCHXJg/wE1a01rlhG8HLWzlqlheZPnhbYve0vafQr
         9kk9j4K+0KKD/ym0lQ3FolXIvN52vQMyDtihOukRdHpGuPCZVZmkpuaNT9b3jR8pLaqX
         35T6ZQbj45h5xfciFZVWvC5xcHOrtiSYufAgc29V++qpHApqYQGcYgLpepulw/qc1TmT
         lbavzvnPGi66+w9XduB9/TY8a82AztU6IrAiFib6OZCx0/DzePTe/gqIXZr0npXbPhLe
         ZLvLtzd0jzOlKScNAufsvceDlLNqxGjxxpkYSDVVtQDA4XrEcRqD0TR3lDYd/iP/9I6V
         AZBg==
X-Forwarded-Encrypted: i=1; AJvYcCVfdEp+WUcaG31Nd5wOuLKWiyDupsMGkDATk8l5sswFbT1QT/m3dWZWl1Gr3OEaG0icb0ya3gzn4mQApIHV@vger.kernel.org
X-Gm-Message-State: AOJu0YzE6AuXofGajKdcaJlK/G9pMpfw+wZkX0kAzd6/3cqgRMixDEBc
	UDYx0S2btG1yA6/Kq/+D+WLfgEC9o3lHDn2DA2JyGrXMhnd187MOXiZgAIR5f+WkETriyr/dl2I
	k1I6+BknTrFH/T35kwsLIU2g1baJ70xw+6h94ewo0wnXlF+f0fJQGT1t18XwHF3llL7f9c3QAZ1
	A3bYLjJhE9K+oS3V02cDztbqZI76M3xN7vdpDvCpZOiqI=
X-Gm-Gg: ATEYQzw7+h6VwBT8VROy7VSsCqIXg8GQhGvBSbk2/mlkVqYlQh/rmN6AmKnf31/Yq4q
	DIGdVKxahqlosRVloM4Bo7kjF3eGiaeF0OfvZioexUPVkGMcK3K0p0ZuuQKOvXtrVFbVSarq2V1
	CHkMfJ6NDqGkFzqOFBKwElj9WeLDUjV7bLuwMRSaOkx3JwEJP7KlwgX/wJzFXyJ/NaIx2bPO0Ka
	zzVD4yMxXJNJgIlQkBS7hOe2S+HsDc2GHN2Bw==
X-Received: by 2002:a05:6830:6b0b:b0:7d7:fd71:f2d4 with SMTP id 46e09a7af769-7d9fae95c90mr1533779a34.3.1774627711086;
        Fri, 27 Mar 2026 09:08:31 -0700 (PDT)
X-Received: by 2002:a05:6830:6b0b:b0:7d7:fd71:f2d4 with SMTP id
 46e09a7af769-7d9fae95c90mr1533762a34.3.1774627710605; Fri, 27 Mar 2026
 09:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127073341.2862078-1-senozhatsky@chromium.org>
 <acSRDNA8fCP7qAFJ@google.com> <fe3177bd-a3d2-4c0a-ab6f-9752eaf32fc4@oss.qualcomm.com>
In-Reply-To: <fe3177bd-a3d2-4c0a-ab6f-9752eaf32fc4@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 09:08:19 -0700
X-Gm-Features: AQROBzANslr58qDkTo4BstZrTPuot25lDdq5XN9xXqpfQR6OmMZsIelXELfMcrI
Message-ID: <CACSVV00MFgsn8_XjXZxubJibLFE9ULrFqiEW9dQAyU404SLj1g@mail.gmail.com>
Subject: Re: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6ab7f cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8
 a=6zafeYv-5ULS2h4Lh1kA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: R5ORBsWmqXzZsTSimOf9-Mf6z0Y7ddVr
X-Proofpoint-ORIG-GUID: R5ORBsWmqXzZsTSimOf9-Mf6z0Y7ddVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX1b84hF462vCW
 vEAv9LPeMRrxOEFOLuSD3n8+kIs3wHhU5A4mIKqtNDIvm+Yii1967cfbGHqmHJODtAH1A/7qnE2
 yBWza08MxE+PDVeoJWA/Ajo2AFJCw5MfdrOjwyEnxEt1mVFIJATsHWoYAutVunUmlO9+LYkG4dO
 tUINmpN+wj7fPJMQCTjdQrkorlvR3uITlrQdYlyAiOhubr4t+uce6rnYtfnGCkLPC1aF07UuetL
 uR4U7BfEthac3K+gzFvd61OeeBtacz3lwxIJC+RApxz7QPoA3PTihrNd1kijei/EjqYlfILfSIK
 X0NztkkN3U5El1hPtpQHSwlGOzb2whk9FM67nKJbUwnBja85dZ315whsNN7+NgI6268QRzpFI70
 /1o+ps4JizqmU44g3wgDCgfbu08oLmXqxTXVtESsDNHwdgA5sCJlU26ETvmEMynugfiK4mEvjJv
 zJl4jghURGtoDB7DL9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100365-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[chromium.org,poorly.run,kernel.org,vger.kernel.org,lists.freedesktop.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 3F54B347326
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 5:18=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 3/26/2026 7:24 AM, Sergey Senozhatsky wrote:
> > On (26/01/27 16:33), Sergey Senozhatsky wrote:
> >> We sometimes get into a situtation where GPU hangcheck fails to
> >> recover GPU:
> >>
> >> [..]
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (I=
Pv4: 1): hangcheck detected gpu lockup rb 0!
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (I=
Pv4: 1): completed fence: 7840161
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (I=
Pv4: 1): submitted fence: 7840162
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (I=
Pv4: 1): hangcheck detected gpu lockup rb 0!
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (I=
Pv4: 1): completed fence: 7840162
> >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (I=
Pv4: 1): submitted fence: 7840163
> >> [..]
> >>
> >> The problem is that msm_job worker is blocked on gpu->lock
> >>
> >> INFO: task ring0:155 blocked for more than 122 seconds.
> >> Not tainted 6.6.99-08727-gaac38b365d2c #1
> >> task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
> >> Call trace:
> >> __switch_to+0x108/0x208
> >> schedule+0x544/0x11f0
> >> schedule_preempt_disabled+0x30/0x50
> >> __mutex_lock_common+0x410/0x850
> >> __mutex_lock_slowpath+0x28/0x40
> >> mutex_lock+0x5c/0x90
> >> msm_job_run+0x9c/0x140
> >> drm_sched_main+0x514/0x938
> >> kthread+0x114/0x138
> >> ret_from_fork+0x10/0x20
> >>
> >> which is owned by recover worker, which is waiting for DMA fences
> >> from a memory reclaim path, under the very same gpu->lock
>
> I am still thinking if there is a better way to handle this. Btw, Rob
> had a few fixes related to this area recently. Do you think those would
> help in this scenario?

For some reason I was thinking we used GFP_ATOMIC or similar in the
gpu snapshot path.. but we don't :-(

It does look like we handle allocation failures.  So this is probably
a better option than fixing up GFP flags everywhere.

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

(and apologies for overlooking this patch earlier)

> -Akhil
>
> >>
> >> INFO: task ring0:155 is blocked on a mutex likely owned by task gpu-wo=
rker:154.
> >> task:gpu-worker state:D stack:0 pid:154 ppid:2 flags:0x00000008
> >> Call trace:
> >> __switch_to+0x108/0x208
> >> schedule+0x544/0x11f0
> >> schedule_timeout+0x1f8/0x770
> >> dma_fence_default_wait+0x108/0x218
> >> dma_fence_wait_timeout+0x6c/0x1c0
> >> dma_resv_wait_timeout+0xe4/0x118
> >> active_purge+0x34/0x98
> >> drm_gem_lru_scan+0x1d0/0x388
> >> msm_gem_shrinker_scan+0x1cc/0x2e8
> >> shrink_slab+0x228/0x478
> >> shrink_node+0x380/0x730
> >> try_to_free_pages+0x204/0x510
> >> __alloc_pages_direct_reclaim+0x90/0x158
> >> __alloc_pages_slowpath+0x1d4/0x4a0
> >> __alloc_pages+0x9f0/0xc88
> >> vm_area_alloc_pages+0x17c/0x260
> >> __vmalloc_node_range+0x1c0/0x420
> >> kvmalloc_node+0xe8/0x108
> >> msm_gpu_crashstate_capture+0x1e4/0x280
> >> recover_worker+0x1c0/0x638
> >> kthread_worker_fn+0x150/0x2d8
> >> kthread+0x114/0x138
> >>
> >> So no one can make any further progress.
> >>
> >> Forbid recover/fault worker to enter memory reclaim (under
> >> gpu->lock) to address this deadlock scenario.
> >>
> >> Cc: Tomasz Figa <tfiga@chromium.org>
> >> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> >
> >
> > Folks, can somebody please review/pickup this patch?  It solves a real
> > (deadlock) problem that we observe in the field.
> >
> > // keeping the patch body just in case
> >
> >> ---
> >>  drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_g=
pu.c
> >> index 995549d0bbbc..ddcd9e1c217a 100644
> >> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >> @@ -17,6 +17,7 @@
> >>  #include <linux/string_helpers.h>
> >>  #include <linux/devcoredump.h>
> >>  #include <linux/sched/task.h>
> >> +#include <linux/sched/mm.h>
> >>
> >>  /*
> >>   * Power Management:
> >> @@ -469,6 +470,7 @@ static void recover_worker(struct kthread_work *wo=
rk)
> >>      struct msm_gem_submit *submit;
> >>      struct msm_ringbuffer *cur_ring =3D gpu->funcs->active_ring(gpu);
> >>      char *comm =3D NULL, *cmd =3D NULL;
> >> +    unsigned int noreclaim_flag;
> >>      struct task_struct *task;
> >>      int i;
> >>
> >> @@ -506,6 +508,8 @@ static void recover_worker(struct kthread_work *wo=
rk)
> >>                      msm_gem_vm_unusable(submit->vm);
> >>      }
> >>
> >> +    noreclaim_flag =3D memalloc_noreclaim_save();
> >> +
> >>      get_comm_cmdline(submit, &comm, &cmd);
> >>
> >>      if (comm && cmd) {
> >> @@ -524,6 +528,8 @@ static void recover_worker(struct kthread_work *wo=
rk)
> >>      pm_runtime_get_sync(&gpu->pdev->dev);
> >>      msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
> >>
> >> +    memalloc_noreclaim_restore(noreclaim_flag);
> >> +
> >>      kfree(cmd);
> >>      kfree(comm);
> >>
> >> @@ -588,6 +594,7 @@ void msm_gpu_fault_crashstate_capture(struct msm_g=
pu *gpu, struct msm_gpu_fault_
> >>      struct msm_gem_submit *submit;
> >>      struct msm_ringbuffer *cur_ring =3D gpu->funcs->active_ring(gpu);
> >>      char *comm =3D NULL, *cmd =3D NULL;
> >> +    unsigned int noreclaim_flag;
> >>
> >>      mutex_lock(&gpu->lock);
> >>
> >> @@ -595,6 +602,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_g=
pu *gpu, struct msm_gpu_fault_
> >>      if (submit && submit->fault_dumped)
> >>              goto resume_smmu;
> >>
> >> +    noreclaim_flag =3D memalloc_noreclaim_save();
> >> +
> >>      if (submit) {
> >>              get_comm_cmdline(submit, &comm, &cmd);
> >>
> >> @@ -610,6 +619,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_g=
pu *gpu, struct msm_gpu_fault_
> >>      msm_gpu_crashstate_capture(gpu, submit, fault_info, comm, cmd);
> >>      pm_runtime_put_sync(&gpu->pdev->dev);
> >>
> >> +    memalloc_noreclaim_restore(noreclaim_flag);
> >> +
> >>      kfree(cmd);
> >>      kfree(comm);
> >>
> >> --
> >> 2.53.0.rc1.217.geba53bf80e-goog
> >>
>

