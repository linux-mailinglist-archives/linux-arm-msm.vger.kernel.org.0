Return-Path: <linux-arm-msm+bounces-102032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH18NfFE1GnVsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:42:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A53A83EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28CAD300EB7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 23:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1434F39E6EB;
	Mon,  6 Apr 2026 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GM4AGJwL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a09I6Deu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9432ED3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 23:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775518951; cv=none; b=Q3PhwFnCw7EZtXzwz1a683G5VAEBqKKCJ/Io3p/b0jylFaJUJONJ6BFlV91tWEeQ04NmSUyZ3I64/atO9nRtRt23nTw/++MtXBlfITyZUVAjm67jNJVN9SGpuvLjG92rzylvehOsh1SRQh4QYUwQAw4hgNSyqk8mzuwUU8cD7jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775518951; c=relaxed/simple;
	bh=0ZQoWqsM7kCQvVK8jseD+i0k0YVkkICRNTDP66qqxPY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yw3AIHwujr/E0R5erZ6uPDBv0Yfb9I0aWTeBmVoMrUfyrBFYLN4ZLJl9/SYtftIbNwKX+1n2MBnQ7/liJef7b/AUgt+4ifohu48UguD/K9lloDqvEagJyI0FYegeUFsaHfTW+33fsIvJYGFI/nsJA3owK8A/gkdhYfFbQ3kc/qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GM4AGJwL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a09I6Deu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQkYI1584872
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 23:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbZ3jksSPmGnNj+jFNKCK9ZaURVLc5iIZ5PBC5ncrtw=; b=GM4AGJwLldePcCTR
	Yxomw84YMCKzfC+D5pBQzRAGsDggWAUCXvyiRCvdSHDMSRSfdulCYTF+rcTSAa6K
	SytT5TzA4nTfJaHrw8kHTSIBRA2MHKq95IbvliBlnduhgx82M2e7s7z2f7khGWI5
	drll9XvNnc30u8iJeymdYw79/K47Ei6EoCIh+maLjnm6EgMvtyX3hh55kPiK7a3y
	lh1EvXL5SwodVnDQ7YQUONX39+pdZzo8BCgAnaIyfLPeYwj7IjEz4RiMmfbS8nLN
	GvQ+rJF4oHPTZ3VtSpqPw1NXih1FB5LDsHH+M7VDxaA2qdz1ZT0qsfWmt+U4P3Cv
	uUYdpg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9r8s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:42:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso28469071cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775518948; x=1776123748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbZ3jksSPmGnNj+jFNKCK9ZaURVLc5iIZ5PBC5ncrtw=;
        b=a09I6DeuleTZUyleuyePNL2fBLtVAgfm2E3JSfm3ujedGNk4VxstD+AP41DVoC6KqU
         aOTGygIjoxSZRvYKID4l0syBzLeMOt8pu/DRzmp2kDJFTaB6OUUCfTKlnzcgvr3qP4l7
         w8ez0Ar1y8kQOZ+FKz53VvKA1kXOb+UFK6e6GfRz2YxlgoRs4gLyc8tBySSRQ4u31CnA
         7XJnRq99dR/nBwx2/ny6jmSv+xLKu0ETaF8pZcradYziOBlmoj83ax6iIrptK4e2pBZW
         9o3eyg4rULEcEd+SK2QpMl7D7qr42VFop2aePSTOLRp9M+7gBmHWXGDohjP2QW/76SwF
         rbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518948; x=1776123748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbZ3jksSPmGnNj+jFNKCK9ZaURVLc5iIZ5PBC5ncrtw=;
        b=mFk+Ffpo1uWHPZAlBsjdXzWIvm5Uj6/snwXAQFq7IxisgnMZERabdodlNq7GOPnfu1
         acQ9zfkOBmcgEFBhmWOBNzkhK3I5gEp0RUd0DN8yTlsrHDcTSNfIXGUFSa90xtUeobQH
         zgxCHSOG7GuDLAFT9SA3xYrsz0NOzj5ugKR0ryEaAHrvTz+YLiZ6FrkL/T80x5OoUyif
         F9QFIO3jASoI0qKyeLS4nkfoW68HLqW4u+Y/cx2OZSpKoKJ3LSuAzTLrd9rqzmuhVYxD
         qEK62TOFimz/h8WRacVpObQ8DUcm27eOs9kAUDuK5gDtcJjyBK/VC1p5ORGPqgkSdoTr
         ap+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnAW2NLdXr7wu3McN2s5wlBEIWAbM4gg0rvmGqOaNm6pZSFUKUmiTqH5RUW5YoIL68ql+If+ey34aUJa5h@vger.kernel.org
