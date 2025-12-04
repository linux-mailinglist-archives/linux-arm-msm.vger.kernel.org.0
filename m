Return-Path: <linux-arm-msm+bounces-84303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC17CCA2A54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 08:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F8C6301F7DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 07:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8369C257459;
	Thu,  4 Dec 2025 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9WF5EXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1rla7GD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340F22DEA9B
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 07:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764833772; cv=none; b=kcfDMMjJ8IN/TVx7ItJGTS8rg6LnX74leVicmWobdwoIZz0JPmsgUb8GrCOOc58MGlYfMbPnOOjoAaz2voODavf0+c1BJTh3DlM5oauC7S2Sr64CTVj3aRzKEFrcd2itg/RAbIEBxMenrv2GeG+PUJBC0alAcTNFR0ApSKQveO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764833772; c=relaxed/simple;
	bh=6iTbV1Avp+b8Us/NjhjiXgLsLr+dAAYvtSxnhZPE4Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJX07aurjSN5GMcbGvmwpDBIu1hRSvin0aWuEUWMB88z1iAXK6D9D/4g2QfjNRSFO/mp6bu5fGd2l8QValLFmtPioIAfgNDOsgNqO6vqqEixElh+YRA7soDJjpbYa79rBHZo3ic+CgxTNINn7qqLK7Y9GGqIa0ldVEMV/3xQzCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9WF5EXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1rla7GD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B475wnd514856
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 07:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wnJX94LzKELLZhLZwbS/kZG7
	oRaYz7n1iT/twqG3Hds=; b=m9WF5EXkF+BFD2pod7DZrr8fRHn3fPW9QTG/eaHD
	85kN2aJtXKomCFLHge9y3FDTblTVB+9wQK6arMR/Q1O8B/sg0u48jayBVbgOdh9k
	Tmhxu2YZOMu/HIW3oSFjcjkE9i9qi5ZjaV6Brc3orYpv7akiTLgYUxpuO8w4k5Ph
	ztf4afVMTt00QzaGCaWWrD9nikgc9Ydy/BLNus6bZW9AZlAKjFSeeT3yjKX+py3N
	CHJ1Dt/HCH90MhYQtBI00pzIeQB7itQYYuBTj6dEJz+jy9CEdHOsQ5UJBsYbNuir
	fuxTkeohQe9pON4srkaeDf4RJxQgI2VyVvdgtfCVqNf6iA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5m302en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 07:36:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29be4d2ef78so15925775ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 23:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764833768; x=1765438568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wnJX94LzKELLZhLZwbS/kZG7oRaYz7n1iT/twqG3Hds=;
        b=P1rla7GDu83Tp3XSTAQbs1eiqpyjy/9F+LDTOI7tQ2PJOmNCx/DFUqzv7LZY7uddsN
         a533/ea5aVQHHwXfsMWVwV3rV1IFSMAFp952s34/3b9UJaeAeLFPFwvWAIZ7B7bvvmA1
         Ixq8P0g19xRa5kRtj76ViWIRtPCNfApzuXmPseTpW5ddmkPPiWLwH1UKi5bIurdzO5fz
         eeGilZ1FRfGIGQNz3myQmGPzxR5TNcubYOPtBnwTJJFMbG6B859QwNdIgTYNIYCgkzKX
         Bv+OVPcsecBfDEbZX6oJ6Zgj057GT+vOVnk4pgNmrcOZQ714kuewBWjcJ+afkb4BqsZV
         ZRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764833768; x=1765438568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnJX94LzKELLZhLZwbS/kZG7oRaYz7n1iT/twqG3Hds=;
        b=H02hdZaERlbn/E8QeILST4+I+DktBVwkGfcuf2PZkqA4/9/LQxduDTW5zbbrCwTrJS
         WdFUYJEo8lskY2p8CB/2oME96oA0XvG4R78b+oVkQJ+F37QwKlwrmXPboCEX3hUL1c0h
         QEQi4hADXzfNAyY5pSiVLvmIjZmj2mYU1/pmIaqtc0qOy90Y2vuMkTptAPtPOQ7EmcKa
         3Amfcg4jRqwiplJjYU/0P4g7vAsxHBL4mqbEmDroA5oRUHXkZX7TiDXjeOAqvTMRR5ok
         mebWnJT8zNcqrC2bewM9UuQSF08np74IDHfA/uB2r+YtWMpblxZ7kouDvm4Y1uAhzXyL
         n8/g==
X-Forwarded-Encrypted: i=1; AJvYcCU/y/944F5+izulE9W+zAWbKosaoI/dmDfYsQda78DkhMu4OOcFAtaW/hqRRNNhtLlh07c93S0KiHGEoDrY@vger.kernel.org
X-Gm-Message-State: AOJu0YzZiduhTlM1t8poYSfoUF/s/zMplomOCrsX6WhUAPicnzYB2iLG
	Kwty1h36af+dtAvym+lDFYOs3kMFCKEygcCWQ8Z8IgBwjVs2LbS/mLFf8YlpnhKhkTOvesKNrHb
	LfpW60TFFTrDVXFMQgCQjvDUWmzQh/ilWnSIuWLoe8xrjEov1ochWkpsws9f6sFcPYzEo
