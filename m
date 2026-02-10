Return-Path: <linux-arm-msm+bounces-92528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDxGMzeei2noXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 22:08:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5183011F478
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 22:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2AC03056E99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 21:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F2033859C;
	Tue, 10 Feb 2026 21:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOj42PKj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZMbO64L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED46F3382C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 21:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757658; cv=none; b=h+xV5Rn3jLBrZOrol9tyEIVmu9CblZC+8oko7VYt3HE7CfC1gqkqqaa405D9HvVZzFFvsps0trq/iqopwwrkM7zkkdyXTy8r0igNTk1aaB07M9TfCb6YEASW3NasUYWNSZ9K2jBzeSvM9HOVZuDVl4rt72fm4Zl7aAEKYjAdm2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757658; c=relaxed/simple;
	bh=O8Y60BSUfW0JulofWcWOcnLNPib8cfjgTkAXX1r0icg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKnqTXP+2qElVGeKH4z5dljZY9tA2JMOTMiIcglEpxOExjCOMaVbHTxAocfY1MA+QI87y1rRfwudJSEdn437Ebj7N7NpBaVz3sLmJTtUGNwmA60K4nEIdsZOouyxay6Vmx1j4y9l5fjoCQOzZCA+QdjBzHLfAi6ubsJIMcHiSbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOj42PKj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZMbO64L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AHVeGQ3744892
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 21:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WYekD6MnY0SEVsICbNMS91My
	xF2Htl8S3olx63sNyJE=; b=BOj42PKjqHWpHuUFFKX7fABB68llL9h3EjDxQ+m7
	RERiH64TbniHjMINOGhJxsL/cpuR5YC41SHlQk9ilvrSLQ5TzUeIPi+i09rdl2j2
	aAh48Z/KrFLSA4Q3VhLof+0nEPrq4Tsw2aVi8cvG+H57j7nheg60qt29lIzC/59H
	KDB9Ljm9wjXiNBP+W+TJPGxeKGosACMgNDLFAoBHrO80pUA9Msw1HWXhVgR11zsL
	spxo0TF6+3N4sa5NTOoD+34Pvymqqu+KcKOgL1bI7x/xGJ7Tzj2W8gvtiqfvYMPG
	lcNfvwfEZsxPldedJmGFaaJaxM1kQPqAUYd4+vQYw/u59A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c895c0r30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 21:07:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70b4b53e4so1963213685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770757655; x=1771362455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WYekD6MnY0SEVsICbNMS91MyxF2Htl8S3olx63sNyJE=;
        b=GZMbO64LVYKR74ED6GP8lIVb0t0Uw7EIG25WlOVTXYeW0RLEAYcBgzDF0Qe43F1eJX
         atGIk3KBerpaaWbUOvvyVnCV4j1qmt+eoCcO1Aej0uU30ajh1B2bVzAvoiTBGLq/z3RT
         nWs4CB1fvOf7vdWb8/wT6yDy3iW4zEO345RqoHTsPuFXUW/6VUvJoiUxc1QOBbDlHGxl
         Q9WccQVi1zI057sRYLbRT6WHzAP49TvDucJdUGH2E8Hq7/2iHkPXxjF5K/pzERxSHP94
         q9GtlFzB74/sNnVvteHOGlYPbbhTC50j7TuiWUmVXfMVJYYDDCmq6V8k5yfpE6v5VUTx
         vyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770757655; x=1771362455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYekD6MnY0SEVsICbNMS91MyxF2Htl8S3olx63sNyJE=;
        b=gonp88177M4j6sMD8c23ESFMG83zgQNI6ct8LFei4TXX1JarOi6pfuPAGbR+ZhSmgi
         sw2XyFIBdz64D5Qe0Zu7CpHR/jHpZkWqMPP/xsSUuhKtNAkmjIkggLRy7dECH23c0X75
         MgqL55mr7Dqm2zk1sZrDg281ad1OaeA/E5WR5o5jLcnO2rsYQDL0fXGhRvvg8SYvNlLK
         Dag4Ye+CL8fqbIymvcDlYAKB1mpgJ6sLgJRxDNBtg5Lq8R6OvOQv4fPEDm3d8n/a/x4W
         yRQXmAPBTRUvkzzb+5ii0r3WK7Dab6Z+yFCeJNq0L071703Y/+2RnqlNuYpcxIzrXnne
         CN3A==
