Return-Path: <linux-arm-msm+bounces-62639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEC2AE9D6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3D6A4A1D8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 12:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F27D23B606;
	Thu, 26 Jun 2025 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYfEs+yY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76196214A6A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940833; cv=none; b=SUvRTvMUA4gFXSJBfbmIEwsQQ3E0sJq4UGF9nRxVOrBRHcuzlcib5SrjTEdAyuqUp4FeSx2FYSXKW1VlhLdR0agePUz0LjI7yoVRAI5XGJcwqY3A4Ha6yNpsvwhKeV+tKAyFcIM29D+x+TIivFjtuNt5kcbQnYYCy2Hpngozbso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940833; c=relaxed/simple;
	bh=OeUXM4PnAiSmHZwptWygkH9IPNf5qkAr4wW1Y9Ro3/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6vMbYHm2H0soZEbWK/r/jsBH2UKwXE6uyhzCUvk5ora69sM+3I7WmzMnyVptOl/Rrol6PzpIYVvCB6FTk29UMaG5bgspV6GYs8mzVFamjFW2U99TROwKi9XayCkHKY6Ed0vuBtu0Yn4M/eQXiM+zExlYXri4ZpLTRHF7fETsG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYfEs+yY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9YFxk021523
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 12:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z4ld+nvIY43lmGSOTvBqUnW1
	/Skj+9qjlyioayiU/uk=; b=IYfEs+yY474NZPBK6U6Z+R0Ufasg731pkB7bfpur
	VRPpgLw4daMNjA/w1BJMQ+4thwDrYuwyTndkvabJuU/I6DI9GdqpoRL/720IRoYU
	U/LpC9Any/aINvhjlU/PyizpjJNx/YNhQS2U2M5/hjExJEHUIZk17LqquDS8nP92
	/NUyE1ChzmaXJSRu7B5xDGCc2SEHODUyEf0o4JKPXFYbkHHVstyfxPHZdlYOoX52
	OZ3PM7MHqJE//7VWcAlnqzT4p8wmjW1DC5EmseuBfbfUf8Dfx27lOExjkV4egRSA
	0UK7bc29uU/2XeBdiXREcs2bdJVWpr9KOLZuB7p6YayAmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx1jny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 12:27:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so164869285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 05:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750940829; x=1751545629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4ld+nvIY43lmGSOTvBqUnW1/Skj+9qjlyioayiU/uk=;
        b=Ovuv+ZFjz1mHW0/f/pt5D2j18Z0gt8ZT26ExbEHtjJWSNFUEXc9Hk75xJFyfNaJeSs
         H9ZGN1pbTFzvcZdEXM5ryABblUoufcRH01v/6B1Nq0hZdma33nlzsmdir90wp/M4745t
         tJYiSfug+Ft4g5OVA2017nLCrnHDAtZocn+kBqo2OO9g1pA8g5qApcoP8cKH/ITcKiZy
         UCwuu1I8L7DsTaqzlYOq5kp7WQbZQ7cufl04Z1su3Azmxg4hReicuXh6L6iISr7q0Ui8
         H+w8bwjvZ/kKR1qXGsa18U3Zsb5hfZ8j2oUfV2WMB9MwLRLAgfPPWGlZ31Ixj6f9Au3N
         2NDw==
X-Forwarded-Encrypted: i=1; AJvYcCXLz1lwo2ivPS0M7Sy5jnBFhLEyUnpwSgJvee1+TpcJE6WB0b4k6MDQxRk/o5PKArnDgDS1OIUS/XTGrEPd@vger.kernel.org
X-Gm-Message-State: AOJu0YxhGobw+Q+gWbtS4ordVk8uovMVe/st51QZtwBgILv7WPdYPd+r
	/JTTn9hRsFrsOYFiZb+GQyuAKC1fAFeb00RVzYQnx+fU+8Jm9b7Aov1snC0PJRHqeMZaIIGqMRF
	DhAZBmF2FozgR16oEIOpA9wXoqWjlSK4+p1eiY2NZQla73BGm8aiKMKj3pqujOj52RONN
