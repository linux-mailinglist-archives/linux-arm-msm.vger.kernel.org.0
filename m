Return-Path: <linux-arm-msm+bounces-59136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAC8AC1490
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AA4EA23F46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648BE2BCF47;
	Thu, 22 May 2025 19:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRhiQbUd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1C629CB3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940960; cv=none; b=JWB+Yp+0dt68NDVBYq+kfB/XHegOaNThcq+P3ZBxmLfTTbjrEkobKqMvOJg1hoE1mfGEuV6UBouxyE6m8c1ZlMIT6x2kqLR59fYgnGRd2RRJdabuFqspvftg1m5ahpv0gpdm2f6bYXHCdgJmwKLDAA9EfZ2QJV/Nh49BylWXPPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940960; c=relaxed/simple;
	bh=iR/ei+4GCGFyzSKBBR0B/UyQeY7n58BxQ7bQCa72dRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ76E0xrqurkZKwz9dmKExu+NE2FFUH3uzexTPGbyuSa4jJc21tKCDlieIxPV4aotzWgx6bGiXNugeZsl3KSX4cP7x9Gr7T0GH3KtBzA63/azf96ca8nSiwKGKfr3Dy9147CBHvHmtfQBjKUcC31i9FOy4pbjXa9dCS4i9RK3o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRhiQbUd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFM4LQ006602
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kR4XZ/Uqh0bO1jSX7A4FytxV
	cw2LfMFSByGLKy9VaL4=; b=jRhiQbUdIWbT6Wkk7y3evz5vM0y8dyEA0fiK0T9j
	G1rQcXYKzuGKqxqoaZOZBi9bFU6kyvgj9jQthJVdxsk1CnrdocTadPxjBFZJUFgc
	mcVq5hA+fgCMgJPT+PZagsBs1Ldbt6uolXwxwOUCJpja8EuOX6El8bZDzk0xyZJM
	aqGYidKJTQcVgmq8VXWlSPUSTT+LVNeQTSj0g6ZDHdKrfU+YmxOYdN477QvdjZde
	IJKUSivGoE9bVm/sWr0qblMgC+od/rQlWzt4AlfdDoXc1AtCCnkNgzaZh3Gi5oQ1
	dS7D0XEO8utuAS2hl1XLjhGzkf3su2LC6AHfBGCn24G/oA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0qm9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:09:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso1484804185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940956; x=1748545756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kR4XZ/Uqh0bO1jSX7A4FytxVcw2LfMFSByGLKy9VaL4=;
        b=xKEYnGJzrXZ2RtkxjTqIej8oqAIRUyiGfnQ+kTEZJPokM163cbkcXTdhnjswwVv4NL
         Id+FqF+gJVk2aVoTOS3cYSQiWw84fpgUx/UZxmZtlVsMea9Osjt/e3qMdoSCDH6JjrxW
         4ybhBJJFNKkvE5JSu32ubq+WOEPskP6THinO7JO47CTGc34/LujP1hD2vmRYoroKa0qi
         1xUFP26Fxtv2iBfrmGFt18Zq7zy+tbRY/jVAW8hma+G7N6S4+XXQA1RwMFR+aQzPUza4
         hfOVgpGd0/xfg6xyqo59CtrAkjUCqSAUxAdRlMl/y9YtP0gbqSWB6biZ+SEhmg28PLIX
         5H6w==
X-Forwarded-Encrypted: i=1; AJvYcCXqzF3znGggRyD8049a3CLNXAxKT8w86Rx0IXW0Hac/4l78GOEIrcK5HhfMyYJUXScZFfqwhXSRGEi0xCNA@vger.kernel.org
X-Gm-Message-State: AOJu0YxJm+XchtTgvh9eRwjMOGnXA+jtKh+uPccF1qfUD8Yi073VAIG/
	P0emlZBGuIKAZbzt6Nl0baiadlEvFDPne/HJkLR8MAsqRUPIPUe5sn0DKBYo4MSeUULbR6AJcKD
	INukUgg9vDzTcJX4msjpCg7b5UEzVs+uPKi/y1O+sgZB1TRHtPZ5gfHEw73GbVwBIZedH
