Return-Path: <linux-arm-msm+bounces-102235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLvaD8pr1Wm96AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 22:40:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D91FB3B49E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 22:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05F903051E96
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 20:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30793783C4;
	Tue,  7 Apr 2026 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKn6CQ3A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+4JqUg/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E27C379EE8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 20:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775594434; cv=pass; b=b7kQDEwrt3OdMo4NXy2WdWd+P6p52SQjvTSLl8+KMSFjs2HI06DxAQzgy2c3/PfwxshbO9N0O+Mn3nvqPQx6wueqoiOxD0wPs0gujnfhBJFU1kMdVmQToD3MafCos6Q+Ge0EgVZc6lO701HATBXROh53GYXXEd/6oaBr9ESKn64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775594434; c=relaxed/simple;
	bh=bNrsqTpQWB4ksRYyebrw5HriRxl5T42QlJkRG/2/leo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrfziYSf/MxYRaCzA3LKyXLBdCYF4vfRvgJMs0cs3LAfW1mcqHcBuzRzirAuV7OhxDRGtQBf0gx7H2/YFaqe4QShDtR7rIyL/aAfZl7WpslETzW8t84BogXzky8m4VWtl0OqMDJkfdgKppqhluo49Kx+9ncDJXgvI4i8Tok7oxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKn6CQ3A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+4JqUg/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637KOBow249516
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 20:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=eDdQtZi4zIkOM6jZvBLzWLb6JDx+ro8vaCLvZnKD8FQ=; b=kK
	n6CQ3AW6Ye+/nsztC3ZZY36LtC2mjE82Odd6oO/Ixmx4WkolnXEQtuQA6gPfD/ZL
	pLGqIrTlK8IYXLjQuJLwUwibFhz8UvLUPoydv7a7dzun65MgRaJ3Sz62r8d2Jr5+
	jr5IN8uM6hU0Cy/++dOMM5BylY7SAZuSiCPVFd2aTncj+UXutpu7inhkmGwTSk7J
	QdItnnBbiiPEDFyMVLtcL3cyuH8pPb4CaTEeHQqCJWbRoEbAUyLwzuiK52Kb5aaQ
	H82Z44K8RNkYZdLZ8xHmEn33t/VrUNIS7V81zM8ZPS6YZITTsvkjWE1MVPVARAwf
	IH9Wk1TGQOm0Ufg8vavA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x981dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 20:40:32 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-46ee4a74741so3802255b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775594432; cv=none;
        d=google.com; s=arc-20240605;
        b=hOaZYI/M4K7AeATHsNEXoVVaaG3as1ox3MIOEqwLJ1YeTUx9fbJTXBdRHE1cvjjSpb
         ZRDQP1kh2jFyOZRUiUF2uxKYc2lmw564zz3cREX4Rq5Fbm3Crd7Z4R7dmmePDOqRCErb
         sjVHfoWYbMuDtMs1rvO9Pf/5oYsWREcIerxdh6qXl/WjY7+wYzS2xi1Cy4ByjhiWSyhk
         BbuJOR+RBgtoUvZF1a9riT9YuGA4JmX1mMENNdSx8pz3/CWbyiAje6mcsB51AbCoV/yA
         u7ivZdzGb2xGyDOWr+BRE0X5im2NGnhkC3j+RQfFnyiWDE6qmi8T5QfNTyKbc2aOL2Yi
         1Bqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=eDdQtZi4zIkOM6jZvBLzWLb6JDx+ro8vaCLvZnKD8FQ=;
        fh=a1vkVP/xqZ9dlSXyFtfyToxf5vGQ/sniWyhZfrH/Phc=;
        b=AwnZCaDL+IjvbtBJEJLD65rUjGiOsPUmcxPVnI6d7P5y7UhrkKcj4JKF19NFFm8dJU
         dV/0R66cPQqsCUPrYHtyxgzb1oOHp3RPq1xnPaC1rIogT/hZz82A92q0ctqa4fCLFAZ5
         zih9KoB1ql1WeVJxv5VlnliH30QWyRxlerrhaV3Dq9cS2kROVVAWc+uekvdrwKN64Wy3
         kuW/9UiAwApGNRkWmDs34/8xPx7Bb+dlCGSVR0b2nx/n6dTN6vYm35z1uUapxAqMJp8I
         x6Ribzn6l7yidaEouKn9uS6vDEG0Vx7kZKGHW45UNphROho/6p64pfnSfHcFd8LhlWc6
         5AVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775594432; x=1776199232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eDdQtZi4zIkOM6jZvBLzWLb6JDx+ro8vaCLvZnKD8FQ=;
        b=R+4JqUg//aejLvAhPgSzBfSTdVl7kSFyUpSNDHY7RUYAyLevh8Sr34UQBL4938z511
         IZjI3oD5UrY/3pWFRuVlDz4AT9eREhVCmW+TXJOBMqIviIgX/NVkW1EUlIfcfkNiUnEj
         71+XYDbwGr8dF3ol46nn8Ap6HUcFWwViFiBpbIp41eW58IqzWRCVAm5lgK+Pma7xieLQ
         AkQ0DcDdvs0N7mqWYyHYJm98sJ4S4z9ngy8r+meXLNSWBvudol7AHku97C8yPyyFNckr
         /sb6xSULEipB/NPg9RmydMJ9JA3GtX7VIbucavqP12ab968ML0PeH25V11Jp2JWiaX+g
         9jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775594432; x=1776199232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDdQtZi4zIkOM6jZvBLzWLb6JDx+ro8vaCLvZnKD8FQ=;
        b=fJCrgIR3OQFjOEdjmotD1YX+tFl8yf+HlIw/dbrnYlZIfDW1tNCjOHllml4QS+mxnh
         /iA+LN+myGNAfKatiupa+Drt7fhL7Bidm8etq0XVBaaDTJCl0hbxJsGHlL1bwqNAJyUc
         Fd8Oq6UX3WSfzNZC2mhMbqMCaMc39AtaVoKRzKv9ixNt2BujQ3P6JX7A+MiGprk8P+FN
         Scc+/LYHqGrndb1oK6hiug8Yd4LWkV0kP20LK2FZUKmaxOF2Uco/msSbUYZowsTz2xN0
         as7MBCbrBdQNi467K5A6I9z0s9SixA4Xl0MLRHoLFg/NSRY5N9Hy6kGn8Aem0kngiYjJ
         eS3w==
