Return-Path: <linux-arm-msm+bounces-109280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MOcD0pBEGqwVQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:43:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 923F65B32CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9E29300BCBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2543D3334;
	Fri, 22 May 2026 11:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtxv7DG8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIzGPtWN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F711DE2AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449741; cv=none; b=nxKZjooAhQO3csEW+RDYq1r/nsimU1E1B2sEhdJAD4tw4WfiwqgdGwBt8ow+eSEV1op0ex8B3451iwf+GAbFMyTZ1OG99Z/XmCuqJ4Cx+gZrEEl/Gxa3gcASbds5paCCIAIZl1I4CChJD3bhp3k33eTU30nRIT2UBXr0wgpII+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449741; c=relaxed/simple;
	bh=AOTtGqQITY/XIjOsM0LIoDvvBMQQoTo0PVchPP+BOx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ux7tgqx6Uw6Zk1XKgLQ7Z1TW33kXjBxZ9a01lWJ7YG6x4hXJVtIcbmicXdcrFqdiXdp15qMxZ0ggOnPaeCf34yoTViDs/5Ezrg2sFeZx7ry3coWTuX9kf6TUiZwrzHFI60lXF+FiTlMs64wxPSckl3PcH4BNXhDwUU9RIjAryOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtxv7DG8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIzGPtWN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9C51R3005097
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QI/blTowH0kaW2AM4jCG/m5oNq4TreS0VPu0Sj0yPxI=; b=dtxv7DG8J7jJ+raA
	uOip2j6Z2xYh7wx08NHYXEzbFLMMZ8grAm7QgkQYWv8poohJuPr95kbThi2rniOr
	ed6OLS0ywHQG57xaaGOEvEL2nVzXlRdceQrZedtBY92uzz6ejhMWPGlRs3Pv28m1
	lUw6iIqfn9ciQ7ZwvpFkfTRsdnVipAJGco9W8Vb+fjet5IsIVkYXWgfPovyZ/Yup
	X/0BQ8xHvAnu0fa/jkUwSb+IvHNC7rtxg0jIsCtQbcQHEh0qXaBy6TZFMyzDURji
	YlEUfvxo52SBO5BRpj47C5fGqTPO2bwFj/9Idq6xxAHp6gyrjdHFd91hk+lMKdad
	mfUH3A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt9rne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:35:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e62562b6aso21753021cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779449738; x=1780054538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QI/blTowH0kaW2AM4jCG/m5oNq4TreS0VPu0Sj0yPxI=;
        b=NIzGPtWNablpD2OGg2JHXHKrvfkXhqJD3bTh78NjMgEaUVZ/y1xJCZIkZ6YSDgoeiq
         dCdym3UvKbFjr04Fg6uY8QFXHxBBQOIKSlg98QEwOOGX2x9klSnlOc8zuFUFH2Nf5efI
         DhpsbSuIk7dFjLcrw/0YWcNqJZ5RQ8wRQZWjDeTGZstNrZKtdQrXfO2R1EJHe0PhEsJu
         x4v8C3KhjrmjgDHC41xL18mVEvxTK1FJtNJYMnNc00WJQELmKHrKry3JGfwv+yerO+mJ
         4wFJjj4RoQ8KsxT1j02b7Ll6a8rtEr3B0SYLxCfS/szKk29O3QocGjw71vBhF4Eiw71q
         MSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449738; x=1780054538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QI/blTowH0kaW2AM4jCG/m5oNq4TreS0VPu0Sj0yPxI=;
        b=d5NVwuj34aeIjrxiH5dLVsXkXZxzNjqGrZWJqYmWlqjElF1pEPzoqX9RKw2sfBu162
         kMYhlnc/lNZ8kG0FG5wXoSW/ddfJsG4jfxDuKOQKsSQuPuVnV7GlaZzpEPHHktMeW/jP
         wtVM5VxplqkivrukNUoZpuqJSdLE/B/dSHUZyGOrCEPsrIt32R73bnodJvvqh4asOoUz
         h1M0weHVS4PNIeC9bTjSmUjHK332Qrx8ursXEOsD+wu9DGj1oDgSFZ33xGKqE/CiItOW
         MrJ32YwRSPDyTBAdDG8vWgxGwFXFnXY7QnhUzRp+kzxmFf/BDqXoAODp38qsoijtqvvJ
         eX7A==