X-Gm-Message-State: AOJu0YydbkbnF5YEXzXdbHIx6xJNgGnZfC13bHQnpz4JE523gDzyXAFx
	f4iU+1xhCQ4Enbv48LdXSBqgj5QbanEeqKlyosSRNALk9KOO0KqYgOlBKoEQeVk+8DoQWy8YKNI
	1pUEp7INwDS4W71ajJot9JCfV7mVcSozEPIFXAg78b33fccCB+Hb2B4BVXigaa0x7Y+nm
X-Gm-Gg: AeBDieu5Irx17yK07ve+m3G5utFU7G3TGerAmq1T/0MXvbFnKoG0p2ixcBmT/zKHJ8V
	1IbPo7EBa7S2RvVr+Ukz3xjAzWeiUt+jC2gnroLVDKoC9NEZrNffxjRlIVZOhkNcsVX++3zBtMZ
	r8R+ws9a/QeFni7b1fDIdnvQkQttrwB3C8PmWc1bHe8w+8tMiEF/SeVJvW0hWSAvAcTCTgusKNe
	+manbg3l6crEW/eeQZ7MyYrU9ZRlviBdhpOGRRdQnQa/U/DkuYxjpMrRpRHAfcUUoqO/ogBFf9D
	WG+ySjKNpiLwFH91Fyb0wpjXREqTfQEkp9XxppdJ4zQHVskJDzno0P/U7FlDy0F8pwylOF7Ak60
	CjvQgJx1ORduLanxbZKuhluCAKEV2vxkUBMK/JLGqGrji/zySR/+D5jQzKlzgIcXJ732y6bQjTw
	HP9kkMPQECAZ/yTfN4Pq3yFrw5tYjSXkYwOXc=
X-Received: by 2002:a05:622a:1993:b0:509:211e:3624 with SMTP id d75a77b69052e-50d6250047fmr224132121cf.4.1775518948400;
        Mon, 06 Apr 2026 16:42:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1993:b0:509:211e:3624 with SMTP id d75a77b69052e-50d6250047fmr224131811cf.4.1775518947973;
        Mon, 06 Apr 2026 16:42:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm33512011fa.39.2026.04.06.16.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:42:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: eliza: Use Eliza-specific CWB array
Date: Tue,  7 Apr 2026 02:42:13 +0300
Message-ID: <177551403345.616257.3686766092798863142.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331161156.211623-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260331161156.211623-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d444e5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=vzji59FW9qLxD_cu0m8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIzMSBTYWx0ZWRfXy3pbvfNm3aVo
 tEGmtmaC6GTZAR8KQqzvv1sjpnMaAWPDJlVeaDvXkW7lT37ioRJvxkFgwmiz3AXK7tZBFWu1HQg
 RE1kUnDmHOi7EojTIoOIEykH4YSmKvab/DEvUBBA3b1TzU1yIoHQ1t5tD8ZmNrkeYDcddXQsrPM
 cPR3IY8jX11P7mgUMq/x7cEk3UYW7UyCNwcRJD7UhPJY9A5TIs3zdhyuzJ5H03ZUnduX39/K6hT
 FFFuLCyRTbjS9zJUx8cJ+ICRRd0j5yxkWUW+EXc2I3VxMZrJLa7H5xpN3UjZfhap8GWPJk1nFKc
 WMSvgc0DVrgWEoLEunhmGrR0gZI4g0P9Bj7Y5kUHqpgzQ7PXxs7Zft3y+6+0J7uzjqDgSZmatNB
 4iObsl3O/YHTYyVEjee8450ZYjfa+vVgxQdVDCP9tq2D4BXNbSzZAnRV9cBlx77oivn+6h6qI3/
 kV7rPFI407FXZUCaJYg==
X-Proofpoint-GUID: z8K8Bjj5prgGTuLW-jvLCWzF--kDVnem
X-Proofpoint-ORIG-GUID: z8K8Bjj5prgGTuLW-jvLCWzF--kDVnem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060231
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102032-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E71A53A83EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 18:11:57 +0200, Krzysztof Kozlowski wrote:
> The driver references CWB array from SM8650, but should use the Eliza
> specific, which has different register space sizes.  This should not
> have noticeable impact on function but is indeed confusing, since the
> Eliza table is used for .cwb_count.

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: eliza: Use Eliza-specific CWB array
      https://gitlab.freedesktop.org/lumag/msm/-/commit/502455d8bef2

Best regards,
-- 
With best wishes
Dmitry