X-Gm-Gg: ASbGnctqf2EHzlYwYcXXmBSPhCwsjFnBrLd5sHNASaLuVLFcWnHrWoq3pBhmhPvIvZ+
	EzzqO5iw9UBwbqR1v6Z3BSzXAPUql1e1eprEwU0hgEvqLW+6FiZx34H24BrupMQQ64YZvdMXlqX
	SVV0V//RA1tg1XlIBeU6teF7/BPfzxGYlQRQBJPM1litGPxWTbCHTCW5N8ZCARn4aVpNssXagRp
	qbalHBMw0EkhGW7ERTxa+Iog9M2uh1DL5W3NsqjwhDhIPOevlEO3tlKGWuFh4CHhhr6yGW6SynI
	fgPgQ14wH0jVVM9lO46q8N1UpBgu1wWTZt210lLGBwpvdtSZXXQcEglYaKl8GJBgDbRnD6XIYt0
	=
X-Received: by 2002:a05:620a:4446:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7cd4608d095mr3152050385a.0.1747940956334;
        Thu, 22 May 2025 12:09:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcwp9Lh575kGkbAvNK5+YIa2S86CpRt5DELbK2TDbmJcyvYQaP/lTl0n4FCeBsrJ+aoxyyMA==
X-Received: by 2002:a05:620a:4446:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7cd4608d095mr3152046785a.0.1747940955841;
        Thu, 22 May 2025 12:09:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6e0sm3542537e87.223.2025.05.22.12.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:09:14 -0700 (PDT)
Date: Thu, 22 May 2025 22:09:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: fix endianness for QMI header
Message-ID: <vf7fb7jxxwy25wzow4pbzvh26xqd7hkx4edqmcts2tzoyrnxqs@u3lev7ergjb2>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
 <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
X-Proofpoint-GUID: zKrar2TwstB2wQNIRGrfpztFAXR8-Z1I
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f765d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=XW_CCpt8tLB4Xc_L39sA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: zKrar2TwstB2wQNIRGrfpztFAXR8-Z1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MyBTYWx0ZWRfXza7Ulxlm8diG
 llYtOwtHdWa1Ifhi1BENNSv1nOWqhU0Nvk/mzIFyKcKqNtlUZeJy4y+Md7tHKuCcovUlHIXSEoo
 LYpgyBhyzr+LftUzRaAIdNuqNNgw/3aFPw0LEDTzHRViLNRuZJwrT4XQuex/4RpA/KlkDO5VU3u
 479z7rhP/G8sgNOcG92AGFjmScXeV20RzOnbHqN1qOwNKfZtogzoo6vlbEqCYa3Uj1d5hVYoSNU
 Mp8Id6ya2oktkgNF6Bgg28UA9xhLLRS3yHiOEYFtXzTSnMkwjJyR2rpSgNsQNTpcr3lAtMO2Bqv
 lk7R9zUyjJ0t+suJJl1wgTsuASZZasGyX/SU8KRP45YcG0nrvlp6KoM5EYFl7ItTFI79RYSSQZ2
 NAwQ4F98n4DALTnqRDlBEWTnKfBksnrfocuEjwb/FjvUND87+Tu+FvFWK/YiGhEWBMoNKDYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=736 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220193

On Thu, May 22, 2025 at 04:35:30PM +0200, Alexander Wilhelm wrote:
> The members of QMI header have to be swapped on big endian platforms. Use
> __le16 types instead of u16 ones.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c    | 6 +++---
>  drivers/soc/qcom/qmi_interface.c | 6 +++---
>  include/linux/soc/qcom/qmi.h     | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)

Just out of curiosity, is there a usecase for running QMI helpers on BE
platforms?

-- 
With best wishes
Dmitry

