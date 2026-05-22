Return-Path: <linux-arm-msm+bounces-109276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAnJJJo/EGpyVQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:35:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9DE5B315B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A2763017258
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7703E1720;
	Fri, 22 May 2026 11:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmcIfdHb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/Xmizj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0853D79FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449470; cv=none; b=ZZfib6S9h5u/WIBx5kEzxbvvTmWe5HrX+OPJRgReInyKInNiM+ZxVFEXY07i6mYmVleRVE2enJZV9gk6L0ZcfqZljWHuvUKIYBQeA21gx2TUpdSMLoN2KEWFL6f7UFMcs56pl58C4SR8zVvfeA3a+DcwOi3awxJUx/IPYwX7MZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449470; c=relaxed/simple;
	bh=EZNnRwkrBuTQ4roWiBdb+ErIE29mmE0DpUfyjExuusU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAcOkPHicU7IyCm4E07xHSKuJES+suXzSnnyKJLBR25pGLce8+wwk1QYqDgkyvRjNYUocVjnT/pAHUVzbB3Hv+DfabGcGkJ18565DZ8B8yrgcvzAC+9RbIOxJkvlzM8hK1hHkhsjyQeba4ixQp9mOKrTMisav2MTkIdtRwYc2tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmcIfdHb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/Xmizj7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8lQBp399119
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGydSFVKDgHM2w/x1IDM+7RcPx6urNySCa95PlM4hS0=; b=MmcIfdHblIB1bMEt
	CK7bJ3ETmoEeQWaJqYsbvVXRtSsAUMdIn0Iwr4HDVlBuI2nsj+VDsV4RRNPNCIbK
	oHYYf1cSuV065nhcTwWgDONbwsZmshS4ivrEsPYgjO51+0nP51MMMohW+IE52VCm
	Zar5ljcobC02dmsJUI9eUk8y5Y5sWgpwvdaQa01AAVgjhV86IDhdbdHEi6Qqttvh
	X9IDLRxGQYsxqFnguENufcrQGryPVx1zQy7MPhmYr6YcWzyIlWDeMaWqR0NncqIw
	peY7gkNtR6owJN9WPrXQzKs3nNhSzP/v7YdFeZm+8Cc9DP55Y5XUSIzxbtF0nbGL
	w8FIlg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9v2n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:30:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914aa01cc21so35520485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779449458; x=1780054258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QGydSFVKDgHM2w/x1IDM+7RcPx6urNySCa95PlM4hS0=;
        b=B/Xmizj7sQilP33EkifMfooA9K751Acr4IP6nfvrXAsUiA7Tn6ITiw7qcP0BTvPNhw
         F2+qp3htwtsDEEVJDFvhGil9PxkMx+HXimRa46k9Ib47IFqdoPT2ZtQthOQCKc1djPMW
         WUIGh/261N18DLCwk8HNtA66LjkLwDDlskLUUP2TBUbKA8p5y3Q/Ebnmk/RmSreUC1IF
         TmidbyT5J8kq6hkZ3M/Oys/KkqRg4tDl5WAoO6QSalFU0iHKJW7WXEDVzrajL8WqXylx
         pDNVyYKUpJW4Odf8t7VQO7XjSLruj5QObRQQ11M+j2hwzpIsD8YiFpWyV9/zDmBZ8dMV
         HRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449458; x=1780054258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGydSFVKDgHM2w/x1IDM+7RcPx6urNySCa95PlM4hS0=;
        b=Q8B6/vkFPf1ggnUYD2B/QlL5VA/hQ/otHsTufIS1vf8VhQSSVlJGODwKh0nbK6J6Eb
         rp/+yFANSoo2GCEqF3ySMZtCT8BwqE0hvqYM/vngjwlwE/RSuggv/i/D/TKBHC7jnVYP
         jy9cJimWth7Did384JKZ6uSg7xCJybxUaRKKW2UP3j4WLd/vOZqCyEOZ33J54C5wdxX+
         d2OzDXJdgrBP91+XL6fGUuouBgIwkXvLeB3DJGMLO/Nw6HNicmxfAJjLyDL+8G5KlPX7
         lCxE13g6i9ObdfhDry9T2UVyVet2yYMSENhokJ9xNrQZ43Yx7RYiqJEWG12tG1cYy1XF
         3s5A==
