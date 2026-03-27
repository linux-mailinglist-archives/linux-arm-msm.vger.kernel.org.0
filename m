Return-Path: <linux-arm-msm+bounces-100434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMZAG4fgxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:54:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5934A813
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7140D311133E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9BD384258;
	Fri, 27 Mar 2026 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmxaaId9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajQpMefb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689EA37FF5B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640874; cv=none; b=AZ4KN92fuAlzMQL3SLwAAznqE54CHCaUo3H3IDydBeEWoK/KrZr+hRsX1uKhgYyHWkQYQ1jAKlAi9KFMxIYHaY4g1EHsaASZs6CZJhp2dxbGJxTyXhsKUoXw5+klTkHp0Wm2Y1cBq0RbI2XFKxT2R2njsY0IWHz3F3pwGYXZDQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640874; c=relaxed/simple;
	bh=erS3xWDIxpIv+sTiGldrp6QB8nPcbXeFZE4cGlh7cnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGSrz/yaVizLSJ+/X8yertfKAzukq0Ed7nW3osOJC/r0j7/h03fUQqteYqo7wczBChieTY0+oQh3I6B5w+ryKWwD2w9C6yGjiddDW3hTZzEUFn+HAO+4lFIu3BilHDOI2Wye51KBdOTrAzXU0YV96Ot5XxY/cmfzLRVrRoOtdD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmxaaId9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajQpMefb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2hOh1458603
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iw9a7IqTzcAiavmSNpX6Z8ng1GGVOGXu1X0ZTTn1f1k=; b=hmxaaId98+aTaVfI
	36WMHyR9/ICk5G08qIQS84xprwjKP9N60n19S0yjQs9J3eLOcHeYkzMJUSBTNXT3
	YqJaTwm6VMdqeQUVgEGtTk+UkGDAwENiMoyUU0DNhGBrc+8TkhD+tDwN3u/nw1HM
	Vjcgl4+fZ2s3LwpDzy0eDWWbgxUizQt9AIXKAUG1SNQ28yzVEX8woGYQ8brUkOWg
	uSkqN35k/4kXEopmKezAYLNdXMsx/qDat34V75nn8JH75wJiQ5UKfYCiuoz1c2Yf
	j1Uz5uRKJpJ/bzIDRI+YGmOWolZYy1uaf4qdvvjFwBe2dJgTaxVsvSwkq+6P2+Fn
	NNjmqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6m5w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso67504011cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640872; x=1775245672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iw9a7IqTzcAiavmSNpX6Z8ng1GGVOGXu1X0ZTTn1f1k=;
        b=ajQpMefbdQZphHo6fCK1sboNxdY72IFUPUu+l/cCnqqHYFjin1nf2q6K0QVNqdaC7x
         V9lV27ETEfa9UatPS7k/1RAjSe9PSt1hInqQRypa7NhfnaJavE43PDe2KxoSU1aqsoDm
         uNks56m6iLY/Nd3u3eTefuQSRp9SlN1MQSi2H6vD9MAFG+tdt2Dn/72wFvtTZY3quvR3
         kr81eop//R1WHtzQwyF0Z5yF15zmvzXf74s5XfLOBpAn8WfP0f4AWwL9uNKVNLE3WewQ
         kvhDtwmPZQt5z0/wTs67kPEiZa3nB+CqVzs1Jg/Yd5Ibe8BDOZGG2Mx+qhgo5fIHa8YP
         5F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640872; x=1775245672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iw9a7IqTzcAiavmSNpX6Z8ng1GGVOGXu1X0ZTTn1f1k=;
        b=BgqwiZHLKsBFig8530ZFvyKRZgM9PgTBXPlS8J2xWpC5QlRFb79ctBgnLWluac+zUQ
         3psBjsqOujUr0B4F7yKGEHZS03Ud7adWmremK3ulmEpwDULmq7co+r9eAYhbndZSzf3/
         YgAFIBKKdCGGLFi2EcLuDOkDfvyKcf28CCjgid9m1XYlbWC/csgCOkAeRN6LFKwXQtfd
         Ijqy+KiQ49k5RIsyQVw9GiJaakOIZtWjTtzzreCk35e4Sa0SUm/Nc961wByYz9yqc3IM
         aE8VvV+TF73uaVe7vc0PYpGXcaY0GUSTRHH/mplDemUTi0L3f0RB30Q8PUuN/I1+RAPL
         rf9w==
X-Gm-Message-State: AOJu0Yy0NJVHTJ5NPvQKCdRzxJMCyWlFH2Cfc69BzL0Sn/o+TJlw1PyL
	06saiGFK2mpLIL4XPIg9/Y21UtifCp4WICXDkNtccHFXoNTynNoxmyCUBVD5Dtvgo+5DC5gMkkn
	17DvUdYl2Wf/jMdHSWzH1yRxzwJrAemsQJwDbld5pj6noxnjQpv8kt9IZeMh3xKl5dsL4
