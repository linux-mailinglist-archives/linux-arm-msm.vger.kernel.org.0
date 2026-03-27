Return-Path: <linux-arm-msm+bounces-100443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB1EKiTgxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:53:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B514134A7B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7ACC5306D12E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B024F393DD3;
	Fri, 27 Mar 2026 19:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJNQ8bn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvu15aWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8889439280D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640899; cv=none; b=ZE8GuWF7zsyOzulSrHMsirLEqUc1AWrMjPhnNTLrDhLAHAGAmQjkK2p9rTSdLwDUv/3QSb6PzEVlJ11beORyjJH8YOXKx+cUSusCnFtdfcPPLO7A4KsBbgJ4kxH4DqccwnDhPvqV39tHTM2KluSR9LbB3JuApr/5oh4ojgXMCK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640899; c=relaxed/simple;
	bh=M9yFdKVnxfaBThcDkIddKciB+kotta7uqMM6KThTDFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SwSDOj1OyPV+i34QiPm/sqKYzwsouFKPx9Q4pz4PFhTykW1uXkkS3A/PvGOCcV0zmRYJ58j8nSPa3jCcztR7+qzdzA3lGh5ZHsD08T/+1ZqRHDyIgFA4OsoCfsZLKWWqaELkC5ekJFYPc92qsBxZPwRtvKZg+JVf41Fl8UIP90U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJNQ8bn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvu15aWP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2mjs134020
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nc5BQLdxMwwYUmrYYywNJDjCwfZ322iu+GCikJgAULc=; b=pJNQ8bn8/fEJnd1M
	4pvsKtWckqfiDvbsfp3Zs867WCOwlOETW+gIoFn7+pmimIUOQH+m05McVffzqgMP
	Z3cXMqFNR5+Gdtu/AWGk9riAimNg0JJTGMPtOM3HUIhtEflDGk+BxCK8V13KluTm
	2dB9Vj0hvia1f1R2yWrCwe1hAzLGjXXlKFVT801xSzbP5E3ma0N0uK26nWAWplHw
	W4e6wwSLtfZLFxU7Oh+jBsQP/t7Ccgw30ye6lBH+zAWbO0YkdcmsTFvcH5Xjj6Lf
	OpLb71+iRdEAT1jeerUqxQ6ciRAe6comHGKWd4cpBIeYXs0zSA42L1/4PUjA5XbT
	gJxBJw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhhfjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093025ffecso73592281cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640897; x=1775245697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nc5BQLdxMwwYUmrYYywNJDjCwfZ322iu+GCikJgAULc=;
        b=jvu15aWPTJwd3XCfg91iDmBUJYl5xC1ag2KIcMPx9Oboqw3J0b354zO2e49vUhiKAM
         +oDYiH+Dziqo+EksUJaZzv8+vtJxtHhso0jrOCWr7kTS8wKQu7+hN6El3+5X66Mkk8c/
         NQqfR1Vhqz6ebo1LmHdJF3blz+GRU84geLJoCIBYsjqDDKMCakleIrSW5VtTFXUpGjqS
         qwu7Bk1UBbLic4Here8Ml8UW2Uo9C2rAzK4eD2CfAUmOuqmOpHkbNVEHTsgS55V4ysJh
         gdwX1TRDSfHXH7FWqIm0JD+CS5whg9xt9ZMktthNVNhQ5tXQtA8FyMjorwz0ehq3NRO/
         Ykww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640897; x=1775245697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nc5BQLdxMwwYUmrYYywNJDjCwfZ322iu+GCikJgAULc=;
        b=fBfyb9kIB6vspLCpA2jCNCJakEn0fAmgeWSmggLWKCX7OKcaNQyRtpT1z+WyPLxD1S
         GTCa3+hE7AsAfmtb76uN0AgcS1gTtyOeO6cmUiOJW+uDZ2U7L4BrSwQnb889Rqjv+GhT
         aQaxSAZj+b424i//hZN+4KKl4Lh3q8CfEZo7ElqXAgtcTinH4RfJJD4JDYIhUGr9hjJ2
         dMrZLP+hS5NOQBpqZEypbQ8nV60495XRNS5ekvpvTDthgBj9g8l/wOR8fhMMGEDIdxZs
         sr0KYnCkCOOROTLayagpPmvneQA8/GNafUwODm1FxiJeDdozXDupi5UuMDnBBza80QKC
         wx5A==