X-Gm-Message-State: AOJu0YxYwcyjyRT7xLG4VeQUYijYiiJDikR7yGEHgQYo9i2a4Aa7GM5F
	DfEdqFRT2gx96Og3qOwBJDLNReZp0R04GYN6FIQmMTQAoOEts0+I59pRtOiKadpMzx4IfNSyUpr
	P+kj1trOKYjdezLfKcJh1yuP3Bw4FpDV1Ik1QX8Qa5kSYaDwuXZgzgTqMQ3FZmD2wrfwx
X-Gm-Gg: Acq92OFDnFNJ+iS2H2waUmV7nF4txQo5Ymd2F9TgOjj6Pp9eWY1J3J3Am+IHqkhx1/O
	YpyL41Ay1p32slSzzmNGZHWq0gqWxC6usruGWdx0kzsIWn/TCFaq1oulV0dkBvG6fELm6t7v8ep
	Kt3ggokMCWfwI2uEhUJJBY8dXOq3FD2adn6EjOj7YR72nDgm+PiTcpepb0eqyYL05r8sCMSJJia
	QzoQ43pKOvquHrk1zAvF7QY2vmyjk7fph69KrphsOkiaN634r4GDTIUs/rvZwIxiCZSwGUQcy/y
	AhQUzsV+BSWr66Aja3rX9MEbXldi1CCD89I/d4X9XEvEryHdUzVdMlzWXXbtZqMtiAcvwiEjNUU
	xKUY4mQs3bh5jG7hXjmNU7/8jA2Dfh9EaBmcVnj+fCzGPhQ==
X-Received: by 2002:a05:620a:4494:b0:912:38a1:1273 with SMTP id af79cd13be357-914b48c0d3cmr316908485a.1.1779449458108;
        Fri, 22 May 2026 04:30:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4494:b0:912:38a1:1273 with SMTP id af79cd13be357-914b48c0d3cmr316904685a.1.1779449457566;
        Fri, 22 May 2026 04:30:57 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc68e0ad1sm43764466b.60.2026.05.22.04.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:30:56 -0700 (PDT)
Message-ID: <c67ee441-83d7-4b66-ab19-c2c282c1b354@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:30:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-3-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-3-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a103e73 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0nMKL6qGrdLAchHWSpcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: A95tKsOYkriTnotsVFAtgtFjW8eOcKE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNCBTYWx0ZWRfX7wIvu2L79i8y
 bDPuAhCrHjmR3SXgCiTxP41WAb1uaqcLJQC3LynfJyYcPSbTVkxaT5j1SIwoXAcjWkG263YPNe1
 bP/B8TiKtQfm10jo1itQuUAhteKbGauJah8ynUeeGvNcpJGt/biYCqGLAH2lYpYHqCslwPVcOPC
 vZr56N22KNiSYXbP+YVKk62kfVbIs9P4/rQvbJ8W+YprKEZRFPKbk6+Gsi2Kzs4rL8diRdq2bZ3
 6YzS+WP+dKKBMn90vTrCeJ24kjS5ESh0LwbaOjBsnN+jcTMYfqe37yW90kBzvXjBxG8nhk0iToW
 shErlmh63LaCO2Zd3Nb8Kp12wb+BKlMzWI1jL0O6EzVObsVQj5T37n3KsNDn5tB/biFD+wZQIUx
 OuwPBKkKY3EuUPNLp12hALyGVC0Tq1TB/H9UxgZCCOwI2N4myzo67cLmSG5S0l8ahkfEBv3r/0m
 A/fLFily4F+YtwR8l5A==
X-Proofpoint-ORIG-GUID: A95tKsOYkriTnotsVFAtgtFjW8eOcKE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220114
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109276-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF9DE5B315B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

There's still some trailing style/documentation feedback here from v3

Konrad

