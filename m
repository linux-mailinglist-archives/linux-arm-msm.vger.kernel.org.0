Return-Path: <linux-arm-msm+bounces-60026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BBAACA95B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 08:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8E5017BEB7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 06:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEF31865E3;
	Mon,  2 Jun 2025 06:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XraCxOmu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4481C2D7BF
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 06:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844967; cv=none; b=C/ouOCNz4cOf0eU0uBLxiOAiUjsmL24ACBz0tZLmAqDx2z1C7VKAFCr/vJO2h6Mp4EL5EgRZAv//fwOvv955IPqzxDDiEbqN0ElqP4Rn+A8JG/c2QwPctEaNKPObEuv4l+4bkGEtwwRD3ICXBaByY6okcmSKKAOw64XKTAULOwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844967; c=relaxed/simple;
	bh=MgYGJjcaOy3g9B8ansHeoP+Sr4Le37ZDce4ZltXmBE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQkrbx0NdUF/x1HsVcF5a2Z0AA4wrUUstE+QuYgttl3Orbd5W0lq/srix2rZqq3ZS/lW3QONWwFouBNyctsc7bAO2/iOFLzO4/oAhozoRmElkeMcs6oQ8YFtlGCFVx6ewSmhAbW7/N9OoY7SAzscv145/OHkQy5AXhiwNx/zqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XraCxOmu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551NFvKU011936
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Jun 2025 06:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L/r1Qv5RI/jsPHsDGhlVxJ4P
	JGcaISPdQThlQ7RaoCA=; b=XraCxOmuQkm3GjU7crMKmoD2Vi5RRyMYOveQjFAm
	06stOP+tXqrduiiGjySgicTqvRcLkOWJVi9zU72Rw+QHC5LD436OXORNgJ467KqX
	t5aocx0CUjoCV1JS2hbB601bL7iWsyZD3GT1PTvMpA5Uxy1sXbqvp7wLAi9YWhfz
	b7oX5sYbRJFyDLrn4c04K+pCdZk7M5fbDDEw7sf8F+spupZPFEOt8d0Gh2g9+Tdi
	CKiFYy7OFXFesIeoIdg7G92LRtxt9Vs85WeWRHz/uf7UHy0t/GcmpxSdY7OLdTsz
	e0V1xPITXFiinZyOxJuVBT9+l6Z91SAEN+P68lsj22B2ew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytxm3ha1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 06:16:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee988153so701768985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 23:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844964; x=1749449764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/r1Qv5RI/jsPHsDGhlVxJ4PJGcaISPdQThlQ7RaoCA=;
        b=S3Q8qsfp9a3OVxP9rR9WLUAGcGFG2GJrQyf7UyOCkJIKBzVQcNPTeO58BCGfuZK50C
         7dV2w5n5bRtdss30gV5b7udnvPvBNxJyYuXzkGfxVLTTvndFRMreUynIRwWEz6TFlRi4
         hZ6YK4pJ53yAIzbWM+s6KOsyVdpNCkdNBe3KfZLQl5LmlP2qTrz34ZC2ALFDw6vttPRg
         VxoIIE06Jq2kzMz/xwv2YUWCEO7c5ZrVgHMlsmDJc4f1c0HHIs1L1qflZd7PuaAxhE/U
         xTzxaDAWmTkWcwYMctpvRNenO6E5w7nJmxWwUNzEN6uZU8Pe0NuuWHmklUfb2vp5Y1mJ
         znmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOlC3vUSlR8OPfFBO5JB/y0u0U0/RQelko0uAeFGmEbM5UEp1vHGLc+WO6F1u9WH/CsbQaWGYXi1zaArkN@vger.kernel.org
X-Gm-Message-State: AOJu0YyUSpsxodwPTFOCAvhSxChqYXy5Jc10QP2yetuppgmjXF1F70ug
	++hvp9FfAWe6qomdFFQeQxc4kMygzgw8bAefwCA1MJzfNAIAmR/zOLGv2pxW2SSUmoOYocoJw9+
	3sMB1PWSpUETNUMo1GdFzYSCHsSYRfkkYOBF+Gn4njcBPaeDynh2DE6sgkb9Sw47QnYmB