X-Forwarded-Encrypted: i=1; AJvYcCXsK+UFWoWfvPwfrdxzfEHb2sR7e0dTDUObctl7M2ciU9bx7GmfW4WVBj2ZsqgwcqD2emkPp7sha94gTlLi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69qPp6qkNYcNt9XathX2EV56EGTIpAe9PzLJiD+9S9HnEQKih
	a53zMBbQ2D5S+HDcsbA5HE+CEAbUF7N9TTghwH0wi92E1T+kJudUpPtRoYttZQzw7A5iTL4a4NF
	aBeddobqfX/rsQGTSl8snkKSgrOmyUCHEphoTqwus18UBxqWeHcwiObtjZjl964sqTfxE
X-Gm-Gg: ATEYQzxr/bsKTp/VanjbvzcCxqWOgbch40dGwzZdsFxyuvHCOpaCx+2zLAZCuys9XgO
	lnNk3XY9GitykAZVNERWkGaF6Ykkj/lWdrkAjRcPhxbTd6FBzBhw7OVtE7dKJ4J5lNjhmWKgSQx
	Cd41n2eqFkRcxxGcCDk3fsoq8PmBB1ZyKmLvRNLZzU+EyN8ytwHuEqczcPMh3iQnrmoFqzvdhF+
	cupvyA72vgQ7pKwZFp/E+mekWCJY5GCOXyVRsT7HSTy0XLd5lLYFveQyVQzPAr7HKLtqyYUMFDo
	PeAAMsTgvwFzH7Yuk3Sqfq+elI8YHLD3VJ/JBs1/TFB19TasqpaF0TQhlFVWzdP7YE1xqamZ7Tw
	YAnfwnqWJKmuZkDNFvaMn6JqvWRjqzGuGePp3fMto6WN+Q7RnWx+HtZVjXOrzSk9Sa7JFI1GvKY
	qtmnq9c1CFc5K4MenKoEfj9PfvlItbadCO
X-Received: by 2002:ac8:7d4b:0:b0:509:3d06:96a with SMTP id d75a77b69052e-50ba397b630mr47748821cf.53.1774640896759;
        Fri, 27 Mar 2026 12:48:16 -0700 (PDT)
X-Received: by 2002:ac8:7d4b:0:b0:509:3d06:96a with SMTP id d75a77b69052e-50ba397b630mr47748431cf.53.1774640896323;
        Fri, 27 Mar 2026 12:48:16 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/hdmi: Fix wrong CTRL1 register used in writing info frames
Date: Fri, 27 Mar 2026 21:47:49 +0200
Message-ID: <177463970801.3488980.2533820588503538950.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311191620.245394-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260311191620.245394-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c6df01 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=s7uc8e38FLtQ-qa--o4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: htsmyQiqQgf96A2nV1gnfpp0nf24vSXk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX0QftTBx8FDS6
 2cjntZ2Vrm2ymTBSlAb8dkzw1gX1TcOOPbxhftcdWji474vlS4NLLIiDVnVfQnzLaQaD3SHz7k7
 xyER++E5AAVh9YtNNNS+7u9ISbpF16PwBcnODUcL9Hb9prPLrWJ6JtvZZFVkKr4V2y0M9Caanl/
 2vSO2h2dvAbbhejWG6dLC4j1kSEOM5WhGs99Gq/v7DOi0HDDQBfAm0b/Mse+dqxpRaz+drBNAne
 3/36sUGBypc7HDE5CCtzH9+WxABfYxb56tZbtZ2BYaossCfqeMhz8AnVPrw1e2R5QFg3QkzKW3D
 /ngIFCwyfBop2HconWHKL/9enCRARsRd49yCROGjdiuG3Cy+GKD0Sw1S6nSKFkHSsOZhPATRweD
 FGlqHTjDKkSZiWONY7hKzE812np3atF+5iFhUWyxhI8QA9Tya+m0Jokt7QyJeU9Md3/7cZUFz/i
 Y/Iy2twR3hRzHh33tCw==
X-Proofpoint-GUID: htsmyQiqQgf96A2nV1gnfpp0nf24vSXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270138
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
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100443-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: B514134A7B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 20:16:21 +0100, Krzysztof Kozlowski wrote:
> Commit 384d2b03d0a1 ("drm/msm/hdmi: make use of the drm_connector_hdmi
> framework") changed the unconditional register writes in few places to
> updates: read, apply mask, write.  The new code reads
> REG_HDMI_INFOFRAME_CTRL1 register, applies fields/mask for
> HDMI_INFOFRAME_CTRL0 register and finally writes to
> HDMI_INFOFRAME_CTRL0.  This difference between CTRL1 and CTRL0 looks
> unintended and may result in wrong data being written to HDMI bridge
> registers.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/hdmi: Fix wrong CTRL1 register used in writing info frames
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8c6c93b7db42

Best regards,
-- 
With best wishes
Dmitry



