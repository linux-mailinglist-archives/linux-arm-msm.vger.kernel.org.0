Return-Path: <linux-arm-msm+bounces-100447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKJtOIbgxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:54:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE18734A80B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9313D307E3DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D395839A05A;
	Fri, 27 Mar 2026 19:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vk8fiRlK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMpTimy6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D28396B84
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640907; cv=none; b=S2pZafsQOaa5IqiTzgCDI02LkEPP8UqB2IURUIEhEb0GH5cV1d0Dlu+hb3egWBygumNZKptZqbKNJnEKM3RPYfo+ixQpXJmsDRqoj6Bo4Z3yKlA4N7Ysgodmr4kZxCnCCE4txS/bQ3l8qkganm5mGo/EHajckjvmkLROwWaoiDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640907; c=relaxed/simple;
	bh=oOQeKX6GfCnLhaL6HzKOKTrkCmmzyGiN6bDRPg+nOeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fT+C8Zd1ws1QygVYt3C34gEXBHklbzX36jT/inKx7GmaHP9siggBuQiqp4Nyw9/m5t0VCufYnmxNfIBCpsukcsVufEowDHJ9/SX6x71WuYVSGyU2loKqwaBdhNGE+RUoNfjB3ySWdmU5xi2AnOeYwpU3JL/Iqf4ZlmlVHPOAh5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vk8fiRlK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMpTimy6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2eeC3659101
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0NBxv3dflNkSsz+AAfBWMPtCWgCqTxo64qisEz+A6Qg=; b=Vk8fiRlKvmwobiiR
	dSEK6OBj5xWrUpLiZtvx+0TO++e2CUWBB+bs7JHZVsruoA6CVh3QZAVUuiuQysaH
	Af7+/PUBD8fqqoFBx7VqOR/8iRbWVRW4PXFPsueG8iK9+ZUh1oMMwgVxEXLoGWB0
	Q6R/y/nyKcXZEv0rdyx384ec5uJF78Cqd34hGuJki2/Ege0mB7DZHTac224qs4fM
	8yOtBKEHp+tZcRzPfooQnA2UA9JoM01itTK9dvs0nP4CubkFKxwbj90B+DdX0VKl
	4fg3i4k0aKz59PmL/Mw1LnOenIq2jmO0x9eBAW59OI44CNpCnNf7NFi4JXPyt/jd
	D7AQoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn12req-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093787e2fdso116555251cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640905; x=1775245705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NBxv3dflNkSsz+AAfBWMPtCWgCqTxo64qisEz+A6Qg=;
        b=VMpTimy6uJYXrISMZxqZbffIdp052Ms/HX8CT3aDeedf1xd0pgkiHt/Q6a3L9HMZOF
         DEylL8XPmGztYsD3C07IgowhY+EvwJT1AKCU91RLK7r0AKJb5ndkZqYXfryeuSTLwGBA
         0zCRr6o8UtRvMIciu4LoLVnBhJcUfsLQy4YnjojuBV07fVSIDisgxXTy0iPhVyr9SV5a
         Ugjwd8YXcdqS855LpayY5PSHT216F3mr7qFyor+p/MkVvvGmVK80vSUNiesMUD8djjF/
         0I3wVuq5WDbtrnl5hMv1XgC1BtOaOX6Jdiav7PNqCEYqgvjFJGimfbErlb7gZaBOTux1
         sVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640905; x=1775245705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0NBxv3dflNkSsz+AAfBWMPtCWgCqTxo64qisEz+A6Qg=;
        b=dHDjDSwgasD1qlSUI/pvWXmEDTJEr6mP7NkQtVY2Tol/ILB89TfvjKgBEIG9ZlL01V
         ARHVGLR/rBFx2CEy5l45IOtymu33nekgRK9NAn0R4pnq1we3WlSXxGTZq/2fot+e2NpH
         xevOW78eLKRves+B7E7lWW+MZZSRUozw1NbFxyJDHAEOTR3js/TXi3JLTXoN4k77EgT4
         1+2uGbXNMyoSdslXnY5Qigzx4GNDoDqbPhC3fxQwH0u4y+2Ykizy5mnMeB5p0ZqVzKWp
         PYYkU4bKFmJ2HW+5bqUPxIVwh5JJXOsmIwWM1zmqfKQenPn/R8/C5QHddd2YoucN6g0w
         TCzg==