X-Gm-Gg: ASbGncu5co4DsmZ7Fy/8rhqzCZehMoFuROoDpyfLHMPErzit4rdqDo1fqo9gDHvXnK4
	elMbJ1t+eZAGHRNTS5lTIGodcL+jpfYRiQ1KGMw8rdIk8rJXna9rwxIZycO0r6N8xgG0G99i+tl
	UAfESdHqs932KHOqg/O37hIy8WR33qiJx37f20M32OZUaolqLekTYciPvlrENIhvKPGqfUF0tbn
	53J0JGEOSN89sj3oOjLkZonj/NkxRY20tesZx4LKbBa1fRj9rdO8KzvSIPncnymCOD9Bk2a23nG
	eeNOdifDuAtdDmkYrZ704jKkO0l8FAltKuQs814/lKFlLu1St1a7Hexu6Yp4zvwKYRaxtWrJH1h
	2Reqm6R3XTml9E+OarZGFzImgbqIFGza2Q7E=
X-Received: by 2002:a05:620a:4593:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7d43bb920famr497282485a.9.1750940829372;
        Thu, 26 Jun 2025 05:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP9tZg/2hbx2W8BI5QOCq/2uHaNR/sHZ4rDZWc3hvxSUiXPr+NjfiZoQeQMqAZk5rWU6PG6g==
X-Received: by 2002:a05:620a:4593:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7d43bb920famr497275985a.9.1750940828667;
        Thu, 26 Jun 2025 05:27:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f00aa6sm2006921fa.99.2025.06.26.05.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 05:27:07 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:27:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
Message-ID: <bch5jprookxuenjejuwlgvueigaporjgdd7h7ny2a7rb2fnsh5@lateboeubkun>
References: <20250626092952.847393-1-quic_lxu5@quicinc.com>
 <20250626092952.847393-2-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626092952.847393-2-quic_lxu5@quicinc.com>
X-Proofpoint-GUID: t3nR_rWtVNouZI99cPXdy_Q6D6QmNBk9
X-Proofpoint-ORIG-GUID: t3nR_rWtVNouZI99cPXdy_Q6D6QmNBk9
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685d3c9e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=y0QActD64cBbDUrEtRIA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEwNSBTYWx0ZWRfX1UpLrZxnw43f
 PweBcWaXWHB0+3mo/k7oRFVVYJQWnd+KBEUZCblGlZthnJIjIaX1JBe29AVF4MVfcCTgoMU8/fw
 ZLhJej+h946bfHcjsqpeMofYZhds3CJwqshxpAp3x4ZMejuB47jEZogF+Z7J3mBB7b+AfCODYhz
 hTxKfzSSN+JyFZj5DzIB4s/1OjvDhQGOa7Vpalj7yw9o0fa48rfpRmlcmo9GyKevvObJr5gLgCO
 HCkoRk4S8YelExuC/d091UA85rd1CxY/2k/74ANMgyJah7xtdqHGTJfJAfQMq9KtBBHs4TNPmsg
 NLPmAJLjvL1PUvk+cOezc3OShfOQ6b8t+kdTTs0lvPzx4T9FEkXfhMKZVSRJ9xqddHF1gwmF3Y2
 ARdsdHjT58+/5BcnQrDg4lEVzUExd2ZxW+fYTFagNq4kREF4mY73GMaQO63a1sx641gucqxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=573 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260105

On Thu, Jun 26, 2025 at 02:59:51PM +0530, Ling Xu wrote:
> Add reserved memory region and VMIDs for audio PD dynamic loading and
> remote heap memory requirements.

Please specify whether this is required for a standard audio playback /
capture or for some extended usecases.

> 
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

-- 
With best wishes
Dmitry

