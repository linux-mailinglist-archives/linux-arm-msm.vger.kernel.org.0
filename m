Return-Path: <linux-arm-msm+bounces-79288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B651C16E64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E30B4E3398
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47E12DCF46;
	Tue, 28 Oct 2025 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxi08bX2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+TmEca5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BCF2DA75B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761686134; cv=none; b=jqOXXcowIwytN+wRdZJtHzfsIdvqtNqHNaw0YnZhpTVwj4XElVrGYa8nmulv4avjiudwGrcL4Ra4W4kwoStfrXvkz/3wiTgkkZOl2Owe/LgO0x8Lc5tw9uekkVIBLzYrjoymuD5J6hOVNX99S1WMv+sUcLsv8w/uxmO1gFosFjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761686134; c=relaxed/simple;
	bh=1SLvAEoZNQRLDp+XCv/j4QKTk2SclYwX86Ac4+yNShk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbDsmNv0fbcW630uNtmUVv6m79XkgvixZ6SxPO0Vk0Ucp2JSkFA5IHo2XhO+bDgMvM532hVBamDBpEUuSo07mxm8YI2Lsb4bI4hwuqPgytEBhZFhfaK7hS6PCr+0xUX1fYKO193ZdSqP9ErScz+LFbjKNbOcw+t4dQN3loXjtT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxi08bX2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+TmEca5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlTfU2523936
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QkpH6v9dp0MRYRL2ohSXE3M+
	TFxAVIa572J76dWKJgA=; b=nxi08bX2IU4RaynuB2unIXksIEnyXSImy8QR3tf4
	wW4scOJqraycDpqGHrXSAQb0NWJTRBQ3879pjBeo6WtfRbd5GNaflYIu4ONOfthM
	0UclQFVLgXg7lWUupC6gZkcAwggCVMWB8QqDOFcAGLn99cZLb5yS1sm6FFkvGU6l
	4IdFYvhYxIZk+SmMIuPeeGUKXD1jJYedd7L/hA8gmNuV5sjbiGEb1OOPpJ0LmL3F
	Ws1MPTnVhMr2BNzihnGtWx91/Q/E2iNnE38hE0t6gnMqGYk+Bjvr1an36a5j6Ekr
	FiOSazzsg6o33kFGxRQx2KSIpB0CVyCmhp6prQtkeqnNYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1r73a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:15:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e899262975so202063431cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761686131; x=1762290931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QkpH6v9dp0MRYRL2ohSXE3M+TFxAVIa572J76dWKJgA=;
        b=J+TmEca5qkleqQ1WJ7t7e+d3ljxErLpuxNvS7rx9kyQLB7safComikPqjA+8RY3ugf
         asyx3mWkgSkssjvu1dxZ4Lu39yHtE3G+eqr9faB9ZwDutiyQe2Afw0mGsLDN7F9B0ZEW
         ZxgafqitjHlt1VMJCW2gQ4aiKiKeMEDZLOcCYrYzwDy/jyJsuS1qBT+ERgZce9nSta77
         mWZEdltqs/5p1WxY4y4TH1RPwVQVIztkdCfT9tIYopAogiY7Lp7OVz8PhoKoztVWoiem
         HFEHKDpWU+cCQWbY22GuQFU7+5BM+UDt3TtOhDDdJ3OnNmdCpV8n+xq1WXt1tw4foYW+
         Om5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761686131; x=1762290931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkpH6v9dp0MRYRL2ohSXE3M+TFxAVIa572J76dWKJgA=;
        b=HaH6nyxlUTKkVD65uCt7pxN53nTg7l2MseWn3FKmh+wyFk8eMbSu6UTt83lLZAjwMZ
         dZylnOQCQt8ywDMxCxvuRD3QG9LZHCL98zVRPsU7Nyo2+Cgl8aXvpJ/IcJgcBNCBsdSW
         JRv56eVV/66sfg/BKuasxnO5WmXzokfxqPoMOUEmgzDGtrFg2Ub8kFL435Q0rbhIEdBX
         cvK+dPeIW+8vJL7Xco37ECxV2U0T6+DRYIE7mrHGxotxuvlhKV85XOxJtJ6tmqgWX2Mg
         4AEmuFvid19ZPldesZyJ4bLw+5SACVtDu/uaCUeMybX0284FNSEbVYKuTG21WvwyNkSw
         N3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVvWTeGeskFkaj3WlB13yhgSGVVV93tqikWaS0WMBdgJvmPXYos3LO35GgIsyUAd3HQdfVz/qCdnRdkqTru@vger.kernel.org
