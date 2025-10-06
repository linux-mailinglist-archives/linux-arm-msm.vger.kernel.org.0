Return-Path: <linux-arm-msm+bounces-76030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA7ABBD9B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7C453B0994
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A6D2236E3;
	Mon,  6 Oct 2025 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbYuWolJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA79221721
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759745217; cv=none; b=PpkH2fO16nObplCTBl/6D/AmUqQNY7aLvQMdJHnLn4fHLuPEGp7GCnYLvkV2NSakhG+hImu+i9Kwrt30EyorrPoWLhup0WYvYhwHPAaXa0VItPhTKJP03lhmsCF6xY4zz+gVyhR6AR3vfpIqT633JQC9Nfjb5SUrKbDCu/4ti7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759745217; c=relaxed/simple;
	bh=CvVyk63FV1Hh/uDxoHt5oihoELVg2e/crLKj5/XJtR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPu8+JCW06QNCgrROfCB3mvsHeSz3lw67+k6JoNQkKTGsr6Bg4aHkmaHmSWpkEDZoKUhVlwlRDrs6t8KCWbJWYqiMwg6hIugL+V0j5B378JvBfcyV9XSiGNmgmZatAi7I8R+13Ic4tVABHNkhGQb8IKsp3FGzjiwHMQSapixa8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbYuWolJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Nt7P5002759
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HGxB3VffzX2B3tPfiQDIObxF
	W8b4BEQXi9X0DSTOgU0=; b=LbYuWolJXZ4Ea3840k5mXG1qEJ9tIBuApey331ZV
	v82jAjeZc/kdYJEoSAh5qLtrTMNRFa+APHDIvSP5n5GUUYOaKm4c6LMMz5m+auAV
	rHihvfPlyZkShciUFF/GF1Xpen2Am7YoI5vZJ0ekcJDlg/BSDaFG1RHKm6P0fBbT
	aqelUg2VxeRUmrmu73xUYW5taPIgmdUqXr64ylGv4W6e78dk2DmQmM1w1u+BuTpp
	CtrSG9u+kmgI2xBtrI0Qeqjo+eWfuLd2fDAWl3CX2KOSqUd1t8oejrIMTnp69wsM
	nRcOpe5VcL/BBozf3oqgQ/phngsh+0aJX0rj+2l0i3PUUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3s42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:06:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de801c1446so103754041cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759745214; x=1760350014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGxB3VffzX2B3tPfiQDIObxFW8b4BEQXi9X0DSTOgU0=;
        b=MdaJTsvQklSwRn+BMTZktkSuUYWhMEBxkFzeTN42UExg57v49BKTNjPoEmFTHG269A
         ORb8Pdb9ZWFOXbyCDU8iodqHqUyK39h4NeDJm3vTTTS1W0owkzTGTVZWTiqS8Kt6tfgV
         Db0TcNV46Q2vSzb/ytjdENhcgq63FCm4/TpxFkephq/sikjG9npkuNZoHuoGZYi1njFT
         nN1ZsU/j5/07jLMOmF/9CBxjwjZ+ChyU8LJJYrsXAyBCxIFk9jwwpxty5bDMfvwot36M
         o5lF94pe6GbtWK9RlSfpyBW07KwXJpce15f6JXM/nzShOkx7eVcR+zBDXbk3QDJZdQWo
         0+iw==
X-Forwarded-Encrypted: i=1; AJvYcCW+saufvz0olNhDMSQeGKjYluXN3LyY9GwhHHYoa/Qt4CdDoJx3DWW1HK3Kp9SwyEcS68c7EZdihh6n2oA8@vger.kernel.org
X-Gm-Message-State: AOJu0YzSfM+OTFHTyPlMcHE+S9Yxf7xhL2hmO7I05MI3ctu+BJ/GaDc/
	4Xcr1Xq8KqA5+JNAzDz8RFpSCes1ZJa2KeBRxkfAMbbZ4erOYoRi8BIbjhOCrqovXiSabwUlX94
	7SPbFVtX+aI6HYr1pcXmtk86SMDoVO9l/1uaOV27NeWwbRZCxDyIyrTESDlkBA0cSnOHq
X-Gm-Gg: ASbGnculz+AXk0y8fTrAIT1/rkJnYrMv7CljNEEKwxjQ4v48lDg55Yrr094st1NtwhG
	cBCLNn/XdjpIolDD3VJkcAdyLCuHJbPDn1dcLuVI2ozgSx1Yma2ajliZcMttGB8trLG1arJ5XEe
	ADxh4rqahb10dPxOxO3muViacHNZluaFvntEFsOTYz45MkAu1jKuKt14QoUfIENCOyef7LiEJU9
	8ukIrMhCi5d2Dj8wavlVGcoyby9ggm7uEv0NRks81LQvGdWp5yXOnQ4E+xeW4W5tuOW9EQW43r9
	vkeNinZ+TR7Dz/uUAPtffzoz46jDqPknD8ge2nFySRq9KH4ynTmh/6bAoEp10o4A4Sf1KRd4vmT
	JJbqvj7FN8o/W82rvcy28w+5Qwv61VDB1j/IolYSo0EVLo6q6RJrZPa0uTg==