X-Gm-Gg: ATEYQzxP9+12En9Ggtrae2hA2SP3ctQeqJbJA5dmLX54zcnsQ3VgMTJZQ9pUE1TKbHR
	yL1HawZNfdjsbNQKBPc9wMllGCGvfew6g501FImJWLTizS1npN64OaZNy8YlkHpA5sjfXYpkyFS
	SW9VIUcXKsgZ0dfy1Dr6bXrCF+NbP3794UbYwon3zgLmVPD4xDnjaUN6qzThtt97XMJHoSu5zLu
	lfrQFPL7DlJffgB0TZ77HiCAmLiZ6wjFjiYllyyEjiVlqFpcXWW+4pwiwfj0+5HXNbZcgO1YIMO
	hd9OwJZ5e8wKRxJ3OuaUT+pq7aogBekaKSZRFTiQRR0Zp1Bp4Js9nbWKAXjR03zQpfMbXYUlbSK
	KGIAfRDfxBUR5pzEvpBxJm/LFZtqY7fpfIvyn4pe6NJSxDwJ/RyRgtDUzClU639MA6HY7G4msD4
	nK6y6JQULBONVuujyZRpgpQrFam8exYrOU
X-Received: by 2002:ac8:7f0d:0:b0:50b:3be7:afd with SMTP id d75a77b69052e-50ba39fffe4mr52322081cf.65.1774640871775;
        Fri, 27 Mar 2026 12:47:51 -0700 (PDT)
X-Received: by 2002:ac8:7f0d:0:b0:50b:3be7:afd with SMTP id d75a77b69052e-50ba39fffe4mr52321671cf.65.1774640871315;
        Fri, 27 Mar 2026 12:47:51 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
Date: Fri, 27 Mar 2026 21:47:40 +0200
Message-ID: <177463970781.3488980.8775074187981709314.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6dee8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=83z7iYTKtPZY2SJc0qIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: aMY4dV8UWYMxINfObNEtmIBzWqIFp1LT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX6NG2Ap34VK6d
 SoeFD/oTELrPbt1leKyxsilByjuFxTK0Ac/36/DNPcNafRVZLVIh6gtEzYran/S8yifN/lVsiHi
 w4MGsqAxjmI1F3hlb+bx6o+A4CNSyj5ALT7lrpFopj/3/bZcK4S+3eZ+eDOBNjAMGEPgv+IMufx
 NjpTh+FfvbaWjeOSvCKew7Dwr79+d0We6/c1dDNHf8Bj/fv31FaLxtJAxmH8beUs9aYGA3T7reZ
 TKQMu12cU6Sie6OnwKmxekakQOE62bqGO3rugvEn3phe2cz3aWdhXeRqZ+DHfYygAagB2WIUk33
 h5dFvOKIylmOBpNuNy6qXbIYov+EGb1ke/oBATZpP8Q6rrD+zhj49vaTWFAzSEEZOsr98Zi7s+l
 icVZ30QevRYsg0tth9FIPNw90WXOAei0XRJtfgKq5hFdQ8HJmjcZVDdZt7fm+2m200fzEs16ivH
 PQi6TaK/InD9TUtTWbw==
X-Proofpoint-ORIG-GUID: aMY4dV8UWYMxINfObNEtmIBzWqIFp1LT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100434-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: DEC5934A813
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Feb 2026 20:36:39 +0200, Dmitry Baryshkov wrote:
> Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> question revealed that it's not actually used by the DPU driver.
> 
> There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> VBIF_NRT being used only for the offscreen rotator, a separate block
> performing writeback operation with the optional 90 degree rotation.
> This block will require a separate isntance of the DPU driver, and it is
> not supported at this point.
> 
> [...]

Applied to msm-next, thanks!

[1/7] drm/msm/dpu: drop VBIF_NRT handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cfb64b092617
[2/7] drm/msm/dpu: stop declaring VBIFs as an array in catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2c0c3d9d95ca
[3/7] drm/msm/dpu: replace VBIF-related array with bare pointers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/014390e30a74
[4/7] drm/msm/dpu: drop VBIF id, base and name from the catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b26bfb5bf1aa
[5/7] drm/msm/dpu: drop vbif_idx from WB configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/021fd8ca0cdc
[6/7] drm/msm/dpu: drop VBIF index from the VBIF params
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1ce61688875d
[7/7] drm/msm/dpu: drop VBIF index from the struct dpu_hw_vbif
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7c5166fd79fc

Best regards,
-- 
With best wishes
Dmitry



