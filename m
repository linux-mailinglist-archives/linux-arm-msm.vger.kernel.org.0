Return-Path: <linux-arm-msm+bounces-95356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB06FOhKqGmvsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:08:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A322C202413
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 962623077208
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29F63B52EB;
	Wed,  4 Mar 2026 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6CBpzz7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSW63nUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F413B895D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636397; cv=pass; b=aGFYU38Jo6bTB+47u0kuWYKG4C82/v5gH5/aPKOCaOyzN51J4DhaSJn/1hFQ06Z+rrUS+oGV4O6puhUwR54mne3JZNpCqrbiGm+eox2DEBJyTK4TkgGSJoBG7okNfCrJ8NHIFV6mEKcMQ3Nm1st4X8pPaHHXxmR87ERVH6myokM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636397; c=relaxed/simple;
	bh=8s02Y0GcXB1UXaeArTkCoQcpMvMN7v+IcHhftWflnjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNSh9HmXmnfQEawvgD3JpIIRZDdUEgROfkB0ZxDijO8pSdZVDBtFNd0nsgpeOhhQIM4Pv/7Vp9LZDYnLVepR+NXenP9lrOAF3zgkNFY78JvmZSPwecAyBiu5dCSFuyvmQHsJjKXWPbxqG7dW/W3KDA/xOxM2aMkXlkNdbgufIaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6CBpzz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSW63nUw; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CFe8B1072557
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 14:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=; b=J6
	CBpzz729j7YRvYSk83icgykoKjI4sE96+e13QscHSGYJAx5n9Aq0k9uPMIgmnX6J
	J2skZuiD6e9YAECGdIWa48nkKTXWIBE0w9ynxD04dv7x2Pn9kvzqIFyqDEywG8Vi
	sZSulTmcwwVdeO2KRTODYesyS1BNvMlT/RAHwHDO23HtzYsxVZ4s2IWKtoJJ5yhx
	fm8kJ5fqUC/D0P1QTS2KBvx9UymSIKJc5qJr4OMnJf8zT/Vl4gnAOS6syQ4VSLBR
	unGbvR4BY/W5CBsg9bpWuHhGNEBMJtI4cWcFXgdfaKv1ufHx2ywTWaZg7WO3WuZh
	lcsrpChIcKOqxt294tRQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfj2ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:59:55 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4d668425dso75619756a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772636395; cv=none;
        d=google.com; s=arc-20240605;
        b=Hl3EB2aQwXK3wbLUWfo/ne6Q4WzaAkavstypbwFLEDjvfhA0jrY4EBYnq8Zg166QA/
         4lPnPGPC+xaJ8uCG1U8nrMNltkL+GhhgRSWwEmSn+fZ2vPGrLAefJB1nlYYsM4sZyuKl
         ZY0eQmEm2QIkNutMyK3cynvnYe/YGVozoxdpBUfjsFOKuPxcaPyqYLoUmmonf0zjJPf7
         SF5Tk1kBIkC1famuAdZ8d56R/ExkwOSTZM4GudWf77HXWVf7Zl0cx5FrB1HEVCPdBwB5
         BKGjLripm8ejm7ysXIcI5UZTb1KDV0wFR9lcdCAzQ9Z1Xf3Ai4uSfYvoDrqxpkLQX6KM
         dlVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=;
        fh=JYeySM8DVqtJgxFCmOF2cu9jlCZvFf/vUZ5Ptxh26SY=;
        b=FrOjKn/e1txSJCm3W7SCqf12cEuXjrK6j8QbyvMrfDg6tFZPWbRhOlZZmRlW2yS5DV
         CBb+AVvnzHkY3yvfBT2YAzbe+Upyw5gWHbAudmTtGNHwxJKrYmqHJO3tc2dZ91tnBcmo
         wTSPdKXrgn1HGddZkQr4lS1zkYGDpH8imp9DK/HC/5TboGV+DBYlGBirVKJXZcCrMf+t
         LGMyCHekfgZYAPuJd8Tedyk8mqIwzfLoEwHKIz5cAbpKdgOxKDK2J8zlUHMNenZFsw9+
         mrrwNb+f+N9TCWNvVhcMi/lBSJfaKuKODokSiGG5XMKISiMBgLtKPSjH7K4ADtXqRVte
         EFGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772636395; x=1773241195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=;
        b=WSW63nUwHVitDm325bcspZRc5JUDHojf3QR0WfSnO3oFADabSLpdG8bMYaNzScopYa
         sdMHxT3af3OcPES9c8FSW4NZxG5rBX9w4IMYOKRYgsWHOHAjkiUPPJ8Kt2clqwqOrWpG
         9DNCom2jxd2WUuBBDpF9jKmK9sNB6kfDtFf9MNcK/LqyKfccfH7byufoznsHDjV/YewL
         nnJWXpa/y+6GcZLs+wzULA13JPQVy6UbklvBznRdTeArVnu3KTp4axRkJqdzUV0nsDzW
         M5fB5Ougbp63O3xcuk6UarXrPOBpYF1cakZW9aGz/Jh/Km+0Skn4nozNp5RQpBUVNBlD
         lR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636395; x=1773241195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=;
        b=cuIZJmdHO9b4FWgsWoSaSAzZwnUCdm92JrGbfZWICcvRyYn0Cj3YPUn1O3Ey4k97Ne
         H0eveinYXF8CuB6jxNlBchk6eBeC+qLt4sN63uZ1dihWsCXYNLRo2l2QXLDIB076RuDz
         VczQUFMD4VxbHX59UJtODeZq73QxfBUkowBYNy2GzzsbRPCe6+T5UecXlG94SwheoYQo
         nUUSbM/K0VZnj8L1pV5LoTp3ex2gsSB3vADr2+aQ7iwf1qIvIk/tQHOmierNo5hDxGTy
         NbU3hjYFfOFQ/4HSJWmEHFITHyu6tqVdw47de0xZEjimuC31WVfGP5M7Cr1HAqWcJ+5C
         Br0A==