X-Gm-Message-State: AOJu0YxOHYbcj73Wyddr9GBnaSlwjsoxzuLGD0CFvkqE50S/1l/Sp8By
	1WUoUzNB55uOnkEjWse+zY58yNOd0fQwijU6sTnSItiN8vMaVenZCEMs4iDg3xLzpzAf/dkoWcD
	Hp9cueEmxMvF7RqmVf0UUErNTzqr2GzJfqywQjapH+G8EWpZj6f/5s4sw6750ZgrxvZYo
X-Gm-Gg: Acq92OGculamrR3e3bCO1GpzNGDxR3Ghv0q3H0TlKi2/DpvWFSLKlzP2MUX5wVR2fOt
	2AMf1I2eauTvwPPawtyrNq8a9fcdxQNTjzb4ugqxcQigqu5JdUc6ZtwRbPiaYODX6u5eMTy1S6t
	cOQ94nmBV8X9YZEUMOK0Ji5iYRi6dYjNdtU/Ugn9xDpTIl7U+RbxfIt9XxoV3Pqj335SurwQklY
	G3m6WPiuFWT9Diz1Sm0HHhIU/aV97g3NSeRUPu+GSK9xxVKKdrs16SddNERmRXXgnBHYbTS4/r9
	aO5Dq9yXNN0nH9WrToFYDMB6Ym69BLHBUDgLQ2zPnGD6bA0O1fF44noF4yVnweuk6+fJbpZoYWx
	Okj9zpow0PTpweB9TIkNqDRVe31yyV+80dtkgKyUb3WWmTA==
X-Received: by 2002:a05:622a:6116:b0:50d:9138:3322 with SMTP id d75a77b69052e-516d43f5402mr28910171cf.7.1779449738406;
        Fri, 22 May 2026 04:35:38 -0700 (PDT)
X-Received: by 2002:a05:622a:6116:b0:50d:9138:3322 with SMTP id d75a77b69052e-516d43f5402mr28909981cf.7.1779449737904;
        Fri, 22 May 2026 04:35:37 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f5db74sm567957a12.10.2026.05.22.04.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:35:37 -0700 (PDT)
Message-ID: <da75c570-8353-4a0e-91ad-d31e0c4453d4@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:35:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] drm/msm/dp: Drop EV_USER_NOTIFICATION
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
 <20260314-hpd-refactor-v5-5-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-5-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a103f8b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ls25Rwon0kCaizU-UYAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExNSBTYWx0ZWRfX37VGypty2Rqj
 7eBMmZdoAbRdrTLhW5KCbjEMjgvCst2p9RmPKN5bsNYawX1o7fqzMmbT6og+VPS5gEqjASlXqI0
 /yzKqZS4LeFJ7hpgtUzxM0B8ct3osPzcfvIjJqd7pGMbbsDBg4hbv0HVF1y6t/b9EYemxYo3woB
 GSGqZbFJWzrQKzBdWMZ8IN1sNMOpdfY4uwB/lB0Kj2ALlIywvcEsOEEMWsA2sN1WGE6jHo6yptY
 3RoQ2yenUgGnRRTKKYfp3eHclpZPetV+AW4iBSepR7qeKgZ5y+qjLm1Wh2siWAy0v/qIKz4B6Tp
 RjibAZ3pvTKAJVmeLKCABrSCmJWXAvNNzeyM0BMOWCFqKe0Bo41dim2YihkayxhgdG7s1wHrLJZ
 bfk7MAVSnSWLn+LM9h//doudHrqgERCr/L/ZGeyUDoU4pX3QhkJnzASyE2ALN6dw4FhhiijM2sk
 3X0AxStYPC9rK4mwvtw==
X-Proofpoint-GUID: EAMsu3OOHYURD3A9ul1o1f7IOOw2jQNt
X-Proofpoint-ORIG-GUID: EAMsu3OOHYURD3A9ul1o1f7IOOw2jQNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109280-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 923F65B32CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

