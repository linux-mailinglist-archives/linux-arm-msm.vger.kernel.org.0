Return-Path: <linux-arm-msm+bounces-86522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77270CDBCBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FFEB30275C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F4132E737;
	Wed, 24 Dec 2025 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ok9KKlV4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ioimDclO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE23330D3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766568474; cv=none; b=bopTwmAB9zFxs3ZaTvibpyVnabmMmXWvt3eQkEqvqldbWF2RXS19xXe+j6QQSHpFzVoaj0Y9mh3uVWss4elIH94//wA0Y32FcLnOm6bbG82FrUczoaWPVzvyOHyGnsGvZy34P8WuxhdEEzZNqz5/qAUxajC+L9oSeqeYyXSdY/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766568474; c=relaxed/simple;
	bh=IvZRYX5vx4jYaqd8MYeonPEkxRp+cxTKNDVVXG3VJKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VD02Mf+dcCvSmZTCKav4HW6uGTDxpc//JXw4iEHElTAsNplj3ij0eNE9QNYixjMd56djcWu4AVoNfZ9UebJVDZEsytX+vBJ+l7gTgZBjLjeAeuPVVl5KrfICsdcOTDUOc2sfWIsZG7IXTnxwOh7g/7NO5tj8CYtPdSus8t9HEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ok9KKlV4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ioimDclO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3iJBh4135043
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8k+Pmhnyb1OZaX3h7hgT/iEpR5pAnzk+zg0S36ixSo=; b=ok9KKlV4XJpKq17N
	JYsY1Fr9t9IJ04vSV89xh91SV6+VicJiRj7PpygLUVl8nro9knv+3sJFCt2QKIyG
	Zr+QLv7q/1+IHQJAWxz8w6KLvO8stQ6y7XJWei4sjGbSR3/AM9kAkwuJ+8BMFU/E
	L6XI+7VmjhDPd2HRl53Q2SoyLpfn4dD6kcOA+jkfR+1+GXQC0Y2SQgi/WUnEtgl+
	iaCpArVRavfKJqPh15sOTsYi5BPddmKJY2a8B713qOjONSI5TjuKcynp3G/PYGac
	EKmJ2vyhJ8J0xZBUltsXXfLw6vUxatmxOHdphtHGvMfCqdPQpPok0TnTENS4bzLR
	bgpv4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46tm3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed782d4c7dso100205281cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766568471; x=1767173271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8k+Pmhnyb1OZaX3h7hgT/iEpR5pAnzk+zg0S36ixSo=;
        b=ioimDclOqPphNcDR4a8i+/OM8bq5fn+Ttgy3Sq4sg071qZsNlo2eGKi/7JowRtAiP2
         kIJYMQ8iag6vaxrd6ShL52sMGUfHEZUvImOTqESYQctIhG6tmocCLrMcQ9xzOnks/jdM
         CIeo/qjvGza8H6odSSlcXuMGWb7UNGwXvvpx/ifRcgIrBvyNvK1P6EviRunQs9aL/sa5
         jHiXQ1q2y6Y+kEGb5zqudqQpqnzTqJIgtN6iM5RNalVdXD03smunrN6WiebkJN75nMZi
         AnPXe4qoHr7u/sE356Ho8nlJH1BAxDwVTzlsSwIAKqW1+zoXUF2bbkTeqbDDN32F/ZGt
         9Uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766568471; x=1767173271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8k+Pmhnyb1OZaX3h7hgT/iEpR5pAnzk+zg0S36ixSo=;
        b=S+shNEhzTtrXdTistNkBnQ3cI9qvBODKA8MKP4oItL95ZRMTqYr4j7KYaIQIhNqMP0
         obxfiFTgmwkQd61MVeFqjvlJQbk2y4kDvhdEt0YQlksNSEN7DSPy4BY83wlv1hu6+HrL
         qfnlYrD8LRDnqiVMIAj6WTXFEXldFkV5K2iZHzzyOJp1bvprZf0l4uQpBslzVRHfw+jv
         dkrFJpkXLvPaBPJeqNVt5oKYYkZfSAZR/Jzn42ordeuYH6z5FYrcoFb1iiW6v+qQTsJ5
         qYy4/qbv4GVBtG1qqrDJ6+zvXWlbHZvQ8LNJHFM6HqYsTVXou0dgaNQMfjSokji7gNOu
         MFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVriEhwG18Wru65s0KaYTyP/OQlbuQ8gw6nY73YTiXezcUJ+BtKPNdJELUbI45J8dAv8NDdVplEdjf7Qb/f@vger.kernel.org