X-Forwarded-Encrypted: i=1; AJvYcCW7sHeP+qn5a44Yd23IDkad3yp5aLZrGlaIeISYDIiMkoZqxzrF/9SAGsJNCCNJvgHAAUpy03LxL0qM+A7v@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8mXzj9O4MKcHY13BL9la1DiQ+acmG2jYpxwmxDY6VLpw85hux
	u3VTKWJFnyFAzM5Fk8P+9mrAS7fNFGZ2IanXZbb+Yi+YlhEJeXuW6r4E1TfAuEJPZIDy3BUR+nf
	Bbe2ihJlXFQOOt/4HieaaN+9kHNs9vD+wCxFe4W15iGEE6WJVUz838vUfs9iN86p4v01Yc3tOUH
	fyOdB//0fh8Hw6Awio7qbLpG6i75r9OlfjIN837brw0l8=
X-Gm-Gg: AeBDiesKMv7ywF1nWcPbqlYRa7a1bPKeYs9ZSN4vvqLWj0LYn/cl45jZZS0Q9w05p/L
	6hXXh14glRv5T3hjPK3yACa6la0hFluubmZQb+jQPEJYUqwBe8bPMwbTPSzljcuE42jiXOPr9sl
	NJNgW51t6QNGep4iu1+O3XcC1Nb+PAc3eOIxY8YRZkZbkH+uoG5Ags0bdEgjEmbdk0+XS1ZCeRa
	5zPZgJerOxd5Mc93rmmNyXMtNSCKufa3kV2PQ==
X-Received: by 2002:a05:6808:c1d7:b0:450:b361:f48f with SMTP id 5614622812f47-46ef55faa17mr9955287b6e.5.1775594431695;
        Tue, 07 Apr 2026 13:40:31 -0700 (PDT)
X-Received: by 2002:a05:6808:c1d7:b0:450:b361:f48f with SMTP id
 5614622812f47-46ef55faa17mr9955266b6e.5.1775594431249; Tue, 07 Apr 2026
 13:40:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-adreno-fix-ubwc-v2-1-7ff73624635e@oss.qualcomm.com> <d56c1af1-af46-44f9-a048-2b3f22529307@oss.qualcomm.com>
