Return-Path: <linux-arm-msm+bounces-118609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YZERBX0nVGp4iwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:47:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81653746456
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:47:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=krGjgT3D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UTtmOM+9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118609-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118609-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D424300C5B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D278338C438;
	Sun, 12 Jul 2026 23:46:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4337C0FE
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900006; cv=none; b=iT4eOuzXOP60ERF8eYcSaC1o71+piV4XpJ/Hzbg1R7i6esS91CDCwWtKASCmnKhwcFUTKQmmEu6CjPiBdGkaLHF0Gk7U1bSFHSkyiG17tM5X/L5NaPO7+Hrpmk2Y8wo1ezknNP5b9VREuffNuhkT0bbH5YBX3qVkjZ4aOIH0n6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900006; c=relaxed/simple;
	bh=55jHkPApV088Qafp0OEbmTZJAh0fuvKVQH0hS2IRXe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VRHlTJLb1ECFwDIDNsv6JsaTwfUdk0W/5PsZ9Ihq4oSRNzXsAKOE9Us47haNUvdyAYZCjm+Wgi70J2kxxsooTeIs/dxZf/wLrHOdBUL12uWPj7MgQLl3UEbNQ+r9Q2MngAAu29RElARvLIjrGvjQRWNKUV16ALVWxOmZN0qKnxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=krGjgT3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTtmOM+9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNU3Ak4022124
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvP2PU2uWXO8rZskoBmIWobxLxqa0EEPaN/AyMJMkbs=; b=krGjgT3D8IgRDS8t
	StM/YtuMLvfxfqnk9ggk137K33VY3MNg71wyYm2c00GMUQhPIZbLilRoToNF6KS4
	TMyA1++qml35efp6oZ5my2C9YIviILyzSEwFRsFal0unSeHJHZGiesj3jdNUCYK5
	ZJbZdjmurJ8xek2Z3Z/4kp5JIgW0Ezyte9va6clqiNk6Eu9Bizy2RCp1MHHejRfS
	Pu25KUMSjY6tnwIWJXqpOvzPt2hrghJtvweQlwa3m0czB0fMOhGbnZE8KYetUbSy
	TZYNdKHgsLcbFMkM5Lauq4qoawkgQXP9Sz2/u0PcTqBFOKPRr+tsNjs9p2ewILIN
	MSsSrQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn385qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso31996836d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783900004; x=1784504804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tvP2PU2uWXO8rZskoBmIWobxLxqa0EEPaN/AyMJMkbs=;
        b=UTtmOM+93Pg/b4XzwCIZZYeGpP9hPEoYz5pAkd++56XGqCKn9ofBaV2f/XvTEQ0+1L
         RNP0+ibeohhnWpqhBFzCTYVCUMV6uwX6gHtsjtilgPP8KpHkZ1gttrLltxMaXR0JE23u
         fDwqnUWF0FKvPnIDXeRxZlm4495GmcI8hoGizAMm9//aPqQ8WI/zJdQz1+WRiPgAfl2k
         /7UIV5IkH7sEFbbHasUGot3+TeA2+uWnocZ6aRMJKov0qEH1OmlrEj7DrJeynpDK+8ol
         hae9b+OhpJEtyjEI0swc9BXyk+3jNVHsmIppx4CCtKZZw8MRoaS9KwWiqToFOyIc/By5
         ptiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783900004; x=1784504804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvP2PU2uWXO8rZskoBmIWobxLxqa0EEPaN/AyMJMkbs=;
        b=UyftLxBApsIpadGNfjcm75bs0wPbZkJPHapXo3euKE+yE0+1A3jKZD+UecQ0QyPnXw
         T3dsndUELAt4ahGgVcsKcNlxNFPkHChnejMJLS2WYtV/C5BcJpj5MD4MU5FvvH1TDm7S
         4PRHxGxRfjKC77KkFq0wMAh+ASYtnrqwrG6OZbtfcryKBrtdg31dfw+3yv+VxMVCtPGd
         6Cxf5ba6BI2XqknrPN/1UaTn9HeRTUotZdiyEsSyYYm1B9Lf5yinRLdGYGbGmXQNujr0
         fYOfAznEhSCPITbtIJKOGmSy0G2pN3CM0wpYtpWlD5PIw9DTCQINr0JnKdni6xqm5nfd
         g9qg==
X-Gm-Message-State: AOJu0Yxc0JElCOvO6MEYpkxD//sfDluoeKxRUBq3RwSDFg+Td5/9tvq4
	cH6M4qeaGsUlFsuSrf2j/E+vtk8TTmDnGdxo0Gsgs29f/VhzwBQep/Wi+UWo/vZYrF871tfbPEk
	kc83MKTQ13G4MLG8U9gwF7ZMpad3k97+fr3E4scGwLO4PAYp/VOexZTmQJg3kMGcTe8M4
