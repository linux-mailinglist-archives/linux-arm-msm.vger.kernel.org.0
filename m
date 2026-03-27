Return-Path: <linux-arm-msm+bounces-100442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKpAOHrfxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:50:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE05034A739
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D39830903D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68E738E5D7;
	Fri, 27 Mar 2026 19:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRxfgf8D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCxXNSJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61830392C48
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640896; cv=none; b=R/scPlOPLns5uWj6eARszyAmq/5hfs75/MksmUgMisWHfdSpkpQSa6sHfNtmUU15holUVTjYsK+xOKrAx4udcCq5C/RWXHI8AK4iqYFQvMs0xB0gmD/yr04fhe94up652/JOvo7SRm+pkq3i6AAk+MYTWRKqbCV3pVFrSboeu+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640896; c=relaxed/simple;
	bh=WMqwkOUDSfUwp6qVgDMR3xo+iCAmwaxAl5pcVvHs47E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lEzQTaAF9rKS3d72inheQoCcnLucLoibtuZkLhyC8PAskXK7l3kef+53JJCsv3erX6BNIoFGlNdQL+Nqku2QX1JODI+wQGPqDopYmDEzW4DhwOMMGDxenPO6gxoEHMiLSG2uCH+aEr5oxx9fVSU+SBnilVeTE9jPEYDNurX1Drc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRxfgf8D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCxXNSJu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2haU083249
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CX8uk/deE+IttTZxxFSYHlKc9P9/qNs109M1AeIX5jc=; b=NRxfgf8D3HxsVLSL
	F7JpJ8+IXoXAjY3zyAym9VLW22xZdM0qWzFwF1RNjjLZClCcVgRbp85nbBrA0iD5
	j5yNnz7ZDFL4z8nAFFnvFoguyfHX54IiJqqsilE7wvW1yCNcJbfnp4p6L2xOI+3E
	0N/mmmk/domQan0v8suk9zlRv3CD3VPwoe4SO98aG21dZb83JMIuJ1EVwAXHtsTf
	P5jwKyVYNfEjmhXRHmfrgo0GRPSJBF/9FsJZRlbhXidlhOOHrKl2QEUFkuN+yJXf
	ZCQXVqBS2Kz8B+9CHi23AgiX/rvpYHhpaTUPPq9Xui7/E1UiEPoa4snvtEWjkr1r
	J6nSDQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx39tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso115631651cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640894; x=1775245694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX8uk/deE+IttTZxxFSYHlKc9P9/qNs109M1AeIX5jc=;
        b=SCxXNSJuwHAFAJONVw/XhH3eHBue32canSJZT/JzHlSHnEZNi9tlIVCTkHFPE1CeGH
         q5CUwx6LVZmWCPmkV0kI34TeHb22kBe2auzvk5h61vIs2Ra7TE8PHRhzRVpWRowdzyCO
         yxw0uovltb301pBjvFMKzN7undLq0220VDZfoa+JyV9ae3HO3yIz+cSaYAuzVHmXMv9x
         C5zy0mzuBRNQcsBFt9jombpni5bHk7Oqqzq+tTe5dXm+6sv1nMWSB0pOkTGQ2Ke1ivCU
         teojH/TBVQt+2yPF5jSAX8NaaDTdtVB8ozp955Ez1jWP8Nff7sklGIr69IQLcrFR0+X+
         0RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640894; x=1775245694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CX8uk/deE+IttTZxxFSYHlKc9P9/qNs109M1AeIX5jc=;
        b=F3DhnlVRyHLSVFisV1umyPIBg0wO2PV+fSTPdk+oWowtmSQi4gQwVzZJcVSzjquIKh
         4CLve1dAkJ8jZebLhOZed6BQdkHMn/Czl9ZHVvOfRmUBJiNgZtM7Bh50geo7EiTi+bit
         HqK517QErwOOUiqzMdvLi9QKEC0Ne0gVevacDwj+kHeeyim4/67mBQyCARTLA9nm3w23
         LSpfT8S+cnHht+BR05bXKYJU0gMe0E9IIirAAdt5CLVaXuwKpL4sHPJVBowZTjjHngS8
         V9eSe0gl3w7z+gDhdg3P8EY9q1W32hSoCOfcydFH6+w+Oi9zTUx5xZywV/ylqF/6NARk
         njGg==