X-Forwarded-Encrypted: i=1; AJvYcCVkgaD789LGKGvOqvFo5e1/PLYPCGqsek9bajKQRUX0W3GKct4AYFAU2Xc0zwT8So56baoRfH002n4pj/uA@vger.kernel.org
X-Gm-Message-State: AOJu0YzzNdFjHqoJfrSu1rzuvyWPcFYLg04sQxr5xRG2BHG83OtKmIq/
	SU+wZBJ+54UVIAPSADlJQ3vzBFePVilMiL/Sc/jwANED/nfnvf3ncZWzMnkHXWTcUlq77+2Ue41
	wWi9VIiSI24bs1xA2jlLJs9ka7r6sLtauUeM7HTc/wVXYFNDcAW5s1BNgTQlXHa2Rg7aH
X-Gm-Gg: ATEYQzzdg4n0DI2cseY7nO+q34VA4TDLrTIrhQu6aW5E2dO1ORydY2SGtZ5dXA7/U/d
	amS/glY75v06FoUGGvFN6rGUJmt+F8MMXVrCRf642YdG1N15rbMy5x9e+L0h/L7hle0BbqwvTLC
	swYA6sa2i/fVjSijz+OrElf9EI4oCAHfE+yYd2F4gH6+6IGq+tUtMGYJjATL+B24i6d6wvhKzXL
	/OB4eKvhw5P/8/xrXe9w5CmTlbAlEphz2RCdoHdKywOrPhukRgetJXVcXM/eqxAJSFj/Inee5j/
	FlFauyJhNB1qo+hjtKFl/F6DYmCRbCi7e9coRGqTHbZbtZKdPdU+/2UKMlqKr1KpiP/C1QFpXbI
	zOxEOFQ1MvPmEpjS0j0WUAjB6jmabFt9LF8Crk0sSSGsW3HkHCd2rENeZjBQrJV/tg/9lgXlIMu
	jayHgMGqNflyiZg/eBhUIP3EiaJmXPIL4C
X-Received: by 2002:a05:622a:1e0b:b0:50b:3ff3:f4a7 with SMTP id d75a77b69052e-50ba38c9968mr50882821cf.35.1774640904832;
        Fri, 27 Mar 2026 12:48:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0b:b0:50b:3ff3:f4a7 with SMTP id d75a77b69052e-50ba38c9968mr50882521cf.35.1774640904405;
        Fri, 27 Mar 2026 12:48:24 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: add the missing parameter description
Date: Fri, 27 Mar 2026 21:47:53 +0200
Message-ID: <177463970820.3488980.16274935490994243926.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309100254.877801-1-mitltlatltl@gmail.com>
References: <20260309100254.877801-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX0gpcDStH1OX8
 PgNnXQAs4sLD10oZlSzUeZEhSOid4hzz1uE7EIhkmEeSQdk8btKZWJ5QS/Hv58MR9kOn7tMqOYc
 CtBnjVKqJUQabPrNYCClBgtn4h5vWBXOhLesdbGScVs2KDoMQYB37iCueG7a8ObMFCdfFmnbW2D
 KbqinOOO/wlm/Y6KS/EFLhlp96tcw3UTQ/ovZN4yAC1euph2JcuTNo+JccMkD7Qs5upIKW4a96s
 KWrrS+1uKMLxr7Pmp36UvQzCDIT+awZI0/Tk02EBZjea06CPP6lV1E3ZfX/NYLV+v5e68RJa0fZ
 YmBkHPe2LrBOS22jP4lNGdk5CbR73KX64bHVS2wmcVmYnjsAZ0EYmS5VRk46o0nRbNMzloDkyQ0
 tijqL4fC6d620odx/7XokJDYXPVJxnFDBgkghcubtoBQvMLmF08q9GZ7SCR9TnXsp/5Tl5Dl4X9
 WgVzB8KJ/pfmk6DsVIg==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6df09 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=LJNnJWuWgWF8sx2EOesA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: vMJJpQkFSW5_XrZZzVW_-YSfAjREyfkz
X-Proofpoint-GUID: vMJJpQkFSW5_XrZZzVW_-YSfAjREyfkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100447-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE18734A80B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 09 Mar 2026 18:02:53 +0800, Pengyu Luo wrote:
> Add a description for is_bonded_dsi in dsi_adjust_pclk_for_compression
> to match the existing kernel-doc comment.

Applied to msm-next, thanks!

[1/1] drm/msm/dsi: add the missing parameter description
      https://gitlab.freedesktop.org/lumag/msm/-/commit/958adefc4c0f

Best regards,
-- 
With best wishes
Dmitry