X-Gm-Gg: AfdE7ckK2fDsAu3J3pzkYbSJi5v89Aun8VoEUV1t9jFDA8GfV+punc5W+p1NJvt4syq
	+zdIWJVchiu69vEQdqPWV8lTKGGNFGTD0qJWWibiOlzczUt312VLA/Z39KT4SxX879EMTqLnb3p
	9mv4wcXDpqcwPInQxPtmkfYmK82bDGpYZZsP9vEMhG+dm5kkL/thJMH7HoxEuTN7NWX2ZO9QV7l
	ANcHvCoaoyLsRnnjt8EkYdn7ReGpHVmFMpuVYA8D3KRkpmSt2qI3Ej1It7r2g5CBHd0G6cgzxza
	0KHRaqelOUwD8hzlBI4/MSVxjMqaiHGgnfxPYCE/DGK0Niv/IIapyoqXVNJLsbevzZB0X8+m/lD
	FdTpTaEtxySEUEwai+qgdLCkJTtfdsjG+x9N8n7vGVTXdd0+tbNHiI15OYqEEwbQ53V+Uii5yTA
	JX8rII+PZCq0ahDn0R2tP0ZVMM
X-Received: by 2002:ad4:5f45:0:b0:8dd:2260:70df with SMTP id 6a1803df08f44-90413e0a3d6mr94800176d6.6.1783900003803;
        Sun, 12 Jul 2026 16:46:43 -0700 (PDT)
X-Received: by 2002:ad4:5f45:0:b0:8dd:2260:70df with SMTP id 6a1803df08f44-90413e0a3d6mr94799866d6.6.1783900003400;
        Sun, 12 Jul 2026 16:46:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caaf40esm2371357e87.71.2026.07.12.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 16:46:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] Revert "drm/msm: dsi: fix PLL init in bonded mode"
Date: Mon, 13 Jul 2026 02:46:38 +0300
Message-ID: <178389962791.1434604.17881229374549005911.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712-msm-revert-dsi-pll-fix-v1-1-40122689ea25@oss.qualcomm.com>
References: <20260712-msm-revert-dsi-pll-fix-v1-1-40122689ea25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX6Oz4adlThiSj
 5FspbZosXWdCJHgBVV2f6qvh3qU7aYA5dP/wxYlmg8E36wmFDH2XJ1z8OpG+/voqpVQ7/BOY4D9
 ST0gQPw/UgYEs5stGopJRuWIA9ndlltlSzd8KJrpzQ/KNF7DccQOugbAIJjYnJwigvBdsqPZSJw
 /zKq1K1m9hsfD2lEop5d8LH6lw9lxZtqdJgLq7eg1cfyHi0CUpi/XLFaui8pF/DxgOjlToXUGfk
 VOePtcUq5DD/McbC/6d9oW7FJ9kdAu5VhGj7DNRWBrjwI9mBSrgintL/IeaJcFPsfRSDirRQDSq
 5ZBIaNSzMMxNA9FhK1CNSybT2xzRXpkFhzRiFCG4yHPEV8Nz5SC7puxxJjMyTl1DWuiv5Izeocv
 mOYoVRSBcMUlwTWA69AQODmPtNklXqNLWYeQhigoNfC1Pk2fqLrYXnMKSNIoz0KFb/rQbsPVOoc
 M2qfRI11yJMpFdtP66g==
X-Proofpoint-ORIG-GUID: tvG10J-cPbJcMb8PmipaKCkJ3y3y_3an
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX/AhAwNhq5/rr
 U5xuGDUxrfApWfgGRjteo5ourW2yE9MTj4FN/85whHhI0ddCuLRhlNBOHYvitqt9JV0NPa9K+Zz
 sIsH607kqytjI3cQ+kVUpni+9oOodn8=
X-Proofpoint-GUID: tvG10J-cPbJcMb8PmipaKCkJ3y3y_3an
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a542764 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=d5EI_OdSFrC9Nmgep-EA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120257
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:neil.armstrong@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mohit.dsor@oss.qualcomm.com,m:regressions@leemhuis.info,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118609-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81653746456

On Sun, 12 Jul 2026 14:56:55 +0300, Dmitry Baryshkov wrote:
> Commit 93c97bc8d85d ("drm/msm: dsi: fix PLL init in bonded mode") fixed
> one of the issues with the DSI bonded mode, but broke non-bonded usecase
> for DSI as reported by Mohit Dsor. Clock divider is being programmed
> incorrectly, resultin in the wrong display mode being selected. Revert
> the offending commit, letting Neil to work on a better fix.
> 
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] Revert "drm/msm: dsi: fix PLL init in bonded mode"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/44784327815b

Best regards,
-- 
With best wishes
Dmitry



