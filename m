Return-Path: <linux-arm-msm+bounces-102029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFnDIxtF1GnfsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:43:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F04763A8424
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7B56305E31B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 23:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F84F38CFFF;
	Mon,  6 Apr 2026 23:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8VNuzfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3frXEr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E7832ED3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 23:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518941; cv=none; b=oRt+CuHg2Ky0KoERNdYKP2PHLroQq20kHY5ueqiXY2YJMwVuoz9/F3GpSpUUp/WNF5RPMogx1Ii5wV9UY7FsCoUBlCXaELbp5kY1q0Edkc5Cd8u74RoEXaNGW9CvvQaXVdvUBKW1V21y4+SyFt4Dt181mTTV/wn3swpg2j86ieE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518941; c=relaxed/simple;
	bh=n/+kvlqexUGl+OrhJLoV0nXh7fWJdXM80dZr7SlHRi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fpXVUy4zNniMMAMUx39zDnDmsGVvAL+59XEctJ8oaWtiM2XXzUd7J0j3o4dagz/Qb0mpNB2+o11dDDTGwQclJ+PXg3chrEmZLMomKmPT9JbUrnbcmJ1tgbLwYaBybHXQEQnGtMOBg5wXqkWYsI53fS3hWaAfHVuvQY5qCr2EepY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8VNuzfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3frXEr1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LT4uh2580486
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 23:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C3Lc6HMiLoq3fOrxhAfmM90ggy4edfwF+3FXKllorno=; b=A8VNuzfOhiCv4TfW
	Ca2EftV+QPs/mncQp0Tq+DREHq61Cai2Yczv935fQdZTOPpVlpo2WFA46qFfFKa2
	PzMoiFr39fiBFhh5vIMaMG44zQFjygnzIToaJo3UEkxDieFsTc439aPWzUXYEvpv
	chodlaD2wGgE/RY4dlG1bf0AVSZFiUI8PE8oDPt9tajep61FOxpa8zT7C809zy52
	fSsd38VItE4S3dC6Rgo9HHuWZla1VvATzJwPcZ58mvbSt+qwj70oywoiyrI89un0
	gOcaADxITAlLSVDyHe/tia9LvQyUMllw8Kkyz0coWgCnxKiUeWumu/21eeJoCKwh
	PGcEeg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf08g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:42:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9d52ad9aso18593101cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775518939; x=1776123739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3Lc6HMiLoq3fOrxhAfmM90ggy4edfwF+3FXKllorno=;
        b=T3frXEr13HLMzZ9jQJ8dUtCyrTnqnTa/ynsyx6ei5PvXUGc1oCEVr6IqH36++n/9kp
         Mnzls621/Yo5Z82US0OMrLwdyitZ5dVLXx9FIlwbb68aY3eQQGGUHOiBg0l5HiMuGdNq
         1KlM6VuD3wT4hrxNUYMsr1/U2aJES73nBPRD6QZ7/cA8aTTeTMrsZr798RYCY7GbTDnS
         KtGsFEpZl3H6P/R8wL5qWT6UQQO4cx11HFC4URPMZFNaEJm+QsYdB+Q2llOB6CwjJkKR
         RgCNK2EBCAgl+iw7jqhyjW75zeJocgjCQURo1MFnIc++pVUIWS5Lys7jXzdLkVgCNHla
         Vxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518939; x=1776123739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C3Lc6HMiLoq3fOrxhAfmM90ggy4edfwF+3FXKllorno=;
        b=BO7+5CR5uFj9arT1eqPb8plc0Xm0J8kKmGkbDaIp7hE/l2LIw1pMxlRwfcBnigfXPl
         L6nS3i0u/zI69/SPeJgbxqXq2yJ+P4IzAB3BJxCWqyTYWgCdn7Hi5DXP2WlIQpdTJBsE
         9FU3TQEbYD7yXn/9XXGHhtd15BB8VjiT1+lFsZWwO/CVUZJI4sWoA5Tw+cj/Eg/pFtJI
         9sUHF9K7+s1DSFjVuLl6SMHH3p1nnkOmSfqGmA9ZDxDyV0oaBN/8HG/ttCdb983Ek062
         TRIBG3vSFUsauZhL94vy0YZBiH8HPTSXuRt/Xd6CbfEaLRhHE6ZLoFu0gBey8iuZCJ95
         5eaw==
