Return-Path: <linux-arm-msm+bounces-118578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4B4gMnScU2r0cAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:53:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E3E744DF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:53:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MkrXFiIu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eQSSm2J1;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118578-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118578-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDA4B300AB2C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CF63A6B9C;
	Sun, 12 Jul 2026 13:53:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173639EB40
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 13:53:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783864433; cv=pass; b=NepPygkREGbbRuGp9x9i2337C8QWc3KJZAYbkUhfEPOyc+wz35ofStOu6OPyYriwezNOqM5SiUzHff5ZDYDOF2gI7nO0qFn9uw9vDlW6ZuUF82LnyI1VW1xcuvYl3TNm5njmVXUQm8VPd5ehKdx22Hknhpy7ujMtbouals3nN4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783864433; c=relaxed/simple;
	bh=6SeRHicijxf0Xcd6n6XBQMo3mvDA6/BXW5FBL3xvFFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJJLfEUl8Esgo9yudYUHhHF5Nz5bOInNKymHaurYbWx64w2Gy0iQOWcWQHa9EH/PoFtdDAHXff2JY8E1Ael3enUgDY/30uU1LVG+DzOsOjRP02ehqUvuHwLX4yFyk3qWDxRX59uWNFcw32JaRMYX8p1w1SFhLdmz5Fqj3aj58s0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkrXFiIu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQSSm2J1; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZPhp2489122
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 13:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wjc4jE7ttkmjfByvpgXMpVeJ
	fd5zNu6E5KL7m0FWXjA=; b=MkrXFiIuacuzuNaxb/j54iq2shzJb0TXLsDf1iOy
	9z4WJXtOUu50Srh5JFv7/gR8NM/d69SQe+Q0qm52LEU1D5mHaZPNkK43vyywzU45
	2U/ED91zhZfO7MfvoSdM/sFiFfZeQyOS09yYfHuW0scvB3JdyhaIIrUx7YvdjxCJ
	aJ8hxvvBhNNwVHBwuavigvlrRiirB/NV6amwGfVPq1tvt1CXpOmtW7rSXdjJodSp
	/wZkU+wk+l5nf9lB6hbUW4NHws83g0xEunzRQSZa4Yvv9d8IHC7GFoBUEyKsy3Rj
	8LTdMdCVjJmudA/Aw9EvjhXQH+jhbrCRsB+1x1F1/3y7cQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gjsss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 13:53:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84842381150so3930479b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 06:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783864431; cv=none;
        d=google.com; s=arc-20260327;
        b=aFwWQIx7ama+Hc2SO1o1tXf6T5/f+3m011grxAvk1RhmkUUTUwexFAANiY7ZCd5qfy
         avpQb1wnr3K/R4EiiBHpGLuxbqh6HsByzhW33Pqff4LpPwjuQOjlcNh7kVRxZpl1+/45
         3c/b/VVi9LMx551JfNwxAhRKaqSJCQVUGzqRBsDte89TzxnG5pAqGmqZFFEKeP3jiglO
         xThfVmTXPKtENIdnl7NRYPVpsEgmCNWyLCA6jSCul5ZOmDOMIPfiINK2R0PS9m8ej7gW
         3TjTeSqa3Cbhf5H7uo4kx8dPAVZ11pE0e+aWcUq5aUapnqIcMf5LaGzC2llqL+xgLL4u
         ncCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wjc4jE7ttkmjfByvpgXMpVeJfd5zNu6E5KL7m0FWXjA=;
        fh=FPQwmuuNDtnC3yyO2SH1tLtOgEiI3q9EFMNz9jM9JJg=;
        b=VegMo8Vd6BdXLBJYi7tS78Kezc9v5bCw/yvvv6gxNPAUau9Bb054zIKT/yOxYnxs2S
         mxycxqNKw2ExYbYImKn/0jLtcAD/hX1Bj/QU5btAso3ZkQcf4wXBthhZp2zJ9IvQUgjt
         5b6kVxPplE69+lDLFCXLMcMVRC2yJRAXZpQmKMgxxCP1lpAe+H0p7Cy10qT5f6lJigpI
         9YX9/0/awbHeEUadwC0zgVgofIIRpdOl6mzNr+ktyS1dXTdzyAnO9ZcvvYvfMxHrxLuK
         eWUNyfEFDCn9z4zo7OdIS8oVOQjGAkiO8q8O2dNQO31xJPWlhsx4Qb4XOQbpqiJBwnoE
         iHIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783864431; x=1784469231; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjc4jE7ttkmjfByvpgXMpVeJfd5zNu6E5KL7m0FWXjA=;
        b=eQSSm2J1dHmlDlhgZNqMgXDDle5ZIb4m4KqiVwjvc8owZ8KF2N3SS5v4wGNh32bXFM
         E8/WQhMADehjAgt+WGQjNimgEe6IW4FCCeLAUajXHJHlm5rZ+dIZEzug+OTR4poOh5+E
         PI1+zi7UMjQvJRQwWNgbHVR2JTtHbVSlxZW6aRnXyvNpi2AMD1/RpnVbczD/soaakEtz
         gzywBg08WY2Tlvt8a6DgntOMv3u39ZjcuBTXrzmSR/deBj+6Mlq5jv+C50UqF3MAfSeq
         Sn6oINXRfTzUBWTiYcjRoQhL/WEXom78H6JbsFPX/qJ/tCHTIAKRzGBMjB/1KA9kpox/
         6/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783864431; x=1784469231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wjc4jE7ttkmjfByvpgXMpVeJfd5zNu6E5KL7m0FWXjA=;
        b=YGYtxPvwYDmCXMi/4/IXk5LMB8G5YbXx+m1GZAxcbZGadvAo9RD8vgv8SwdhaXfLbK
         OYpTja+npC8fBO4aDlXxEu3ooY2wxVX10jFiFHVRGRY23CoWJe13Bpi6ty3VfRXqf8dB
         nVUf12g14JuPWyNr46oKQOBdB6oqIYuLYneOp0N2C1cfvuYZRpB+yEmxIkON4U4PosdV
         BiIGuvH5Cd9NuCo0FXGJRD7tRqGi0HFxeFp6R+STLvIuq2ZZLOtCdc+RKx6PWzUyHW3I
         xb0rVES+VXzEAE5ngAJLNMfNul/4UsAc0S7LhfTVpGlvpyvkanPTfe7yqi5Z32JhailK
         G5ew==
