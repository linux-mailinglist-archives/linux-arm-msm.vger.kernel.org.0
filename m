Return-Path: <linux-arm-msm+bounces-68725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A757B22397
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD0BF7A7357
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 09:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0352E4248;
	Tue, 12 Aug 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLhZToN+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC12E9726
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754991868; cv=none; b=JLnv7mdDWDN4fhmwoFd67iYHCQvBhPGO9pRZ6mCzXZsqk1ULYZS/60dCU82tmlva7D5B9guegWDHNGUKBUnm7CUWaHrDoM3Ki9V6x9BRgWTh5aYEB6qeWtfVM2f4+jHt/3dkeXCBB3EZaK5CO+XZPcSO5nn/v823cnqbDJvM5o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754991868; c=relaxed/simple;
	bh=NsDGUZqdxL4NnUZEx9v/dqkyeE0qj80lpP6HtlabIcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppJ664P7tKgLaqJ3SME/Cm3w7VGDhz/65liNHGSBi1fhllC4zuwoqU/HrlSHuc2UvQiiAdFSFol32uDIWJrlHDPf5FZb47dCw37tPKjtdYUpiZfR9EntNhyzJsVVzhk9G6AFGYfFEvrke1tukptn9H8YmagI4wbJ371cg7VfhCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLhZToN+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C734xK007704
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVjk2bmpZceirDyJ5lxPbhkNfa1iK7XMzWGsFKMIYyI=; b=dLhZToN+ZMidVA/h
	gBMZDgcc2b7zbnX0BAbXgnMiQupk9yUh/7UiN422qSlI50qcnhhcVdU2TT7xFp1S
	2hgi4RJJHnBkhukUQDCdOcBnkuWXhdY+ikpsd79SeyzG11rY6O+N4un+HCvLtZBD
	Tr2nd7uvjoQdfm9NHdVqVu+PgpPpx1taRB/fkmwevmkDmBbs0XEy82lIlJTYwZA+
	jFEZBM6L+vvSPesOayKFU5ilMusBe6vIAsizZxbLvPNAEnBJI469vURZUCMR3xl1
	wL2ivSfukJ1ve6c0jrzusBxhe9l0aLDLBs82vBgZGaTjypC2jSvP9DslkazCrru6
	Gq+i1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjkf81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:44:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70941c8a17aso14843536d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 02:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754991864; x=1755596664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVjk2bmpZceirDyJ5lxPbhkNfa1iK7XMzWGsFKMIYyI=;
        b=R9PFcgs9GNqmMVoF9KuPjMEER8fraXTx1R0+VM4Ud19dSt4meqlLBnLAamiXk1ztc0
         FvM3V7khRKny0zuF3H8DmIYaBmYSxQv7NDZXzXRyCoM4xt8LDX2Klla9g4nyCYjxJXQc
         sN6eXV5wIfOffS7iWA3ozvymuCjFzDI9O/nkHvSkzw6KefoGRULJaOQnsyDhbHqWwSzJ
         FvA31rrPHgvrzrXlbmCXVGxvh2Uly9I+ip5Big4dzjVYnhdgelDr5Tq6VxSunvzcBRXs
         9bvrFM2iWPsvSoRkumwjzdu/KtnjjjcYXptqaIJFndrTqGthUZEAk3Shu0kbYaBGMKvK
         eANQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgOa9kjZpfDOaBWrzT9BYcTXgImYGzzDaGhEbBVJcuWVp5bEUIzI+ktf+jFZUGgrmeB8tkVb1QrhFT4n5z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+QtaSSyueAmlYnrvcF6VkPBiGhsjhaCsEmXULtHjdNO+o+w4e
	MP1Eo59zzntYLBgTDoGJq0th0KNT+VqOXwCmTgC8zmgcHM9QfBUqpW6HWojzoGYwEvpY/bhcRqZ
	IRJcpCTGcwIpiJ15/SvCSoDN60RVnMsMjGNQw2HjGrsm4fujYhOnWhkWHsUWvA0Kj42Di