X-Received: by 2002:ac8:5f4d:0:b0:4de:c683:441a with SMTP id d75a77b69052e-4e576b079c0mr176285481cf.58.1759745213368;
        Mon, 06 Oct 2025 03:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8lMXLpbpaW8qgeVwOmhaoJD2KaGNc3MogkehGsf1brzqQQ416JOW9/yzxpzpBq/+gSe98Zg==
X-Received: by 2002:ac8:5f4d:0:b0:4de:c683:441a with SMTP id d75a77b69052e-4e576b079c0mr176284821cf.58.1759745212680;
        Mon, 06 Oct 2025 03:06:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119ee99sm4898508e87.106.2025.10.06.03.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 03:06:51 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:06:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8996: add interconnect paths to
 USB2 controller
Message-ID: <jaepvhr3zwgiaievndntfpcopzinfp3psktd6anl5ovzxl7ekd@enamcy4e6puy>
References: <20251002-fix-msm8996-icc-v1-0-a36a05d1f869@oss.qualcomm.com>
 <20251002-fix-msm8996-icc-v1-2-a36a05d1f869@oss.qualcomm.com>
 <7ef8ba74-4e9e-4b19-998e-40917d997ca8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ef8ba74-4e9e-4b19-998e-40917d997ca8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX6Cz1HPm71avO
 2BUTiBlDcnD+zCsviEBG40k0PLNxWLmTcVs1VirUO+QVEK336Ph2HyEUu3zgcXANpAmQgohIq8I
 KQ6JW4ulCgZcysEizC8b5sQ8WENMF++sJKZNYbXzTNKc2Pq/WR6MoVd1SOy9Y9T/fgzdI/6PruR
 ErZkZriztPiq3XnuHJMziUtOQzD0ruEbVJHQu7PKIlbEVFevp7R6PCKBlN79UOQif8JmTSxQIMf
 Yb6eLKIsWIuFXihFQAZzEOZiwr1AdjU7RyhPicIkB1kWWQQz1OOxSR/vV/qpR4VGTiniFXIK5Sj
 +YKnYWgPJYy8RhLyVn9rlaZTJjbyRHGUyvjIVdYbXThXlwZY9Hjlg3DqtevC09GWUx1PsSvV2VI
 OCc/YUezl2wJz9NWg0mw9KjASmh3gQ==
X-Proofpoint-GUID: 8eRRNdeBGpcZRZ_YxAWe7TaddoTVE-N3
X-Proofpoint-ORIG-GUID: 8eRRNdeBGpcZRZ_YxAWe7TaddoTVE-N3
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e394be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nBxtwQxsS3NGOZXr17YA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On Mon, Oct 06, 2025 at 11:30:52AM +0200, Konrad Dybcio wrote:
> On 10/2/25 10:53 AM, Dmitry Baryshkov wrote:
> > Add the missing interconnects to the USB2 host. The Fixes tag points to
> > the commit which broke probing of the USB host on that platform.
> > 
> > Fixes: 130733a10079 ("interconnect: qcom: msm8996: Promote to core_initcall")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > ---
> > Note: without the previous patch applying this one can result in the
> > kernel stuck at booting because of the EPROBE_DEFER loop. I suggest
> > applying them through the same tree in order to make sure that the tree
> > is not broken (or using an immutable tag for the icc commit).
> > ---
> 
> There seems to be syntax for this, at least for stable patches
> (which we should probably either use or add +noautosel):

This syntax is for stable trees. At this point I'm more worried about
those patches being picked up correctly. If the patches are picked up in
a correct order, they can be a subject to autosel (provided that it
maintains the order).

> 
> * Specify any additional patch prerequisites for cherry picking::
> 
>     xCxc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
>     xCxc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
>     xCxc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
>     xCxc: <stable@vger.kernel.org> # 3.3.x
>     xSxixgxxnxexd-oxfxf-xbxy: Ingo Molnar <mingo@elte.hu>
> 
> (deliberatelly added a bunch of 'x'-es to not interrupt the maintainers'
> b4 workflow)
> 
> (via https://www.kernel.org/doc/Documentation/process/stable-kernel-rules.rst)
> 
> Konrad

-- 
With best wishes
Dmitry