X-Forwarded-Encrypted: i=1; AJvYcCXN2NAXe08PWe8J094D/Bf6BeZsHEb+Ftqx/huAj/GEl9M21iFlv1loanoErlYP+hYSOlNHSe0SSFDGRPBK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8muSFIZZyxuVFdLdBE/eGPpGIr2ljeFa74CIv7H1+V946Xcxc
	TAR6xWbTo9O+LpsqUM1pgPHUaIijfvBfoyK2kQG2lL3ZBvMqHYrQPcttqi14W8TYFKLdjjoMNhN
	XbXYdl/WTIeFQIQ5xPsI5diHhLyfPzms8VNI8v6amHOBpYZ8gsVPQbBTcmSZf9s7L37AazQuv4H
	aUv4kJ+Xj/AZUw/b9hyyagX9/eh1xT8hLbrR8dgFLNNbM=
X-Gm-Gg: ATEYQzzb0NemWYLD6P3iekpVNWaWlSt0aYRiHLpb/MQ92KuYOrQZhupDPa2a2fomZRt
	xIjBQlOAcupg+DgLPpYRLfC1Zkx9N/W1DenyMhbaU7kafvpD7E7H/uUNX5RwWSlmpu31DOGuWKV
	7n4qagiCykoSQZbsMw2RJvfrB6U9v2PzA22ShyzbTfOzxtriNMKpg4+gTNZsZ5pZNS0USPpdJV3
	y2IMBFrJkNfDCYiti/LLiC7cqwLnsmLGrrT5A==
X-Received: by 2002:a05:6830:4709:b0:7cf:d819:a2d2 with SMTP id 46e09a7af769-7d6d38f9de4mr1354760a34.31.1772636395009;
        Wed, 04 Mar 2026 06:59:55 -0800 (PST)