In-Reply-To: <d56c1af1-af46-44f9-a048-2b3f22529307@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:40:20 -0700
X-Gm-Features: AQROBzBnWlyD55m71MFh5m55BMthxQsSiClL1SKz4CrVhTWkfURZGhxdGQ3tXgE
Message-ID: <CACSVV026TjQTNUhxHxavgS8YH0vS68RGe+--zQCLrwndeOfXMA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: fix userspace-triggered crash on a2xx-a4xx
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d56bc0 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=YoPDWM_fg-As0N3Yj50A:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE4NyBTYWx0ZWRfXx5y+nAxBcxBq
 8Rtfww8U5S58IGut+M6ADDI+W2rdXsQw+SbddCOtsLzImy56DnbEHPekJlq22SQTb54eVHYBaHf
 Nx/3UUtmFc56CbH7ZzCqR6N2bGORxTOLGnBCOPpOPGs+9YNhY5h7V6xyBNjnMLKBQdI/Kv1w0sm
 7Q033RrlxHV9LplEsgEgpnvNgMl/7xfHI6N3OY/M80S5q/iQMq5/M9rujHS9Mapx+UbaNu9lhFI
 /2z9N8nPUmS2YAh5L3BOY04znMTMuHgoycT1vSU7S3oTe1CJabePujcwn+x+1azWqqVWIX9USNx
 HGlZ9lx8QZLdFIQio3uVw+2x7JxQTroC3KSi+7AjyV80hSdWptYL4Pm9G+7dEpWb/jBiUmpxgMI
 75xusS9UldAeUBzU7rWF9GFM4VRGxQz7bgxG3BFPsxP8SCGdN6jQj8kamfaWmDGDP3Aznl1qLiR
 vvs04VNdJM+/l1Xgr9A==
X-Proofpoint-ORIG-GUID: 4NAJohGHCmKiOtj79v_GQgeFGSx2KrKe
X-Proofpoint-GUID: 4NAJohGHCmKiOtj79v_GQgeFGSx2KrKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070187
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-102235-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com]
X-Rspamd-Queue-Id: D91FB3B49E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:17=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 4/7/2026 8:53 AM, Dmitry Baryshkov wrote:
> > Before a5xx Adreno driver will not try fetching UBWC params (because
> > those generations didn't support UBWC anyway), however it's still
> > possible to query UBWC-related params from the userspace, triggering
> > possible NULL pointer dereference. Check for UBWC config in
> > adreno_get_param() and return sane defaults if there is none.
> >
> > Fixes: a452510aad53 ("drm/msm/adreno: Switch to the common UBWC config =
struct")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
> -Akhil
>
> > ---
> > Changes in v2:
> > - Changed adreno_get_param() return -ENOENT for affected params (Rob)
> > - Link to v1: https://patch.msgid.link/20260407-adreno-fix-ubwc-v1-1-bb=
2b09450b87@oss.qualcomm.com
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index d5fe6f6f0dec..34e4ab43b0f6 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -426,15 +426,21 @@ int adreno_get_param(struct msm_gpu *gpu, struct =
msm_context *ctx,
> >               *value =3D vm->mm_range;
> >               return 0;
> >       case MSM_PARAM_HIGHEST_BANK_BIT:
> > +             if (!adreno_gpu->ubwc_config)
> > +                     return -ENOENT;

maybe use:

    return UERR(ENOENT, dev, "no ubwc")

?

I've been trying to add UERR() to things to make it easier to debug
from userspace why the kernel returns various errors.

Otherwise, lgtm

BR,
-R

> >               *value =3D adreno_gpu->ubwc_config->highest_bank_bit;
> >               return 0;
> >       case MSM_PARAM_RAYTRACING:
> >               *value =3D adreno_gpu->has_ray_tracing;
> >               return 0;
> >       case MSM_PARAM_UBWC_SWIZZLE:
> > +             if (!adreno_gpu->ubwc_config)
> > +                     return -ENOENT;
> >               *value =3D adreno_gpu->ubwc_config->ubwc_swizzle;
> >               return 0;
> >       case MSM_PARAM_MACROTILE_MODE:
> > +             if (!adreno_gpu->ubwc_config)
> > +                     return -ENOENT;
> >               *value =3D adreno_gpu->ubwc_config->macrotile_mode;
> >               return 0;
> >       case MSM_PARAM_UCHE_TRAP_BASE:
> >
> > ---
> > base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
> > change-id: 20260407-adreno-fix-ubwc-6a2564710e21
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >
>