X-Gm-Gg: ASbGnctFs77RncIZk4ocrRny46ZHv5788+fN+nvOKc3rBtFrYzRjI6PAOCRoS4BXzYE
	aJihpskrek/2S9iHu3swtPlnRBiONLPOttkevVXLRe+erTnatZPa4vPUsvL2kk7Z1qW+Px11Pyx
	OlxPa/DloY75C6z2qInysv3Wz8ZQzGAj9ftOrKsSFu5VcpfFgAJxBIYwAJ7bS+JdZ6kCO13ad6t
	AN5ZA40BLM16HWkrCCF1WXR1W24JXWF9eRKs+7pJVR2DuDwdm5HjuJI0oTOUQbvkGTZF3dTY5Tz
	duDfTDVGeAqLu0pN8CocajAxrLbISWzPe7uRhteZCswdMyGrDbztTEUYr7Jros2w13rPQRJOB9A
	=
X-Received: by 2002:a05:620a:28c8:b0:7c7:a184:7cb1 with SMTP id af79cd13be357-7d0a1fa53e4mr1883017285a.9.1748844964001;
        Sun, 01 Jun 2025 23:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ1bSQahLqe557WjaS0ITXAp9SVSOpdyV0vMovbwK20i8iAjbOrnNSBp++Bxin6ICbH3T2aQ==
X-Received: by 2002:a05:620a:28c8:b0:7c7:a184:7cb1 with SMTP id af79cd13be357-7d0a1fa53e4mr1883014485a.9.1748844963605;
        Sun, 01 Jun 2025 23:16:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b1b549sm14081971fa.10.2025.06.01.23.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:16:02 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:16:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
Message-ID: <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
X-Proofpoint-GUID: mv2D6flCX8oHWsoomif4SYthigTdH_tb
X-Proofpoint-ORIG-GUID: mv2D6flCX8oHWsoomif4SYthigTdH_tb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1MiBTYWx0ZWRfX5oW75x5oWAnp
 dzz3CmthDVqMUCvOhdG3LgAWQfoWCuvGysOZj8QpNM1wl2/YiyDrTcEE4yV/xeS+rbJ0VfrwW5a
 ZUOFVxB4qItpTyoeP6n+spTKd/Xml4NubeTRRtUSnUXdtnS8s+pK5D9qodwI4c+g6OCSkAyF0aN
 y+OcNdSmuFBAwpaMsMdiy7iSfpkbs9MBLurNqlPd5HpaRty05/VbV9PsQrT97G0NoNjjr8xVZJg
 Y/la3Pe4Ql9Ffx4rbA32OLSwpmaP0dIPs8lIeaKHg37y1fG+grjFxVAIMRa2+FgBqKOsKDlbXjD
 rfg8hN+DTnDhmhwBKePdlgp3nImpl5nPJ3zbhk4B9RYdEF5JalPpKZ+a4c+DhMAaqs2pWDaAe1l
 3juzh8WAbom9gipeHJPApayRvmAiTNNzQ5puWbGxFwNxmrGJ9yCMwuIZd4Tt+JvVD1qCZOSh
X-Authority-Analysis: v=2.4 cv=XdKJzJ55 c=1 sm=1 tr=0 ts=683d41a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=811R0v4fTQpBtjd_nOcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=528 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020052

On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
> 
> On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
> > On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
> > > QCS615 uses the same video core as SC7180, so reuse the same resource
> > > data of SC7180 for QCS615 to enable video functionality.
> > > 
> > > There are no resources for the video-decoder and video-encoder nodes
> > > in the device tree, so remove these two nodes from the device tree. In
> > > addition, to ensure that the video codec functions properly, use [3]
> > > to add encoder and decoder node entries in the venus driver.
> > > 
> > > Validated this series on QCS615 and SC7180.
> > > 
> > > Note:
> > > This series consist of DT patches and a venus driver patch. The patch
> > > 1/3, which is venus driver patch, can be picked independently without
> > > having any functional dependency. But patch 2/3 & patch 3/3, which are
> > > DT patches, still depend on [1].
> > I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
> > on QCS615 over(?)clocked.
> Agree, so we need to make sure that the driver patch is not picked after the
> DT patch.

Worse: we need to make sure that the driver patch is present in the
branch which picks up DT patches. Otherwise building & testing that
branch (which is not unfrequent when doing git bisect) will fail.

The easiest way to ensure that is to merge driver changes in v6.N and
then DT changes in v6.N+1.

-- 
With best wishes
Dmitry