X-Gm-Message-State: AOJu0YxS6egj+PvBe14STRu29TLtaQNt0DgdhwOaQtyvT6t++SfO5u67
	46wzKCIFV+ivP89RTctAcE780SBiH3JzXgWxHCDx/kFGBKdjv3hK+b7EF06KshR4fqFntJBQZ9t
	C4DC0ycKvVyaS+tlKWlhGX0CzwZ5CQpBaiYQr7ToNA3Yps1UJPnrwnOn7jZIqIEChPrEm
X-Gm-Gg: AeBDiesCy06X2CsCV3D2XCu3ur0fGsO5fTnUtOrESIbyJK+pyFThtqTliivcSHONoW7
	KExLUajoz4vsfFilRYUneV4XpvGFQFW5H5ZWFuP0pec3XItIcuKsy4e46usatzTBMnVnfmMPcaz
	8EApV6OHc9Tn8dS4Bt7P2ufeZDDRQiD0fA5Cyc7ChPZqfqV/wATBTF+zIhtg9hB2hgK/OBzsGvG
	vK0+Ca1aQhybaU7ryuCoitrkof830oh2zw+OGpQD4/LKUKg6Cw2Vmp/w8+EDHM9nZvbtCflCzpG
	5J+Ijf73Cm0BGfOYmXaPhCMQBLJOjr1pkFFQvYkBIojDn1mU5j3Sl4kXclzbap8cdkFfoTrndHO
	7Dit3vWVFNbPe+/TDU/9/5re6xGv3gj4fjZegmOVejP+7eY/9thYKtkv7FZH8p4wR4o2754XBWH
	YclkBw3Nmo6MNZXCq+Xq6Dtt4Bqx7S3b8VRvo=
X-Received: by 2002:a05:622a:1b86:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50d6d054b91mr200801331cf.43.1775518938799;
        Mon, 06 Apr 2026 16:42:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1b86:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50d6d054b91mr200801061cf.43.1775518938405;
        Mon, 06 Apr 2026 16:42:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm33512011fa.39.2026.04.06.16.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:42:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: drop single flush support
Date: Tue,  7 Apr 2026 02:42:10 +0300
Message-ID: <177551403364.616257.14558532661689430165.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325-mdp5-drop-single-flush-v1-1-862a38b4d2ec@oss.qualcomm.com>
References: <20260325-mdp5-drop-single-flush-v1-1-862a38b4d2ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIzMSBTYWx0ZWRfX+Z+FyUBph/SC
 XgAcZrHtqlbDEctKqkGTxRAXnXTjrudK/OP88hCTMGo25YE1w1MLhqii+qjlcr/IKjB7YM1Q7Kz
 HSE5bMYNhDqBiqY4Vs+hI2AnRndLIoa7PZUiSSyDn/A5Pt09xxznnKzCIiH9MiQWiZvrllxiT8O
 mXsfD4tokEMOAl5n5wLFed2jz3cvbTvipkwtPvu9Zx7LaLVA6VK8CjkJAc1e02PmQYjjIREfQse
 eacW6BeSXSTTdliTVUE+isLOCCp2R52UIpzHymM2gGWQcUrL8W4PJwIprmrSNb0MHmbb7Yi+k5R
 fLMLEG5k78j37i5yX3j0L8Uq2iIzszmeZGlyPkPT6oHs0roxj9dH48aWTezyKXrKKj2bZlM6qku
 65hrU8vtIT4D1x5mL4QXKahlpe781ab/P85iYAkTw7BHe3SePVKSqt7J2FETRN8/JtRU1rymZGQ
 R7c/1XTuxVENMyj4SyA==
X-Proofpoint-ORIG-GUID: dmC95uDFIoaOBBRnNw4PrPwXjyl9_1OK
X-Proofpoint-GUID: dmC95uDFIoaOBBRnNw4PrPwXjyl9_1OK
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d444db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=oqX7KGtr0477KDneg_0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604060231
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102029-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F04763A8424
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 04:59:02 +0200, Dmitry Baryshkov wrote:
> Support for using a single CTL for flushing both interfaces was not in
> use since the MDP5 driver dropped support for dual DSI configurations in
> the commit df3c7899946c ("drm/msm/mdp5: drop split display support").
> Having the MDP 3.x support migrated to the DPU driver the single CTL
> flush is applicable to the platforms suspproted by the MDP5 driver. Drop
> it alltogether.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/mdp5: drop single flush support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/429ebd815bbc

Best regards,
-- 
With best wishes
Dmitry