X-Gm-Message-State: AOJu0YwVmb4bTPbN2yyCDM1eR5N/t7PtKDwtEfZFfIaswUVoAWZFub+X
	bnPEfuEPDwrPCnFMMHkOQgw8fJ9fNLOjLzG0HiLNEBVzov4MM+FcXQRaeFQJI6APXSil1Qc2GRE
	llL+BrE1HVjAnhgrrkCL2mu3l2LY0jqtZaOrXHTT2KnupWB/cJ7lVq+Bnm1B496TJPoCM
X-Gm-Gg: AY/fxX6HOpWUv0CTA/LtWyPgkgSa3++LA4/eY0dSWUKIk7T64ZtWe75sVIZkcz0ZNiS
	smMBjim82+8b2sggJnpIRfwiDGXnt3uxFcIHbSFReS0080wPGyAmmlMdkQqlKuvfZkme3Wuk8Ls
	ymYd/AR6nwZkCGcjZzkHKQb6ucpdPI8QJjqgmtUOWHmL0MHLKLWvGhURq0X6bXxNYzgDQaN6Ns2
	4SRk+sE/fjSmqJmBe80n0UKFKf0enKgI4v7mOVTs1Yx1oS62XD9BnpKMPTO9VnzPSdmZh3J4Xdl
	NKlJ6FFGu1BpyLov6pTNsp94mfWrnTc409bMcCvLooxy5J/QZsqKLQQXKw5wseTWUZBNFQ/Nt6K
	F/dsa1TplTctoZ5nvZnv4Zf5yE06z9AplAPDWJvRIjpCVX6ZYyEqxXf+pkh7Z0LMlmcoDssYQex
	q4DtlFNhLpBdfzFQ9GHPAhy+A=
X-Received: by 2002:a05:622a:8e10:b0:4f4:c0ac:6666 with SMTP id d75a77b69052e-4f4c0ac7d89mr120700971cf.77.1766568471106;
        Wed, 24 Dec 2025 01:27:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnEB1jS6cRWODDStA4PaW92yVJbmN21zNKm1NrRAJ2+26mthUzC2q0CzqbuPSiUBH5J4EUXQ==
X-Received: by 2002:a05:622a:8e10:b0:4f4:c0ac:6666 with SMTP id d75a77b69052e-4f4c0ac7d89mr120700791cf.77.1766568470698;
        Wed, 24 Dec 2025 01:27:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:27:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Nikolay Kuratov <kniv@yandex-team.ru>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong interface
Date: Wed, 24 Dec 2025 11:27:44 +0200
Message-ID: <176656845705.3796981.3831136316758674761.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211093630.171014-1-kniv@yandex-team.ru>
References: <20251211093630.171014-1-kniv@yandex-team.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Sp92kJLYXfsNjTRJKg_168HxCEa0Umdm
X-Proofpoint-GUID: Sp92kJLYXfsNjTRJKg_168HxCEa0Umdm
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694bb218 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=q4VHR2A0D8CO_ZJfzXEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX52VWu2nVTcn3
 jVfmwI+NMUm2pA1es1iUO6FO9YQr6vb/7lMv4CXSRtbwUhHvdeM8fjXkPO+W/7p9tXXjtTr7U+k
 PXTtMEWNyfs7f8bOkTVeXTA7JlQi0bfbIQQE3x5U0N3ePcqCmxbb5OJNbhbGZB4hqZphQLTfc8C
 oS2r/v0MXzxauZ9ypVnoPqGp0Gq2Jua5GVysume1GT7UvUwigEcgNIxjehVqFnnyRAtTuDSO/Kf
 v3gf3/CgopQd7db+C/2hw9ks4RHfRFXc1mm6z4ht8HBGaOLHHaw761aC/cZX1uAYEFR+aHTK5cj
 gq8JmzMpX8ycdHbgZ6yYVU9giz9nWo0QKZh8bNvwTupxFv30FI0+k3PFDy8eDUxqbL6zg6eOk7j
 7uYolyPo+TMKYQVQvfOuBTrZm6LpEvUSb6YIGHwHBcJ3v35WfDHmT7tmTbkF28rTlUqrEojtBy5
 QXmeqkiyvSbE186sLVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240080

On Thu, 11 Dec 2025 12:36:30 +0300, Nikolay Kuratov wrote:
> It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
> single place the check is missing.
> Also use convenient locals instead of phys_enc->* where available.
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Add missing NULL pointer check for pingpong interface
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88733a0b6487

Best regards,
-- 
With best wishes
Dmitry