X-Forwarded-Encrypted: i=1; AJvYcCUJS8FXPQDqOtRxcn6mH99gc75WO11P1zqNQdEmFdEftHrAs0MyDbkyXoqVaXdwQGF0XGTDl9yav+NddiMC@vger.kernel.org
X-Gm-Message-State: AOJu0YxkuMOI0m+o+qeeIGLaH6iiScd5boqZ7ZoomQvwQzPzRnr4T2wx
	29cpUpo7kOC8D3FXV05urNCYP7OO5qK2NNFdDS8XffnKtbIEHhAkgMHwdgj7BWd+gLxvgnZ6f+T
	gR04efbkiPDMaNnp7JZUq/z7BHSp5AvYo/ybUdIvR2vG2SbK68RyF4XtzixNAJvRjM6rB
X-Gm-Gg: AZuq6aIMVBWL6iic9Md0Lhs30GCgDBh3ivQZ3SRN9eX9Gf7X4PTYIqb1A22R51/wY7E
	kmI4OpG3yih65+Hnvv+AOs7sVpe98wakhlpwtAsy+INA8bmoC/KgyR7cMes4p1n8NO9OEfDreUK
	wZTh72zjg5Ji9aZNoq1+2Vx4m7GX1nDMrgXXv+ziOnehCe0zJG8vy9fFSVs0as0u2QpiGprAVz1
	3baOhvBBZc5C5nJNnkhnh95IpWn24mQUuwrHtTkC1hY6B4gh5ZUYrfVqhmI0ExP4k6s/C/PTlVa
	bgEFl+Lo5+TKbm15d8i2sSJZQi8bo8Cnj8f8CBsI+m0vNyqE5i908yOlffGj9rUeAJkDjagfK7j
	fbYft5k5nq9eLmjSrucPDjQms+3Z1/oIZVU0bIUCe341yxmSIex2o9Ivv9jwhqpN7EU+EgnM3Uk
	fpimtB8sYRKAsTTOKheMJXXZqieugyyAkuhFo=
X-Received: by 2002:a05:620a:4492:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb280bc385mr75881185a.86.1770757655215;
        Tue, 10 Feb 2026 13:07:35 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb280bc385mr75876785a.86.1770757654672;
        Tue, 10 Feb 2026 13:07:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ee4sm3514472e87.4.2026.02.10.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 13:07:34 -0800 (PST)
Date: Tue, 10 Feb 2026 23:07:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/ci: uprev mesa
Message-ID: <sl7sjcaylfmemxnqfs72wcb4mv4smcn2knhcj4he7skmgawqey@mzgj7wwzjvgb>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
 <20260210071138.2256773-4-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210071138.2256773-4-vignesh.raman@collabora.com>
X-Proofpoint-ORIG-GUID: pXY_gmKNp159I0AdX_yDIN4R154NOkc1
X-Proofpoint-GUID: pXY_gmKNp159I0AdX_yDIN4R154NOkc1
X-Authority-Analysis: v=2.4 cv=AfG83nXG c=1 sm=1 tr=0 ts=698b9e18 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=eEoeB42FsikaTLMEZsIA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE3NSBTYWx0ZWRfX8wQ67PxwXW2/
 Wh30xCWL+/8IJ42ueklPPmMNq//4H2s+K0uLNZLAIsb1QtIW1HPRfEf+fHja790scB2eSNGavak
 nn0IC9rd6yzEhfq4CxJn7XmHioF+emAumWN3i+8pBMF8K+m+tSlFwJwTCKRzovRjpWJCVettPa1
 KG5tgjjsRsWn66LbJXSUsyZ9egqNdBjRa8xXro7d21bjKEmSfIWNdBPlVRFkTFyyT+iQ93ayOQv
 BT+2XmErSr1TO3hwjICKpg/W/+8i9gopISs7hr86eOUgLycAVNjWjpiWFwGOSh3dI0XWMt4VSZ/
 zN7tma2/BDEcpTD52SI2IzDUT/Qvo+sbxemRWyT1/pTuBv8IPEozzInhX7FuciDSmm0rJtFaCzA
 7IP9jhUOWS5zzaWik/ec3glG9GGnrnUUVZCy84RP+jHL1gJM9sbKx5HmMz80AP8bQJyfqp/GaEE
 t+LqZHHoxyVXKnndHzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92528-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5183011F478
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 12:41:32PM +0530, Vignesh Raman wrote:
> Uprev mesa to adapt to the latest changes in Mesa CI, such as:
>  - LAVA overlay-based firmware handling
>  - Container/job rule separation
>  - Removal of the python-artifacts job
>  - Use lava-job-submitter container to submit jobs
>  - Use of the Alpine container for LAVA jobs
>  - Various other CI improvements
>  - Remove bare-metal jobs and disable apq8016 and apq8096 jobs,
>    as these have been migrated to the Collabora LAVA farm
>  - Fix issues with rebase with external fixes branch
>  - Update expectation files
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> 
> v2:
>   - Merge patch to fix issues with rebase with external fixes branch
>   - Remove bare-metal jobs and disable apq8016 and apq8096 jobs
>   - Update expectation files
> 

Thanks
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

