Return-Path: <linux-arm-msm+bounces-100441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOyXLHHfxmm5PgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:50:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 507AB34A723
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8400B3072BAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30DA392838;
	Fri, 27 Mar 2026 19:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqAFcWcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgbq5jqf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0B5392807
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640894; cv=none; b=ILhmRQqXOY/k8A8MbLp/wpJH/WC4euqiNx2txTj4EIaI7UReAfDVSEagzqpF6v0Wqis0znMtOmzueDBIypW1s8MxRPvDJ1JbuRlqHA2XVXs96JA0UgsOJZR+agxkjqD/4BYQ7SBNVEXZnQTwPxg1I1nmbNcb5BS/WRlIxWni3fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640894; c=relaxed/simple;
	bh=MpSoii3jV82jbSoUNJgDJJmCPKny1fRSxjaVTVMDHbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RmxwWpLWD0pwDSUbzVnP1nR/u6BC7r1Sw+vM9x4UPtDFVzxppai12DDs48LitO2+SWHMLCJBYr4l9onu9Dzp1Y32dJuuChBZ/PxIFBsqobzNnMTJESzOxLpTVWhMfznGPRVsk6NzziFP53KS4JBlhGdUnuhqvoHaeKhV75IuxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqAFcWcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgbq5jqf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2bY83137130
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cq5dhSeGSRTlxYc8fLxHZcCtB0aiTwv7Zw2omJFDJf0=; b=HqAFcWcqS9cnccCR
	u+vY8xc38PRSmS5CQ4ssU6XVaQhsfGXR+1Wb50v3GGkPYjqYAXGtNvyebaTIP2Vk
	BbEEeOOJZwFS5tEzHWmIPQBiA0YMutfqAnoCO3lSt9RpaXFI4mql4imk1btn6PQw
	7jwhb/M+25ADRi0YhLGJ27yOdBi3lzshKMslDOr384Ju9hs49J4rAgM5CRf1L64x
	JL3laCzXCUJkMLTmIQ7Z8r7azzrOo1WMknqnMXUJa05V/VKJNlN0sy6gxP7/P/ru
	Kd9Mu3vyL4mAPexfK4UAyvaRfsHL1j/hEnWx4AtMCo5e1EwKBpZp/UXcBR2+1N3u
	PY9vyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1d04e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so119863921cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640892; x=1775245692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq5dhSeGSRTlxYc8fLxHZcCtB0aiTwv7Zw2omJFDJf0=;
        b=kgbq5jqfJe3eDChsA0MfoKdBFdIPfCvYF+bETDbNT1FXMHuwQQf1d8AdrzJx8zOaHv
         pAZcQQh1QTf5GQR8nz3T1BBR/EmHdhEYIVyHp65bMW2/O+uW3e2wBT+9Y3b7E4i6guZv
         gEcseGDv2NgLYgXmidw9fjHt+Xkpf5LKRmW0W7/mBADOkvaEcDwi70W4YB8qhQXZ0jDF
         krefrqJHvvpMyJR25c1giQPhQgKOw3lEZDyEbl4cQuD0CZ4hnbbQSr9gDw3JOE0R5lkR
         FzljO/GmIbnltmvwzMMxDe/oNC42HzphI0ZpsIhZgqCEjyA27TzBRhoWAZUQubHqOCjI
         Dsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640892; x=1775245692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cq5dhSeGSRTlxYc8fLxHZcCtB0aiTwv7Zw2omJFDJf0=;
        b=FFUeNoxPmchXgKvBDNj1p6QNq0LGWWajhTCKhECQLhNX/mr/TOVlnUm3eJAm9YRvCq
         KuIq6H6hqGaZp3VdVcllJgxWhMTwNdSNPOuBo1K7oduI+FqKWJZ+pulRJ76yu8/of5N/
         pKSEXw4EtLkXxeuBVqog9l+sD/zi4Ga/HE9n9VmISHEfGK35v2FSSQguDg7LfVkdVRHI
         iCEQEMIgvdUBKRAWo+5CqYbrrElnsa4cNN1qywy4eXBMcreHAD5KNcqqh4po1SsapZbL
         LvYxr8F2dSYqfYdw8VmHH+lo7esauYFB+VX6bN7Qzu0qMOxxLjQmM9eghC2RrwnL9PUr
         ETZA==