X-Gm-Message-State: AOJu0YxyoAVba+j2DBJlGaUvj+YnA+6wn7EEsI5xVy4XuB4beFcY4JqQ
	usid1boKQG2n6zEFcrV6flwUubnrICwpt1eDLb3KOfApWYgTWiVUnZVp1Zk0rBuVgP08AUkVw3E
	byMJMNHElS9B1zrMl1f7QxPWKdThPB7aPHzgtMWpFUU4yDiEb8QPuTAUdOIfpMXZOqSrbdlojnF
	9Tptk8HmZRZ+PX2JtHAtMpodvbcvzZUmDwgG0rwMZtXV0=
X-Gm-Gg: AfdE7cmRQb3teq/VrqdTRL/wI2raloKX9bWvl/VdNH/1D25pq8bKCTK/xxVvckCma2F
	nFNU4yh2DvhvKCJGfv73CaQZYsmI+F09F1AG67BTHkrIsIELZT/D/l5FND2WbfsoqH3srnjsF2+
	jvEzHZBfnjJJlGTXFBYsVBCLqKu6cqB5hQRAs7qYHyCU1H/nrrhAhHuJ3tPPOemgDtDk8=
X-Received: by 2002:a05:6a00:a14:b0:848:44ae:47c1 with SMTP id d2e1a72fcca58-848897e8fe5mr5691760b3a.78.1783864430558;
        Sun, 12 Jul 2026 06:53:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:a14:b0:848:44ae:47c1 with SMTP id
 d2e1a72fcca58-848897e8fe5mr5691735b3a.78.1783864430087; Sun, 12 Jul 2026
 06:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMVG2st2udHCUHZ_2j=jNmwTAVi2Cvda0qGgH4tDZHwsGVfLKQ@mail.gmail.com>
 <CAMVG2stuY5aTwfmJkL_cLDn86hfuFD+sT-LdqdmN5m21y2aL5g@mail.gmail.com>
 <zscjwjuqhg36vwsbt735y5gq3bcfxcfh4m46zcgpakacyoxrvf@ekji5eglhdcn> <CAMVG2st0i7W3S5pyZRqMufL+pfKTkv8e3sLnws0UhOpbqfXbmg@mail.gmail.com>