X-Gm-Message-State: AOJu0Yy6WT3EMw3DT86LDuEgLscmv+xZRy5YMgFe/IUa97wAmCSs/WfQ
	ZOlDP5bYhI+rRCupnJziuS3f4noCIwMcuF5gT7EUHYuZXhyqFNgD/KVJLdlnSG8nqoDCTG/MWGT
	kp6Zp96DP8CkOkR8hi8bcxGdoSLBr29MKqUGxq5NAep7XHJOE5IZKYa12vi19VAZQYIaD
X-Gm-Gg: ATEYQzwcw59U4p3R2Q1XywDDG2SAkWNEjkXElGUs2ktzugWqHX/ig2FXOElSaqzHUK/
	r/6eHOACnFYiVPFeTnPxqAtuBCOw9J2Y8q3VTLb3U6gLKFvKV2pmOOaaqJxhlB1k0Ysln4GUpdT
	h/o3ULg6xrJIqQM9EyutUXEzliizOgcLcYsjd51BpX6S/0Y4xqLyvqBnn38YkASSk576VTovDvq
	41pLpQb2SAarVJK0cKrwMr/J7FfAafH1MwpQSV9p2mR01pTLMrxlbyNUDqcMU487HCTzPYwofs/
	lIZd2jzTBH4VYs66AjglEmBarjtbjLKUQviohmWYR1T2GoK5/XC250y6PK+knhKwGXYPmq2t5BV
	L7V0UX7rZo17fodUysWfsNE4YtezDJWtLmT7D9ZIyM9A3+PQJhHTyDlWW4CTjZTPAeB07hyE73j
	pHbwVqabkUSdG2xCa2pIMBXRMEH0TFXeYN
X-Received: by 2002:a05:622a:148f:b0:50b:6d63:6a2b with SMTP id d75a77b69052e-50b9938f7c0mr83369651cf.2.1774640893857;
        Fri, 27 Mar 2026 12:48:13 -0700 (PDT)
X-Received: by 2002:a05:622a:148f:b0:50b:6d63:6a2b with SMTP id d75a77b69052e-50b9938f7c0mr83369321cf.2.1774640893378;
        Fri, 27 Mar 2026 12:48:13 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] drm/msm/hdmi: Simplify the code
Date: Fri, 27 Mar 2026 21:47:48 +0200
Message-ID: <177463970797.3488980.14162026767517145036.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6defe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=3TOqmCBAsYJkxzvhossA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: x29gLfH1hwmGCEUJ-w7gHFJPRtnqj27t
X-Proofpoint-ORIG-GUID: x29gLfH1hwmGCEUJ-w7gHFJPRtnqj27t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX0hnmPLDc+uVP
 zlo+02VllrOHid1wIhDKR99CFOsEksfqJv0Gan5d0A3bjNhi5YZhK4hzBw4fk5ThLSUlm3Z1bCH
 uMJblXKLcAklhBw86LJzMsZcLFariC+P4i7UcQu9kfTOXwFiXxNCO1HCyibgSuEBrnpWInigE1J
 VD6IsiOZeT+pvw0Gg4O9zX+JOFQgoaOvG6pKJIQr7002PHTG/GmTKnKTfOyuiizt2nRkPWt6ty0
 Anm0A+x3wO+J7gtMPzbOYxKXO71dsHc5osTNreL13ycSBepOHjFCaGXxuKQzRgGHbPmlWSze2OG
 vz2fSsHrYH8nPQ8ngvOvS6L9RcSi/MamJefQicAgnWgW86ZjD+0LF3p7RyMdgukLZfnyCz5bv8r
 y3Qj+LNfIhPHbIF6uVEsi6dIOdRMYBeY6qW+mOw6eJ1A9rgM6Gd/CExmBKrJGZi3iljky2tDLw3
 avkqOYbxEE55V4NdVIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100442-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: BE05034A739
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 21:17:24 +0100, Krzysztof Kozlowski wrote:
> Few code simplifications, without functional impact.
> 
> Context based (dependency) on:
> https://lore.kernel.org/all/20260311191620.245394-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to msm-next, thanks!

[1/7] drm/msm/hdmi: Simplify with dev_of_node()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5a9a712b0b00
[2/7] drm/msm/hdmi: Avoid double error print on msm_hdmi_get_phy() failure
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ae505afd62f3
[3/7] drm/msm/hdmi: Simplify with local 'dev' variable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/69c68ab38d67
[4/7] drm/msm/hdmi: Consistently use u32 instead of uint32_t
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bc11794cfe00
[5/7] drm/msm/hdmi: Drop redundant 'int' for longs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/536d2eb2bf87

Best regards,
-- 
With best wishes
Dmitry