X-Gm-Gg: ASbGncu6UuyB6THXVnG/u/+xX88QVmb55G9/fHuPgW2cFQhfpDWM/+7MPUkjnrfFEFL
	ZXqMdPQ2Gwwu2vYKmXLLFJnWM0dYQe5Utk93s5vSzfqnALGWxueKibd71tF2pJs9AOGfXfbxI03
	nmhDIy8y1nSiwnPE7Uvtn8w2A+GoHp6/lrNq02YqcLac1LvBOM0AmDpD0yu20KTAwDkf0Nzbepc
	PFa248x7nATCwT4l5lkFnzr6l9zunU0UZq58GSQ4EXmEEOKxdPjMUNk/9trU/CLzSqsS754k6l6
	op7VTOaxBkWK3IdpGTCiS4zfag9J4kTxkL8I89C4e+OvQqLpr4xnByVuMmV/Y1KQx/ciTjYFvK8
	FjkoXZNgFLZzCewZEgQ42dppwcovyCUqWLHmK
X-Received: by 2002:a17:902:f60e:b0:29b:5c78:8bea with SMTP id d9443c01a7336-29d6838bf94mr63802485ad.33.1764833767673;
        Wed, 03 Dec 2025 23:36:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGP3QDIvxinbeUXZyKalfSnjQ4MSNUJWa2jtfbiBkc8FlCIF23CSmxWlhBWgKVXniXV9ebxBQ==
X-Received: by 2002:a17:902:f60e:b0:29b:5c78:8bea with SMTP id d9443c01a7336-29d6838bf94mr63802125ad.33.1764833767028;
        Wed, 03 Dec 2025 23:36:07 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cfcfasm10313025ad.41.2025.12.03.23.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:36:06 -0800 (PST)
Date: Thu, 4 Dec 2025 13:06:01 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v10 3/3] firmware: qcom_scm: Use TASK_IDLE state in
 wait_for_wq_completion()
Message-ID: <20251204073601.zetjlfo4pcmqj3ui@hu-mojha-hyd.qualcomm.com>
References: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
 <20251130-multi_waitq_scm-v10-3-5a5f2f05a417@oss.qualcomm.com>
 <20251203083132.lpx63c7oium52sr6@hu-mojha-hyd.qualcomm.com>
 <7580dd6f-564b-bb26-8322-5c4a132f6aa6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7580dd6f-564b-bb26-8322-5c4a132f6aa6@oss.qualcomm.com>
X-Proofpoint-GUID: YA9rBHuLaWkIdnyHVRzXpC5mVnANIguW
X-Proofpoint-ORIG-GUID: YA9rBHuLaWkIdnyHVRzXpC5mVnANIguW
X-Authority-Analysis: v=2.4 cv=esHSD4pX c=1 sm=1 tr=0 ts=693139e8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UgE-ls4NO4RUxSF3eFQA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA2MCBTYWx0ZWRfX8cdEQ2viBFo2
 dgjZapqs/NTrGwYudFx5OpM8pSEWHAWYx3q8x/yOM0apOsE3K2qMpf2cIG5IVfe3TZDVh+8N3EV
 o5r3qlPWUuEOy9q03jlBDwsKplHp/AmVxGgmmZAxErw4bb6OdPw67tEvDm9C5x8KXM1s29AKfZF
 4BshptBYbsqezs2lp0tubLZLvb4+LyGNttw0YlIElieePmznZC3YB9ERkWxqw+MQF1xvY6Pw1Ox
 +yh9XTr0VIalJqcWvhuPf7z2oKc5ZYivhYl2itVGU0/Uo0HWZU+4c8481XE4XDzuZ61gBn+lIO3
 mIwFcID9lvDX9V9gtcUcoM2bSeuZUMmkIaDDt9SaPy/chapj7PQOKbmo9k1AVTavd14jNyv6MP5
 H+dOQlfUD9xRCsgzgRfOhRWDkFYskQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040060

On Wed, Dec 03, 2025 at 04:27:25PM +0530, Shivendra Pratap wrote:
> 
> 
> On 12/3/2025 2:01 PM, Mukesh Ojha wrote:
> > On Sun, Nov 30, 2025 at 08:11:04PM +0530, Shivendra Pratap wrote:
> >> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> >>
> >> When the kernel issues an SMC (Secure Monitor Call) and the firmware
> >> requests the kernel to wait, the waiting thread enters an
> >> uninterruptible (D) state. In case of an extended wait request by the
> >> firmware, any device suspend request, cannot proceed because of the
> >> thread stuck in D state. This blocks the device suspend.
> > 
> > Not only that, it is stuck in D state after holding a mutex, which is
> > more severe because none of the SMC calls can go through. However, this
> > has been the case since the day the firmware started supporting waitq
> > with a single context, which is somewhat acceptable as the firmware does
> > not allow otherwise. Since, you are adding the multiple waitq context
> > supported by firmware with your other patches,
> > 
> > Do you plan to support multiple waitq contexts i.e parallel SCM calls,
> > in SCM driver as well ?
> 
> Yes. Parallel SCM can be enabled once this waitq enablement support is
> in place.

Thanks.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> 
> thanks,
> Shivendra

-- 
-Mukesh Ojha