X-Gm-Gg: ASbGnctC/bXFndS7CI0nlJSA/IkTP0YbCcEucV1PBnoFh/OxBGW3yo1joPXyThJmy9Z
	QpqKhA6oeBleeIItwp6COB1iZerSezKWZgmv+WV90rVPtSV1cyB6S3aLdbp8bW1DWD5tNSXew8t
	t0r4XeG80EawZ1g5tUh4Z+ofXZ9ax0FJby/2v7UBfBie0KwAgFO1SwWKwSUULw5CpHiTmyU2oQ1
	NXJsEux47zRG9uMBB/Om2/UDhNPRZH+s3PpLWJDPJ57F4HL3SNbtFAHosfG9u1YcCPX/bTWow2I
	q8QB4fiyJg+aZsmL6VChnS5fMj4o8WmReQGLT0icrc8vSuP+8ilDY/j4SsawAFsXy0Hqn0TmNt6
	9JLoR37X6HUl8EVYQfw==
X-Received: by 2002:a05:6214:dc6:b0:707:48a3:f833 with SMTP id 6a1803df08f44-709e223c2b7mr2670186d6.1.1754991864670;
        Tue, 12 Aug 2025 02:44:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqy9dVMC9gipxsspsY3jwJKyi3zLMV0FmTDf11Oprz2Uiwnp4y7BuUhf8pqW1skK9briuFUg==
X-Received: by 2002:a05:6214:dc6:b0:707:48a3:f833 with SMTP id 6a1803df08f44-709e223c2b7mr2669976d6.1.1754991864055;
        Tue, 12 Aug 2025 02:44:24 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a9113e40sm19914549a12.57.2025.08.12.02.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:44:23 -0700 (PDT)
Message-ID: <c3d192d4-934b-4fe3-9b1a-8405cddbc668@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:44:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: fix override
 properties
To: Pengyu Luo <mitltlatltl@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250812093957.32235-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812093957.32235-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX3bL9f2EyIuZC
 vJaw1vw/WoxaFaBBOPbnMR2DOC2HFtHzvscXuAhLg4U8Axkrd7Wqugv5Kr6eXh9y4LaOsgbcq15
 nBSB6t7RXzcHnnjfh7mg3Z9WVmZ2rZfgQDiTNY4h+IwB3lFPy+zuOGidR3kMN+iEMt6UExA5wc/
 5/1jrPt26zfAJm3TO2TFwC/9/P3BC5X0aeUrUzHAm8VTglp0vhpOEXUXSTnHyhVUyEY2cPyOaw2
 +dHieEHV1XqeuhwRlA1Jn69ttqksEmuOfVG+mVcEnfLBzrnywMti7VWWoLX+E/5675rO6J7bTCC
 tyY5MpyvWuMQz6cPRZ9xRMkHF/uG726q3kEvP1EXpq1mVOhLCzseJvtVSS1jsj5jk2LI6hCOCXL
 J+Wx3xM1
X-Proofpoint-GUID: u_vzcArmwfjLH9frRtrAxHS6pwXoaHfy
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689b0cf9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=v5-_rWYg7EQBkViMn-cA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: u_vzcArmwfjLH9frRtrAxHS6pwXoaHfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

On 8/12/25 11:39 AM, Pengyu Luo wrote:
> property "qcom,tune-usb2-preem" is for EUSB2_TUNE_USB2_PREEM
> property "qcom,tune-usb2-amplitude" is for EUSB2_TUNE_IUSB2
> 
> The downstream correspondence is as follows:
> EUSB2_TUNE_USB2_PREEM: Tx pre-emphasis tuning
> EUSB2_TUNE_IUSB2: HS trasmit amplitude
> EUSB2_TUNE_SQUELCH_U: Squelch detection threshold
> EUSB2_TUNE_HSDISC: HS disconnect threshold
> EUSB2_TUNE_EUSB_SLEW: slew rate

The commit message is a bit.. dry.. but I suppose it conveys what
the problem is
> 
> Fixes: 31bc94de7602 ("phy: qualcomm: phy-qcom-eusb2-repeater: Don't zero-out registers")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


