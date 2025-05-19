Return-Path: <linux-arm-msm+bounces-58437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6EABBBD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE24F17BAD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1359279331;
	Mon, 19 May 2025 10:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNGSjDL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD17A276032
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652342; cv=none; b=E+nELT70kBqpWvSUDXXG0MzzO4XJCnix5ju+mFkpV5j5TYhyayU4b0TtO/0DJlHvNIOnp9Ymf/YVWjO5ejxYqK0nYgxwAuKoydhrbCit2wsA7rriv4/znowy+G6qPCX5mjuhefrduyBiR76PceLCQqniB7p1SptIVqAJFjOOnBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652342; c=relaxed/simple;
	bh=LiiIOXZeFcrFR5Wr0strWiFYZsNp/GL21CWg7UxWNPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aa3YoSKSHYfNNDtZQ+R1HOWu4KziUo7wp5WCKQsVdVosXeSpeJD4Y39fNqIXMeU/Iv/Qx/msEFao94JZS1IbNnniLboPhTUoPMzj6QeXAgZGAqqfLf/yR+uYOnQ0oWukmzqFX27h4PdNm0OfS9pwIdWVULFR5YttRaYLSHIj77I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNGSjDL9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9GeeO027861
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=; b=TNGSjDL9I6qUy5yj
	PILjBTcQS3UphGkH/QHoFaeAmcCcH91T9l/iGOddVRHp7MYwUG2KptKfg2b5qOma
	AzX30jHkwtB5S0vTNH95gt7hwMV3HQtze1b3HnkWj/VYG1IDZQF+RJYMg7U6WHkr
	sav1vZBqsCetCrTTyunwrZVj1Wl/IUD4QrQM/96knE5aKp/C1xh2+1p5HbvSY+yT
	+fuAY0YgjxPd2Uvpn8cAf9uSABbqvwfX4I8PnE6eEaCMhPWkges4EXaWbsp9hlTB
	9OhTmCFMdq8HfcLentyTLjFtdUOnWpanrZkVLKnJ4sePmS+0TS8lY/8o2kqb1/Ys
	Mu6qXg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4v49g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:59:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d4461e7bso10581826d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652338; x=1748257138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=;
        b=MMAMwwokwJSIU1NbuJdsbB4F2x7MhKSwVoJ5BE5FIuJh1yLcR0CmjxPsH43ifkyQEa
         BGwa6u31XHqrF2jmIUQOt3Gu3LsRGPqP6ye809VBwXpgyAesL53+CDx6tiX+pu7xPsar
         pMM9d4uoKbgFfa6ogP2rHFXETVkNugh7B9dz5aHyNdrqdJXxCpOI+fA0dBnyOPT2pU6h
         qheiEfyqORv905J224PumNrTln22SxHvSnLEdl3L1L8jLVjxABsZkTroFjJgNU6pEtW9
         Sbep+Ag26R4gSE3l6l7/0rarhBveNTari4SJxdwHW8VOQ6z10Qmp6RCVJBDXB/DTIfU/
         qD4Q==
X-Gm-Message-State: AOJu0YxP1FXvvjx6383tcwihJM7Bn+Mvw0m5EH7FYaVSe7d6oJTxed2/
	lZWQIQv54OoDLd2xwRQMLB37MU/KmC1dS0QKGQzeEcoznaLEnFm6us0h8+rb8sud89ZWiBe6Esz
	HFUiLLT8EzVLmb9B+xVKsO3bdBtVyEKJK0BjV2iHq5qSbSAglZcsYTkR1IW/wTdd2Ec0s
X-Gm-Gg: ASbGnctrHf3BANWtuKCet5dGf9whrGuRdpQ0/E0cL7vTst4x+G8cTqzcT3Ia7nerSMi
	qCvwOBNXJZq+SM+uI3z6kdWPiT21lwMuytKxiBY1/B8pajYkXYnWW8oe8CAcgc9S+e6vFLjooz3
	VjIRZsJ0hYgLb82OCKcbKTMzi9KjoPIobWBSv8xdqYPzPdzvjXogzpQW6TH16qiOuS9OcIs3VoX
	S80/AEa5XZhD8w1oudMmsDtBDQJxOFagLrtoweZlFuPw3DH/xed8nQvvz84ane+uZ9RuJoPCGQI
	6o0eD4fQdzJcbFHwxxoIXz1i6s7DneKw5uKHkN9RAaipUsqz5ZaaaUkuzGHBIkzrKWpozxpOIgw
	h9DwGRc1iOV1cR7L7irujX4Py
X-Received: by 2002:ad4:5f0d:0:b0:6e8:ddf6:d136 with SMTP id 6a1803df08f44-6f8b096db83mr202681116d6.45.1747652338531;
        Mon, 19 May 2025 03:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9+e0xodbssXAPktkA1sHSaU+L3EdyNKhog5olMLiulrlaQky3UDZDMD0M0rpu0Ed//Cc6bQ==
X-Received: by 2002:ad4:5f0d:0:b0:6e8:ddf6:d136 with SMTP id 6a1803df08f44-6f8b096db83mr202680816d6.45.1747652338140;
        Mon, 19 May 2025 03:58:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
        quic_abhinavk@quicinc.com, lumag@kernel.org,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        Chen Ni <nichen@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Date: Mon, 19 May 2025 13:58:40 +0300
Message-Id: <174637445763.1385605.2171270817711925653.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b0ef4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: JrfyUE4l12wCcyFoMfNa-ab1AVeWbXXb
X-Proofpoint-GUID: JrfyUE4l12wCcyFoMfNa-ab1AVeWbXXb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXy2a/9H8RH+PE
 D+Y7KypHp+RnwtILkjZ0/cnCh32LiTR7pqFKMt/eFLsNlJ1re9x6KryUN78Vs/qbhpZ38Qokq3p
 rGMalngTaQ/MDKBDRT0m0KxDCYsqft1zO2NRcK29zYxzErVN4O3J2La2j2WfJ1Mi1W31ebiv5TK
 XZYiuoPA0DmQ3RGaAnxtNHyY9c2QWOYX1hG+d9yYTabiKTTcKcLXMikHNOJlxgP1nlVw5qydfXq
 JxASigfsbaxsxWE+Bs+iCxUVZ+S0v8BUi4CWsgAiNnPXtGDXb183LxTeaHr2npKp3uVGCLiZxRw
 +EoT8mZRx7VRd2K+op+RuHXZj14zKkxS/zQJNJkHBorRbhyLgGepj1W4tlopCr9c0nh1kvSoj6U
 QWsTC92GAb1rfgmQMM2lvSwrTQmcVo9v0ryOdOOGPf93M5nfuONCoHhSk1SPVBcZqptBxHGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=805 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104


On Thu, 10 Apr 2025 10:52:21 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Convert comma to semicolon
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5db5401c2455

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