X-Gm-Message-State: AOJu0YzL2mto7YZwOO6OXq5WO1kI7tHq0xBfmUwQXYWX13gZ5xc3oLAa
	4MC+LTJWt8Gx2U1vyi6qG5qOjv9ORvGNTTd4yI7lFf8pEaJZhPbsdzhOeVyMgEiv4Gmv4J4M/pa
	UMqMgNIh0aqnqg4K3oq7L4CpFSUkWlMiLFfLtBpFrW+joAZNf2jlGcWiMs64E/gMRaoma
X-Gm-Gg: ATEYQzzNU+ZxWk/WmEgVY9ts20mWkFAcHATpzgVdLxFHZYUH62jJet2VD5nz45QFE6g
	GEWyl/NbG/1sGmSOnBsOW0+PTnKv3HJ7PmUVik3lkvfwib409NW3NsZ7vfjcI05SGq2PdUcKfOm
	N/9k82ajqIwN21uWbSLOx/BPkvR4wZ3Qa2e/s49+4HZx9QsQwD9dVVkEc4pW9N8dlhmXDJzMx6s
	vQFajCDYV7xDRaBX+LiueRgSQ4RXZ2AyuyhZ+1Drxa+buN+sGXVimqPHHc/goHoOaGhqWjcr5C8
	W+YeY2Q/LPd/Hz1UB4jTZA00UnqM7ssdlckUnm0QFfACbRHgtuDqU9VhGTQG7Echf2bcFwpYtHa
	FpeF8SHPJaGBSug6vOsk6tKkpz1Lrto1ADkxabGk0i2RtZ9L0SYZywt7k0OzB9MkLbVIWC5OagH
	6EgzsLE0cQElLPqfWrEj9lQOndyqI17s8s
X-Received: by 2002:a05:622a:514c:b0:509:a9b:8a6f with SMTP id d75a77b69052e-50ba391e18amr55909451cf.56.1774640892146;
        Fri, 27 Mar 2026 12:48:12 -0700 (PDT)
X-Received: by 2002:a05:622a:514c:b0:509:a9b:8a6f with SMTP id d75a77b69052e-50ba391e18amr55909091cf.56.1774640891740;
        Fri, 27 Mar 2026 12:48:11 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/mdss: Add a TODO for better managing the MDSS clock power state
Date: Fri, 27 Mar 2026 21:47:47 +0200
Message-ID: <177463970815.3488980.850210341944130535.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310-topic-mdss_power_todo-v1-1-59457b8b7486@oss.qualcomm.com>
References: <20260310-topic-mdss_power_todo-v1-1-59457b8b7486@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX5ld4wHQBakg5
 vl0iipMNNAwQ6D04CrlnRXZzFl0NMiYdcK7rP6GORa4Rq/4UWpgd0ftlkCvRd1aGXDxbJ9Cwq0r
 MVq25t8lFzyD/pCCwOM7YJxkq8qAB76I8QYzsIt4a1jJQPM+PvE6kOlyMWqBPHjMHpe1IjHeCuG
 1HpBYC+t1xWxhsDxSSiAfEO8PtdMmwq3tHBgP7AFHcDtDff5UatePJOO16NWslGA6uv7cpCzqgI
 V75u3UE+pOik3vBpTyLj03W+hIrOP7rdS5jr5i43wLc8R5lmWcixySWOriEQNpR8H0iKaR6WHOC
 P9fC/BouFIAzc2v8qEaw+UY8efn/2JvJmeJVtlFFli7IxsrPUxqFjCwYYuNJltg2pRRk4EMBXrF
 Diq3SynlDm015J+oD4Zz3NC+eOiy6rWWG5VmsSFsMnfNSzBauA/YqGhX5p3iKI4tkJSrTzNrXIX
 88dN2ptW9xrQAcDf6Hg==
X-Proofpoint-GUID: Q19Yti3emhKU4m6duZHI5F1e_AJR2j4b
X-Proofpoint-ORIG-GUID: Q19Yti3emhKU4m6duZHI5F1e_AJR2j4b
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c6defc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=pDP1kiaYlr0JOoOXNPcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-100441-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 507AB34A723
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 10 Mar 2026 14:20:25 +0100, Konrad Dybcio wrote:
> There's a small window where the MDP clock could be set to a high rate
> (say, from the bootloader) without a corresponding RPM(H)PD vote to
> back it up. This is normally not an issue, but could be, if rmmod fails
> to shut down the display driver cleanly, and the module is inserted
> again, or when the providers' .sync_state has timed out.
> 
> Mark a TODO to fix it one day. Linking the relevant discussion below.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/mdss: Add a TODO for better managing the MDSS clock power state
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d19faa0dcc6a

Best regards,
-- 
With best wishes
Dmitry