In-Reply-To: <CAMVG2st0i7W3S5pyZRqMufL+pfKTkv8e3sLnws0UhOpbqfXbmg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 16:53:38 +0300
X-Gm-Features: AVVi8CfadGqN0BIMmGxTSgFHMkTaIMmMj6VdmWTupcppvZWmGwD2dRsxo7YUrZY
Message-ID: <CAO9ioeV7tJ01eH6m9nSKv4Xr0gi3x0uaidFZNSKsKSQrTSqLow@mail.gmail.com>
Subject: Re: [BUG] qcom: x1: GAMMA_LUT corruption on DPMS wake
To: Daniel J Blueman <daniel@quora.org>
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, Federico Amedeo Izzo <federico@izzo.pro>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Val Packett <val@packett.cool>,
        Steev Klimaszewski <threeway@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a539c6f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=FiFy6uYC1nMt2OdNVO0A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: Eq1GiKCv4t66PIwHH91DocMWQhiqZM22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE0NyBTYWx0ZWRfX4vYOXYiWt5A4
 dgHzxUJjQx5sSJ7w3ijsK/ugCEHFJRujcuVis8D4wtD/YKudp8jzaow93Roq0oZ5FynjZq2wWPL
 7eTfDCGwVKo8fstsCsNrfXliRSBbN0/GSxHwQLHFo7TyYfhvDezukRu15OlAFjSHXrPbh9ywfXo
 II/gTQgRdbpmhsjE0yXkhkBgPfRckvoWTcf3QzKMWLdUm7fIYnp0iyPs+2n3I4kxH/ZR2uRiuj+
 NkCYX6OxUwBOifJNLnyK5Jl4hcH5bSvWSh0LcZg9ueqGwiEDCfJymcwgsfiwqS48cDpA5f3BcJQ
 TzhwDMYuePmvsTRCC6epOTFSR8FYQgfj6k0rdjX85SkRsJBTSjyatjoDOdGRxAhhLXstp6xNthV
 cUhh4D415T2ZHnSVUGYZoBc1HnHTYnX5k0eYUj89q+4zDWtvWjrS0eCYwkRXTKOWJLSTH90WD7C
 jCRQKsyrSFvZ33zA3tw==
X-Proofpoint-GUID: Eq1GiKCv4t66PIwHH91DocMWQhiqZM22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE0NyBTYWx0ZWRfX3/jRYXBQv6U4
 vDDvZhGTVyh4kUyYkpjKHmymmAiwyoVUREIndVW325OM/DIyKCNDoLzfZGLy5RK5Nb20QG0vBbu
 6Rcnb+yNxUMVfIpm0Fhl7BGT1/NxfmM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118578-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:linux-arm-msm@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jun.nie@linaro.org,m:federico@izzo.pro,m:neil.armstrong@linaro.org,m:thomas.weissschuh@linutronix.de,m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:val@packett.cool,m:threeway@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,lists.freedesktop.org,ffwll.ch,linaro.org,izzo.pro,linutronix.de,infradead.org,packett.cool];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,quora.org:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16E3E744DF9

On Sun, 12 Jul 2026 at 15:47, Daniel J Blueman <daniel@quora.org> wrote:
>
> On Sun, 12 Jul 2026 at 19:56, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, Jun 14, 2026 at 06:27:50PM +0800, Daniel J Blueman wrote:
> > > On Mon, 1 Jun 2026 at 13:37, Daniel J Blueman <daniel@quora.org> wrote:
> > > > Since Adreno X1-85 GAMMA_LUT support was introduced in Linux v7.0 (eg
> > > > Ubuntu 26.04), when waking from DPMS-off, palette corruption is
> > > > frequently seen; this manifests as purple banding. If GNOME night
> > > > light or similar is enabled, the visual impact is greater.
> > > >
> > > > Further, on larger panel monitors or laptops eg the Lenovo Yoga Slim
> > > > 7x (2944x1840), a second INT2 block is used for the right half of the
> > > > screen, which may remain totally blank on wake; major usability
> > > > impact.
> > > >
> > > > Intuitively, the symptoms feel like the LUT SRAM clock isn't being
> > > > driven soon enough during the wakeup, thus state loss may depend on
> > > > silicon binning/variation or related. No such symptom is seen in
> > > > Windows on the same hardware. I found a workaround supporting this
> > > > mechanism is to activate the GNOME night light and adjust the slider
> > > > to update the LUT - any black right half of the screen always
> > > > reappears.
> > > >
> > > > Please can someone with X1-85 Adreno insight check the Linux clock and
> > > > power domain behaviour around GC_EN, Layer Mixer, INTerFace and INT2
> > > > on DPMS wake? Happy to test changes; this is a stunning platform
> > > > otherwise.
> > > ...
> > > > Link: https://gitlab.freedesktop.org/drm/msm/-/work_items/89
> > >
> > > Just a heads-up on this with additional findings. Note this issue
> > > could be the only remaining daily friction on X1 laptops with suspend,
> > > once my video decode reboot workaround or similar is merged. Also note
> > > in my case, without GNOME night light active, only a few LUT entries
> > > render purple so visual artifacts often go unnoticed until a gradient
> > > eg in an image is visible.
> >
> > Could you please check if increasing reg_bus_bw in msm_mdss.c would fix
> > the issue? It's not a proper fix yet, but it might help me to understand
> > the issue.
>
> Adjusting like so [1] didn't resolve the issue, however it was worth
> ruling out. Perhaps you could check with the Windows driver team why
> the DMA descriptor approach was used for LUT setup?

Thanks for the test.

SDE driver also uses LUT DMA, it's just another piece of code that has
not been ported from the downstream.


-- 
With best wishes
Dmitry