X-Gm-Message-State: AOJu0YzUNfvSM2qPbDwI/EY00JlZsPMjmf123hoqiyMsOA42CRiGYA3d
	qOaJwhwUWkT6XUw2nSffNpVYfLQ5FWL1lHSXCh+XmWKA8ADnqj1+L4lTqUw4NbtvuKDhH2Kg2rW
	DVdSGyK2PKtPI2PrsPS0Ug1IDkWAYmRiGgJBZPZIQuDTw5Wn4LgbDL+5KOqz0PlOcM6to
X-Gm-Gg: ASbGncsblRTw0Ha22P3OO39vGEAD1d6QHRT5c5U44o/AwmK2CqTYPmvg2ij0utVPl/i
	lVgq+RL0b95IhqRT62im5Q2yINcYq3p9QLWv5Pgu8m3APqOm3kfInW/HpMXmCckmCuzKjpIhoQF
	G1XOUI3S4pSSy/0FLrI8nzTkL/R8nvf2fP755h6wOh9aL8mAZ+huT7qv1UyG410shylJdJuoXPX
	qrwYTFvd1k6DNSec33D5VEbb1bU6GvD7jf4H04Az0PwM8tJicCLSdl67wB2pYXhiYCFdjrYqMub
	/Jd1Mxt8BE98jBoiw3ishERRcfGdUW1m37FeKZFqFoB1BQxj3azEJos0D8SlZp+tC3CdRxnHp44
	gjdjqtXasFifNsT89QKMVTVDoNc+FVFb1lj/O0mqD9k8w3xCmwYdKl0YnmClcMBF+i6900G+iP9
	jvxF0jHRMPvJTT
X-Received: by 2002:ac8:5f4c:0:b0:4e8:a389:dde with SMTP id d75a77b69052e-4ed15c41cedmr9753721cf.69.1761686131529;
        Tue, 28 Oct 2025 14:15:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKCbOyz6J1IE9zwWL3LnWol43Zm3I7im5kTE/fmtuzRYUCbnmOO0TzpIxB75SnE6oGv5I3rA==
X-Received: by 2002:ac8:5f4c:0:b0:4e8:a389:dde with SMTP id d75a77b69052e-4ed15c41cedmr9753391cf.69.1761686131083;
        Tue, 28 Oct 2025 14:15:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5093asm3285266e87.37.2025.10.28.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:15:30 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:15:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Message-ID: <r5zjb7v2ngsbx2y63tmdhnm4gbpla5fki4uzpjhvn7sqmzsqi2@7637rbudt3z6>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
 <20251024151521.2365845-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024151521.2365845-3-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: L2uBckNiRwxrloZDDntwUylCtMuVFzi3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3OSBTYWx0ZWRfX9ZxUK47ZrM+p
 mUHp5HGdjxM+E2+4H645w2bjkCbZGT3r9steKBdLNpzz4tCMQjtf1sSNgXkBFgK02ztJlnvLkb8
 QCW/noI9EMS4sWf/yHwcSGWjsVoTCMlTH1ZUfzvfi5xiJy8FHbZzu6W/kThA9B6NiQANDb/63qz
 mNYGPhNmpMDdox01JmJdeVhmFsK1UhQgceSqrgIVdThBCxPXUfOyYB3hXurRLuc5epYHrcBdrFx
 tzDJH7YXAZeGvqmTB2gOzXvFJ7hDZzfAy3LSrakvonMa41LsJzCgemc3+AVoMqjE5nA22cI2b6n
 s9RKfA5UXJhLcPlnb2ddqizfqguNo/hjk3JCif+t0RXD5ljP77SvnkAcX0Kuv46ZAbh9xluhYfO
 36mnb+wxvvNKUGJrWxx5rLzl8hI5rQ==
X-Proofpoint-ORIG-GUID: L2uBckNiRwxrloZDDntwUylCtMuVFzi3
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=69013274 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SMp4HK0SL3UJoFr3leoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280179

On Fri, Oct 24, 2025 at 08:45:20PM +0530, Krishna Kurapati wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> Enable USB support on SM8750 MTP variants.  The current definition will
> start the USB controller in peripheral mode by default until
> dependencies are added, such as USB role detection.

Which dependencies?

> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> [Konrad: Provided diff to flatten USB node on MTP]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

-- 
With best wishes
Dmitry