X-Received: by 2002:a05:6830:4709:b0:7cf:d819:a2d2 with SMTP id
 46e09a7af769-7d6d38f9de4mr1354741a34.31.1772636394669; Wed, 04 Mar 2026
 06:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com> <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
In-Reply-To: <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 06:59:42 -0800
X-Gm-Features: AaiRm53q2Lnqqf6i6iUSVbAXPETTfxfsXanwpvbBC4vy0B_vFlelVg_-LGAl_JU
Message-ID: <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: WZeS394Cwi8O1HXub54xobFWhlND476T
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a848eb cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=uh5CrAVrB7YgaaNdy8UA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyMSBTYWx0ZWRfX21ihWErJkUV9
 qjl+pxcLSeaOCwjMz4xkEztRpOGoyuUins3IKb9E/FNuLHZt3eva4HtQIXZfeWRvMvQB6STgjYS
 hrZy6eTmguOc+pTx4ZutkG2MVUQ+3rS5ftz9tubm6FXbBtIRn8oIIODr9rh/lTY5Le5NjoGaN0y
 vIrWK61DRc+/J+yw9tc6Ezuo5tfNYI0sJVYMLLFj0+RoOBPcv+Ay26tOLTM4+h8pInxaY8A/r3Q
 gj1RVPpdT4wsf9glTDYRTRZvbyzJin6YxnH77lS0CQQMHJEJkwJBfECvcL5Y6MxC52XwdwhvUjN
 9f2DLmB8j3LWzY8m+trbQ8N8eJ5mpa8Dz/8wzho2cRdMTHymoXq/CD+UMZY2aku8jQQCidzDvBy
 AZQdQh7Eit49/zPKrUyzvJUszzxRFVtG/Npl3+GAPH+/Ggt62EkW3lEKPCamD0dJ190nsddx1vG
 b1OR7KNLtvcnCzm3scA==
X-Proofpoint-GUID: WZeS394Cwi8O1HXub54xobFWhlND476T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040121
X-Rspamd-Queue-Id: A322C202413
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95356-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 6:57=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.co=
m> wrote:
>
> On Wed, Mar 4, 2026 at 5:34=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
> > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
> > the ioctls away from the KMS-only driver") dropped all IOCTLs from the
> > MSM KMS devices, pointing out the need to use dumb buffers, however dum=
b
> > buffers should not be used by the GPU for rendering. Restore GEM-relate=
d
> > IOCTLs for the KMS devices.
> >
> > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only d=
river")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note, here I assume that dumb buffers generally should not be used for
> > rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources=
.
>
> That is problematic in kmsro.. (but also unsure to what degree kmsro
> ever got used "in production".. the x86 drivers don't use it.  Android
> and chromeos didn't use it.  Etc.)

(also, allocate from the gpu render node)

BR,
-R

> BR,
> -R
>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index ed2a61c66ac9..f82c9a36a166 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -799,6 +799,14 @@ static const struct drm_ioctl_desc msm_ioctls[] =
=3D {
> >         DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM=
_RENDER_ALLOW),
> >  };
> >
> > +static const struct drm_ioctl_desc msm_kms_ioctls[] =3D {
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM=
_RENDER_ALLOW),
> > +};
> > +
> >  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *fi=
le)
> >  {
> >         struct drm_device *dev =3D file->minor->dev;
> > @@ -868,6 +876,8 @@ static const struct drm_driver msm_kms_driver =3D {
> >  #endif
> >         MSM_FBDEV_DRIVER_OPS,
> >         .show_fdinfo        =3D msm_show_fdinfo,
> > +       .ioctls             =3D msm_kms_ioctls,
> > +       .num_ioctls         =3D ARRAY_SIZE(msm_kms_ioctls),
> >         .fops               =3D &fops,
> >         .name               =3D "msm-kms",
> >         .desc               =3D "MSM Snapdragon DRM",
> >
> > ---
> > base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
> > change-id: 20260304-msm-restore-ioctls-2a1792311a09
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >

