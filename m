Return-Path: <linux-arm-msm+bounces-63195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6624DAEF615
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5D183AA19F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BF123185E;
	Tue,  1 Jul 2025 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxGCbSNY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DCE27057D
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367947; cv=none; b=VuDbOZQJbB29gA2G2dY9m6iZ32afQbtdg1fnIg7OQfRLjr2qDPgTjbZepWptSQp50FayroBd2PqtKdNDqKAfHbMy1KYgwKQhU972r46TOZO+DGgMyGbOk/RbCuAu0iN4xgXnuK3YG4i+AQW+aKnJ/UZ9MgDphgofLTvZqHGhpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367947; c=relaxed/simple;
	bh=AXDVoihqA/5Lizc1Zg6eW95e/OslboV2xqc5P7xwovo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlUnT+FecW50U6u9kO9RdXY7K1p0JNWkN/PiY4e/MWM29uRcaRipko6dnKem0y8vC902l1EOMFLxJtN8gpqoYOttLccS/Wh7jviZPck+U1nhjuu908KpIznWlEMIa6zc0xBJ22OjUSaOe0xK/T85DdB8Q8kxzUIkdgbymWNo7Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxGCbSNY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619qWHl024817
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 11:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZogMt6KKsiaz5/xedtL9aHF64V+0fejV+AuVX29tpF8=; b=HxGCbSNYdM9dEslB
	SjttVn99Amwenu1R7wnkDaKhJaGda/8kM8YFf53/KU128vsYXxNaf/6p19urg5Hm
	mYCDLIZ9YNp0bV30kTJ+Rt4Foy0l704s9vQWadf1pTdTdPoXhVRtrebwpprrgpCi
	UY3DodkPK3T9pc+OLDNmF4JSjRfRTeHRljUvYejXugYVPq2SzWPo2HounfW42x9K
	v188gBN9G0wwqxoqbexRfJGHSn+RRnABE9Pa5gYXip7lwwcUgs+8NTYf5SI0+Mbu
	YEfwZlOmCdqKzcOvF6RoyxB1GUM8rC9ES7eG3VmqFoaRNnK+/03UvbjwbEYabwFJ
	l02HNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9gk5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 11:05:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d399070cecso665239085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 04:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751367943; x=1751972743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZogMt6KKsiaz5/xedtL9aHF64V+0fejV+AuVX29tpF8=;
        b=tH0M4FWqulK2A0lTQQlGjfNWr1eqfVLJ7+v+ygC7u7Y3tuCrp78+KmJtsgIHjGXfNS
         nmcI99BBBYdDvdGovzR9M5yI2ELwy0j1ypH51dLIcGt+iaLs9X96fW7zLUO7RMJYKnM4
         h1HOR8rHylDGbr8e+Gs9T+6ERBbEYHObkM2zxgYB432XV48sJ0odoW5CSmh1RfNnF6he
         rqjnu2WjLUKdXJkwU5eIr7U7UokmkIH7/uNxhp0wiizpCYWN9rGY2H2l82tsAQPwvbM7
         d4ctzto2aXHff/p5KSjoLPfj6UCXiM61BJEUz1YBXoNFkXerMiUQmZWTXPjAfWOs/lEW
         oAEw==
X-Forwarded-Encrypted: i=1; AJvYcCWLu6o+x2y2mv5JBEPX5ToANjFD3KlJQuhHbS3znlFdrXdVmE8ATZldx0uYZ/XlipW8ykDl4TEcEqXhaYZX@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ0rd6PfJ6/87TgiiPoCsDVIdaur2UJq/oIq0JW2zUmvVmcH/4
	/GnAXOrMuEwJas9W6zUOveP6UaI53VzgsyqlxFA8KcH31imJHvTTe0/gjQeoNKKCgsznaj4LKhL
	fJGBLGXU1i876hu1lYZ5F5i+1KJHzewPUACoXRCo7mY3Mfm0Bp/77YWrIJZ4GUrcI4V2E
X-Gm-Gg: ASbGncul2s+uXyYu/ypnXVGo+U9xycKQZt0sIFw5j21WD99nHRMah5e1ZmymkST3qWE
	3BWYvpgtfTqdX97w6C61K9gzZIMsCCrSetcHoVCw5Lusc4ocuQa528RLeZ7rWzeO8eYYi+vczYL
	+K2fBlQ9PbYy6K4qVWDck9UTqR0xYRlauXOCb3CynK0aEUO1jGHaz2KK0gDkqsgYxgO/j10rL2K
	PemDvChH75eQTONLlEVRLUkITPo+zdzwS6KGMv1hT12cj5VJz2QQT9cuJC0WZJ2CwoHDah1J3qq
	zfqnczZdAe6t2JdVYgy1gwFKJ/NPBsdnLtNckRx/ptBHFFmyX/1y4CaJ4CnSIZtBxmHyhNBGrrk
	Nx3YuHivvZzeQKveRcSrWiQqSHR2yaor9i2M=
X-Received: by 2002:a05:620a:84c3:b0:7c5:5a51:d2d1 with SMTP id af79cd13be357-7d44398f399mr2458868785a.55.1751367943252;
        Tue, 01 Jul 2025 04:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkaK5r4kmwq1bTXLA+Z1Z3MCVlUfECWUH1iOnueMEvJSOkDSVRInqR72D3IhCu8jIVuwHmSw==
X-Received: by 2002:a05:620a:84c3:b0:7c5:5a51:d2d1 with SMTP id af79cd13be357-7d44398f399mr2458863485a.55.1751367942731;
        Tue, 01 Jul 2025 04:05:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24048dsm1783299e87.28.2025.07.01.04.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:05:41 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 05/19] drm: Allow the caller to pass in the format
 info to drm_helper_mode_fill_fb_struct()
Message-ID: <t6yywwa4z42d3knc3ihr4d4hzenhtzm5noln5y57uwzlotdkxq@6neoszj33sgx>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-6-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-6-ville.syrjala@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6863c108 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=p4Kof4svB8ImVrqtDUEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: B3uaTq9m1xAKIHrxW0FOf_GN8a8l-gaa
X-Proofpoint-GUID: B3uaTq9m1xAKIHrxW0FOf_GN8a8l-gaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2OCBTYWx0ZWRfXwY9AbViXF4cB
 qfUeyUBE+ROSrkv7jDvvSuuKz940CBBIMcRPxcI6lGpgN/BycG4rP3AFXocdhW832wVTDpjDtxB
 ynU2YDAIVRoHWCethUMElVuOPH3Xub/Z9FDJSh1eO027Omo1l7edp5BzG3J/bG9EB5nhwbbXAwB
 w8VRfw5DJUDTbPi3FPexTj/FjF4Ga5H6dbmSfiRfvijM+yDGcuMQTG9pZ7D2CHafHjB1QjvMb3s
 SPqGYA4bJhNgfI+v3o0t0WOl2w9boZY1f4qXr8eZZQuf0Tzlk4XEWyPzRzt8OGCJ9bEN6ZrTBSI
 7Yf/wCVyM12AiRqq/z5K0E52BOBuR3HZKVDBceizm0OeBNn6yph1pZDVjAwahlRlzsOSYcTacG9
 C2yUKAKK9iwiBaxUmxp/5CgriH7PkJ8+aLCeLpweb/vbSwtzj492jeTOrkb+ji+PojNQNbib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=564
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010068

On Tue, Jul 01, 2025 at 12:07:08PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Soon all drivers should have the format info already available in the
> places where they call drm_helper_mode_fill_fb_struct(). Allow it to
> be passed along into drm_helper_mode_fill_fb_struct() instead of doing
> yet another redundant lookup.
> 
> Start by always passing in NULL and still doing the extra lookup.
> The actual changes to avoid the lookup will follow.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

